Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF0006A34C
	for <imx@lists.linux.dev>; Sun, 28 Apr 2024 12:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714306401; cv=none; b=CXDVCUQ5XAdNKcEpnYpGs+LqGw0gPTsCLwHR4ZGNe/ExlDI1oCAawkwX2ocfsc90B1JbSyM7Rt98kNc5HWZeTPC/gxnwNq8EeEgqqoPYX5n4AeQ+Lsrp3anIqV8cwtxcpI5PgziHPs8g4fRqu+9HFfIygHtNVQfEDj5Dk5kIVpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714306401; c=relaxed/simple;
	bh=B+1OzlW2AU7i6AjI9uHlWDYcBqdYb91Qu9XzeIQVSgQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AkH/griAXV+D46F+lqWramfAPwoESNF8Md+ujFOP2YvmC9fdQoTO1LPWrWydMVj7GEQ0dqy4W7C+NvGFuvB0EKfuPKD4G3zsPKChl3OJw3s7uHP1jNDfTvK1sbX/W9AjDiWEAN6f5JvAxpKzvXsU4jyHVXXDob5Wjkglwel3Fi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=lnBDPuoC; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="lnBDPuoC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=dfn8m
	3jyThAqSmRe6NKzbN2g3qBvFqpuyYvyXtoILWY=; b=lnBDPuoC8WDlmagVRdrwC
	ez75/pKs5Dx/iAlkfFgiCr5QYL0vP7eI8pzal47EDDz03faE/1We9/VylUXhmTqw
	tfUnwRTwO9OZ9i/NwFTYISyrZGxKGS1pITHJongk7a/RauEC5YB4bACJb7X0aUgI
	5joy5sCy6nmRDGrJDgyKIA=
Received: from localhost.localdomain (unknown [114.216.210.46])
	by smtp1 (Coremail) with SMTP id ClUQrAD3v19HPS5mcJTNAw--.22534S5;
	Sun, 28 Apr 2024 20:12:57 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/5] i.MX arm64 device tree for 6.10
Date: Sun, 28 Apr 2024 20:12:46 +0800
Message-Id: <20240428121247.10370-4-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240428121247.10370-1-shawnguo2@yeah.net>
References: <20240428121247.10370-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:ClUQrAD3v19HPS5mcJTNAw--.22534S5
X-Coremail-Antispam: 1Uf129KBjvAXoW3tFW5KFW5KFW8Wr15WF1rZwb_yoW8Jr48to
	WfCFWrAr4jkr47CF4jvryjkwn0q3WkWr1xXF4UZr4rGw4rXFy3A3srur4j9rWrJa45uFyk
	W3W7Gr1Yk3y3W3s7n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU2l4iUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiFQrOZV6NnGd0pgAAsO

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-6.10

for you to fetch changes up to 8005c3e17db0d93c3f91dd23c45a1a463a2b0ebc:

  arm64: dts: imx93-11x11-evk: add RTC PCF2131 support (2024-04-25 17:57:34 +0800)

----------------------------------------------------------------
i.MX arm64 device tree for 6.10:

- New board support: Emcraft Systems NavQ+ Kit, Toradex Colibri iMX8DX,
  and S32G-VNP-RDB3 board.
- A series from Alexander Stein that adds empty DSI output endpoint to
  simplify DSI connection description at board level.
- Add pinmux and I2C GPIOs to support bus recovery for LX2160A.
- Add cm40 subsystem description for i.MX8 SoCs.
- A series from Frank Li that adds ADC, LPSPI and FlexSPI devices for
  imx8qm-mek board.
- Add audio devices ASRC, ESAI, SPDIF and SAI for i.MX8QXP and correct
  audio LPCG index.
- A couple of changes from Ghennadi Procopciuc that add SCMI firmware
  and uSDHC nodes for S32G SoC.
- A couple of imx8mp-msc-sm2s updates from Ian Ray improving I2C pad
  drive strength and adding SDA/SCL GPIOs for I2C devices.
- Add PCA9451A PMIC and PCF2131 RTC support for imx93-11x11-evk board.
- A series from Lucas Stach to enable HDMI display support for i.MX8MP.
- A series from Peng Fan to improve i.MX93 support for LPI2C, LPSPI, FEC
  and eQoS.
