Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7BB3BBFBF
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 14:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929433; cv=none; b=MR0fDbCyos24q7GXg/0EC9HMEn9LWwJEU/eryTSNB8ulFkLSdCpXijgHP9BCQy1Of1UawDev5wyDqB64L2ObRxGHvJREgL11ZpHoE9ietk88qM9eCENcCxMtDAQPufCENEdVHVtk2Xjo/SdwuSJcd2VSdYll8baIVfaOQ/M9UrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929433; c=relaxed/simple;
	bh=IB7417fS5tW8QdBS3d/mUDYAekiUg8TKbNONBNaFUT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R/V/6g81wOxXhYMWwqys5mhSto0v1eWIqR2d0UlhqIN1ZDWhEcFMTF3loDtD/vg3ck4lQuj57kD1g7pGQe9pqBeRIRzyecqHlSUoCnvQVcymJsd3aQfPtyGoJNrpvXg+eARQOZz84LodnL8NgAXuZGk42UbfkQbDXhj0bLyDtGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lYhukQMd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lYhukQMd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC2631F00899;
	Mon,  8 Jun 2026 14:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929432;
	bh=tQTl5mAuEP4DtcZBSgrelYaUQgKwWO1dWiLAuH6V5cw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lYhukQMdleaEcSHfNWp4Ch38Sg6irKt8+gJvtwldtVfBVhra+VHA1yiZWAFir3Mog
	 K/zcFfDR4HCAEdaD4QorT7kAdPQwbk5s5O6UM8s2YFh9DYHAr0OKBSAabrTiZvHhoW
	 nSOq5zPNTh/5liPjPTAkAhb+jzoDJm+LTcuCDCAGRU7DLTvdsr3i1MAhbZCrwXB2vi
	 2D5h2ezzVHmxqlE3VAALkpKySKzrWzdbfmHtaKK3wOFR8SGPzc/GXCtJXIISYJQXpy
	 9hnhA6RvP9T32yjaEdwrqCgFJ3T0Ls4/8QxTDTdcKC6f00orqwbRwPKhblSQdJ8nZZ
	 X5kI+wmoXGtFA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 08 Jun 2026 16:35:59 +0200
Subject: [PATCH v2 17/78] drm/bridge: imx8qxp-pixel-combiner: Switch to
 atomic_create_state
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-drm-no-more-bridge-reset-v2-17-0a91018bf886@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1693; i=mripard@kernel.org;
 h=from:subject:message-id; bh=IB7417fS5tW8QdBS3d/mUDYAekiUg8TKbNONBNaFUT4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlql31qrV9PnJ5x7xer1hKrl6/5Y0qmieunJPoI3N998
 fzUBwIHOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBE4qUZG1Y8teOTuskomHBX
 951VQeDW8JYOv0ybk9O8nx1mudFl+VhpyfUQPUGBD7NlBDqmxWvcY6wvUW+9n55yQU9MuGZN95x
 J/Woc/Z9+nhVmWv6arVbd5zVXg3nTrvDsk5kH+COMsrZEXAUA
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

