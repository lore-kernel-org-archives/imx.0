Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4437D367F45
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 15:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584123; cv=none; b=WqVlZ0vyHBVyOb97Y5pB0u+1ckKphggj9gbdnkDH8cZDRSP14NeUTUI44EfvlkVRZyPjDwvGdHZZaDc1W88xD7Y1IX5B5BMtispQdZeGt3ZkmZwRkt/x4nNyRh39IiNSkIqbXa6p0Uem/waLpWV8P1t4flQ2NmaOXBsHpYiYQro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584123; c=relaxed/simple;
	bh=QVfnzXp3mJ1hu94QeXCBeJl8Jj1ky6nEk9MHssMloEg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vfe5+hODmfuZZjmDwG0AMPpyoJebJrOjMKvSTPyQaBfiRpOkDI7ZU9OhMmc5/FLvgwkcLJcOkZ5TV6xkCvqUaxA5ZrwbAR9WVxXU5Dtt/gOkMM85jqYu89uo8nzqD2nlkg3HonnWRdUICfEXBc7Xkx1qjJ0+ZT+vMVZpuZxrhoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X/xemFYu; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X/xemFYu"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a3fda88184so5602031a12.3
        for <imx@lists.linux.dev>; Mon, 24 Aug 2026 08:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787584119; x=1788188919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/nOah9yaCPBJ9asb8hJhVi9n8xa+eAyGsPGC/JnGbYU=;
        b=X/xemFYuC2A4GiwM9VWU3BSe/POzE7mnUhxLWmCqAqoXRTbUY839O3rSbvPjfKtt++
         l8TRaTSwTwUCG3xrk6oAIUwfktcXP4XdmTZ0aAERK94hhbg9r+POBGsxo+NBmSIFaLoR
         m0XyRhZkvkk/YfOTc50Vwxwpu3aAVUHrfhhHDHwYB8v+MLrUhv9NHcSBRMznmVhB75gl
         1WSujBAL2saBprptfG6zAO9VjE8foVkdRQ53IR9YN181RIpCSlrHQEE0kVqhE7e53C0F
         C114vfBuEdmGWyMti17Bocq8cma8bY/flPeAKNWXI9CcWAODuxx1xpG+CkuM1D4a7uSz
         uG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584119; x=1788188919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/nOah9yaCPBJ9asb8hJhVi9n8xa+eAyGsPGC/JnGbYU=;
        b=JEQJdikILlP50gKE4CF8ws8as1MvbSL1HyK1yErOToA6NwN7ntHreqhuCCl1PpCt4K
         xnViqb1e9adIwSaUDMAIvCqWkfUfW0HtyNi+F0rbVyNWdz70E0VOA/xaTgVo1lzFr5TB
         wU5qRfEUj0i2bZB3zwwwUAd+iYbiuovbXnj9hiHiTbdvsPlKxdfkXzJwWGzQtHTgz4tm
         ItaNcZcz8VmDcHfX96ZXisWxJG9JpfVwm5rx//ILVJMolZP65A2myuQCSMs+byzWZ5bF
         UNTX035X0InZzXmibwwuv59BSseNG15b1wHNZcNUr9jN0040iykzFTvLc3oFUxnG/0Wb
         qA8A==
X-Forwarded-Encrypted: i=1; AHgh+RqxuISM/kunA3SXAaDZZ3OYHcW7VEZqlRTbztuSqCx4+IzBJrFQCadfm0GD+fw6NMkjSJk=@lists.linux.dev
X-Gm-Message-State: AFuF++k6bAZMCedsAB3QVumihHLxZ+W5r907uGkIVw4czbTPgHdF0RJ0
	b3z2mdSaTPT4WghQ4pG1xsWwtTTBYO1612f4tejjhIbUy0/mXynDyP2W
