Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22922D6620
	for <imx@lists.linux.dev>; Mon, 17 Nov 2025 12:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763382900; cv=none; b=M8LgBgUDWYPC/Ep2bdWLVZRlAFY9CLY+nR9RIicUbMu6m8x8AB2clh2KxQ6s0aLNLys+B+yxGgJ4KMWrdq6mFSZtbvsT+fnuySJ05Hesu/ILrXbl7Dll84rDP5U2pXoWocEHUJq/ML9WfBTfZrR+u868qg6Dw9T+7PCFBC6+670=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763382900; c=relaxed/simple;
	bh=Hs0+pzdIsc2CTUurCKC/uNj9G92cRh/a1R6B1Gj4jkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nbqeCbCXDcwVrm4Ryz66ed41flnnRJ8C34sYDtpa5sddlmuWLbvDikE0ciSu3sfJNsklNDP3JvkuUv0Fh+mKRTeOlrhPgWLZPOG6Z4lgizvn30kkbsPIvpRol4e1f+5DfoDn4q8xFTYMEK5EMkl1k0Mi/F0sGLOEx4YxXA2ohR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Gt9cEIXX; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Gt9cEIXX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=bh8dLTPRq5GmDDingsp0mLUaVtDUMMMNXv+e5vlVPjo=;
	b=Gt9cEIXXn7Pb62rJ0Z9X9wNNClC+ER90m2uhnCpyS7ldKPL0EUhaiohfxqPKpK
	9VN6XeZ18AGJyWktlHF1wQOXhlVH5atKJQRcuzrHq48StKm5tEdW34e3kOrPeVND
	009OgP0088iLkwPktNLXipogI6fzUUWka5ANETsllPUxg=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAnXIhOFhtpoZUoAg--.8347S5;
	Mon, 17 Nov 2025 20:34:26 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/5] i.MX arm64 device tree changes for 6.19
Date: Mon, 17 Nov 2025 20:33:50 +0800
Message-ID: <20251117123358.2009662-4-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117123358.2009662-1-shawnguo2@yeah.net>
References: <20251117123358.2009662-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgAnXIhOFhtpoZUoAg--.8347S5
X-Coremail-Antispam: 1Uf129KBjvAXoW3Aw45Wr48Jw4rZw43WFyUKFg_yoW8Aw47Go
	WfAFWrA3y0kr4UGF4avryqkw1Fq3WkWr1IqFWUXFWrKw45XF13Z3srZF4Y9rWrJa4UCFyk
	W3W7Gr1YyF47Wryxn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU2oGQDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNhK6IGkbFlIfHAAA3L

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-6.19

for you to fetch changes up to 90bbe88e0ea61bf3ab2376b0497bacf42b66e4a9:

  arm64: dts: freescale: add Toradex SMARC iMX95 (2025-11-17 16:39:27 +0800)

----------------------------------------------------------------
i.MX arm64 device tree changes for 6.19:

- New board support: Protonic PRT8ML, Toradex SMARC iMX95, Skov Rev.C
  HDMI, i.MX 95 Verdin Evaluation KitPHYTEC phyBOARD-Segin-i.MX91 board,
  Skov i.MX8MP variant
- A series from Alexander Stein to clean up and improve imx95-tqma9596sa
  board support
- Add MicIn routing support for mba8mx boards
- A couple of patch sets from Frank Li to clean up dt-schema warnings
  and add more device support for imx8dxl and imx8qxp boards
- A series from Ioana Ciornei to add FPGA based GPIO controller and SFP+
  cages for layerscape boards
- A change from Jan Petrous to add GMAC Ethernet for S32G2 EVB, RDB2 and
  S32G3 RDB3 boards
- A series from Markus Niebel to improve imx95-tqma9596sa board support
- A couple of changes from Martin Kepplinger-Novaković to enable cpuidle
  cooling device support for imx8mp
- A series from Max Krummenacher to clean up todo and add thermal
  support for imx8-apalis board
- A series from Primoz Fiser to add USB vbus regulators, jtag and
  pwm-fan overlay for imx93-phyboard
- A couple of series from Richard Zhu to add supports-clkreq property
  and vpcie3v3aux regulator for PCIe M.2 device
- A series from Stefano Radaelli to add WiFi, BT, PMIC, WM8904 audio,
  and ADS7846 touchscreen support for imx93-var-som
