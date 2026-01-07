Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38800314A7A
	for <imx@lists.linux.dev>; Wed,  7 Jan 2026 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767779827; cv=none; b=YvY7r33PYR7bC2fvRa5iALe/FPCbHNREjrUpGQF+ZK7BsFVd/A6xXmHubXsjYp7VWmmjC/64EhOLh9++2xDbmSlGDMM9cRyS1Qw7C2vTdu/O+wEvRZiXYaI2CgwcEuA0mw1gniOdd8aJjhsaFYCpfq8HhYSxflpacDl+tx8OBMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767779827; c=relaxed/simple;
	bh=6YMFOfmuSq3yW3iH3wEBrwE8lB6eeWtB5qNfvfcf7i8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d60kiPlTYhnLgMQhagjfVjnOZ1VfjMSK79SPy6j54Q0OAKfdYpRdYb0wCA2ShjEYg6DaDcLNYn7OEliX9VlR//rUxFlmvbxvaUVUKydpy0WGV6ec0hoFpLKoLVYbD5liCQmgRv6SzIXv5CATSTIjAFmZBHpzs+a71xMmj9iSRyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rYnPVNBL; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rYnPVNBL"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E60371A26E2;
	Wed,  7 Jan 2026 09:57:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B9C0960734;
	Wed,  7 Jan 2026 09:57:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5FDB7103C8715;
	Wed,  7 Jan 2026 10:57:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767779822; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kg0Uw3LRVfNHDM/aCR6pFV93DPSIETQ7K2PCrzE/Fng=;
	b=rYnPVNBLZYpCqpKk3jfP1C3fIOxJbc/uPxJX55MAzfCVcUAF77Qrt4M2/TvzAWre2/cnZH
	MxSmRRIqTSTX6PhkXPJTIJ8jqIWDdsUFh0TyORZ+P11SCsV6OieT7s06IFrjYOhcwH0WqT
	zFM5Td2WtFhW55sH6IcW/tbGANs+v/ULB233DgjC3N2leYIMVdxel4qyZ8EcSO3kTpaAER
	B7yhRtvSuFGf1e3hLaOCINZuZuwY6NuOEN/ISSUfkbhNjFGJrvY2ygzdAMjVA465fVAXT4
	77PvsXWkeC6vngnMed0PIEotNVrEGjwp07xyB0OoE/aohRu2/6pAEIJ8MzAT/w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Jan 2026 10:56:28 +0100
Subject: [PATCH v4 3/4] drm/bridge: imx8qxp-pixel-link:
 imx8qxp_pixel_link_find_next_bridge: return int, not ERR_PTR
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-3-a62b4399a6bf@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com>
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-v4-0-a62b4399a6bf@bootlin.com>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
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

Reviewed-by: Maxime Ripard <mripard@kernel.org>
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

