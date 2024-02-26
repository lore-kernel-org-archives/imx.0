Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 071AB1B7E4
	for <imx@lists.linux.dev>; Mon, 26 Feb 2024 03:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708918983; cv=none; b=bUbTpDxA1Z81haMshCAKs9swG/1xDLet8JXPk+HWAg0T1FhsNQ5HjWfEhzRLy/UMgDhpus8FXuI6wnpNisKbo60vaR5X3jJQict1yMaaPo2QX/2HMhXM/aSxjy1O2bgx76coGvS2XwpaHpjhNyTkEtHkd2ROMj2wf57L/0lxiNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708918983; c=relaxed/simple;
	bh=faMNo2S/zY7Dwv9OQc65kDNxlod3iZ0UfENe2IqpbAI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AZYamlGZTuTs/uGvLavo1kJWq8fyX5VD+TsIZmCESUXLfBJ2RVlSzpyb1kr4C2GiWGCf/ZgXUVEaDKSVvXfuNgBApFnSaqCcXDsvzLnvIP0mK9Q/c4ejs5qyzekMi9Fr0e8fZb7LEH4cKoAawALXoLfeiIThOaRqEg3b2ep8/yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=JnAbsrr9; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="JnAbsrr9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=azWKj
	vHBM2g0xxxl2Wba5BeLAzT/HX6MBXrBM70VXCI=; b=JnAbsrr9vFpoflf3rhZ0p
	rqxh0nP8oa5qmYyc1Z1YB8fE/Hg3OrAYgjanGLBgP8MQ/1hF9m23e7db5fb6nnyJ
	AYrX7+TBaZTUbcDuOYEI95aXyenGe0CBC15KjypCDAvrMQfxstkODfgdjCNfMp38
	l1YUhmCzydVjv0vdJQifDc=
Received: from localhost.localdomain (unknown [183.213.196.200])
	by smtp1 (Coremail) with SMTP id ClUQrACHSyCmCNxlT1hhBA--.22032S5;
	Mon, 26 Feb 2024 11:42:32 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/5] i.MX arm64 device tree for 6.9
Date: Mon, 26 Feb 2024 11:41:45 +0800
Message-Id: <20240226034147.233993-4-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240226034147.233993-1-shawnguo2@yeah.net>
References: <20240226034147.233993-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:ClUQrACHSyCmCNxlT1hhBA--.22032S5
X-Coremail-Antispam: 1Uf129KBjvAXoW3ur4xZFW3JF4kCw4DWw17ZFb_yoW8JrWfto
	WfAF4rArWjkw47WF4YvryUKw1Yq3WkWr1xXFWUXr4rGw4rXF13Z3srur4j9rWrJFy5uFyk
	W3W7Kr1Yyr4Yg3s7n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsVyxDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiGAiQZV6Nnjbw4wAAsN

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-6.9

for you to fetch changes up to da96424168aa85be683f418414cbfa8b35283186:

  arm64: dts: imx8mm-kontron-bl-osm-s: Fix Ethernet PHY compatible (2024-02-26 10:24:54 +0800)

----------------------------------------------------------------
i.MX arm64 device tree for 6.9:

- New board support: Apalis eval v1.2 carrier board, Variscite
  VAR-SOM-MX93, phyBOARD-Segin-i.MX93.
- A series from Adam Ford to enable bluetooth, configure multiple queues
  on eqos, remove unnecessary clock configuration for i.MX8 Beacon boards.
- Several changesets from Alexander Stein to add i.MX8DXP support, enable
  audio and GPU for i.MX8QXP, re-parent MEDIA_MIPI_PHY1_REF clock for
  i.MX8MP, and improve MBA8xx board description.
- A few dt-schema fixes from Fabio Estevam for i.MX8MM and i.MX93 devices.
- A bunch of changes from Frank Li to improve i.MX8QM and i.MX8DXL
  support, correcting edma3 power-domains and interrupt numbers, adding
  I2C, FlexCAN and SMMU devices, etc.
