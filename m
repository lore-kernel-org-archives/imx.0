Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C143C457F
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 14:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929424; cv=none; b=A643yTHUeLrE6Ra4r3nKzeUfBu0zIiEIkFBn8LPhfvvzQEnQcZ9Pyir0MwAZgsH28cQ1GFVL8O2p2zgmWG62bpDa6ldAeuA+doIa0mrKx7yx2JPiOCSFQ4ZjROUT31CUihiqBqWWdVy8hazzau8wzzxouPR1DB5u6QMvK5j9/aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929424; c=relaxed/simple;
	bh=NEPayvVmX3q7Wj0iTg7FEvUzK//M1H9vGJB08M5p7Hc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YCQ3l1LKFlQyDxTW7s54ABMCEW2EMyo3uzqpfefrlw+ubvIqbfeCSnx44J78EIn4pAX1OMkF14Saa7bYk9ydytHR9yjdsvZbpChGzZeRD69PFmwkXLCD925GTuhe80zvv7aCqiD7HqZ0lkIDe2P3EmoU4wXJP/qxFe+FDeQd2V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EBqKxcsS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EBqKxcsS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186691F00893;
	Mon,  8 Jun 2026 14:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929423;
	bh=gWFWjJHgZiy/GLN2e6ewnZP2ttGIyfRahDWZJrnWXfY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=EBqKxcsSlkaprRmAbhUyDpltht1p7+kiEXNT/mT7clPqtO40oODZgiMH7cKlhvtsz
	 uJtCJ1n+oMaPTG4Ys9yUlNjEYzFnt49qgbibw8K6hq4kLrpVWqKB3CancY7f/5HTfD
	 2Pnt+eM3IOpa7z5PuMxbA8EzMiZAhLs6wj+yLkQDtvJIR3rMGl2loScY6os0eMBUSK
	 DozuV8CGM95iArTqKUweKRlQ4uDAp5zgj9XkqYRERGJkmBRtjG34LegOQBpv1W/Cl+
	 /oNWrmKamP6UmSDs1CLY9w4NRNu42JyoUsUUHKAuMJXWIVKAYR1nVN3nxWp1ysMjuD
	 e9uRlnUeH6iWA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 08 Jun 2026 16:35:56 +0200
Subject: [PATCH v2 14/78] drm/bridge: imx8mp-hdmi-pvi: Switch to
 atomic_create_state
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-drm-no-more-bridge-reset-v2-14-0a91018bf886@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1699; i=mripard@kernel.org;
 h=from:subject:message-id; bh=NEPayvVmX3q7Wj0iTg7FEvUzK//M1H9vGJB08M5p7Hc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFlql70vly32//oqaccaw6hv02dnzrTSPeEqVd9ul3qLn
 7H191+BjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjARxSWMDStWJTCWTClskpke
 mG794XnBtae7ri65ebj5trvlKo9eNlW3JeIuu09qXFx//Mvf2avL1zPWhwdE3mMMrlqmybAu82/
 oiff3NLr+/bQPeyZ7LuemoG/OQtX+JsVu0xmNGrZHK806A9cAAA==
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
 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
index 7d5fda7173e5..a31d4fc76f35 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
@@ -129,11 +129,11 @@ static const struct drm_bridge_funcs imx_hdmi_pvi_bridge_funcs = {
 	.atomic_enable	= imx8mp_hdmi_pvi_bridge_enable,
 	.atomic_disable	= imx8mp_hdmi_pvi_bridge_disable,
 	.atomic_get_input_bus_fmts = imx8mp_hdmi_pvi_bridge_get_input_bus_fmts,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
-	.atomic_reset = drm_atomic_helper_bridge_reset,
+	.atomic_create_state = drm_atomic_helper_bridge_create_state,
 };
 
 static int imx8mp_hdmi_pvi_probe(struct platform_device *pdev)
 {
 	struct device_node *remote;

-- 
2.54.0

