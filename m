Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBCA23E35F
	for <imx@lists.linux.dev>; Mon, 16 Feb 2026 12:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771245882; cv=none; b=V0paTu6jU65fIYnCstKNR97UnXyI7qRhj85mS3Yo1KiWKEOQtLcNOaBtC7Z55jQ7WrUAni3tMhryC3HzCGVfp3TtManHIje4FHEGyJrtSWUxKy3z4AzTbIdNPhVhjSC3wq6rPZpypPWWX9d50PtbjdyhS4cDDe5KH2tJI3+zRMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771245882; c=relaxed/simple;
	bh=y1Jjm0W9wFRGc5O7Of53U3ItByzeWijz/L2qCXXXa6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G+XwwBOZiGLSl6SaxOBEwHVoWJMEa40IabmvjhshAjgsQxAbGmoPkyDhAaDcHvfpHjU/WVniQDZeNoMCoTRL6oJwHXZYsoNljFp6R6BeOboll+jQ0Aft5Whve2M+zOo86zK4Y0q4sznzCItmPY6heZf8vM0hsGkEIvP7jV+87p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vrxxo-0002kM-Nu; Mon, 16 Feb 2026 13:44:32 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Mon, 16 Feb 2026 13:44:31 +0100
Subject: [PATCH 2/2] drm/imx: ipuv3-plane: support underlay plane
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-drm-imx-underlay-plane-v1-2-2dcbd1fd4ef5@pengutronix.de>
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

The IPUv3 overlay plane may be placed over or under the primary plane.
Use an immutable position of 1 for the primary plane and a mutable
position including 0 and 2 for the overlay plane, to allow placing the
overlay plane over and under the primary plane.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
index dfd036f3195e..ddad5ea92aad 100644
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
@@ -928,12 +928,14 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
 	else
 		drm_plane_helper_add(&ipu_plane->base, &ipu_plane_helper_funcs);
 
-	if (dp == IPU_DP_FLOW_SYNC_BG || dp == IPU_DP_FLOW_SYNC_FG)
-		ret = drm_plane_create_zpos_property(&ipu_plane->base, zpos, 0,
-						     1);
+	if ((dp == IPU_DP_FLOW_SYNC_BG || dp == IPU_DP_FLOW_SYNC_FG) &&
+	    type != DRM_PLANE_TYPE_PRIMARY)
+		ret = drm_plane_create_zpos_property(&ipu_plane->base,
+						     primary_zpos + 1, 0,
+						     primary_zpos + 1);
 	else
 		ret = drm_plane_create_zpos_immutable_property(&ipu_plane->base,
-							       0);
+							       primary_zpos);
 	if (ret)
 		return ERR_PTR(ret);
 

-- 
2.47.3