- A couple of LS1028A changes from Rob Herring to improve PCI device
  description.
- A series from Shengjiu Wang adding HDMI and PDM mic sound support for
  imx8mp-evk board.
- A number of i.MX8M Venice device improvements from Stefan Eichenberger,
  Tim Harvey and Vitor Soares.
- A series from Xu Yang that enables USB support for imx8ulp-evk and
  imx93-11x11-evk board.
- Other small and random updates on various boards.

----------------------------------------------------------------
Alexander Stein (6):
      arm64: dts: imx8mm: Add empty DSI output endpoint
      arm64: dts: imx8mn: Add empty DSI output endpoint
      arm64: dts: imx8mq: Add empty DSI output endpoint
      arm64: dts: imx8mp: Add empty DSI output endpoint
      arm64: dts: mba8mx: Simplify DSI connection
      arm64: dts: imx8mp: Enable HDMI on TQMa8MPxL/MBa8MPxL

Alice Guo (1):
      arm64: dts: imx8dxl: add lpuart device in cm40 subsystem

Carlos Song (1):
      arm64: dts: lx2160a: add pinmux and i2c gpio to support bus recovery

Dong Aisheng (1):
      arm64: dts: imx8: add cm40 subsystem dtsi

Fabio Estevam (6):
      arm64: dts: imx8m/qxp: Pass the tcpci compatible
      arm64: dts: imx8mn-evk: Fix ADV7535 dt-schema warnings
      arm64: dts: imx8mn-evk: Describe the OV5640 supplies
      arm64: dts: imx8mm-evk: Describe the OV5640 supplies
      arm64: dts: imx8mp-debix-som-a-bmb-08: Remove 'phy-supply' from eqos
      arm64: dts: imx8-ss-img: Remove JPEG clock-names

Frank Li (8):
      arm64: dts: imx8qm-mek: add adc0 support
      arm64: dts: imx8qm-mek: add lpspi2 support
      arm64: dts: imx8qm-mek: add flexspi0 support
      arm64: dts: imx8: fix audio lpcg index
      arm64: dts: imx8qxp: add asrc[0,1], esai0, spdif0 and sai[4,5]
      arm64: dts: imx8dxl: update cm40 irq number information
      arm64: dts: imx8dxl-evk: add lpuart1 and cm40 uart
      arm64: dts: imx8qxp-mek: add cm40_i2c, wm8960 and sai[0,1,4,5]

Ghennadi Procopciuc (2):
      arm64: dts: s32g: add SCMI firmware node
      arm64: dts: s32g: add uSDHC node

Gilles Talis (1):
      arm64: dts: freescale: Add device tree for Emcraft Systems NavQ+ Kit

Haibo Chen (1):
      arm64: dts: imx93: assign usdhc[1..3] root clock to 400MHz

Hiago De Franco (3):
      arm64: dts: freescale: Add i.MX8DX dtsi
      arm64: dts: freescale: Add Toradex Colibri iMX8DX
      arm64: dts: freescale: imx8m[mp]-verdin: Update audio card name

Ian Ray (2):
      arm64: dts: imx8mp-msc-sm2s: correct i2c{1..6} pad drive strength
      arm64: dts: imx8mp-msc-sm2s: Add i2c{1,6} sda-/scl-gpios

Jacopo Mondi (1):
      arm64: dts: debix-a: Disable i2c2 in base .dts

Josua Mayer (2):
      arm64: dts: fsl-lx2162a-som: add description for rtc
      arm64: dts: fsl-lx2162a-clearfog: add alias for i2c bus iic6

Joy Zou (2):
      arm64: dts: imx93-11x11-evk: add pca9451a support
      arm64: dts: imx93-11x11-evk: add RTC PCF2131 support

Krzysztof Kozlowski (2):
      arm64: dts: imx8mm-var-som-symphony: drop redundant status from typec
      arm64: dts: imx8mn-var-som-symphony: drop redundant status from typec

Lucas Stach (3):
      arm64: dts: imx8mp: add HDMI power-domains
      arm64: dts: imx8mp: add HDMI irqsteer
      arm64: dts: imx8mp: add HDMI display pipeline

