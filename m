Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01ADDF9C0
	for <imx@lists.linux.dev>; Tue, 25 Aug 2026 06:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787641026; cv=none; b=DOajliuQlR5MLhMsb9YcS2a/jiVVVzSmCAS/mx8Uhd6Pm+R3uLokgPl3TvXPvT3dc5vMUdpEotIk+94GbShEmWR3UzqVMPEXcXF+BaY5JEuCPNssmxPkPyiFL49Md0uCQSIVJrmcWOXR4P707GWaWMXZosTAiYu9oEda0u9OCM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787641026; c=relaxed/simple;
	bh=wbNmBa4CxGoqPW7u/POZ82Us+SEBCdANBsIoV2zbOJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dy5a+SMdTSgcRQ30wOwfQ9vrUcO0FWgLUa6d8S7zA6HgD5PhC8QIjW/kUk5E8E/c3ZVOkp6r6nkDiie4bL155ZEbHlrYhAbL8Ne1WDymlR5DkQEEf+Dc0cvdOv+tVRzY4yhM057mt1yvgH/KmcbzSwY0KfKys/lntzHB8RdFHBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W0rdT2dy; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W0rdT2dy"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c16794450aeso639259866b.2
        for <imx@lists.linux.dev>; Mon, 24 Aug 2026 23:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787641023; x=1788245823; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TR6WdwjvSGIyObTPwhxsK9zRSRPeNRhfXdDEqD6Slp0=;
        b=W0rdT2dyBqzJSmY8pSdiMZk+2qjBLHzvie4iVD+ZN+6a3sxifLg31q7O3gNSQ+FJ5b
         vzRxdkdMfVS6w2XAVHcqQKUoUxEyVICjWHGM7ozJVOMCBENU6owolTM8JwZihhoxwF1A
         4aMMvzxjMpDHEfM4RkyjCbDtuDWXrgmzcYtwgj8djv4PzF7ydDB9xvDD6LKxEDbHM4dR
         FHl2Y4oU+QH7sJbuUrBsdx4Q67bx4ZQW/j+QTdRZYPUJ8Jp92Q6gnvCK7394ERNZstqA
         3sz5kWjvn/ZzsWPU8uj9sTPeJf1RLZpCPEYaf5pTYiCgqt0+ssZxiqUwL/1ACAlzbF3/
         dUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787641023; x=1788245823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TR6WdwjvSGIyObTPwhxsK9zRSRPeNRhfXdDEqD6Slp0=;
        b=hwL4G5EBf1IEeuv0JX6kjhPV1njOkNO8iYePB/y5K+NM0raoUsr8pBO3AxViqwNeCX
         7vPxvdqdW10jHK8A0/wGUUFbAQ5BeeJZWp8O0qDO1r3OWxWVZy4PWQuyp3RJLHiiAoci
         z/kbb7kYeHATkDJPmbJ0kyze/kmXy36uKot5Y8o5YWfA0D/wTPwkKdT57uxqOkeZv7Yv
         osa417Xvfr2bGmeluH8JXKzE3BOV43W/9D5BSNtDOplAWgAvBVzcS7HjlxklLIkeaGHP
         DCCh4lWQ7cGVXh2yKhA8O7ip9iLQLAucGL8U1RKCmBbHMxyJztLgQS91mnVbFMtNuViF
         zBZw==
X-Forwarded-Encrypted: i=1; AHgh+Rpg1YRV/SjxD9kzWaBYtxfYKe3vR8XrjFgks5P2LIfdF439+38bwobvgcHbTK5kRj+Jf8E=@lists.linux.dev
X-Gm-Message-State: AFuF++kE3C+xVnbiJHAydN1Qtyy8hK/TKjojRzy4KPqaLV2CTxvjzCfK
	TbNJqgsL5tald5sRthhNVlYkE57JBtboXkoEA9tZBq8eoP5/F4oZT7+P
X-Gm-Gg: AR+sD11Gpv7RsBxWP5xnnhxz2osxAggXlA4zoeaQV9dgi6d94yMizBWfd+iCKW6YWSZ
	UjfDfRrOUwRmEHh2cBk2v5BSK4jNkvA2ktzLZAppIvw7ZvRmoHFGt0cR9j95OR/qYo098KWmILh
	ifWPGG6cqi7tGDwwoxjNPRM4kGF4DU5DALQ3uirgqcch3V439ocF+dzJnegNPkazTzFuVqs5BUs
	CP6D14qz+bQ0hmI+WOVfbvUunrenPlUmQQfX+lWvLcF54WTzbf7oJPS4qU/HpsI/g3a7p9Im2rg
	jPrH5GxRe0RzV7xwPrE9m7YG3IFyssXGiusosfuA28PhOoXcipnL4Oy8d/DRDlTdsVXq56usCxJ
	uLhUkWzn3iScDdACY6K8JHox0pGolM6zJkkgNCLJZGy3soKuwuj+Fu0BkTlgi2VAvuQMnFGyTxT
	10vtISD4+NeO3AzZmHLwVykrJ5TDy48USUNzbK0FwFm8bLACyqWM9FzLoxJFd1f9G54bGOQ/ONq
	i34gBhJ5MMTRhY+4YwQN7cRH+ailc2+peT+Qv87/cQfpyHFXVfHAjTu
X-Received: by 2002:a17:907:72c5:b0:c24:d6f0:1223 with SMTP id a640c23a62f3a-c24d6f20633mr921594766b.12.1787641022759;
        Mon, 24 Aug 2026 23:57:02 -0700 (PDT)
Received: from GLaDOS.station (mob-5-90-70-208.net.vodafone.it. [5.90.70.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24d6f203acsm613534266b.24.2026.08.24.23.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 23:57:02 -0700 (PDT)
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
Subject: [PATCH v4 0/3] Add support for Variscite VAR-SOM-MX7 and MX7CustomBoard
Date: Tue, 25 Aug 2026 08:56:52 +0200
Message-ID: <cover.1787586961.git.stefano.r@variscite.com>
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

v3->v4:
 - Fixed non-generic names and wrong separators
 - Fixed ads7846_ts pendown gpio

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

