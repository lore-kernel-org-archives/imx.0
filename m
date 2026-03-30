Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF25139099F
	for <imx@lists.linux.dev>; Mon, 30 Mar 2026 22:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774910882; cv=none; b=f0fmriliVlekvCh/ysoIxMS4kVsxyOYoKY2fpEy8JHZx/9lCFDan6v8ODy4D9y+rnOMJw4efZvViobwnZUgftcKhg7Qplifn6Iep3U9dcQTQnJmmMTtYV4+xUOArOQp1kxUfhGG3JoWR94gqg70KognhZPsIPgd3aMtwTN6Oc9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774910882; c=relaxed/simple;
	bh=hz0htauuD8FNqdD/H+U8M595BtTnNOmnL+xsAPVuvlw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QtfZxv9wBSAM+Vi8OZI1z8YfoLlmm9D9yGp88ea0pRk3Srr8G8n3XiwnduvXvdplAP2rJOeFVB1zP+oivMDR933+KMy7igNg4A9a7vF7OQWSGjnjnn/Ez87cB5FaTfPvKYKsPdMVsPlrTbXvEez/GnbiOWtYs1jGxxU1mBR8Jrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id C85A71F80041
	for <imx@lists.linux.dev>; Mon, 30 Mar 2026 22:47:57 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id CCCA8B2EBCB; Mon, 30 Mar 2026 22:47:56 +0000 (UTC)
X-Spam-Level: *
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 81F1CB2EBC3;
	Mon, 30 Mar 2026 22:46:31 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	=?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Liu Ying <victor.liu@nxp.com>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 1/3] drm: lcdif: Set undocumented bit to clear FIFO at vsync
Date: Tue, 31 Mar 2026 00:46:17 +0200
Message-ID: <20260330224619.2620782-2-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330224619.2620782-1-paulk@sys-base.io>
References: <20260330224619.2620782-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is an undocumented bit used in the NXP BSP to clear the FIFO
systematically at vsync. In normal operation, the FIFO should already
be empty but it doesn't hurt to add it as an extra safety measure.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c  | 3 ++-
 drivers/gpu/drm/mxsfb/lcdif_regs.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index ef3250a5c54f..a00c4f6d63f4 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -338,7 +338,8 @@ static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32 bus_flags)
 	 * Downstream set it to 256B burst size to improve the memory
 	 * efficiency so set it here too.
 	 */
-	ctrl = CTRLDESCL0_3_P_SIZE(2) | CTRLDESCL0_3_T_SIZE(2) |
+	ctrl = CTRLDESCL0_3_STATE_CLEAR_VSYNC |
+	       CTRLDESCL0_3_P_SIZE(2) | CTRLDESCL0_3_T_SIZE(2) |
 	       CTRLDESCL0_3_PITCH(lcdif->crtc.primary->state->fb->pitches[0]);
 	writel(ctrl, lcdif->base + LCDC_V8_CTRLDESCL0_3);
 }
diff --git a/drivers/gpu/drm/mxsfb/lcdif_regs.h b/drivers/gpu/drm/mxsfb/lcdif_regs.h
index c55dfb236c1d..17882c593d27 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_regs.h
+++ b/drivers/gpu/drm/mxsfb/lcdif_regs.h
@@ -190,6 +190,7 @@
 #define CTRLDESCL0_1_WIDTH(n)		((n) & 0xffff)
 #define CTRLDESCL0_1_WIDTH_MASK		GENMASK(15, 0)
 
+#define CTRLDESCL0_3_STATE_CLEAR_VSYNC	BIT(23)
 #define CTRLDESCL0_3_P_SIZE(n)		(((n) << 20) & CTRLDESCL0_3_P_SIZE_MASK)
 #define CTRLDESCL0_3_P_SIZE_MASK	GENMASK(22, 20)
 #define CTRLDESCL0_3_T_SIZE(n)		(((n) << 16) & CTRLDESCL0_3_T_SIZE_MASK)
-- 
2.53.0

