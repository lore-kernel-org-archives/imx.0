Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D75320CA7
	for <imx@lists.linux.dev>; Wed,  7 Jan 2026 13:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767791650; cv=none; b=GvPeepcKmx56m9QFALBuUIlkwuIHvKimM9tJqwQ5c5qYyXzZ6/YeEBvrdq23VUHiLuqjZH1hI1+nKuKdzsnXSs3jmShjIQwN+kykpSnEFwh7txJNh27FHcheHkDykU/MqaRWKjs0TR3dLRwPgfNlq0AB48FSBHSFasddrpNsbXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767791650; c=relaxed/simple;
	bh=YdBnL+zdJ/Gzcbcx2qT/LcIkuCUnPWWah92dgeG8k6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=foFr1+dJCzUwmHLgNeDeNUp9qq/Qj7r0AEPCQ9BS0iQDg0gjwVJ3UHUefN6KZOsqdgSMhmn72bHDBZUiKMBBdSfFHKp0ZDtjf/nnlb8QHzcXeENrg7saGhgVP8TDbwueekmoL/ivvNyVgIOd0Rb27U/TGWs+cJvYDnsD1lutSII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zlp4ImdT; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zlp4ImdT"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D18F5C1EC8B;
	Wed,  7 Jan 2026 13:13:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EC563606F8;
	Wed,  7 Jan 2026 13:14:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA269103C84C4;
	Wed,  7 Jan 2026 14:13:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767791641; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=c9uPxQIzbm1x3tUEAMRFb/oOEwm7sA+lEOVv4AQtBEw=;
	b=zlp4ImdTLiKKY2NZVTxqKuYqT0BFkRF8RThasuk4DhPWMqvukWNRiAumjzIRv6MhPxosoe
	OzEM4vb2Q2O18W5cY6/LTjOBODiZf/mxHm0HrYRCIgCoTpP8g1+8EBuN/+L9P9/SyNT7KY
	f3CjbRNEeoACW7IyZsB5l8Hw/81CglFLot7mgabjSM2CuHusuMRzdQ31vcQ4pER6cMSurn
	fcI7JCSXt0/WL0f7WeZ9n/YMXmOt83exTnJrsVRv3RzeHYNh0eZ96IjAnPrarqMC8DsFdR
	vXQEK4lxIQgnSBbowiZfaBva+Uz1kzEZ8LsLxvE68MZZ+YzbDvW/rrLxldee3Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Jan 2026 14:12:59 +0100
Subject: [PATCH 08/12] drm/bridge: imx8mp-hdmi-pvi: convert to
 of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-8-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Philippe Cornu <philippe.cornu@st.com>, benjamin.gaignard@linaro.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done by using the drm_bridge::next_bridge pointer.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
index 3a6f8587a257..15fbb1be07cd 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
@@ -29,7 +29,6 @@
 struct imx8mp_hdmi_pvi {
 	struct drm_bridge	bridge;
 	struct device		*dev;
-	struct drm_bridge	*next_bridge;
 	void __iomem		*regs;
 };
 
@@ -45,7 +44,7 @@ static int imx8mp_hdmi_pvi_bridge_attach(struct drm_bridge *bridge,
 {
 	struct imx8mp_hdmi_pvi *pvi = to_imx8mp_hdmi_pvi(bridge);
 
-	return drm_bridge_attach(encoder, pvi->next_bridge,
+	return drm_bridge_attach(encoder, pvi->bridge.next_bridge,
 				 bridge, flags);
 }
 
@@ -78,8 +77,8 @@ static void imx8mp_hdmi_pvi_bridge_enable(struct drm_bridge *bridge,
 	if (mode->flags & DRM_MODE_FLAG_PHSYNC)
 		val |= PVI_CTRL_OP_HSYNC_POL | PVI_CTRL_INP_HSYNC_POL;
 
-	if (pvi->next_bridge->timings)
-		bus_flags = pvi->next_bridge->timings->input_bus_flags;
+	if (pvi->bridge.next_bridge->timings)
+		bus_flags = pvi->bridge.next_bridge->timings->input_bus_flags;
 	else if (bridge_state)
 		bus_flags = bridge_state->input_bus_cfg.flags;
 
@@ -108,7 +107,7 @@ imx8mp_hdmi_pvi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
 					  unsigned int *num_input_fmts)
 {
 	struct imx8mp_hdmi_pvi *pvi = to_imx8mp_hdmi_pvi(bridge);
-	struct drm_bridge *next_bridge = pvi->next_bridge;
+	struct drm_bridge *next_bridge = pvi->bridge.next_bridge;
 	struct drm_bridge_state *next_state;
 
 	if (!next_bridge->funcs->atomic_get_input_bus_fmts)
@@ -157,10 +156,10 @@ static int imx8mp_hdmi_pvi_probe(struct platform_device *pdev)
 	if (!remote)
 		return -EINVAL;
 
-	pvi->next_bridge = of_drm_find_bridge(remote);
+	pvi->bridge.next_bridge = of_drm_find_and_get_bridge(remote);
 	of_node_put(remote);
 
-	if (!pvi->next_bridge)
+	if (!pvi->bridge.next_bridge)
 		return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
 				     "could not find next bridge\n");
 
@@ -168,7 +167,7 @@ static int imx8mp_hdmi_pvi_probe(struct platform_device *pdev)
 
 	/* Register the bridge. */
 	pvi->bridge.of_node = pdev->dev.of_node;
-	pvi->bridge.timings = pvi->next_bridge->timings;
+	pvi->bridge.timings = pvi->bridge.next_bridge->timings;
 
 	drm_bridge_add(&pvi->bridge);
 

-- 
2.52.0