- A series from Tim Harvey to make some cleanups for imx8mm-venice
  boards
- A change from Xu Yang to add DDR Perf Monitor support for i.MX94
- Other small and random changes

----------------------------------------------------------------
Alexander Stein (19):
      arm64: dts: tqma8mpql-mba8mpxl: Add MicIn routing
      arm64: dts: imx95-tqma9596sa: reduce maximum FlexSPI frequency to 66MHz
      arm64: dts: imx95-tqma9596sa: increase flexspi slew rate
      arm64: dts: imx95-tqma9596sa: move flexcan pinctrl to SOM
      arm64: dts: imx95-tqma9596sa: move lpspi3 pinctrl to SOM
      arm64: dts: imx95-tqma9596sa: move sai config to SOM
      arm64: dts: imx95-tqma9596sa: move pcie config to SOM
      arm64: dts: imx95-tqma9596sa: update pcie config
      arm64: dts: imx95-tqma9596sa: remove superfluous pinmux for flexspi
      arm64: dts: imx95-tqma9596sa: remove superfluous pinmux for i2c
      arm64: dts: imx95-tqma9596sa: remove superfluous pinmux for usdhci
      arm64: dts: imx95-tqma9596sa: add gpio bus recovery for i2c
      arm64: dts: imx95-tqma9596sa: whitespace fixes
      arm64: dts: imx95-tqma9596sa-mb-smarc-2: Add MicIn routing
      arm64: dts: imx95-tqma9596sa-mb-smarc-2: mark LPUART1 as reserved
      arm64: dts: mba8mx: Add MicIn routing
      arm64: dts: mba8xx: Add MicIn routing
      arm64: dts: mb-smarc-2: Add MicIn routing
      arm64: dts: freescale: tqma9352: Add vcc-supply for spi-nor

Frank Li (23):
      arm64: dts: fsl-lx2160a: include rev2 chip's dts
      arm64: dts: layerscape: add dma-coherent for usb node
      arm64: dts: imx8dxl-evk: add bt information for lpuart1
      arm64: dts: imx8dxl-evk: add state_100mhz and state_200mhz for usdhc
      arm64: dts: imx8-ss-conn: add fsl,tuning-step for usdhc1 and usdhc2
      arm64: dts: imx8-ss-conn: add missed clock enet_2x_txclk for fec[1,2]
      arm64: dts: imx8dxl-ss-conn: delete usb3_lpcg node
      arm64: dts: imx8: add vdd-supply and vddio-supply for fsl,mpl3115
      arm64: dts: imx8qm-mek: add state_100mhz and state_200mhz for usdhc
      arm64: dts: imx8qm-mek: assign double SD bus frequency for usdhc1
      arm64: dts: imx8qm-mek: add lpuart1 and bluetooth node
      arm64: dts: imx8qm: add label thermal_zones
      arm64: dts: imx8qm-mek: add pmic thermal-zones
      arm64: dts: imx8qm-mek: add usbotg1 and related nodes
      arm64: dts: imx8qm-mek: replace space with tab
      arm64: dts: imx8qxp: add MAC address in ocotp
      arm64: dts: imx8qxp: add wakeup source for power-key
      arm64: dts: imx8qxp-mek: add state_100mhz and state_200mhz for usdhc
      arm64: dts: imx8qxp-mek: update usdhc1 clock to 400Mhz
      arm64: dts: imx8qxp-mek: add flexspi and flash
      arm64: dts: imx8qxp-mek: add phandle ocotp mac-address for fec
      arm64: dts: imx8qxp-mek: add fec2 support
      arm64: dts: imx8qxp-mek: change space with tab

Haibo Chen (1):
      arm64: dts: imx: correct the flexspi compatible string to match with yaml

Ioana Ciornei (4):
      arm64: dts: lx2160a-rdb: describe the QIXIS FPGA and two child GPIO controllers
      arm64: dts: ls1046a-qds: describe the FPGA based GPIO controller
      arm64: dts: lx2160a-rdb: fully describe the two SFP+ cages
      arm64: dts: ls1046a-qds: describe the two on-board SFP+ cages

Jan Petrous (OSS) (1):
      arm64: dts: freescale: Add GMAC Ethernet for S32G2 EVB and RDB2 and S32G3 RDB3

