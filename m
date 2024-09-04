Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538EE5C96
	for <imx@lists.linux.dev>; Wed,  4 Sep 2024 14:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725460517; cv=none; b=FhhSHhuQ+NoLNP6Cyd0BJNXy6pB/Ttz7zY3AKAernLg9NazBCbovriYtvyto6ZBHd5WmEgjIYROjhRiXbrvvH5uq4uniFnvaR0n1qa/JX0ibPn6zh5FZ+5+eXtz//6AjbRv5tG4M4deWf0QqPEjaOOKo3ZIlXV0Lt2mIuCkxt+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725460517; c=relaxed/simple;
	bh=qEaE2MPXcSZky8/BHMu1lMJZrMtUnP7KEVvKdHP4xjs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Aw7dakTOe5iWiZHJ+LP/sv5hZ1lRw2GvsQOvSNmJiwX9lV15RMETi9YFZYygL96bhzxcFzJ+cZJHByEXVON/knJN+wiLBqYAxUv4B/UDZNkG6B5M9s3Bqp13JHw6/40QU9997FYFsfagUdMK7Wzu95AIn55ZYAJQacoZpb7MPOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=kQ0UVeyC; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="kQ0UVeyC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=58Ay/IEJd7lrxMI3B444fdtgQlnJirgrJC1AWWMhi2k=;
	b=kQ0UVeyCocxClNdCs8QbE1xbJ457yHtrRXPwcEL5J+8+3qczmH40JGT8R3sNlA
	o2nQS/ffk3/1QNO8KtPodaOwG/jP26PSDVvx7tJsGZ/lLkNoOgDNF6RgUQqsr3Qk
	eJxfvHfgofVTXC8SZVt274/d+KZhdPd0vtKesJ7TGFq5o=
Received: from localhost.localdomain (unknown [114.216.210.89])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCHd9UEcNhmUkhrAA--.17423S6;
	Wed, 04 Sep 2024 22:34:48 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/6] i.MX arm64 device tree changes for 6.12
Date: Wed,  4 Sep 2024 22:34:38 +0800
Message-Id: <20240904143439.211552-5-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904143439.211552-1-shawnguo2@yeah.net>
References: <20240904143439.211552-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgCHd9UEcNhmUkhrAA--.17423S6
X-Coremail-Antispam: 1Uf129KBjvAXoWfGry3XF4fuF47KFyfurW3Wrg_yoW8Cr4kXo
	WfCFWrA3y2kw4UuF4Yvryjkwn0ga1kWr1xXFW8ZrWrGw48XFyay34xWF4jgrWrJ34UCFyk
	W3W7Gr1Ykay5Wr97n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxoGQDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQxQZWbYPv98JwAAsU

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-6.12

for you to fetch changes up to f68db46a0977858f8a52987acc54454afd4c2ed5:

  arm64: dts: imx: rename gpio hog as <gpio name>-hog (2024-09-04 17:36:24 +0800)

----------------------------------------------------------------
i.MX arm64 device tree changes for 6.12:

- A series from Alexander Stein that improves imx93-tqma9352 board
  support by adding PMIC, eMMC regulators, pad configurations, etc.
- A series from Benjamin Hahn that enables overlay for no Ethernet
  device, TPM and PCIe support for imx8mp-phycore board
- A few changes from Fabio Estevam that fix dt-schema warnings for
  i.MX8MM and i.MX93 based boards
- A series from Francesco Dolcini to add fxl6408 gpio expander, PMIC
  thermal zone and USB3803 HUB for colibri-imx8x board
- A great number of changes from Frank Li that improve i.MX95 based with
  many device additions, and fix dt-schema warnings on various i.MX8 and
  layerscape device trees
- A series from João Paulo Gonçalves to add HDMI audio, analog input,
  VPU, and sound card support for Toradex Verdin and Colibri boards
