Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5593A3F1AD2
	for <imx@lists.linux.dev>; Tue, 19 May 2026 10:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187235; cv=none; b=UNzIroiJAqJsY+xHxrWGy/xheYE8zPmndbkp0kgLTaVPu2uE+WPRS2fZmOpU7IgBz4P04Yxu2QS31yRgAtPVkgl5MYzVl4oPlzPIOgPmz/D1eXxwsnOPuxNtbC2FoxnkDCsbLtoZUBCXvc4zAFzB9N+3MtUol0V/Xe4jWU+D6YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187235; c=relaxed/simple;
	bh=5j43y7DFu3qB/mMWIPqHQC6IjsUzLol2f2RUaMpvjQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oR3tRYLwMP7AN6sJ0TBRKrd/HQqkb+ZdUGUrh3U0mleydjFS7NUJ9bDdVUmrW7JbIVXrRpownWP/jTdd6BFPDsDdVgcQ3UfvHJC1vuJT0TLb9t6hKZ3yl8qXsC/iF2BvRyNCePOKsZ7v9zg3dpmopMRudgddcjhOz1ur1MCS7io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MWJTDn5r; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MWJTDn5r"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EDCA21A3629;
	Tue, 19 May 2026 10:40:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C19AB606E9;
	Tue, 19 May 2026 10:40:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5BEFB107E8AF0;
	Tue, 19 May 2026 12:40:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187229; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=31ncBWdHqHsdjEKSp4vtUwOjKggaE/FUwi7+sB64GTA=;
	b=MWJTDn5rArD4HU8/88qXnibhNRKlApYd92dhmLobr0VRJBSg9i4Nmt6jrwGXpugMvv5OmY
	TpUfO/dBOabgxWRFrU/10zDCAXFxbLEZqFMDOe9SMZ+IWfixPQSIzlnfZPdcq/IlO/VGIr
	dFET0eus81/DZyOLH05lag+6WmQfcgQnsk9qalj79k6mddr5R/6pKyUA6GZXb+BAR3V3S1
	23cN1nXngjKQfI+YmsdZ5lezoxal0KuUEipbhLwhHbrw/NnM5TGhNO3cytPQaGQ/MYB3KT
	wOl5qttM4Y1u2RSkUny+veut8wkeTbVCYw/TqNDZb1xMDLD4atb2o1XR1eJ69A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:50 +0200
Subject: [PATCH 33/37] drm/bridge: samsung-dsim: implement .is_tail
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-33-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
In-Reply-To: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

This bridge is never a tail bridge, i.e. it always needs a following bridge
to complete the pipeline. Add a is_tail func to expose this.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 3c70a45c5dce..55f4b0f16ade 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1716,6 +1716,11 @@ static const u32 samsung_dsim_pixel_output_fmts[] = {
 	MEDIA_BUS_FMT_RGB888_1X24,
 };
 
+static bool samsung_dsim_is_tail(struct drm_bridge *bridge)
+{
+	return false;
+}
+
 static bool samsung_dsim_pixel_output_fmt_supported(u32 fmt)
 {
 	int i;
@@ -1836,6 +1841,7 @@ static int samsung_dsim_attach(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
+	.is_tail			= samsung_dsim_is_tail,
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset			= drm_atomic_helper_bridge_reset,
@@ -2225,6 +2231,7 @@ int samsung_dsim_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(dev);
 
+	dsi->bridge.ops = DRM_BRIDGE_OP_IS_TAIL;
 	dsi->bridge.of_node = dev->of_node;
 	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
 

-- 
2.54.0

