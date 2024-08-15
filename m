Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A187DA82
	for <imx@lists.linux.dev>; Thu, 15 Aug 2024 11:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723721123; cv=none; b=NuCG8lBXGLQ3GMXXgcRvy3eQdyN1tmDU+y7hwZsvoHgFNWKTSWmzrdnZt/JsOFdIZReh/KWMDniyGfJw6SUiCKJ2tJMxj9C194Xlm5se/9hyFNEM5cXK1A/+9RER/F5Z+i2eJ6yiIsNt1u3BPa5a0uQ/lBqzxDeMNA7IwftVy0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723721123; c=relaxed/simple;
	bh=9r69U4+Vlyv0XEbqFBAdBfxH7OVJ2VXkioo1Q5babH8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r5S0GzOiwmDAP3pgW6EksDL62hRyboiiCvVF5CYrAGWSOZxyxX6EwXNkPtZ7UycWCWRA5pCk1MNW60nLO2ueH3Hz0NrbX2eBR0s6KxvgjF25QWkmmsykYj/SYIA/doxPjBj8znLjP8BMZ2YpWjBbT3CcU7+PuFi0k452b1XIhzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kSv0oru4; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kSv0oru4"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a7a8caef11fso110881266b.0
        for <imx@lists.linux.dev>; Thu, 15 Aug 2024 04:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723721121; x=1724325921; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qswmFLJc+rRJnvMK5o1RhUuE0PL9fCewlpe2LTSF+JQ=;
        b=kSv0oru4wr9s3xlZrlXNHKz2D6gFECVCaZ9JiH6gwK1VnKcjXXB1tfB4mt4PBFtew/
         sCWEaESM3gz80C2EXtcV85Aqf54AmtvA3qc6CCEyVaPP7sPHwged7G3zdvFfHvNar1Yb
         /tnRpoKoEIB1JqONI2wBKSqBYaJUqwiLwGqIvF9tLojNQLOGgp8Z3w3wha9bostPYtOs
         RflFXsYwZu6moYw9gYas76/OQcvZwbRpli9+vJazzWSbpy150LaWI4mBnZv7MokyaTVN
         Prv8bzuT2IeUhlqMakjnK4LwM2x1wIjcbw+pNbTafjclt7JU394YWehc2Vm4EzQ6467+
         uT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723721121; x=1724325921;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qswmFLJc+rRJnvMK5o1RhUuE0PL9fCewlpe2LTSF+JQ=;
        b=AX32RW7dZZ95w7P58eSis4+R8GgKHQQv402Kk5b51jn5MyfRZoKZZESrgM8RgD/YZH
         5WA8og7TiFFemd1HVAGnQyk914GFxBjeKhd4/velAfij9x0u7xDRFedliBx0+kx47l0p
         bwFOLypGW3v23J3M2N69PUMzqWEXcV2Mkm08Fwu6EbvNGmxXNcnbJ89hI73/YwXUvTOm
         jNYtLHHgh/U3spXGVPLpogTEH+dLcKnylypI6vrYooFNNXZdXFwDYju5oU4SUQu1JF+Z
         6Bo6CD00PsJrZNyMwJ2BcAYo7a14HJzC1/wN9u3Ut7RXnMV7tR2nqvNqJfjgwRRaFrTx
         C5ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzBowcWoyxHefd1Mkr/CzlKG7OyoC8JpUwo3Vr2DSKE7Z6YMQVhrTZVzHILIg+VKut/rT6eKeCccqciFulYx3g7ngF
X-Gm-Message-State: AOJu0YyWawJbP9uTfF+iqUBlLpwq//tl95qqkByupC7wFHEgyWcvmEsC
	tQTEMYHzf7T6+lp9kuZNee+VYbfNJm31AAL2SxOpHfuL1XkqQhPApLByFk4sfSs=
X-Google-Smtp-Source: AGHT+IE04IYzhOFDEe/StHeMv+I9KreAuEIMLJabn0MgWVsiJJeJsCqyh9XE5pP5z25EACFGgtwnLA==
X-Received: by 2002:a17:907:f1d4:b0:a77:e1fb:7de9 with SMTP id a640c23a62f3a-a8366c0f0e2mr501782366b.5.1723721120636;
        Thu, 15 Aug 2024 04:25:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a838396ce0asm85941166b.206.2024.08.15.04.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 04:25:20 -0700 (PDT)
Date: Thu, 15 Aug 2024 14:25:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	linux-ide@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ata: ahci_imx: Fix error code in probe()
Message-ID: <cbcbdfc2-ddc7-4684-8ad4-018227823546@stanley.mountain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return a negative error code if devm_clk_get() fails.  Don't return
success.

Fixes: 3156e1b2c071 ("ata: ahci_imx: AHB clock rate setting is not required on i.MX8QM AHCI SATA")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/ata/ahci_imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/ata/ahci_imx.c b/drivers/ata/ahci_imx.c
index 65f98e8fdf07..6f955e9105e8 100644
--- a/drivers/ata/ahci_imx.c
+++ b/drivers/ata/ahci_imx.c
@@ -963,6 +963,7 @@ static int imx_ahci_probe(struct platform_device *pdev)
 		imxpriv->ahb_clk = devm_clk_get(dev, "ahb");
 		if (IS_ERR(imxpriv->ahb_clk)) {
 			dev_err(dev, "Failed to get ahb clock\n");
+			ret = PTR_ERR(imxpriv->ahb_clk);
 			goto disable_sata;
 		}
 		reg_val = clk_get_rate(imxpriv->ahb_clk) / 1000;
-- 
2.43.0