- A series from Markus Niebel to improve imx93-tqma9352 board support
- Add support for Kontron i.MX93 OSM-S SoM and BL carrier board
- A couple of changes from Peng Fan to describe cache configuration for
  i.MX93 SoC and add device tree for i.MX93-14x14-EVK board
- A series from Shengjiu Wang to improve various audio features for
  imx93-11x11-evk board
- A series from Yashwanth Varakala to better describe regulator usage
  for imx8mp-phyboard-pollux board
- Other random changes on various board device trees

----------------------------------------------------------------
Adam Ford (1):
      arm64: dts: imx8mp-beacon: Enable DW HDMI Bridge

Alexander Stein (11):
      arm64: dts: imx8-ss-dma: add #address-cells and #size-cells to LPI2C nodes
      arm64: dts: imx8-ss-dma: Fix adc0 closing brace location
      arm64: dts: imx8mm-tqma8mqml-mba8mx: Increase frequency for i2c busses
      arm64: dts: mba8mx: Add Ethernet PHY IRQ support
      arm64: dts: freescale: imx93-tqma9352: Add PMIC node
      arm64: dts: freescale: imx93-tqma9352: add eMMC regulators
      arm64: dts: freescale: imx93-tqma9352-mba93xxla: enable LPSPI6 interface
      arm64: dts: freescale: imx93-tqma9352-mba93xxla: add missing pad configurations
      arm64: dts: freescale: imx93-tqma9352-mba93xxla: Add ethernet aliases
      arm64: dts: freescale: imx93-tqma9352-mba93xxca: add missing pad configurations
      arm64: dts: freescale: imx93-tqma9352-mba93xxca: Add ethernet aliases

Andrei Stefanescu (1):
      arm64: dts: s32g: add the pinctrl node

Andrej Picej (1):
      arm64: dts: imx8mp-phyboard-pollux: Disable write-protect on SD card

Animesh Agarwal (1):
      arm64: dts: layerscape: remove unused num-viewport

Benjamin Hahn (3):
      arm64: dts: freescale: imx8mp-phycore: Add no-eth overlay
      arm64: dts: freescale: imx8mp-phyboard-pollux: Add and enable TPM
      arm64: dts: imx8mp-phyboard-pollux-rdk: Add support for PCIe

Ciprian Costea (1):
      arm64: dts: s32g: Disable usdhc write-protect

Clark Wang (2):
      arm64: dts: imx8-ss-dma: enable dma support for lpspi
      arm64: dts: imx93: add lpi2c1 and st lsm6dso node

Conor Dooley (1):
      arm64: dts: imx8: remove non-existent DACs

Elinor Montmasson (1):
      arm64: dts: imx8m: update spdif sound card node properties

Emanuele Ghidoli (1):
      arm64: dts: colibri-imx8x: Add usb support

Fabio Estevam (4):
      arm64: dts: imx8mm-phygate-tauri-l: Remove compatible from dtso
      arm64: dts: imx8mm-venice-gw72xx-0x: Remove compatible from dtso
      arm64: dts: imx8mm/n-beacon-kit: Fix the order of ADV7535 reg entries
      arm64: dts: imx93-tqma9352-mba93: Fix USB hub node name

Francesco Dolcini (3):
      arm64: dts: colibri-imx8x: Add fxl6408 gpio expander
      arm64: dts: colibri-imx8x: Add PMIC thermal zone
      arm64: dts: colibri-imx8x: Add USB3803 HUB

