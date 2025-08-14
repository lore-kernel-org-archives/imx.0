Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096B92E172C
	for <imx@lists.linux.dev>; Thu, 14 Aug 2025 16:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755187631; cv=none; b=XCfojmaJf6wEJ5y7CiWayaYYo3TQpCrJl2TKoPTSk2PydV3FUaEK9y6XYB2fEmwewOOorVe6zAsL0aakX+1ku7FUXKFvCl7LLud8tok7ZNpkf2KBC8EYZGS9npDHnsx7Tawh2YX/IFgJru3dCXIapo7BO/VB6UT+J52QHqDSrrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755187631; c=relaxed/simple;
	bh=bWgha+DV3Wa1id7olbSo3Evp0auMrFKcgECRKOQUQgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YT+edwnNoh4BzanVaVQYMrrzjrpWAbV8XaBWABJ6e26Cb34m7wAyyZ1qeJZn/e8FUk7lcmLHDA9P7sQ8CKnuZSN6mRvIdHMof/qSZq+nc6B8k4tmzbIsrRVR/S9Htn91HBbMejKHYCpLlakoYLYX5BluPD3q8ieIlxBbwuUV6XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qgoACHnA; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qgoACHnA"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45a1b0c82eeso7633665e9.3
        for <imx@lists.linux.dev>; Thu, 14 Aug 2025 09:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755187627; x=1755792427; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aHOC2LGUA3QZ5xVo8Zfg2sW76sxCAGlwB+vvvOMaDRw=;
        b=qgoACHnAGDLIMxcALrGUeUfnsPHd82C3WDcAlydl4TR1Q3+i65+SCHlnSRtoEadp0Z
         7uZq8lwkrHjT5m1txzyWsYFSMl2y4BXQ3mh51vtOUFQrBwh8aSDGmWg379ulMfwxqtnt
         y2w2NCmiUZPC2oUb1G620RkhZISGDgWuJFhlLT4FIhxQ7LwApZaAzrShiQesLJkMy/Z+
         aAwjsPcqIGWh8qL5OHOWjgSEDBb8tZHq+wpqhT5UmxaSV/8z6XqeTXM9y0L6krfe9WhN
         piD7Vz/hmv3UioYou+bBhG6RUuzey9VIBOGAjoa/0GQ7FZvDXqz93+0TK52GipRpbatb
         bXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755187627; x=1755792427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aHOC2LGUA3QZ5xVo8Zfg2sW76sxCAGlwB+vvvOMaDRw=;
        b=qBlujelK9l+8rIUKcgEOXgtppOtkgwef4bgzONqDQkUl8ePvuXdZIPImsUCP7dWPoh
         cAEwe1O1W6qH8ZQszCZ5vCAy16PBFHCT7vDD2SO9sBr7FWNNAG0AVOXU/eWjDzeQGfTf
         w2UtP6wqmwH0MdcnjkVY1Dk7yi9t2OAGuQgLnoHck2Ihr6TVKx4KjJVwjV1agGLk0wWQ
         gxkDVaGbEI/dyI2Myju3Ix6Ch1kdylKegTDKeRpX9lXDAQBxJpIFiNZm0mIIkgWSfYkE
         dHNpDbRXZMI1rqoujZ4Q98b82Y3Qph+2oloO6x6pm1a9pz2HiOucuAoROqPpRiJW/qle
         EixA==
X-Forwarded-Encrypted: i=1; AJvYcCWaU4mpUSvp99eb4y7vqhXQztOWoNoN7S/eQxpN5n0gDxFWqPLRh1eqK1AAx0AZPPYh2iQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhAAZAiua2YsnNSsoymIBXPYcrbnKr3Y0SEVzlKoDdzslLFbrX
	qvIBiiazFycw2vF5Smr4H6hOsHhkOyjsFjj7C6KqyxoBRmJ64XrmzGsPKPU9YN5O1Uk=
