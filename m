Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EDB13AD1C
	for <imx@lists.linux.dev>; Sun, 13 Jul 2025 05:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752386128; cv=none; b=Kp/6fz9TT5m95rdzq9gmavlhznRhF4culIDNbEl4LCNiclQC6P8zXPF+iafUFFIIuink+UHZqJMR/wHw1tvOEydsq7o7fWgH0CX9RC0ohOxsJCKBKmQYiIv/Na8PqoJtdjx6554yRz7flpJwFl231VQ6ZHaiTahS7HZimQ00etw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752386128; c=relaxed/simple;
	bh=qm7+Mx7u5QOJNxAs3xCaGOd1NqMpWlPdU3knTBx6Mfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=khJcoB4UzCxcXDCCP7H6CGde+4uNqlAXQweKjFQpS6MpixCc8XoJOMz4EhU9VmapurQc7spbm75Lmmuh4FllbzLHI1mqMBtuqA7yX7oBGndeZx0V7AHlnaLgx5j4oZnoL5HiJt1RreszLBmMDCnfLAU3tDfv2SzlYzIhWDeEFVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=LsllltFm; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="LsllltFm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=nAuuKa3amLNUIITUdw1sDP3OJaze7w6ni2gh1DaPiOA=;
	b=LsllltFmcxDhS3mny9q0yQowXIkJm167ACWGKn+yoGjSa7suY9z/Cat372APyH
	kgkRuIo3ADywjJjsbbkslsCxke4oQqTJIno0M2N8uDo4e4NDKDQBPHzB3YRZqHJY
	gfDnSGgUttQF1nz1WqRiNYVHiF89ULcGSEhA25qWPzh/8=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDXb50mSnNoHrt9AA--.3344S5;
	Sun, 13 Jul 2025 13:54:50 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/5] i.MX arm64 device tree change for 6.17
Date: Sun, 13 Jul 2025 13:54:33 +0800
Message-ID: <20250713055441.221235-4-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250713055441.221235-1-shawnguo2@yeah.net>
References: <20250713055441.221235-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgDXb50mSnNoHrt9AA--.3344S5
X-Coremail-Antispam: 1Uf129KBjvAXoW3tr43GFW7ZFyxKw4xJr1UWrg_yoW8Gw1xKo
	WfCFWrA3yjkr47GF4jvry2kw1Yg3Z5Wr1xXFWUZFyrCw4rXFy3Z3s7Wr4Y9rWrA34rCFyk
	W3W7KryYy3y5Xr97n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxO6JUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiARuJZWhy+B7xZwABsd

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-6.17

for you to fetch changes up to 4f25d7f1439f12233768dce853260b8302424d16:

  arm64: dts: imx8q: add camera ov5640 support for imx8qm-mek and imx8qxp-mek (2025-07-13 09:39:05 +0800)

----------------------------------------------------------------
i.MX arm64 device tree changes for 6.17:

- New board support: GOcontroll Moduline based devices, phyCORE-i.MX 95
  Plus FPSC SoM and base boards, i.MX93 phycore overlays
- A few i.MX8M changes from Adam Ford to add DMA configuration for
  UART2, set up VPU clocks for nominal and overdrive mode, improve
  HS400 USDHC clock speed
- Several sets of changes from Alexander Stein to add EASRC support for
  tqma8mnql and tqma8mpql board, add missing DMA entries for I2C & LPUART
  on ls1043a and ls1046a, enable SFP interface for tqmls1043a and
  tqmls1046a, etc.
- A series from Clark Wang to improve Ethernet support for i.MX93,
  removing eee-broken-1000t for eqos node, reducing the driving strength
  of net RXC/TXC, etc.
- A few i.MX95 and i.MX8Q changes from Frank Li to add missing devices
  for EVK board and enable camera support
- A couple of changes from Laurentiu Mihalcea to support WM8962 audio
  codec for imx8qxp-mek and imx8qm-mek board
- A number of changes from Shengjiu Wang to improve various audio
  support for imx943-evk and imx8mp-evk
- A series from Tim Harvey to increase HS400 USDHC clock speed for
  Gateworks i.MX8M Venice devices
- Many other random improvements and cleanups on various boards

