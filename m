Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BB73CEBBB
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 11:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438354; cv=none; b=Pe7n6pGWcJc4hNvEFEnWdo7Lukzw5SGKKNeUiFlGM8VgoQR3mEmFX1usM/puDM/dvySl3mvn6YpFezCwLkuoLeaKMts49jgn79EhHWd1U0HXBPYpJa0gk8XLkvIY9xcDBkdXeWpPDM/CTtFknMKiYqq6VBTbvAwP6FRrLr9NeWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438354; c=relaxed/simple;
	bh=RGJyt7QkBA8kKreybmqR0T/2LcA2lqfsR63NYfeg8/w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DUvaW6WSGADaltCY88gc0olAQqe2P5K2wNUWBaLPJJp/TWOeak4aezhKC2JrCD3ZIAIO1t77QCBIAN8LgGgL9ioq8zws5B8dYUpNE3o53mQew8ZBNMBzW4ly6wHsCUhTMmMW3J8HsvDOagFnCYK0ykMmuEUPVHUZWTuLlFlxEcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1w5MT8-0005WU-9a; Wed, 25 Mar 2026 12:32:14 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Wed, 25 Mar 2026 12:32:00 +0100
Subject: [PATCH 2/4] drm/panel: simple: add JuTouch JT070TM041
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-2-10255d236439@pengutronix.de>
References: <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-0-10255d236439@pengutronix.de>
In-Reply-To: <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-0-10255d236439@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.15.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Add JuTouch Technology JT070TM041 7" 1024x600 LVDS panel support.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 drivers/gpu/drm/panel/panel-simple.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 91ab280869bac..6ac263f83793b 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2940,6 +2940,35 @@ static const struct panel_desc innolux_zj070na_01p = {
 	},
 };
 
+static const struct display_timing jutouch_jt070tm041_timing = {
+	.pixelclock = { 40800000, 51200000, 67200000 },
+	.hactive = { 1024, 1024, 1024 },
+	.hfront_porch = { 16, 160, 216 },
+	.hback_porch = { 160, 160, 160 },
+	.hsync_len = { 1, 1, 140 },
+	.vactive = { 600, 600, 600 },
+	.vfront_porch = { 1, 12, 127 },
+	.vback_porch = { 23, 23, 23 },
+	.vsync_len = { 1, 1, 20 },
+};
+
+static const struct panel_desc jutouch_jt070tm041 = {
+	.timings = &jutouch_jt070tm041_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 154,
+		.height = 86,
+	},
+	.delay = {
+		.enable = 50,
+		.disable = 50,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct display_timing jutouch_jt101tm023_timing = {
 	.pixelclock = { 66300000, 72400000, 78900000 },
 	.hactive = { 1280, 1280, 1280 },
@@ -5352,6 +5381,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "innolux,zj070na-01p",
 		.data = &innolux_zj070na_01p,
+	}, {
+		.compatible = "jutouch,jt070tm041",
+		.data = &jutouch_jt070tm041,
 	}, {
 		.compatible = "jutouch,jt101tm023",
 		.data = &jutouch_jt101tm023,

-- 
2.51.0

