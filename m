Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198E83CDBBF
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 14:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929439; cv=none; b=DzRHKK4b1oLVeEhhKOhAK9h5+j10A3lHgiDaeJkSBbN28gUUsJzbQDYo5p1sI1cD5phI2T89DLnNEeteKxL88f/5K83VItay8rdDhQboYM53s7Y3tnxbTe9WSWdCKVGw9hNDB4oIe9Qb9oQICLHAfg1k1nYQ6u8ekgQoHHmeoeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929439; c=relaxed/simple;
	bh=V4SZd754SBaCkeg5CdUwftfMKo5QvdMhOIWDkLK7Xa4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dVau+2DnKMWHQy19Q0GTB1UzaPz9t5Xlw6jqOFUbUe2UpoIK8azLoQ2VjlUMctb1guWGMbRtghnasxYnEHNG8OFBwGa/v8U8fUBSm3Ql5oL57CmM8M5sLkLntswcCH3pi29rCBTm5t0t8o+BpXMUEv72lE88bbFztSQJIJySSIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ASjPkpHV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ASjPkpHV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36DD21F00898;
	Mon,  8 Jun 2026 14:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929437;
	bh=+iAPpXuMRXlFvwcvPUQkEJ0mXtzDz4In8LjOEWtrQII=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ASjPkpHV/IIMzngOrflBSLDGi2OQy64q2DMtGCxa0sQ8YLAFk3Qmu4BOOZAfgYr7e
	 sdDo+7k21W+fwFxJMc58NTkT5P/ZijfjmZuVYeiD3DJkzz6kWURwyl/mB7iB5XuVT5
	 tmS14yXI6sKGtYVq/IKv5A1sbe1CBns3RY94637L0MF5bkj93AiXzRxwP91emq3vrn
	 wModAKbf3b6rJsVVQ0QvItO6WO9+ev0b5kppPw55Dof819ueRAAlJU8t30UN/qbEjH
	 Bu5VKLWdwNkBpI8YSdgj9Fc0O8zBz21gGYi1YkZV7d/6BUrP0m2LuWDe29UsCt9+hN
	 j+Uv4l+Y/bwEw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 08 Jun 2026 16:36:01 +0200
Subject: [PATCH v2 19/78] drm/bridge: imx8qxp-pxl2dpi: Switch to
 atomic_create_state
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-drm-no-more-bridge-reset-v2-19-0a91018bf886@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1707; i=mripard@kernel.org;
 h=from:subject:message-id; bh=V4SZd754SBaCkeg5CdUwftfMKo5QvdMhOIWDkLK7Xa4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlql33fPDF+V/+N/4HotmAHs+tN9X+Kl69tsVy7sobRQ
 k24KONYx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIRl7Gho8Lc+IEtiz55uib
 8CZOpPQRz8WCKVP/y+jd/lUcE7T/zQObpESPGctMNDa9Y6rjDGu9wlgfdXziucevHPjv6l2IeFX
 lkGu4/NoV90VFFTd4v7wsj9TavoNF+3TaYY6F/es3eTu0PHsCAA==
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