----------------------------------------------------------------
Adam Ford (6):
      arm64: dts: imx8mp-nominal: Explicitly configure nominal VPU clocks
      arm64: dts: imx8mp: Configure VPU clocks for overdrive
      arm64: dts: imx8mm-beacon: Fix HS400 USDHC clock speed
      arm64: dts: imx8mn-beacon: Fix HS400 USDHC clock speed
      arm64: dts: imx8mm: Configure DMA on UART2
      arm64: dts: imx8mn: Configure DMA on UART2

Alexander Stein (15):
      arm64: dts: freescale: imx93-tqma9352: Limit BUCK2 to 600mV
      arm64: dts: freescale: imx93-tqma9352: Remove unneeded GPIO hog
      arm64: dts: tqma8mnql: Add EASRC support
      arm64: dts: tqma8mpql: Add EASRC support
      arm64: dts: tqma8mpql-mba8mpxl-lvds: Rename overlay to include display name
      arm64: dts: fsl-ls1043a: Add missing DMA entries for I2C & LPUART
      arm64: dts: fsl-ls1046a: Add missing DMA entries for I2C & LPUART
      arm64: dts: fsl-ls1043a: Remove superfluous address and size cells
      arm64: dts: fsl-ls1046a: Remove superfluous address and size cells
      arm64: dts: fsl-ls1088a: Remove superfluous address and size cells
      arm64: dts: tqmls10xxa: Move SFP cage definition to common place
      arm64: dts: tqmls1043a: Enable SFP interface
      arm64: dts: tqmls1046a: Enable SFP interfaces
      arm64: dts: freescale: tqmls10xx-mbls10xxa: Add vdd-supply for i2c mux
      arm64: dts: freescale: tqmls10xx: Add vdd-supply for spi-nor flash

Carlos Song (3):
      arm64: dts: imx95: correct i3c node in imx95
      arm64: dts: imx943-evk: add lpi2c support
      arm64: dts: imx943-evk: add i2c io expander support

Ciprian Marian Costea (1):
      arm64: dts: s32g: add RTC node

Clark Wang (3):
      arm64: dts: imx93: remove eee-broken-1000t for eqos node
      arm64: dts: imx93-11x11-evk: disable all realtek ethernet phy CLKOUT
      arm64: dts: imx93-11x11-evk: reduce the driving strength of net RXC/TXC

Frank Li (6):
      arm64: dts: imx95-19x19-evk: add adc0 flexcan[1,2] i2c[2,3] uart5 spi3 and tpm3
      arm64: dts: imx93-qsb/evk: add usdhc3 and lpuart5
      arm64: dts: imx95: add jpeg encode and decode nodes
      arm64: dts: imx8: add capture controller for i.MX8's img subsystem
      arm64: dts: imx8q: add linux,cma node for imx8qm-mek and imx8qxp-mek
      arm64: dts: imx8q: add camera ov5640 support for imx8qm-mek and imx8qxp-mek

Haibo Chen (2):
      arm64: dts: add ngpios for vf610 compatible gpio controllers
      arm64: dts: imx93-9x9-qsb: add IMU sensor support

Horia Geantă (1):
      arm64: dts: freescale: imx8qxp/imx8qm: Add CAAM support

Ioana Ciornei (1):
      arm64: dts: lx2160a-qds: add the two on-board RGMII PHYs

Joy Zou (2):
      arm64: dts: imx93-11x11-evk: remove the duplicated pinctrl_lpi2c3 node
      arm64: dts: imx93: add edma error interrupt support

João Paulo Gonçalves (1):
      arm64: dts: freescale: imx8mp-toradex-smarc: add fan cooling levels

Larisa Grigore (1):
      arm64: dts: Add DSPI entries for S32G platforms

Laurentiu Mihalcea (2):
      arm64: dts: imx8qxp-mek: support wcpu board's wm8962 codec
      arm64: dts: imx8qm-mek: support revd board's wm8962 codec

Luke Wang (1):
      arm64: dts: imx95-19x19-evk: adjust pinctrl settings for usdhc2

Marco Felsch (2):
      arm64: dts: imx8mp: drop gpcv2 vpu power-domains and clocks
      arm64: dts: imx8mp: fix VPU_BUS clock setting

Markus Niebel (1):
      arm64: dts: freescale: imx93-tqma9352: add memory node

Martin Kepplinger-Novaković (1):
      arm64: dts: imx8mp: Enable gpu passive throttling