- A series from Frieder Schrempf to improve imx8mm-kontron board
  descriptions, disabling pulls, fixing up RTC device, adding EEPROM,
  and refactoring OSM-S module, etc.
- A set of Data Modul i.MX8M Plus eDM SBC improvements from Marek Vasut.
- A series from Shengjiu Wang to add PDM micphone and SPDIF sound card
  support for imx8mm-evk board.
- A series of imx8mm-venice boards improvement from Tim Harvey to add
  TPM device, fix USB OTG VBUS etc.
- Other small and random improvements on various boards.

----------------------------------------------------------------
Adam Ford (4):
      arm64: dts: imx8mp-beacon: Enable Bluetooth
      arm64: dts: imx8mp-beacon: Configure multiple queues on eqos
      arm64: dts: imx8mn: Slow default video_pll clock rate
      arm64: dts: imx8mn-beacon: Remove unnecessary clock configuration

Alexander Stein (16):
      arm64: dts: imx: add imx8dxp support
      arm64: dts: freescale: add initial device tree for TQMa8Xx
      arm64: dts: imx8qxp: Add ACM input clock gates
      arm64: dts: imx8qxp: Add audio clock mux node
      arm64: dts: imx8qxp: Add audio SAI nodes
      arm64: dts: imx8qxp: Add mclkout clock gates
      arm64: dts: imx8qxp: mba8xx: Add analog audio output on MBa8Xx
      arm64: dts: imx8qxp: add GPU nodes
      arm64: dts: imx8mp: reparent MEDIA_MIPI_PHY1_REF to CLK_24M
      arm64: dts: freescale: tqma9352: Update I2C eeprom compatible
      arm64: dts: freescale: imx8-ss-dma: Fix edma3's location
      arm64: dts: imx8: Fix lpuart DMA channel order
      arm64: dts: freescale: imx8mm/imx8mq: mba8mx: Use PCIe clock generator
      arm64: dts: imx8mq: tqma8mq-mba8mx: Add missing USB vbus supply
      arm64: dts: imx8mn: tqma8mqnl-mba8mx: Add USB DR overlay
      arm64: dts: mba8xx: Add missing #interrupt-cells

Dominik Haller (1):
      arm64: dts: imx8mp-phyboard-pollux: Disable pull-up for CD GPIO

Fabio Estevam (4):
      arm64: dts: ls1046a: Remove big-endian from thermal
      arm64: dts: imx93-var-som: Remove phy-supply from eqos
      arm64: dts: imx8-apalis-v1.1: Remove reset-names from ethernet-phy
      arm64: dts: imx8mm-kontron-bl-osm-s: Fix Ethernet PHY compatible

Frank Li (11):
      arm64: dts: imx8qm: Align edma3 power-domains resources indentation
      arm64: dts: imx8qm: Correct edma3 power-domains and interrupt numbers
      arm64: dts: imx8dxl: update flexcan[1-3] interrupt number
      arm64: dts: imx8dxl-evk: add i2c3 and its children nodes
      arm64: dts: imx8dxl-evk: add flexcan2 and flecan3
      arm64: dts: imx8qm: add smmu node
      arm64: dts: imx8qm: add smmu stream id information
      arm64: dts: imx8dxl: add fsl-dma.h dt-binding header file
      arm64: dts: imx8dxl update edma0 information
      arm64: dts: imx8qm: add i2c4 and i2c4_lpcg node
      arm64: dts: imx8qm: add i2c1 for imx8qm-mek board

