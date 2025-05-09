Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962C513C816
	for <imx@lists.linux.dev>; Fri,  9 May 2025 11:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788837; cv=none; b=cLNr0EESvG3zX+TkHBTpXH+8/FVcwhMLpV6P1Mzl2WIpujaIfyHc58T7EsWTosRu4aAymohHWO+NVSdcu+JgMxztlJ2MNvFun2r67DB+q7tOh7dW9AucJr8wtesSg0Qpx/2Pp2ZIIgzWVLF6oB+0NQJMGcgQ9NkAMBWN7PDR6LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788837; c=relaxed/simple;
	bh=/1WgmjiUPsgAyXKXEEwEXpR87Eos0KeMZvFNpmziqFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s9kNKLnLWnR+iDvTdeKi/kBBTLEUba+mmV7aaxUP0ltzMguIWr9ykPiVrpeFJFb81VQiomN7bDGOF0EvGupHkpXDajA0cSsiOCAnQNKwpi3fbIFh46gLC2hndvf/EZZ+M9GlfhqgUp/n4I6o3cUCZU+Q6voJVXYTBvlqCddNdgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mc5LroYv; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mc5LroYv"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso9054295e9.3
        for <imx@lists.linux.dev>; Fri, 09 May 2025 04:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788833; x=1747393633; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMuvm3u0FO0tHSMEJjZ+2DIuKHjMVjXj0UsWrbU1Pz0=;
        b=Mc5LroYvRh3QxGaeiEiEUWifAHskI/uCRkmFeBHPS8vsQYtEDiIbhsNZvFRdnfrXl2
         /Nf7jHwTxOMzKkd1pEOUlqeZUjQ55//GjiJUWCwVmuh+/XrxKNAeaNeazqIPyc6m8FlU
         IuHaQWTkAnE23j/6WqM0zuGIL8xUyA8rXTMxPHTOsVy6+grplOInL29RBVC2ZvLDRb7W
         tT55iklLH1ld/ZQ7sn7WEcf5HbB30Z9CU5xcbtPdDkCiSbhrFI3Fe7vnmOQcu91YkjJD
         4BTvb72InZCfury4LdtLs0MtREBHth8bv041uGdQjtFlvtOhULko+rsZv3TgmHhFVaKA
         mZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788833; x=1747393633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMuvm3u0FO0tHSMEJjZ+2DIuKHjMVjXj0UsWrbU1Pz0=;
        b=jJhpdRXvSw9M5YaMIuNM9LKIe7rHn7ofNnjZHNlJcMXgegbU2w5+AG3sqyDlDH7P3C
         8Na5INdVfDY1+vTkX8LxJSk4a6FQyuYUGUgWqmgikQKycCWyhphuC6t7DQAKZjjmhUEs
         QLg8Jiyge5l/j7mN0yoxQe16BxXuIbrh3cNc+tghjsmSqNTliHzDPuDzwKQ9nmWhpmcp
         +3HUcDURXdq/fhxRDqo1bJL1OCbEAw/c8krsYY0HNalafiGADU4mYZk2KC03gVEsDHCL
         l5N/VHUq/rIbcJwPv37kSLoQpeGGABGgyOYobOZz9giWmKqgEB0MZT9KEUEDaWIl2pk5
         frTw==
X-Forwarded-Encrypted: i=1; AJvYcCUtmIIarEyDoy16lpxNSFx+U97dNnpBwtgSbcNa/CPu9slr9T4kqSdA3GKHBjggIfaUarA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwP5838uAsIgvxg//r+0Bgv3MludBkeICi7Bj3+mWKGotPPEHWh
	d907hxvVVf5BU/LfK3HvD1FCyatrekDlG+r5/aO5yFikSh5Ih5/ahZvSlYsww5w=
X-Gm-Gg: ASbGnctizB6nwlbCayJX+UNN5LLybKuMbYX9YQWTK92sjewh2dIJTCZepgYypAEKxgu
	HHTeaucPzFVQ0qdHNaezOD1eQu7tXi/EzpZ9XWSSv8GQ56+YBRkb0xFmM5ZyFOQ+VeuI/DPYpPk
	/81RWc+mP8Gf9+Q2OafvLIBUJFoXsENjnL1ldyPAei1txCm9F9i5C0Ot+FL8lX/LH7eB5HQP7Tb
	RtZyd+8pnB9/C63wkDmkFTN8NO4RcTDJcs05yYogWvLAdU7QMBrM7XHJzpZwh4xObMXkrHZIJp+
	qYSviIJz35JgnlWSLIixFN0jc9nZ+o1DneWIpMuamzTOtMdHb+cLIIJ7Pg==
X-Google-Smtp-Source: AGHT+IEI/21cAkCpKqtXo/RJBX5fMArAhVFuko7+5QHt2vTuixWOjpsB6oyJPSHitDVLWZA2KHt5xA==
X-Received: by 2002:a5d:64ce:0:b0:3a0:b8b0:441a with SMTP id ffacd0b85a97d-3a1f643ba6bmr2415644f8f.25.1746788832870;
        Fri, 09 May 2025 04:07:12 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:07:12 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:06:00 +0100
Subject: [PATCH 13/14] spi: spi-fsl-dspi: Enable support for S32G platforms
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-13-32bfcd2fea11@linaro.org>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
In-Reply-To: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com, arnd@linaro.org, 
 andrei.stefanescu@nxp.com, dan.carpenter@linaro.org
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Ciprian Marian Costea <ciprianmarian.costea@nxp.com>, 
 Stoica Cosmin-Stefan <cosmin.stoica@nxp.com>, Dan Nica <dan.nica@nxp.com>, 
 Larisa Grigore <Larisa.Grigore@nxp.com>, 
 Stefan-Gabriel Mirea <stefan-gabriel.mirea@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

From: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>

Add compatible for S32G platforms, allowing DSPI to be used.

Add a depends for ARCH_NXP which can replace LAYERSCAPE and also
includes the new ARCH_S32 for S32G. Similarly, ARCH_MXC can replace
SOC_VF610 || SOC_LS1021A which should avoid updating this for every new
sub-platform in the future.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
Signed-off-by: Stoica Cosmin-Stefan <cosmin.stoica@nxp.com>
Signed-off-by: Dan Nica <dan.nica@nxp.com>
Signed-off-by: Larisa Grigore <Larisa.Grigore@nxp.com>
Signed-off-by: Stefan-Gabriel Mirea <stefan-gabriel.mirea@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/Kconfig        | 4 ++--
 drivers/spi/spi-fsl-dspi.c | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index ed38f6d41f47..ff26be07226b 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -647,10 +647,10 @@ config SPI_FSL_SPI
 config SPI_FSL_DSPI
 	tristate "Freescale DSPI controller"
 	select REGMAP_MMIO
-	depends on SOC_VF610 || SOC_LS1021A || ARCH_LAYERSCAPE || M5441x || COMPILE_TEST
+	depends on ARCH_MXC || ARCH_NXP || M54541x || COMPILE_TEST
 	help
 	  This enables support for the Freescale DSPI controller in master
-	  mode. VF610, LS1021A and ColdFire platforms uses the controller.
+	  mode. S32, VF610, LS1021A and ColdFire platforms uses the controller.
 
 config SPI_FSL_ESPI
 	tristate "Freescale eSPI controller"
diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index db921ee6305f..0982f27a9b2a 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1311,6 +1311,9 @@ static const struct of_device_id fsl_dspi_dt_ids[] = {
 	}, {
 		.compatible = "fsl,lx2160a-dspi",
 		.data = &devtype_data[LX2160A],
+	}, {
+		.compatible = "nxp,s32g2-dspi",
+		.data = &devtype_data[S32G],
 	},
 	{ /* sentinel */ }
 };

-- 
2.34.1

