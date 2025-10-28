Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE1F32BF48
	for <imx@lists.linux.dev>; Tue, 28 Oct 2025 12:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761653596; cv=pass; b=OLiQzUyGbgP84BsU+vY1OKG1qglgAv39rFstuWR2BPAW8n0elxJXzUPtHxEtfspmV6NnLHiJyoG70OvL7LI4OIA9sypKtAb9mGy+96/YgfWfBl8lW1mNJdvu82h0tm6IynUCtdUS6cXJbsKzCskVEiCBGbvsg+XJrUoA87NeMqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761653596; c=relaxed/simple;
	bh=LPNuOvV5GIfBMgx0l/rLWwK1QWOgIasJTyq4uGGl3as=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WML31sCCSVCbYYs4XjeaOUyDu7GwlkpTs+nr/mUslg+V4HEF6p+lN36yfJbc5+BG6ZuxQoeNhF/qJm3vcgfTGdC2a/v53iQcMIlSiK8PiXk0oa0yKcip4aKBqaM1CpLBYpqVhEK2mWPeK4QCj6QnsxDobQUbEJSGDDOCeTntd9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=dsWwi2F/; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=OUONIk+t; arc=pass smtp.client-ip=185.56.87.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="dsWwi2F/";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="OUONIk+t"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-hbks.prod.antispam.mailspamprotection.com; s=arckey; t=1761653594;
	 b=T3bmXWgqzVVqfd8F9xPRPYvPZxk9/Cdwqik5y/JoqtqKGz9wYHUfjGl4Eap/9GsiRGAehyPQZY
	  Qc/Fsg2kyLWpzZXBVtF5sUsAkhqH7YXlA3lqM0hiB/aAPssQ6tZS3Cecqx36StbaI3FhumLHRt
	  NNvRFPPRnALQpE7crG31kDPHTgzUryyqqrrwSrL8p7BstSxMb0nh6cJApFcYy5vL0162lkF8nS
	  A6MqSL5r0+f/LEd+bwAVVmloidZRohID1WZyShjDMVf8oG9/ttVduza8N+IdTY1pnQQ6PHi/9V
	  GSV1DIXkgPBt9iHZm5YMgjC954ANK1folmTtKHcN6b5gCA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-hbks.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-hbks.prod.antispam.mailspamprotection.com; s=arckey; t=1761653594;
	bh=LPNuOvV5GIfBMgx0l/rLWwK1QWOgIasJTyq4uGGl3as=;
	h=Cc:To:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:
	  Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=as/3D7M+ltBqoj2sC8zRbF/8PKd6k1gnwW9H816iZ1x+VYZu/bcfEyGBrzjTs7I6PjkcQwGX++
	  Bmb+UWZETps5vTfJW6df/stgFRjOCZvwVexaD8R+ANebMpCgDCyzpT+31GAdwXB+7jY8uB4b/5
	  GZzJ0MNXq66oU78EwH/0UxEs8XaOC1chb3tDcOHNUGhLnmINlFFf3RFVtYJkgOYq2Bs+BR6Oml
	  iZc0zznoj7++rKEPS343jZGwiHCFGfMLGnyr3CEPON1tlnOwOGnFcL6TGHSmiEGKMv9akeUQqa
	  I3N0Lr9JSXWT0WL3HGogqKoZN1E94/eY26i/z56TRqKVoQ==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=VG6cm4G4x6Z3D7MXtTK+Y6amsUkDuaGsyQbRz1bw3mQ=; b=dsWwi2F//PnsWVB1ACIV35pPg7
	mZ0UZ1wa6BHSNMp2Nz5Klmx5gM1pFXVoUKofxY57pm2wDu4DkPNqHXVqMOXTpAj5nFkT/xk9tNmEU
	YWfci4Rzym55Y6B772uIQxwNVYTJbYtZTiVAmevORDcun9BuSF4ZjKFqJ690e+wyOs9w=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-hbks.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vDiZU-00000001zv9-1Ts1
	for imx@lists.linux.dev;
	Tue, 28 Oct 2025 12:13:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=VG6cm4G4x6Z3D7MXtTK+Y6amsUkDuaGsyQbRz1bw3mQ=; b=OUONIk+tp/9U4/2UzIK2MKESkb
	EWYaSFEzux4RHxkDR5NqeTnb2PUvtqkXXnElXdiwxfxkU65Mzn8v9RHKWYb6kfEbx/SJSe337hH89
	q/0OjaQ4w05M1W2IB+57kDrym8FZhZpH1g8+hWcOk2swPsJpWtGhUB8+C0nfow8piJ1I=;
Received: from [87.17.42.198] (port=61382 helo=[192.168.178.74])
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vDiZ5-000000004BL-1CX4;
	Tue, 28 Oct 2025 12:12:39 +0000
From: Francesco Valla <francesco@valla.it>
Date: Tue, 28 Oct 2025 13:12:29 +0100
Subject: [PATCH] drm/bridge: ldb: add support for an external bridge
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-imx93_ldb_bridge-v1-1-fca2e7d60e0a@valla.it>
X-B4-Tracking: v=1; b=H4sIACyzAGkC/x2MWQqAIBQAryLvO8EF264SIaWvetCGQgjS3ZM+h
 2EmQ8RAGKFnGQI+FOk6C8iKgdumc0VOvjAooYwUquV0pE7b3c92DuSL105IiU1rau+gZHfAhdK
 /HMb3/QC6aGlvYgAAAA==
X-Change-ID: 20251028-imx93_ldb_bridge-3c011e7856dc
To: Liu Ying <victor.liu@nxp.com>, Marek Vasut <marex@denx.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Fabian Pflug <f.pflug@pengutronix.de>, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3272; i=francesco@valla.it;
 h=from:subject:message-id; bh=LPNuOvV5GIfBMgx0l/rLWwK1QWOgIasJTyq4uGGl3as=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDJkMm82SNsa8OHinb6/mTb83ZcsTq5/uXrUuf2vNSo8Wh
 Ql/lJ9ndJSyMIhxMciKKbKErLtxb89c829pGxgfwcxhZQIZwsDFKQATEbzJ8E+JpSBxrptKlEhZ
 9bEZ3lf+316Tq/m1pfuevUraQ7np2wwZGW7z35vssMSS6+rqi4wra9MCO1oeCR5daDn5yP/8tLO
 qN3gB
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: ff068a14af367263430264630407fa30
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vDiZU-00000001zv9-1Ts1-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-hbks.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

One option for the LVDS port of the LDB is to be connected to an
additional bridge, such as a LVDS to HDMI converter. Add support for
such case, along with the direct connection to a panel.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
I was trying to add display support for the i.MX93 FRDM on top of the
patch sent some time ago by Fabian Pflug [1], using some of the work
already done by Alexander Stein but not yet merged [2], but then I
noticed that the support for LVDS-HDMI converter bridges was missing
from the LDB driver already present for the i.MX93.

Not a fail of the driver itself, obviously, but I wonder if/how the
existing i.MX8MP setups (e.g.: [3]), which use the same driver, work
correclty. Unfortunately I don't have the i.MX8MP hardware to test them.

Anyhow, a patch for such setup is attached; it was tested on the i.MX93
FRDM using [1] and [2] plus some more devicetree modifications.

[1] https://lore.kernel.org/all/20251022-fpg-nxp-imx93-frdm-v3-1-03ec40a1ccc0@pengutronix.de
[2] https://lore.kernel.org/all/20250304154929.1785200-1-alexander.stein@ew.tq-group.com
[3] https://elixir.bootlin.com/linux/v6.17.5/source/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso

Regards,
Francesco
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 5c3cf37200bcee1db285c97e2b463c9355ee6acb..fad436f2e0bfac8b42096a6fcd0022da0f35284e 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -294,7 +294,6 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *panel_node;
 	struct device_node *remote1, *remote2;
-	struct drm_panel *panel;
 	struct fsl_ldb *fsl_ldb;
 	int dual_link;
 
@@ -335,15 +334,24 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 		fsl_ldb_is_dual(fsl_ldb) ? "dual-link mode" :
 		fsl_ldb->ch0_enabled ? "channel 0" : "channel 1");
 
-	panel = of_drm_find_panel(panel_node);
-	of_node_put(panel_node);
-	if (IS_ERR(panel))
-		return PTR_ERR(panel);
-
-	fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
-	if (IS_ERR(fsl_ldb->panel_bridge))
-		return PTR_ERR(fsl_ldb->panel_bridge);
+	/* First try to get an additional bridge, if not found go for a panel */
+	fsl_ldb->panel_bridge = of_drm_find_bridge(panel_node);
+	if (fsl_ldb->panel_bridge) {
+		of_node_put(panel_node);
+	} else {
+		struct drm_panel *panel;
 
+		panel = of_drm_find_panel(panel_node);
+		of_node_put(panel_node);
+		if (IS_ERR(panel))
+			return dev_err_probe(dev, PTR_ERR(panel),
+					     "Failed to find panel");
+
+		fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+		if (IS_ERR(fsl_ldb->panel_bridge))
+			return dev_err_probe(dev, PTR_ERR(fsl_ldb->panel_bridge),
+					     "Failed to add panel bridge");
+	}
 
 	if (fsl_ldb_is_dual(fsl_ldb)) {
 		struct device_node *port1, *port2;

---
base-commit: fd57572253bc356330dbe5b233c2e1d8426c66fd
change-id: 20251028-imx93_ldb_bridge-3c011e7856dc

Best regards,
-- 
Francesco Valla <francesco@valla.it>