Frieder Schrempf (12):
      arm64: dts: imx8mm-kontron: Disable pullups for I2C signals on OSM-S i.MX8MM
      arm64: dts: imx8mm-kontron: Disable pullups for I2C signals on SL/BL i.MX8MM
      arm64: dts: imx8mm-kontron: Disable pullups for onboard UART signals on BL OSM-S board
      arm64: dts: imx8mm-kontron: Disable pullups for onboard UART signals on BL board
      arm64: dts: imx8mm-kontron: Disable pull resistors for SD card signals on BL OSM-S board
      arm64: dts: imx8mm-kontron: Disable pull resistors for SD card signals on BL board
      arm64: dts: imx8mm-kontron: Fix interrupt for RTC on OSM-S i.MX8MM module
      arm64: dts: imx8mm-kontron: Fix OSM-S devicetrees to match latest hardware
      arm64: dts: imx8mm-kontron: Disable uneffective PUE bit in SDIO IOMUX
      arm64: dts: imx8mm-kontron: Remove useless trickle-diode-disable from RTC node
      arm64: dts: imx8mm-kontron: Add I2C EEPROM on OSM-S Kontron i.MX8MM
      arm64: dts: imx8mm-kontron: Refactor devicetree for OSM-S module and board

Heinz Wrobel (1):
      arm64: dts: lx2160a: Fix DTS for full PL011 UART

Hou Zhiqiang (1):
      arm64: dts: ls1012a: add big-endian property for PCIe nodes

Hugo Villeneuve (1):
      arm64: dts: imx8mn-rve-gateway: remove redundant company name

Joao Paulo Goncalves (1):
      arm64: dts: freescale: imx8qm: add apalis eval v1.2 carrier board

Krzysztof Kozlowski (2):
      arm64: dts: imx93: drop "master" I3C node name suffix
      arm64: dts: freescale: minor whitespace cleanup

Li Yang (2):
      arm64: dts: ls1012a: correct the size of dcfg block
      arm64: dts: ls1012a: add gpio for i2c bus recovery

Liu Ying (1):
      arm64: dts: imx8mp-evk: Fix hdmi@3d node

Marek Vasut (3):
      arm64: dts: imx8mp: Enable PCIe to Data Modul i.MX8M Plus eDM SBC
      arm64: dts: imx8mp: Enable SAI audio on Data Modul i.MX8M Plus eDM SBC
      arm64: dts: imx8mp: Set SPI NOR to max 40 MHz on Data Modul i.MX8M Plus eDM SBC

Mathieu Othacehe (2):
      arm64: dts: imx93-var-som: Add Variscite VAR-SOM-MX93
      arm64: dts: imx93: Add phyBOARD-Segin-i.MX93 support

Philippe Schenker (1):
      arm64: dts: imx8mp-verdin: Label ldo5 and link to usdhc2

Ran Wang (1):
      arm64: dts: ls1012a: fix DWC3 USB VBUS glitch issue

Shengjiu Wang (3):
      arm64: dts: imx8mm-evk: Add PDM micphone sound card support
      arm64: dts: imx8mn-evk: Add PDM micphone sound card support
      arm64: dts: imx8mm-evk: Add spdif sound card support

Teresa Remmet (1):
      arm64: dts: imx8mp-phyboard-pollux: Reduce drive strength for eqos tx lines

Tim Harvey (5):
      arm64: dts: imx8mm-venice-gw7901: add digital I/O direction control GPIO's
      arm64: dts: imx8mm-venice-gw7901: add TPM device
      arm64: dts: imx8mm-venice-gw71xx: fix USB OTG VBUS
      arm64: dts: imx8mm-venice-gw71xx: add TPM device
      arm64: dts: imx8mp-venice-gw71xx: add TPM device

Xiaowei Bao (1):
      arm64: dts: ls1088a: Add the PME interrupt for PCIe EP node

Yannic Moog (2):
      arm64: dts: imx8mp-phyboard-pollux-rdk: add etml panel support
      arm64: dts: imx8mp-phyboard-pollux: Set debug uart muxing to 0x140

