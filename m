Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61D31465B7
	for <imx@lists.linux.dev>; Thu,  4 Jul 2024 17:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113853; cv=none; b=RHcVjwHDQvhWQPxo92nl4VC2f6yLEPs6n/MFFmEC1kZBdA9ptQQCR5/6YBu0UIsN45IUtvtCka+mPPJ8dbzTJz5ccmktVeakvLjsLRh0PoNt4VaK3hgaILU176Nm9XT1vGPi1ZlI/hvHZ2uwrar0+JRVFkwHQrQPLssXjgcRsAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113853; c=relaxed/simple;
	bh=bSrh6dRMhrjSnNp2eZHSzRWT+oe0XS3yo9fzlNPFI3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AodKa5yB28crxewM9hCrLaTvKUTnDrGQz5MIxFp9MNoWHpLCrSXaf6hIHwgHgsuldIXuNFdH4zahl8V3e7Apfq6yK9gWexa/jAjXwFBHdsQQwKjFAwugi65SYtAmgL6VFS7LHH1L0nYZJh2gECKjkafOg/khIa5HXfuOM0+gWLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GS+3uL3K; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GS+3uL3K"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ee7885aa5fso9062621fa.1
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 10:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113850; x=1720718650; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cY6xfOZvlcet+ySjb9JWf/+SsmV4UTmCb1l/EHDXfC8=;
        b=GS+3uL3KSho2n0nk761urjW60Wh5x02fnDl4Bm0K0YVpb4kJ+nMBWQW4H1s0Q6V0vj
         bjSxOAh2qfEO5Nb5p+3DJXiEkjChqJyF0/knIm8xpBMUU+KzWGHQQn0d6mD9fENrPwLw
         fGGLcvX4rF1Bn85L1s5PEnKCXldXoJvuLVSoCRHLEbH9DRwI4A/lRGspsuApWYXKovIy
         zXyHOGl5LTuZptUnOJSJy0yf3uMFYuDKbGSKBml5Y24NXJkQvr9na3Kf7coFN/IKW157
         wkRnq9oz3SrWoAvXlL30ooYwzBhp+4L2IMN5/xLq0Z050OsjC7UeD/zVccJkutCoU85I
         IaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113850; x=1720718650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cY6xfOZvlcet+ySjb9JWf/+SsmV4UTmCb1l/EHDXfC8=;
        b=TrXETgflZE4VtBgd5R6CdsMcHL8noErVOIINmcZPIQZdNlaBeWg7hx/1G3CuVWXrtS
         7aR0RwOHP+YkJ0Rp6tIir2t5k/hZUe1yqTPiYdvsOhN6Foi4PLp7Nh03FKaQ7ikoTGR4
         ezYCM/nj79fXJIA+cG6OgpfLGgEdTs5yPSlOOA1wAGcZQg2Rnh7ShYEFCCOi6znjflQ7
         wjhKYcvjzkXt2Jxm2C0D2c6/P/F87gXJSUAPAg6LBe1SAJZTLZYIkbHvAOkzIIJAU6hc
         jd/LsfcMx5Pk50OPjOPOfOcqeCsIyuBn5N/CU8j7mSfYA0hf/m9CedVWnkdDYyCqU7Po
         lbOw==
X-Forwarded-Encrypted: i=1; AJvYcCWPbXXcOAKSwqbzJhK7VcLmm1/B3p1m9d0yC2iBqnYFtjPrlF9VWi7ak2JPTugA5c7zVEs6H1cMwSCrKau29J5yHGX4
X-Gm-Message-State: AOJu0YyzD2ZJsBRbiIlJwYmtg0CoskoOBJDsrjTmnVSOPsUe5DjjyEbK
	XyjoknDL987u9shACAFdH+31xb2XDOmMpELQ5ZTibjxm6T05DpmM
X-Google-Smtp-Source: AGHT+IGtnAvbW4no2BJkVizF7QyWI4V6mUEbSxAj8vrlcD/ecnkkHDmGxX/0R/e7YeC7WvAUoP8myQ==
X-Received: by 2002:a2e:8889:0:b0:2ec:3d2e:2408 with SMTP id 38308e7fff4ca-2ee8ee00250mr15810741fa.33.1720113848939;
        Thu, 04 Jul 2024 10:24:08 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:24:08 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:34 +0200
Subject: [PATCH v2 24/24] mfd: sprd-sc27xx-spi: Constify struct regmap_bus
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-24-0c8785b1331d@gmail.com>
References: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
In-Reply-To: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, Xu Yilun <yilun.xu@intel.com>, 
 Tom Rix <trix@redhat.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Tim Harvey <tharvey@gateworks.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-omap@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=780;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=bSrh6dRMhrjSnNp2eZHSzRWT+oe0XS3yo9fzlNPFI3o=;
 b=DezkfXYqRxh+l8xH0kAqtfFdbmPbZ6IPk/AWxl17e20cmNX8etXGB8bY4Kz0Nd43R0lo58BHn
 Zy45XHOUm9nArbuXRULBjg/edSFn9HKpD5rSni6VE2XuT+YjdZnsqq2
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`sprd_pmic_regmap` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/sprd-sc27xx-spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/sprd-sc27xx-spi.c b/drivers/mfd/sprd-sc27xx-spi.c
index 81e517cdfb27..7186e2108108 100644
--- a/drivers/mfd/sprd-sc27xx-spi.c
+++ b/drivers/mfd/sprd-sc27xx-spi.c
@@ -135,7 +135,7 @@ static int sprd_pmic_spi_read(void *context,
 	return 0;
 }
 
-static struct regmap_bus sprd_pmic_regmap = {
+static const struct regmap_bus sprd_pmic_regmap = {
 	.write = sprd_pmic_spi_write,
 	.read = sprd_pmic_spi_read,
 	.reg_format_endian_default = REGMAP_ENDIAN_NATIVE,

-- 
2.40.1

