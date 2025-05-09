Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3069328ECE9
	for <imx@lists.linux.dev>; Fri,  9 May 2025 11:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788818; cv=none; b=AsG7/30qiVFDhrBLTGRMU9f89pOb7rE4F7yxPAF/oa/j1yK6x3IFRNcLK6JtlbpAZM4gUnx0L+hSDgsU7/OClv5PZvaaLmTmSjP3DFl9Nmy1hNNgtnxCGLMtNlSYj6VIpwjH+LuP1ya+lM0qGJgSATcwJotMHtKhJbP7W/GcIxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788818; c=relaxed/simple;
	bh=8g6zkTjB4a5mBnaZeVYAI4MzPAjk54nrw+e13fId4pg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BZadTGoVgsPiz8N2q17jAushUBgyttjMnYoVBRAfeJc87vfhDhbGxfP/Sbn5JBbzC4OHsvvQcZmE7/SXPaT6N99pyN+tYX01uGVmozdnXNQOL8usowRLwrHbWnT0o/KP0w/pOmIbDSUMXe9YnH9EoCgbIfwrs3pf9MnQqbllsus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=liKNXSAm; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="liKNXSAm"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a0bd7f4cd5so1474534f8f.0
        for <imx@lists.linux.dev>; Fri, 09 May 2025 04:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788814; x=1747393614; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MdQh7LT8W4RzJzp1eDyrsDrfrxqK5LM5LuKtE8YNB2c=;
        b=liKNXSAmsRsOAmul8Ibq7rlf6uy6JgThmWgj0R06dyRHnzxqcOWi9X29tEIZ6ScU/e
         EUoMILvCw8hkAbpWTuAa2cQK75voBE8TrMQDp1l3EvD58t6Gq3PKCx5g6UtrAYtXkmwh
         7jS6UqFJ5ciZmMEx/bqZk8eZNNmUh6gTdvBclJX4Kc1UGQSXPc8DSF11OYgjSI9MhMCg
         1S4HxRlrRVMnbnWRBt58nSMBX4HFAXIs9OHeyhguy+rgUTEqx9gu/MIryiPKWqMjiFJk
         Uk0XbmHywmy+/88WCzPdUXkLcQaQObOKRlQQDVgDmBSGp2kEoz2/gIV5EXzBzBuqrdhv
         QPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788814; x=1747393614;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MdQh7LT8W4RzJzp1eDyrsDrfrxqK5LM5LuKtE8YNB2c=;
        b=woFugG1aLgTALRQnMpS31TbVq6FexingqKd2usAEk/QHud1lSnH+GbkXigUZD6rEZp
         yOLHH+YES8r400nH2uNptZvEPbTozI2ZEh8Gd6ke75Cs0ofiWLdcCXExMVxgY5xMVJ0b
         RnWe3z2+7nSKPV5BOsrTsLLcVJcM2fqhCMg5bMkaA+x50tc4w8NtW2qJgJA6+g7QB6lf
         UZsQs/MVtdUqdI1Zo438dVxBWqrZgDd7rfFZRVq4zNHjgezck6wyvPFzA8otk+tg/eA0
         TmlPkWjpbR489mLoMCE23BFaRZRGCUl605Vm+hjWfmWaF1dBr6cFRk4boaKA4hb3HiHM
         NqLw==
X-Forwarded-Encrypted: i=1; AJvYcCWU8mWSezffZC/0gZNHZLAdhOcU5gxA4E9S3LaLKUeDIR3/g7S/MilFoYViyUh2ba9bubY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw9JClvz2IThYN2nqHdQx2ybgHzLxEZ8z+Ppw3cjKFI0yHD5xa
	LOtxhY21VW1uUDP45fcAJtXsm3bdslivaAb7Mim/ryBRDwphOxhS7oPb+W8ZUcU=
X-Gm-Gg: ASbGnctlYBvWpArH4VWxMl78TjsdUnHLAtLBAYs1JVEiX8Nd4PnSWIFdXz5pUoNODJK
	UfRgWzxMAEJKW/FiSWeNEFs9Kg4UDqkRnTzIb9VXJZ5TcULe9FAOM1lr+Dw9vbbmtJ51rxz49xy
	Fwpt49MNS0JHq+r9y58tbHKdBEhyGr1syMoNmQ33sUf/dt9dVLVieu3B5AI+O3/SvvXKZcu5Vag
	jGRTU9R6Dk9Ttt+Ehs73j1UD5Vh8MGIeJphpSjNHGr9ZRdFkmjhOoombcjzDn6LHTasr45m2gbm
	1G6ybVwYL+P+hzezfQ4SjDZfTPM16CD9CLHP6fSEsKwZx8g=
