Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A942D0603
	for <imx@lists.linux.dev>; Sat, 30 May 2026 14:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780149631; cv=none; b=W8wSxncwhUuBeaeiM0NNYrbmwM8+OKUCBC2joDsgE5KeznWQlcfIydkByntE3JQV1alDDyVi2ggkJz50Ec/VpiBYcytLZjb7g5VWi4J+V70Y+fTZVj2ZuWH21PAZsjGapjL9ToP4zSxAig6WF9pHaCNcZcKXtg6dCSSRjla1cmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780149631; c=relaxed/simple;
	bh=d3rCqUKZT2IUZy7bzmRCNhqe3IeP3K8HIreIawQKmsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BL9GikR96bqEPSMesOE/uo8jhEP83slx7rXi9g1O9VgIonFxlsiGWYeuuABBSjDGaU7ZzRecbxyr6sj/pgNRoWVVgl+3It9HHNDn8bSjnsYGU44Qz73pMCwMjvuQ50GVu62/xwEOjerJJGEvmAPnVk2tmD6jlDvMsq3083cs0ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aMpq0HMO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aMpq0HMO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B611F00893;
	Sat, 30 May 2026 14:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780149630;
	bh=yB1+RpmDuOVXPx0/xN0Fzr5pQ8zAM+wHKh1xmiCRGVQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=aMpq0HMOkBuKXHI3O9aQQhp2Bfsu/B/mqmLQK5tcF3Kb5b1nWg+hcyLC+Y01MrH3x
	 0Uvxx+dJRP6vsxl+WxIOhLcXlpvagoNy6dyZGejkmfV6gym/mWiBA5lzYycrQyok0J
	 g0tGaIhqMk6Ng5omalj0L7s5f7JZ2D1L0HlMtR70+i2sCmq7y0gLYD9JF/Zg76UnYB
	 MWJXKWc37ArfluD407NFlFeOvi22v7ati9pBFfdmdLjxb2Okn+xukuYFY2Gw4wQi0Y
	 PHCnwLdTzYLtqp8BGOAFn/75J1U9kYf1Tc00xTRACxbQnEyq3DIZA/IOYgtJObcpMI
	 q02hVkZqIhDCg==
From: Maxime Ripard <mripard@kernel.org>
Date: Sat, 30 May 2026 15:59:18 +0200
Subject: [PATCH 13/76] drm/bridge: imx8qm-ldb: Switch to
 atomic_create_state
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-drm-no-more-bridge-reset-v1-13-875d828d31bc@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583; i=mripard@kernel.org;
 h=from:subject:message-id; bh=d3rCqUKZT2IUZy7bzmRCNhqe3IeP3K8HIreIawQKmsU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlSb611LLbY7s8Rmf9sxYOVk3W2PV8Q/5slwq+ZYdbPj
 vwz4de/dExlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJCAQz1tlJLv/xcbLDnv++
 S65uvRYi+vvjtdrXfacWVC7Zf0Ph+OKUU1IPrbnez9JIYq46p18f1sNYK7gxXdC4k9WC7XxlxOG
 XXL1+M37+bji/7kyvQV/P04BzAb1VTHcr1a88c8o7fDm+3lcPAA==
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

