Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E658C25A2C9
	for <imx@lists.linux.dev>; Thu, 14 Aug 2025 16:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755187629; cv=none; b=takcxAP4I12My6kiMX8mgjPrKpCFFtYUcFJB+p+Ahngw8nQaWXEyiXP+hYaxv+hvKiYn3Z8Mkz7Rx5CWTh36Suv4jJ1OwL8I+rxFSyIgXMPwWfLkbNX0UnGqU3R0zyPy4x0uwvW5O3mR/JBlEeNi23kP0eVJrBSzwkD6iSyPdJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755187629; c=relaxed/simple;
	bh=TEu3fUN3erzyt+FPBw44SIOHKGNM0QzRYPzn7NfE4so=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ljoAfO3yJv9B5t1qB3ikGkG9AT8xb97dRuKwcwj3egOfOyFbNLeiJ7L5cnfN+xIZPU5Lq9YQAAWzzgC7rMKkb9X0h25gI0822eyrFJo9WyNoop0qJzDZjkNM5s8Jqa/9smNmT+Hy9qoLWT93SOKLIjrWmI8I+x5QzDEBxRMVedc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BwULbnyH; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BwULbnyH"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1b066b5eso5449615e9.1
        for <imx@lists.linux.dev>; Thu, 14 Aug 2025 09:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755187626; x=1755792426; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DMBgPb4Xq82JDov80ni4i5qWbWTDW7t8a9VlWvi+IP8=;
        b=BwULbnyHrXn/R/9NZ7hKd3OcejUK7WUy2JFwkcTyxD/0hnGm5fxkqRgWeAl398+QgB
         INZ0ugNt8Gf19SbrXMtbZMLZAnOavdT237kWmcbgg3uEruWf4nt9KZGMKeyXIYvwPcyA
         09TnirLTEwBDs/OhR51brT1ZHv6jUsFQPa2EZZB4RV4Xel5zsMn4BCi3M7WYrBjI6LqQ
         MYDm/n49gSk8QGXRCTWiHuA5XbIVuZqIsFQStUZHcDi+ZDwFuOphqAVfUrnC6MGSu7VQ
         vZbl3Paw81NVkoJZc7e8PMSxoQGylzBmPEMJ3Jyba/S0l3RnODiZzqhR5t5YxBxuhkMZ
         MSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755187626; x=1755792426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DMBgPb4Xq82JDov80ni4i5qWbWTDW7t8a9VlWvi+IP8=;
        b=FoI4jhPWbuYNe5VhgxxcpR3rjI/IWwOgPfPNRLabVArsF1UQ9B/PuEEOWoahiekvO4
         YabAkL8MBMQ5ZNjT04shSxFw8QmpHaaV/LhW0hU7ASVxYcfJ4b4DhH+FHGhLpkVlDJJ6
         abYbvLMNx9aydpSNwf6Q1zMacOK1zBMRBrFKQ4eUAwtEqxZQmXtuvcegSEbmrf213T08
         YYF56tyDD1RiGwTMScjvrUKDiz8z2Db3Jwt5LBCryIPLfnibJx81E17HJ+UDBEFpfMNN
         vQRD+RPdLIBCDxO5kevAHYa9mqSasfNdv9u7VG63JoBF75pV4d/NY6bJjb7XhJGFlR8m
         5cOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMo/arBuVOeuHSn5X9Xh79M/5TWA9DemSe+804qY+XqJnj6/sO/3d8hIKKdY0MHmLopkg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwnC9joLVQw2oXVlQqZwQtdDVcOv0tprACjnGL8IrwiraUOI/mY
	QDRjssZUIewtfYUDNkfsAfaC07PdxpvP9dsXA3xNVF6NUFFdBwGpvilzDh255gwl4mM=
X-Gm-Gg: ASbGncvrXbTj3iYdRZZ4F/PGy2c4hx9WpsHs4OKEXpjAx0HQtHodcYu15/6SbNydVFX
	Os3yHJCNZXqNdX5VxfIbbx16ezX8pFB3IEFGLID3IPd6SzjU6qnv5y4TaPkSRwB4jYO2vVN7Sdm
	hiyNn9CXMK+9fsvDXIBF7F4WSUltQkGi+xpFWsaizHcJDSzfVNtNZTvTCCjTgQgVd31MSHDv7j0
	1Nfs95PDswo39BrCAbKK6paNIPo836phuMNIx4Nd3XpsHvjUFfLCuWdzseGLBgNOw2B5hOJk0cU
	UXYjf2l//PWyAiqhb3yCDe2guscePbwdYFrc2u8X4Sjauz9sYMh7NEv1jJyz2Q7rL3SJ8/tL/ba
	Ff9kgk6fP3xehVRZV48eCS53PP47gql0=
X-Google-Smtp-Source: AGHT+IEOT2wwsPyctFrgMr5ByDkZdw4HXDUlDk99xnD5BV/nP3sUkqvIgtuH6uOuro0r9fJd4VPXLQ==
X-Received: by 2002:a05:600c:870f:b0:456:285b:db3c with SMTP id 5b1f17b1804b1-45a1b88d5fdmr33513625e9.3.1755187626069;
        Thu, 14 Aug 2025 09:07:06 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bd172sm28363495e9.6.2025.08.14.09.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 09:07:05 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 17:06:44 +0100
Subject: [PATCH 04/13] spi: spi-fsl-lpspi: Clear status register after
 disabling the module
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-nxp-lpspi-v1-4-9586d7815d14@linaro.org>
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

From: Larisa Grigore <larisa.grigore@nxp.com>

Clear the error flags after disabling the module to avoid the case when
a flag is set between when the flags were just cleared, and when the
module is disabled.

Although fsl_lpspi_reset() was only introduced in commit a15dc3d657fa
("spi: lpspi: Fix CLK pin becomes low before one transfer"), the
original driver only reset SR in the interrupt handler, making it
vulnerable to the same issue. Therefore the fixes commit is set at the
introduction of the driver.

Fixes: 5314987de5e5 ("spi: imx: add lpspi bus driver")
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-lpspi.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
index aab92ee7eb94..79b170426bee 100644
--- a/drivers/spi/spi-fsl-lpspi.c
+++ b/drivers/spi/spi-fsl-lpspi.c
@@ -82,6 +82,8 @@
 #define TCR_RXMSK	BIT(19)
 #define TCR_TXMSK	BIT(18)
 
+#define SR_CLEAR_MASK	GENMASK(13, 8)
+
 struct fsl_lpspi_devtype_data {
 	u8 prescale_max;
 };
@@ -536,14 +538,13 @@ static int fsl_lpspi_reset(struct fsl_lpspi_data *fsl_lpspi)
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

