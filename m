Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969652FE06C
	for <imx@lists.linux.dev>; Thu, 14 Aug 2025 16:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755187635; cv=none; b=ThdkspTwl/L1MaXn9qn2c6cLfO+rxHQs8pcZ/A2NP5f9iTzgM/c5JsYygefXQ7RyM4lOza89d4QkWnQh5lnVB0vZyVZlBijYM64axsuqhnM86+hc13qef1nbJNI8b+CJlrlwYswh6xjaunovrLK1h/KZJ2LrBkzP0BpDPU8OVlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755187635; c=relaxed/simple;
	bh=ZiCKUtZKTqw9rKZf/7+lmX/pnv0/DEYvxI7bYI1KMjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oSp/ik+Vx0eDouBzwq4fEZurymct5vFEMkCmR/whm0WUb5IUoJfe5TY2X5AR/twQQonDAgjKTBbTiSG6HDMoVL+8sldWhKjAtuj8oJWk0Wk48YrjyjjczOju/6I8nRTskv9E5U2sZVUvncuSOtPxe4qx2bAG7mMt7T16hg3XFKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k17KXxKN; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k17KXxKN"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b9e7437908so990434f8f.3
        for <imx@lists.linux.dev>; Thu, 14 Aug 2025 09:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755187631; x=1755792431; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+xkEKCXMOBI9HGuIfKoOfST0QQ0+/qYTKxEDH2g02Q=;
        b=k17KXxKNYQMdjcNMnTGKkMfJm3JSqa3wTLhLN3agiIhtkyLod8n9qWgODn0lcnbiRO
         SXjrkvZb98Zs1SD7GD5CjUS/0XFXLtlhPqwsxN5ILhVzpwWm2RTbPq1cekBPJlV0pK/t
         r1lsQP/8uUk25Kg2MYSmK/rvTC0S6VOykcIiEz62k05L5FA9GL7qqUUYKV/KAczPVc+b
         OnQxn9SlflA2HIVYQ3ZnS3VtZkApK1RBtc38/etETx2/hRO5tVAUW1vUgkF3QjlhDGkj
         Nux9RSXh8YDtN2/eoznSvJ/7lPAlK/sg54f3zIC+dw3hgsMgxcOPTV5AjTZWFUqgU+EK
         56Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755187631; x=1755792431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+xkEKCXMOBI9HGuIfKoOfST0QQ0+/qYTKxEDH2g02Q=;
        b=S08rc+Zmc3zxCr5icCzBrXcJ4lI+3LXBQb53ocIYod7JV+paYPUwOcLhqH3plPr/as
         PLKCueoma+81eG50ZE2oYp4hgnh7KjLBQsyq/YejpC5BQbFMC6q01VpIz/7JFWD5shkG
         gt6h19/1gozHqoICKEVMNUzAdv6ido7S2pdnm9OQCEGKtq/ubwT77qqzF71nLqMgYkGG
         R/A+jJW3NbeX07Z0XQPxqs9+0DwhPMHqt+8DuCNNUXryRJa9bmtHSUpGJQt3I5QjJHy2
         YGa2ghGnMezOM20c+gfXLcvuMo7Q9BagwDJHf9DOFbrQo5skVBjlFHUvdbiaqIMJxWeR
         zKPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8RmZgIV9AQKfMwj+SYoTFytz0LXozh32ntzlLJb7Obic711dJXblSAZTWuWrT7f354Z4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGxmlHvYnPpcqU3yXZ71kqIktblAlvCiD7wrlS37BGojetdA4g
	c99aJHnP9+1MAcXLWZaGPp+xEF1zHQ9/aoA8uqiWKaSYtOACPDrtYdVZGqpH0V/gpl4=
