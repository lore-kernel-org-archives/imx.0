Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68482F744F
	for <imx@lists.linux.dev>; Fri,  9 Jan 2026 07:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767943939; cv=none; b=lCS7NsFsVUUFPlh/CPRuo8dE2HmLiKH1WBTf/uoCcUqsW1iw9nTAxE8FDqLbBSyQwbuS8JRI4wZEZG77wWqd4dVOAU9I7JlTnELjZ3V0ctlOIYl9QXZfJl0wM0SDHe93FQQnm8q2ORkvdVS9Miz9Oc9FYLPrgCmwP/cQs6D/BXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767943939; c=relaxed/simple;
	bh=LLtFnmZdGnsTnzMIaY3k4S3r5yFxMsWKzoWjwCfgxPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g06KFRYRgSggJkdWTYJYle/7nsEdeyna0q8hAhFnFj9C5OuUyJIdxsvEHG1ckTLVQR8O1rpBYR/ewgL9XCEb36M95Eh3Eg5vqCuRUD7B3C6HG4u+6mTnNAkgV4OJ+3MXXwE9g61X2FAtttkgoMnth6dpPoNvdHYTN3LVOAAS6E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=uGrm2Yh8; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="uGrm2Yh8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9ABD51A272E;
	Fri,  9 Jan 2026 07:32:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FE6A60734;
	Fri,  9 Jan 2026 07:32:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 00DDA103C881F;
	Fri,  9 Jan 2026 08:32:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767943935; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GxKIdaKvfopekWvG3hWQtDnNeXJiX7i9YK2gyW5SATs=;
	b=uGrm2Yh8nMAkdUDVxEMReHX/rp073WAEC8AuKIwYdsjF7jvVbJWnZVLt/HMUXJ456u9I2k
	T+sHC/WNkPQAl91yt58yr4H93+vm3bHo9tBVYc8iB3pMJrAsugXLt0lOrvje6bwsA5HT/4
	9mskfawdl3gHTEJEsJhWmRCBTONx4pNMMDoc6poS+9SRrGrKz+xamS74fQaEtvWD7KyfSu
	fVQU7HhTnzkHJ5DqK3Lconib10bEPvwO+uLwGWpLXvt0Zg/4aUF69UoguJOT4rwHdWEWFk
	9vBEBtdq0X01kgxwRvBw4vxjdfkUTDuNIx4L40Qoit2RdKup8SofWc+EqirxSA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 Jan 2026 08:31:39 +0100
Subject: [PATCH v2 08/12] drm/bridge: imx8mp-hdmi-pvi: convert to
 of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-8-8bad3ef90b9f@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
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

Acked-by: Maxime Ripard <mripard@kernel.org>
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

