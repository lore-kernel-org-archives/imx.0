Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5402253FD
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 03:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755834724; cv=none; b=fC1ArC4Zt9ySMb/AdcuZ8IpIDArP8aR0Lt+pME2KPMn/1ZkgisiFyc0lNpp6KFWWjC5Nx0TNHX5VjPe00AP5Qiy/VBcD3u65Eq1JonB0/ABdHzy/hvKf7jkUi/RM9fbV373IFOTEMv+e3LEupj+im/s4CCUa34NAtZsJO8BsmSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755834724; c=relaxed/simple;
	bh=/52vRgIJUjMO/j9jQkvKz+7tt80vmSfVQHF7sXmO88g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nVYy2Ro71pzi6cjVvg//0yw34h7aNDTsHiY2WO5K8nMGByNKVO2CkOEDrnkh9PUzV3c6T+bEm0sF+czdsbNyhcS8sAdFukWb/le2d9NxZogLR0NMRzm4uxt1E8550/nhpMeLSGi83Blg+Bca27pN6qQUaiFsbxk/xu4tH18ZLtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYy+HiPM; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYy+HiPM"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76e34c4ce54so1576253b3a.0
        for <imx@lists.linux.dev>; Thu, 21 Aug 2025 20:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755834723; x=1756439523; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=49sb8pd+Y6b5PW3M0gBrDMMusN8J4nmn5BPMHLBEa5M=;
        b=LYy+HiPMjJllYdtEbarOIO3DYx9ApNaXv0JynegHT8I8Fxg5SGdZf0eP2721DsggAm
         lMSvnlZWrh+jykpHcusiapcUIWyix9R16TaPgRf/YgyKz3k1e0nOTJu52++hUD1vHIYr
         Uhvz9PkeXcuhWzfQWnDqdtkAw+32Rrt26Dwak9cs0nb0H+J8MTgUSCppF1fKL7I5VLln
         Qj+wEMuWQrLu505iVi47eDWCXBIatSlEz/aIhHrP5oIR5YaLN1qfqPwtjQWhD5dy7KsF
         liTFZg5Sb5Xr8/jsUO5vP3QS1lv6lwI52ELBypvfw19xJCVDdJRYIlumW3PPV6lsJ+Mp
         S2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755834723; x=1756439523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49sb8pd+Y6b5PW3M0gBrDMMusN8J4nmn5BPMHLBEa5M=;
        b=dJSOnJu6MkLCnjsjPCQ9Ow+d/SY3+yQAvzzzukwNvk9JC5jk5g/iI5BEIKdqJivMOk
         aNyfq6FRkAWWndQkxFS3tYy4D9vbXG1Ds+9+9UB9MFt2io9PmcBHlGsdRP6OCO6m5I3q
         rjsYwQ4DINaRyQ+QhTna7CF9nsz4EUcyTCVVJs6SiEu0ysTVrbj2NmOYmKM6Bg4CN+pW
         OwijVs9CvKt7Savf0M+0pI4JGu1haaWhvuYjlU2RVQT9hFez1lon81k0QHCdqK6AX8/U
         UKRfAguEYKplo5VS+2pP6+oGqhFdyQfZsGW2LxFtDuHHcwSdNdsatD/Lfz1f6GdAhXWd
         pUUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7+3/U0LknQTeCsnn1+pm/zEK9M6ywpmxIWCHz6bV2hpWyHaMCaWr4NtWhNlPtmpBoO1E=@lists.linux.dev
X-Gm-Message-State: AOJu0YzrrLr/qjVzCswelZuEu5VzJOQAN0WwUihniPqvWgb663rMbVq2
	z6hFFGxZfmKuPbWT9J08ZM7crq5XEtmPoHG/uBH0umo4LdDCconWBiLQ
X-Gm-Gg: ASbGncuWXK4IHx5SMWbyXl+tVkRi+qhHLsh3LGUkOsHRHJtrzTQXmcov8buM+3GRYkT
	NzYtoMK/4ku1cdnKyidomTzOEAQaGhGp1CFhXoN0OzQIfnkIUmuVn45BsFOii702bFSbNiPIt9n
	z8Jquytfg5U0z4kVUkI14Ywd+/WO5/0n6XTCcJDsUPGtMNtg/Pgavfg4NRrKYKyFD3qgiWh1LS+
	nagVt4dmV4gilADTvnrVn8hHmVhUNwUNYK0/viYRlbBHEzDwHAi6fkbAszeiCnI4juLKtTJC+Jc
	LP4Csr5FBz1yeg1H8OWF5ecDaZaMK8RNBb5kftdlK5kObz/OkyFnf28GlTPKC6i7Wskmesi/C1V
	O5I2CE54Y5JTVSl8DO7U2pmqb8/7s
X-Google-Smtp-Source: AGHT+IE/XZWblGeCYZs22CUnDKwXULfC+6SOqnh7RXjuAgW/Urgwc5sc12Db+DpiqPeiba2SievDcA==
X-Received: by 2002:a05:6a00:1742:b0:76e:99fc:db91 with SMTP id d2e1a72fcca58-770305105c8mr1796426b3a.3.1755834722669;
        Thu, 21 Aug 2025 20:52:02 -0700 (PDT)
Received: from [127.0.1.1] ([2401:4900:1c7e:807:34f9:502:b902:b409])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdb1sm9449656b3a.27.2025.08.21.20.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:52:02 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
Date: Fri, 22 Aug 2025 09:19:58 +0530
Subject: [PATCH 10/10] iio: temperature: Drop unnecessary -ENOMEM messages
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-enomam_logs-v1-10-db87f2974552@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755834598; l=910;
 i=dixitparmar19@gmail.com; s=20250726; h=from:subject:message-id;
 bh=/52vRgIJUjMO/j9jQkvKz+7tt80vmSfVQHF7sXmO88g=;
 b=aO9X2tBzsuRCvTKvElyomG3RIlmdjR2h4cNhhqfgx56wssi9qwsbgRVsLxnMuUkDukkoN2haD
 KMTw66khfeTCy0kwjT6Jv3/dYxro2mv3JCJumcVZAKzBT0O80Sr5yzs
X-Developer-Key: i=dixitparmar19@gmail.com; a=ed25519;
 pk=TI6k8pjTuLFcYiHazsate3W8rZGU2lbOrSJ4IWNoQhI=

The drivers do not require their own error messages for error
-ENOMEM, memory allocation failures. So remove the dev_err
messages from the probe().

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
---
 drivers/iio/temperature/mlx90632.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/temperature/mlx90632.c b/drivers/iio/temperature/mlx90632.c
index ae4ea587e7f9..c4bf5dc2f266 100644
--- a/drivers/iio/temperature/mlx90632.c
+++ b/drivers/iio/temperature/mlx90632.c
@@ -1178,10 +1178,8 @@ static int mlx90632_probe(struct i2c_client *client)
 	int ret;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*mlx90632));
-	if (!indio_dev) {
-		dev_err(&client->dev, "Failed to allocate device\n");
+	if (!indio_dev)
 		return -ENOMEM;
-	}
 
 	regmap = devm_regmap_init_i2c(client, &mlx90632_regmap);
 	if (IS_ERR(regmap)) {

-- 
2.43.0