Frank Li (42):
      arm64: dts: imx95: add edma[1..3] nodes
      arm64: dts: imx95: add sai[1..6], xcvr and micfill
      arm64: dts: imx95-19x19-evk: Add audio related nodes
      arm64: dts: imx95: add flexspi node
      arm64: dts: imx95-19x19-evk: add flexspi and child node
      arm64: dts: imx95: add thermal_zone label
      arm64: dts: imx95-19x19-evk: add pwm fan control
      arm64: dts: layerscape: rename aux-bus to bus
      arm64: dts: layerscape: rename rcpm as wakeup-control from power-control
      arm64: dts: layerscape: use common pcs-handle property
      arm64: dts: fsl-ls1043a: change uqe to uqe-bus and remove #address-cells
      arm64: dts: fsl-ls1028a: add fsl,ls1028-reset for syscon
      arm64: dts: layerscape: add msi-cell = <1> for gic its
      arm64: dts: layerscape: remove big-endian for mmc nodes
      arm64: dts: fsl-ls1046a: remove big-endian at memory-controller
      arm64: dts: layerscape: remove undocumented fsl,ls-pcie-ep
      arm64: dts: fsl,ls2085a: remove fsl,ls2085a-pcie
      arm64: dts: fsl-ls1028a: remove undocumented 'little-endian' for dspi node
      arm64: dts: fsl-ls208xa: move reboot node under syscon
      arm64: dts: imx8mm-venice-gw7901: add #address(size)-cells for gsc@20
      arm64: dts: imx8mp-data-modul-edm-sbc: remove #clock-cells for sai3
      arm64: dts: imx8mp-venice-gw74xx-imx219: remove compatible in overlay file
      arm64: dts: imx8-ss-img: remove undocument slot for jpeg
      arm64: dts: fsl-ls1043a: move "fsl,ls1043a-qdma" ahead "fsl,ls1021a-qdma"
      arm64: dts: fsl-ls1012a-frdm: move clock-sc16is7xx under root node
      arm64: dts: layerscape: rename mdio-mux-emi to mdio-mux@<addr>
      arm64: dts: fsl-ls1028: add missed supply for wm8904
      arm64: dts: imx8mm-venice-gw7902(3): add #address-cells for gsc@20
      arm64: dts: fsl-lx2160a-tqmlx2160a: change "vcc" to "vdd" for hub*
      arm64: dts: imx8mp-venice: add vddl and vana for sensor@10
      arm64: dts: fsl-ls1088a-ten64: change to low case hex value
      arm64: dts: s32v234: remove fallback compatible string arm,cortex-a9-gic
      arm64: dts: imx8mm-beacon-kit: add DVDD-supply and DOVDD-supply
      arm64: dts: imx8: add basic lvds0 and lvds1 subsystem
      arm64: dts: imx8qm: add lvds subsystem
      arm64: dts: imx8: add basic mipi subsystem
      arm64: dts: imx8qm: add mipi subsystem
      arm64: dts: imx8qm-mek: add cm4 remote-proc and related memory region
      arm64: dts: imx8qm-mek: add pwm and i2c in lvds subsystem
      arm64: dts: imx8qm-mek: add i2c in mipi[0,1] subsystem
      arm64: dts: imx8qm-mek: add usb 3.0 and related type C nodes
      arm64: dts: imx: rename gpio hog as <gpio name>-hog

Frieder Schrempf (1):
      arm64: dts: Add support for Kontron i.MX93 OSM-S SoM and BL carrier board

Haibo Chen (1):
      arm64: dts: imx95: add flexcan[1..5] support

Joy Zou (1):
      arm64: dts: ls1088ardb: add new RTC PCF2131 support

João Paulo Gonçalves (6):
      arm64: dts: imx8mp-verdin: add HDMI audio support
      arm64: dts: colibri-imx8x: Add analog inputs
      arm64: dts: colibri-imx8x: Add sound card
      arm64: dts: colibri-imx8x: Add vpu support
      arm64: dts: colibri-imx8x: Add adma_pwm
      arm64: dts: colibri-imx8x: Cleanup comments

Krzysztof Kozlowski (1):
      arm64: dts: imx8mm-var-som: drop unused top-level compatible

Laurent Pinchart (1):
      arm64: dts: imx8mp: Clarify csis clock frequency

Liu Ying (2):
      arm64: dts: imx8mp-evk: Add native HDMI output
      arm64: dts: imx93-11x11-evk: Add PWM backlight for "LVDS" connector

Marcel Ziswiler (1):
      arm64: dts: imx8mp-verdin: drop limit to sdio wi-fi frequency to 100 mhz

