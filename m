Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8401BBBE0
	for <imx@lists.linux.dev>; Wed, 20 Nov 2024 19:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732130254; cv=none; b=FMAS2+SqnyIvY2rvHlbSvnkLbF0I2sEctu12dku7lIGDgftHtY6DcEyOzRTzTpZMIc8j1ktEzPC+CZ8PJNQMn/fMFdQNodPpufoCG5rL4o8VkQLbZjIAEGUDD4rom8Zr7GP9ievU+hdyG1RYI6lpLb4f3oO3rsW191WkODMIwL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732130254; c=relaxed/simple;
	bh=pSrWTgrJyoEYtFZT+idvxCJkveJQEy5pITbzjTk4dy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ekrre0ZiHF30CWQHgGuWAPpUtEaUuScNyrbGGfSW9P4fqRJEZhy+RjWpDCou7Dqy3Wvod9a/Po4rFsEsVBXrclv9Nsq3iKI8GxuMkX0Zt7TssKaSbvn1dN3ropEgDEBj6RLJkde+eUNSHPhEha8V9U/MdSR0CgWGTFK62ZkthOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=T18cGOJf; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="T18cGOJf"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3823eaad37aso816702f8f.0
        for <imx@lists.linux.dev>; Wed, 20 Nov 2024 11:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1732130250; x=1732735050; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QgfFBue2AkaNv5wDd17S+yzXIWjDIT3WyGaTAc0rklw=;
        b=T18cGOJfUATjaW4CZNrQdgtVzxrccOmNphfnp65OgQx3M3ZURKG5YPoSsLkf6qIxuA
         KGxNOYuZ10uLZMeEdvL7tWiaLR2HGDki7U/YKYJDBSKbln8ksctStfQABsQS8TrD32d/
         yrhC/jRbGnaSBG9sELxLoJ1NSAtsttt46ldAVkG1jDjUZyKRnnMnl5akvfJvXizyRJB0
         LeRAkOOEn8IOMYGmnlD+T6IDXmmOSFgsXNOs6YWSxgr0IVfZMhFXsUloJR/K5xu1rDze
         5aMeXLCzjyJZtom/ZXecfixi8I6QNBqdokA5w1AbBWZ/Shu/JJ/+0da2zzKAdslBNy7w
         l5TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732130250; x=1732735050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QgfFBue2AkaNv5wDd17S+yzXIWjDIT3WyGaTAc0rklw=;
        b=Plg7Zh4jlccJklAXWhcM7KOPxBF5CltdikhmRZwHRT5PQ7S+g3Qq7t+T6rWtWsguba
         BAx6oQvsXkfQwRiBIXp+BYgwLg1ttUgfOul+Xidqaorx5t3IEBWPefkzZLSrqXlNoUt7
         lI1WoXDIvRUMRtBNFGn67QOHg5+EPijfIJL1LRmPiA6L5bmW7yGKHpGmABhAgjqessRz
         wfPjiMvEZ8Kapx/QT5qhpKyYxgMNRY+qcm4B/LEn4WztoQEfSUyubAmL36dgy18oWgJt
         1FbbKwZAt9maugK6i0ps6LLXtJmQLFomXr7I4n6DIJxIUG3wjs+2XPeNrgmhEOhEQh3j
         dA2A==
X-Forwarded-Encrypted: i=1; AJvYcCWyyNxEjhfeuTuubhuIbKAB62MS3rCLIGo2RuDfPexnWdRp3iEdrSCsdz5FnxBAsyAb4sM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxq//uVLyErplfXvzkGFADv8NXnJG7+dQP8N5Hif7j4QmuTxxMH
	wV0a1DdqlqoERhPSvpEtpeGMEkxkY9fbsDvqpcd5runR8DnGLHjoJKhVuFIcm0c=
X-Google-Smtp-Source: AGHT+IGRjU3aR6hDFtQjH3HQ8wJcv1fdKmnNHnvgyBmRdYlp1FR7+auWuZyFrR8i92B4uErsUqc05A==
X-Received: by 2002:a5d:584f:0:b0:381:ed32:d604 with SMTP id ffacd0b85a97d-38259ccea2fmr432108f8f.10.1732130249896;
        Wed, 20 Nov 2024 11:17:29 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3825a2c5ef2sm172457f8f.53.2024.11.20.11.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 11:17:29 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 20 Nov 2024 19:17:03 +0000
Subject: [PATCH v2 1/4] media: i2c: imx290: Limit analogue gain according
 to module
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241120-media-imx290-imx462-v2-1-7e562cf191d8@raspberrypi.com>
References: <20241120-media-imx290-imx462-v2-0-7e562cf191d8@raspberrypi.com>
In-Reply-To: <20241120-media-imx290-imx462-v2-0-7e562cf191d8@raspberrypi.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

