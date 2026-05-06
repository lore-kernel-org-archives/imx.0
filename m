Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8DE47ECEF
	for <imx@lists.linux.dev>; Wed,  6 May 2026 14:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778077528; cv=none; b=XLY94W53L/6CWsEHkn8KnVCitdr9Ydr9UnUqDeeNr7+EoxgGR0MDuMlzjFDUhhQMw7tMDP2e4xGUxmkGDMqPrpgOOOpkPCM/lT3l3Tm3xyMrdrH8nToAu9tPPnsb7y2Ips+8wGZ7T76cl8WNjfoAGv3DxybrRmqcn8UdL4LapKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778077528; c=relaxed/simple;
	bh=ypW9zan1ZQyE9puGZfL3DZyP3JwWjNKtGOLLk3bVaI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KcCYmK9c94YoklQopjLmoY15CMipE7bkzUubyYpFI7Z9oqc30+yM5gL0LttKQOmorMunVujHnGODhyA72Cl/Vy7m3NCRYXdrX7iXO/k3s7ICbvfxGB67a+uqXg+ctGwvItd8jUFe6CGGZNhxDRixHDPhTHpLU6jdfl1JTzAdItI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRg0+AT+; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRg0+AT+"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3658ff4d34dso977030a91.3
        for <imx@lists.linux.dev>; Wed, 06 May 2026 07:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778077527; x=1778682327; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYpMO9UsirEzCSyLpg3GfIDUOtIlMUjHtSOkANbDsUc=;
        b=dRg0+AT+UmkaBrgYms9CFO8l3EtuYWW//ObNodT2+rNQQRkp0yFImqedNoH0xdF5kT
         MkPNbdAilKvWOm2z7CC8pU6MoXhw3hm9sUp9x2rK9qSaLddYrfpwNcSQK32bDEZ5a/13
         C4zKVTRPpvAfPJ29JIPqNMHqlTTYs74LYRKtYQqk0psvL+BKHqJTkfkEqXBlFDbfSIC3
         0GyQeOAl0c/BRwhtIe7eOXHKpG6WbMJ00VsQxGt+c98Tal4Y0VJChrlhD75Nr+H5Yicy
         z1TEh4bsA0EmMp5nnWqNknENjzQbLAPObmZ25SUyIgncs37CIHqB8J6ISlPE4lAeoTDL
         KT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778077527; x=1778682327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYpMO9UsirEzCSyLpg3GfIDUOtIlMUjHtSOkANbDsUc=;
        b=Z/4GBIB3NiOimJPlXpCW9lHJZVcz10rUxbpD2VpC3Dd8aB6LNOnylayDHa1SWwsChw
         X84qik2u+7Tx6YpQsrRWoFtlgpmDXXTazWhzSxIotCxihJRczVdeDi8gEyR/cN8mrAqe
         WuiApTRD+aFtdURj3m4Aq8vw9Hn2RDYqE8+3Ndf4EJhzUsAQ8vweaUvLnaXlKNWjunA+
         X8RYznM9F9ATBVdstWVCemLLPXgUeuq1JuueUEnt8sqks8eWYbAUce++1sYs9Xm9Ov9l
         14wUc5BXLYMJ3kkmQoNZO0dY+RbmIuHnfIBnV0AsdlPAqa6qL0u+rRXKE8ZL0aw/75v1
         4JlA==
X-Forwarded-Encrypted: i=1; AFNElJ+If4cIiqNscVCp87UFfDboabt5bL1EkKYUmS4pLv7V2+A9HxniOctJn4bFtcoi0eiT8iw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqlKIbZ7NcWFU8T/D74ZR6t6frxNSivClRQDuNdRrem4er4lfe
	YEzSmtPtWMedEPjkyn1P0obju7VTu0Lq9I/zd+K+Bg7whJ2A44DIJLsh
X-Gm-Gg: AeBDies0iToiTp6wbrk1+JN0ZA5qHQPUuFIX/WggNbdE4zWp1Yl44So3w3nKEHnfzgW
	TTXynF9xbbjOoCV2qkTNTQ6Kl41q1valEa2ndk4Tjwjk44MqSOi0zLm+gKaBixhcKgl1l/Y0ePN
	12H9LquEMPUO4nCrKOXJDHjPMNc3yIX2GVHSdNIFUmjP+/C/0fybZDgZPxL5yHvOld/uKF+KOMp
	8+P4jKPhdAgEoHYtMOPS5zO07cPpxy8+4qC7DPTkvvyQ2lP0Y4kM6dRDq2wQxgGnDAjIMVBI6ml
	tiEa+EDXGVX04zY48FjS+fglvK7ISFlYWRJAE7X1Txp6twUYUaAyVfy/D7luO9Iqb77zoqe2/26
	VMUxyjGhZcw0rfkXQVulBy5CBjgg5vQUhJsFzNhs+7Ml2VZXgbDrmuywfBIc9e7FdZ7XR6HcJ0v
	H92z81J6Trid8Ty8H4ClPaoYvJ
X-Received: by 2002:a17:90b:4d90:b0:365:b93a:1ebc with SMTP id 98e67ed59e1d1-365b93a1fe0mr2522723a91.3.1778077526592;
        Wed, 06 May 2026 07:25:26 -0700 (PDT)
