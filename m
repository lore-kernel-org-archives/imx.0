Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4DF2673A5
	for <imx@lists.linux.dev>; Mon, 12 May 2025 10:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747046369; cv=none; b=WuLm0l5cUQDsWkZJjyv/acCduSBx9vOzXp8spa2Khe4A28RWRPK70XymGOgwDXGO5i+I2Gu+bbO0XQPezRAqiaW6uChdUorpj5xSzNo8XEeC07QrR6+MP+knMYwdTnks2F4qPP62SURrjte/gyOD+B41UaoxTwv6Q8GG37JTM0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747046369; c=relaxed/simple;
	bh=cZGGG+oFAD4XBVM3YQOaRN1LBHPux+jqmX+U/xCqPvY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iBU8pb4oThsTZ9FVe+cIO+veT740w3zgTV1IfuZtf5If8hgYjgxNyt9O4ykChLauFe8EmhE/53uGTlTtYY2fkS8r1XMf65IMzedmxU3NCmcVIOobncI0LvCQHu47WPsMv73GHohn0isldqcfngX11byhp4/cmJsK9O3p+zMj7Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gd5ZAxRx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gd5ZAxRx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 121CBC4CEE7;
	Mon, 12 May 2025 10:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747046369;
	bh=cZGGG+oFAD4XBVM3YQOaRN1LBHPux+jqmX+U/xCqPvY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gd5ZAxRxeIyNTdD6WZyregi2srlGu3NtyFITrXHDLhzf2xC8aRAEOC5iAijQzliU4
	 jKTVAP+p5s4qVvdOeNG2y30y6auHSMg64/xhonrSVuDvWl8nvM10gXNELXAm0NdhPw
	 pVnFiWK3hVlB8nA38z1TVlXPYNDCGGeo4iwUJFhl7GyvqyRka0CiEpRGLrbvMSwKbK
	 GlK2td0/yrNnn0+pv6GAfDJqGG8JK2iRfARj4COQ49EnsRw2icBdWOdvEJS1f1CMkq
	 KMnacNsEz/QaWJ45c+LPJFCzXi+Iyk7UKpb7//Lj9Ka7g+dsMh0rqd9bG9AfCQw1BA
	 ZJXWriJ1DP6yw==
From: Shawn Guo <shawnguo@kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/5] i.MX arm64 device tree change for 6.16
Date: Mon, 12 May 2025 11:38:57 +0100
Message-Id: <20250512103858.50501-4-shawnguo@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250512103858.50501-1-shawnguo@kernel.org>
References: <20250512103858.50501-1-shawnguo@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-6.16

for you to fetch changes up to 1f6c8626527257db05c09022e94a5cd4e162c45d:

  arm64: dts: freescale: Add PHYTEC phyBOARD-Nash-i.MX93 support (2025-05-09 22:51:06 +0800)

----------------------------------------------------------------
i.MX arm64 device tree change for 6.16:

- New board support: TQMa8XxS, TQMa95xxSA, TQMa93xx, MBa91xxCA,
  i.MX943 EVK, Nitrogen8M Plus ENC Carrier, Toradex SMARC i.MX8MP,
  Libra-i.MX 8M Plus FPSC board
- A couple of imx8mp-tqma8mpql-mba8mp-ras314 board updates that support
  Raspberry Pi Camera V2 and LVDS using device tree overlay
- A series from Adam Ford that updates i.MX8M Beacon boards for RTC
  capacitive load, HDMI audio, Ethernet PHY, etc.
- A set of changes from Daniel Baluta that enables i.MX8MP DSP node
  for rproc usage
- A few changes from Francesco Dolcini that add EEPROM compatible
  fallback for imx8mp-verdin board, add fan PWM configuation for
  imx8mp-toradex-smarc board
- A series from Frank Li to enable PCIe EP support all i.MX8 devices
  using device tree overlay
- A change from Laurentiu Mihalcea to enable Sound Open Firmware (SOF)
  support on imx95-19x19-evk board
- A few changes from Markus Niebel to disable MDIO Open Drain for
  imx93-tqma9352 devices
- A couple of changes from Max Krummenacher to enable PCIe and SATA
  support for i.MX8 Apalis and Colibri boards
- A series from Primoz Fiser to enable various devices/functions for
  i.MX93 phycore boards
- A patch set from Xu Yang to add USB2.0 support for i.MX95 EVK boards

----------------------------------------------------------------
Adam Ford (10):
      arm64: dts: imx8mm-beacon: Fix RTC capacitive load
      arm64: dts: imx8mn-beacon: Fix RTC capacitive load
      arm64: dts: imx8mp-beacon: Fix RTC capacitive load
      arm64: dts: imx8mm-beacon: Set SAI5 MCLK direction to output for HDMI audio
      arm64: dts: imx8mn-beacon: Set SAI5 MCLK direction to output for HDMI audio
      arm64: dts: imx8mm-beacon: Configure Ethernet PHY reset and GPIO IRQ
      arm64: dts: imx8mn-beacon: Configure Ethernet PHY reset and GPIO IRQ
      arm64: dts: imx8mm-beacon: Enable RTC interrupt and wakeup-source
      arm64: dts: imx8mn-beacon: Enable RTC interrupt and wakeup-source
      arm64: dts: imx8mp-beacon: Enable RTC interrupt and wakeup-source

Alexander Stein (3):
      arm64: dts: imx8mp-tqma8mpql-mba8mp-ras314: Add Raspberry Pi Camera V2 overlay
      arm64: dts: freescale: add initial device tree for TQMa8XxS
      arm64: dt: imx95: Add TQMa95xxSA

Andrej Picej (1):
      arm64: dts: imx8mm-phyboard-polis-peb-av-10: Set lvds-vod-swing

Ciprian Marian Costea (1):
      arm64: dts: s32gxxxa-rdb: Add PCA85073A RTC module over I2C0

Daniel Baluta (5):
      arm64: dts: imx8mp: Use resets property
      arm64: dts: imx8mp: Add mu2 root clock
      arm64: dts: imx8mp: Configure dsp node for rproc usage
      arm64: dts: imx8mp: Add DSP clocks
      arm64: dts: imx8mp-evk: Enable DSP node for remoteproc usage

Emanuele Ghidoli (2):
      arm64: dts: freescale: imx8mp-toradex-smarc: add embedded controller
      arm64: dts: freescale: imx8mp-toradex-smarc: add gpio expander

Francesco Dolcini (4):
      arm64: dts: freescale: imx8mp-verdin: Add EEPROM compatible fallback
      arm64: dts: freescale: imx8mm-verdin: Add EEPROM compatible fallback
      arm64: dts: freescale: imx8mp-toradex-smarc: add fan PWM configuration
      arm64: dts: freescale: imx8mp-toradex-smarc: use generic gpio node name

Frank Li (9):
      arm64: dts: imx8qm-mek: consolidate reserved-memory
      arm64: dts: imx8: create unified pcie0 and pcie0_ep label for all chips
      arm64: dts: imx8dxl-ss-hsio: correct irq number for imx8dxl
      arm64: dts: imx8dxl-evk: Add pcie0-ep node and use unified pcie0 label
      arm64: dts: imx8: use common imx-pcie0-ep.dtso to enable PCI ep function
      arm64: dts: imx95: add pcie1 ep overlay file and create pcie-ep dtb files
      arm64: dts: imx8mm-evk: add pcie0-ep node and apply pcie0-ep overlay file
      arm64: dts: imx8mq: add pcie0-ep node
      arm64: dts: imx8mq-evk: add pcie[0,1]-ep nodes

Jacky Bai (2):
      arm64: dts: freescale: Add basic dtsi for imx943
      arm64: dts: freescale: Add minimal dts support for imx943 evk

Krzysztof Kozlowski (1):
      arm64: dts: imx: Align wifi node name with bindings

Laurentiu Mihalcea (1):
      arm64: dts: imx: add imx95 dts for sof

Markus Niebel (4):
      arm64: add initial device tree for TQMa93xx/MBa91xxCA
      Revert "arm64: dts: imx93-tqma9352-mba93xxca: enable Open Drain for MDIO"
      Revert "arm64: dts: imx93-tqma9352-mba93xxla: enable Open Drain for MDIO"
      arm64: dts: imx93-tqma9352-mba91xxca: disable Open Drain for MDIO

Martin Schmiedel (1):
      arm64: dts: imx8mp-tqma8mpql-mba8mp-ras314: Add LVDS device tree overlay

Martyn Welch (1):
      arm64: dts: imx8mp: Add device tree for Nitrogen8M Plus ENC Carrier Board

Max Krummenacher (2):
      arm64: dts: imx8-apalis: Add PCIe and SATA support
      arm64: dts: imx8-colibri: Add PCIe support

Primoz Fiser (16):
      arm64: dts: freescale: imx93-phycore-som: Add PMIC support
      arm64: dts: freescale: imx93-phycore-som: Add EEPROM support
      arm64: dts: freescale: imx93-phycore-som: Disable LED pull-up
      arm64: dts: freescale: imx93-phycore-som: Enhance eMMC pinctrl
      arm64: dts: freescale: imx93-phycore-som: Add eMMC no-1-8-v by default
      arm64: dts: freescale: imx93-phyboard-segin: Drop eMMC no-1-8-v flag
      arm64: dts: freescale: imx93-phyboard-segin: Disable SD-card write-protect
      arm64: dts: freescale: imx93-phyboard-segin: Fix SD-card pinctrl
      arm64: dts: freescale: imx93-phyboard-segin: Set CMD/DATA SION bit to fix ERR052021
      arm64: dts: freescale: imx93-phyboard-segin: Add RTC support
      arm64: dts: freescale: imx93-phyboard-segin: Add CAN support
      arm64: dts: freescale: imx93-phyboard-segin: Add USB support
      arm64: dts: freescale: imx93-phyboard-segin: Add I2S audio
      arm64: dts: freescale: imx93-phyboard-segin: Add EQOS Ethernet
      arm64: dts: freescale: imx93-phyboard-segin: Order node alphabetically
      arm64: dts: freescale: Add PHYTEC phyBOARD-Nash-i.MX93 support

Richard Zhu (1):
      arm64: dts: imx8mq: Add linux,pci-domain into pcie-ep node

Rob Herring (Arm) (1):
      arm64: dts: imx: Drop redundant CPU "clock-latency"

Vitor Soares (1):
      arm64: dts: freescale: add Toradex SMARC iMX8MP

Xu Yang (3):
      arm64: dts: imx95: add USB2.0 nodes
      arm64: dts: imx95-19x19-evk: enable USB2.0 node
      arm64: dts: imx95-15x15-evk: enable USB2.0 node

