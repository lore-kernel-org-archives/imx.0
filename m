Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192BF28D8D1
	for <imx@lists.linux.dev>; Thu, 22 May 2025 14:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925579; cv=none; b=cZsQmb2G/lOcHRzbeIfo+q6C3trlHG1ihtyX/Un+/1EYTwNzgnbdxNP3Styhwm5qKk6LvA0YmrGycITAliW0hA4u+vqGSpzSsZ4857plbzjdiYzZj8TxQEVdT5UT+xxFGvfWknWjhBV43IF+DgWkv3iUQNU4PIq7w0VmbniWhQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925579; c=relaxed/simple;
	bh=k0PcdAJ0HJ4xwSr8Ni1t6OBhIXBRFHDlIiZHG4Apiiw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DGHaCPgzBCicTBBtHf70GfxUD7yWCU9HCSmXWDoMNXDrqmoSKiUqJ0VN7rF1ZvF11SlBM/KgANCrVMXMqXk+2uo/Cq9BG0to+SXOSrMFbpgpxOdyEAA1QOil/X97nt8xeqeXe5gKECc06nG0OXPioOc4c7PQTYadixVhXJgjzE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=slcfWRby; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="slcfWRby"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a36ab95a13so3284261f8f.3
        for <imx@lists.linux.dev>; Thu, 22 May 2025 07:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925575; x=1748530375; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLFyEyvP8ZFrDRQwCY+ktHxPM5O5euwpWz07D5k+81M=;
        b=slcfWRbydqYSAuCVm3lROmRFf3N4gYIb9zEX3NdCEg4vDrIoaNVOssTwRihjj9NXi9
         ug5t6sNQCC0c/Pl6h5vYwzGMbbG1zPqanbs665OUIa29EFnUD9ECO9Mqxhvfg+r4iWQl
         sBE/VZogqM7hDvKny1c7IfxHToWphYnw9ek0+VTRxgwrI7bh5U6oW1uJcBQqwfntEPJh
         /vUsyoR2eZ1MoZErsOJdXfdg91gjUlrtoCMNBVxCCBq+swsbox6D/xRz2PP8tyOTrp7r
         0nd+ghX/V9xnd+rA/HZZnb8TKEOUHMjEJElioI+UhS/QmAiWiad1h+WPmtFvs8IkPI92
         BScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925575; x=1748530375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLFyEyvP8ZFrDRQwCY+ktHxPM5O5euwpWz07D5k+81M=;
        b=bx5znquiQKZrNEZOGoqqvs9jYDih0DG0MCDPvEM7V8GTgfdjw/ILGze2TDA1e43mjE
         aPuByiZ/I1P7d79fA2mENBKMaAIpim9XnoHsdJwF6dwxy9ljhIwUztcR3+MRXdXFjQyH
         +sM6DNPAZpgImFyEDOm9JW30upwOXS35J2jxjcb7mFPIIINkkV5KWW7fWcq8Mwnf1LDL
         FTP06Ah60IToAJ6eIb6Rjc2szdQ+J4G6ITyGIeFl88bmkSEM4TO0jIGqxl0ySA5cMnLJ
         IIJ4bGyXUvV6WZa8nqYDvbRnwwnK0CKc2KK7vMd4RDnkiQbKBhUa2MQ6Cf9PCu4XofIk
         jZxQ==
X-Forwarded-Encrypted: i=1; AJvYcCX//KTgUc3wHKbRneNF/cHISP7lWQnu7fWMcOIk2u+MTdM/BtwhVBwt0tcK/2U/jbS4ZbM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5zDVFARsgBOlSZB8A7M/ZwHVneAOa5YVm8aAZ2NvX86H8jiUu
	YZqItGG60KkIIsNz7/wcRyKsFWvrmFvh60WuyaSPsXW5oCmjDgpwJzczRhLBmc5DOPI=
X-Gm-Gg: ASbGncu3gNdSNppA81TmcmAcKoPkrGuX+n1SCp3/kr97AllGAHyV2UFMaVlnL3+DWIN
	D5OSdhcq98FFZqfe26lUV0o1kjOsn2gJetBwwLt3OjdIPIAvbVVkaCuIfoAsBB0wDiIEPHTiqn4
	yGHwnvI6i08cWP2bhi3XTe+ZjVMyBdj48SbKTLDvhRg0wMV1cCAxYQxWxWrcxyYnCEHVFqS7/ny
	PZe806wXybAeEdgkyTQwLZpk6pln/YootW7z9HyJS65opl4QxScjFKuYH9S4JEtKm6AzbpkONZy
	ESMlQb0STjcJCon4s01XNPhFbNR1AlFLujPaw9fP7XiBHNctSY94fqCc9lTg
