Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAA12989B0
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 14:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929428; cv=none; b=VlVqJPPDwbqrbJ4ZAXkDsCpi29NkVXPYbmIpumXkuyCfl3XvIvYQ+Exxjyx04cAZbj+8glDoZE1tv2XFRznsZU1H/j6Ju/W15pQL6v2GK/IsBfl6Qecjz5S77A2UlD+QsXhJyLBoaNjgrLEJgNsG8rJBt9uKqte99Vso/gCLJsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929428; c=relaxed/simple;
	bh=dS4Uudl9IPuT983xizy6T3b6lSD0WaxCYo1UQSG2A/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZvC7VxlzApnLCjMmrBl5t1vyfdWyIlt2nbxWEbE8EgnvT+zqLSWOqVO5G6m8XCIQ5J2rqymb/FpR9H3MJZWsb7a2UKKkHwFckaweyNZTE0xOn8tsQkZP7L/TE74lo6pQK3jvnjrsXO/vbjrvTmOE63QkMkhB5pxzk1zTPRuNaFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ie7JAlGt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ie7JAlGt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016021F0089B;
	Mon,  8 Jun 2026 14:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929427;
	bh=1EdzOp4pIWYmmlps9I5TLBhdc3zszR23pufjdo1cUu0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ie7JAlGtnucLccBEWUrXMLRnrB4X9WB3qxGYkcU0J6mWcJ0MkSCTmUC4jBNTddy2r
	 UsGVvKmPFkm7Z5gvJzXHqildTaCLsLB3L4Mb7+anPcvgLX0E1LxIXkWKt25l1wD1vr
	 T6eV+rIRUBYhxZO9d+LcSzZDw1eelBfHzmCCRk0W3ekJ6mGu6eNbYJ4rAE0x14azE7
	 jxWxs+knY+808rWuhYsKG+BeZpfp/w8bSHpfqhwMCMv16SKs23GOTQcd5NhRRQhXue
	 mJ3lLQG7kkmDIbcUqVC/jo8hgXSLLhA/tb0rpPAuMkjSzNCttzC9wgrSrHqe3/4vbW
	 XcYLIEsK8i4RQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 08 Jun 2026 16:35:57 +0200
Subject: [PATCH v2 15/78] drm/bridge: imx8qm-ldb: Switch to
 atomic_create_state
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-drm-no-more-bridge-reset-v2-15-0a91018bf886@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1691; i=mripard@kernel.org;
 h=from:subject:message-id; bh=dS4Uudl9IPuT983xizy6T3b6lSD0WaxCYo1UQSG2A/E=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlql723lcbrZn9ZNmvNz+NbJwnmGzG/urIuZDufkkXnN
 o2JcmJNHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAi7R6MDcsqVNfMit4Vt1X+
 oJfwGn61X/e3T1t73mLR2U+Fl/xDKiVF14fvmNW5uWfHJNk8ufwQS8b6gBUp6WsvWzkFHFzDceZ
 4l5XC2QkPnrWnV5XPn7Ge/00pE+/Cae6ipQlGLHGPFgeXP0oEAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
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
 drivers/gpu/drm/bridge/imx/imx8qm-ldb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
index a6ca4f5c6cc6..a654c27356a7 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
@@ -387,11 +387,11 @@ imx8qm_ldb_bridge_mode_valid(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs imx8qm_ldb_bridge_funcs = {
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_create_state		= drm_atomic_helper_bridge_create_state,
 	.mode_valid		= imx8qm_ldb_bridge_mode_valid,
 	.attach			= ldb_bridge_attach_helper,
 	.atomic_check		= imx8qm_ldb_bridge_atomic_check,
 	.mode_set		= imx8qm_ldb_bridge_mode_set,
 	.atomic_enable		= imx8qm_ldb_bridge_atomic_enable,

-- 
2.54.0