X-Gm-Gg: AR+sD12clmkZUQ1j6Uv4k/XaR++uhFQiVRapqKoa2olU97P/R5HNdhmbZMk1/r+fv9g
	Vv96hALA84H47Jo8mc4Q9YwlcFnhbiM6IQS3Q1r1EezlzKlpNMvLeBbgGeHgri/4nX8LPUIV8yh
	xCpQC29oPhsrC825BvgEizwGsnFNJXJRdIjPXr94bMV3pywkWz4lDLYIk0dAmOcKsgVxUjstjWF
	RPR9tGkn4tqrSA7n4Fn5mpzQbN9ECv35j6wRwi8FDZbob8L3F0qbqJA7ErHRaHXl5z8hdGeXtCy
	JY04gIWQPv5ZO7Si0537c0wrWEE6OcxP3ml/Vk+KX9bNtMy90jFYoNtXj3hSgTeAi8YUJJ8w9pV
	6p8DJKGhpYzjxm9CEqISV4uHPPq9eKTG2ZKahEFEQhGey5gsHplyrBMTT7IsNytihJtnFBX2Fhe
	6zlAaqSkKQUqzqXpoipVUUcU5/SBoWuhVa8Uy7Ef6bIGLy1bNeLFm6vTpV90kfOhFStlW7r0KRW
	HJzN5nq+iYWbEpwmnJ6vSdh/w==
X-Received: by 2002:a17:906:2083:b0:c24:b11a:46fc with SMTP id a640c23a62f3a-c24b11a4996mr1066420866b.22.1787584119253;
        Mon, 24 Aug 2026 08:08:39 -0700 (PDT)
Received: from GLaDOS.station ([109.55.72.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496297189sm1273530066b.22.2026.08.24.08.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:08:38 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	alexander.h@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>
Subject: [PATCH v3 0/3] Add support for Variscite VAR-SOM-MX7 and MX7CustomBoard
Date: Mon, 24 Aug 2026 17:08:27 +0200
Message-ID: <cover.1787583584.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Variscite VAR-SOM-MX7 system on
module and the MX7CustomBoard carrier board.

The series includes:

- DT bindings for the supported VAR-SOM-MX7 board configurations
- VAR-SOM-MX7 device tree support, including V1 and V2 hardware revisions
- MX7CustomBoard carrier board support
- eMMC and NAND storage variants
- optional WM8731 audio codec support

The implementation follows the standard SOM + carrier board pattern,
where the common SOM dtsi contains the on-module peripherals and
hardware revision differences, while the MX7CustomBoard dtsi contains
the carrier-specific interfaces.

The final board device trees combine the supported VAR-SOM-MX7
configurations with the MX7CustomBoard carrier board.

v2->v3:
 - Removed wrong header in dtsi
 - Fixed pinctrl name
 - Fixed sai clocks

v1->v2:
 - Fixed commit messages and spacing
 - Moved ethphy1 reset pin mux
 - Fixed irq types
 - Removed duplicate assigned-clock-rates property
 - fixed wifi child node name
 - Added color property in gpio led definition
 - Updated deprecated reset-gpio property
 - Added disable-over-current property in usb nodes
 - Fixed model names

Stefano Radaelli (3):
  dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
  ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
  ARM: dts: imx7d: add Variscite MX7CustomBoard support

 .../devicetree/bindings/arm/fsl.yaml          |  17 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   6 +
 .../imx/imx7d-var-som-emmc-mx7customboard.dts |  22 +
 ...x7d-var-som-emmc-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi  |  99 +++
 .../nxp/imx/imx7d-var-som-mx7customboard.dtsi | 382 +++++++++++
 .../imx/imx7d-var-som-nand-mx7customboard.dts |  22 +
 ...x7d-var-som-nand-wm8731-mx7customboard.dts |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-nand.dtsi  |  73 ++
 .../imx7d-var-som-v2-emmc-mx7customboard.dts  |  23 +
 .../imx7d-var-som-v2-nand-mx7customboard.dts  |  23 +
 .../boot/dts/nxp/imx/imx7d-var-som-v2.dtsi    |  66 ++
 .../dts/nxp/imx/imx7d-var-som-wm8731.dtsi     |  65 ++
 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi  | 635 ++++++++++++++++++
 14 files changed, 1479 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-mx7customboard.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi


base-commit: 9400c5b6aa357be2379c98ae86a207bc21dc7a48
-- 
2.47.3

