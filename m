Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF0E221739
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 03:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755834671; cv=none; b=b+yA5l8+a62cK7R2aAbU9E3xJ5pOCRe5xRPyvha3TjagGgKTbcuQFUJasWfV20dPi1MRts5bw+IEeNlElTazPf9lhxNRXkeqj5ktgZXzIqjoxMX5HmcotUSgZdy6OE/aaAxeXAisAbxkR/L86+oYVibiDY1rzlWEkx2Tn5UV4M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755834671; c=relaxed/simple;
	bh=c8hX9rvl6rr2dhjjNLkJgB0+zkmehac1mQEbRhCM7pU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ofx+4s5lsh1Eo9rhm1BPjjOZXz/FPv4CZL0PD8G3gw78JKoIkqFQB0kNuU2nGsLNa7CAuXpngx6oQCSu1kBLta14lWBAGT4H81qJ7GSVQVt9pyEXv+PZ2WMOTziRv5ErsjhMTmMPUFQNZZMSPa9dsmhkJQRdFpBhU2y5cjiJjbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHYwnrNd; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHYwnrNd"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-32326e5f0bfso1390587a91.3
        for <imx@lists.linux.dev>; Thu, 21 Aug 2025 20:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755834669; x=1756439469; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hqrtxAz9cctGN9u8jlxCJdnxps3sEfbBI35+GThZJ5o=;
        b=kHYwnrNdGvQnhlWSJY1Fe40z0E0xT+wc0FtcXTStMldKW80bsh8yLuFGKdqJ/yrCZp
         tt8zSfkD6VgH7BRi1gwHvGuV1jwrTvrA83hY8V+rDpeudfl0lSL0Zr+ZaCq+37Y/SvPL
         rjTECAaFFx1b01lkYpcLrXqPyFgcG3vzC+krrsmAPV+res2RqCAFK/LbCCxWEdumiOuc
         8eYi8t7/vRGh6077gI5XUeljFCRxqzRF5s+jFd2xaMNYRkjpISXnYfEUNIcWKOSFMI41
         8if7od6lO/mH7KqVjxTl+anrPNKhs252qOj5zdsFTy4Fgwhal9YukRb9PKRL2dsFVZBM
         EXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755834669; x=1756439469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqrtxAz9cctGN9u8jlxCJdnxps3sEfbBI35+GThZJ5o=;
        b=dccfF2RHxozujbcSqADnFQPYTpMOuZiXIji9zQCDBZlh3ZKsyb3BdLeJ2rzAoQsgap
         IkI7v2u/cGRthPF8lqVTuHR51Q+ngchgxBw1LNHrd7b6v6ihsDw/UgtE8It6mWWBMwgH
         drnvpCblrYwsS1wNgmtXo/Af6ARnw2sLUYUbXPiKTFXE6ylpDrlp8ON//MLp5JW3kMQf
         7DXUmaLwqAn/9EtfI4lD0rDbtyANo6pAGGZ1S1Sl+6hsKQQkgFdHhchH4mpzGaWlKk98
         hafmhj1QSsrBurfcqVIbh6eswzlJuarqr1BO6XH3/MPLR28E1c81dTKxf8vdnDHLh5av
         +3pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAqJHVMCL+Aaj1IRVYn0OhsnJKRvTejS52bRo59zjLe+znLG+leOc0Fs0Tngn0In31+v0=@lists.linux.dev
X-Gm-Message-State: AOJu0YypGqxpprp7MbycvkgFyQ1XbpnE3g+lhJcVjQ/zs3P+dJrUZ2mk
	J7M0dvYpPA+woJkfD+jSC8HCbXLXY7b5IN/b1oSeFyjXy2JE6QxL1x58
X-Gm-Gg: ASbGncsLLt4z4LIVnaRnElzYOopCaGwVv2WKuAoA9We1FJgT9h23YaAr0QLxuZoIrD0
	cFmt9bLCvT31vtYKN9z9Q6ECKkAUdlqYXexqOAiflIR2aWlYwvFtVRR38G/Td4UJsssxj2UoTxd
	a1i+mjm1/42ASv27rtXrfmtIdp1VzkssPzOADiSTbqZYJw1u966anClYmde8PEuZCI9J4CBQbqH
	Pnahbq137iF3EG0F/9Z4QLbOpX0QRJ450fKleNm6sDmUINX8YUl3l1O6CN5T2opppakYVv6e6fA
	lVUY3QLtNj0mLSg6q1Xebkf4KX+QOUhvhSQ/PDvJZv3lZ8pQb99OGVG/R+r9NLoYug5nvxrlvZm
	f3rsR7sFCVMZ4hDYIFrrB0+g+D7TW
X-Google-Smtp-Source: AGHT+IFlyHvge1r2eEDywa691vO3EH8Zw57rYlejYo//N9dseDi4JFrUwk2dU+AEjPu1HGJfNaSDAg==
X-Received: by 2002:a17:90b:278b:b0:323:7e7f:b8f4 with SMTP id 98e67ed59e1d1-32518b80cfamr2288523a91.37.1755834669027;
        Thu, 21 Aug 2025 20:51:09 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:51:08 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:53 +0530
Subject: [PATCH 05/10] iio: humidity: Drop unnecessary -ENOMEM messages
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-enomam_logs-v1-5-db87f2974552@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=1404;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=c8hX9rvl6rr2dhjjNLkJgB0+zkmehac1mQEbRhCM7pU=;
 b=ZgaeM24zC7IN3+he8TY2T9s8YSEkwL7SoNKuSaTSjAtLL/67LBM7qENhJcDRsU+1mIQixXTl8
 Ul2eMZUGNU4CG0gfDDCnLldXt5ixt1iTh4jFKaiKgitF507++7QKEdv
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=

The drivers do not require their own error messages for error
-ENOMEM, memory allocation failures. So remove the dev_err
messages from the probe().

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
---
 drivers/iio/humidity/am2315.c | 4 +---
 drivers/iio/humidity/dht11.c  | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/humidity/am2315.c b/drivers/iio/humidity/am2315.c
index f021c3e6d886..02ca23eb8991 100644
--- a/drivers/iio/humidity/am2315.c
+++ b/drivers/iio/humidity/am2315.c
@@ -224,10 +224,8 @@ static int am2315_probe(struct i2c_client *client)
 	struct am2315_data *data;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
-	if (!indio_dev) {
-		dev_err(&client->dev, "iio allocation failed!\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->client = client;
diff --git a/drivers/iio/humidity/dht11.c b/drivers/iio/humidity/dht11.c
index 48c59d09eea7..cc8f02f3b763 100644
--- a/drivers/iio/humidity/dht11.c
+++ b/drivers/iio/humidity/dht11.c
@@ -296,10 +296,8 @@ static int dht11_probe(struct platform_device *pdev)
 	struct iio_dev *iio;
 
 	iio = devm_iio_device_alloc(dev, sizeof(*dht11));
-	if (!iio) {
-		dev_err(dev, "Failed to allocate IIO device\n");
+	if (!iio)
 		return -ENOMEM;
-	}
 
 	dht11 = iio_priv(iio);
 	dht11->dev = dev;

-- 
2.43.0

