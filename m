Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503BE30C374
	for <imx@lists.linux.dev>; Thu, 28 Aug 2025 10:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756376141; cv=none; b=uc6zIs5PysADonI1DeHhXndIgSvS4j3oR2xWT1zgjMH171eCWJ/71D7gsBQC2r29OtFO8hb5Ol5vU9Y24lnEMZQqdOn90h8omUQDXW7VH4flDbq3TsSJ7l6raaTuy02MwBaW8Jp32CfE4fEC3Q+6UN1X4iWh3Xps0KIkhqYCNFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756376141; c=relaxed/simple;
	bh=sqvq7B3cYnX+SujuTdequEm7LjrP2GZ4Bizi9Lc/GkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kfjsk6HD/mRCFztp4jAm2VIHZrJddnmwa7e1AxoAuitlwtX4pwCL/2QkRjQ3nUJB+nrLIhqVpQqoUsEZUhzy16aGXNwIaM8HiK9lMQgWRWKVxVA7ZeLNA3VcqQM1frXQOIkQAkhcZrXjHP85mY2cVLqJWcM1uXUmil6n2GjqdAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OSEqe8ui; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OSEqe8ui"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45a1b0bde14so4511555e9.2
        for <imx@lists.linux.dev>; Thu, 28 Aug 2025 03:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756376136; x=1756980936; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mslvKWnCwA5R0GFjrE3cKfPnj2WRNrIsVGNIIEDmLGY=;
        b=OSEqe8uiHyrTTlB8fv9OHRd/OtUizjhYhgITLmgmL5L9nkkEGblf48hxAlnbPfUh4C
         ZS6hiDG6eG7ICI1PZ6bJhIAVP2ucYeehDfSehKcL0CSEA4epjnySe/MZ5gnSpKfMwcxP
         qjMwEnNSoPTmC+sPUfLOmes/d3WPHeI+9BMdmbN+GpXWaPAcF+JFKPxB/9hXOCnd21Bf
         PyHTA5+epGG6KU02IPUWi6RPUNtIgUTrHSvQMssnY8EthzYUA+Tn4JQsDkYu8c6xKEor
         mOZcC+DdNph2Tk3wQ7ADtyD1PzhWhZm5JDTs8ZlWvKVth7J906rsvUtkO57TOLWCata4
         BaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756376136; x=1756980936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mslvKWnCwA5R0GFjrE3cKfPnj2WRNrIsVGNIIEDmLGY=;
        b=VGbUXctQBoPlRxsNFOrtFbojrC7HcQrpVX2oFwk46AGLGw8gIJvd3hkYEN/h2Hmvcg
         RQ4ZOjXiKO5arkCv7EHCQIRXqJEGgQ+QYLB5HFRy8LAqQHycys+YlRE/rev7Y/TwDMdc
         z6dx1yRsCLCsZs6Zces7Mgn0iyElXgpOYobtOZPfbjPyHdFaIHhnpu261p0cHJgT2WdZ
         2V+o/4tGR9C5QybbPe7CKw4prB1IoiyUegsM4V8ExXHnbusssGFpqqYYQE5WkiuuXuDw
         Kqtzru029IEasbbLw1laPhsuYVXjFJM+Nwi7mL7Cn4ZoK4VkUycdkfl7/0/da+dkbTEj
         A/rw==
X-Forwarded-Encrypted: i=1; AJvYcCXjfVCDbpt/qyqtqBMuS63n1Jp03e41MKfJmFo6m6L0k3fU5Ym9wWxZxWBayS1E3KMLk7k=@lists.linux.dev
X-Gm-Message-State: AOJu0YxXQB1Ix8ilN370KdjXt69O72WQvB7cHY293w9cR3XAWyYC490i
	IyvYx2sYOP0IT+69EQJ359k78jGtMmEJJJmrSEOyYz7ygQ/pzh8mcJvcJfpJWurs+CI=
