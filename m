Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD5A153BC5
	for <imx@lists.linux.dev>; Mon, 13 May 2024 15:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715614302; cv=none; b=dPBEzKy0Q+xwyuwG0CdNcZD1wHiESV8iFn53qrlSqQlWUfXoWF8hhVNlSoUt8c0mJRLVIwcrHS6tlDrgE23CvlEds3qRJxB3IHSgtyQIqy/BGGtjEvZ1L1DbYtA7IASSn6pT4p+sHmqgGHQIOVffKwTkb8KPrSH/nbrwgc4eY9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715614302; c=relaxed/simple;
	bh=lnqw1YTHyaD5vTzvWJEUqngsLI3DDxbgjrRrlUhJypM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KlKl3XQDvOcr6VhrCDTyjdbJicYEz3clI8poWr5JwHUB76mNSp9BrooiWrHHTmhXdpL7g1JKQ8WqfjURnHCmiaTWIGxbsIMVW+s6N68g57D4aujEnoN4DLaxO+vgEUudcckX/B8Qktotl43BZYfo4BRhLSopLlD4cWATwP5HCQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DrUk8JYN; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DrUk8JYN"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1715614299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LGJqJECahkwNkaZ/cGV67QeDc8nXZjPhmnwOmMDzO3M=;
	b=DrUk8JYNcWvrAlPWGbKZ5vymd+/ZTLOLrTm+IESf6ZAkLPN8sjXypzROs9T1GaPvu9cZek
	kT48XheRlnJJSwe86kbdejo7BdYhAMAR6lsT/ZMAEG1y3QB8VLVUy3Cs5znhiSGDlzLzRA
	Fd7poJ1Duj8us1n0DLskdDHmVok2voA=
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
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 06/12] drm/bridge: adv7511: Remove a redundant check on existence of bridge->encoder
Date: Mon, 13 May 2024 23:31:03 +0800
Message-ID: <20240513153109.46786-7-sui.jingfeng@linux.dev>
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

In the adv7511_connector_init() function, the check on the existence of
bridge->encoder is not necessary. As it has already been checked in the
drm_bridge_attach() which happens prior to the adv7511_bridge_attach()
get called. Also note that the adv7511_connector_init() is only called by
adv7511_bridge_attach(). Hence, it is guaranteed that the .encoder member
of the drm_bridge instance is not NULL when adv7511_connector_init() get
called.

Remove the redundant checking codes "if (!bridge->encoder) { ... }".

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index dd21b81bd28f..6089b0bb9321 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -877,11 +877,6 @@ static int adv7511_connector_init(struct adv7511 *adv)
 	struct drm_bridge *bridge = &adv->bridge;
 	int ret;
 
-	if (!bridge->encoder) {
-		DRM_ERROR("Parent encoder object not found");
-		return -ENODEV;
-	}
-
 	if (adv->i2c_main->irq)
 		adv->connector.polled = DRM_CONNECTOR_POLL_HPD;
 	else
-- 
2.43.0

