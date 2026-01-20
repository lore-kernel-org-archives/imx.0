Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85DC1D5CD1
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 01:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768872014; cv=none; b=srTI/izymJtnQMnxrkQF9ogHLz3VHWfABrjS5O6iaEX0dPJPkdtLGrWKduuBN5IkwbXTlr266QU3jBrPotLLCoXX5dGsbS1VxjIK6bsdprFU3dme1JwGxZjGVB0AJT1W5+SoYG83/ThVK09vAk/rHaIEHYVU0hwvvKMWE9NfWDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768872014; c=relaxed/simple;
	bh=OKxoi9HOjZWaASCiHv6JVGO0cbkhKEQQ9u4CzjawT0I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Omea2zx6S1wDtsBA5sh5wXFiCDR0VMyyDCu1MfyT9/2X1vSReQVGC1HynWd2IE11aEx40oCqJXV4Lhju7QEA7v6TkD0w9OB9cVhHAgbaYlE915Y0I/7avB85WpP5/sJwFRsQ5j+1aJbn/Oo9wDkkR0Qu49rQgpeWYwkw/MOMXfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=b1RnHgfD; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="b1RnHgfD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Gv
	oOqSo0pfg2OdoG0EFa29LA+7BiHrq2pBPMKlgj5dc=; b=b1RnHgfDuVJfydTi0v
	/ZnRELDQZl1gD3+mSX3HcZQbjLcohxJjvUND6b+y6r91PDlhPz4I98TKkYbyqFLC
	a/bxm3Eg6cylcrNhp9cXrLrdLvThWiAvyW9rxLocAHhca3YVKirTwUur8sluHGnW
	0q9I6ufjwq6N2n1iVdzqLD11M=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3_+V71m5pGbEbAg--.16504S5;
	Tue, 20 Jan 2026 09:12:31 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/5] i.MX arm64 device tree changes for 6.20
Date: Tue, 20 Jan 2026 09:12:17 +0800
Message-ID: <20260120011221.4387-4-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120011221.4387-1-shawnguo2@yeah.net>
References: <20260120011221.4387-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgD3_+V71m5pGbEbAg--.16504S5
X-Coremail-Antispam: 1Uf129KBjvAXoW3Aw45uF1rWF1fXw4kCFyUKFg_yoW8Cry7Xo
	Z3CFWrArWjkr47GF4Yvryqkw1Yq3Z5Wr1IqFWUZrWrGw4rXF13t3429r4j9rZ5JFyUCFyk
	W3W7tr15Ar45W3s7n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxSoGDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiOB-KMGlu1n8iugAA3r

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-6.20

for you to fetch changes up to 9bdfeed989b126a3c9c5a6f74ad2d96784b69d27:

  arm64: dts: freescale: imx95: Add support for i.MX95 15x15 FRDM board (2026-01-18 14:39:44 +0800)

----------------------------------------------------------------
i.MX arm64 device tree changes for 6.20:

- New board support: i.MX8MP/i.MX91/i.MX93/i.MX95 FRDM, ifm VHIP4
  EvalBoard, Apalis iMX8QP, TQ-Systems MBLS1028A/MBLS1028A-IND
- A number of series from Alexander Stein improving lpcg indices
  description for tqma8xxs board, moving BMAN/QMAN buffers for
  tqmls1046a, refreshing tqma8mpql-mba8mpxl support a bit, adding HDMI
  audio support for tqma8mpql-mba8mp-ras314 etc.
- A series from Chancel Liu adding various audio features for
  imx93-14x14-evk board
- A series from Francesco Dolcini enabling hdmi_pai device for
  imx8mp-verdin and imx8mp-toradex-smarc
- A couple of changes from Francesco Valla enabling more devices
  and correcting CAN transceiver gpio for imx93-11x11-frdm
- A few changes from Frank Li adding DDR perf support for imx8qm, adding
  camera support for imx8mp-evk, enabling thermal support for i.MX91, etc.
- A series from Haibo Chen adding flexcan support for imx943-evk and
  imx952-evk boards
- A series from Krzysztof Kozlowski fixing up coding style issues
- A couple of changes from Marek Vasut updating Data Modul i.MX8M Plus
  eDM SBC DT to rev.903, using GPU_CGC as core clock for GPU on i.MX95
