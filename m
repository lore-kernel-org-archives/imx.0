Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816613F0760
	for <imx@lists.linux.dev>; Tue, 19 May 2026 10:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187241; cv=none; b=c1fJF8NwZJFdDdWPhxXDh0SII2t1QvMfvCMyGAlwbAKsbktotSNernsyG7/9SRZIvhU2sLc/YdpqZhaDWMEqvDD5Twvc2W8XsHunIBlyK47PuOmQOHikuVcip9ZDP2fOgUxBbEE0HFlvAtiICwD+DoKz2Ii9ti9gahpkWQKilLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187241; c=relaxed/simple;
	bh=TNGJ9RazZrye2pjIVFclKZ8vlYSWHt771Fh/bs6soak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gRMG21NJVgrN/UiYi9sSpx+SoTQw2g5G8fU3siNH4Vn0swAQOMDEG30HWh+XgZULV8cd6478AiRmot/bJfwMIuEa49r2dSFgXMFfwMmTyhx+IPIFdzNWe3hQrPyqkospd5ueC4A93as7a+iUiEAAfq0X3HBjy7jxRsmhXO2eKJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ca/rGiQg; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ca/rGiQg"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6FB0EC2B9E9;
	Tue, 19 May 2026 10:41:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 457F5606E9;
	Tue, 19 May 2026 10:40:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0FFE3107E8AF0;
	Tue, 19 May 2026 12:40:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779187237; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rgVp93a1hHl6rSGJFgiMk/ReFa5XUVMfUAt1b53bH5w=;
	b=Ca/rGiQg938bz1xHEi3N1mdoEG0gO/+dhsaW5WudwhKrLxZKtdJeh/FP46bPv06UUzPkZS
	vw6+d5tFKyw+v3v+BIuKiT6sWzeiR0caRTTKjlTPQar7QH7O90q4l1MSNyR9RdSnwQqkQv
	4rjQB5aiqIWEb8loCgfKmXpxFV58zO0eMmlE0E2VZuKq3/LzS9qV50ID3fnfpBVMnFqyLl
	52CdMOKuiEVQiKOmVLjMoiBvaFte2B0PvLDFy5sVb/8jknXtYuG68CefLmo+aAbnJrHSKo
	qCVuAq2tQVQfvX/Jcm5qdqgcAvInfOU3+zhviS4FEGDwJ5lw7bst0GD43jsSyg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 19 May 2026 12:37:52 +0200
Subject: [PATCH 35/37] drm/bridge: drm_bridge_attach(): don't fail on
 -EPROBE_DEFER
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-drm-bridge-hotplug-v1-35-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
In-Reply-To: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

With bridge hotplug support, when a bridge attach func returns
-EPROBE_DEFER it means the following bridge is not yet connected, but it
could be later on. In this case don't fail the entire attach operation, so
the card can probe (without a connector) and be ready to handle a future
hotplug that completes the pipeline.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 2b539c9749a6..05702ece77c9 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -593,7 +593,7 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 
 	if (bridge->funcs->attach) {
 		ret = bridge->funcs->attach(bridge, encoder, flags);
-		if (ret < 0)
+		if (ret < 0 && ret != -EPROBE_DEFER)
 			goto err_reset_bridge;
 	}
 

-- 
2.54.0

