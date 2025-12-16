Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D389B335090
	for <imx@lists.linux.dev>; Tue, 16 Dec 2025 18:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765908036; cv=none; b=Ag/cJzXdg+EQtSEJcPByc4/NVgAkGfvWsvTnrsNZXJw8ofKOwpIVG/Z8fM26x4sbQ+YbfzTilmXswv7fZ/hstmLs430iwI84/YayPiSV7ISsRKcjpY1Hb25YyjiZa0ouMpyxx/zl52J/iTvhO+GIQ4RoYpKnaGX12Wvul//bmj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765908036; c=relaxed/simple;
	bh=4L63hqoCNG6AbiF+QwhhUiXC6gnsQhDeufYRuK7HB6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TT7Y5/qsIfmaaJojnh4Wo1lXvmazpSxugbFOxBtvksvxqFLuh9sDgi/i2bETl4eZFB66ZDKV38Q1vNTJ7PQjJiPrPZ0l2CTiCd9dTp585y+5UBF/ijeZoxGz6GjP9q7CMnMEfiHSHX2T8I4Ab5u0ruCzAowlnMYEj7mC5gRm9ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NygTx0D9; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NygTx0D9"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7AF2F4E419EA;
	Tue, 16 Dec 2025 18:00:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 478E56071C;
	Tue, 16 Dec 2025 18:00:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AA225119A97ED;
	Tue, 16 Dec 2025 19:00:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765908027; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=A5X020FpAKTZsCa95q5LWg2apUbkwZjMVGYaH/Bo+Eg=;
	b=NygTx0D997iRzxX4qtg+VZtGBkAX4ReGEGGEaLIiiNKTHs3Vzk3M89rT7rbc0rJnJ1Dmj1
	52rUcQrPv1rOm7GPIOWBKd4pI0B9DDyKnOlKEBe90WxCmv2qI0Zf+SUIIj1sA4YEikR7mD
	ecNCEArXJbpCFtuEjPjEdlr9gOg+UBXCAMj0DcCoA1zro7RcF1TQBGrodtbrtoxDi6qfTo
	akNHRTJiRcgTqIiIElILj8M1X1+p4mY8YXgtWbG39sQFbfwG7YNDZFPfHuKvCtuIGYdd3C
	esQfeoLQ6zolJKA5r7nRKY7TJJ9lkR3SvqcQ3D98X/ascf4Y34QJb7BEuZvWKw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:47 +0100
Subject: [PATCH v3 14/22] drm/bridge: imx8qxp-pxl2dpi: remove excess error
 message
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-14-b5165fab8058@bootlin.com>
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

imx8qxp_pxl2dpi_find_next_bridge() already emits a DRM_DEV_ERROR() for
every error except -EPROBE_DEFER. The caller emits another one, which is
redundant. Remove the message in the caller and keep the two in
imx8qxp_pxl2dpi_find_next_bridge() as they are more informative about the
error cause.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
index a4941f39a2e6..e03a411cb9db 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c
@@ -415,13 +415,8 @@ static int imx8qxp_pxl2dpi_bridge_probe(struct platform_device *pdev)
 	}
 
 	p2d->next_bridge = imx8qxp_pxl2dpi_find_next_bridge(p2d);
-	if (IS_ERR(p2d->next_bridge)) {
-		ret = PTR_ERR(p2d->next_bridge);
-		if (ret != -EPROBE_DEFER)
-			DRM_DEV_ERROR(dev, "failed to find next bridge: %d\n",
-				      ret);
-		return ret;
-	}
+	if (IS_ERR(p2d->next_bridge))
+		return PTR_ERR(p2d->next_bridge);
 
 	ret = imx8qxp_pxl2dpi_set_pixel_link_sel(p2d);
 	if (ret)

-- 
2.52.0

