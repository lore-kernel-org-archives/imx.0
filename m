Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D359B13B288
	for <imx@lists.linux.dev>; Thu, 14 Nov 2024 16:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731600108; cv=none; b=CzYggc2lw9HXYIzdsmNTiP9mfdKC8QhAXl6ZMAdky8SoXRP6MYuZDLBnZWg3+12Uqb0A4izDlfInzwjBPEG1yrKop3U6x+2Ls+erawk+BQrUXMTcxv7jb/yWjMOwzi4pWV+8jkeAJvIKRzgPQJBRPiNwWvIb6CHZ48vqZHZUacc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731600108; c=relaxed/simple;
	bh=RgRcDTZ0cd2d3Z1miPXnLWTGyap0Y17dAsHzTAg8FY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A4A0VoT4vmWAh3TeJpT756i5WF3OV4+5LM3faIl0U7ZeLafq3lwZ/Kf+Yqi9iyvAuukJHGSBznd0nWFhMrRpElC/0LynFYct+u53SKKCfEjI1WOp+3uv8X5xJZd81dHN2/r+sF9/ButIVAhVIjd+r9Gp5PEUEUEGNhxcqWTd0Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=t5sW2ywD; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="t5sW2ywD"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53da07b78dfso857750e87.0
        for <imx@lists.linux.dev>; Thu, 14 Nov 2024 08:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1731600104; x=1732204904; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T7c9J9xmOBZy0E+gA1j8HfGDniMhcLFy7E+lLxJu1Tw=;
        b=t5sW2ywDZVHTEwPXusylv+tJsV6eBBo9hSpqgVhRPQC4ECCwoIze8mKMOGJei5F9zZ
         1YAh4G97JQNWOiRivZEm6CBlZuhwkczu83EraTsXir4HkvxjBowe/Q5xTzQrYrVRZrpT
         QamfM/SMzg0ECo5N1RUMawDBAszK2WgH+aCjNzgTETG5kM/lC24vjl74bHKW5AY9JCcS
         RPapfbx3csVWFgKggZwOeWE8tmq3+cyW9yBpN5Yn0fGyoQ9RvLo/U6f/DnJp/feMPT2c
         yv1FN0EAc1wMaKPvGJ4vV5WI1u+dVCA4z1ykJwRKf4fxCpaQeeCWdaV2paIVdSlkYqe8
         qxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731600104; x=1732204904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7c9J9xmOBZy0E+gA1j8HfGDniMhcLFy7E+lLxJu1Tw=;
        b=V/XY+Ie3OdCAQHE12vcy9UJZ+flOYuqgKLcGapDPlVZqgK4hJJyKTKQHLfzeozrNBj
         8MeBrQG1LFxnGmVAwzz8BfegQ6h9bFlGTj3lUdZ82T3kcGmlAUvhCs89uktyOJp6vRNT
         CiKrMm9nz3gI5uaLYglp6HmEUzUfOvVZ1YYnFrVPsRB21kbWAeIAn4seSVfUVfONXXTK
         xHLHPYwVaOg2ckJBE08+DvmSGo2v/0gi3jicfdTyotUch2DxAYougKU0DhNMvS04w5FF
         MudOMwWvhXtilZs+O6EtA/6FyV95PZs0QcKJa1jWvYzYPA5efINROYK/dt6JcNgXqlkz
         n3uw==
X-Forwarded-Encrypted: i=1; AJvYcCVEuenmLuZjiXO/7YPP15oh/hWv8RyyU9RBxZ2P+06u+gLuEUCM0BkVf1sCM8Yh+mNTwVI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXo2U/JB+rGdzGxXAOxxsKQYMKCwR4hs/ZHKjQUDV0F3oPR5H7
	z+weQOfcXBcYdj9Yu8DZG6HNM1x7vTxXJfDVQLf3n7VgA7XR7jtwjEzHKRnep0g=
X-Google-Smtp-Source: AGHT+IH2B2O4sDgX4PQFuQz83D5q69hXTp9OqNeMo5HRiiv9F39wpipZ5EJMNQCetw5Zzb0qXWSGxQ==
X-Received: by 2002:a05:6512:3b1f:b0:539:f807:ad93 with SMTP id 2adb3069b0e04-53d9feddd90mr4485395e87.38.1731600103640;
        Thu, 14 Nov 2024 08:01:43 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-382200fe00esm1139024f8f.42.2024.11.14.08.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 08:01:43 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 14 Nov 2024 16:01:13 +0000
Subject: [PATCH 1/3] media: i2c: imx290: Limit analogue gain according to
 module
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241114-media-imx290-imx462-v1-1-c538a2e24786@raspberrypi.com>
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

The imx327 only supports up to 29.4dB of analogue gain, vs
the imx290 going up to 30dB. Both are in 0.3dB steps.

As we now have model specific config, fix this mismatch,
and delete the comment referencing it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx290.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index ee698c99001d..da654deb444a 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -176,6 +176,7 @@ struct imx290_model_info {
 	enum imx290_colour_variant colour_variant;
 	const struct cci_reg_sequence *init_regs;
 	size_t init_regs_num;
+	unsigned int max_analog_gain;
 	const char *name;
 };
 
@@ -876,14 +877,10 @@ static int imx290_ctrl_init(struct imx290 *imx290)
 	 * up to 72.0dB (240) add further digital gain. Limit the range to
 	 * analog gain only, support for digital gain can be added separately
 	 * if needed.
-	 *
-	 * The IMX327 and IMX462 are largely compatible with the IMX290, but
-	 * have an analog gain range of 0.0dB to 29.4dB and 42dB of digital
-	 * gain. When support for those sensors gets added to the driver, the
-	 * gain control should be adjusted accordingly.
 	 */
 	v4l2_ctrl_new_std(&imx290->ctrls, &imx290_ctrl_ops,
-			  V4L2_CID_ANALOGUE_GAIN, 0, 100, 1, 0);
+			  V4L2_CID_ANALOGUE_GAIN, 0,
+			  imx290->model->max_analog_gain, 1, 0);
 
 	/*
 	 * Correct range will be determined through imx290_ctrl_update setting
@@ -1441,18 +1438,21 @@ static const struct imx290_model_info imx290_models[] = {
 		.colour_variant = IMX290_VARIANT_COLOUR,
 		.init_regs = imx290_global_init_settings_290,
 		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_290),
+		.max_analog_gain = 100,
 		.name = "imx290",
 	},
 	[IMX290_MODEL_IMX290LLR] = {
 		.colour_variant = IMX290_VARIANT_MONO,
 		.init_regs = imx290_global_init_settings_290,
 		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_290),
+		.max_analog_gain = 100,
 		.name = "imx290",
 	},
 	[IMX290_MODEL_IMX327LQR] = {
 		.colour_variant = IMX290_VARIANT_COLOUR,
 		.init_regs = imx290_global_init_settings_327,
 		.init_regs_num = ARRAY_SIZE(imx290_global_init_settings_327),
+		.max_analog_gain = 98,
 		.name = "imx327",
 	},
 };

-- 
2.34.1

