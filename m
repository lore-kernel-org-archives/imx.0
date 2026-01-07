Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4D2321434
	for <imx@lists.linux.dev>; Wed,  7 Jan 2026 13:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767791637; cv=none; b=Kr9RITM69W5ugOtYn+zhZTJYT2AYclttCVPmrq9d4iUGrtl/opZ1e5VAfLymcrmvM639K8c0U/PmJmXPQKPRBEekqHqfZS2/6zmiLNb0OYN8yJFpiAksigDVxE++A09exF4r7ok5kaP2XF+qnZjKc0GSq5EzmX4ljR0yM5yYMbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767791637; c=relaxed/simple;
	bh=2acva3QvhirY/Awmcv14/578UVxJt/0aRF2JcBofHDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hgH5YZKon/suTQEGoDvKAqmvaalK8fJdgHwmS09Yt5W/nwO246xtieuf/OLl+mtVfnZD5UNb2Ya3fuDc+44FFCfhKRwIVSbdtJrru35M3hRyAvcXgn+fT0IIV1h4/q5olhKPkbkAQF+6+FzUxxE5FSGhX3dMPzL9Szlgfk6aGio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=L0SIzw5k; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="L0SIzw5k"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5A31F4E41FDE;
	Wed,  7 Jan 2026 13:13:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 29940606F8;
	Wed,  7 Jan 2026 13:13:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F73F103C873F;
	Wed,  7 Jan 2026 14:13:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767791632; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qxmr7vM/jwGirSwMeq4WdaicpNgRO2FGaKWk62MTu1M=;
	b=L0SIzw5k7u6JAHytKJPzU7WgNINDDB3QeeAi7+p2ziLebUwJsAjRM8AzHRYFI6vkoFGJgS
	920nXcpfRZsPxj4NLhXOvkCO5YsaIyaooEekSgCgrK+egpFcLm0SNoXAXLxHE29NTkk31d
	o9OJUCvEa4orTXW6dU6q1FV7Pt6xV4RpRLA0zb7zt/mISUUWsZgyO0HMlmzMm9fiVA8M9O
	UYR4dLSyQp5LDOjmz1EkbFmCQqEm8S0Nq5Z+FXzMtBeuv8az31ka4FOpbKXbFueW0MRcB0
	aHbWS1woRpf2D5GQerqzztubRvzl3M5qujPLvZbn4GMt4brem/4oBt1Ico21mg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 07 Jan 2026 14:12:57 +0100
Subject: [PATCH 06/12] drm/bridge: tpd12s015: convert to
 of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-6-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Philippe Cornu <philippe.cornu@st.com>, benjamin.gaignard@linaro.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

of_drm_find_bridge() is deprecated. Move to its replacement
of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
is put when done by using the drm_bridge::next_bridge pointer.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/ti-tpd12s015.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-tpd12s015.c b/drivers/gpu/drm/bridge/ti-tpd12s015.c
index dcf686c4e73d..136e47ad1a10 100644
--- a/drivers/gpu/drm/bridge/ti-tpd12s015.c
+++ b/drivers/gpu/drm/bridge/ti-tpd12s015.c
@@ -28,8 +28,6 @@ struct tpd12s015_device {
 	struct gpio_desc *ls_oe_gpio;
 	struct gpio_desc *hpd_gpio;
 	int hpd_irq;
-
-	struct drm_bridge *next_bridge;
 };
 
 static inline struct tpd12s015_device *to_tpd12s015(struct drm_bridge *bridge)
@@ -47,7 +45,7 @@ static int tpd12s015_attach(struct drm_bridge *bridge,
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
 		return -EINVAL;
 
-	ret = drm_bridge_attach(encoder, tpd->next_bridge,
+	ret = drm_bridge_attach(encoder, tpd->bridge.next_bridge,
 				bridge, flags);
 	if (ret < 0)
 		return ret;
@@ -138,10 +136,10 @@ static int tpd12s015_probe(struct platform_device *pdev)
 	if (!node)
 		return -ENODEV;
 
-	tpd->next_bridge = of_drm_find_bridge(node);
+	tpd->bridge.next_bridge = of_drm_find_and_get_bridge(node);
 	of_node_put(node);
 
-	if (!tpd->next_bridge)
+	if (!tpd->bridge.next_bridge)
 		return -EPROBE_DEFER;
 
 	/* Get the control and HPD GPIOs. */

-- 
2.52.0