- A series from Markus Niebel to clean up imx8mm-tqma8mqml board
  regulators
- A couple of series from Peng Fan replacing xceiver-supply with phys
  for NXP EVK boards, improving imx952-evk board support
- A series from Sebastian Krzyszkowiak to refresh imx8mq-librem5 support
- A couple of series from Stefano Radaelli to improve
  imx93-var-som-symphony and imx8mp-var-som support
- Other random changes for various boards

----------------------------------------------------------------
Alexander Stein (12):
      arm64: dts: tqma8xxs: replace 0 with IMX_LPCG_CLK_0 for lpcg indices
      arm64: dts: tqma8xxs-mb-smarc-2: replace 0 with IMX_LPCG_CLK_0 for lpcg indices
      arm64: dts: tqmls1046a: Move BMAN/QMAN buffers to DRAM1 area
      arm64: dts: tqma8mpql-mba8mpxl: Adjust copyright text format
      arm64: dts: tqma8mpql-mba8mpxl: Fix Ethernet PHY IRQ support
      arm64: dts: tqma8mpql-mba8mpxl: Fix HDMI CEC pad control settings
      arm64: dts: tqma8mpql-mba8mpxl: Add HDMI audio output support
      arm64: dts: tqma8mpql-mba8mpxl: Configure IEEE 1588 event out signal
      arm64: dts: tqma8mpql-mba8mp-ras314: Fix Ethernet PHY IRQ support
      arm64: dts: tqma8mpql-mba8mp-ras314: Fix HDMI CEC pad control settings
      arm64: dts: tqma8mpql-mba8mp-ras314: Add HDMI audio output support
      arm64: dts: mb-smarc-2: Add PCIe support

Chancel Liu (7):
      arm64: dts: imx93-14x14-evk: Add bt-sco sound card support
      arm64: dts: imx93-14x14-evk: Add audio XCVR sound card
      arm64: dts: imx91-11x11-evk: Refine label and node name of WM8962
      arm64: dts: imx91-11x11-evk: Add bt-sco sound card support
      arm64: dts: imx91-11x11-evk: Add WM8962 sound card support
      arm64: dts: imx91-11x11-evk: Add PDM microphone sound card support
      arm64: dts: imx91-11x11-evk: Add audio XCVR sound card support

Daniel Baluta (1):
      arm64: dts: imx93-11x11-frdm: Add MQS audio support

Daniel Schultz (1):
      arm64: dts: imx8mm: Add label to thermal-zones

Fabian Pflug (1):
      arm64: dts: freescale: add support for NXP i.MX93 FRDM

Fedor Ross (1):
      arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard v1 and v2

Francesco Dolcini (7):
      arm64: dts: freescale: imx8-apalis: Add ethernet alias
      arm64: dts: freescale: imx8mp-verdin: Remove obsolete TODO comments
      arm64: dts: freescale: imx8mp-verdin: enable hdmi_pai device
      arm64: dts: freescale: imx8mp-toradex-smarc: enable hdmi_pai device
      arm64: dts: imx8qm: Add CPU cluster labels
      arm64: dts: freescale: Add NXP i.MX8QP SoC dtsi
      arm64: dts: freescale: Add Apalis iMX8QP

Francesco Valla (2):
      arm64: dts: imx93-11x11-frdm: enable additional devices
      arm64: dts: imx91-11x11-frdm: fix CAN transceiver gpio

Frank Li (5):
      arm64: dts: imx8qm: add ddr perf device node
      arm64: dts: mba8xx: replace 0 with IMX_LPCG_CLK_0 for lpcg indices
      arm64: dts: imx8qxp-mek: Add sensors under i2c1 bus
      arm64: dts: imx8mp-evk: add camera ov5640 and related nodes
      arm64: dts: imx91: Add thermal-sensor and thermal-zone support

Gregor Herburger (1):
      arm64: dts: ls1028a: Add mbls1028a and mbls1028a-ind devicetrees

Haibo Chen (6):
      arm64: dts: imx943-evk: add flexcan support
      arm64: dts: imx93-9x9-qsb: add CAN support overlay file
      arm64: dts: imx94: add xspi device node
      arm64: dts: imx94: add mt35xu512aba spi nor support
      arm64: dts: imx952-evk: Change the usdhc1_200mhz drive strength to DSE4
      arm64: dts: imx952-evk: Add flexcan support