Received: from lgs.. ([152.32.214.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b08fb3fdsm1118066a91.8.2026.05.06.07.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 07:25:26 -0700 (PDT)
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
Subject: [PATCH v6] drm/bridge: imx8qxp-pxl2dpi: avoid ERR_PTR with device_node cleanup
Date: Wed,  6 May 2026 22:24:34 +0800
Message-ID: <20260506142434.643523-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx8qxp_pxl2dpi_get_available_ep_from_port() returns ERR_PTR()
on errors. imx8qxp_pxl2dpi_find_next_bridge() stores its return
value in a __free(device_node) variable before checking IS_ERR().
When the function returns on the error path, the cleanup action calls
of_node_put() on the ERR_PTR() value.

Do not let a device_node cleanup variable hold error pointers. Change
imx8qxp_pxl2dpi_get_available_ep_from_port() to return an int and pass
the endpoint node through an output argument. Initialize the output
argument to NULL so callers using cleanup variables hold either NULL or
a valid device_node pointer on error paths.

Keep explicit of_node_put() usage in the helper and in
imx8qxp_pxl2dpi_set_pixel_link_sel() so the fix avoids adding more
cleanup action usage there.

Fixes: ceea3f7806a10 ("drm/bridge: imx8qxp-pxl2dpi: simplify put of device_node pointers")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v6:
  - Change imx8qxp_pxl2dpi_get_available_ep_from_port() to return int
    and pass the endpoint through an output argument.
  - Keep using __free(device_node) in imx8qxp_pxl2dpi_find_next_bridge().
  - Keep ep initialized to NULL in imx8qxp_pxl2dpi_find_next_bridge()
    to satisfy the __free pointer initialization requirement.
  - Do not add cleanup action usage in
    imx8qxp_pxl2dpi_get_available_ep_from_port() or
    imx8qxp_pxl2dpi_set_pixel_link_sel().

v5:
  - Make the fix minimal for stable by avoiding __free(device_node)
    for the endpoint node in imx8qxp_pxl2dpi_find_next_bridge().
  - Keep imx8qxp_pxl2dpi_get_available_ep_from_port() unchanged.
  - Do not change imx8qxp_pxl2dpi_set_pixel_link_sel().
  - Drop Frank's Reviewed-by tag due to the implementation change.

v4:
  - Drop the sentence mentioning the custom static analysis tool.
  - Add Frank's Reviewed-by tag.
  - No functional code changes.

v3:
  - Do not change DEFINE_FREE(device_node, ...).
  - Fix the driver pattern by making
    imx8qxp_pxl2dpi_get_available_ep_from_port() return an int and
    pass the endpoint via an output argument.
  - Update both callers so __free(device_node) never holds ERR_PTR().

v2:
  - Fix DEFINE_FREE(device_node, ...) directly.

 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 40 +++++++++++---------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index 441fd32dc91c..d64e328bf542 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -222,52 +222,58 @@ static const struct drm_bridge_funcs imx8qxp_pxl2dpi_bridge_funcs = {
 			imx8qxp_pxl2dpi_bridge_atomic_get_output_bus_fmts,
 };
 
-static struct device_node *
+static int
 imx8qxp_pxl2dpi_get_available_ep_from_port(struct imx8qxp_pxl2dpi *p2d,
-					   u32 port_id)
+					   u32 port_id,
+					   struct device_node **ep)
 {
-	struct device_node *port, *ep;
+	struct device_node *port;
+	int ret = 0;
 	int ep_cnt;
 
+	*ep = NULL;
+
 	port = of_graph_get_port_by_id(p2d->dev->of_node, port_id);
 	if (!port) {
 		DRM_DEV_ERROR(p2d->dev, "failed to get port@%u\n", port_id);
-		return ERR_PTR(-ENODEV);
+		return -ENODEV;
 	}
 
 	ep_cnt = of_get_available_child_count(port);
 	if (ep_cnt == 0) {
 		DRM_DEV_ERROR(p2d->dev, "no available endpoints of port@%u\n",
 			      port_id);
-		ep = ERR_PTR(-ENODEV);
+		ret = -ENODEV;
 		goto out;
 	} else if (ep_cnt > 1) {
 		DRM_DEV_ERROR(p2d->dev,
 			      "invalid available endpoints of port@%u\n",
 			      port_id);
-		ep = ERR_PTR(-EINVAL);
+		ret = -EINVAL;
 		goto out;
 	}
 
-	ep = of_get_next_available_child(port, NULL);
-	if (!ep) {
+	*ep = of_get_next_available_child(port, NULL);
+	if (!*ep) {
 		DRM_DEV_ERROR(p2d->dev,
 			      "failed to get available endpoint of port@%u\n",
 			      port_id);
-		ep = ERR_PTR(-ENODEV);
+		ret = -ENODEV;
 		goto out;
 	}
 out:
 	of_node_put(port);
-	return ep;
+	return ret;
 }
 
 static int imx8qxp_pxl2dpi_find_next_bridge(struct imx8qxp_pxl2dpi *p2d)
 {
-	struct device_node *ep __free(device_node) =
-		imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 1);
-	if (IS_ERR(ep))
-		return PTR_ERR(ep);
+	struct device_node *ep __free(device_node) = NULL;
+	int ret;
+
+	ret = imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 1, &ep);
+	if (ret)
+		return ret;
 
 	struct device_node *remote __free(device_node) = of_graph_get_remote_port_parent(ep);
 	if (!remote || !of_device_is_available(remote)) {
@@ -291,9 +297,9 @@ static int imx8qxp_pxl2dpi_set_pixel_link_sel(struct imx8qxp_pxl2dpi *p2d)
 	struct of_endpoint endpoint;
 	int ret;
 
-	ep = imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 0);
-	if (IS_ERR(ep))
-		return PTR_ERR(ep);
+	ret = imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 0, &ep);
+	if (ret)
+		return ret;
 
 	ret = of_graph_parse_endpoint(ep, &endpoint);
 	if (ret) {
-- 
2.43.0