X-Google-Smtp-Source: AGHT+IF8zf0HZ+jIS52ar661eUuXC/rKe9WCfGGwcqpO6GEcFF49TaMuxQRQxMt3K3cGjEyD0Y8O6g==
X-Received: by 2002:adf:8b1c:0:b0:3a0:8712:4f51 with SMTP id ffacd0b85a97d-3a1f64b5a97mr1959695f8f.40.1746788814469;
        Fri, 09 May 2025 04:06:54 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:06:54 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 00/14] spi: spi-fsl-dspi: DSPI support for NXP S32G
 platforms
Date: Fri, 09 May 2025 12:05:47 +0100
Message-Id: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIvhHWgC/x3MMQqAMAxA0atIZgNtxEGvIg5Fo0awlkZEkd7d6
 viG/x9QjsIKbfFA5FNUdp9hywKGxfmZUcZsIEO1qajG1W2s6K+AGgQHN1km0zRUWchNiDzJ9f+
 6PnsRPfZ4f/uU0gslR/0vbgAAAA==
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
 linux-arm-kernel@lists.infradead.org, James Clark <james.clark@linaro.org>, 
 Xulin Sun <xulin.sun@windriver.com>, Marius Trifu <marius.trifu@nxp.com>, 
 Ciprian Marian Costea <ciprianmarian.costea@nxp.com>, 
 Andra-Teodora Ilie <andra.ilie@nxp.com>, 
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>, 
 Stoica Cosmin-Stefan <cosmin.stoica@nxp.com>, Dan Nica <dan.nica@nxp.com>, 
 Larisa Grigore <Larisa.Grigore@nxp.com>, 
 Stefan-Gabriel Mirea <stefan-gabriel.mirea@nxp.com>, 
 "Radu Pirea (NXP OSS)" <radu-nicolae.pirea@oss.nxp.com>
X-Mailer: b4 0.14.0

DT and driver changes for DSPI on S32G platforms. First 4 commits add
new S32G registers and device settings along with restricting userspace
register access properly for all devices. Then some DMA mode fixes along
with adding support for target mode, which uses DMA. Followed by some
other minor bug fixes and then finally add the DT compatibles and
binding docs.

---
Andra-Teodora Ilie (1):
      spi: spi-fsl-dspi: Enable modified transfer protocol

Bogdan-Gabriel Roman (1):
      spi: spi-fsl-dspi: Halt the module after a new message transfer

Ciprian Marian Costea (2):
      dt-bindings: spi: dspi: Add S32G support
      spi: spi-fsl-dspi: Enable support for S32G platforms

James Clark (2):
      spi: spi-fsl-dspi: Define regmaps per device
      spi: spi-fsl-dspi: Re-use one volatile regmap for both device types

Larisa Grigore (7):
      spi: spi-fsl-dspi: restrict register range for regmap access
      spi: spi-fsl-dspi: Add config and regmaps for S32G platforms
      spi: spi-fsl-dspi: Avoid setup_accel logic for DMA transfers
      spi: spi-fsl-dspi: Reset SR flags before sending a new message
      spi: spi-fsl-dspi: Use DMA for S32G controller in target mode
      spi: spi-fsl-dspi: Reinitialize DSPI regs after resuming for S32G
      arm64: dts: Add DSPI entries for S32G platforms

Marius Trifu (1):
      spi: spi-fsl-dspi: Use spi_alloc_target for target

 .../devicetree/bindings/spi/fsl,dspi.yaml          |  18 ++
 arch/arm64/boot/dts/freescale/s32g2.dtsi           |  78 +++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi           |  78 +++++
 arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi    |  87 +++++
 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi    |  77 +++++
 drivers/spi/Kconfig                                |   4 +-
 drivers/spi/spi-fsl-dspi.c                         | 356 +++++++++++++++------
 7 files changed, 592 insertions(+), 106 deletions(-)
---
base-commit: 9c69f88849045499e8ad114e5e13dbb3c85f4443
change-id: 20250325-james-nxp-spi-caf1e2099231

Best regards,
-- 
James Clark <james.clark@linaro.org>