Maud Spierings (5):
      arm64: dts: imx8mp: Add pinctrl config definitions
      arm64: dts: freescale: add Ka-Ro Electronics tx8p-ml81 COM
      arm64: dts: freescale: Add the GOcontroll Moduline Display baseboard
      arm64: dts: freescale: Add the BOE av101hdt-a10 variant of the Moduline Display
      arm64: dts: freescale: Add the BOE av123z7m-n17 variant of the Moduline Display

Max Krummenacher (2):
      arm64: dts: freescale: imx8mp-toradex-smarc: fix lvds dsi mux gpio
      arm64: dts: freescale: imx8mp-toradex-smarc: remove gpio hog

Primoz Fiser (8):
      arm64: dts: freescale: imx93-phycore-som: Move ethernet0 alias to SoM
      arm64: dts: freescale: imx93-phyboard-segin: Set ethernet1 alias
      arm64: dts: freescale: imx93-phyboard-nash: Move ADC vref to SoM
      arm64: dts: freescale: imx93-phycore-som: Add watchdog ext-reset-output pin
      arm64: dts: imx93-phycore-som: Add RPMsg overlay
      arm64: dts: imx93-phyboard-segin: Add PEB-EVAL-01 overlay
      arm64: dts: imx93-phyboard-segin: Add PEB-WLBT-05 overlay
      arm64: dts: imx93-phyboard-nash: Add PEB-WLBT-07 overlay

Shengjiu Wang (5):
      arm64: dts: imx94: Add micfil and mqs device nodes
      arm64: dts: imx943-evk: add sound-wm8962 support
      arm64: dts: imx943-evk: add bt-sco sound card support
      arm64: dts: imx943-evk: Add PDM microphone sound card support
      arm64: dts: imx8mp-evk: Use fsl-asoc-card to replace simple card

Sherry Sun (1):
      arm64: dts: imx94: add missing clock related properties to flexcan1

Stefano Radaelli (2):
      arm64: dts: freescale: imx93-var-som: update eqos support for MaxLinear PHY
      arm64: dts: freescale: imx8mp-var-som: Add EQoS support with MaxLinear PHY

Thomas Richard (1):
      arm64: dts: imx8qm: add system controller watchdog support

Tim Harvey (8):
      arm64: dts: imx8mp-venice-gw74xx: update name of M2SKT_WDIS2# gpio
      arm64: dts: imx8mm-venice-gw700x: Increase HS400 USDHC clock speed
      arm64: dts: imx8mp-venice-gw702x: Increase HS400 USDHC clock speed
      arm64: dts: imx8mm-venice-gw7901: Increase HS400 USDHC clock speed
      arm64: dts: imx8mm-venice-gw7902: Increase HS400 USDHC clock speed
      arm64: dts: imx8mn-venice-gw7902: Increase HS400 USDHC clock speed
      arm64: dts: imx8mm-venice-gw7903: Increase HS400 USDHC clock speed
      arm64: dts: imx8mm-venice-gw7904: Increase HS400 USDHC clock speed

Wei Fang (2):
      arm64: dts: imx95: add SMMU support for NETC
      arm64: dts: imx95-19x19-evk: add GPIO reset for ethphy0

Xu Yang (1):
      arm64: dts: imx95-evk: add USB3 PHY tuning properties