X-Gm-Gg: ASbGncuEyIUq1+6liYPswOakLGSkasHubi9Ck3dB0pq4ueKy2MWMLx010QQ2KF8UR1D
	hb3RLOaF+lXzbXdLKoggUPxM/PD1tpLm46eNwyAu6WYdxx4dkVk+rbstuygjQQgvmES8/UOxWbM
	dJjpP0aMB00+ekg8N+aY9nqRil0FXyBwQVkUjt7/Kim/hz6xwfPby4dBCyDl93MhggYy/VwTdsk
	5l3aBYEWUKHH+9mhSiGm67gH/HxiInIpRKB6rQrkhnj5zZ4njtppEuqTwA/PFYT7oveu6bdQ7U4
	GbS09c+fNFHVS0Y28rACe5mC+q2aTbAfKF4//2EC4UhlFWXxhAgzDEsCDTsNySrh9eQ5mhPQ+07
	/oDQUXgKRPrg9uwvP284w4vacdBHJDfs=
X-Google-Smtp-Source: AGHT+IHnPTemnQhlu4YOUH9ujk8ivLrojbab2xEKJpPhGixHfcJ0gQI64MgagrxrAFS1KKMyz+LVmw==
X-Received: by 2002:a05:6000:22c1:b0:3a4:bfda:1e9 with SMTP id ffacd0b85a97d-3b9edfe4a34mr3391077f8f.46.1755187630845;
        Thu, 14 Aug 2025 09:07:10 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bd172sm28363495e9.6.2025.08.14.09.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 09:07:10 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 17:06:48 +0100
Subject: [PATCH 08/13] spi: spi-fsl-lpspi: Make prescale erratum a bool
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-nxp-lpspi-v1-8-9586d7815d14@linaro.org>
References: <20250814-james-nxp-lpspi-v1-0-9586d7815d14@linaro.org>
In-Reply-To: <20250814-james-nxp-lpspi-v1-0-9586d7815d14@linaro.org>
To: Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Clark Wang <xiaoning.wang@nxp.com>, Fugang Duan <B38611@freescale.com>, 
 Gao Pan <pandy.gao@nxp.com>, Fugang Duan <fugang.duan@nxp.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
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
bits are available. To avoid repeating the same prescale values for
every new device's devdata, make it a bool.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-lpspi.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
index 332a852b746f..1013d5c994e9 100644
--- a/drivers/spi/spi-fsl-lpspi.c
+++ b/drivers/spi/spi-fsl-lpspi.c
@@ -96,7 +96,7 @@ static const char * const pincfgs[] = {
 };
 
 struct fsl_lpspi_devtype_data {
-	u8 prescale_max;
+	bool prescale_err : 1;
 };
 
 struct lpspi_config {
@@ -144,13 +144,16 @@ struct fsl_lpspi_data {
 /*
  * ERR051608 fixed or not:
  * https://www.nxp.com/docs/en/errata/i.MX93_1P87f.pdf
+ *
+ * Devices with ERR051608 have a max TCR_PRESCALE value of 1, otherwise the full
+ * 3 bits are available (0-7).
  */
 static const struct fsl_lpspi_devtype_data imx93_lpspi_devtype_data = {
-	.prescale_max = 1,
+	.prescale_err = true,
 };
 
 static const struct fsl_lpspi_devtype_data imx7ulp_lpspi_devtype_data = {
-	.prescale_max = 7,
+	.prescale_err = false,
 };
 
 static const struct of_device_id fsl_lpspi_dt_ids[] = {
@@ -329,12 +332,11 @@ static int fsl_lpspi_set_bitrate(struct fsl_lpspi_data *fsl_lpspi)
 {
 	struct lpspi_config config = fsl_lpspi->config;
 	unsigned int perclk_rate, div;
-	u8 prescale_max;
+	u8 prescale_max = fsl_lpspi->devtype_data->prescale_err ? 1 : 7;
 	u8 prescale;
 	int scldiv;
 
 	perclk_rate = clk_get_rate(fsl_lpspi->clk_per);
-	prescale_max = fsl_lpspi->devtype_data->prescale_max;
 
 	if (!config.speed_hz) {
 		dev_err(fsl_lpspi->dev,

-- 
2.34.1