X-Gm-Gg: ASbGncuCuyBIuYc+yV4FdADqXyuPLvMDYg32D04YB5Ek+TTOAHu7X1Np8cVUAv5tiHk
	JYDgcSXPjNW9ItkyhOm559ENxjY/hs3S0ExXLJZpWWunxcQqnHOLkfyL80IfELSXav/m4m8FXYt
	iCoiMsNQ/DUdKJXOtH7YTG/L0Ep/C0GuKBr9Db7hhchkDfsgW719pzSFnIjlr9hTJrrySKnR8M6
	rPeAFjnu7CktOcE+j8pfyPq6+1/7vHA5SEmgC39bxYsyigAhqSsoVy8hx0iAgU2amlYK7sVnHT0
	jtWRmjexCofIJSwZQqncyqARGZZuC8DBBajT6Jysk2FsbMocZfoeu/Wl7goHJ+RuotGUA96KyMB
	PNgLf2GxpWYv3IcmnxcU20/e2sQDGLII=
X-Google-Smtp-Source: AGHT+IGJFSfoE0AxLWLgGJCGXq0di07FqhCAiZYjub0zCcHk6GFk3QmjgumNtkoxiIwRhmFNhphqsQ==
X-Received: by 2002:a05:600c:1c1d:b0:456:285b:db3c with SMTP id 5b1f17b1804b1-45b6a660252mr64082875e9.3.1756376136508;
        Thu, 28 Aug 2025 03:15:36 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b66f2041fsm49976305e9.5.2025.08.28.03.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 03:15:35 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 28 Aug 2025 11:14:46 +0100
Subject: [PATCH v2 7/9] spi: spi-fsl-lpspi: Treat prescale_max == 0 as no
 erratum
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-james-nxp-lpspi-v2-7-6262b9aa9be4@linaro.org>
References: <20250828-james-nxp-lpspi-v2-0-6262b9aa9be4@linaro.org>
In-Reply-To: <20250828-james-nxp-lpspi-v2-0-6262b9aa9be4@linaro.org>
To: Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Clark Wang <xiaoning.wang@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Larisa Grigore <larisa.grigore@oss.nxp.com>, 
 Larisa Grigore <larisa.grigore@nxp.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, 
 Ciprianmarian Costea <ciprianmarian.costea@nxp.com>, s32@nxp.com
Cc: James Clark <james.clark@linaro.org>, linux-spi@vger.kernel.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.0

This erratum only ever results in a max value of 1, otherwise the full 3
bits are available. To avoid repeating the same default prescale value
for every new device's devdata, treat 0 as no limit (7) and only set a
value when the erratum is present.

Change the field to be 3 bits to catch out of range definitions.

No functionality change.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-lpspi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
index f16449cf42bb..ea25e8dab0a4 100644
--- a/drivers/spi/spi-fsl-lpspi.c
+++ b/drivers/spi/spi-fsl-lpspi.c
@@ -86,7 +86,7 @@
 #define SR_CLEAR_MASK	GENMASK(13, 8)
 
 struct fsl_lpspi_devtype_data {
-	u8 prescale_max;
+	u8 prescale_max : 3; /* 0 == no limit */
 };
 
 struct lpspi_config {
@@ -132,15 +132,15 @@ struct fsl_lpspi_data {
 };
 
 /*
- * ERR051608 fixed or not:
- * https://www.nxp.com/docs/en/errata/i.MX93_1P87f.pdf
+ * Devices with ERR051608 have a max TCR_PRESCALE value of 1, otherwise there is
+ * no prescale limit: https://www.nxp.com/docs/en/errata/i.MX93_1P87f.pdf
  */
 static const struct fsl_lpspi_devtype_data imx93_lpspi_devtype_data = {
 	.prescale_max = 1,
 };
 
 static const struct fsl_lpspi_devtype_data imx7ulp_lpspi_devtype_data = {
-	.prescale_max = 7,
+	/* All defaults */
 };
 
 static const struct of_device_id fsl_lpspi_dt_ids[] = {
@@ -324,7 +324,7 @@ static int fsl_lpspi_set_bitrate(struct fsl_lpspi_data *fsl_lpspi)
 	int scldiv;
 
 	perclk_rate = clk_get_rate(fsl_lpspi->clk_per);
-	prescale_max = fsl_lpspi->devtype_data->prescale_max;
+	prescale_max = fsl_lpspi->devtype_data->prescale_max ?: 7;
 
 	if (!config.speed_hz) {
 		dev_err(fsl_lpspi->dev,

-- 
2.34.1

