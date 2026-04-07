Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3B03B38BF
	for <imx@lists.linux.dev>; Tue,  7 Apr 2026 12:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775564691; cv=none; b=N44JkEHJAw8om7Mli6NURItsNAV106SdTTbYn9NExWtyxY9Tic+rav5gSCsDdtfUyrDVghydR1euwZKfPYkoU18VUxHCZIJpKeadMzas6krJgeDmQO7EE1usy23fB0r0VRv/jEDI4xM5VMtuRd+5B5QMJ/UVPsz6+OWCcswA3GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775564691; c=relaxed/simple;
	bh=xCyOeEb1Rt3PAU0y1z2oi9zSYVPFWqIkwkXXe5MYVu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N+dIjaMOhThsQoEDP15kTZuTw6sssjXn6RBsF7gRglyznCHsdunpty5Hvo2mmi8c2huRNLyvKtVgJBX95eaDkM0aW5HQfOuwzps8ETRTPllsMcqZg4xkP8ktlhXjBEJ0aUu9GXwumm58g+FYcYN71KTz/zRPjRiDfJx+1MovH2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CnXexU4t; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CnXexU4t"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 00CF44E4294D;
	Tue,  7 Apr 2026 12:24:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BF0D8603C7;
	Tue,  7 Apr 2026 12:24:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 092A1104500ED;
	Tue,  7 Apr 2026 14:24:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775564685; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ivxqBE+xFSPsodl278KAuSqCfPXljKrE3bnno2mTk08=;
	b=CnXexU4tEXTMs3uXlsG7FkcOVO75Pe0LOPPslUOFrwUH3Wub0BvslLwpqgvNwpY2QrKE81
	MV8aBl49PsOOfMG6tvw73K2vjyBwryKXZR70SOYc9Ng4y8baWsBM7bsXouxnIYvckdXtA1
	xql0xNoJLgCw7UwrwPmqR04LfjbH8sv0s61MryFJ6/YPA+AbJY4oQKgs7ca+Nlkxs1H9s2
	Nvtjd6/NGc1KpKBZHyqrDLRkiuJVdHpuPESUGYVHQvDT/QYl/ppErH0E29zonlJlq3XL8A
	/7+Yoie1zqYGYtDSgT/AardFpdUDnUdVTi/4IudYIIwapczwRfsrLPJHvy+t4A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 07 Apr 2026 14:24:15 +0200
Subject: [PATCH v4 01/11] drm/mxsfb/lcdif: simplify remote pointer
 management using __free
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-drm-lcdif-dbanc-v4-1-247a16e61ef9@bootlin.com>
References: <20260407-drm-lcdif-dbanc-v4-0-247a16e61ef9@bootlin.com>
In-Reply-To: <20260407-drm-lcdif-dbanc-v4-0-247a16e61ef9@bootlin.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Liu Ying <victor.liu@nxp.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>
Cc: Damon Ding <damon.ding@rock-chips.com>, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Adam Ford <aford173@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Christopher Obbard <christopher.obbard@linaro.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Fabio Estevam <festevam@denx.de>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Gilles Talis <gilles.talis@gmail.com>, 
 =?utf-8?q?Goran_Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>, 
 Heiko Schocher <hs@denx.de>, Josua Mayer <josua@solid-run.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Marco Felsch <m.felsch@pengutronix.de>, 
 Martyn Welch <martyn.welch@collabora.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, 
 Richard Hu <richard.hu@technexion.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Stefan Eichenberger <stefan.eichenberger@toradex.com>, 
 Vitor Soares <vitor.soares@toradex.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3

Putting the remote device_node reference requires a of_node_put(remote) in
two places. Use a cleanup action to simplify the code.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Tested-by: Martyn Welch <martyn.welch@collabora.com>
Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa8MPxL/MBa8MPxL
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v2:
- Use the correct cleanup action
- Fix commit message
- add missing cleanup.h include
---
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index 47da1d9336b9..7719629487da 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -5,6 +5,7 @@
  * This code is based on drivers/gpu/drm/mxsfb/mxsfb*
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
@@ -53,16 +54,13 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 	int ret;
 
 	for_each_endpoint_of_node(dev->of_node, ep) {
-		struct device_node *remote;
+		struct device_node *remote __free(device_node) =
+			of_graph_get_remote_port_parent(ep);
 		struct of_endpoint of_ep;
 		struct drm_encoder *encoder;
 
-		remote = of_graph_get_remote_port_parent(ep);
-		if (!of_device_is_available(remote)) {
-			of_node_put(remote);
+		if (!of_device_is_available(remote))
 			continue;
-		}
-		of_node_put(remote);
 
 		ret = of_graph_parse_endpoint(ep, &of_ep);
 		if (ret < 0) {

-- 
2.53.0