Luke Wang (1):
      arm64: dts: imx93-11x11-evk: add different usdhc pinctrl for different timing usage

Marek Vasut (2):
      arm64: dts: imx8mp: Describe CSI2 GPIO expander on i.MX8MP DHCOM PDK3 board
      arm64: dts: imx8mp: Align both CSI2 pixel clock

Michael Walle (1):
      arm64: dts: ls1028a: sl28: split variant 3/ads2 carrier

Pankaj Gupta (1):
      arm64: dts: imx8ulp: add caam jr

Peng Fan (9):
      arm64: dts: imx93: drop the 4th interrupt for ADC
      arm64: dts: imx93: use FSL_EDMA_RX for rx channel
      arm64: dts: imx93: add dma support for lpi2c[1..8]
      arm64: dts: imx93: add dma support for lpspi[1..8]
      arm64: dts: imx93: add nvmem property for fec1
      arm64: dts: imx93: add nvmem property for eqos
      arm64: dts: imx93-11x11-evk: update resource table address
      arm64: dts: imx93-11x11-evk: add sleep pinctrl for eqos and fec
      arm64: dts: imx93-11x11-evk: add sleep pinctrl for sdhc2

Rob Herring (Arm) (2):
      arm64: dts: freescale: ls1028a: Fix embedded PCI interrupt mapping
      arm64: dts: freescale: ls1028a: Add standard PCI device compatible strings to ENETC

Shengjiu Wang (3):
      arm64: dts: imx8mp: Add AUD2HTX device node
      arm64: dts: imx8mp-evk: Add HDMI audio sound card support
      arm64: dts: imx8mp-evk: Add PDM micphone sound card support

Stefan Eichenberger (4):
      arm64: dts: freescale: imx8mp-verdin: replace sleep-moci hog with regulator
      arm64: dts: freescale: imx8mp-verdin-dahlia: support sleep-moci
      arm64: dts: freescale: imx8mm-verdin: replace sleep-moci hog with regulator
      arm64: dts: freescale: imx8mm-verdin-dahlia: support sleep-moci

Tim Harvey (5):
      arm64: dts: imx8mp-venice-gw74xx-imx219.dtso: fix dt warning
      arm64: dts: imx8mp-venice-gw74xx: add ADC rail for VDD_1P0
      arm64: dts: imx8mp-venice-gw72xx: add mac addr for eth1
      arm64: dts: imx8mp-venice-gw73xx: add mac addr for eth1
      arm64: dts: imx8m*-venice-gw7: Fix TPM schema violations

Vitor Soares (1):
      arm64: dts: freescale: verdin-imx8mp: enable Verdin I2C_3_HDMI interface

Wadim Mueller (1):
      arm64: dts: S32G3: Introduce device tree for S32G-VNP-RDB3

Wei Fang (1):
      arm64: dts: imx93-11x11-evk: add reset gpios for ethernet PHYs

Xu Yang (5):
      arm64: dts: imx8ulp: add usb nodes
      arm64: dts: imx8ulp-evk: enable usb nodes and add ptn5150 nodes
      arm64: dts: imx93: add usb nodes
      arm64: dts: imx93-11x11-evk: enable usb and typec nodes
      arm64: dts: imx8mm/n remove clock-names property from usb controller node

 arch/arm64/boot/dts/freescale/Makefile             |   7 +
 .../fsl-ls1028a-kontron-sl28-var3-ads2.dts         |   2 +-
 .../freescale/fsl-ls1028a-kontron-sl28-var3.dts    |  18 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |  20 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     | 108 +++++-
 .../boot/dts/freescale/fsl-lx2162a-clearfog.dts    |   1 +
 .../boot/dts/freescale/fsl-lx2162a-sr-som.dtsi     |   9 +
 arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi   | 285 +++++++++++++-
 arch/arm64/boot/dts/freescale/imx8-ss-cm40.dtsi    |  91 +++++
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     |   2 -
 .../boot/dts/freescale/imx8dx-colibri-aster.dts    |  16 +
 .../boot/dts/freescale/imx8dx-colibri-eval-v3.dts  |  16 +
 .../boot/dts/freescale/imx8dx-colibri-iris-v2.dts  |  16 +
 .../boot/dts/freescale/imx8dx-colibri-iris.dts     |  16 +
 arch/arm64/boot/dts/freescale/imx8dx-colibri.dtsi  |  11 +
 arch/arm64/boot/dts/freescale/imx8dx.dtsi          |  13 +
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      |  37 ++
 arch/arm64/boot/dts/freescale/imx8dxl.dtsi         |  13 +
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |  19 +-
 .../boot/dts/freescale/imx8mm-var-som-symphony.dts |   1 -
 .../boot/dts/freescale/imx8mm-venice-gw71xx.dtsi   |   2 +-
 .../boot/dts/freescale/imx8mm-venice-gw7901.dts    |   2 +-
 .../boot/dts/freescale/imx8mm-verdin-dahlia.dtsi   |  40 +-
 .../boot/dts/freescale/imx8mm-verdin-dev.dtsi      |   7 +-
 .../boot/dts/freescale/imx8mm-verdin-yavia.dtsi    |   5 +
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |  26 +-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |   9 +-
 arch/arm64/boot/dts/freescale/imx8mn-ddr3l-evk.dts |  16 +
 arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts  |  16 +
 arch/arm64/boot/dts/freescale/imx8mn-evk.dts       |  16 +
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi      |  45 ++-
 .../boot/dts/freescale/imx8mn-var-som-symphony.dts |   1 -
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |   8 +-
 .../arm64/boot/dts/freescale/imx8mp-beacon-kit.dts |   2 +-
 .../boot/dts/freescale/imx8mp-debix-model-a.dts    |   2 -
 .../dts/freescale/imx8mp-debix-som-a-bmb-08.dts    |   1 -
 .../arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts |  10 +
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  45 +++
 arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi |  46 ++-
 arch/arm64/boot/dts/freescale/imx8mp-navqp.dts     | 424 +++++++++++++++++++++
 .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts    |  38 ++
 .../boot/dts/freescale/imx8mp-venice-gw71xx.dtsi   |   2 +-
 .../boot/dts/freescale/imx8mp-venice-gw72xx.dtsi   |  36 ++
 .../boot/dts/freescale/imx8mp-venice-gw73xx.dtsi   |  36 ++
 .../dts/freescale/imx8mp-venice-gw74xx-imx219.dtso |  13 +
 .../boot/dts/freescale/imx8mp-venice-gw74xx.dts    |   6 +
 .../boot/dts/freescale/imx8mp-verdin-dahlia.dtsi   |  56 ++-
 .../boot/dts/freescale/imx8mp-verdin-dev.dtsi      |  12 +-
 .../boot/dts/freescale/imx8mp-verdin-mallow.dtsi   |   5 +
 .../boot/dts/freescale/imx8mp-verdin-yavia.dtsi    |  10 +
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   |  53 ++-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          | 168 +++++++-
 .../dts/freescale/imx8mq-hummingboard-pulse.dts    |   2 +-
 .../boot/dts/freescale/imx8mq-librem5-devkit.dts   |   2 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |   7 +
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |  86 +++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      | 140 ++++++-
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   1 +
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |  84 ++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |  94 +++++
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts  | 397 ++++++++++++++++++-
 arch/arm64/boot/dts/freescale/imx93.dtsi           | 140 ++++++-
 arch/arm64/boot/dts/freescale/mba8mx.dtsi          |  14 +-
 arch/arm64/boot/dts/freescale/s32g2.dtsi           |  37 +-
 arch/arm64/boot/dts/freescale/s32g274a-evb.dts     |   6 +-
 arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts    |   6 +-
 arch/arm64/boot/dts/freescale/s32g3.dtsi           | 233 +++++++++++
 arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts    |  45 +++
 68 files changed, 3022 insertions(+), 131 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-cm40.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dx-colibri-aster.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dx-colibri-eval-v3.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dx-colibri-iris-v2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dx-colibri-iris.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dx-colibri.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dx.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-navqp.dts
 create mode 100644 arch/arm64/boot/dts/freescale/s32g3.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts

