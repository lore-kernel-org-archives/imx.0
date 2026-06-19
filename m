Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F45372EF1
	for <imx@lists.linux.dev>; Fri, 19 Jun 2026 12:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781871934; cv=none; b=U1Jy91vE+DMELoJTT7taZ1f/S4A8bLYmTnrBnJLjFaaGzFiLIJsyS/ni1xuCrGiz2PUmlDmVfINxNJApVDna1RbyE+y07ojYAVOA1mUaaJ0PO6dCM3QjtlYcSc8GlmB/TRpMxOIXIkqervOgqXaY4fNZyv1eKGhctAiZuTwWqzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781871934; c=relaxed/simple;
	bh=B9/gL/Few8RHqdxPocrHYpxsu0gdRJOCI4aBgZjcvOA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jjEh6l8v0/bVFhjUt330ZHZrCaJx7CP7KE1WPEzEyLPr+VyYtGatnd1K/A1GAXTB0GSJY4g2BRkmlWeWDHldWZB8Dwvhj+zHr7cVgtJPlesy0MoZUtrFsLjFkHII4FGE405IE7wVhLk9jD05NqC8jMR3DJyFt2WHIW0K/NZ7j4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cut0hzNL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cut0hzNL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6D091F00A3D;
	Fri, 19 Jun 2026 12:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781871933;
	bh=9vAwPkSOoshbVVtVqVg7QEm68gkMlenTZL0kzOcTbPY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Cut0hzNLhZqwGMeyRFA9Aq/Puw6TQCOsq9U2L1LlENjD/Rm5/MSiKu+rQwAZlHgQW
	 zXv5o/pdZvZJ3d2rj2jIob9SNsuYLhzqyP4hDYW5PrAtV31cPZhBz0V5N2WiCXm8k+
	 Loq2bIcx/o7m7JWL73Ydl+UyiNh6Y8PuYVNP7pUVWR9m+Rju+sEBHuAS+VLfP/Y7cI
	 nHmgvwnm9Us6sGtk+gypc+mOtXhiDqraw+MpJX8uJ2eEBcnHPgC8adp9zQuz4XE/2i
	 Ek6GBUrUeDh/A+6kj6FotYNZWqaPkIHyUfVEVs+YiYcx9hwsLz1foAoTl+O93O5PN6
	 qqJD/XUhHN0vA==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 19 Jun 2026 14:24:22 +0200
Subject: [PATCH v3 17/78] drm/bridge: imx8qxp-pixel-combiner: Switch to
 atomic_create_state
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-drm-no-more-bridge-reset-v3-17-ff399263111b@kernel.org>
References: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org>
In-Reply-To: <20260619-drm-no-more-bridge-reset-v3-0-ff399263111b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736; i=mripard@kernel.org;
 h=from:subject:message-id; bh=B9/gL/Few8RHqdxPocrHYpxsu0gdRJOCI4aBgZjcvOA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmmJh+9PB4ujRRZeGZu+uZdAh9EpeYEP1ztpCI3QWSC0
 L/Diad6O6ayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEZvxhbNjF9f3hp7uX41Zd
 XybveVRKe7FXU73J6vCEt96r0h43XP429bSRakfxpkCRjqdSEYeyrzI2fHDYMHf3nYOXdplezbW
 YOWn1nfduYsd2bO19uO3voyK90tnsb6K0/9+/crWYm+/E0eM3lQA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
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
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
index e0ee51a9ca7f..a5a1bf42325b 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
@@ -249,11 +249,11 @@ imx8qxp_pc_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs imx8qxp_pc_bridge_funcs = {
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_create_state	= drm_atomic_helper_bridge_create_state,
 	.mode_valid		= imx8qxp_pc_bridge_mode_valid,
 	.attach			= imx8qxp_pc_bridge_attach,
 	.mode_set		= imx8qxp_pc_bridge_mode_set,
 	.atomic_disable		= imx8qxp_pc_bridge_atomic_disable,
 	.atomic_get_input_bus_fmts =

-- 
2.54.0

