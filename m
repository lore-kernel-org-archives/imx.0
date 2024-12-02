Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8481FCF57
	for <imx@lists.linux.dev>; Mon,  2 Dec 2024 11:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733138558; cv=none; b=VM5sRU3UGgZUB/yio56V3wHEJfsiKKfy7bMsmmCKS7RTSpXc5vhecO8iHCSW3fsCkMeK078sbe/n4EWlArCIwnrwD1UecCKIZYsk9xeFEDfYJJMqAdYWLO0kSrlP+ZZ05aiTiaH2mtRZpjrSwxvGmnHkoSI6HpKHwM5zmtxVmdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733138558; c=relaxed/simple;
	bh=eaBnFcHNZLo3OeuGzxtNatkXfWA3lsNPb5dGh4kb3Fc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ulgG3ygazXkL6ocOErGEAIlUd4GGv1UDaNb/8UU0D/xf4N8UKu5mwyhZLeNznrN9U3DvFQULjlUHoSA2fCqtVT6dw7amOwH0XHFfLxAjPx6CemzBWDB1CT89pY96TbcBxBwbEtZiXsMezpWmMu6ajGxc7Lo5N/oCZD8JJEud95Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1tI4Ve-0000UF-EB; Mon, 02 Dec 2024 12:22:34 +0100
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1tI4Vc-001Hsz-3C;
	Mon, 02 Dec 2024 12:22:33 +0100
Received: from localhost ([::1] helo=dude02.red.stw.pengutronix.de)
	by dude02.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <s.hauer@pengutronix.de>)
	id 1tI4Vd-003R1L-2D;
	Mon, 02 Dec 2024 12:22:33 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Mon, 02 Dec 2024 12:22:31 +0100
Subject: [PATCH v2 3/4] nvmem: imx-ocotp-ele: fix MAC address byte order
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-imx-ele-ocotp-fixes-v2-3-3c021a97eb5d@pengutronix.de>
References: <20241202-imx-ele-ocotp-fixes-v2-0-3c021a97eb5d@pengutronix.de>
In-Reply-To: <20241202-imx-ele-ocotp-fixes-v2-0-3c021a97eb5d@pengutronix.de>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Peng Fan <peng.fan@nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 stable <stable@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733138553; l=2189;
 i=s.hauer@pengutronix.de; s=20230412; h=from:subject:message-id;
 bh=eaBnFcHNZLo3OeuGzxtNatkXfWA3lsNPb5dGh4kb3Fc=;
 b=W/yT87H/XRX9oubpp58Qy5bS2gg+BLJHfgTGsFRdR9Vk9Cre3kXLF78gBOhfKvktkwsyJivV8
 DiGmIWGLJC8Dv0VjP/95hc0qzyw3MQJymEXnTmYoKUS8SQAxEDRCPUI
X-Developer-Key: i=s.hauer@pengutronix.de; a=ed25519;
 pk=4kuc9ocmECiBJKWxYgqyhtZOHj5AWi7+d0n/UjhkwTg=
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.hauer@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

According to the i.MX93 Fusemap the two MAC addresses are stored in
words 315 to 317 like this:

315	MAC1_ADDR_31_0[31:0]
316	MAC1_ADDR_47_32[47:32]
	MAC2_ADDR_15_0[15:0]
317	MAC2_ADDR_47_16[31:0]

This means the MAC addresses are stored in reverse byte order. We have
to swap the bytes before passing them to the upper layers. The storage
format is consistent to the one used on i.MX6 using imx-ocotp driver
which does the same byte swapping as introduced here.

With this patch the MAC address on my i.MX93 TQ board correctly reads as
00:d0:93:6b:27:b8 instead of b8:27:6b:93:d0:00.

Fixes: 22e9e6fcfb504 ("nvmem: imx: support i.MX93 OCOTP")
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Cc: stable <stable@kernel.org>
---
 drivers/nvmem/imx-ocotp-ele.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index b2d21a5f77bc1..422a6d53b10ef 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -111,6 +111,26 @@ static int imx_ocotp_reg_read(void *context, unsigned int offset, void *val, siz
 	return 0;
 };
 
+static int imx_ocotp_cell_pp(void *context, const char *id, int index,
+			     unsigned int offset, void *data, size_t bytes)
+{
+	u8 *buf = data;
+	int i;
+
+	/* Deal with some post processing of nvmem cell data */
+	if (id && !strcmp(id, "mac-address"))
+		for (i = 0; i < bytes / 2; i++)
+			swap(buf[i], buf[bytes - i - 1]);
+
+	return 0;
+}
+
+static void imx_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
+					 struct nvmem_cell_info *cell)
+{
+	cell->read_post_process = imx_ocotp_cell_pp;
+}
+
 static int imx_ele_ocotp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -137,6 +157,8 @@ static int imx_ele_ocotp_probe(struct platform_device *pdev)
 	priv->config.stride = 1;
 	priv->config.priv = priv;
 	priv->config.read_only = true;
+	priv->config.add_legacy_fixed_of_cells = true;
+	priv->config.fixup_dt_cell_info = imx_ocotp_fixup_dt_cell_info;
 	mutex_init(&priv->lock);
 
 	nvmem = devm_nvmem_register(dev, &priv->config);

-- 
2.39.5