X-Gm-Gg: ASbGncvi6iyCgjKOAB5vJzNBo3Clyzu23EJAw9X+Fmei1cjM5QBIJPa8scyEnkOG3XJ
	8cX5jHm6IMfigEagFHakOOnV1XVn4+84/Fs7Yc1pnoxRDi/zCK3JmE+K1WEt913WHSPy96U1BjT
	P3z574Vo7r6dUh2/8poSm/qEbBzxY79iziHzx0NjcTSWWZte5B0KmBubJ+syptIoSz3o56YlNws
	n1ZNzuAvyvNkKIcVynota/P+LffeRq/uwxBG9mYg1+r2GJV2mYH8YIhbPNYnMyy+5wIBGCKfRcd
	09LchofpevTogKwsDLuffBpMCGqcb8xwrBCWCxGsi8TZ1Kb4W7QaU/nRWcQaAT2T7NGjZ/noXVK
	JuNChvHxVs58XaP2JfJFieaRpJa3KeP8=
X-Google-Smtp-Source: AGHT+IEUHsQ0l/NtdaJERHq/WSd00uZIkZVtp4OgX2ON8GYUOwmRShR360uVb0ELZ0IKVWDhUp1roA==
X-Received: by 2002:a05:600c:4e88:b0:455:f59e:fd9b with SMTP id 5b1f17b1804b1-45a1b6707e4mr33074545e9.24.1755187627290;
        Thu, 14 Aug 2025 09:07:07 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bd172sm28363495e9.6.2025.08.14.09.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 09:07:06 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 17:06:45 +0100
Subject: [PATCH 05/13] spi: spi-fsl-lpspi: Enumerate all pin configuration
 definitions
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-nxp-lpspi-v1-5-9586d7815d14@linaro.org>
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

Add all the possible options, use names more similar to the reference
manual and convert _OFFSET to _MASK so we can use FIELD_PREP() and
FIELD_FITS() macros etc.

This will make it slightly easier to add a DT property for this in the
next commit.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-lpspi.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
index 79b170426bee..816e48bbc810 100644
--- a/drivers/spi/spi-fsl-lpspi.c
+++ b/drivers/spi/spi-fsl-lpspi.c
@@ -69,7 +69,11 @@
 #define DER_RDDE	BIT(1)
 #define DER_TDDE	BIT(0)
 #define CFGR1_PCSCFG	BIT(27)
-#define CFGR1_PINCFG	(BIT(24)|BIT(25))
+#define CFGR1_PINCFG_MASK		GENMASK(25, 24)
+#define CFGR1_PINCFG_SIN_IN_SOUT_OUT	0
+#define CFGR1_PINCFG_SIN_ONLY		1
+#define CFGR1_PINCFG_SOUT_ONLY		2
+#define CFGR1_PINCFG_SOUT_IN_SIN_OUT	3
 #define CFGR1_PCSPOL_MASK	GENMASK(11, 8)
 #define CFGR1_NOSTALL	BIT(3)
 #define CFGR1_HOST	BIT(0)
@@ -411,8 +415,9 @@ static int fsl_lpspi_dma_configure(struct spi_controller *controller)
 
 static int fsl_lpspi_config(struct fsl_lpspi_data *fsl_lpspi)
 {
-	u32 temp;
+	u32 temp = 0;
 	int ret;
+	u8 pincfg;
 
 	if (!fsl_lpspi->is_target) {
 		ret = fsl_lpspi_set_bitrate(fsl_lpspi);
@@ -422,10 +427,14 @@ static int fsl_lpspi_config(struct fsl_lpspi_data *fsl_lpspi)
 
 	fsl_lpspi_set_watermark(fsl_lpspi);
 
-	if (!fsl_lpspi->is_target)
-		temp = CFGR1_HOST;
-	else
-		temp = CFGR1_PINCFG;
+	if (!fsl_lpspi->is_target) {
+		temp |= CFGR1_HOST;
+		pincfg = CFGR1_PINCFG_SIN_IN_SOUT_OUT;
+	} else {
+		pincfg = CFGR1_PINCFG_SOUT_IN_SIN_OUT;
+	}
+	temp |= FIELD_PREP(CFGR1_PINCFG_MASK, pincfg);
+
 	if (fsl_lpspi->config.mode & SPI_CS_HIGH)
 		temp |= FIELD_PREP(CFGR1_PCSPOL_MASK,
 				   BIT(fsl_lpspi->config.chip_select));

-- 
2.34.1

