Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E6C3D3CF4
	for <imx@lists.linux.dev>; Thu,  7 May 2026 10:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778148527; cv=none; b=mpOWRFtRqIvKJ/Yu+6YnQUb2gGe0T799R1Cfeu05lFZlCMbfhIyv/p9Nq8DvWpM/z6JdVWYChmRF6YlQ6Uu9mh71vJ+Q4OEyTw3sJSjxDghPe8HUV7y+DTYlQlUvtePSK8k9PIshJSmuUCl8/+yhbDdsRBAVxBgEI8ByLkUr4wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778148527; c=relaxed/simple;
	bh=sW1pkhQalveqOxhHkFt5QmsQqGRnLmYPsxwediic4l0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QNSeBGjmXm7FU/VDtrOqCKFgDM8G+UtWbqgaiHYgxDCCIfx99JPTPwRcTx+hSPGY0BPPZ7jt6LLU42F/xI4mKhri0wDnlfoT4ZWUmVbDhiCX2BaTK9xF1qOtHVs2VhxM5fVtWFjyfXb2xLVS7Y+14ZLrQbcUMawXhKClAUd59cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ba8fEegr; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ba8fEegr"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-824c9da9928so243653b3a.3
        for <imx@lists.linux.dev>; Thu, 07 May 2026 03:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778148526; x=1778753326; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lca9GgtebxHSmlkPkYgy6Y8kn+w8BgkxfJ8muffjImk=;
        b=ba8fEegrn6avMCykST3ToxF2OQAKCvoUdR95yxxZ9m8QHGmVAi4a+6Z22pumMTaj5i
         Qrt3h4LTY7Wmh5S/Ag/K7wv0gLbJxjZ0d5WuNlFeQNMUIuzbFFhOUqHWO312BnzLP6pM
         L9N9E2Jbi2l8xLg+egZGRDlw/e4VXJNQfHPKQbK1hExrEpw0UYKr5+z9WoP10xsXUNNi
         qkUhyIVL0K2WbNWv8LKgt3i2mofyrA9vSBKXFPnhuml446+DrD8y78ZvfQM2a1br64TE
         QC0FDJjliB+XCVc3luNz0L/yWDS6Qup0pdgqTnAo2MF6mOPtGzW84kxEUkc6wM9aaRUn
         mi0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778148526; x=1778753326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lca9GgtebxHSmlkPkYgy6Y8kn+w8BgkxfJ8muffjImk=;
        b=JthttJYwP/4ikRTUAWlIa/ocduz2c7O7bYGe0eSb7NqI+eeXJK0MxRbelJXonSnt7W
         hNjFRBkYzMNZwYt5w34TkWow/cUiNJCG3OtOGGqAs3VmK8PMjV2WXldCUnDcBG2TyobU
         cIXBxFIxLewl33OOQlsWomja4ShzInNloyistm9G+aq1imskKB4rxsPdCX1ql0sxetJo
         irwRcrnxY0XK+tNdkHMPm00kkRnDH7kEdYzFv4sq1p2Q/IrUfw8Ru68DzxYLOMPRGXg8
         0LjdXapCbtktj1Q0y/oSNGH7yhPOkllX1AmPtWqOzNC3yRWWJsOgSuR365xpjDhV87Vp
         skJA==
X-Forwarded-Encrypted: i=1; AFNElJ8rMo+ICehSclR+0NVe/mDKgN0dcylCVuo+PY07wKxN7JDFfErF+1MXqDAlov8hRzwQQbU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKRf9iYkxvVda//0h0wyS1X9Qc9AES1w7CE1gktr2/nI+ZfoRe
	T+N/WPuVdoptwUiPldmyVHqGRY4IeeJQyWmAAJCslI6My6YOkfU70Sgv
X-Gm-Gg: AeBDievYCu8Oa18jxVGRT/eI2+AIEMsHs3rHB4vFROmAfIEp7MNu0I0kVyUvKsu2ryE
	6vYw5+6E/IOTBLfdcthFsxnczks6ZBtq2XSNBXkG5mb/GsjR/RXlu4sVFcbODns6NziGl0s2Ie0
	41niK7j1ty3nFc6ebgNiPq9sN81a9SjBr0+Te7v3OvzhQJ4OTxZdsO6Yg4kd1rCmintIpMGogGz
	1qpvXNFS2XFqed5Knp04KkCFSfV9QeUK1bPqkAm1DRC2UhlE66ShFwjXI3ok4cwA3Cw7e9FkYeT
	zSc/bkN2TtefiJI39EnWEeiFxQ1yTMQDrIoNjILarKNt4DohWlz4dgP7U0H/uwNz63vmPH1rWJw
	E8Fl/pYFSA9RfGp4CMYb4uggHa1+f/mTnmyPnAbJz7oQgPobKqbB4a7+lvxUNoTHEwiYs0Sskml
	PLFT/MU1wbHigeoz+X
X-Received: by 2002:a05:6a00:22d5:b0:82a:f02:7355 with SMTP id d2e1a72fcca58-83a5d387595mr7014546b3a.32.1778148525580;
        Thu, 07 May 2026 03:08:45 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d38ab5sm10162541b3a.26.2026.05.07.03.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 03:08:45 -0700 (PDT)
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
Subject: [PATCH v7] drm/bridge: imx8qxp-pxl2dpi: avoid ERR_PTR with device_node cleanup
Date: Thu,  7 May 2026 18:06:03 +0800
Message-ID: <20260507100604.667731-1-lgs201920130244@gmail.com>
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
argument to NULL so callers hold either NULL on error paths or a valid
device_node pointer on successful path.

Fixes: ceea3f7806a10 ("drm/bridge: imx8qxp-pxl2dpi: simplify put of device_node pointers")
Cc: stable@vger.kernel.org
Reviewed-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v7:
  - Rephrase the commit message sentence about output argument
    initialization as suggested by Liu Ying.
  - Drop the unnecessary sentence about keeping explicit of_node_put()
    usage.
  - Add Liu Ying's Reviewed-by tag.
  - No code changes.

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