Marek Vasut (2):
      arm64: dts: imx8mp: Enable HDMI to Data Modul i.MX8M Plus eDM SBC
      arm64: dts: imx8mm: Update Data Modul i.MX8M Mini eDM SBC DT to rev.A01

Markus Niebel (8):
      arm64: dts: freescale: imx93-tqma9352: improve pad configuration
      arm64: dts: freescale: imx93-tqma9352-mba93xxla: improve pad configuration
      arm64: dts: freescale: imx93-tqma9352-mba93xxla: add irq for temp sensor
      arm64: dts: freescale: imx93-tqma9352-mba93xxla: add GPIO line names
      arm64: dts: freescale: imx93-tqma9352-mba93xxca: add RTC / temp sensor IRQ
      arm64: dts: freescale: imx93-tqma9352-mba93xxca: improve pad configuration
      arm64: dts: freescale: imx93-tqma9352-mba93xxca: add GPIO line names
      arm64: dts: freescale: imx93-tqma9352: set SION for cmd and data pad of USDHC

Paul Elder (1):
      arm64: dts: imx8mp: Add DT nodes for the two ISPs

Peng Fan (4):
      arm64: dts: imx95: add p2a reply channel
      arm64: dts: imx93: drop duplicated properties
      arm64: dts: imx93: support i.MX93-14x14-EVK board
      arm64: dts: imx93: add cache info

Philippe Schenker (1):
      arm64: dts: colibri-imx8x: Add 50mhz clock for eth

Shengjiu Wang (4):
      arm64: dts: imx93: Add #sound-dai-cells property
      arm64: dts: imx93-11x11-evk: add bt-sco sound card support
      arm64: dts: imx93-11x11-evk: Add PDM microphone sound card support
      arm64: dts: imx93-11x11-evk: Add audio XCVR sound card

Tarang Raval (2):
      arm64: dts: imx8mm-emtop-baseboard: Add Ethernet Support
      arm64: dts: imx8mp-var-som-symphony: Add Variscite Symphony board and VAR-SOM-MX8MP SoM

Teresa Remmet (1):
      arm64: dts: imx8mp-phyboard-pollux: Add SD-Card vqmmc supply

Tim Harvey (1):
      arm64: dts: freescale: rename gw7905 to gw75xx

Wei Fang (1):
      arm64: dts: imx95: Add NETCMIX block control support

Xu Yang (1):
      arm64: dts: imx95: add DDR Perf Monitor node

Yannic Moog (3):
      arm64: dts: imx8mp-phyboard-pollux: add rtc aux-voltage-chargeable
      arm64: dts: imx8mm-phyboard-polis: add rtc aux-voltage-chargeable
      arm64: dts: imx8mm-phygate-tauri-l: add rtc aux-voltage-chargeable

