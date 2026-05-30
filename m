Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2972D47FF
	for <imx@lists.linux.dev>; Sat, 30 May 2026 14:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780149642; cv=none; b=SH9f3kKxF+FQ+hfC/RYairOQ+oWllpc/5Js5QBxEkssbLJx7ltWGhBD/8YDO/3FVK7e9vVfMTQg2l1X9NXbDzD18PadFkxiHb5NPneEGze6hyygc4oxJFKi7jg8+c2HCHIwBVW04ZZX/cFRHX3HbBR9VkvJrnRntvvp+/pVoQ6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780149642; c=relaxed/simple;
	bh=Y8eZEo2uvJkKE0gTQ/stQ43vPambIHrcJfUOstCjQTc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GlrwZzJgLLgH78Ej3pRELJDTztQ3NvrenViApWMCwCTMHmcQgCk1oMDxX4N3U1Z5lRGPhKiY+dIxkX6ocqSglN6mlcTn4l/3MOH2mUIv9ODnI3zA4ThN28V3K+pIxsVWvM+Jn3ZpqvoT9dQkceJwUmFlxxq7VlkHoY8FvrtuICc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J91LWjjF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J91LWjjF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 477BE1F00899;
	Sat, 30 May 2026 14:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780149640;
	bh=udMxTHKuJ20dCkTD67TyqCY8+b/I8UaND6lYdbnDojc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=J91LWjjF+Lt2vB4rFj0lw83Wes2zW1QOgDC4Ix2mcyanLFRtLaOHVqMrbcFFMN/wm
	 pK3mK5AHmAxrVIu3YTIY4ImDARDf8JyqlqX/SCKdCPG61pZriUmDvEC2G1z0KAO3NS
	 TDjlYbEux+94NiIT4tI2u23UWXEJWWrUlpnRPu46fLDoG5zOs1lRcVas8qMJa7pKl9
	 2DkIQMpzZmKSHIYnr8jwLyfz32P1YOvf/gzpbtIl9u42j/biwrFCm2CGQKgK+Bt8fE
	 xj0J4K17mbbI23ixVden5xuDyI2VOu2coJJ4O0lphigqScJxWSFYNwufqewQgioBzw
	 jyOO6ZWcPfxlQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Sat, 30 May 2026 15:59:22 +0200
Subject: [PATCH 17/76] drm/bridge: imx8qxp-pxl2dpi: Switch to
 atomic_create_state
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-drm-no-more-bridge-reset-v1-17-875d828d31bc@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1655; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Y8eZEo2uvJkKE0gTQ/stQ43vPambIHrcJfUOstCjQTc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlSb23e18Ys6GH3/Sh7aP3fkPK7e1ntXKfM2LlsNcvtp
 xeCVxne6ZjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQAT4f3PWF/3cj3Tb4nbcYIs
 U7vN2NUu37p98dPahEKFuH0Hpi1/4R8htWsFM3f7XslNPLfbcp9v02dsOL+p7M+KD04ZmwyXmxh
 flI89qn9c/MHPna+WuQRbXFHJWfCoOuen3Ymyo4X6Vuf1WuXlAQ==
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
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index 87305d3e0c39..2fc9831f7e61 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -208,11 +208,11 @@ imx8qxp_pxl2dpi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs imx8qxp_pxl2dpi_bridge_funcs = {
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_create_state		= drm_atomic_helper_bridge_create_state,
 	.attach			= imx8qxp_pxl2dpi_bridge_attach,
 	.destroy		= imx8qxp_pxl2dpi_bridge_destroy,
 	.atomic_check		= imx8qxp_pxl2dpi_bridge_atomic_check,
 	.mode_set		= imx8qxp_pxl2dpi_bridge_mode_set,
 	.atomic_disable		= imx8qxp_pxl2dpi_bridge_atomic_disable,

-- 
2.54.0

