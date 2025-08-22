Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9E521D3F5
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 03:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755834646; cv=none; b=N8SjPr58mDS1Mc4p2LDq4WroDLsjmpeRrATldIitIcD0KxA7PrQ3Kt6cr58VRYeUQhFYtLsqueoWGi/xLEC1ZR85unWudiSNt9vOIS2uODCPmxqevQcJDMjTJeVxvTxlRoJifvgEpNTFw/fj8Bsxc4p03b7XvoqpOoXUBfDAS3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755834646; c=relaxed/simple;
	bh=1K93tVeoPiLj/0fP86BU3YSmIy3OX+Xeg+DZkIsbkCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rs8a0UXhajkLVHPCEKcXP7FSkLxRgUxS0rDQBPBUMSaD+0sOIky06S/ngyKdhKN9qALV2VkaVAi8ZFLrYgzPeUPLEAxngKWet5RJslA/FlEiO8dILwfRtrMYHsiaAz+PCm5YzXddzNmhZhnBrKMtk/jCskBpQfZEZM9c4YIoVCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fdm1aAWT; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fdm1aAWT"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so1657816b3a.1
        for <imx@lists.linux.dev>; Thu, 21 Aug 2025 20:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755834645; x=1756439445; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SWhZhPrOG/QAlgX04rUzc0hrbfIiVcVzkp3PRYw6Qbs=;
        b=Fdm1aAWTH/osOXBfjuDzTCR0nnshCb+UCWvPDFThmnDoqwDh+pMzQH5ssKxPbEF8vj
         2s/7hCc2mrptfXOE8HSR+26W4iZ/Zeze3oCIH5qIjZRGfTlvAPwoSFJj7E+S0Aw5So/U
         Lt2yFYoCqydd2Suit8BfKYAIaTPoyyOZq0h6m7O0+27h3EHRJCsCPXoMj2Avf0hl1jt8
         ozQQaNHTxB9LIxVo0OaVJm9klOwUgxM342vMDS5FX8HWcw9VMRSlghAUuFBtlVycO1tl
         wMyqWlWHUI3j24A5/tOxkiF+WxdITQYO3Dw+opDS9c8a2tXK00f5nBobvFytC5DIA0Lj
         5SCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755834645; x=1756439445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SWhZhPrOG/QAlgX04rUzc0hrbfIiVcVzkp3PRYw6Qbs=;
        b=vKgX6iZfJJiWEN0NKnxdDDDUkIzffdjakb+lTIdfLTVFRXgoqKK2ggPhhabOQj8pk0
         PhsMN5rsaBfJQ936KB5BVHeSr1M+VFBrUUEc+erG0cyWD8RLep/NC3QfX8Ll2pkuBNf2
         R2Z70phWI3w+RA+Joc8VFOEjSH9KxfuPSsdxX2WkQTb9UZsjmoaXvyZiqjyRM3WxS5tw
         4ETX6q9gbPEWikd8Y54Ij38mcZ9mbLK840JyckgXqBmU72CXzxUYQRhWtuicGIy6J99S
         DFJ4GU87S6i5I2vSNyVBzBOZZvMj7g7Ko004CfYHn5K7Zcm44YmTj3BQNqhSnSb1kmwk
         LsVg==
X-Forwarded-Encrypted: i=1; AJvYcCWCV5yEJc8tkRVsI7nIvn6MSGHp2Q0f/fNxxx0qNiVolYC4Ka/SWt+3gnCBaI6fSAXfiGU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+6NevcFO7p3ifBNd3VUc1ZO46bt1JQTQPWfAuzACtROWaLnsk
	Gx8UeY0UueRBeNeSropphMD3SDBZu7b5uiTiyXxAaQ6Jhr03NMsU6fcv
X-Gm-Gg: ASbGncsf45gdnxZS+8678jRAU+nSHDrGO52bZ7w/LaKxq/CXhGL0v7B2U5USSKqzsiq
	Iar3ZLgZGDquDCshBVPAD8KnFsgKb5np56y5/y2uAqF3JE2PN+sDn/GMyDDn3IkCB0R+9Xw1fND
	6xvN7iMkOOeOkrnZ1rpDCoPOfXZWmwFO82f5tYODubYhsm4sLkVnN6I6Ztr/zOYu40DUktvREig
	LDge+YybS5BREw6856x2tD2SAaFnQQlsC0qI1vqQF6QAL/4sIUlO7p52O85pFGvqWeqQ4Le4wqW
	au15Are+Ma4BgPnarxeHyWkcY6Hm/gS4+JpJZa8L5TEsPzGwrlTBpEw1200BpIEHF+9FFgO02sG
	ZTwrtTFXn9bmy8Q3dJiAEv0aHGRAe
