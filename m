Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCB023EA94
	for <imx@lists.linux.dev>; Mon, 16 Feb 2026 12:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771245882; cv=none; b=T69GGoyNSIhxw2ZakInbYqrVM8Z1Y4WlvkJsl5zO55YQUCxo8kVyyPB13OJ0RfoS3GfiXhkuOGWerVVMK434HnJ83hKDk2yKvnPFU0wN5KHQjbmir3eWBNUt0Pw0+HL9K/KnnHcPZ8+Esk+SXCcs6Rq+AJLgr1/2J79s1btj6og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771245882; c=relaxed/simple;
	bh=ZESRfmhkNsrAto8yJ05b+J92/Rroj9Vx6YG2JpsdqQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j+ZaHtLaVBHSJ1p6CPPNOg2uo5C4HSVFP6655ieGImyhEZWHcMrTC+aavXn7Om9T3tvG19NFwHO4KLAmCZBzV8+z4OsmtyKsUUQp/Be79j1iojrBZ6tOkd5k5HHiQsUlICxEg3dM6J0jNdNx8sn1FUClFMC+mQgFnzoUgqTgyj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vrxxo-0002kM-ME; Mon, 16 Feb 2026 13:44:32 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Mon, 16 Feb 2026 13:44:30 +0100
Subject: [PATCH 1/2] drm/imx: ipuv3-plane: decouple zpos from plane type
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-drm-imx-underlay-plane-v1-1-2dcbd1fd4ef5@pengutronix.de>
References: <20260216-drm-imx-underlay-plane-v1-0-2dcbd1fd4ef5@pengutronix.de>
In-Reply-To: <20260216-drm-imx-underlay-plane-v1-0-2dcbd1fd4ef5@pengutronix.de>
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

The overlay plane may be placed over or under the primary plane. Using
zpos to determine, if the plane is the primary or overlay plane is not
valid anymore.

Use the plane type for determining the name of the plane in the error
message.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index db50eccea0ca..dfd036f3195e 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
@@ -915,7 +915,7 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 					       type, NULL);
 	if (IS_ERR(ipu_plane)) {
 		DRM_ERROR("failed to allocate and initialize %s plane\n",
-			  zpos ? "overlay" : "primary");
+			  (type == DRM_PLANE_TYPE_PRIMARY) ? "primary" : "overlay");
 		return ipu_plane;
 	}
 
@@ -949,7 +949,7 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 	ret = ipu_plane_get_resources(dev, ipu_plane);
 	if (ret) {
 		DRM_ERROR("failed to get %s plane resources: %pe\n",
-			  zpos ? "overlay" : "primary", &ret);
+			  (type == DRM_PLANE_TYPE_PRIMARY) ? "primary" : "overlay", &ret);
 		return ERR_PTR(ret);
 	}
 

-- 
2.47.3

