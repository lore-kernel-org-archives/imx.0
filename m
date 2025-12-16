Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F2233CEAE
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 18:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765908029; cv=none; b=X8Ra1oxkUMdvMX0ApmSgG8dhaCiTW8QVHf8hdc3wFqy9jyAo7Dgyq5AgWaqsWR+KYw6NFGNXUVcg3mt9PGwYNh5t9uS5P1NhxmtbH3nhQVhJd3BuClWunnXZfAZGkEBM6iVeGTes/YH3n/j9/s0dwULu/rdn1fN1SEbfmmZffas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765908029; c=relaxed/simple;
	bh=Ls8aiBKcFOBzWtFd3DkkzErBO6q/73rMtE2ylN2ElNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d97VrE78dQgZTbDI+dZM6+VMVtuc+gpHiEjz4wOqQllGS3j8qt1RLDm3QHIaxBhOVYAWiXozBsGH0tro3+NIHKUq53yYnlvFgeFtTdW3e6T9NRZHuNbOmt5BzybrbvVGWnYehISCFVbT20DZgszy2W/1A/CVi9t1DdMGv9SY+vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rCvbQVcz; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rCvbQVcz"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C50521A2214;
	Tue, 16 Dec 2025 18:00:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 98B486071C;
	Tue, 16 Dec 2025 18:00:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A6D4119A97F9;
	Tue, 16 Dec 2025 19:00:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765908019; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sUZmDVtQVbSET7XgjXwPjJ7VIEIK5vtHf64g0TE1q9M=;
	b=rCvbQVczxnGhgmTN1HwL6qR6TnP1k95+o76okv96c5RV1UAouTbtX8N2sS8WUploHz3t7g
	eqm+UyRcprwzeTG0YSFQKDsKVha60Om0Ypj1s2ObyPskxqpk05MyK46GEXG6I/1or6umEr
	9MogC1PEfZTGxRZiIfsTNBltm1qeoq85g/tA+cNy6DDsod9anJZ0u/kXFboigJojbzHLhc
	0noGPPRQ2mLXDo1EbadMmd6BWtCppqbJMu144jQ4iIQJE3O1mxvaM2bkmWiJ1JAulK8vyT
	JYpaWC7WvRgkwgu0mjSA8zqdvunnkwIUleZZdCc/vJIG5N2x69mvYcHA7PIX4Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:46 +0100
Subject: [PATCH v3 13/22] drm/bridge: imx8qxp-pxl2dpi: simplify put of
 device_node pointers
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-13-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Simplify the error-management code in
imx8qxp_pxl2dpi_get_available_ep_from_port() by using a release action for
the struct device_node pointers.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index 111310acab2c..a4941f39a2e6 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -258,35 +258,28 @@ imx8qxp_pxl2dpi_get_available_ep_from_port(struct imx8qxp_pxl2dpi *p2d,
 static struct drm_bridge *
 imx8qxp_pxl2dpi_find_next_bridge(struct imx8qxp_pxl2dpi *p2d)
 {
-	struct device_node *ep, *remote;
 	struct drm_bridge *next_bridge;
 	int ret;
 
-	ep = imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 1);
+	struct device_node *ep __free(device_node) =
+		imx8qxp_pxl2dpi_get_available_ep_from_port(p2d, 1);
 	if (IS_ERR(ep)) {
 		ret = PTR_ERR(ep);
 		return ERR_PTR(ret);
 	}
 
-	remote = of_graph_get_remote_port_parent(ep);
+	struct device_node *remote __free(device_node) = of_graph_get_remote_port_parent(ep);
 	if (!remote || !of_device_is_available(remote)) {
 		DRM_DEV_ERROR(p2d->dev, "no available remote\n");
-		next_bridge = ERR_PTR(-ENODEV);
-		goto out;
+		return ERR_PTR(-ENODEV);
 	} else if (!of_device_is_available(remote->parent)) {
 		DRM_DEV_ERROR(p2d->dev, "remote parent is not available\n");
-		next_bridge = ERR_PTR(-ENODEV);
-		goto out;
+		return ERR_PTR(-ENODEV);
 	}
 
 	next_bridge = of_drm_find_bridge(remote);
-	if (!next_bridge) {
-		next_bridge = ERR_PTR(-EPROBE_DEFER);
-		goto out;
-	}
-out:
-	of_node_put(remote);
-	of_node_put(ep);
+	if (!next_bridge)
+		return ERR_PTR(-EPROBE_DEFER);
 
 	return next_bridge;
 }

-- 
2.52.0