X-Google-Smtp-Source: AGHT+IHkP7IcI6b0w4x7HvhyRCGL8lDQ0eb2HC3aGo0CeMkwIFIX7qo+gbx+sa5/Xre12VY1dmNs5g==
X-Received: by 2002:a05:6a00:8ccb:b0:76f:73be:5c40 with SMTP id d2e1a72fcca58-76f73be5d38mr3282271b3a.0.1755834644500;
        Thu, 21 Aug 2025 20:50:44 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:50:44 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:51 +0530
Subject: [PATCH 03/10] iio: dac: Drop unnecessary -ENOMEM messages
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-enomam_logs-v1-3-db87f2974552@gmail.com>
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
In-Reply-To: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Haibo Chen <haibo.chen@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Andreas Klinger <ak@it-klinger.de>, Crt Mori <cmo@melexis.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 Dixit Parmar <dixitparmar19@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=3064;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=1K93tVeoPiLj/0fP86BU3YSmIy3OX+Xeg+DZkIsbkCY=;
 b=JROXYfDq1SqDL2ylheHeUCGY4etunQkZ/BgczFT/HiSsDjSgLfD+vVQv/PUGbpM0DntA8c+rO
 /vK5LfYFZBAAFXCYy4qQHdS9WRP7YF9lw/jPh6v3LyPjytsGbwnqVdv
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=

The drivers do not require their own error messages for error
-ENOMEM, memory allocation failures. So remove the dev_err
messages from the probe().

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
---
 drivers/iio/dac/ad5380.c     | 4 +---
 drivers/iio/dac/ad5764.c     | 4 +---
 drivers/iio/dac/ds4424.c     | 4 +---
 drivers/iio/dac/ti-dac7311.c | 4 +---
 drivers/iio/dac/vf610_dac.c  | 4 +---
 5 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/iio/dac/ad5380.c b/drivers/iio/dac/ad5380.c
index f63af704b77e..ffb8c676c7a8 100644
--- a/drivers/iio/dac/ad5380.c
+++ b/drivers/iio/dac/ad5380.c
@@ -371,10 +371,8 @@ static int ad5380_probe(struct device *dev, struct regmap *regmap,
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*st));
-	if (indio_dev == NULL) {
-		dev_err(dev, "Failed to allocate iio device\n");
+	if (indio_dev == NULL)
 		return -ENOMEM;
-	}
 
 	st = iio_priv(indio_dev);
 
diff --git a/drivers/iio/dac/ad5764.c b/drivers/iio/dac/ad5764.c
index 26c049d5b73a..fbbd7105a80c 100644
--- a/drivers/iio/dac/ad5764.c
+++ b/drivers/iio/dac/ad5764.c
@@ -278,10 +278,8 @@ static int ad5764_probe(struct spi_device *spi)
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
-	if (indio_dev == NULL) {
-		dev_err(&spi->dev, "Failed to allocate iio device\n");
+	if (indio_dev == NULL)
 		return -ENOMEM;
-	}
 
 	st = iio_priv(indio_dev);
 	spi_set_drvdata(spi, indio_dev);
diff --git a/drivers/iio/dac/ds4424.c b/drivers/iio/dac/ds4424.c
index a26a99753418..a8198ba4f98a 100644
--- a/drivers/iio/dac/ds4424.c
+++ b/drivers/iio/dac/ds4424.c
@@ -221,10 +221,8 @@ static int ds4424_probe(struct i2c_client *client)
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio dev alloc failed.\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	i2c_set_clientdata(client, indio_dev);
diff --git a/drivers/iio/dac/ti-dac7311.c b/drivers/iio/dac/ti-dac7311.c
index 3d2ce61f0db6..5c1c5213962f 100644
--- a/drivers/iio/dac/ti-dac7311.c
+++ b/drivers/iio/dac/ti-dac7311.c
@@ -242,10 +242,8 @@ static int ti_dac_probe(struct spi_device *spi)
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*ti_dac));
-	if (!indio_dev) {
-		dev_err(dev, "can not allocate iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	spi->mode = SPI_MODE_1;
 	spi->bits_per_word = 16;
diff --git a/drivers/iio/dac/vf610_dac.c b/drivers/iio/dac/vf610_dac.c
index b30ff7bb4400..b7ee16ab4edd 100644
--- a/drivers/iio/dac/vf610_dac.c
+++ b/drivers/iio/dac/vf610_dac.c
@@ -178,10 +178,8 @@ static int vf610_dac_probe(struct platform_device *pdev)
 
 	indio_dev = devm_iio_device_alloc(&pdev->dev,
 					sizeof(struct vf610_dac));
-	if (!indio_dev) {
-		dev_err(&pdev->dev, "Failed allocating iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	info = iio_priv(indio_dev);
 	info->dev = &pdev->dev;

-- 
2.43.0

