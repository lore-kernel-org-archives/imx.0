Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653E63B8BA5
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 14:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929436; cv=none; b=IwR+qlkt1VMHkTJ38XQMbIWRRtcPBHD5QoxvfUOpxyX1AJPRna/RpkF0gDWtGLSDzzyfFoRU+90EVGe/c7KZ//gcJPa2qW5zO9jWJGXa2HEYe1TByQELkoAIcuN5y1oJJIAN/Me9FeKpjdX6yehxXiC9KQznPVaFwM4AO7fh14M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929436; c=relaxed/simple;
	bh=49qldxF34k89KtOOsh2//1+nnc5HmDre/dbrfUH+qEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GsoQinx9GCY9whofHv579bwE3Wdddfm/kIRE3Gk5L5tHRz7/1zodPWBFpTgD1r0zN0GZijYQ3r27lvZU2N2eGGOQK8ZwjG9cBVj9GwWariRvrKG9Ro7GniYntHhhNXx3GE9CiyPNom1jOziqf8ceuuBHkP4vyRJYjD81l0DjfkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ezD/xBi1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ezD/xBi1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D9811F00899;
	Mon,  8 Jun 2026 14:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929435;
	bh=3v0oVMCrGaOXwGAnDCM1DaTdys49j+n77POgvSAkY40=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ezD/xBi1FH/sKEsx25sY9y0uYq/FfmOo5lMh0dKkr4gdeRC88Nt34BovjdkrmFFpj
	 eprTI9DnRY6M2WUtnZU5nBYb5B4ckP8TsEnGsZtXv38AogsMAgwpdJpQwEWNBeXtaX
	 EiFEWCEiNo1l5dBCDBNHfv6XNX/zfITpYlXsYOC57ZMQH8AciWPP7f67n9XpSLHspb
	 ph//Or84blUXgk82q6WBeXkn+pcjoY7C+BkXA4qpLDkAfPZYaQardqrWb4zaZwPk5T
	 0OXcKhXFwuKTJ2XUPDHfaDuzTjXcgFELFMlj22eeFn7zbp8uX+RHETAx9sXWgSq8zL
	 l2xDe8W3iiSuw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 08 Jun 2026 16:36:00 +0200
Subject: [PATCH v2 18/78] drm/bridge: imx8qxp-pixel-link: Switch to
 atomic_create_state
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-drm-no-more-bridge-reset-v2-18-0a91018bf886@kernel.org>
References: <20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org>
In-Reply-To: <20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1727; i=mripard@kernel.org;
 h=from:subject:message-id; bh=49qldxF34k89KtOOsh2//1+nnc5HmDre/dbrfUH+qEU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlql33nPXvR0Jbf7/vhYuZmua/ydgknWRe0d7pe3LRj1
 Vz/VV+jOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBELDoZG/anOvoE2K6rvL0v
 uu2JqoHU8tVJRy8/3/soVVH/T9rPb5531jtMbuIWWXTsSYPLk4fdKox1puE6pe2lolrXLx9TOuP
 hHfHdbNPFo39/V3eJH0v48sFbj1UvsLNqf2Dr0gl3Mtqq9hUBAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
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
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index ee6b6dbbe952..92b8b1ac35d0 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -227,11 +227,11 @@ imx8qxp_pixel_link_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs imx8qxp_pixel_link_bridge_funcs = {
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_create_state		= drm_atomic_helper_bridge_create_state,
 	.attach			= imx8qxp_pixel_link_bridge_attach,
 	.mode_set		= imx8qxp_pixel_link_bridge_mode_set,
 	.atomic_enable		= imx8qxp_pixel_link_bridge_atomic_enable,
 	.atomic_disable		= imx8qxp_pixel_link_bridge_atomic_disable,
 	.atomic_get_input_bus_fmts =

-- 
2.54.0

