Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034DA4D9557
	for <imx@lists.linux.dev>; Mon, 19 Oct 2026 10:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405244; cv=none; b=WW7tDqdSwAYnbrtLa0o3DC7JBMYDFRJgxrzEh/S4SooYweKB+2v8gckQDIKpl2x6JCKzBqjHrWGd/b3h3eAVDDqtm+8YGcQcnPEoiWVZAamOoXGi3UESzy3qeLNHiwXhqTWBmUReexch74cy30/yCFLIjShwNOFTWbB8Klym9vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405244; c=relaxed/simple;
	bh=9EMRcKreP4doQsnkOJ6fF7O/xO+9vD1EZaaP/H+owrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KXUMd4BJoImdawrvOjMexfeEWUmD8la3Hkjsat5F+4CTVLbEk67APkppGAZGxWo079hWKOD+oJHtf8Rq7zQNPJdk+TssndWR5qGTJJD3REQ25NjgoNI2FVwkCNvTO4NdnG1JKTctljY+ca7HRDgDdVlp8HDxZYVbOUPuMxZCtkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FUMCtrCJ; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUMCtrCJ"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15354aa70e8so646117c88.1
        for <imx@lists.linux.dev>; Mon, 19 Oct 2026 03:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405242; x=1793010042; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wG/mmn2fERUKjshAXPMhmIVjTkfUkF1Vhr38NpDvKtE=;
        b=FUMCtrCJLygrAAXHiLo3uwvFcZOkj9Gz5rG+hImu5dIOaWUwFVENK5PXDGf85ncJUM
         1A+X+elg6v3j9CgpedCf1fBKbctuLWcE+uKx6SaOtudT+SwEh1V5uZlSfgmoo59nKZ5l
         x6/4mmx5wt7Ts+BrvyThZNHIo2DyxH47+KztSRxlBU3cNXF0xfHwU9DPRSc5XE+pn9Sh
         riGQq8nHR0BBkOwyCZHsmOz7EdDZ/WSXfRLVMT7PWzFGqNl4w4EEiH/LWrLmmJ3UOQ5c
         La8eoFh5y4NqwOI1jxDPnpP9nPjHZMUdEnHFB5rpCEXRcREiFX5ZIWpWu+ckPfc8fVKi
         Y10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405242; x=1793010042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wG/mmn2fERUKjshAXPMhmIVjTkfUkF1Vhr38NpDvKtE=;
        b=w7R2T+VQLX7yWDTViY52I5bPo7ZJz+mug78gnpgz0Jy99s4rmU6YsQxF78bc9icAqr
         1c2lCIBWlXm9gIkmaEiw/XtP8RyD1whKMIqKxY/eEhaUtv7SwdkQSyLhWh+uUGie33f0
         GaB7TtFd6xyK/47s4kyKh+gAtJCv2Js+ZOwiLAGNxo+sBsNsRNWFqkbcLGmQF8IN51cM
         y4+ExK+pokEdZVmVshWWd4/9B1VNadZQtQoME1nUTWuITFLnyMgt5V7wthrSLFa9r3hY
         K1HT/iyDPxZCt5EY20Mw1yTeOPLlZNRMzijot1jpOD/H362+mrqs2qaNjdFCtd5Q6P4p
         YFYA==
X-Forwarded-Encrypted: i=1; AKwUvBwitMDgXFxvfKow7P5IHPU9Kx7sg88OohDWuYXvxHy1Bi/4P7fZwX2sUOIPCN8qKHbUeio=@lists.linux.dev
X-Gm-Message-State: AFq9FYJoCGn9Dd0lLrNzkBEpsJ+OcLGBoZV6vFJCgq2mqFmaEtePQWzX
	z3iGmQMqRtVLFsF3ub8BbtBWTf3ma74N/20nOKzLNeU6sKfnxpTC0Z6Y
X-Gm-Gg: AYBFou2moY/CqW9SdjYta/jXXkXZOF6z91ldPx0fH+qJBZ6boPPNyTPHMM4ENfpP50F
	8eOw1xKl2uqC9SYUihTh4r9URmzutvfyi956wFpbbKc8/J0l1hJzio4MnLdOdaOOWpX6RA+VNAf
	txc2S8TGrZYwd4WLOuKwX5dCSpue2mSSyPSaYRUqeg8/+0xX1Uxai1EygyUBeiT7zbmy2ufHBFp
	LC/0bQzh3DzbilH4o0bEMpNnbMotxPVDs6jHZYtRPIpqnBrY0M/GG6Mp1dB0VR2hCseCPvGseJO
	Wo7V5sprydqREOF/uRscHw8FfJDo/1Lr9VpbByXZ5LOQpcW7+WlVvbUvCn9sPfZQFaZhMghJaLI
	EJjxUzBS86DmfDjdpSyc/io8jVqL8QuxKeZNZlOnR708l4OXdVOTsy75V75J+XxEGvm3sjnPeXh
	AK2p7oqz5hOLVKQHoyQltsdd7ovVdwtR3zSqApr4zGSpAME9KEecH9+MJiVCgT6XmMbpqULNUqA
	M9ugQevJGHHfg==
X-Received: by 2002:a05:701b:424d:10b0:13b:4ab5:41d7 with SMTP id a92af1059eb24-1850c9cf427mr12119481c88.3.1792405241814;
        Mon, 19 Oct 2026 03:20:41 -0700 (PDT)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18319d3b880sm26324251c88.10.2026.10.19.03.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:20:41 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Mon, 19 Oct 2026 07:17:15 -0300
Subject: [PATCH v2 2/3] drm/bridge: simple-bridge: Support
 data-enable-active endpoint property
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-v2-apalis-imx6-enable-vga-v2-2-ef6a3a780472@toradex.com>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
In-Reply-To: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792405217; l=2075;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=/IjtTShiJA+F9KmNWlJJNMy2lTKWTky2io3jmPVXXVA=;
 b=wT8coFssfadnbio6KHmF1yBAZdfjcW8j5Ftd+0jWUjv7dcyReSTM5NiEs8ga+Dm7iSM19YUzq
 JsnS98IOb0zBMI8LksAaaJsn7t3ABSIdTS+heHkDqYkDHVufmMApZIH
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Some simple bridges, such as a resistor ladder DAC, may include a
data-enable input that must be driven at a specific polarity.

Read the data-enable-active property from the input endpoint and fill
the bridge's input bus flags accordingly, so the upstream encoder drives
DE with the required polarity. The property is applied only if the
bridge doesn't provide its own timings struct.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 848c2df2a276..c5301295658a 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -183,6 +183,9 @@ static int simple_bridge_probe(struct platform_device *pdev)
 {
 	struct simple_bridge *sbridge;
 	struct device_node *remote;
+	struct device_node *ep;
+	bool de_present;
+	u32 de;
 
 	sbridge = devm_drm_bridge_alloc(&pdev->dev, struct simple_bridge,
 					bridge, &simple_bridge_bridge_funcs);
@@ -220,10 +223,26 @@ static int simple_bridge_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(sbridge->enable),
 				     "Unable to retrieve enable GPIO\n");
 
-	/* Register the bridge. */
 	sbridge->bridge.of_node = pdev->dev.of_node;
 	sbridge->bridge.timings = sbridge->info->timings;
 
+	ep = of_graph_get_endpoint_by_regs(pdev->dev.of_node, 0, -1);
+	de_present = !of_property_read_u32(ep, "data-enable-active", &de);
+	of_node_put(ep);
+
+	if (de_present && !sbridge->bridge.timings) {
+		struct drm_bridge_timings *timings;
+
+		timings = devm_kzalloc(&pdev->dev, sizeof(*timings), GFP_KERNEL);
+		if (!timings)
+			return -ENOMEM;
+
+		timings->input_bus_flags = de ? DRM_BUS_FLAG_DE_HIGH :
+						DRM_BUS_FLAG_DE_LOW;
+		sbridge->bridge.timings = timings;
+	}
+
+	/* Register the bridge. */
 	return devm_drm_bridge_add(&pdev->dev, &sbridge->bridge);
 }
 

-- 
2.43.0

