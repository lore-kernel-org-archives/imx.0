Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CA91A9F91
	for <imx@lists.linux.dev>; Thu, 19 Feb 2026 11:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771500790; cv=none; b=WNDf4oSMPH1Y4myAKuEMHqg/8Kv9EKqV+LHPPSU5biITixpiuMw0gYhlWgSNlDbXdCbBRuVc7MgRhs/p9cv6vaq4cFBsDSKaMOKLfZG/BntPz4zTsaMg/A8p7+Wd9GBfnQwhoJKc5npxlkPw771rmKTwO56tM+0aiSaabHn9sTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771500790; c=relaxed/simple;
	bh=adz+5RtASqa82JM26DvzsnQGS19Y81bE9rZbxieAcCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JEo2S3oIYy2+FWy29M7zuUcud+f5EH+MAmIjIIKyS8CiBANO06HMRWI4PWaFeL8C8XJZ1e34ywJIEBgcf+V5HrtUrgq6geLyfIVWDtR78S8+SqQyfTB1WyYIuMpJ/JK64w785fYm08dsdZFiUB41yPv1AoUbi57v2h4WGoIi9LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vt2HH-0003qW-HA; Thu, 19 Feb 2026 12:33:03 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Thu, 19 Feb 2026 12:32:58 +0100
Subject: [PATCH v2 2/2] drm/imx: ipuv3-plane: support underlay plane
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-drm-imx-underlay-plane-v2-2-26ef829c5483@pengutronix.de>
References: <20260219-drm-imx-underlay-plane-v2-0-26ef829c5483@pengutronix.de>
In-Reply-To: <20260219-drm-imx-underlay-plane-v2-0-26ef829c5483@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

The IPUv3 overlay plane may be placed over or under the primary plane.

Set the zpos of the primary to an immutable position of 1 to have the
possibility to place the other plane underneath it.

Set the zpos of other planes (the overlay plane) to a mutable value
between 0 (the lowest possible value of a zpos) and directly above the
primary plane with the latter being the default.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes in v2:
- Simplify and remove duplicate check for primary plane
- Rephrase commit message
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index dfd036f3195e..f078235ed07b 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -890,7 +890,7 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 {
 	struct ipu_plane *ipu_plane;
 	const uint64_t *modifiers = ipu_format_modifiers;
-	unsigned int zpos = (type == DRM_PLANE_TYPE_PRIMARY) ? 0 : 1;
+	unsigned int primary_zpos = 1;
 	unsigned int format_count;
 	const uint32_t *formats;
 	int ret;
@@ -923,17 +923,16 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 	ipu_plane->dma = dma;
 	ipu_plane->dp_flow = dp;
 
-	if (type == DRM_PLANE_TYPE_PRIMARY)
+	if (type == DRM_PLANE_TYPE_PRIMARY) {
 		drm_plane_helper_add(&ipu_plane->base, &ipu_primary_plane_helper_funcs);
-	else
-		drm_plane_helper_add(&ipu_plane->base, &ipu_plane_helper_funcs);
-
-	if (dp == IPU_DP_FLOW_SYNC_BG || dp == IPU_DP_FLOW_SYNC_FG)
-		ret = drm_plane_create_zpos_property(&ipu_plane->base, zpos, 0,
-						     1);
-	else
 		ret = drm_plane_create_zpos_immutable_property(&ipu_plane->base,
-							       0);
+							       primary_zpos);
+	} else {
+		drm_plane_helper_add(&ipu_plane->base, &ipu_plane_helper_funcs);
+		ret = drm_plane_create_zpos_property(&ipu_plane->base,
+						     primary_zpos + 1, 0,
+						     primary_zpos + 1);
+	}
 	if (ret)
 		return ERR_PTR(ret);
 

-- 
2.47.3

