Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6321BD4FE
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 13:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718632208; cv=none; b=SNbsysrHoF835VmoZ1AdtFXqKzoU580Grb8we4Tn/TtaBi59LZkJulRNa71cgEBjVZkpQidHfpflsAgRCxiIFMF0R3mbgoy5rTdRFCTKvSBdxN2Y9SivAIjn+UgtD1/17cBErQPhz1CeQEylRGD82dPyZGkWQHvpUvTCurExY6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718632208; c=relaxed/simple;
	bh=zWMvkgbpb12CypNp6YHAF3/7MiDNI6jYeCI/ir0hmEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XShzD1FmRY7WrHeuZQJ80N8QBiwBHYku3A2khS/Un10jLQsq94ozt8RkHY/i+YGYG0qsPLdv+NhstbO6S3reOzi5Vbc0aCxUOp7vQ0pVJBetE03T4FRLPSzFEDYVCN6rFEHeVGCoYGLGra/y27Jr4CjtadVepZfiVMxNJYotvRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=eRiJDO1f; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="eRiJDO1f"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-796df041d73so313355685a.3
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 06:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632206; x=1719237006; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QUJvHuZZxgwBDIkIwz1c6/5nEPPRUcnNJo5C6L4NEfc=;
        b=eRiJDO1fRpRfsD00XPOg8xMJgEswbHDh3lP2E3Uq07UHCNQ4rFlB5awGLKN+POakCQ
         VccFfVXNqZIMvSrOW1Vq6Ma0zhOo7vrQTEXCgVNrnZo2+4JtFcBW8MIBCJASf5qDTdFu
         MZckcef/RbhStB/rTM9ERewn2lB+pmMF1UKEdXYX23s4V+MzowC/+ilkrXIk2A60CMnq
         ZLoI6qpLk+mVLxYosErExV3dRRqIQbylfqgIbbFBh1qdMaQ29YMJuL8QOYAOIIPQkZ/5
         GDnJHwZKqB/PYGQ8wyoE2TljmwEO1C0DKM9sP10HdQnLaq9g9AxPFbw53fFv97G60MUf
         qKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632206; x=1719237006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QUJvHuZZxgwBDIkIwz1c6/5nEPPRUcnNJo5C6L4NEfc=;
        b=eDKc77CQZJ8uNbEZMhYhZ1ZV1czuuMf9xE5aLA7gnZjWQ4UAH9SxAaMe+xIwy0l4uV
         m2B+ZNNyDC57Nnq+Png6mf/TdHSPH8CrXccyEkY93oJ1diXI2ro4tUrfLUosDMx8iAcA
         ML5gHZmQBycjYrDU38QM7JvfE7esI+KanHRO/d4R4AgkE4F7vvgVj+L+JmM6zm4lRFxz
         Y5SwVYWAOB1Qv4H/Pe7A/8h7XW3EZkBkXGG8kuOeoYxg2QV5cm/K45nX9cp2Nb2RcxFY
         nhJDaZqTR5VLROVeLRf2YWE0ZaZ67JOSfjLCaShP3gk6e4UyqYPj8d6BwuwYkUbVNPJx
         5njw==
X-Forwarded-Encrypted: i=1; AJvYcCVynZbw+edL+0Oprk9EouHOUWWCNuf5ZGhRIEmesp8qtnA2sgpzD+n+c7GQeCKFZg4weM8Jzl5BYf1p3ZjN3tCIKiSk
X-Gm-Message-State: AOJu0YyKOEGP2TIUAP+GNkj4tsbuE4Bj6cKUctRge0MfH/JKs3nrH54+
	yLxWtkesLYLKHjoKQCDD+OdyDdjSzrqt4aa4XrJ2f99RSLq3HOioaRB53J1MelA=
X-Google-Smtp-Source: AGHT+IEuE3X+Ttrgd1pciF1gOmiGqm6CNudwXH5GABygzdDAc5BXX3iLlJx1my8INZ4E7qgPOczVYA==
X-Received: by 2002:a05:620a:444f:b0:795:5815:2f9f with SMTP id af79cd13be357-798d241d00fmr1205475685a.25.1718632206164;
        Mon, 17 Jun 2024 06:50:06 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:05 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:50 -0400
