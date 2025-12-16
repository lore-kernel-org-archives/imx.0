Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5516A2E03E3
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 18:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765908071; cv=none; b=Of4+xREKL1UFHA9fihM6/27TYm+8OTb4bu+t3KniE7eH8VnWTXmUQEWmt5BF88RzNRkIvwCSj9MIQUih8xrdYIt9QxLnZoieXsoMNZXknTLfr471/EjCFVs4+Rc2obHEtQT0C6dLOV+EJUNe0PjVFLzZHIXUbtHsdx/iH4Ufm3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765908071; c=relaxed/simple;
	bh=/ZLyAsPgGAsSeLhmHBY2K6V0IQ/e8ptYCqPq2fpcSQo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HLGIp3lHqpf6w/OhfSN0LyrpzG+aql3+egjlsvIwBwuokIKYNAtK/F25SdULfjDgLthZaYnF/IzbfnpuUuE86FMa5Lna2wuZarE8BpEbVRJ3MbtP7c7R9aoQ56m/3pVVGlWk8Luehn6Iom2WUj3TRxppjbGKwK9GqKabQX6GTus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=K40Qm54C; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="K40Qm54C"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DA5E4C1A582;
	Tue, 16 Dec 2025 18:00:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5824C6071C;
	Tue, 16 Dec 2025 18:01:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 03259119A97F1;
	Tue, 16 Dec 2025 19:00:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765908063; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=q1SQgG8CDgy8pHJUhmPefyNI4mOwi1BDcEiUTUoG2qs=;
	b=K40Qm54C3qdPF1+qLRUL+AfP2p8yAX1aWTb5MdJ5M1M6JIaqfvIKIdfG/XNh3YHiSd1elV
	L/V7oyrMVc+BYvsG2C+wfa+mO6KA+3DGdlxnIHxD6L5WzwsWQsFVRYou5gLS+UJOdLHM6u
	ar6vAMFqbotLZk6bgd/f16073Qir2VWOJBDRGidTy8ulP7z9/SbnP0ocqFgL7Qo1f3zSaJ
	UYj3CLRGAXutCaTsq+fpks/CY68yAu6ds1Wbh4YU5edv1m7qvrZOj0tXnc0gJY+B7F5GnL
	QJ9dtLvpqb3tS7yHZj/CKp8HkftGnPMgAdx/66AqAwoL+eLy5ZT87ZVpe2YFmQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:54 +0100
Subject: [PATCH v3 21/22] drm/bridge: imx8qxp-pixel-link:
 imx8qxp_pixel_link_find_next_bridge: return int, not ERR_PTR
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-21-b5165fab8058@bootlin.com>
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

In preparation for using bridge->next_bridge, we need to ensure that it
will never contain anything but NULL or a valid bridge pointer. Current
code stores an ERR_PTR when imx8qxp_pixel_link_find_next_bridge() errors
out. Instead of fixing that after the facts in the caller, change the
function to internally set pl->next_bridge and just return an int error
value.

No functional changes.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
index 0c5ed06eee1b..91e4f4d55469 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c
@@ -256,8 +256,7 @@ static int imx8qxp_pixel_link_disable_all_controls(struct imx8qxp_pixel_link *pl
 	return imx8qxp_pixel_link_disable_sync(pl);
 }
 
-static struct drm_bridge *
-imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
+static int imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 {
 	struct device_node *np = pl->dev->of_node;
 	struct device_node *port;
@@ -282,7 +281,7 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 
 	if (!found_port) {
 		DRM_DEV_ERROR(pl->dev, "no available output port\n");
-		return ERR_PTR(-ENODEV);
+		return -ENODEV;
 	}
 
 	for (reg = 0; reg < PL_MAX_NEXT_BRIDGES; reg++) {
@@ -300,7 +299,7 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 
 		struct drm_bridge *next_bridge = of_drm_find_bridge(remote);
 		if (!next_bridge)
-			return ERR_PTR(-EPROBE_DEFER);
+			return -EPROBE_DEFER;
 
 		/*
 		 * Select the next bridge with companion PXL2DPI if
@@ -311,8 +310,9 @@ imx8qxp_pixel_link_find_next_bridge(struct imx8qxp_pixel_link *pl)
 	}
 
 	pl->mst_addr = port_id - 1;
+	pl->next_bridge = selected_bridge;
 
-	return selected_bridge;
+	return 0;
 }
 
 static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)
@@ -368,9 +368,9 @@ static int imx8qxp_pixel_link_bridge_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	pl->next_bridge = imx8qxp_pixel_link_find_next_bridge(pl);
-	if (IS_ERR(pl->next_bridge))
-		return PTR_ERR(pl->next_bridge);
+	ret = imx8qxp_pixel_link_find_next_bridge(pl);
+	if (ret)
+		return ret;
 
 	platform_set_drvdata(pdev, pl);
 

-- 
2.52.0