Yannic Moog (2):
      arm64: dts: add imx8mp-libra-rdk-fpsc board
      arm64: dts: add imx8mp-libra-rdk-fpsc LVDS panel overlay

 MAINTAINERS                                        |    1 +
 arch/arm64/boot/dts/freescale/Makefile             |   40 +-
 .../{imx8mp-evk-pcie-ep.dtso => imx-pcie0-ep.dtso} |    6 +-
 arch/arm64/boot/dts/freescale/imx-pcie1-ep.dtso    |   15 +
 .../arm64/boot/dts/freescale/imx8-apalis-eval.dtsi |   10 +-
 .../boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi |   10 +-
 .../boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi |   10 +-
 .../arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi |   70 +-
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      |   12 +-
 arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi |   25 +-
 .../dts/freescale/imx8dxp-tqma8xdps-mb-smarc-2.dts |   16 +
 .../boot/dts/freescale/imx8dxp-tqma8xdps.dtsi      |   24 +
 .../arm64/boot/dts/freescale/imx8mm-beacon-kit.dts |    1 +
 .../boot/dts/freescale/imx8mm-beacon-som.dtsi      |   18 +-
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |   13 +
 .../freescale/imx8mm-phyboard-polis-peb-av-10.dtso |    2 +
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi  |    2 +-
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |    6 +-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |    4 -
 .../arm64/boot/dts/freescale/imx8mn-beacon-kit.dts |    1 +
 .../boot/dts/freescale/imx8mn-beacon-som.dtsi      |   18 +-
 .../dts/freescale/imx8mn-bsh-smm-s2-common.dtsi    |    2 +-
 arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi  |    2 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |    4 -
 .../boot/dts/freescale/imx8mp-beacon-som.dtsi      |   12 +
 .../arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi |    2 +-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |   22 +-
 .../imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtso  |   44 +
 .../boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts   |  290 ++++
 .../imx8mp-nitrogen-enc-carrier-board.dts          |  452 ++++++
 .../boot/dts/freescale/imx8mp-nitrogen-som.dtsi    |  409 +++++
 .../boot/dts/freescale/imx8mp-phycore-fpsc.dtsi    |  796 ++++++++++
 .../dts/freescale/imx8mp-toradex-smarc-dev.dts     |  304 ++++
 .../boot/dts/freescale/imx8mp-toradex-smarc.dtsi   | 1314 ++++++++++++++++
 .../imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso     |  107 ++
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   |    6 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |   30 +-
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts       |   20 +
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |   40 +-
 arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi   |   10 +-
 arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi  |    6 +-
 .../boot/dts/freescale/imx8qxp-mek-pcie-ep.dtso    |   22 -
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |   45 +-
 arch/arm64/boot/dts/freescale/imx8qxp-ss-hsio.dtsi |    6 +
 .../dts/freescale/imx8qxp-tqma8xqps-mb-smarc-2.dts |   16 +
 .../boot/dts/freescale/imx8qxp-tqma8xqps.dtsi      |   14 +
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi   |   29 +-
 .../boot/dts/freescale/imx93-phyboard-nash.dts     |  317 ++++
 .../boot/dts/freescale/imx93-phyboard-segin.dts    |  243 ++-
 .../boot/dts/freescale/imx93-phycore-som.dtsi      |  165 +-
 .../dts/freescale/imx93-tqma9352-mba91xxca.dts     |  749 ++++++++++
 .../dts/freescale/imx93-tqma9352-mba93xxca.dts     |    8 +-
 .../dts/freescale/imx93-tqma9352-mba93xxla.dts     |    8 +-
 arch/arm64/boot/dts/freescale/imx94-clock.h        |  193 +++
 arch/arm64/boot/dts/freescale/imx94-pinfunc.h      | 1570 ++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx94-power.h        |   41 +
 arch/arm64/boot/dts/freescale/imx94.dtsi           | 1148 ++++++++++++++
 arch/arm64/boot/dts/freescale/imx943-evk.dts       |  195 +++
 arch/arm64/boot/dts/freescale/imx943.dtsi          |  148 ++
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts  |   23 +
 .../boot/dts/freescale/imx95-19x19-evk-sof.dts     |   84 ++
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  |   30 +
 .../dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts  |  324 ++++
 .../arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi |  698 +++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi           |   30 +
 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi    |    5 +
 .../boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi    |  194 +++
 arch/arm64/boot/dts/freescale/tqma8xxs.dtsi        |  768 ++++++++++
 68 files changed, 11066 insertions(+), 183 deletions(-)
 rename arch/arm64/boot/dts/freescale/{imx8mp-evk-pcie-ep.dtso => imx-pcie0-ep.dtso} (64%)
 create mode 100644 arch/arm64/boot/dts/freescale/imx-pcie1-ep.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdps-mb-smarc-2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxp-tqma8xdps.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds-etml1010g3dra.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso
 delete mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqps-mb-smarc-2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-tqma8xqps.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba91xxca.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx94-clock.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx94-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx94-power.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx94.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx943-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx943.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/tqma8xxs.dtsi
