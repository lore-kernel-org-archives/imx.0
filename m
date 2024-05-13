Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A759154423
	for <imx@lists.linux.dev>; Mon, 13 May 2024 15:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715614315; cv=none; b=bxLiePC+qfMJKnDCcRwMOOpC0PVpjub1NFyfuMUZp2kue+0tm9HQ3B6nPJxs/B2B1Tsp+2WjwfAZdIbUwjswA8lDsN/P7iolm4ptIlloWm0aK4/FcJZqXs6ISxSefcQwDaprkLdC/oR5Zy4QKClQD8Yxgb23zMzVpxFUy8XdDIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715614315; c=relaxed/simple;
	bh=79qO2f8ErfI2K2BnvSLXJZrJZYqIjf/h6xk4raeb/zw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I/711qAXrsYvLEAdnt2Xa5xfSgHXRrKEGgnlCJEC/MF/d6MYNb2bLx/lcoKyKkkFEvIpmMY+NZffsK5LowZA/X7mhgLy/mISokHdvZvIGywfsk4rzUC7T8Wf0f1e73+8B7hVNqu+E0BotBz3wDZM/IKoIjEVMvmL9ATNSb6n7vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=HOvXUUet; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="HOvXUUet"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1715614312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pFZX1uDvGmBtMyw/S8v8p9QmHUEdeRp0zFB8va4XH2c=;
	b=HOvXUUetk9gvZRfqTaRI7mpSz5LIpqqijgy22p34EWy4MzsolWIoK8LDSANL5K1+QUxNbU
	WxjgLY7unARSb+M/NFK+CxDfPIipr9HEBA+dR3N/+dOtJ2ol09Hru+b9jha1/vE1smIfM+
	ae5yT0gq5grA08BtC+/fYh5EXmkrlcM=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Liu Ying <victor.liu@nxp.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Sui Jingfeng <sui.jingfeng@linux.dev>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 10/12] drm/bridge: lt9611uxc: Remove a redundant check on existence of bridge->encoder
Date: Mon, 13 May 2024 23:31:07 +0800
Message-ID: <20240513153109.46786-11-sui.jingfeng@linux.dev>
In-Reply-To: <20240513153109.46786-1-sui.jingfeng@linux.dev>
References: <20240513153109.46786-1-sui.jingfeng@linux.dev>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

In the lt9611uxc_connector_init() function, the check on the existence
of bridge->encoder is not necessary, as it has already been checked in
the drm_bridge_attach() function. And the check on the drm bridge core
happens before check in the implementation. Hence, it is guaranteed that
the .encoder member of the struct drm_bridge is not NULL when
lt9611uxc_connector_init() function get called.

Remove the redundant checking codes "if (!bridge->encoder) { ... }".

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index ab702471f3ab..f864c033ba81 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -337,11 +337,6 @@ static int lt9611uxc_connector_init(struct drm_bridge *bridge, struct lt9611uxc
 {
 	int ret;
 
-	if (!bridge->encoder) {
-		DRM_ERROR("Parent encoder object not found");
-		return -ENODEV;
-	}
-
 	lt9611uxc->connector.polled = DRM_CONNECTOR_POLL_HPD;
 
 	drm_connector_helper_add(&lt9611uxc->connector,
-- 
2.43.0

