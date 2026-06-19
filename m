Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6A2367B87
	for <imx@lists.linux.dev>; Fri, 19 Jun 2026 12:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781871928; cv=none; b=DXkcehEyqT833ownaCVJgB+acxcy4ON9H4nQPorg0ZymFkk63oNqi1Xds9S41d+8sZS9XxrEoFoCWP8WT5UZJlB5Y6yfO2FjgSKF1M3+hcwQHefSSwLvZwNkkye8StT1EwdpyY8cdwPTNNiBdtqHixpkYRDwmtzm6MEZcFHdhyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781871928; c=relaxed/simple;
	bh=wjlYAMQ0816CmqxLnh1/cBbgnPBxXYFILb5tBzVM0mA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rnYDiAE9I6K58+kcIo6B0/KqITG4v+7Dty6E2sNDYAAb4esEUKhrIujWN1Elt+hCxZKlukag2rhsx2tSeQVnwZJWjiDYY/dbGNAs7ByZg/u+6vnu1eWsM8OPnNntku32OHdy7Y5f0XMgrzTtYNmeexfwWFcKfit4wKPC+MJ03f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BPd4lKs5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BPd4lKs5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C99E1F00A3A;
	Fri, 19 Jun 2026 12:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781871927;
	bh=+c2r7dNM15im2LD04088f8JMWsRhU9zCkqjjBX8x294=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BPd4lKs5DslOzX6WcvSvArPw37XlUdozCOdZ/Z2jzc+hOVVKokBuTVcuu5s57hx1k
	 1TKlPjg3JDYuqrGJ04tMLZh/3NgqmShb2tg/EBAekkPcN88Lpo7Bi9Lgs4Lgw011SL
	 9lMVjlMklyXcLJcrKjb54Cb+35Rxm55khCuAQb/DuqnRT8Q7Zr84IvN2IP6rEqhdAU
	 Wu8Mx8yBGMzLud7TX21WtO/jiZN5jwt5lU47OwOfESOmXIS6uD4c7NKmXsTly+wR68
	 6PU+MORSbYbOKhQhGbYAN0iluhuGNtWYuypW0c2WpER6H1jYA9ryPYoo/O4oF2E1FZ
	 yNQ3oEKp5CQFg==
From: Maxime Ripard <mripard@kernel.org>
Date: Fri, 19 Jun 2026 14:24:20 +0200
Subject: [PATCH v3 15/78] drm/bridge: imx8qm-ldb: Switch to
 atomic_create_state
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-drm-no-more-bridge-reset-v3-15-ff399263111b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1734; i=mripard@kernel.org;
 h=from:subject:message-id; bh=wjlYAMQ0816CmqxLnh1/cBbgnPBxXYFILb5tBzVM0mA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFmmJh/8U7Q5N3UsWGNxV6BuR3lRg3KhrYldOvOkLVXa0
 e95ry/vmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABNR/cnYsO6gpMBzEZuwq0of
 k9knPlfbXPp1m8uCGX65VjkTXwRlRbBGp/JP3v7cKl1WkDOu8e4BxoYP3yf46S7hllvzJ/1P+Sz
 JYyslJU3nL/o3h/2xcYWLR+wqx66rbVm9y1YasfsaGFXPPg8A
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The drm_bridge_funcs.atomic_reset callback and its
drm_atomic_helper_bridge_reset() helper are deprecated.

Switch to the atomic_create_state callback and its
drm_atomic_helper_bridge_create_state() counterpart.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
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
index a6ca4f5c6cc6..5884af991547 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
@@ -387,11 +387,11 @@ imx8qm_ldb_bridge_mode_valid(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs imx8qm_ldb_bridge_funcs = {
 	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset		= drm_atomic_helper_bridge_reset,
+	.atomic_create_state	= drm_atomic_helper_bridge_create_state,
 	.mode_valid		= imx8qm_ldb_bridge_mode_valid,
 	.attach			= ldb_bridge_attach_helper,
 	.atomic_check		= imx8qm_ldb_bridge_atomic_check,
 	.mode_set		= imx8qm_ldb_bridge_mode_set,
 	.atomic_enable		= imx8qm_ldb_bridge_atomic_enable,

-- 
2.54.0