Jacky Bai (1):
      arm64: dts: imx8dxl-ss-ddr: Add DB (system interconnects) pmu support for i.MX8DXL

Joseph Guo (1):
      arm64: dts: freescale: Add FRDM-IMX91 basic support

Krzysztof Kozlowski (3):
      arm64: dts: freescale: Use hyphen in node names
      arm64: dts: freescale: Minor whitespace cleanup
      arm64: dts: freescale: Use lowercase hex

Laurentiu Mihalcea (1):
      arm64: dts: imx8ulp: add sim lpav node

Lei Xu (1):
      arm64: dts: freescale: imx95: Add support for i.MX95 15x15 FRDM board

Marek Vasut (3):
      arm64: dts: imx8mp: Update Data Modul i.MX8M Plus eDM SBC DT to rev.903
      arm64: dts: imx95: Use GPU_CGC as core clock for GPU
      arm64: dts: imx8mn: Add SNVS LPGPR

Markus Niebel (7):
      arm64: dts: imx8mm-tqma8mqml: remove virtual 3.3V regulator
      arm64: dts: imx8mm-tqma8mqml: remove virtual 1.8V regulator
      arm64: dts: imx8mm-tqma8mqml: remove superfluous line
      arm64: dts: imx8mm-tqma8mqml: fix LDO5 power off
      arm64: dts: imx8mn-tqma8mqnl: remove virtual 3.3V regulator
      arm64: dts: imx8mn-tqma8mqnl: remove virtual 1.8V regulator
      arm64: dts: imx8mn-tqma8mqnl: fix LDO5 power off

Max Krummenacher (1):
      arm64: dts: colibri-imx8x: Add wi-fi 32kHz clock

Peng Fan (13):
      arm64: dts: imx95-15x15-evk: Use phys to replace xceiver-supply
      arm64: dts: imx8mp-evk: Use phys to replace xceiver-supply
      arm64: dts: imx93-11x11-evk: Use phys to replace xceiver-supply
      arm64: dts: freescale: Add initial device tree for i.MX952
      arm64: dts: freescale: Add i.MX952 EVK basic device tree
      arm64: dts: imx952: Add idle-states node
      arm64: dts: imx952-evk: Enable I2C[2,3,4,6,7] bus
      arm64: dts: imx952-evk: Enable UART5
      arm64: dts: imx952-evk: Enable SPI7
      arm64: dts: imx952-evk: Enable USB[1,2]
      arm64: dts: imx952-evk: Enable wdog3
      arm64: dts: imx952-evk: Enable TPM[3,6]
      arm64: dts: imx952-evk: Add nxp,ctrl-ids for scmi misc

Philippe Schenker (2):
      arm64: dts: colibri-imx8x: Add backlight
      arm64: dts: colibri-imx8x: Add cma memory

Rogerio Pimentel (1):
      arm64: dts: add support for NXP i.MX8MP FRDM board

Sebastian Krzyszkowiak (6):
      arm64: dts: imx8mq-librem5: Enable I2C recovery
      arm64: dts: imx8mq-librem5: Set vibrator's PWM frequency to 20kHz
      arm64: dts: imx8mq-librem5: Enable SNVS RTC
      arm64: dts: imx8mq-librem5: Limit uSDHC2 frequency to 50MHz
      arm64: dts: imx8mq-librem5: Set cap-power-off-card for usdhc2
      arm64: dts: imx8mq-librem5: Don't set mic-cfg for wm8962

Stefan Riedmueller (1):
      arm64: dts: imx8mp-phyboard-pollux: Enable i2c3

Stefano Radaelli (10):
      arm64: dts: imx93-var-som-symphony: Update gpio aliases
      arm64: dts: imx93-var-som-symphony: Add support for ft5x06 touch controller
      arm64: dts: imx93-var-som-symphony: Add USB support
      arm64: dts: imx93-var-som-symphony: Enable LPSPI6 controller
      arm64: dts: imx8mp-var-som: Move USDHC2 support to Symphony carrier
      arm64: dts: imx8mp-var-som: Move PCA9534 GPIO expander to Symphony carrier
      arm64: dts: imx8mp-var-som: Move UART2 description to Symphony carrier
      arm64: dts: imx8mp-var-som: Add WiFi and Bluetooth support
      arm64: dts: imx8mp-var-som: Add support for WM8904 audio codec
      arm64: dts: imx8mp-var-som: Add support for TSC2046 touchscreen

