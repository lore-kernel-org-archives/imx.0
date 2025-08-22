Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5AB2253FD
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 03:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755834658; cv=none; b=mGXs58p/LIZ4jaF2IUmFKTTT3b+ohDOmemxCbct2muT/QLaNf67BwfuSeQF4EyIt57Fu5d+hKaI4twefrloSKZfobYQ6383MUSDFiN5mZEuj+/FhGm7fnoltvHM6f2XZ7tNfoxWdPRtkejGj0o3MqW6e39w0MvkRewFIYOrB+RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755834658; c=relaxed/simple;
	bh=rO9VuR/oVVGoakCjeEjj+XT6+ebILUa0tyZFOkIL2Qo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GqedCNB4vmckezgEabqO//nf6aBnnjbRM0gf6IyvrJUEM3KZjS07B8Vhisv8qhau+NpOCJB/oP91P1LdSeOUXLbLp8ULIY9w1a93DRthmTNsQB4nNYKrZed+axxIksmx5FOjpTL5ww8UtZTNvIZDBPvNBUv3Sp6kqn8qSxgaMTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9USOuRh; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9USOuRh"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-76e563b25c4so1233998b3a.0
        for <imx@lists.linux.dev>; Thu, 21 Aug 2025 20:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755834657; x=1756439457; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPzGBFBfr9XUbrPfoGwRs/BjXqUrZ2N1GqqaLsSssIw=;
        b=m9USOuRhMc5wGzRAb22DMzPzzwZuGm9U+Z630/mYaNy9dx4GTvf56Lx8FrqZ8dvHm+
         bJme85deNP0tB/N0LcosLCsvgT/AGV7MqGoWzgTmrXH/zCMyKT05WbsRuEaWr8eLc8xq
         fMWT+n2cF5xeAZiNdaOQNdmbyGSygcfAglZQBtiDhC8YmTLUeJqrZlt631gfHIk0tAnW
         1KW3c7AkiGeiBcxl1E0a5Hm8FWowWSktuzf/QG7x6sjiQSXvJdus3O0VPF/sMQi/Ld6g
         k6gtiayIoQJqmq51ytOctlFDJRvRxj65DsL4Fng/NMGF0FHVxR744z/Vdp64Xla0gZjc
         Bcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755834657; x=1756439457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SPzGBFBfr9XUbrPfoGwRs/BjXqUrZ2N1GqqaLsSssIw=;
        b=sWy/mWvxXETHNZghzjJ3yQ7hmphPoR8HVOX2CM5Fg5Tr/U/EdiwGejJI1qDry3/nCJ
         BHlzKKNj7sJhh+U+3nY7D/tazKaFFI8OGTerB0wvxXvkQlAVRGalGuPM04HuhchOyJ7c
         rtwVOrysxFE8K97ia7Jb0mMrXQhc8ZLkzNXIG0Z8zZNmu0PAhWHkTOdqwgXKKiisA/un
         Zt8CFiM0CcCLwKIlw4qFoYqpKrlMZDGdgiEz3zXJC4DHTkb3Mbme9Ho/Sfl3gR5Hm31n
         mBg9yXiJccBzKyCfTASoQOiy7rkTEyZE/IgpMC8Kz1/DYxunPn7nB2/Nh/RjkCd/qWvX
         Yfyw==
X-Forwarded-Encrypted: i=1; AJvYcCU724i0QFmuGQ8GaIFNyMz7KlksOjEqjWV54GWteiix21izYF0EX0tR+Gg7bNTp9VMpGBI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2Mguv4RXPYWwfZoQ0YbrZgAH/Q0oRzuffO84ajPjnZ2zvuOu5
	c081d+isvAW6nSKJFnI6OAY+BgU332bVpjcLw0bkkMAvLY3Q7SoC4cHP
X-Gm-Gg: ASbGncuLk4mTT/dfRKm/0xBLkgCkYitbe9AcfGAm6/wO+Z6TOrfPltkb9E2ihwqtliG
	rb1qHbTp5pSUex+iCcfcwU/stvlj/No6ciI22RJyZnctF/XCaoAH/r0lK+JmQkmfjGSVWJDi9CS
	qDTK1fC7S8N5jjwFDc8dp49WY78/VrOStV5eYwrSWKD5HF2SWDg2dYaAvCq6Yt5Qvb9fjhcrmgM
	kLS90u8u5FjfLdr6w10zAhbgIQps+0NWlQf4BENwFibBf/dYuqQ9NsQzqZ4xM1jbWtQZl91snkf
	AjB54M9SOZwdk4r10PzF3VLZdmNK3gzBP2Qod9H0KStw2ogyNbLRFnQfPllu/Geki3NxDcHCdQB
	bQLdHwTZT/agliBVkLHMLFcYJbiox
X-Google-Smtp-Source: AGHT+IEDplbG/6XF12lPxx9itIgjz12WwucZKRq9+cOsqGQDlvGhf+WNacIYrhLVVvaG53XeD5NjCg==
X-Received: by 2002:a05:6a00:8d4:b0:76e:7aee:35f3 with SMTP id d2e1a72fcca58-7702fc182a8mr2167240b3a.31.1755834656645;
        Thu, 21 Aug 2025 20:50:56 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:50:56 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:52 +0530
Subject: [PATCH 04/10] iio: health: Drop unnecessary -ENOMEM messages
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-enomam_logs-v1-4-db87f2974552@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=1430;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=rO9VuR/oVVGoakCjeEjj+XT6+ebILUa0tyZFOkIL2Qo=;
 b=4b2jPbSe8j92/XCjL6XXtT4A9XSafT+S4e6mVe2Kd2YIm/HD9yFiVI1p7o9NlKstS6ok8mzyx
 C9ICz5YdiGjAlatKIORLRTH1V1wdnZKz0xgwurThCEbeEno2qe589S6
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=

The drivers do not require their own error messages for error
-ENOMEM, memory allocation failures. So remove the dev_err
messages from the probe().

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
---
 drivers/iio/health/afe4403.c | 4 +---
 drivers/iio/health/afe4404.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/health/afe4403.c b/drivers/iio/health/afe4403.c
index 1582cfc03579..8e5db2235de0 100644
--- a/drivers/iio/health/afe4403.c
+++ b/drivers/iio/health/afe4403.c
@@ -531,10 +531,8 @@ static int afe4403_probe(struct spi_device *spi)
 						   "%s-dev%d",
 						   indio_dev->name,
 						   iio_device_id(indio_dev));
-		if (!afe->trig) {
-			dev_err(afe->dev, "Unable to allocate IIO trigger\n");
+		if (!afe->trig)
 			return -ENOMEM;
-		}
 
 		iio_trigger_set_drvdata(afe->trig, indio_dev);
 
diff --git a/drivers/iio/health/afe4404.c b/drivers/iio/health/afe4404.c
index 99ff68aed27c..11a0f465fd68 100644
--- a/drivers/iio/health/afe4404.c
+++ b/drivers/iio/health/afe4404.c
@@ -538,10 +538,8 @@ static int afe4404_probe(struct i2c_client *client)
 						   "%s-dev%d",
 						   indio_dev->name,
 						   iio_device_id(indio_dev));
-		if (!afe->trig) {
-			dev_err(afe->dev, "Unable to allocate IIO trigger\n");
+		if (!afe->trig)
 			return -ENOMEM;
-		}
 
 		iio_trigger_set_drvdata(afe->trig, indio_dev);
 

-- 
2.43.0

