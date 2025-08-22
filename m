Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F5E1D432D
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 03:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755834624; cv=none; b=E88teHf3gJvgtDcf+Z8ZzG+vygkNpstl6LcKmnMdup3zBNRxdKzBUvqXYHNe0bXHal2n4+eXSa98qhsoez2CyaMmvK/UO6cgsCPkuwoMTfpQAQpx1hf46qvyVX3NAfJyO+J1KFO0fdaSy4eZtu49HPSe4pTIukplvJ3fgFMC3ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755834624; c=relaxed/simple;
	bh=AwWtPL38y1r0iJuhWRg453I1C8i8OfauDf6niMfJUko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SZWrczlcyEmIgMsb7pz21V4O6Q/bwXKW0COjbszZXLGITfNmaQyhKnzqGq4q0dx1MpztDwpwIwsXMfvk/A96f0QjvJhA2UoM7DRRqqxnGZIvqb1v/MQBeKZ8Zsz409kQExjaslJhnPCfeC2nQgRTDy27UQMPK8A3liU2XpwDIEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCWj70ab; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCWj70ab"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76e2eb6ce24so1452623b3a.3
        for <imx@lists.linux.dev>; Thu, 21 Aug 2025 20:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755834622; x=1756439422; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zktb9gNCV40fpMD00X6p5W7la95jm4sktu3txkhmc0k=;
        b=WCWj70abklMTpaEEuZJulXELAHbu92IJquxfteukNzZUY6ikaqa4Cn9CFTvugpcGkp
         ODEASo1Y9yG69NjMzWc4EWmaeEJOKZaMLBI/wKHUVJeZnpNi6A46QMYLWZX9Ln0yyLjU
         mxk4RJSBv806Mr6S0ZR2chDO1GzKcTeDgphiVhvE6VWjvGlg6w0XFtUcMId4f2ibOVFi
         W8P57fL2AFw1hL1hbZ7RIbx/j55dNpqhXF5MfFmNQm9HuwZM3ACwMfNdUQwGDBsMmRUk
         h1/eSofgN9B0rRErCPepUPPp0iyo1uFYV1vs3Mk3OcyuwbIyBLQa44dI2jBuV102YJ9l
         vkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755834622; x=1756439422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zktb9gNCV40fpMD00X6p5W7la95jm4sktu3txkhmc0k=;
        b=LIVZSKmWXIseVCxc5LXvkyr5UCO6c5Vi2FJyjWVrzVyIrlF2qzl+6tXMhBv34b7mZG
         v3T2Q2kuf0SpqDKnIWLtJIMU/CIJKNfNCOAwGwFBcZ+uT2CEvXoZLsn6WVmfo6mdkTcH
         IcUX3xwD3NrLWBAVAUmRjVz6B2WiYAE+YAYBKSvBcBtW95w9BSvs4rdc64+t6HmHteR6
         /FNQVZ2f9FnQGgWWO5RIBhM87++Qq8cD3LKSH+iu00EvAAEufUQSsdY6s57M8nSczxkv
         SzROJIWo2I4vbPcNFpJfbfXzLkwPDWnJ0YI7uagrupnbJBZncD3C2BZuKMSVbrmP85UY
         AHMg==
X-Forwarded-Encrypted: i=1; AJvYcCUfj+yzDSTDtKA6sbeG/zKm9V8exqVIkfa5nSS/Bhx6cVgNcCuBKGdEWQBespQbmgoCbqs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+ycDYU5ESd51re6smaQ3/akcjNhb+RQ8CeRrZdkNfZpCAozOc
	sCzIKUdPgwV71cHjb2XnDh0Lidy+pytrDwxngg802qRStrdcBhhCfpS3
X-Gm-Gg: ASbGncs7dcAaZv5WXfC61NN8rFO8o60+vR7e0JlZtexAnxRB0OX8PR82VAqQbcFoV/q
	yQw+CnQ2maUo2cbmb7R4ks9WHCF9qT+QLdbVV1NM32J0ISqsib9ALZ+5489ud74RDuxqJfalF6u
	wLXzj426cRqWhfWFrCGC8KhoNnXFqmc4eCP7xw8ltZUbfSZFfMuwY38gB2nCGhOsuQV+B5wmMvC
	k8nBHTOC2DOgTfcQwNrcCFIz1I4lQNgD4YBbSK1mHa0beB4xDULDV7Bark22az+0tI5jDTtJUjq
	EL6fzpjnLU8IczZmLOf4tUjokfTnd4IuX55ajl2zYii6YlkR1kZg2Mmf/65liM5rDEsuqkZvexM
	ByD4P6fgGdX/50INdOEW6u9nWf9aJ
X-Google-Smtp-Source: AGHT+IFDoZyIz0WRIUaxN7FXYxLo2r7HqUuxevy2n8ltiyBxZUhzirU0KHdL7UEIoextymafrEyd3g==
X-Received: by 2002:a05:6a00:858e:b0:770:3663:d7ed with SMTP id d2e1a72fcca58-7703663e373mr162150b3a.8.1755834621826;
        Thu, 21 Aug 2025 20:50:21 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:50:21 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:49 +0530
Subject: [PATCH 01/10] iio: accel: Drop unnecessary -ENOMEM messages
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-enomam_logs-v1-1-db87f2974552@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=4894;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=AwWtPL38y1r0iJuhWRg453I1C8i8OfauDf6niMfJUko=;
 b=HyArtRPdcLffakDtLhClwxTdP+mH4OjolmAEC2kl0Ef9kkGBHqmafuOPvQlafSR3649vcC4lc
 /gRsKN/en8vAYGKTMMFbugkLJ14LDuKTxUNJK79Mcbj67+WHGSq6Qtv
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=

The drivers do not require their own error messages for error
-ENOMEM, memory allocation failures. So remove the dev_err
messages from the probe().

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
---
 drivers/iio/accel/bma220_spi.c | 4 +---
 drivers/iio/accel/dmard06.c    | 4 +---
 drivers/iio/accel/dmard09.c    | 4 +---
 drivers/iio/accel/dmard10.c    | 4 +---
 drivers/iio/accel/mc3230.c     | 4 +---
 drivers/iio/accel/mma7660.c    | 4 +---
 drivers/iio/accel/stk8312.c    | 4 +---
 drivers/iio/accel/stk8ba50.c   | 4 +---
 8 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/iio/accel/bma220_spi.c b/drivers/iio/accel/bma220_spi.c
index 38f7498431ee..01592eebf05b 100644
--- a/drivers/iio/accel/bma220_spi.c
+++ b/drivers/iio/accel/bma220_spi.c
@@ -255,10 +255,8 @@ static int bma220_probe(struct spi_device *spi)
 	struct bma220_data *data;
 
 	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&spi->dev, "iio allocation failed!\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->spi_device = spi;
diff --git a/drivers/iio/accel/dmard06.c b/drivers/iio/accel/dmard06.c
index fb14894c66f9..33f225d73e7b 100644
--- a/drivers/iio/accel/dmard06.c
+++ b/drivers/iio/accel/dmard06.c
@@ -137,10 +137,8 @@ static int dmard06_probe(struct i2c_client *client)
 	}
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*dmard06));
-	if (!indio_dev) {
-		dev_err(&client->dev, "Failed to allocate iio device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	dmard06 = iio_priv(indio_dev);
 	dmard06->client = client;
diff --git a/drivers/iio/accel/dmard09.c b/drivers/iio/accel/dmard09.c
index 4ec70ca6910d..d9290e3b9c46 100644
--- a/drivers/iio/accel/dmard09.c
+++ b/drivers/iio/accel/dmard09.c
@@ -95,10 +95,8 @@ static int dmard09_probe(struct i2c_client *client)
 	struct dmard09_data *data;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio allocation failed\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->client = client;
diff --git a/drivers/iio/accel/dmard10.c b/drivers/iio/accel/dmard10.c
index 71cd1928baa6..575e8510e1bd 100644
--- a/drivers/iio/accel/dmard10.c
+++ b/drivers/iio/accel/dmard10.c
@@ -191,10 +191,8 @@ static int dmard10_probe(struct i2c_client *client)
 		return (ret < 0) ? ret : -ENODEV;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio allocation failed!\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->client = client;
diff --git a/drivers/iio/accel/mc3230.c b/drivers/iio/accel/mc3230.c
index e2853090fa6e..3e494f9ddc56 100644
--- a/drivers/iio/accel/mc3230.c
+++ b/drivers/iio/accel/mc3230.c
@@ -169,10 +169,8 @@ static int mc3230_probe(struct i2c_client *client)
 	}
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio allocation failed!\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->chip_info = chip_info;
diff --git a/drivers/iio/accel/mma7660.c b/drivers/iio/accel/mma7660.c
index d0a16f227903..be3213600cf4 100644
--- a/drivers/iio/accel/mma7660.c
+++ b/drivers/iio/accel/mma7660.c
@@ -192,10 +192,8 @@ static int mma7660_probe(struct i2c_client *client)
 	struct mma7660_data *data;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio allocation failed!\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->client = client;
diff --git a/drivers/iio/accel/stk8312.c b/drivers/iio/accel/stk8312.c
index dfac2e44191f..305d88b1ae0b 100644
--- a/drivers/iio/accel/stk8312.c
+++ b/drivers/iio/accel/stk8312.c
@@ -505,10 +505,8 @@ static int stk8312_probe(struct i2c_client *client)
 	struct stk8312_data *data;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio allocation failed!\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->client = client;
diff --git a/drivers/iio/accel/stk8ba50.c b/drivers/iio/accel/stk8ba50.c
index 05d4fd540eb2..0f984b72a35b 100644
--- a/drivers/iio/accel/stk8ba50.c
+++ b/drivers/iio/accel/stk8ba50.c
@@ -386,10 +386,8 @@ static int stk8ba50_probe(struct i2c_client *client)
 	struct stk8ba50_data *data;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio allocation failed!\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->client = client;

-- 
2.43.0

