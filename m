Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4862652B0
	for <imx@lists.linux.dev>; Sat, 30 May 2026 14:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780149636; cv=none; b=QJMBCucyB3kP7JAVSPYv1XRgLpDhcd9MVNCZIXPOpg+7h4Fr2+YOvudANHjJ9JlK6GoB/CdhBGAO3RI0WX9JgyTw3wPQob3yUL9xaRf4iu69Y4JKY7Pq0na+N+PPudH780zeqUKvndAXojZ1sK9EmzQ9FvG2gZReKPwLfAjw6D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780149636; c=relaxed/simple;
	bh=NkqK709L4B/gvL2yMw/BFm9SnSO2hR7HcVAMXnkMgaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ijaaYNGUOP4WNeFMtbJGGw9rfh6lqBUgBwUr+qLIGlFOdCeGx8wdVotVV2b3gVFA/k3lhMq3/1Ep6sL3FRQInKg/Z1MfrY1VmS9zgeVD1repAvGfa4DWLerooTPEzzTfR1VngZ/aN5zpdbLEdgBfbPybZy99mnc2Ck6qm68eZck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tw6PtnbP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tw6PtnbP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D141F00893;
	Sat, 30 May 2026 14:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780149635;
	bh=4hrbgo04VDBqbgiItbHVdK4dfDlX9eQjt/wF7mnm2M8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Tw6PtnbPFjwVUNcSgLY0eG45zAT8lxS8r8jcVU5zOWIbt8fT8so9RGXiitWMHEne2
	 Y9ID2j34b2kEWehxdPBOIcFV4190qa0lIaws9hprjXVAZc6kDfCUqCrpqZJZB2USEN
	 PoNK9UWCPopUxQG9F0uiv16hRMLB52l7wXrEWr6MA3DKakkeKIUuYuGKPfQackJHnO
	 nUjZFCRZTFB+oCry0BgC+aNuybO33WVQI559b0OVuiDDEYWiqU6fEX/5s73adPMvtL
	 u0A20pF0lJyJ1LM8MwmVAnd1vSIGzK0ZrlrbrE54Y+4Dl6NxlNAx5+5SLkbf0+TXB+
	 /h+Wh9UDq4OGA==
From: Maxime Ripard <mripard@kernel.org>
Date: Sat, 30 May 2026 15:59:20 +0200
Subject: [PATCH 15/76] drm/bridge: imx8qxp-pixel-combiner: Switch to
 atomic_create_state
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-drm-no-more-bridge-reset-v1-15-875d828d31bc@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1641; i=mripard@kernel.org;
 h=from:subject:message-id; bh=NkqK709L4B/gvL2yMw/BFm9SnSO2hR7HcVAMXnkMgaE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlSb22cc2eId68XmHdaM+HcK9G/xrYx019Uatnx/2X96
 julySWoYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEwkQJ2xYWnkpm1e38IDsvw1
 1BjO+x7Yud7XNXz648n7dsuKTzWS+xE//+fSoBquKY/vhh9cKMOrztiwl3UvG+eTS65rztft9Ql
 kMVv/X3da4PTSqxfdlcTKpsRxSf43X3ym5f2+6qSIWAX1y40A
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
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
index e0ee51a9ca7f..941ce2f91e9e 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
@@ -249,11 +249,11 @@ imx8qxp_pc_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs imx8qxp_pc_bridge_funcs = {
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_create_state		= drm_atomic_helper_bridge_create_state,
 	.mode_valid		= imx8qxp_pc_bridge_mode_valid,
 	.attach			= imx8qxp_pc_bridge_attach,
 	.mode_set		= imx8qxp_pc_bridge_mode_set,
 	.atomic_disable		= imx8qxp_pc_bridge_atomic_disable,
 	.atomic_get_input_bus_fmts =

-- 
2.54.0