Yannic Moog (1):
      arm64: dts: add imx95-libra-rdk-fpsc board

 arch/arm64/boot/dts/freescale/Makefile             |  42 +-
 .../freescale/fsl-ls1043a-tqmls1043a-mbls10xxa.dts |  12 +
 .../boot/dts/freescale/fsl-ls1043a-tqmls1043a.dtsi |   3 +-
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |  27 +
 .../freescale/fsl-ls1046a-tqmls1046a-mbls10xxa.dts |  22 +-
 .../boot/dts/freescale/fsl-ls1046a-tqmls1046a.dtsi |   4 +-
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |  27 +
 .../freescale/fsl-ls1088a-tqmls1088a-mbls10xxa.dts |   8 +
 .../boot/dts/freescale/fsl-ls1088a-tqmls1088a.dtsi |   4 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts  |  20 +
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     | 362 ++++++++++++
 .../arm64/boot/dts/freescale/imx8-ss-security.dtsi |  38 ++
 .../boot/dts/freescale/imx8mm-beacon-som.dtsi      |   2 +
 .../boot/dts/freescale/imx8mm-venice-gw700x.dtsi   |   2 +
 .../boot/dts/freescale/imx8mm-venice-gw7901.dts    |   2 +
 .../boot/dts/freescale/imx8mm-venice-gw7902.dts    |   2 +
 .../boot/dts/freescale/imx8mm-venice-gw7903.dts    |   2 +
 .../boot/dts/freescale/imx8mm-venice-gw7904.dts    |   2 +
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |   2 +
 .../boot/dts/freescale/imx8mn-beacon-som.dtsi      |   2 +
 .../boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts |   4 +
 .../arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi |   4 +
 .../boot/dts/freescale/imx8mn-venice-gw7902.dts    |   2 +
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |   2 +
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  62 +-
 arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi  |  18 +
 arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h     |  33 ++
 .../dts/freescale/imx8mp-toradex-smarc-dev.dts     |   6 +-
 .../boot/dts/freescale/imx8mp-toradex-smarc.dtsi   |  10 +-
 ...mx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso} |   0
 .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts    |   1 +
 .../arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi |   4 +
 ...x8p-ml81-moduline-display-106-av101hdt-a10.dtso |  94 +++
 ...x8p-ml81-moduline-display-106-av123z7m-n17.dtso | 139 +++++
 .../imx8mp-tx8p-ml81-moduline-display-106.dts      | 527 +++++++++++++++++
 .../arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi | 548 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi  |  86 +++
 .../boot/dts/freescale/imx8mp-venice-gw702x.dtsi   |   2 +
 .../boot/dts/freescale/imx8mp-venice-gw74xx.dts    |   8 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  36 +-
 .../boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso |  62 ++
 .../boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso |  62 ++
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       | 168 +++++-
 arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi   |  79 +++
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |  11 +
 .../boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso |  61 ++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      | 148 ++++-
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  84 +++
 .../boot/dts/freescale/imx8qxp-ss-security.dtsi    |  16 +
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   7 +
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |   3 +
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts  | 121 +++-
 arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts  |  99 ++++
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    |  98 ++-
 .../freescale/imx93-phyboard-nash-peb-wlbt-07.dtso |  88 +++
 .../boot/dts/freescale/imx93-phyboard-nash.dts     |   9 -
 .../imx93-phyboard-segin-peb-eval-01.dtso          |  52 ++
 .../imx93-phyboard-segin-peb-wlbt-05.dtso          |  93 +++
 .../boot/dts/freescale/imx93-phyboard-segin.dts    |   1 +
 .../boot/dts/freescale/imx93-phycore-rpmsg.dtso    |  60 ++
 .../boot/dts/freescale/imx93-phycore-som.dtsi      |  26 +
 arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi  |  21 +-
 arch/arm64/boot/dts/freescale/imx93-var-som.dtsi   |  46 +-
 arch/arm64/boot/dts/freescale/imx93.dtsi           |  10 +-
 arch/arm64/boot/dts/freescale/imx94.dtsi           |  44 ++
 arch/arm64/boot/dts/freescale/imx943-evk.dts       | 432 ++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts  |  11 +
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  | 178 +++++-
 .../boot/dts/freescale/imx95-libra-rdk-fpsc.dts    | 318 ++++++++++
 .../boot/dts/freescale/imx95-phycore-fpsc.dtsi     | 656 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi           |  67 ++-
 arch/arm64/boot/dts/freescale/mba8mx.dtsi          |   2 +-
 arch/arm64/boot/dts/freescale/s32g2.dtsi           |  86 +++
 arch/arm64/boot/dts/freescale/s32g3.dtsi           |  87 +++
 arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi    |  84 +++
 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi    |  84 +++
 .../dts/freescale/tqmls1088a-mbls10xxa-mc.dtsi     |  16 -
 .../boot/dts/freescale/tqmls10xxa-mbls10xxa.dtsi   |  21 +
 arch/arm64/boot/dts/freescale/tqmls10xxa.dtsi      |   8 +
 79 files changed, 5489 insertions(+), 201 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-security.dtsi
 rename arch/arm64/boot/dts/freescale/{imx8mp-tqma8mpql-mba8mpxl-lvds.dtso => imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtso} (100%)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-security.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-nash-peb-wlbt-07.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-libra-rdk-fpsc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-phycore-fpsc.dtsi

