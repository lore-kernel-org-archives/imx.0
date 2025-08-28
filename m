Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE2230AD08
	for <imx@lists.linux.dev>; Thu, 28 Aug 2025 10:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756376134; cv=none; b=jNbvu5jV6GLB+TSquqz1y4pof2geZ033MV2v3WqbVxXxxPxoCCPmNohCKnVGX1GHOh6qTPeqO7tzYnnrCHk4DZyx7Oj9CmDKbjmAp3dBBpjKQqM2JHM+eZAtfg0aZXwJIrUk3bFuspyBBahaA8rOrR6Er78UQymtvSn6MbnBy7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756376134; c=relaxed/simple;
	bh=fm/irSgzzRUae8EgpEM+Pogy/qYxrilpCYg6GpKRXl4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jfrXO6/q18lg2+J3ICB3wGsAMWNElHbZZx5Jx+TgQ98D0qWQ75lBgNSJwAL57xyM2sfkI3Q0SIAdryLh3/WCMHezwhQokvw6q3nNkVV4M20xiKlofP1Po5sGNHl+Z18Qsy93aOer2mntvnff1FnZqSvaAoJMddks1hTYBzOilrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YCqowhrR; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YCqowhrR"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3c6ae25978bso585982f8f.0
        for <imx@lists.linux.dev>; Thu, 28 Aug 2025 03:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756376130; x=1756980930; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XiQVBV7G4LRmwXHt7vlktdEd7OWZj1eSrzy2LZFlNd0=;
        b=YCqowhrRDASUmvNIneuBYJ4AGJL9lI17kEbIdBvMirpmjQ7rrq7S1ptdaRJXiAmKmT
         QLW7fi9ygNhPPtjvMAscHJ5XW1bhX6ksirDCU5OM1UBxac0lTB3AwmPBS7qGopE7MFuS
         0S2uGBfOAsJU8sw5HPlQBc8zcCzdwqyMpmHvvl9TmlyElIOZcZTHfPbzGn9Vc2eq0k4k
         ha002R9ebMJkWoWT/1MZ0/AujAIhD+6P/6bIaaExKuXNcGft1I8DewMj0LYywVbJkKqZ
         YNmtOxn5UqBlI3Jyr2Ftt96spFEBzs9MwAfe/Btx/Sa6+WvQ66WFE0Szd7FKSjvSxBvD
         YqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756376130; x=1756980930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XiQVBV7G4LRmwXHt7vlktdEd7OWZj1eSrzy2LZFlNd0=;
        b=rO1m5Ype3z40kFxvkOeS5FXne6DwvfT3Xr/+7C8dN46UQ68RGNt8F5Yh7ak48DwNtr
         wDfz0GPVMj9z7LNj53hnuT8eTOgk0SSsHTjQ1+ecbf0tKjaZ7OTJT+v0qAr93O16fbD7
         xXgxiqGqoPwlxCmFDDcI39pS+3VR3BGGOJWJOE6eWK8E+aP5aqxC2MUC6/X6ihUuY2cI
         T4H8KUi/lO2hnAahL7B2nVgMcYCmQQWh5PnmcznJz7++qlRGCQg6HSEvSXBJzokfQwX2
         buGu3CqsgKMocyeHdIKdnrdTwbRiLGuinPRsbDsPZFnprefgTmVOViCqVzNrqaun27fl
         EGiA==
X-Forwarded-Encrypted: i=1; AJvYcCXxXt3oNLqWzFudvdY0935kSKGKGMS27jPwvjVXOWKqHLje7qG3HOfPc5+Edv9SfKCrd6w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4M+RHYhVsWj30OqDcg+uNYi/2SVKugnbIHlOIpPn1t4u6894Z
	oXBbqBYQB3x3t/kKxU8gYktZtpxtLc5uNyLiigLTYfQaKPbsWhMua5hmSVD4HxUynbg=
X-Gm-Gg: ASbGncvKKhtYHnopdqUSQkJnQDmnNismksog+PLdJEhMzzdJqg7SAajofzzAZU5bB5Q
	YkWZU5veGBWTjs9ucp4peE7gJQ1r9x8qo1EDbLedF9Lcsj2komG81AnlGPH67gAz9N7OhY00Plg
	Y5p3n8pzvD0Dhpu9M6VTpwiqwS5jZfT6zIh2g6dAU6dT3juSzSeOKzZQjSHeFqDBwfRwu7SfTa2
	jWYApjgiIOLVYYOMAOnKZSe4lKpYEQXcHtElKEaBYwp3bNl2Q/dW/M2yG+s/U4VKPR0mC448Zpe
	GXj/juFkpWhLI9udqUbLM4i/R8wG9sltlm5n0KhFte6s7OevvKryPF/iqEsX5icxyTE5Ct4MUXh
	WOTRP4KFOoHB4p57cQpluLPjIKiHOKSgbKfSXaPeULV0Y8TFVNCWz
X-Google-Smtp-Source: AGHT+IGuIIt2MipEGX75tHuVYdu+fYH1fy/yLSbgALOvLFpEQrFBLgKzzW8donfheTWMs1EJa6U4aA==
X-Received: by 2002:a05:6000:200e:b0:3c8:5b40:dea2 with SMTP id ffacd0b85a97d-3c85b40e7f4mr12640141f8f.44.1756376130407;
        Thu, 28 Aug 2025 03:15:30 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b66f2041fsm49976305e9.5.2025.08.28.03.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 03:15:30 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 28 Aug 2025 11:14:43 +0100
Subject: [PATCH v2 4/9] spi: spi-fsl-lpspi: Clear status register after
 disabling the module
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-james-nxp-lpspi-v2-4-6262b9aa9be4@linaro.org>
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

From: Larisa Grigore <larisa.grigore@nxp.com>

Clear the error flags after disabling the module to avoid the case when
a flag is set again between flag clear and module disable. And use
SR_CLEAR_MASK to replace hardcoded value for improved readability.

Although fsl_lpspi_reset() was only introduced in commit a15dc3d657fa
("spi: lpspi: Fix CLK pin becomes low before one transfer"), the
original driver only reset SR in the interrupt handler, making it
vulnerable to the same issue. Therefore the fixes commit is set at the
introduction of the driver.

Fixes: 5314987de5e5 ("spi: imx: add lpspi bus driver")
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-lpspi.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
index e50261e9a1fa..fc4d49f0717e 100644
--- a/drivers/spi/spi-fsl-lpspi.c
+++ b/drivers/spi/spi-fsl-lpspi.c
@@ -83,6 +83,8 @@
 #define TCR_RXMSK	BIT(19)
 #define TCR_TXMSK	BIT(18)
 
+#define SR_CLEAR_MASK	GENMASK(13, 8)
+
 struct fsl_lpspi_devtype_data {
 	u8 prescale_max;
 };
@@ -535,14 +537,13 @@ static int fsl_lpspi_reset(struct fsl_lpspi_data *fsl_lpspi)
 		fsl_lpspi_intctrl(fsl_lpspi, 0);
 	}
 
-	/* W1C for all flags in SR */
-	temp = 0x3F << 8;
-	writel(temp, fsl_lpspi->base + IMX7ULP_SR);
-
 	/* Clear FIFO and disable module */
 	temp = CR_RRF | CR_RTF;
 	writel(temp, fsl_lpspi->base + IMX7ULP_CR);
 
+	/* W1C for all flags in SR */
+	writel(SR_CLEAR_MASK, fsl_lpspi->base + IMX7ULP_SR);
+
 	return 0;
 }
 

-- 
2.34.1

