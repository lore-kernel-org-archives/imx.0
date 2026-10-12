Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BF443F4BF
	for <imx@lists.linux.dev>; Mon, 12 Oct 2026 07:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789947; cv=none; b=W3wzxIrmJr6lA+Q98QlF5KAbze/h8bjSQpJKaDWDYw8UGhughSRHjq9ne3yQ3tcw6RPlAGuQYAZILoapX1macx4URwPeOOBR/bSA/RQ4SA8IafyR7hNtZJ2qchQ0JBfGJjY2QwU+ImXL5gcg6C+EWNQqW4Kl3PEWRx0Vzh0yzRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789947; c=relaxed/simple;
	bh=JjLidMvr1YDLvezUjQIwYZRPs4jlhVV3DhAMdoV3R6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eQnQmqPpiokyiKpkGl9AXwu7GwyQ+buqxwNksPRj95Y+LlTr0c+TODN1N1qfF0w9b2Ud98nWZQWjdNCWGgXsvl5LGkXHypXySzre2ewjPCdhZZtaccusc4o4/QG/JyEqzAOrIRjqJSIj0irMfyPb7A6mRVBRdu4sxlKABDOSWk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qmy62KWF; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qmy62KWF"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c411d6615so943698f8f.3
        for <imx@lists.linux.dev>; Mon, 12 Oct 2026 00:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791789945; x=1792394745; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GLPVlC+6axKfDRySa5Z7wZIL1eMBWodDTbsl5nbJ71c=;
        b=qmy62KWFn6QAxKs2u8vXj79YBrq72T9alCJ2n+zLdl1HGqSn3czJkRldXDav9dPcW7
         +pD9M46vYrth4PCaj1vykWuahLqsoQnddHrlA5JfgSPsRgj+XD5SaVhDjJkeT7thhfoL
         OFd0c9xTmwTPqXwynf5DEDQXdcWYRuYyMHTAsdXCI9hlJjkd0A7zv+998XQ2xVLaib6Q
         0hmRMdyfgFfrxUaIbwH59kmSWBaJ0zvwitPPUSB3VMduJFn6J/mX61XnzzC91IksdNWT
         09h2j8KIeE6rufrPz+zckifl5VmEWWYR5dPTsW4HsVtoZrCtdI7snJW0B30NIg1YlJY6
         tl4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789945; x=1792394745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GLPVlC+6axKfDRySa5Z7wZIL1eMBWodDTbsl5nbJ71c=;
        b=hOXQNZmyTobDupJ1zRpVYsIrWYTYlUCMfAeLzr5pfjzi3zLo+dpZN1HFedQd0ixLNd
         f8YbHAlY3zqmd45zmAa2VnvJI5fCAG9gcnTidM9qAqGEX6tAI7DIn60h+FVPAWbMtzhd
         Ib0IJEWaQC/dXqhQV8lnvZ992Oi2wKmbTlS3RwTv+PmE1HZcuN93mPYGk3U5TukHudof
         a+RhJTDWPyc5vM0Sk6xyRgwoEcu3KXTqgSmr8rA/wcX/qrxBYKdwuWPLIuXCV0JVO/8f
         l9xY7xOgvoasF5gPJjmQpELSCyLzNy8Hbfgl3ZgrDLQbZk0Xm73o+QPBmJqowsilm3SD
         rtEA==
X-Forwarded-Encrypted: i=1; AKwUvByyd3E9XcwJ/Do3IcwssBLcLqwScJJVQouiFt5JdpUAXssnNqDMDa9dLAMh12PhC47Ka9g=@lists.linux.dev
X-Gm-Message-State: AFq9FYKi63IwPQV23xv7f/QNheJL6KDqqnueNoZjnMFMO/VWPxRqfDWg
	mN9HuDBdVZ+yQxFdWddJaFaByEoWqohan6jgwGgQ3ZoRt98d8W5vPfuo
X-Gm-Gg: AYBFou2uu4S+lLcZJzowkb6qJPYEEwavUor06T4lFaV+SebyH3S7XtgLlOS/LZp1J6N
	YDrInpZlfe2uhFBR5B1z3JOGNmBjofR7m27C0na6Ere3z61NR6Z97yKY394jW8SUeXfEqvCh9UH
	uwW80RwrwCmbWjxdMQBIw1SpoBmr/n8+klJFhb4W83BySS9DEXoHgKPPGZ3qraEGMb2TA5Xj/H4
	NElrOYZ/bfLOYu/jx2dwhmDUtKawg7oJTxPvcXe9k3npXIAcPTZoT3wwMK0k1K5NwhyU6Qv1rE9
	ifSHLH2jmZrPDBe8uoSECbG5vJLKMiSurs4gCPLw2c7WJRlvk7OhacrXkXkl4GVL3XKo6bsl23t
	ZlL5s78VOgkxraGUq8tYZn6JOxv+/bEjXBw1RsTZfUnQz1Sg0sx5djCH2vV+K9XrUzi5rdNvkTn
	JzE37w+0cOvIG61WNTIKcCMRdo8n6kRxabM1DIfNoydZZivUf2LAYbhqPDCq0NDDDyp4+lqZEAV
	2eafFLsfuzvifxOmWu+akAst83gMXx+rwpz8e0VCWgKsrky9joTfqVvcEXiqu348/jgGL9cu0g=
X-Received: by 2002:a05:6000:29c3:b0:48d:c15c:94a5 with SMTP id ffacd0b85a97d-48dc15c964amr8654279f8f.14.1791789944272;
        Mon, 12 Oct 2026 00:25:44 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aadf9bsm17523377f8f.29.2026.10.12.00.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:25:43 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Mon, 12 Oct 2026 04:25:24 -0300
Subject: [PATCH 2/3] drm/bridge: simple-bridge: Add Toradex RGB to VGA DAC
 bridge
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-v1-apalis-imx6-enable-vga-v1-2-8905d8746504@toradex.com>
References: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
In-Reply-To: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791789940; l=1350;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=FKye5mFa3sfDemE79K6SG+Q4irfMpkj0xAlYwYUAH/8=;
 b=4gNcdbAkP/ZiHikm++CidN8Fg36WinGvfqCWvKISeLt6d0w54Kss0AyxWHJbCrRJwOu2/kOcV
 8QKluP6TaXpDlREVlJEhq5mYay7oLM2OaFtIyVnaU7BXUcqtKIeCnLJ
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

The VGA bridge on Apalis iMX6 consists of a simple resistor ladder that
converts a digital 16-bit RGB signal to VGA. The VGA output is gated by
an active-low data-enable signal.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 3fba7002322e..3f88fcdfa214 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -253,6 +253,10 @@ static const struct drm_bridge_timings ti_ths8135_bridge_timings = {
 	.hold_time_ps = 500,
 };
 
+static const struct drm_bridge_timings toradex_apalis_imx6_vga_dac_timings = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
+};
+
 static const struct of_device_id simple_bridge_match[] = {
 	{
 		.compatible = "dumb-vga-dac",
@@ -312,6 +316,12 @@ static const struct of_device_id simple_bridge_match[] = {
 			.timings = &ti_ths8134_bridge_timings,
 			.connector_type = DRM_MODE_CONNECTOR_VGA,
 		},
+	}, {
+		.compatible = "toradex,apalis-imx6-vga-dac",
+		.data = &(const struct simple_bridge_info) {
+			.timings = &toradex_apalis_imx6_vga_dac_timings,
+			.connector_type = DRM_MODE_CONNECTOR_VGA,
+		},
 	},
 	{},
 };

-- 
2.43.0