Teresa Remmet (1):
      arm64: dts: imx8mm-phycore-som: Update eth phy impedance

Tim Harvey (1):
      arm64: dts: imx8m{m,p}-venice-gw71xx: Add Magetometer

Wei Fang (2):
      arm64: dts: imx94: add basic NETC related nodes
      arm64: dts: imx943-evk: add ENETC, EMDIO and PTP Timer support

Yannic Moog (3):
      arm64: dts: imx8mp-phyboard-pollux: add fan-supply
      arm64: dts: imx8mp-phycore-som: add spi-nor supply vcc
      arm64: dts: imx8mp-phyboard-pollux: add PEB-WLBT-05 expansion board

Yashwanth Varakala (2):
      arm64: dts: imx8mp libra: add and update display overlays
      arm64: dts: imx8mp libra: add peb-av-10 expansion board overlay

 arch/arm64/boot/dts/freescale/Makefile             |   48 +-
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi     |    2 +-
 .../fsl-ls1028a-tqmls1028a-mbls1028a-ind.dts       |   68 ++
 .../freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dts |  118 ++
 .../fsl-ls1028a-tqmls1028a-mbls1028a.dtsi          |  287 +++++
 .../boot/dts/freescale/fsl-ls1028a-tqmls1028a.dtsi |  124 ++
 .../boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi |   12 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |    6 +-
 .../arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts |    4 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |    2 +-
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi     |    2 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |   32 +-
 .../arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi |    4 +
 arch/arm64/boot/dts/freescale/imx8-ss-ddr.dtsi     |    2 +-
 arch/arm64/boot/dts/freescale/imx8dxl-ss-ddr.dtsi  |   22 +
 arch/arm64/boot/dts/freescale/imx8dxl.dtsi         |    7 +
 .../boot/dts/freescale/imx8mm-phycore-rpmsg.dtso   |    2 +-
 .../boot/dts/freescale/imx8mm-phycore-som.dtsi     |    1 +
 .../boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts |   13 +-
 .../arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi |   39 +-
 .../boot/dts/freescale/imx8mm-venice-gw71xx.dtsi   |   15 +
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |    2 +-
 .../boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts |   29 +-
 .../arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi |   37 +-
 .../freescale/imx8mn-vhip4-evalboard-common.dtsi   |  396 ++++++
 .../imx8mn-vhip4-evalboard-ksz8794-common.dtsi     |   98 ++
 .../imx8mn-vhip4-evalboard-v1-overlay-ksz8794.dtso |   24 +
 .../imx8mn-vhip4-evalboard-v1-overlay-ksz9031.dtso |   48 +
 .../dts/freescale/imx8mn-vhip4-evalboard-v1.dts    |  258 ++++
 ...imx8mn-vhip4-evalboard-v2-overlay-adin1300.dtso |   60 +
 .../imx8mn-vhip4-evalboard-v2-overlay-ksz8794.dtso |   24 +
 .../dts/freescale/imx8mn-vhip4-evalboard-v2.dts    |  221 ++++
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |    5 +
 .../dts/freescale/imx8mp-data-modul-edm-sbc.dts    |  148 ++-
 arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts  |    2 +-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  123 +-
 arch/arm64/boot/dts/freescale/imx8mp-frdm.dts      |  355 ++++++
 .../imx8mp-hummingboard-pulse-common.dtsi          |    2 +-
 .../imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtso  |    2 +-
 .../imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtsi      |  196 +++
 .../imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtso      |    9 +
 ...8mp-libra-rdk-fpsc-lvds-ph128800t006-zhc01.dtso |   44 +
 .../boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts   |    6 +-
 .../imx8mp-phyboard-pollux-peb-wlbt-05.dtso        |  108 ++
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   |   33 +-
 .../boot/dts/freescale/imx8mp-phycore-som.dtsi     |    8 +
 arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi   |    6 +-
 .../dts/freescale/imx8mp-toradex-smarc-dev.dts     |    4 +
 .../boot/dts/freescale/imx8mp-toradex-smarc.dtsi   |    6 +-
 .../freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts   |   23 +-
 .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts    |   31 +-
 .../boot/dts/freescale/imx8mp-var-som-symphony.dts |  145 +++
 arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi  |  331 +++--
 .../boot/dts/freescale/imx8mp-venice-gw71xx.dtsi   |   15 +
 .../boot/dts/freescale/imx8mp-verdin-dahlia.dtsi   |    4 +
 .../boot/dts/freescale/imx8mp-verdin-dev.dtsi      |    4 +
 .../boot/dts/freescale/imx8mp-verdin-mallow.dtsi   |    4 +
 .../boot/dts/freescale/imx8mp-verdin-yavia.dtsi    |    4 +
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   |    4 -
 .../boot/dts/freescale/imx8mq-librem5-devkit.dts   |    2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |   73 +-
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |   12 +-
 arch/arm64/boot/dts/freescale/imx8qm-ss-ddr.dtsi   |   19 +
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |   10 +-
 .../dts/freescale/imx8qp-apalis-v1.1-eval-v1.2.dts |   26 +
 .../boot/dts/freescale/imx8qp-apalis-v1.1-eval.dts |   16 +
 .../freescale/imx8qp-apalis-v1.1-ixora-v1.1.dts    |   16 +
 .../freescale/imx8qp-apalis-v1.1-ixora-v1.2.dts    |   16 +
 .../boot/dts/freescale/imx8qp-apalis-v1.1.dtsi     |   16 +
 arch/arm64/boot/dts/freescale/imx8qp.dtsi          |   24 +
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |   38 +-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |   17 +
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi   |   31 +-
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts  |  181 ++-
 arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts |  906 ++++++++++++++
 arch/arm64/boot/dts/freescale/imx91.dtsi           |   58 +
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts  |   17 +-
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts |  807 +++++++++++++
 arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts  |   74 ++
 .../boot/dts/freescale/imx93-9x9-qsb-can1.dtso     |   63 +
 .../boot/dts/freescale/imx93-var-som-symphony.dts  |   84 ++
 arch/arm64/boot/dts/freescale/imx93-var-som.dtsi   |    4 +-
 arch/arm64/boot/dts/freescale/imx94.dtsi           |  172 ++-
 arch/arm64/boot/dts/freescale/imx943-evk.dts       |  178 +++
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts  |   17 +-
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts |  964 +++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-clock.h        |    1 +
 .../boot/dts/freescale/imx95-toradex-smarc.dtsi    |    2 +-
 .../arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi |    2 +-
 arch/arm64/boot/dts/freescale/imx95.dtsi           |    2 +-
 arch/arm64/boot/dts/freescale/imx952-clock.h       |  215 ++++
 arch/arm64/boot/dts/freescale/imx952-evk.dts       |  596 +++++++++
 arch/arm64/boot/dts/freescale/imx952-pinfunc.h     |  867 ++++++++++++++
 arch/arm64/boot/dts/freescale/imx952-power.h       |   44 +
 arch/arm64/boot/dts/freescale/imx952.dtsi          | 1266 ++++++++++++++++++++
 arch/arm64/boot/dts/freescale/mba8xx.dtsi          |    4 +-
 arch/arm64/boot/dts/freescale/s32g3.dtsi           |    4 +-
 arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi    |   20 +-
 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi    |   20 +-
 .../boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi    |   12 +-
 arch/arm64/boot/dts/freescale/tqma8xxs.dtsi        |   16 +-
 101 files changed, 10176 insertions(+), 365 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a-ind.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a-mbls1028a.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-tqmls1028a.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-ksz8794-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-ksz8794.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1-overlay-ksz9031.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2-overlay-adin1300.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2-overlay-ksz8794.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-peb-av-10.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-ph128800t006-zhc01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-wlbt-05.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-ddr.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-eval-v1.2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-eval.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-ixora-v1.1.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1-ixora-v1.2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp-apalis-v1.1.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qp.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx952-clock.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx952-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx952-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx952-power.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx952.dtsi