Jan Remmet (5):
      arm64: dts: imx8mm-phyboard-polis: Use GPL-2.0-or-later OR MIT
      arm64: dts: imx8mm-phyboard-polis: move mipi bridge to som
      arm64: dts: imx8mm-phyboard-polis-peb-av-10: reorder properties to match dts coding style
      arm64: dts: imx8mm-phyboard-polis-peb-av-10: split display configuration
      arm64: dts: imx8mm-phyboard-polis-peb-av-10-ph128800t006

Jonas Rebmann (1):
      arm64: dts: add Protonic PRT8ML board

Joy Zou (2):
      arm64: dts: imx95-15x15-evk: add fan-supply property for pwm-fan
      arm64: dts: imx8: add edma error interrupt support

Kieran Bingham (1):
      arm64: dts: freescale: debix-som-a-bmb-08: Enable HDMI output

Laurent Pinchart (2):
      arm64: dts: imx8mp: Specify the number of channels for CSI-2 receivers
      arm64: dts: imx8mp-debix-model-a: Fix ethernet PHY address

Laurentiu Mihalcea (2):
      arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
      arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'

Marco Felsch (1):
      arm64: dts: imx8mp-skov: add Rev.C HDMI support

Marek Vasut (2):
      arm64: dts: freescale: add initial support for i.MX 95 Verdin Evaluation Kit (EVK)
      arm64: dts: imx8mp: Add missing LED enumerators for DH electronics i.MX8M Plus DHCOM on PDK2

Markus Niebel (5):
      arm64: dts: imx95-tqma9596sa: fix TPM5 pinctrl node name
      arm64: dts: imx95-tqma9596sa: move USDHC2 config to SOM
      arm64: dts: imx95-tqma9596sa: add EEPROM pagesize
      arm64: dts: imx95-tqma9596sa-mb-smarc-2: remove superfluous line
      arm64: dts: imx95-tqma9596sa-mb-smarc-2: add aliases for SPI

Martin Kepplinger-Novaković (2):
      arm64: dts: imx8mp: add idle cooling devices to cpu core
      arm64: dts: imx8mp: add cpuidle cooling device to the alert trip point

Mathew McBride (1):
      arm64: dts: ten64: add board controller binding

Max Krummenacher (5):
      arm64: dts: imx8-apalis: cleanup todo
      arm64: dts: imx8-apalis: add thermal nodes
      arm64: dts: imx8-apalis: specify adc reference voltage regulator
      arm64: dts: imx8qm-apalis: add pwm used by the backlight
      arm64: dts: freescale: add Toradex SMARC iMX95

Primoz Fiser (5):
      arm64: dts: freescale: imx93-phyboard-nash: Add USB vbus regulators
      arm64: dts: freescale: imx93-phyboard-segin: Add USB vbus regulators
      arm64: dts: freescale: Add phyBOARD-Segin-i.MX91 support
      arm64: dts: freescale: imx93-phyboard-nash: Add jtag overlay
      arm64: dts: freescale: imx93-phyboard-nash: Add pwm-fan overlay

Richard Zhu (14):
      arm64: dts: imx95-15x15-evk: Add supports-clkreq property to PCIe M.2 port
      arm64: dts: imx95-19x19-evk: Add supports-clkreq property to PCIe M.2 port
      arm64: dts: imx8mm-evk: Add supports-clkreq property to PCIe M.2 port
      arm64: dts: imx8mp-evk: Add supports-clkreq property to PCIe M.2 port
      arm64: dts: imx8mq-evk: Add supports-clkreq property to PCIe M.2 port
      arm64: dts: imx8qm-mek: Add supports-clkreq property to PCIe M.2 port
      arm64: dts: imx8qxp-mek: Add supports-clkreq property to PCIe M.2 port
      arm64: dts: imx8dxl-evk: Add vpcie3v3aux regulator for PCIe M.2 connector
      arm64: dts: imx8mp-evk: Add vpcie3v3aux regulator for PCIe M.2 connector
      arm64: dts: imx8mq-evk: Add vpcie3v3aux regulator for PCIe M.2 connector
      arm64: dts: imx8qm-mek: Add vpcie3v3aux regulator for PCIe M.2 connector
      arm64: dts: imx8qxp-mek: Add vpcie3v3aux regulator for PCIe M.2 connector
      arm64: dts: imx95-15x15-evk: Add vpcie3v3aux regulator for PCIe M.2 connector
      arm64: dts: imx95-19x19-evk: Add vpcie3v3aux regulator for PCIe[0,1]

Shengjiu Wang (2):
      arm64: dts: imx8mp: Add hdmi parallel audio interface node
      arm64: dts: imx8mp-evk: enable hdmi_pai device

Shenwei Wang (1):
      arm64: dts: imx8: add default clock rate for usdhc

Sherry Sun (1):
      arm64: dts: imx8qxp-mek: Add lpuart1 to support the M.2 PCIE9098 bluetooth

Stefan Eichenberger (2):
      arm64: dts: imx8-apalis: rename wifi regulator
      arm64: dts: imx8-apalis: use startup-delay-us for wifi regulator

Stefano Radaelli (4):
      arm64: dts: freescale: imx93-var-som: Add WiFi and Bluetooth support
      arm64: dts: freescale: imx93-var-som: Add PMIC support
      arm64: dts: freescale: imx93-var-som: Add support for WM8904 audio codec
      arm64: dts: freescale: imx93-var-som: Add support for ADS7846 touchscreen

Steffen Trumtrar (1):
      arm64: dts: imx8mp-skov: support new 10" panel board

Teresa Remmet (3):
      arm64: dts: imx8mm-phyboard-polis-rdk: Add USB1 OC pin configuration
      arm64: dts: imx8mm-phygate-tauri-l: Update pad ctl for USB OC pin
      arm64: dts: imx8mm-phyboard-polis-peb-av-10: Fix audio codec reset pin ctl

Tim Harvey (7):
      arm64: dts: freescale: imx8mp-venice-gw7905-2x: remove duplicate usdhc1 props
      arm64: dts: imx8m{m,n,p}-venice: disable unused clk output for TI PHY
      arm64: dts: imx8mp-venice-gw702x: reduce RGMII CLK drive strength
      arm64: dts: imx8mm-venice-gw700x: reduce RGMII CLK drive strength
      arm64: dts: imx8mm-venice-gw72xx: remove unused sdhc1 pinctrl
      arm64: dts: imx8mp-venice-gw702x: remove off-board uart
      arm64: dts: imx8mp-venice-gw702x: remove off-board sdhc1

Xu Yang (1):
      arm64: dts: imx94: add DDR Perf Monitor node

Yannic Moog (4):
      arm64: dts: im8mp-phy{board,core}: update license
      arm64: dts: imx8mp pollux: add display overlays
      arm64: dts: imx8mp pollux: add expansion board overlay
      arm64: dts: imx8mp pollux: add displays for expansion board

 arch/arm64/boot/dts/freescale/Makefile             |   32 +
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi     |    3 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |    8 +-
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |    9 +-
 arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts  |   52 +
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |    9 +-
 .../arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts |    4 +
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |    8 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dts  |    2 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts  |   80 +-
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |    8 +-
 arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dts  |    2 +-
 .../arm64/boot/dts/freescale/imx8-apalis-eval.dtsi |    5 +-
 .../boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi |    5 +-
 .../boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi |    5 +-
 .../arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi |   51 +-
 arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi   |    6 +-
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi    |   20 +-
 arch/arm64/boot/dts/freescale/imx8-ss-dma.dtsi     |    6 +-
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      |   14 +-
 arch/arm64/boot/dts/freescale/imx8dxl-ss-adma.dtsi |    9 +-
 arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi |    1 +
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |    1 +
 ...8mm-phyboard-polis-peb-av-10-etml1010g3dra.dtso |   44 +
 ...x8mm-phyboard-polis-peb-av-10-ph128800t006.dtso |   44 +
 .../freescale/imx8mm-phyboard-polis-peb-av-10.dtsi |  189 ++++
 .../freescale/imx8mm-phyboard-polis-peb-av-10.dtso |  234 +---
 .../imx8mm-phyboard-polis-peb-eval-01.dtso         |    3 +-
 .../dts/freescale/imx8mm-phyboard-polis-rdk.dts    |   11 +-
 .../boot/dts/freescale/imx8mm-phycore-som.dtsi     |   28 +-
 .../boot/dts/freescale/imx8mm-phygate-tauri-l.dts  |    2 +-
 .../boot/dts/freescale/imx8mm-venice-gw700x.dtsi   |    3 +-
 .../boot/dts/freescale/imx8mm-venice-gw72xx.dtsi   |   11 -
 .../boot/dts/freescale/imx8mm-venice-gw7902.dts    |    1 +
 .../boot/dts/freescale/imx8mn-venice-gw7902.dts    |    1 +
 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h      |   33 +
 .../boot/dts/freescale/imx8mp-debix-model-a.dts    |    4 +-
 .../dts/freescale/imx8mp-debix-som-a-bmb-08.dts    |   47 +
 .../arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts |    4 +
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |    6 +
 .../imx8mp-phyboard-pollux-etml1010g3dra.dtso      |   44 +
 ...mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtso |   45 +
 ...8mp-phyboard-pollux-peb-av-10-ph128800t006.dtso |   45 +
 .../imx8mp-phyboard-pollux-peb-av-10.dtsi          |  198 ++++
 .../imx8mp-phyboard-pollux-peb-av-10.dtso          |    9 +
 .../imx8mp-phyboard-pollux-ph128800t006.dtso       |   45 +
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   |   52 +-
 .../boot/dts/freescale/imx8mp-phycore-som.dtsi     |    3 +-
 arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dts    |  504 +++++++++
 .../boot/dts/freescale/imx8mp-skov-revc-hdmi.dts   |    8 +
 .../imx8mp-skov-revc-jutouch-jt101tm023.dts        |   79 ++
 .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts    |    7 +
 .../boot/dts/freescale/imx8mp-venice-gw702x.dtsi   |   54 +-
 .../boot/dts/freescale/imx8mp-venice-gw72xx.dtsi   |   11 -
 .../boot/dts/freescale/imx8mp-venice-gw74xx.dts    |    1 +
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |   81 +-
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts       |    3 +
 .../boot/dts/freescale/imx8qm-apalis-v1.1.dtsi     |   10 +-
 arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi   |    2 -
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |  156 ++-
 arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi |    6 +-
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi   |    3 +-
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |    2 +-
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |  176 ++-
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |    9 +
 .../boot/dts/freescale/imx91-phyboard-segin.dts    |  345 ++++++
 .../boot/dts/freescale/imx91-phycore-som.dtsi      |  304 ++++++
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi |    2 +-
 .../dts/freescale/imx93-phyboard-nash-jtag.dtso    |   31 +
 .../dts/freescale/imx93-phyboard-nash-pwm-fan.dtso |   75 ++
 .../boot/dts/freescale/imx93-phyboard-nash.dts     |   24 +
 .../boot/dts/freescale/imx93-phyboard-segin.dts    |   24 +
 arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi  |    1 +
 arch/arm64/boot/dts/freescale/imx93-var-som.dtsi   |  332 +++++-
 arch/arm64/boot/dts/freescale/imx94.dtsi           |    6 +
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts  |    3 +
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  |    3 +
 .../boot/dts/freescale/imx95-19x19-verdin-evk.dts  |  695 ++++++++++++
 .../boot/dts/freescale/imx95-toradex-smarc-dev.dts |  277 +++++
 .../boot/dts/freescale/imx95-toradex-smarc.dtsi    | 1155 ++++++++++++++++++++
 .../dts/freescale/imx95-tqma9596sa-mb-smarc-2.dts  |   75 +-
 .../arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi |  153 ++-
 arch/arm64/boot/dts/freescale/imx95.dtsi           |    2 +-
 arch/arm64/boot/dts/freescale/mba8mx.dtsi          |    7 +
 arch/arm64/boot/dts/freescale/mba8xx.dtsi          |    7 +
 arch/arm64/boot/dts/freescale/s32g2.dtsi           |   58 +-
 arch/arm64/boot/dts/freescale/s32g274a-evb.dts     |   18 +-
 arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts    |   16 +
 arch/arm64/boot/dts/freescale/s32g3.dtsi           |   58 +-
 arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts    |   18 +-
 .../boot/dts/freescale/tqma8xxs-mb-smarc-2.dtsi    |    7 +
 91 files changed, 5687 insertions(+), 567 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10-etml1010g3dra.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10-ph128800t006.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-etml1010g3dra.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-etml1010g3dra.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10-ph128800t006.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-ph128800t006.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-skov-revc-hdmi.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-nash-jtag.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-nash-pwm-fan.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-verdin-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi

