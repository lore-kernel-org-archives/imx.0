Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4449B30DD2A
	for <imx@lists.linux.dev>; Mon, 15 Sep 2025 13:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757942788; cv=none; b=qo6v3Bt53hHHrSu0qPqC/fzkSabU/PrSVh4vWWVQvNYOwoH7Wsl52FE5ZxDbn40Uuc/N6QCHMnZc3ciCHOSu5M8AEx3JEtAMVYtALlz2pY/q1Uniw0Ms8mPj92gVtS5qY6h7MQ1y+RqCxf3m8hxPqfxxFDNnbQEmtYsq4Plw/Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757942788; c=relaxed/simple;
	bh=i5Tl9wSYDt0E/NZ4kFZS+oXAOEIIQUz8+rLp2BTN3jY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OBqJ3YhIXBoCcxK2SY0aQDkvmXKEVJw+/3oVNc4uGLfCC6TCB/O0lVNuEl0jdwvOcmRYPJvtdFQWRWR6tGl+06jNEgyCXDOXwUtCXwAgDnj8DtTz54dRfb/aU660S/yMDQP8hv+jOhx9o1n84Eh+2qCMV1HxGj6yg4MlXLRWxsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=n2O0mjz3; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="n2O0mjz3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=VpkTElD4K4WWCZhb9CaHVX7wcE1A34uojvrFpgjU7QM=;
	b=n2O0mjz3Qeh5jraBUbf9jK8nxqeDwfp5qh1Cw0nnObzk6LqRxFMgTUDj7r8VJ6
	9cU0gzD4XRqsOj1mUoy5Nt7hofpujtuCH2i6bPPRSRbY8y/Q/hle+nTORN7AAJtp
	9E4pOJtdiRvP4KDKC+W1hjWz9NFLHoLBWJz57KwHqJnRI=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDnjyTaE8ho5MiXBA--.47709S4;
	Mon, 15 Sep 2025 21:25:49 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/4] i.MX arm64 device tree changes for 6.18
Date: Mon, 15 Sep 2025 21:25:30 +0800
Message-ID: <20250915132535.253859-3-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915132535.253859-1-shawnguo2@yeah.net>
References: <20250915132535.253859-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Ms8vCgDnjyTaE8ho5MiXBA--.47709S4
X-Coremail-Antispam: 1Uf129KBjvAXoW3uF1ktr1Utw4DJFW7uFWfZrb_yoW8GFWDXo
	W3CF4rAr4j9r47uF4YvryDKw4Yq3WkWr1IqFWUZrWrCw4rXFy3X3srWr4j9rWrJFyUCFyk
	W3W7Kr15Cw45Was7n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUf189UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIR1IrWjIE91CqQAA3c

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-6.18

for you to fetch changes up to dc8662956496d2bfeee95eca3cf57d7b9a8f2ba4:

  arm64: dts: s32g: Add device tree information for the OCOTP driver (2025-09-14 21:12:23 +0800)

----------------------------------------------------------------
i.MX arm64 device tree changes for 6.18:

- New device trees: TQMa91xx/MBa91xxCA, Ultratronik Ultra-MACH SBC,
  SolidRun i.MX8MP SoM, i.MX8ULP EVK9, TQMLS1012AL, i.MX91 11x11 EVK,
  EDM-G-IMX8M-PLUS SOM
- A bunch of Kontron boards update from Annette Kobou and Frieder Schrempf,
  adding overlay for LTE extension board, fixing GPIO for panel regulator,
  removing unused regulators, fixing USB hub reset and USB port etc.
- A number of s32g updates from Dan Carpenter and Daniel Lezcano, adding
  OCOTP, timers and watchdog support
- An i.MX95 update from Frank Li to add msi-map for pci-ep device
- A series from Joy Zou to add i.MX91 support
- A series from Krzysztof Kozlowski to add default GIC address cells for
  LS and i.MX8 SoCs
- A set of changes from Peng Fan to improve i.MX95 support with more devices
  enabled
- A series from Shengjiu Wang to support more sample rates for wm8524 card
  on i.MX8M EVK boards
- Other random updates and cleanups on various boards