Yashwanth Varakala (1):
      arm64: dts: imx8mp-phyboard-pollux: Add and update rtc devicetree node

 arch/arm/boot/dts/nxp/ls/ls1021a.dtsi              |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |   8 +
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi     |  10 +-
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |   1 -
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |   6 +
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |  32 +-
 .../boot/dts/freescale/imx8-apalis-eval-v1.1.dtsi  |  26 +
 .../boot/dts/freescale/imx8-apalis-eval-v1.2.dtsi  | 124 +++++
 .../arm64/boot/dts/freescale/imx8-apalis-eval.dtsi |  22 -
 .../arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi |   1 -
 arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi   | 330 ++++++++++++
 arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi     |  63 +--
 arch/arm64/boot/dts/freescale/imx8-ss-gpu0.dtsi    |  27 +
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      | 101 ++++
 arch/arm64/boot/dts/freescale/imx8dxl-ss-adma.dtsi |  77 +++
 arch/arm64/boot/dts/freescale/imx8dxl.dtsi         |   1 +
 .../boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dts |  16 +
 .../arm64/boot/dts/freescale/imx8dxp-tqma8xdp.dtsi |  24 +
 arch/arm64/boot/dts/freescale/imx8dxp.dtsi         |  24 +
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |  69 +++
 .../boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts | 294 ++++-------
 .../arm64/boot/dts/freescale/imx8mm-kontron-bl.dts |  38 +-
 .../boot/dts/freescale/imx8mm-kontron-osm-s.dtsi   | 567 ++++++++++++++++++++-
 .../boot/dts/freescale/imx8mm-kontron-sl.dtsi      |   4 +-
 .../boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts |  14 +-
 .../boot/dts/freescale/imx8mm-venice-gw71xx.dtsi   |  40 +-
 .../boot/dts/freescale/imx8mm-venice-gw7901.dts    |  14 +-
 .../arm64/boot/dts/freescale/imx8mn-beacon-kit.dts |   2 -
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi      |  36 ++
 .../boot/dts/freescale/imx8mn-rve-gateway.dts      |   2 +-
 .../freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtso  |  64 +++
 .../boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts |   5 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |   2 +-
 .../boot/dts/freescale/imx8mp-beacon-som.dtsi      |  71 +++
 .../dts/freescale/imx8mp-data-modul-edm-sbc.dts    |  82 ++-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |  33 +-
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   | 107 +++-
 .../boot/dts/freescale/imx8mp-phycore-som.dtsi     |   1 -
 .../boot/dts/freescale/imx8mp-venice-gw71xx.dtsi   |  10 +-
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   |   3 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  12 +-
 .../boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts   |  24 +-
 .../boot/dts/freescale/imx8qm-apalis-eval-v1.2.dts |  16 +
 .../boot/dts/freescale/imx8qm-apalis-eval.dts      |   2 +-
 .../dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dts |  26 +
 .../boot/dts/freescale/imx8qm-apalis-v1.1-eval.dts |   2 +-
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |  26 +
 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi  |   5 +
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi   |  55 +-
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |  41 ++
 .../boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dts |  16 +
 .../arm64/boot/dts/freescale/imx8qxp-tqma8xqp.dtsi |  14 +
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   8 +
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |   2 +-
 .../boot/dts/freescale/imx93-phyboard-segin.dts    | 117 +++++
 .../boot/dts/freescale/imx93-phycore-som.dtsi      | 126 +++++
 arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi  |   4 +-
 .../boot/dts/freescale/imx93-var-som-symphony.dts  | 351 +++++++++++++
 arch/arm64/boot/dts/freescale/imx93-var-som.dtsi   | 110 ++++
 arch/arm64/boot/dts/freescale/imx93.dtsi           |   4 +-
 arch/arm64/boot/dts/freescale/mba8mx.dtsi          |  21 +-
 arch/arm64/boot/dts/freescale/mba8xx.dtsi          | 554 ++++++++++++++++++++
 arch/arm64/boot/dts/freescale/tqma8xx.dtsi         | 265 ++++++++++
 63 files changed, 3749 insertions(+), 404 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-apalis-eval-v1.1.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-apalis-eval-v1.2.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-gpu0.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp-mba8xx.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdp.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxp.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-apalis-eval-v1.2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-apalis-v1.1-eval-v1.2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp-mba8xx.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqp.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/mba8xx.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/tqma8xx.dtsi

