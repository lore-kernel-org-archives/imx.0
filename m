Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7448A28C870
	for <imx@lists.linux.dev>; Thu, 22 May 2025 14:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747925563; cv=none; b=Z0UDwgrc89b22dnrdbcr2qwZahNPqiOWU/NyYGVfX9ajItItHkZ6vcmKqseDJpPJ5TMViLNz2tV5tD021Vh2+ZWjNNWTY0G3X7RjO3oomFceK+Vupn9M5Rr0MkywzUwcyF2qFNNZBM9+4HoANfzMQh9gM7a6jvnEpIxgRvBtgb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747925563; c=relaxed/simple;
	bh=tdIGdyYQ20MkL5rp4ZKUkrznRFJ9rMy7wxoT6sn8RP4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=arUjtSP1SroSh2Mp7+kqbVdok6MDOY7FZkVrHCfraTSe6eo91GNzPDQhwQUTxrIZoBLhVtrIpzE+Kj2skE63xDZkqpdilHyB9NNRCUQDFvE+SmF+7L9q47F8XFMMlWMyFewhW5yY1cWbnHWDOGr8LTJmpiwh7USCWzlu8OZrAV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=llej3qEm; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="llej3qEm"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-44b1f5b917fso1395075e9.3
        for <imx@lists.linux.dev>; Thu, 22 May 2025 07:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747925559; x=1748530359; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VEeX4pHU5dbnP7BXmwT5H8fSOKMWm7ham8iEEngBq2c=;
        b=llej3qEmhOKZEsjZc1HCs3qc8TvD0AuIFR4UaAoaz5OCp+PL9AnE69VkyEmPl0qmHR
         q3ku2UcXCGF6bXPGpXqeT80+dXC/ezOl9IYVmnO7nAc0om0mrFZtAhpj7nThWGn0fpv2
         Jubuj4tPjXFRyEl76/GC92YvPElo3DTdrHMqiWaE8XQO4T9wfonnark8zhoDVzqUMFpv
         sJcc0cKFtjsVvukV+bO7LMupbO/202o6lne+PLG5e6U/t+7lyL8Ub4QKOl1ouxkmAdrS
         dZOQ40fgmFdKybFlLzrXd2MxBt/w7v4zqkxVR/4fyBUHtVKh+pB0/g9fIYzedKjHGVSb
         /9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925559; x=1748530359;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VEeX4pHU5dbnP7BXmwT5H8fSOKMWm7ham8iEEngBq2c=;
        b=GhczeuFoi6MtlmBdHuW1K52iIueYSziuPO6aJ5xgFlC5FXa9Ybzu8KRvjWW4CjXtrw
         BA/clwn+52EFHypJ0XvKy3d0630XcC8E9f+/rmS4YazyRTH4tT13ZhOsJBVI33D0kHzB
         51A07Y2VAtJZ+P4kD4hHUor6fvEN4QYwmUGwDho5OxZQrCmZZ9ffotiE+rt7nRfJ1Rio
         hX4oe6olizX2h9wrMD9fDbONJApcnMHq4CvLHnEE45BURyLqzQebvQsXLJILdmlHHdl7
         oPyk//B25uDI7B9sqWws39LYj5i7mE8hGMdnJgJtYoIWBQqMrOb7EOf7tBC8FijvgvgR
         942w==
X-Forwarded-Encrypted: i=1; AJvYcCWiso/dPPgEVa8YIIIGpW9UslIw7TSy1iB0IbDh8OYySw0tIUBAyhYuqsm98dYtq9Z69I4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDvobPOlPSq4uL25QgBt9ciss2Ito6WEIvWYIg5OQRpDBUcuEF
	aIGjZ9QX4AwdQ/mhYMEF6P7wqkgfeTDF2CrI7a5suP9FhNmC7/iJYrui+S/KmXp7/4A=
X-Gm-Gg: ASbGncvknzfjK/6Ghivn7Fmc31ydcsce7ocirr/fgP0TY15HIREgrAM/wnF5VLjk6C8
	zhNtr/aErpQSwHbmvvKMFO/6ZEtYDOVTVaZ/F01hlezqF31vtHnU1aNjSf+o1ilS09ceY8Z15rV
	Z8CRmeIFVb8hLa2CN8WR1eBP9DKrZ1qIEFoUo/VJ3pqLaBmZucm+W4+eoK8OpCEUTfHI6s9Ba4J
	AuCn72p4EDkXXEhFvckRZfldYWXjt1Ftk056SWAM/MMprR7ejbaJiJxGahSfi/CEspvgPQo0rOt
	A4TERyfabuLVfsrwBfzhTNi0eOJL897/NB40e90H5YlMt2+UtRI6JntLHV3U
