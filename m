Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7F517332C
	for <imx@lists.linux.dev>; Thu, 14 Nov 2024 16:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731600112; cv=none; b=YhQ5sJESxvGu51TWFfa3Wy0DXdWlG8VQfGIyl02ERaeW2FESYs7gDDlHZpDPPzsGeVbmMhEOjdRJg1WMQdVmPbq/GFnf6311wuHQBQiH2nkTEzIf15M6mqoeWiiUHBYwab3hH0LSwlLYjWbzFT9gKTe949M3ji9M0Y0nLkQF+aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731600112; c=relaxed/simple;
	bh=2p5+br6JIn+rJJ5IqmSnGy2w4CU6wjDoK+kbpSR+fYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NFFpy2X7hYZoLuMgCCVgobcpmD2VxrZRFPiHNedLXNY3LHCtb3zyquN9TzzUGdWkWj0mh6Y1lpfC7YPucEMmB0dSQU0G4VY++V4vC8kx0U0Bx77Q7vaOWj2qhWJnBi2tn+aiyFyeiT18vATANgIZ2ULTXOiouxLeXPdYVaZ0cLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=IhRj/+pj; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="IhRj/+pj"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so7153755e9.3
        for <imx@lists.linux.dev>; Thu, 14 Nov 2024 08:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1731600107; x=1732204907; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v2eGZqhXUh+UAPCtYMe67IF8Tywre6OlhMFZoVB/+W0=;
        b=IhRj/+pjKeqhT0pG+Jna7YI1EONdUvoyWvRAqeVRJbpcQh4Ciry6Ca34DSKchs64MI
         lgswsGvAFuvrhq+qUVtcCfTX634HOh4YIh8G3q2aY/u7EWMq3o2kX1ZwmAE0Qcj9imE2
         V1PlZvCXx9rWyXIH4L+KHvFrhQOmt2fNvKFdLLgZrZ3xKZBmQPRCCDiseNhX2YB3DduR
         QZUMJMX/fcFZnR+lZ0c1lLhzZx0QD2fhDFcttXnwGBLbJ/BinNo8Gkc7NOz5ROLfkMFa
         21W+zNNN5bW2927gqlx7ZmVREjqWKQQ/BkITP+EJ8Mp1MScWvumnYPI0uFHElhRaEK44
         nGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731600107; x=1732204907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v2eGZqhXUh+UAPCtYMe67IF8Tywre6OlhMFZoVB/+W0=;
        b=WHWUxdom7wWFtDNIaZUB/mbJllpidlA1iWfoYZKDq8sUAMgd8RXOzSKxy8+E+mm8pM
         9Ps76KgY8ENA8XI+bNwYM/YesG27kYhy3gtY2u38bi7ROdh27epx/QFXCMob0Or3bZVl
         IPo8ffT8TO5KiyFXi9X8BWoiM/vDissEFvzH+k+p0n41v5LnBB3k3zbi8lJoQy+wV02w
         93RhexD3kBrdAsWMofUYRhHSR/gBIL50CCDqR/wCVDijK6LSleejBIhWRq/wKFQ4+Fhq
         uA/eDENAsSc5KLiM5xN1/L3jFKI7QrKxD59ThAcwcRv3YqaSX8frnJhzBkKMNEAWQ0Yn
         DBjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQA80Qji4nXteEZKYhlOVKqKBPDpuCoOM4Y53oal04spSl8OtdiU9rhFxFkqHIXtn1K3E=@lists.linux.dev
X-Gm-Message-State: AOJu0YwaBeynFJPX5uOKB017xuWSN+d0LGgAW1R2WkEYLZo3QylLLTVF
	0K4XS/RgQDXKG+wxc+Ntg/VmJ8nXBR7ikiuwK9IME5/WWQmny6n4Ep2vNL0I9zg=
X-Google-Smtp-Source: AGHT+IE41nl/kifwf5C3HD2lfOIE9l4CR33KFQ7CwfYgwG7tlg4gz09KKD06z7z6kibfjOlL9Rmy5w==
X-Received: by 2002:a05:6000:1f82:b0:382:222b:1320 with SMTP id ffacd0b85a97d-382222b168dmr586958f8f.22.1731600105381;
        Thu, 14 Nov 2024 08:01:45 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-382200fe00esm1139024f8f.42.2024.11.14.08.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 08:01:45 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 14 Nov 2024 16:01:15 +0000
Subject: [PATCH 3/3] media: i2c: imx290: Add configuration for IMX462
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241114-media-imx290-imx462-v1-3-c538a2e24786@raspberrypi.com>
References: <20241114-media-imx290-imx462-v1-0-c538a2e24786@raspberrypi.com>
In-Reply-To: <20241114-media-imx290-imx462-v1-0-c538a2e24786@raspberrypi.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

IMX462 is the successor to IMX290, and wants very minor
changes to the register setup.