Yashwanth Varakala (5):
      arm64: dts: imx8mp-phycore: Add VDD_IO regulator
      arm64: dts: imx8mp-phycore: Assign regulator to EEPROM node
      arm64: dts: imx8mp-phyboard-pollux: Assign regulator to EEPROM node
      arm64: dts: imx8mp-phyboard-pollux: Add VCC_5V_SW regulator
      arm64: dts: imx8mp-phyboard-pollux: Add usb3_phy1 regulator reference

 arch/arm64/boot/dts/freescale/Makefile             |   9 +-
 arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dts |  12 +-
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi     |   5 +-
 .../fsl-ls1028a-kontron-sl28-var3-ads2.dts         |  12 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |  29 +-
 arch/arm64/boot/dts/freescale/fsl-ls1043-post.dtsi |   3 +
 arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts  |   2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |  15 +-
 arch/arm64/boot/dts/freescale/fsl-ls1046-post.dtsi |   4 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts  |   2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |  13 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts  |   7 +
 .../arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts |   6 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |  17 +-
 arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi |   2 +-
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi     |  34 +-
 .../freescale/fsl-lx2160a-tqmlx2160a-mblx2160a.dts |   4 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |  17 +-
 arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi     |  18 +-
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     |   2 -
 arch/arm64/boot/dts/freescale/imx8-ss-lvds0.dtsi   |  63 +++
 arch/arm64/boot/dts/freescale/imx8-ss-lvds1.dtsi   | 114 ++++
 arch/arm64/boot/dts/freescale/imx8-ss-mipi0.dtsi   | 129 +++++
 arch/arm64/boot/dts/freescale/imx8-ss-mipi1.dtsi   | 138 +++++
 arch/arm64/boot/dts/freescale/imx8dx-colibri.dtsi  |  11 +
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      |   6 -
 .../dts/freescale/imx8mm-beacon-baseboard.dtsi     |  16 +
 .../arm64/boot/dts/freescale/imx8mm-beacon-kit.dts |   4 +-
 .../dts/freescale/imx8mm-data-modul-edm-sbc.dts    |  19 +-
 .../boot/dts/freescale/imx8mm-emtop-baseboard.dts  |  48 ++
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |  15 +-
 .../dts/freescale/imx8mm-phyboard-polis-rdk.dts    |   1 +
 .../imx8mm-phygate-tauri-l-rs232-rs232.dtso        |   7 +-
 .../imx8mm-phygate-tauri-l-rs232-rs485.dtso        |   7 +-
 .../imx8mm-phygate-tauri-l-rs232-rts-cts.dtso      |   6 -
 .../boot/dts/freescale/imx8mm-phygate-tauri-l.dts  |   1 +
 .../arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi |   1 -
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi  |   1 -
 .../freescale/imx8mm-venice-gw72xx-0x-imx219.dtso  |  16 +
 .../imx8mm-venice-gw72xx-0x-rs232-rts.dtso         |   6 +-
 .../freescale/imx8mm-venice-gw72xx-0x-rs422.dtso   |   8 +-
 .../freescale/imx8mm-venice-gw72xx-0x-rs485.dtso   |   8 +-
 .../freescale/imx8mm-venice-gw73xx-0x-imx219.dtso  |  16 +
 .../imx8mm-venice-gw73xx-0x-rs232-rts.dtso         |   2 +-
 .../freescale/imx8mm-venice-gw73xx-0x-rs422.dtso   |   4 +-
 .../freescale/imx8mm-venice-gw73xx-0x-rs485.dtso   |   4 +-
 ...e-gw7905-0x.dts => imx8mm-venice-gw75xx-0x.dts} |   6 +-
 ...enice-gw7905.dtsi => imx8mm-venice-gw75xx.dtsi} |   0
 .../boot/dts/freescale/imx8mm-venice-gw7901.dts    |   2 +
 .../boot/dts/freescale/imx8mm-venice-gw7902.dts    |   2 +
 .../boot/dts/freescale/imx8mm-venice-gw7903.dts    |   2 +
 .../boot/dts/freescale/imx8mm-venice-gw7904.dts    |   2 +
 .../dts/freescale/imx8mn-beacon-baseboard.dtsi     |  16 +
 .../arm64/boot/dts/freescale/imx8mn-beacon-kit.dts |   4 +-
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi      |  15 +-
 .../boot/dts/freescale/imx8mn-venice-gw7902.dts    |   2 +
 .../arm64/boot/dts/freescale/imx8mp-beacon-kit.dts |  48 ++
 .../dts/freescale/imx8mp-data-modul-edm-sbc.dts    |  47 +-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  46 ++
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   |  66 +++
 .../boot/dts/freescale/imx8mp-phycore-no-eth.dtso  |  16 +
 .../boot/dts/freescale/imx8mp-phycore-som.dtsi     |  10 +
 .../boot/dts/freescale/imx8mp-var-som-symphony.dts |  11 +
 arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi  | 359 ++++++++++++
 .../dts/freescale/imx8mp-venice-gw74xx-imx219.dtso |  16 +-
 ...e-gw7905-2x.dts => imx8mp-venice-gw75xx-2x.dts} |   6 +-
 ...enice-gw7905.dtsi => imx8mp-venice-gw75xx.dtsi} |   0
 .../boot/dts/freescale/imx8mp-verdin-dahlia.dtsi   |  10 +
 .../boot/dts/freescale/imx8mp-verdin-dev.dtsi      |  10 +
 .../boot/dts/freescale/imx8mp-verdin-mallow.dtsi   |  10 +
 .../boot/dts/freescale/imx8mp-verdin-wifi.dtsi     |   1 -
 .../boot/dts/freescale/imx8mp-verdin-yavia.dtsi    |  10 +
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   |   8 +
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  67 ++-
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts       |  24 +-
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       | 284 +++++++++-
 arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi  |  76 +++
 arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi  |  19 +
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |  27 +
 .../boot/dts/freescale/imx8x-colibri-aster.dtsi    |  36 ++
 .../boot/dts/freescale/imx8x-colibri-eval-v3.dtsi  |  36 ++
 .../boot/dts/freescale/imx8x-colibri-iris.dtsi     |  36 ++
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi   | 212 ++++++-
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts  | 185 +++++-
 arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts  | 468 +++++++++++++++
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    |   2 -
 .../boot/dts/freescale/imx93-kontron-bl-osm-s.dts  | 163 ++++++
 .../boot/dts/freescale/imx93-kontron-osm-s.dtsi    | 628 +++++++++++++++++++++
 .../dts/freescale/imx93-tqma9352-mba93xxca.dts     | 301 +++++++---
 .../dts/freescale/imx93-tqma9352-mba93xxla.dts     | 320 ++++++++---
 arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi  | 172 ++++--
 arch/arm64/boot/dts/freescale/imx93.dtsi           |  47 ++
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  | 340 +++++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi           | 454 ++++++++++++++-
 arch/arm64/boot/dts/freescale/mba8mx.dtsi          |   9 +-
 .../boot/dts/freescale/qoriq-fman3-0-10g-0.dtsi    |   1 +
 .../boot/dts/freescale/qoriq-fman3-0-10g-1.dtsi    |   1 +
 .../boot/dts/freescale/qoriq-fman3-0-1g-0.dtsi     |   1 +
 .../boot/dts/freescale/qoriq-fman3-0-1g-1.dtsi     |   1 +
 .../boot/dts/freescale/qoriq-fman3-0-1g-2.dtsi     |   1 +
 .../boot/dts/freescale/qoriq-fman3-0-1g-3.dtsi     |   1 +
 .../boot/dts/freescale/qoriq-fman3-0-1g-4.dtsi     |   1 +
 arch/arm64/boot/dts/freescale/s32g2.dtsi           |  50 ++
 arch/arm64/boot/dts/freescale/s32g274a-evb.dts     |   1 +
 arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts    |   1 +
 arch/arm64/boot/dts/freescale/s32g3.dtsi           |  52 +-
 arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts    |   3 +-
 arch/arm64/boot/dts/freescale/s32v234.dtsi         |   2 +-
 108 files changed, 5210 insertions(+), 401 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-lvds0.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-lvds1.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-mipi0.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-mipi1.dtsi
 rename arch/arm64/boot/dts/freescale/{imx8mm-venice-gw7905-0x.dts => imx8mm-venice-gw75xx-0x.dts} (67%)
 rename arch/arm64/boot/dts/freescale/{imx8mm-venice-gw7905.dtsi => imx8mm-venice-gw75xx.dtsi} (100%)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-phycore-no-eth.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
 rename arch/arm64/boot/dts/freescale/{imx8mp-venice-gw7905-2x.dts => imx8mp-venice-gw75xx-2x.dts} (67%)
 rename arch/arm64/boot/dts/freescale/{imx8mp-venice-gw7905.dtsi => imx8mp-venice-gw75xx.dtsi} (100%)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-lvds.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-mipi.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-kontron-bl-osm-s.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi

