Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C281DA3D
	for <imx@lists.linux.dev>; Thu, 28 Aug 2025 13:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756389524; cv=none; b=qxl2QAvdo6byaLfNHjcg5HhMGpjRd6HEh6LIPNVA+Zm6cJ7Ldn/FGBqtWPIWh7z+D6mtAmC5Nuuk18HN93UlImqUEF9wpxkKDmvpdKMZgUu5ufDDKqZpqKerwQOBe7e9sq4Ixb6ocbySDfafpK/RBCeUyLNdmkW17oC3FWmNcb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756389524; c=relaxed/simple;
	bh=h0pnYiLpVOm9ScPXci3LHPTFEOcR0Th23+I4oCnDGo8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CsG4AKQrtTtvm32EYCYZLYZSohHfBx/TXawrdDfNwLhyHmnRl0smFhp9N6if/osoZXaZEJNQlmGWuoee2bUqssn87Tigmrd/ru8kEQkneiFI3kXjaCjYVouiPL4MACWMiVmUptSGx3IB5eaiH5/UOa+ICExyNe8N07Um1JY5OAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 96DED1F00047
	for <imx@lists.linux.dev>; Thu, 28 Aug 2025 13:58:39 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id DEECCB02233; Thu, 28 Aug 2025 13:58:38 +0000 (UTC)
X-Spam-Level: *
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 1B81BB02226;
	Thu, 28 Aug 2025 13:58:21 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH] media: verisilicon: imx8m: Use the default Hantro G1 irq handler
Date: Thu, 28 Aug 2025 15:58:20 +0200
Message-ID: <20250828135820.1859316-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing imx8m_vpu_g1_irq implementation is an exact copy of the
default hantro_g1_irq one. Switch over to it instead of keeping a
duplicated implementation.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../media/platform/verisilicon/imx8m_vpu_hw.c | 20 +------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
index 35799da534ed..f9f276385c11 100644
--- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
@@ -234,24 +234,6 @@ static const struct hantro_fmt imx8m_vpu_g2_dec_fmts[] = {
 	},
 };
 
-static irqreturn_t imx8m_vpu_g1_irq(int irq, void *dev_id)
-{
-	struct hantro_dev *vpu = dev_id;
-	enum vb2_buffer_state state;
-	u32 status;
-
-	status = vdpu_read(vpu, G1_REG_INTERRUPT);
-	state = (status & G1_REG_INTERRUPT_DEC_RDY_INT) ?
-		 VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
-
-	vdpu_write(vpu, 0, G1_REG_INTERRUPT);
-	vdpu_write(vpu, G1_REG_CONFIG_DEC_CLK_GATE_E, G1_REG_CONFIG);
-
-	hantro_irq_done(vpu, state);
-
-	return IRQ_HANDLED;
-}
-
 static int imx8mq_vpu_hw_init(struct hantro_dev *vpu)
 {
 	vpu->ctrl_base = vpu->reg_bases[vpu->variant->num_regs - 1];
@@ -328,7 +310,7 @@ static const struct hantro_codec_ops imx8mq_vpu_g2_codec_ops[] = {
  */
 
 static const struct hantro_irq imx8mq_irqs[] = {
-	{ "g1", imx8m_vpu_g1_irq },
+	{ "g1", hantro_g1_irq },
 };
 
 static const struct hantro_irq imx8mq_g2_irqs[] = {
-- 
2.50.1