Add the relevant configuration to support it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx290.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index da654deb444a..f1780cc5d7cc 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -170,6 +170,8 @@ enum imx290_model {
 	IMX290_MODEL_IMX290LQR,
 	IMX290_MODEL_IMX290LLR,
 	IMX290_MODEL_IMX327LQR,
+	IMX290_MODEL_IMX462LQR,
+	IMX290_MODEL_IMX462LLR,
 };
 
 struct imx290_model_info {
@@ -316,6 +318,50 @@ static const struct cci_reg_sequence imx290_global_init_settings_290[] = {
 	{ CCI_REG8(0x33b3), 0x04 },
 };
 
+static const struct cci_reg_sequence imx290_global_init_settings_462[] = {
+	{ CCI_REG8(0x300f), 0x00 },
+	{ CCI_REG8(0x3010), 0x21 },
+	{ CCI_REG8(0x3011), 0x02 },
+	{ CCI_REG8(0x3016), 0x09 },
+	{ CCI_REG8(0x3070), 0x02 },
+	{ CCI_REG8(0x3071), 0x11 },
+	{ CCI_REG8(0x309b), 0x10 },
+	{ CCI_REG8(0x309c), 0x22 },
+	{ CCI_REG8(0x30a2), 0x02 },
+	{ CCI_REG8(0x30a6), 0x20 },
+	{ CCI_REG8(0x30a8), 0x20 },
+	{ CCI_REG8(0x30aa), 0x20 },
+	{ CCI_REG8(0x30ac), 0x20 },
+	{ CCI_REG8(0x30b0), 0x43 },
+	{ CCI_REG8(0x3119), 0x9e },
+	{ CCI_REG8(0x311c), 0x1e },
+	{ CCI_REG8(0x311e), 0x08 },
+	{ CCI_REG8(0x3128), 0x05 },
+	{ CCI_REG8(0x313d), 0x83 },
+	{ CCI_REG8(0x3150), 0x03 },
+	{ CCI_REG8(0x317e), 0x00 },
+	{ CCI_REG8(0x32b8), 0x50 },
+	{ CCI_REG8(0x32b9), 0x10 },
+	{ CCI_REG8(0x32ba), 0x00 },
+	{ CCI_REG8(0x32bb), 0x04 },
+	{ CCI_REG8(0x32c8), 0x50 },
+	{ CCI_REG8(0x32c9), 0x10 },
+	{ CCI_REG8(0x32ca), 0x00 },
+	{ CCI_REG8(0x32cb), 0x04 },
+	{ CCI_REG8(0x332c), 0xd3 },
+	{ CCI_REG8(0x332d), 0x10 },
+	{ CCI_REG8(0x332e), 0x0d },
+	{ CCI_REG8(0x3358), 0x06 },
+	{ CCI_REG8(0x3359), 0xe1 },
+	{ CCI_REG8(0x335a), 0x11 },
+	{ CCI_REG8(0x3360), 0x1e },
+	{ CCI_REG8(0x3361), 0x61 },
+	{ CCI_REG8(0x3362), 0x10 },
+	{ CCI_REG8(0x33b0), 0x50 },
+	{ CCI_REG8(0x33b2), 0x1a },
+	{ CCI_REG8(0x33b3), 0x04 },
+};
+
 #define IMX290_NUM_CLK_REGS	2
 static const struct cci_reg_sequence xclk_regs[][IMX290_NUM_CLK_REGS] = {
 	[IMX290_CLK_37_125] = {
@@ -1455,6 +1501,20 @@ static const struct imx290_model_info imx290_models[] = {
 		.max_analog_gain = 98,
 		.name = "imx327",
 	},
+	[IMX290_MODEL_IMX462LQR] = {
+		.colour_variant = IMX290_VARIANT_COLOUR,
+		.init_regs = imx290_global_init_settings_462,
+		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_462),
+		.max_analog_gain = 98,
+		.name = "imx462",
+	},
+	[IMX290_MODEL_IMX462LLR] = {
+		.colour_variant = IMX290_VARIANT_MONO,
+		.init_regs = imx290_global_init_settings_462,
+		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_462),
+		.max_analog_gain = 98,
+		.name = "imx462",
+	},
 };
 
 static int imx290_parse_dt(struct imx290 *imx290)
@@ -1653,6 +1713,12 @@ static const struct of_device_id imx290_of_match[] = {
 	}, {
 		.compatible = "sony,imx327lqr",
 		.data = &imx290_models[IMX290_MODEL_IMX327LQR],
+	}, {
+		.compatible = "sony,imx462lqr",
+		.data = &imx290_models[IMX290_MODEL_IMX462LQR],
+	}, {
+		.compatible = "sony,imx462llr",
+		.data = &imx290_models[IMX290_MODEL_IMX462LLR],
 	},
 	{ /* sentinel */ },
 };

-- 
2.34.1

