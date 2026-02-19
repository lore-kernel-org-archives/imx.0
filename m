Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0284376026
	for <imx@lists.linux.dev>; Thu, 19 Feb 2026 11:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771500790; cv=none; b=V4T51eX8Osq9nigUEgiI0KNHKCg0vF//G72cfv5rCh1m0qA157/ZPIWZJQg612qPeTln/ls6goqQcYB0cSNhc9dvX+orIM9imlt/uu/Jzbt71vMk5GZiAWYKtOYastxzauTRbSS8wIUcflbvDLWPzR9A5sgC21msIqQYS5QwZXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771500790; c=relaxed/simple;
	bh=+cY9dYsqhUioAZiKlRjxjZmznxwCvUuQqsP/2E9G68w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B5mApuAsoH7SqpAK5NmrBwskQsi4eTxCD7AFF2HbcNr7vUeasVr38mK5klB3g8CnVESknb69OzQh/f7CVnihXPIFz38OqiFHlLaDmVC6s6dsUyyawi6lB4vtzymXnBBOWrgS0FLmj4LCnZuaUCxslU+v84xUgPRzq4EuAreUpJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vt2HH-0003qW-FA; Thu, 19 Feb 2026 12:33:03 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Thu, 19 Feb 2026 12:32:57 +0100
Subject: [PATCH v2 1/2] drm/imx: ipuv3-plane: decouple zpos from plane type
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-drm-imx-underlay-plane-v2-1-26ef829c5483@pengutronix.de>
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

The overlay plane may be placed over or under the primary plane. Using
zpos to determine, if the plane is the primary or overlay plane is not
valid anymore.

Use the plane type for determining the name of the plane in the error
message.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes in v2:
- none
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

