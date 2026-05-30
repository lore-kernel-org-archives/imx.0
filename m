Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FC32F0673
	for <imx@lists.linux.dev>; Sat, 30 May 2026 14:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780149628; cv=none; b=dlSgERdcwqHqcZGQDsv6a/SbALXr4uk/h3vnr0Ixr5x3oO7a3dSL/ZxOKQ3Ngq8A7o+NqG9/sZYToIJ8PzRBLt4aEMclBW9uhD3GxE/PUqqlrNduyRS3S3ybMr0vIUoIivaoqibCWZzHlopO+xjb7vW9DULOslYuc2D6QmLnnTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780149628; c=relaxed/simple;
	bh=oDMDj3wxo+MCGUjOEVoyrYhr2GqkKwUCrzOnme4mbN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HkptF2S4c3fscXNWwZGutcKFKkflr3iQgC+T+NiH7+ymzdUjo3NiugSPWjXW5WLrN0PHJt5g63lOVSBULDkNY9855j7sWr/Yi8FzYhba397ytFTPAz7sam5ezIvCjPn5OLMP2YvzVObgcEockGxnmcL5kkveW2++m8mVoHEchxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KC5gWxud; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KC5gWxud"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27461F00893;
	Sat, 30 May 2026 14:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780149627;
	bh=BE8zRbI0pTRe5lF9IhYcmr7R1vJTHskOpR2nzwJadrE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KC5gWxud0qkZGzfFFGYuZYe+RYLbG1RTS2v+GEN1Gr8t/wNPQOpeYHLNMNPaL9gUw
	 sPGlT31KOG3FL807mCmd3GcMPmcyjWi5HKsJ97Zi9o4KV3j0ELgm2CSuUwtBYbxgbQ
	 0nxGnDIec30ZvwZaLXG9RGcWHyBah/ixuipZY4sZDdkord7dbHYnah/zcXYGUIlug1
	 5T2gk2sJNT4IrRfsbVJRwFeLj0u86rI0OMooVpN72QTeuvI2AaHkgLWDmjhlbcbYJQ
	 krF/stylv76VzTfKaWjxnpIlX2HofTUggtkdTEoEAQX5Ewdy1R1JVTWKxWeqNgwf5E
	 5NUMrUw0rVnNw==
From: Maxime Ripard <mripard@kernel.org>
Date: Sat, 30 May 2026 15:59:17 +0200
Subject: [PATCH 12/76] drm/bridge: imx8mp-hdmi-pvi: Switch to
 atomic_create_state
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-drm-no-more-bridge-reset-v1-12-875d828d31bc@kernel.org>
References: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
In-Reply-To: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <lumag@kernel.org>, dri-devel@lists.freedesktop.org, 
 Maxime Ripard <mripard@kernel.org>, Liu Ying <victor.liu@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1591; i=mripard@kernel.org;
 h=from:subject:message-id; bh=oDMDj3wxo+MCGUjOEVoyrYhr2GqkKwUCrzOnme4mbN8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlSb61aj60LkPqovcfw9ibGoPc3lzDYCTQI/drwOW7rg
 rfcngXTO6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEdgcxNuzZ8rRoeX7r0TWF
 DmzuV0JrVnlcnvFfknNlP7MQQ+0WE4vVv1d80VS/pJOa5eK+u4rhJ2PDxQBRm1VLDTjP8ZbJrWZ
 +OPvzFcn1R9dOW9jeFDgppqHt/dPzH2ezJKaevVnEeLr35MfjAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---
To: Liu Ying <victor.liu@nxp.com>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
index 7d5fda7173e5..a31d4fc76f35 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
@@ -129,11 +129,11 @@ static const struct drm_bridge_funcs imx_hdmi_pvi_bridge_funcs = {
 	.atomic_enable	= imx8mp_hdmi_pvi_bridge_enable,
 	.atomic_disable	= imx8mp_hdmi_pvi_bridge_disable,
 	.atomic_get_input_bus_fmts = imx8mp_hdmi_pvi_bridge_get_input_bus_fmts,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 };
 
 static int imx8mp_hdmi_pvi_probe(struct platform_device *pdev)
 {
 	struct device_node *remote;

-- 
2.54.0