X-Google-Smtp-Source: AGHT+IHpujM/0/34jM6P3ZaQZmGH/9lm4oq4PRVyuyvqdp8HN5RGOmpnF0//KC96gVkhdqXMaCEYdg==
X-Received: by 2002:a05:6000:1889:b0:3a3:7e01:d2fa with SMTP id ffacd0b85a97d-3a37e01d307mr9061150f8f.28.1747925575135;
        Thu, 22 May 2025 07:52:55 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:54 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 22 May 2025 15:51:39 +0100
Subject: [PATCH v2 10/14] spi: spi-fsl-dspi: Reinitialize DSPI regs after
 resuming for S32G
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-james-nxp-spi-v2-10-bea884630cfb@linaro.org>
References: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
In-Reply-To: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chao Fu <B44548@freescale.com>, 
 Xiubo Li <Li.Xiubo@freescale.com>, Lukasz Majewski <lukma@denx.de>, 
 linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Larisa Grigore <larisa.grigore@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

From: Larisa Grigore <larisa.grigore@nxp.com>

After resuming, DSPI registers (MCR and SR) need to be reinitialized for
S32G platforms.

Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 77 +++++++++++++++++++++++++---------------------
 1 file changed, 42 insertions(+), 35 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index db5a2ed66f68..a3efe1bd3b37 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1284,41 +1284,6 @@ static const struct of_device_id fsl_dspi_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, fsl_dspi_dt_ids);
 
-#ifdef CONFIG_PM_SLEEP
-static int dspi_suspend(struct device *dev)
-{
-	struct fsl_dspi *dspi = dev_get_drvdata(dev);
-
-	if (dspi->irq)
-		disable_irq(dspi->irq);
-	spi_controller_suspend(dspi->ctlr);
-	clk_disable_unprepare(dspi->clk);
-
-	pinctrl_pm_select_sleep_state(dev);
-
-	return 0;
-}
-
-static int dspi_resume(struct device *dev)
-{
-	struct fsl_dspi *dspi = dev_get_drvdata(dev);
-	int ret;
-
-	pinctrl_pm_select_default_state(dev);
-
-	ret = clk_prepare_enable(dspi->clk);
-	if (ret)
-		return ret;
-	spi_controller_resume(dspi->ctlr);
-	if (dspi->irq)
-		enable_irq(dspi->irq);
-
-	return 0;
-}
-#endif /* CONFIG_PM_SLEEP */
-
-static SIMPLE_DEV_PM_OPS(dspi_pm, dspi_suspend, dspi_resume);
-
 static int dspi_init(struct fsl_dspi *dspi)
 {
 	unsigned int mcr;
@@ -1354,6 +1319,48 @@ static int dspi_init(struct fsl_dspi *dspi)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int dspi_suspend(struct device *dev)
+{
+	struct fsl_dspi *dspi = dev_get_drvdata(dev);
+
+	if (dspi->irq)
+		disable_irq(dspi->irq);
+	spi_controller_suspend(dspi->ctlr);
+	clk_disable_unprepare(dspi->clk);
+
+	pinctrl_pm_select_sleep_state(dev);
+
+	return 0;
+}
+
+static int dspi_resume(struct device *dev)
+{
+	struct fsl_dspi *dspi = dev_get_drvdata(dev);
+	int ret;
+
+	pinctrl_pm_select_default_state(dev);
+
+	ret = clk_prepare_enable(dspi->clk);
+	if (ret)
+		return ret;
+	spi_controller_resume(dspi->ctlr);
+
+	ret = dspi_init(dspi);
+	if (ret) {
+		dev_err(dev, "failed to initialize dspi during resume\n");
+		return ret;
+	}
+
+	if (dspi->irq)
+		enable_irq(dspi->irq);
+
+	return 0;
+}
+#endif /* CONFIG_PM_SLEEP */
+
+static SIMPLE_DEV_PM_OPS(dspi_pm, dspi_suspend, dspi_resume);
+
 static int dspi_target_abort(struct spi_controller *host)
 {
 	struct fsl_dspi *dspi = spi_controller_get_devdata(host);

-- 
2.34.1