X-Google-Smtp-Source: AGHT+IGuO6Y6d+kCxwoNrEY38IpkexCj4wL5pVJUa3/XxA+mRVZ8kHkKd9XIST6kB9JCbxHGl+gsxw==
X-Received: by 2002:a05:600c:3114:b0:440:61eb:2ce5 with SMTP id 5b1f17b1804b1-442fd64e335mr299932885e9.17.1747925558639;
        Thu, 22 May 2025 07:52:38 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78aeb56sm104965555e9.27.2025.05.22.07.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:52:38 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v2 00/14] spi: spi-fsl-dspi: DSPI support for NXP S32G
 platforms
Date: Thu, 22 May 2025 15:51:29 +0100
Message-Id: <20250522-james-nxp-spi-v2-0-bea884630cfb@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPE5L2gC/13MQQ6CMBCF4auQWTumnaYLXHkPw6LCFMZo27SEY
 Ah3t+LO5f+S921QOAsXuDQbZF6kSAw16NRAP7kwMspQG0iRVYYsPtyLC4Y1YUmCvfOaSbUtGQ3
 1kzJ7WQ/v1tWepMwxvw9+0d/1J1nV/kmLRoWG7r4fyLPT+vqU4HI8xzxCt+/7B7lZF6qrAAAA
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
 Xulin Sun <xulin.sun@windriver.com>, James Clark <james.clark@linaro.org>, 
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>, 
 Marius Trifu <marius.trifu@nxp.com>, 
 Ciprian Marian Costea <ciprianmarian.costea@nxp.com>, 
 Andra-Teodora Ilie <andra.ilie@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Stoica Cosmin-Stefan <cosmin.stoica@nxp.com>, Dan Nica <dan.nica@nxp.com>, 
 Larisa Grigore <Larisa.Grigore@nxp.com>, 
 Stefan-Gabriel Mirea <stefan-gabriel.mirea@nxp.com>, 
 "Radu Pirea (NXP OSS)" <radu-nicolae.pirea@oss.nxp.com>
X-Mailer: b4 0.14.0

DT and driver changes for DSPI on S32G platforms. First 3 commits are
fixes for various edge cases which also apply to other platforms.
Remaining commits add new S32G registers and device settings, some S32G
specific fixes and then finally add the DT compatibles and binding docs.

Tested in both host and target mode on S32G-VNP-RDB3 by transferring to
an external device over spi1 using spidev_test.c

---
Changes in v2:
- Add trailing commas to lists
- Line length fixes
- DT coding style changes
- Remove fake "rohm,dh2228fv" device for testing
- Improve some commit messages
- Put all fixes commits first and add fixes: tags
- Link to v1: https://lore.kernel.org/r/20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org

---
Andra-Teodora Ilie (1):
      spi: spi-fsl-dspi: Enable modified transfer protocol on S32G

Bogdan-Gabriel Roman (1):
      spi: spi-fsl-dspi: Halt the module after a new message transfer

Ciprian Marian Costea (2):
      dt-bindings: spi: dspi: Add S32G support
      spi: spi-fsl-dspi: Enable support for S32G platforms

James Clark (2):
      spi: spi-fsl-dspi: Re-use one volatile regmap for both device types
      spi: spi-fsl-dspi: Define regmaps per device

Larisa Grigore (7):
      spi: spi-fsl-dspi: restrict register range for regmap access
      spi: spi-fsl-dspi: Reset SR flags before sending a new message
      spi: spi-fsl-dspi: Add config and regmaps for S32G platforms
      spi: spi-fsl-dspi: Avoid setup_accel logic for DMA transfers
      spi: spi-fsl-dspi: Use DMA for S32G controller in target mode
      spi: spi-fsl-dspi: Reinitialize DSPI regs after resuming for S32G
      arm64: dts: Add DSPI entries for S32G platforms

Marius Trifu (1):
      spi: spi-fsl-dspi: Use spi_alloc_target for target

 .../devicetree/bindings/spi/fsl,dspi.yaml          |  18 +
 arch/arm64/boot/dts/freescale/s32g2.dtsi           |  78 +++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi           |  78 +++++
 arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi    |  83 +++++
 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi    |  83 +++++
 drivers/spi/Kconfig                                |   4 +-
 drivers/spi/spi-fsl-dspi.c                         | 362 +++++++++++++++------
 7 files changed, 600 insertions(+), 106 deletions(-)
---
base-commit: d608703fcdd9e9538f6c7a0fcf98bf79b1375b60
change-id: 20250325-james-nxp-spi-caf1e2099231

Best regards,
-- 
James Clark <james.clark@linaro.org>