Subject: [PATCH v3 10/41] iio: adc: fsl-imx25-gcq: make use of
 regmap_clear_bits(), regmap_set_bits()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-review-v3-10-88d1338c4cca@baylibre.com>
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
In-Reply-To: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, Chen-Yu Tsai <wens@csie.org>, 
 Hans de Goede <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Saravanan Sekar <sravanhome@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, 
 Crt Mori <cmo@melexis.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.13.0

Instead of using regmap_update_bits() and passing the mask twice, use
regmap_set_bits().

Instead of using regmap_update_bits() and passing val = 0, use
regmap_clear_bits().

Suggested-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 drivers/iio/adc/fsl-imx25-gcq.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/adc/fsl-imx25-gcq.c b/drivers/iio/adc/fsl-imx25-gcq.c
index b680690631db..b3f037510e35 100644
--- a/drivers/iio/adc/fsl-imx25-gcq.c
+++ b/drivers/iio/adc/fsl-imx25-gcq.c
@@ -87,13 +87,13 @@ static irqreturn_t mx25_gcq_irq(int irq, void *data)
 	regmap_read(priv->regs, MX25_ADCQ_SR, &stats);
 
 	if (stats & MX25_ADCQ_SR_EOQ) {
-		regmap_update_bits(priv->regs, MX25_ADCQ_MR,
-				   MX25_ADCQ_MR_EOQ_IRQ, MX25_ADCQ_MR_EOQ_IRQ);
+		regmap_set_bits(priv->regs, MX25_ADCQ_MR,
+				MX25_ADCQ_MR_EOQ_IRQ);
 		complete(&priv->completed);
 	}
 
 	/* Disable conversion queue run */
-	regmap_update_bits(priv->regs, MX25_ADCQ_CR, MX25_ADCQ_CR_FQS, 0);
+	regmap_clear_bits(priv->regs, MX25_ADCQ_CR, MX25_ADCQ_CR_FQS);
 
 	/* Acknowledge all possible irqs */
 	regmap_write(priv->regs, MX25_ADCQ_SR, MX25_ADCQ_SR_FRR |
@@ -115,11 +115,10 @@ static int mx25_gcq_get_raw_value(struct device *dev,
 	regmap_write(priv->regs, MX25_ADCQ_ITEM_7_0,
 		     MX25_ADCQ_ITEM(0, chan->channel));
 
-	regmap_update_bits(priv->regs, MX25_ADCQ_MR, MX25_ADCQ_MR_EOQ_IRQ, 0);
+	regmap_clear_bits(priv->regs, MX25_ADCQ_MR, MX25_ADCQ_MR_EOQ_IRQ);
 
 	/* Trigger queue for one run */
-	regmap_update_bits(priv->regs, MX25_ADCQ_CR, MX25_ADCQ_CR_FQS,
-			   MX25_ADCQ_CR_FQS);
+	regmap_set_bits(priv->regs, MX25_ADCQ_CR, MX25_ADCQ_CR_FQS);
 
 	time_left = wait_for_completion_interruptible_timeout(
 		&priv->completed, MX25_GCQ_TIMEOUT);
@@ -272,9 +271,8 @@ static int mx25_gcq_setup_cfgs(struct platform_device *pdev,
 				   MX25_ADCQ_CFG_REFN_MASK,
 				   refp | refn);
 	}
-	regmap_update_bits(priv->regs, MX25_ADCQ_CR,
-			   MX25_ADCQ_CR_FRST | MX25_ADCQ_CR_QRST,
-			   MX25_ADCQ_CR_FRST | MX25_ADCQ_CR_QRST);
+	regmap_set_bits(priv->regs, MX25_ADCQ_CR,
+			MX25_ADCQ_CR_FRST | MX25_ADCQ_CR_QRST);
 
 	regmap_write(priv->regs, MX25_ADCQ_CR,
 		     MX25_ADCQ_CR_PDMSK | MX25_ADCQ_CR_QSM_FQS);

-- 
2.45.2

