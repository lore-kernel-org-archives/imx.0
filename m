Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464B034A76B
	for <imx@lists.linux.dev>; Sun, 19 Apr 2026 12:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776601317; cv=none; b=QAdZRsglUkmKT2tyzmQ/9Sj4mPr3XLc7anJr7gXfj/0GCZo4PFfx3KM8jAqRGhu5hUJSIhJOS1s05ThAuPD1Ld+hNRR+tancmlM6ym3PgW5RRgP292RUMZOXP0haoyCCYHRxBmp/QZyQgb9/mVZ0oD34YOZR6MiD8hA1l/7nnJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776601317; c=relaxed/simple;
	bh=nmgKREmCWZiDkKASZtmRc2MVHkFKpfUbB1epmq3XSBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ihT2YLAr14foc3hz7r8AUC37X2KQRKBhrAllBI92GFyMigK/j4Aw+B1s0giVi5W1HlzTmsP4qW1Gxsh6LbzWQRMp2e7FW4A44yxM3/0lx/Xvzd9L4HldYycF5pDQ4U3AB9Nie2QLoT5+QAbQ53BTzAlpptEgKdRy3GGfwxyr43U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=piLoCgNE; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="piLoCgNE"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82f6b592fc7so964765b3a.3
        for <imx@lists.linux.dev>; Sun, 19 Apr 2026 05:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776601316; x=1777206116; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pmWG7OM2EB7RxxwskQ0/zeTI1Kmre4JByGl1ksiUCqU=;
        b=piLoCgNElgXhQomcfYWqZp73Ie6CQGWNblKVccJUHD4dox4G3LHrNNnqKF1I027lRo
         U/7YGLOnloX3dY9WZGvCCLIeDY+KUZs9tq5oNrbRoVcnAJ8s6qApV2YbQm//wUj7uYQc
         hy6uIocR5LvIT95U12s16HJj/U+/gRL+ZrKYWKqNckZQgFxLe5eIhN2TjEQ0CsRXzJqz
         miaUo4wij6ohsvjNh65hu/qtWgWH020q3m+0L/VFJzLCc7qforJErecydWVoCduH7m57
         luib8PEBY1bO7QP6xz5taNAAOZavuwkqU5Txw2IXQBbkq7SSfZzXb0SneaEvaq/SQOoq
         EAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776601316; x=1777206116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmWG7OM2EB7RxxwskQ0/zeTI1Kmre4JByGl1ksiUCqU=;
        b=GCLIIgUim/5bilj851Ihe9LUwZTwmjgOpqztIlTrMbPbqmoHgBxZIVIzpMtjBnDtyw
         PxbtO1Vt2lg4XR5zMHexdyaCDFvoIEjByRfNNyXibXlcYm9ZKxc1vHslXUAbr8dqwAnX
         uS8j00aM3DGtIrPzxtBw40hYZAu1kaT+ZJ1Rxcog+FiS2U4CGcrNfNr2euhfhMJz3q0G
         OoQR8isTbVysicOtg8BkOEpMmRCsBKfF9pC4nwcl/tSyOIL5yDGy24+CjlCWBTInA9jN
         ntq827PqbQOaXW3vIyyFb6zLbpDAjlsV1glE8PdEZI/VTEPvQYFZ+0Rxwg2xzACVPbA3
         C3KQ==
X-Forwarded-Encrypted: i=1; AFNElJ8jF955okbhKq+hIsAS9ka6Z3ibcrP8W+xD9xqHYS8+KRhdc5hGqi8PfT09SJIjbXoICS4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmBwfYfEVX0LXQ0huNOIz4Ina3XKLvLIVOqU2ZxcxP1L0iqKjJ
	QI1NkUyPtpaFEgH1opXctpXnB047M1iWIuwrSVDmVE41SQXmbIa4GgMA
X-Gm-Gg: AeBDieuvju9VPC36hwDMsNoyldw/3EuHelXeB7KKCj8rSiADR0YEyw8avKPrXsZ0gEA
	cJB/g0ds3wGNfu1rzPq1nRMwT1vrIxpiSydDDz9ZSw4DcTvs+EVrxpFV96ygEe7deboqs9kJh26
	hBM/TTCjnpfbOvSuOiQvy98y4KGf310GtBvuaWNuJCjMiYtCJF6PVjoygbG56MgeM1ESyAi/7UD
	3nsEINs4ZITCfjwG9ucU2wDEFGu+XfqSjsD39+gPhJAz1W67cisHOOag/MIpn7ZbOWux3ONqyDT
	fTU8mDeD6TefhCG68yD89zFcgCmsy1Gdll9M+xpP5YB3PQ5RZ6Dr1cOcC6Pj69XGJaNIAwJYJoQ
	HZxp90t8aUlY5t4tAWG2Xp5tqJ1pAVRhjMfr/83689iyGAg4m1bF/HnGMdxPs3bLipVMn4E/FBA
	jLsnN8HcUOzQlV7H1qPLaYEwZEcbu6vWcf
X-Received: by 2002:a05:6a00:2d8d:b0:82f:1d38:f68f with SMTP id d2e1a72fcca58-82f8c8bee86mr10893475b3a.31.1776601315542;
        Sun, 19 Apr 2026 05:21:55 -0700 (PDT)
Received: from lgs.. ([2408:8417:d50:4775:fc0:88de:ed15:556b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9d2fa9sm7700034b3a.16.2026.04.19.05.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 05:21:55 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/bridge: imx8qxp-pxl2dpi: avoid of_node_put() on ERR_PTR()
Date: Sun, 19 Apr 2026 20:21:34 +0800
Message-ID: <20260419122134.97529-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx8qxp_pxl2dpi_get_available_ep_from_port() may return ERR_PTR(-ENODEV)
or ERR_PTR(-EINVAL). imx8qxp_pxl2dpi_find_next_bridge() stores that
value in a __free(device_node) variable and then immediately checks
IS_ERR(ep).

On the error path, returning from the function triggers the cleanup
handler for __free(device_node). Since the device_node cleanup helper
only checks for NULL before calling of_node_put(), this results in
of_node_put(ERR_PTR(...)), which may lead to an invalid kobject_put()
dereference and crash the kernel.

Fix it by avoiding __free(device_node) for the endpoint pointer and
releasing it explicitly after obtaining the remote port parent.

This issue was found by a custom static analysis tool.

Fixes: ceea3f7806a10 ("drm/bridge: imx8qxp-pxl2dpi: simplify put of device_node pointers")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index 441fd32dc91c..3610ca94a8e6 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -264,12 +264,15 @@ imx8qxp_pxl2dpi_get_available_ep_from_port(struct imx8qxp_pxl2dpi *p2d,
 
 static int imx8qxp_pxl2dpi_find_next_bridge(struct imx8qxp_pxl2dpi *p2d)
 {
-	struct device_node *ep __free(device_node) =
-		imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 1);
+	struct device_node *ep;
+
+	ep = imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 1);
 	if (IS_ERR(ep))
 		return PTR_ERR(ep);
 
 	struct device_node *remote __free(device_node) = of_graph_get_remote_port_parent(ep);
+	of_node_put(ep);
+
 	if (!remote || !of_device_is_available(remote)) {
 		DRM_DEV_ERROR(p2d->dev, "no available remote\n");
 		return -ENODEV;
-- 
2.43.0