----------------------------------------------------------------
Alexander Dahl (1):
      arm64: dts: imx8dxl-ss-conn: Disable USB3 nodes

Alexander Stein (1):
      arm64: dts: freescale: add initial device tree for TQMa91xx/MBa91xxCA

Annette Kobou (3):
      arm64: dts: imx8mm-kontron: Add overlay for LTE extension board
      arm64: dts: imx8mp-kontron: Fix CAN_ADDR0 and CAN_ADDR1 GPIOs
      arm64: dts: imx93-kontron: Fix GPIO for panel regulator

Christoph Stoidner (1):
      arm64: dts: freescale: imx93-phycore-som: Delay the phy reset by a gpio

Dan Carpenter (1):
      arm64: dts: s32g: Add device tree information for the OCOTP driver

Daniel Lezcano (8):
      arm64: dts: s32g2: Add the System Timer Module nodes
      arm64: dts: s32g274-rd2: Enable the STM timers
      arm64: dts: s32g3: Add the System Timer Module nodes
      arm64: dts: s32g399a-rdb3: Enable the STM timers
      arm64: dts: s32g2: Add the Software Timer Watchdog (SWT) nodes
      arm64: dts: s32g274-rd2: Enable the SWT watchdog
      arm64: dts: s32g3: Add the Software Timer Watchdog (SWT) nodes
      arm64: dts: s32g399a-rdb3: Enable the SWT watchdog

Eberhard Stoll (1):
      arm64: dts: imx8mm-kontron: Use GPIO for RS485 transceiver control

Frank Li (1):
      arm64: dts: imx95: Add msi-map for pci-ep device

Frieder Schrempf (7):
      arm64: dts: imx8mm-kontron: Remove unused regulator
      arm64: dts: imx8mm-kontron: Sort reg nodes alphabetically
      arm64: dts: imx8mm-kontron: Name USB regulators according to OSM scheme
      arm64: dts: imx8mp-kontron: Fix GPIO labels for latest BL board
      arm64: dts: imx8mp-kontron: Fix USB hub reset
      arm64: dts: imx93-kontron: Add RTC interrupt signal
      arm64: dts: imx93-kontron: Fix USB port assignment

Geert Uytterhoeven (1):
      arm64: dts: freescale: Switch to hp-det-gpios

Goran Rađenović (2):
      MAINTAINERS: Add i.MX8MP Ultra-MACH SBC to ULTRATRONIK BOARD SUPPORT
      arm64: dts: imx8mp: Add initial support for Ultratronik imx8mp-ultra-mach-sbc board

Jacky Bai (1):
      arm64: dts: freescale: Add dma err irq info on imx94

Jan Remmet (1):
      arm64: dts: imx8mm-phycore-som: optimize drive strengh

Josua Mayer (4):
      arm64: dts: add description for solidrun imx8mp som and cubox-m
      arm64: dts: lx2160a-cex7: add interrupts for rtc and ethernet phy
      arm64: dts: lx2160a-clearfog-itx: enable pcie nodes for x4 and x8 slots
      arm64: dts: add description for solidrun imx8mp hummingboard variants

Joy Zou (6):
      arm64: dts: imx95: Correct the lpuart7 and lpuart8 srcid
      arm64: dts: freescale: move aliases from imx93.dtsi to board dts
      arm64: dts: freescale: rename imx93.dtsi to imx91_93_common.dtsi and modify them
      arm64: dts: imx91: add i.MX91 dtsi support
      arm64: dts: freescale: add i.MX91 11x11 EVK basic support
      arm64: dts: imx93-11x11-evk: remove fec property eee-broken-1000t

Krzysztof Kozlowski (11):
      arm64: dts: freescale: Minor whitespace cleanup
      arm64: dts: fsl-ls1012a: Add default GIC address cells
      arm64: dts: fsl-ls1043a: Add default GIC address cells
      arm64: dts: fsl-ls1046a: Add default GIC address cells
      arm64: dts: imx8dxl: Add default GIC address cells
      arm64: dts: imx8mm: Add default GIC address cells
      arm64: dts: imx8mp: Add default GIC address cells
      arm64: dts: imx8mq: Add default GIC address cells
      arm64: dts: imx8qm: Add default GIC address cells
      arm64: dts: imx8qxp: Add default GIC address cells
      arm64: dts: imx8: Use GIC_SPI for interrupt-map for readability

Laurent Pinchart (1):
      arm64: dts: imx8mp: Add pclk clock and second power domain for the ISP

Laurentiu Mihalcea (1):
      arm64: dts: imx: add dts for the imx8ulp evk9 board

Luke Wang (1):
      arm64: dts: imx95-15x15-evk: Change pinctrl settings for usdhc2

Marco Felsch (1):
      arm64: dts: imx8mp: add interconnect for lcdif-hdmi

Matthias Schiffer (1):
      arm64: dts: ls1012a: add DTS for TQMLS1012al module with MBLS1012AL board

Maud Spierings (1):
      arm64: dts: freescale: imx8mp-moduline-display-106: Use phys to replace xceiver-supply

Oualid Derouiche (1):
      arm64: dts: imx8mm-kontron: Add Sitronix touch controller in DL devicetree

Peng Fan (8):
      arm64: dts: imx95: Add System Counter node
      arm64: dts: imx95: Add LMM/CPU nodes
      arm64: dts: imx95: Add more V2X MUs
      arm64: dts: imx95: Add OCOTP node
      arm64: dts: imx95: Add coresight nodes
      arm64: dts: imx95-evk: Update alias
      arm64: dts: imx95-19x19-evk: Add pca9632 node
      arm64: dts: imx95-19x19-evk: Add pf09 and pf53 thermal zones

Primoz Fiser (3):
      arm64: dts: freescale: imx93-phyboard-nash: Add current sense amplifier
      arm64: dts: freescale: imx93-phyboard-nash: Current sense via iio-hwmon
      arm64: dts: freescale: imx93-phycore-som: Remove "fsl,magic-packet"

Richard Hu (1):
      arm64: dts: imx8mp: Add TechNexion EDM-G-IMX8M-PLUS SOM on WB-EDM-G carrier board

Richard Zhu (1):
      arm64: dts: imx95-19x19-evk: Add Tsettle delay in m2 regulator

Shengjiu Wang (3):
      arm64: dts: imx8mm-evk: support more sample rates for wm8524 card
      arm64: dts: imx8mq-evk: support more sample rates for wm8524 card
      arm64: dts: imx8mn-evk: support more sample rates for wm8524 card

Wei Fang (1):
      arm64: dts: imx95: add standard PCI device compatible string to NETC Timer

Xu Yang (1):
      arm64: dts: imx95: add fsl,phy-tx-vref-tune-percent tuning properties for USB3 PHY

 MAINTAINERS                                        |    1 +
 arch/arm64/boot/dts/freescale/Makefile             |   14 +
 .../fsl-ls1012a-tqmls1012al-mbls1012al-emmc.dts    |   23 +
 .../fsl-ls1012a-tqmls1012al-mbls1012al.dts         |  366 +++++
 .../dts/freescale/fsl-ls1012a-tqmls1012al.dtsi     |   81 ++
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi     |    1 +
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |    1 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |    1 +
 .../arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi |    2 +
 .../dts/freescale/fsl-lx2160a-clearfog-itx.dtsi    |    8 +
 .../arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi |    2 +-
 arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi    |    8 +-
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      |    2 +-
 arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi |    2 +
 arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi |    8 +-
 arch/arm64/boot/dts/freescale/imx8dxl.dtsi         |    1 +
 .../boot/dts/freescale/imx8mm-emtop-baseboard.dts  |    2 +-
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |   17 +-
 .../boot/dts/freescale/imx8mm-kontron-bl-lte.dtso  |  186 +++
 .../boot/dts/freescale/imx8mm-kontron-bl-osm-s.dts |    8 -
 .../arm64/boot/dts/freescale/imx8mm-kontron-bl.dts |   12 +-
 .../boot/dts/freescale/imx8mm-kontron-dl.dtso      |   13 +-
 .../boot/dts/freescale/imx8mm-kontron-osm-s.dtsi   |   50 +-
 .../freescale/imx8mm-phyboard-polis-peb-av-10.dtso |    2 +-
 .../boot/dts/freescale/imx8mm-phycore-som.dtsi     |    8 +-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |    1 +
 arch/arm64/boot/dts/freescale/imx8mn-evk.dtsi      |    5 +
 .../freescale/imx8mp-aristainetos3-proton2s.dts    |    2 +-
 .../freescale/imx8mp-aristainetos3a-som-v1.dtsi    |    6 +-
 arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts   |  223 +++
 arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts  |  359 +++++
 arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi    |  786 +++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |    2 +-
 .../dts/freescale/imx8mp-hummingboard-mate.dts     |   31 +
 .../boot/dts/freescale/imx8mp-hummingboard-pro.dts |   76 ++
 .../freescale/imx8mp-hummingboard-pulse-codec.dtsi |   59 +
 .../imx8mp-hummingboard-pulse-common.dtsi          |  384 ++++++
 .../freescale/imx8mp-hummingboard-pulse-hdmi.dtsi  |   44 +
 .../freescale/imx8mp-hummingboard-pulse-m2con.dtsi |   60 +
 .../imx8mp-hummingboard-pulse-mini-hdmi.dtsi       |   81 ++
 .../dts/freescale/imx8mp-hummingboard-pulse.dts    |   83 ++
 .../dts/freescale/imx8mp-hummingboard-ripple.dts   |   31 +
 .../boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts |   59 +-
 .../boot/dts/freescale/imx8mp-skov-revb-lt6.dts    |    2 +-
 arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi   |  591 ++++++++
 .../imx8mp-tx8p-ml81-moduline-display-106.dts      |   46 +-
 .../boot/dts/freescale/imx8mp-ultra-mach-sbc.dts   |  907 +++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |   23 +-
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts       |    8 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |    1 +
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |    4 +-
 arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi  |   16 +-
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |    1 +
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |    2 +-
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |    1 +
 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts  |   69 +
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi   |    4 +-
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts  |  674 ++++++++++
 arch/arm64/boot/dts/freescale/imx91-pinfunc.h      |  770 +++++++++++
 .../dts/freescale/imx91-tqma9131-mba91xxca.dts     |  739 ++++++++++
 arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi  |  295 ++++
 arch/arm64/boot/dts/freescale/imx91.dtsi           |   71 +
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi | 1187 ++++++++++++++++
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts  |   20 +-
 arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts  |   19 +-
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    |   18 +
 .../boot/dts/freescale/imx93-kontron-bl-osm-s.dts  |   53 +-
 .../boot/dts/freescale/imx93-kontron-osm-s.dtsi    |    9 +
 .../boot/dts/freescale/imx93-phyboard-nash.dts     |   35 +
 .../boot/dts/freescale/imx93-phyboard-segin.dts    |    9 +
 .../boot/dts/freescale/imx93-phycore-som.dtsi      |   12 +-
 .../dts/freescale/imx93-tqma9352-mba91xxca.dts     |   11 +
 .../dts/freescale/imx93-tqma9352-mba93xxca.dts     |   25 +
 .../dts/freescale/imx93-tqma9352-mba93xxla.dts     |   25 +
 .../boot/dts/freescale/imx93-var-som-symphony.dts  |   17 +
 arch/arm64/boot/dts/freescale/imx93.dtsi           | 1416 ++------------------
 arch/arm64/boot/dts/freescale/imx94.dtsi           |    6 +-
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts  |   30 +-
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  |   99 +-
 arch/arm64/boot/dts/freescale/imx95.dtsi           |  207 ++-
 arch/arm64/boot/dts/freescale/s32g2.dtsi           |  126 ++
 arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts    |   20 +
 arch/arm64/boot/dts/freescale/s32g3.dtsi           |  202 +++
 arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts    |   36 +
 84 files changed, 9432 insertions(+), 1485 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al-emmc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al-mbls1012al.dts
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-ls1012a-tqmls1012al.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-kontron-bl-lte.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-edm-g.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-mate.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pro.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-codec.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-hdmi.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-m2con.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-ripple.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-sr-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-tqma9131-mba91xxca.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx91.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi

