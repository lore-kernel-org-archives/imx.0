Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8927A28FA84
	for <imx@lists.linux.dev>; Fri,  9 May 2025 11:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788822; cv=none; b=XKJqohtmX7seBgqX2OikuSqvpjPEEU+SY5hCpU1JK9u+qL0XAdC8df8VKS9TzaG4DreFHUn/FEozXr3zz/4Of5GN/ZuWxjOdVzZIzIzxDrFT3xmskbEWiPsxTASyFtfVqEMbM0QxNRgn7kf5bYcq3GcAIRqUcZ+7fMG8AiV+648=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788822; c=relaxed/simple;
	bh=eEjcZlIDJmLV5/jyvCAjQjBuHpvBbYFjopscg3ocaAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hHKC6tlbV33M14dSnNzzLFBx7JTaa2g9xnoV/oTsf+Tz0aqgmg9BUzGO1fZ3QEUn6+SI50sLsHXns7JFBifvnqvIyd71tkM5A9sh+rUHHdDIghXLdMmg/CybE27/PTM2qOhu9IAu5ouY9N2y1vC4+q7LfbqzG2J9Jf9PwdrXGOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S2I4roVk; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S2I4roVk"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a1f5d2d91eso612563f8f.1
        for <imx@lists.linux.dev>; Fri, 09 May 2025 04:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788819; x=1747393619; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZ/3VdJhYRpNseu5U9lSFH9HxUE77S8ESF2tbbWAri0=;
        b=S2I4roVkf4aRTzEL8Yx7RtMUwmgwYc7+q7gX3aNWISrGjY1Z4cEQ0b/o+zMJS45Oud
         FwqCR9+0TLJBaFsFcOGg6+uDpqRoqCvVEsJPVK8it+npUHsuZ+oc0y+ED3wH/3kqf9v+
         agxeNuQPJxY+VsfihzakHEvopYYi3C+A93IyFpydVElyGWXxKqqQB5Ff8hzmYfoxwL7Q
         PN3dCvyIBpu2mfr6TQFrAzXDM6bBpovmsXq1GfGstAAlG+upTAN3cQxBNvMjTzuwwYYF
         R4V9RPFCGwDrAemQzDb/vCfjEquZMF5GWTBXhnB9blwDYzd9VJRdMst65sLWoCJ6SEe4
         jRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788819; x=1747393619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZ/3VdJhYRpNseu5U9lSFH9HxUE77S8ESF2tbbWAri0=;
        b=IgkDV6k869i2gzvoczwSLtAEwSUP6OaVDxGp1sWAnGrvKTEIQZXhV9+Q6gqYtnNz8R
         gcjD0+t7QniOf7pAXOcUg3jEJZpv6TW8ME4IE7eaFshKoOZD6NixPFEVVaIGW5akdd9R
         Fs+4HS4MA1lLg2RKNRwEPLJqlBy78J5lNTjLOQmUSmKii0QpoXZsXDFL7UoBuT+Kz7Kw
         jnby6ErCnCkaABHKU+p654g4lhz5LndUBiKkfyMpho2JHld1LTK3dDF66Lso11sYmkiC
         sHkEIz1BkNlEdF2jSriyJbZTH6vI9dnBSC/+J46MPuBufWfo5i4gH83JJ5ZQb6PfytFg
         vzOw==
X-Forwarded-Encrypted: i=1; AJvYcCVsB8VgWC4RY1hBVv2h0qrXynNJKB+cTuw0k6+nThGPHBo86iBr0Qimx3y32rPbMq4laZI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyjfM75YeqEGF1/sX4/KNFSQDNQyoCb4XtTYi9TX2fmk8t7/pWX
	OxpYbOh98ADW6eVnLWI2tNmuDD+A+cWjjx+vOaXCPfj38LW/+PTGTGEDxGfXtw8=
X-Gm-Gg: ASbGncs0hca7WqkCnSm+kO0+CHQatIKNq4VmupmMd9gwd8SWqwDTCOwoAMVUyjpjCc1
	ahMU49U42fJ641s7oaL+H4VJrp/viF6qz/wWjDmMeIPEGM8BHUkugD7/zhARiwiMoz0nqwfOnK1
	aOhiOEJVfXrSFSLK+H6bhqEBw8dHCSf4pRlyR3xIwdJcocB0lp4idrW2RevNyWrNZ9BaOIeQZ33
	r0YSt1WSNnpszpFGIle86isYTvMQEFGYgGC3OQXOtFybhcA1RQ6f2EYUKtBUxS5mOLgNexxsYp8
	fJyLhZUH5SeGyKirgnFJxKVqQMlkvYg1X3xZAS2QjTQ53Z0=
X-Google-Smtp-Source: AGHT+IFbRxA53PsQ6WEpfLOqgfTczthdryRGHNyvPGYt33prnCWmvz5n1DMnzXDap0L0ElCdAiEfKQ==
X-Received: by 2002:a05:6000:2905:b0:3a0:b9a8:b94c with SMTP id ffacd0b85a97d-3a1f64b5c83mr2393167f8f.50.1746788818691;
        Fri, 09 May 2025 04:06:58 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:06:58 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:05:50 +0100
Subject: [PATCH 03/14] spi: spi-fsl-dspi: restrict register range for
 regmap access
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-3-32bfcd2fea11@linaro.org>
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
 linux-arm-kernel@lists.infradead.org, Xulin Sun <xulin.sun@windriver.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

From: Larisa Grigore <larisa.grigore@nxp.com>

DSPI registers are NOT continuous, some registers are reserved and
accessing them from userspace will trigger external abort, add regmap
register access table to avoid below abort:

Internal error: synchronous external abort: 96000210 1 PREEMPT SMP
Modules linked in: fuse dummy tun hse sch_fq_codel openvswitch nsh
nf_conncount nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4
CPU: 2 PID: 18231 Comm: read_all Not tainted 5.2.33-yocto-standard #1
Hardware name: Freescale S32G275 (DT)
pstate: 20000085 (nzCv daIf -PAN -UAO)
pc : regmap_mmio_read32le+0x24/0x48
lr : regmap_mmio_read+0x48/0x70
sp : ffffff801123bb70
x29: ffffff801123bb70 x28: ffffffc873b5c000
x27: ffffff8010b408f0 x26: 0000000000000001
x25: 000000000000013c x24: ffffff801123be40
x23: 00000000000003ff x22: ffffff801123bcfc
x21: ffffff801123bcfc x20: ffffffc873a9e500
x19: 0000000000000024 x18: 0000000000000020
x17: 0000000000000000 x16: 0000000000000000
x15: ffffffc876189160 x14: 0000000000000003
x13: ffffffc873bf73ff x12: ffffffc873bf707e
x11: 0000000000000000 x10: 0000000000000000
x9 : 0000000000000000 x8 : ffffffc83fca4e00
x7 : 000000000000000f x6 : ffffffc873bf7083
x5 : 00000000fffffff9 x4 : 0000000000000002
x3 : ffffff801061f058 x2 : ffffff801061ee18
x1 : 0000000000000024 x0 : ffffff8011490024
Call trace:
regmap_mmio_read32le+0x24/0x48
regmap_mmio_read+0x48/0x70
_regmap_bus_reg_read+0x38/0x48
_regmap_read+0x68/0x1b0
regmap_read+0x50/0x78
regmap_read_debugfs+0x120/0x338
regmap_map_read_file+0x44/0x58
full_proxy_read+0x68/0x98
__vfs_read+0x48/0x90
vfs_read+0xb0/0x130
ksys_read+0x7c/0x108
__arm64_sys_read+0x24/0x30
el0_svc_common.constprop.0+0x74/0x168
el0_svc_handler+0x70/0x90
el0_svc+0x8/0xc

Co-developed-by: Xulin Sun <xulin.sun@windriver.com>
Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/spi/spi-fsl-dspi.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
index cb0e55a49eea..701cf56d28e7 100644
--- a/drivers/spi/spi-fsl-dspi.c
+++ b/drivers/spi/spi-fsl-dspi.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 //
 // Copyright 2013 Freescale Semiconductor, Inc.
-// Copyright 2020 NXP
+// Copyright 2020-2025 NXP
 //
 // Freescale DSPI driver
 // This file contains a driver for the Freescale DSPI
@@ -137,6 +137,20 @@ enum {
 	VF610,
 };
 
+static const struct regmap_range dspi_yes_ranges[] = {
+	regmap_reg_range(SPI_MCR, SPI_MCR),
+	regmap_reg_range(SPI_TCR, SPI_CTAR(3)),
+	regmap_reg_range(SPI_SR, SPI_TXFR3),
+	regmap_reg_range(SPI_RXFR0, SPI_RXFR3),
+	regmap_reg_range(SPI_CTARE(0), SPI_CTARE(3)),
+	regmap_reg_range(SPI_SREX, SPI_SREX),
+};
+
+static const struct regmap_access_table dspi_access_table = {
+	.yes_ranges	= dspi_yes_ranges,
+	.n_yes_ranges	= ARRAY_SIZE(dspi_yes_ranges),
+};
+
 static const struct regmap_range dspi_volatile_ranges[] = {
 	regmap_reg_range(SPI_MCR, SPI_TCR),
 	regmap_reg_range(SPI_SR, SPI_SR),
@@ -161,14 +175,18 @@ static const struct regmap_config dspi_regmap_config[] = {
 		.val_bits	= 32,
 		.reg_stride	= 4,
 		.max_register	= 0x88,
-		.volatile_table	= &dspi_volatile_table
+		.volatile_table	= &dspi_volatile_table,
+		.wr_table	= &dspi_access_table,
+		.rd_table	= &dspi_access_table
 	},
 	[DSPI_XSPI_REGMAP] = {
 		.reg_bits	= 32,
 		.val_bits	= 32,
 		.reg_stride	= 4,
 		.max_register	= 0x13c,
-		.volatile_table	= &dspi_volatile_table
+		.volatile_table	= &dspi_volatile_table,
+		.wr_table	= &dspi_access_table,
+		.rd_table	= &dspi_access_table
 	},
 	[DSPI_PUSHR] = {
 		.name		= "pushr",

-- 
2.34.1

