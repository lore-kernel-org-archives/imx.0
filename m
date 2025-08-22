Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B9F26C3BD
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 03:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755834715; cv=none; b=Ip9TRWTBgGCiKMFoBhGTmkp2zC66uHgbHcDmTRzKEEmqLvQ+ySWK2sLm8b23d1TKUztAE0qmLxsq7ySdnU0vKqOyfa8RgCtRi6zdicIALkUTqqJ1NIJrGPBuM/OzVBD5wNp9RjpAUpcrI2RyDRpD6mOk0GYsn5x2QRnjaVsQbTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755834715; c=relaxed/simple;
	bh=o0kHbqFpyBP/mgTiX4N/QGk9oAOztYPO8grzmPdvqrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U65RSv61+hZSB//3tAVnJelkaNidl3MfWw2z+VkKAtQ+7f5HecKcKko0yUXLNWjrcIf9CWyQJtHguqYdBBcKIPwb5vOni2+ef3QiaxCVGFI3oEmdfK9Wf1u6yJc4rWmP/T0ngzWBCN+m1xrjjkZDKIljQHBE8xBbiakYLU2krQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jvldEBVj; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jvldEBVj"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76e34c4ce54so1576200b3a.0
        for <imx@lists.linux.dev>; Thu, 21 Aug 2025 20:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755834713; x=1756439513; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HtaId0UEXdWNlODSrBbRe1UfW9oq1uGtqK7BQmJdRjE=;
        b=jvldEBVjvGuv4INAfgMh6e6Bcc+U/Gxts7GBkUA2jVnwmI2tnrHxtsH0bbf46ZKpno
         6/93gPJvxSZYYrn/Y4TztcZF1SmXVZc312OW0NHIcvvgX/Vsa+DHQ5Ttlw23ldgzWlEx
         bI8FU875yzg24nuxNIeSpZFoAZ5KENO1E5MBiQOp7KcK8y4zDG+WhZ8PFAAx40JUMNU9
         Ase0a7KDfa4XR8RYv4vzm8/P8tCdRS9+RmGGfMu6pGIWP3OW5N+lmIMlKPN5E4O8U4wO
         LdkH22rXnninGuf0oGDKT0uM6K/ZXW9QdflLIeoHwvnEFiGKxJUiTo45S/Y29N/7fbem
         kbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755834713; x=1756439513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HtaId0UEXdWNlODSrBbRe1UfW9oq1uGtqK7BQmJdRjE=;
        b=KG4DRGtiPtT80XjwGHuFRLCmJLzsW0gtt5PC16d5YRA21Tlm+eW2bcb2eAlctYeCnJ
         XXcObkZVLawhk5ftCn3+KW2NecD6EeG1qvwzLlNki++DNQdoTDCqtOFt2/P6Dej4UqS2
         j8yL6CCP/anK5am0NN5tDMSi8288wlyh7gvkQRD2iVDt2h/pLGCN3ENZpItfdlmIyaqI
         8LbB05l2nskF88XRGU4DfKfaUFec7Vajmy+AwDSv2bh273pZgdSVlQQWbm1OW7FPbwbJ
         2RU2+kEgTtleozPMdkKK0m64WYL14NTXAAxwP3T9Bra75JLuw7Ug+GQbENTMGjp2csAQ
         8FPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHzbD7vINjeHstablCjGcjwOuqGJXro7KVodpLLdqf+YWEn2wEczOSb/eU3BsSRj9OyZA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6B7f7bxYFts1P4gKHn5qFX6bpNgVc9GFlCVr1nisjEthmKb+O
	oLjZOk3x/eP050xXXTFgUofPesj/wBIoB+fyxSziyzFEMzkt/LtBLZ6a
X-Gm-Gg: ASbGnctClqzYrgj+A9OaQwPs31PDnlmYEwGUp45zmKjpxyIDSrkfIMDzUpnMQvYaQIF
	Xkf/TjwRHFmCCnzObEB8xbOUSBewNqMJNVCg44FFjRbRuKyS1SwBGs3OMnHCoJcnwhnn9P8qThj
	MxPhap8cuWDwnJrcMhyG8X4aIsyHOXUnzQXQNAkI6Lm7VmvcrmWJhSDtrbr74ybwIIq9oh+usjc
	786oCdIwIZUpRhqJcMZce4pjPJzE19TKhrgLw+0isRnVip8MeEz35QC52hr3nQjI2PFGWMIEbsk
	QBgUGXixRaTlC598zjZgBW9G81zR50/HDGKf/TtQiV+RGP6eqrdLxKJ8ELYmeSpMZw8FnSfbuhE
	JyFx2yvGDXe9BAjzRJD3pmtWeKatl
X-Google-Smtp-Source: AGHT+IHEL8ONsqgS7iIxwqRUVPY9B8jnNtZgB3rknZG4iSaMdkOlahK3+51EyJoqDE0SH8cv7geg1Q==
X-Received: by 2002:aa7:8889:0:b0:748:e289:6bc with SMTP id d2e1a72fcca58-7703051195bmr1992722b3a.1.1755834712769;
        Thu, 21 Aug 2025 20:51:52 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:51:52 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:57 +0530
Subject: [PATCH 09/10] iio: proximity: Drop unnecessary -ENOMEM messages
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-enomam_logs-v1-9-db87f2974552@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=1421;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=o0kHbqFpyBP/mgTiX4N/QGk9oAOztYPO8grzmPdvqrY=;
 b=Q8J70rA64x5Wx/SDVM/m1/65rdR7MZeOH79krewJg9gKcpihiqbOP8UjztiODzFgeo32vIohz
 JBzgUFPJRTDAPYbuF7xQHLIOA4XuPnb93j9EvkSJSHk3SkSO6mnz926
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=

The drivers do not require their own error messages for error
-ENOMEM, memory allocation failures. So remove the dev_err
messages from the probe().

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
---
 drivers/iio/proximity/ping.c  | 4 +---
 drivers/iio/proximity/srf04.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/proximity/ping.c b/drivers/iio/proximity/ping.c
index c5b4e1378b7d..e3487094d7be 100644
--- a/drivers/iio/proximity/ping.c
+++ b/drivers/iio/proximity/ping.c
@@ -280,10 +280,8 @@ static int ping_probe(struct platform_device *pdev)
 	struct iio_dev *indio_dev;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(struct ping_data));
-	if (!indio_dev) {
-		dev_err(dev, "failed to allocate IIO device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->dev = dev;
diff --git a/drivers/iio/proximity/srf04.c b/drivers/iio/proximity/srf04.c
index b059bac1078b..f9d32f9aba1f 100644
--- a/drivers/iio/proximity/srf04.c
+++ b/drivers/iio/proximity/srf04.c
@@ -253,10 +253,8 @@ static int srf04_probe(struct platform_device *pdev)
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(struct srf04_data));
-	if (!indio_dev) {
-		dev_err(dev, "failed to allocate IIO device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	data = iio_priv(indio_dev);
 	data->dev = dev;

-- 
2.43.0

