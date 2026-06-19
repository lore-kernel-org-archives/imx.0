Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6D61E98EF
	for <imx@lists.linux.dev>; Fri, 19 Jun 2026 12:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781871932; cv=none; b=nHKTXRHOuiMRP2N/bQdgdzh9OSA9ffUyc+bzdWjEYEfvb7jojYGtiiAcDURE+eNjUIk7l+ROOPkt50dyla23RRESLMb3kyul8u3puf9HE9MrU5IfOXL+QP5DTC8//14EPVLsPxnoQl2UT8FewiyDow8aRBDfhybN1vnP7cEdCiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781871932; c=relaxed/simple;
	bh=5iFgQtxnon26j6S4aYqgcG3bBUhdwRJ39k/zZ6sZJak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FMu4tf1uybDfLYbgQUUM858t9cWmxVpy1OCjeiVYx91b5Rp48CNO0l79a0oV9yXt3KjWUuqgRJFCfZ7op9XT/RhceQG01/nuy5SbO4TJc6CpUNsX+czC9zgt19ndGQTATQwUsBw2lJuUdhM5rGTH2Ig3SxNhLtKhIfyPz8epK70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HabueRkV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HabueRkV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378311F000E9;
	Fri, 19 Jun 2026 12:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781871930;
	bh=bNvjsvA4ZkU6sKBMJTbExMZdvpf88R/hyXSJXqWWRKw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=HabueRkV4+5RuNSKCRYVe0MoBxsmjEpr+XvBY6HFgHDQt8faPlj+ANVYLe1W+Fj5X
	 p4zzSqObxhb9nyXWS6FN6ay8IBkTaq9F71CEp6CPh7NEjh8ud7vUwE7SYzlX5o7N7P
	 DduHXVMQ7M27id//vWz0+Wj1lSz9spsUC/60N/a35U9P6/r9YVrZW32iXT0tmPEqfF
	 BeQEr4T+cZmUystd5mjkXiyR6qC4dJzqzNNSbsbbM31d3zKZfqgrUlfqR8HYODBsfg
	 M4p/0nWE9ZunuMK2aXaWJisb69ozoQtk5jfv6JMbDewlRpzUbNcY96k0m78QvNY9q1
	 NGrGsj5ofHD7g==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 19 Jun 2026 14:24:21 +0200
Subject: [PATCH v3 16/78] drm/bridge: imx8qxp-ldb: Switch to
 atomic_create_state
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-drm-no-more-bridge-reset-v3-16-ff399263111b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1735; i=mripard@kernel.org;
 h=from:subject:message-id; bh=5iFgQtxnon26j6S4aYqgcG3bBUhdwRJ39k/zZ6sZJak=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmmJh8N6v4qT5/V/5hrQuWyjYVr8o/fYPuwceqsJ/+8y
 p5XrnW80zGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmcu4pY8N2kWNlP9aoM1xd
 eSrUZsGbkn/H1T89ic99kiO+r3LH45BU4+0ad5KtNsSxeExcvXmuXjVjw5W3Oj16Ucqx4X+/xv3
 ZvOrOllkr5TdyhS6uPK+XKlhzI/xG2V63hVu+dwdv2lTsqP+XAQA=
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
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
index a7906314ade1..b95c640564e4 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
@@ -402,11 +402,11 @@ imx8qxp_ldb_bridge_mode_valid(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs imx8qxp_ldb_bridge_funcs = {
 	.destroy		= imx8qxp_ldb_bridge_destroy,
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_create_state	= drm_atomic_helper_bridge_create_state,
 	.mode_valid		= imx8qxp_ldb_bridge_mode_valid,
 	.attach			= ldb_bridge_attach_helper,
 	.atomic_check		= imx8qxp_ldb_bridge_atomic_check,
 	.mode_set		= imx8qxp_ldb_bridge_mode_set,
 	.atomic_pre_enable	= imx8qxp_ldb_bridge_atomic_pre_enable,

-- 
2.54.0

