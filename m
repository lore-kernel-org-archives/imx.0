Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD0D187FEC
	for <imx@lists.linux.dev>; Mon,  4 Nov 2024 09:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730710883; cv=none; b=ieVWwkQKrZByEiphJsrTwuwIT8F57NOn1q43u/bWQPNI4Hii9Vvu4oQ5CFqr5iTalPEWj+uycECZJYSdLpuLCqGG8ExIEV/NdUcyEbDAuROIsDpBknnVzg5kuUsANtp2yQo+GugNGxbLFj6xMhdJjb80J0S60/avykeqfpUF4wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730710883; c=relaxed/simple;
	bh=YlzxHH3quOM/jWnkxwHoDKV0Vvo+Cyyh8Z/NBtf2iow=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GNDwigUELlMgDosaDWKssz4oiu1LhPWoDzI3d3LJ916iV3RkH7SeWKfZfoH+CacGJc9UlwXHNVwJ2c5/AVMIjOdkJILkzL1TByT9R8YuqlxLgzJZ8ZJm5tBgRDAgR+SJNCxhHIhbK7qS0+5CPA92TOmSdqI+EVrRYfV50IZO57o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=IC6kOTqI; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="IC6kOTqI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=7UmuBcdk5cIY2tsHQxmcSljuJ52NMklC3QaKpbo2KDg=;
	b=IC6kOTqI1iE9uV4hx5RhU/F5XAZzlY+uxq1QzNxPhfe548qTh7XDnVzNM27mBz
	CEjmabjmfUgiUI+tIA/pD64Zk0lrNEBdqaa9ve5hDEYddlXxZut8hql2PDpuQjSh
	pL8GiryBHMa3dmj/EFwoBu0R61zuQzuYJbjg8frhIAb/Q=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBXD75LjShnSBmkAQ--.16437S6;
	Mon, 04 Nov 2024 17:01:02 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/6] i.MX arm64 device tree changes for 6.13
Date: Mon,  4 Nov 2024 17:00:54 +0800
Message-Id: <20241104090055.1881860-5-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104090055.1881860-1-shawnguo2@yeah.net>
References: <20241104090055.1881860-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgBXD75LjShnSBmkAQ--.16437S6
X-Coremail-Antispam: 1Uf129KBjvAXoWfJFyrJry8WFyktFWkAw4rGrg_yoW8Wr43Ko
	WfCFWrArWjkr47WF4Yv34jkw1Yq3WkWr1xXFWUZr4rGw4rZFyav3sruF4j9rWrJryDuFyk
	W3W7Kr1Ykay5Xr97n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4puAUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgGNZWcocJloiQAAss

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-6.13

for you to fetch changes up to 6c5789c9d2c06968532243daa235f6ff809ad71e:

  arm64: dts: freescale: imx8mp-verdin: Fix SD regulator startup delay (2024-11-04 16:46:33 +0800)

----------------------------------------------------------------
i.MX arm64 device tree changes for 6.13:

- New device support: Boundary Device Nitrogen8MP, Kontron OSM-S i.MX8MP
  SoM and BL carrier board, Verdin Ivy carrier board, DHCOM SoM on DRC02
  and PicoITX, Gateworks GW82XX-2X, etc.
- A series from Carlos Song to add LPSPI alias for i.MX8 and i.MX9 SoCs
- A couple of changes from Ciprian Marian Costea to improve S32G uSDHC
  and SD/eMMC support
- A couple of changes from Francesco Dolcini to improve SD regulator
  startup delay for Verdin devices
- A bunch of changes from Frank Li to add I3C overlay for imx93-9x9-qsb,
  enable PCIe and SATA for imx8qm-mek, add various devices for imx8qxp-mek,
  fix dt-schema warnings, etc.
- A series from João Paulo Gonçalves to improve i.MX8 Apalis and i.MX8M
  Verdin board support
- A set of changes from Laurentiu Mihalcea to enable dsp node for rproc
  usage in audio subsystem
- A set of changes from Peng Fan to improve i.MX95 support, adding SCMI,
  thermal zone, cooling device, idle states, etc.
- A series from Richard Zhu to add PCIe and SATA support for imx8dxl-evk
- A series from Shengjiu Wang to enable audio features on imx93-9x9-qsb
  and imx8ulp-evk board
- Other small and random changes

----------------------------------------------------------------
Alexander Stein (1):
      arm64: dts: imx95: Add missing vendor string to SCMI property

Andrejs Cainikovs (2):
      arm64: dts: imx8qm: Remove adma pwm
      arm64: dts: imx8-apalis: Set thermal thresholds

Benjamin Hahn (1):
      arm64: dts: imx8mp-phyboard-pollux-rdk: update gpio-line-names

Bhavin Sharma (1):
      arm64: dts: imx8mp: Add Boundary Device Nitrogen8MP Universal SMARC Carrier Board

Carlos Song (6):
      arm64: dts: imx93-11x11-evk: remove redundant "sleep" pinctrl in lpi2c2 node
      arm64: dts: imx8qxp: Add LPSPI alias
      arm64: dts: imx8qm: Add LPSPI alias
      arm64: dts: imx8dxl: Add LPSPI alias
      arm64: dts: imx8ulp: Add LPSPI alias
      arm64: dts: imx93: Add LPSPI alias

Catalin Popescu (1):
      arm64: dts: imx8mp: add cpuidle state "cpu-pd-wait"

Chancel Liu (1):
      arm64: dts: imx93-11x11-evk: Enable sound-wm8962 sound card

Ciprian Marian Costea (2):
      arm64: dts: s32g: Add S32G2/S32G3 uSDHC pinmux
      arm64: dts: s32g2: Disable support for SD/eMMC UHS mode

Emanuele Ghidoli (1):
      arm64: dts: colibri-imx8x: Add ad7879_ts label to touchscreen controller

Francesco Dolcini (2):
      arm64: dts: freescale: imx8mm-verdin: Fix SD regulator startup delay
      arm64: dts: freescale: imx8mp-verdin: Fix SD regulator startup delay

Frank Li (22):
      arm64: dts: imx93-11x11-evk: add io-expander adi,adp5585-01
      arm64: dts: imx93-9x9-qsb: add I3C overlay file
      arm64: dts: fsl-lx2160a: add rev2 support
      arm64: dts: imx8mp-evk: add PCIe Endpoint function overlay file
      arm64: dts: layerscape: remove cooling-max-state and cooling-min-state
      arm64: dts: imx8qxp-mek: Add PCIe support
      arm64: dts: imx8qm-mek: Add PCIe and SATA
      arm64: dts: imx8qxp-mek: add bluetooth audio codec
      arm64: dts: imx8qxp-mek: add esai, cs42888 and related node
      arm64: dts: imx8qxp-mek: enable jpeg encode and decode
      arm64: dts: imx8qxp-mek: add flexcan1 and flexcan2
      arm64: dts: imx8qxp-mek: add usbotg1 and related node
      arm64: dts: imx8qxp-mek: add cm4 and related nodes
      arm64: dts: imx8mm-venice-gw73xx: remove compatible in overlay file
      arm64: dts: mba8mx: remove undocumented 'data-lanes' at panel
      arm64: dts: imx8: move samsung,burst-clock-frequency to imx8mn and imx8mm mba8mx board file
      arm64: dts: imx8mp-kontron-dl: change touchscreen power-supply to AVDD28-supply
      arm64: dts: layerscape: remove en25s64 and only keep jedec,spi-nor compatible string
      arm64: dts: imx8mn-tqma8mqnl-mba8mx-usbot: fix coexistence of output-low and output-high in GPIO
      arm64: dts: imx8qxp-mek: replace hardcode 0 with IMX_LPCG_CLK_0
      arm64: dts: imx8qm-ss-hsio: fix interrupt-map indent under pci* nodes
      arm64: dts: imx8qm-ss-hsio: fix PCI and SATA clock indices

Frieder Schrempf (4):
      arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board
      arm64: dts: Add support for Kontron i.MX8MP SMARC module and eval carrier
      arm64: dts: imx8mm-kontron: Add support for display bridges on BL i.MX8MM
      arm64: dts: imx8mm-kontron: Add DL (Display-Line) overlay with LVDS support

Gilles Talis (1):
      arm64: dts: imx8mp-navqp: Add HDMI support

Haibo Chen (1):
      arm64: dts: imx93-11x11-evk: add flexcan support

Hiago De Franco (1):
      arm64: dts: imx8-apalis: Add nau8822 audio-codec to apalis eval v1.2

João Paulo Gonçalves (6):
      arm64: dts: imx8-apalis: Add audio support
      arm64: dts: imx8-apalis: Add usb4 host support
      arm64: dts: freescale: imx8mm-verdin: add label to som adc node
      arm64: dts: freescale: imx8mm-verdin: Add Ivy carrier board
      arm64: dts: freescale: imx8mp-verdin: add labels to som nodes
      arm64: dts: freescale: imx8mp-verdin: Add Ivy carrier board

Krzysztof Kozlowski (1):
      arm64: dts: freescale: minor whitespace cleanup

Laurentiu Mihalcea (5):
      arm64: dts: imx8-ss-audio: configure dsp node for rproc usage
      arm64: dts: imx8qxp-mek: add dsp rproc-related mem regions
      arm64: dts: imx8qm: drop dsp node from audio_subsys bus
      arm64: dts: imx8qm: add node for VPU dsp
      arm64: dts: imx8qm-mek: enable dsp node for rproc usage

Marek Vasut (2):
      arm64: dts: imx8mp: Add DH i.MX8MP DHCOM SoM on DRC02 carrier board
      arm64: dts: imx8mp: Add support for DH electronics i.MX8M Plus DHCOM PicoITX

Michal Vokáč (1):
      arm64: dts: imx: Add imx8mp-iota2-lumpy board

Peng Fan (7):
      arm64: dts: imx95: set max-rx-timeout-ms
      arm64: dts: imx95: add bbm/misc/syspower scmi nodes
      arm64: dts: imx95: update a55 thermal trip points
      arm64: dts: imx95: add anamix temperature thermal zone and cooling node
      arm64: dts: imx95: enable A55 cpuidle
      arm64: dts: imx95-19x19-evk: add nxp,ctrl-ids property
      arm64: dts: imx95-19x19-evk: add lpi2c[5,6] and sub-nodes

Richard Zhu (5):
      arm64: dts: imx8mq: Add dbi2 and atu reg for i.MX8MQ PCIe EP
      arm64: dts: imx8mp: Add dbi2 and atu reg for i.MX8MP PCIe EP
      arm64: dts: imx8mm: Add dbi2 and atu reg for i.MX8MM PCIe EP
      arm64: dts: imx8-ss-hsio: Add PCIe and SATA support
      arm64: dts: imx8dxl-evk: Add PCIe support

Shengjiu Wang (6):
      arm64: dts: imx93-9x9-qsb: Enable sound-wm8962 sound card
      arm64: dts: imx93-9x9-qsb: add bt-sco sound card support
      arm64: dts: imx93-9x9-qsb: Add PDM microphone sound card support
      arm64: dts: imx8ulp: Add audio device nodes
      arm64: dts: imx8ulp-evk: Add bt-sco sound card support
      arm64: dts: imx8ulp-evk: Add spdif sound card support

Stefan Eichenberger (2):
      arm64: dts: imx8mm-verdin: add single-master property to all i2c nodes
      arm64: dts: imx8mp-verdin: add single-master property to all i2c nodes

Tarang Raval (1):
      arm64: dts: imx8mm-emtop-baseboard: Add Peripherals Support

Tim Harvey (4):
      arm64: dts: imx8mp-venice-gw74xx: add M2SKT_GPIO10 gpio configuration
      arm64: dts: imx8mm-venice-*: add RTC aliases
      arm64: dts: imx8m*-venice-gw75xx: add Accelerometer device
      arm64: dts: imx: Add i.MX8M Plus Gateworks GW82XX-2X support

WangYuli (1):
      arm64: dts: colibri-imx8x: Fix typo "rewritting"

Xu Yang (3):
      arm64: dts: imx8dxl-ss-conn: change usbphy1 compatible
      arm64: dts: imx8qm: change usbphy1 compatible
      arm64: dts: imx8qxp: change usbphy1 compatible

Yannic Moog (1):
      arm64: dts: imx8mp-phyboard-pollux-rdk: add gpio-fan

 arch/arm64/boot/dts/freescale/Makefile             |  25 +
 arch/arm64/boot/dts/freescale/fsl-ls1012a-qds.dts  |   2 +-
 .../fsl-ls1028a-kontron-sl28-var3-ads2.dts         |   2 -
 arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts  |   2 +-
 .../arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi |   3 -
 .../arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi | 169 ++++
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |   2 +-
 .../boot/dts/freescale/imx8-apalis-eval-v1.2.dtsi  |  69 ++
 .../arm64/boot/dts/freescale/imx8-apalis-eval.dtsi |  31 +-
 .../boot/dts/freescale/imx8-apalis-ixora-v1.1.dtsi |  31 +-
 .../boot/dts/freescale/imx8-apalis-ixora-v1.2.dtsi |  31 +-
 .../arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi | 135 ++-
 arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi   |  19 +-
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi    |   2 +-
 arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi    | 123 +++
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      |  33 +
 arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi |   4 +
 arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi |  51 ++
 arch/arm64/boot/dts/freescale/imx8dxl.dtsi         |   6 +
 .../boot/dts/freescale/imx8mm-emtop-baseboard.dts  | 335 ++++++++
 .../arm64/boot/dts/freescale/imx8mm-kontron-bl.dts | 131 +++
 .../boot/dts/freescale/imx8mm-kontron-dl.dtso      | 189 +++++
 .../boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts |   5 +
 .../boot/dts/freescale/imx8mm-venice-gw700x.dtsi   |   7 +-
 .../imx8mm-venice-gw73xx-0x-rs232-rts.dtso         |   4 -
 .../freescale/imx8mm-venice-gw73xx-0x-rs422.dtso   |   4 -
 .../freescale/imx8mm-venice-gw73xx-0x-rs485.dtso   |   4 -
 .../boot/dts/freescale/imx8mm-venice-gw75xx.dtsi   |  16 +
 .../boot/dts/freescale/imx8mm-venice-gw7901.dts    |   4 +-
 .../boot/dts/freescale/imx8mm-venice-gw7902.dts    |   4 +-
 .../boot/dts/freescale/imx8mm-venice-gw7903.dts    |   4 +-
 .../boot/dts/freescale/imx8mm-venice-gw7904.dts    |   7 +-
 .../boot/dts/freescale/imx8mm-verdin-ivy.dtsi      | 471 +++++++++++
 .../dts/freescale/imx8mm-verdin-nonwifi-ivy.dts    |  18 +
 .../boot/dts/freescale/imx8mm-verdin-wifi-ivy.dts  |  18 +
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |   9 +-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |   8 +-
 .../freescale/imx8mn-tqma8mqnl-mba8mx-usbotg.dtso  |  29 +-
 .../boot/dts/freescale/imx8mn-tqma8mqnl-mba8mx.dts |   5 +
 .../boot/dts/freescale/imx8mn-venice-gw7902.dts    |   4 +-
 .../boot/dts/freescale/imx8mp-dhcom-drc02.dts      | 255 ++++++
 .../boot/dts/freescale/imx8mp-dhcom-picoitx.dts    | 176 ++++
 .../boot/dts/freescale/imx8mp-evk-pcie-ep.dtso     |  17 +
 .../boot/dts/freescale/imx8mp-iota2-lumpy.dts      | 423 ++++++++++
 .../boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts | 305 +++++++
 .../boot/dts/freescale/imx8mp-kontron-dl.dtso      | 111 +++
 .../boot/dts/freescale/imx8mp-kontron-osm-s.dtsi   | 908 +++++++++++++++++++++
 .../imx8mp-kontron-smarc-eval-carrier.dts          | 254 ++++++
 .../boot/dts/freescale/imx8mp-kontron-smarc.dtsi   | 280 +++++++
 arch/arm64/boot/dts/freescale/imx8mp-navqp.dts     |  47 ++
 .../dts/freescale/imx8mp-nitrogen-smarc-som.dtsi   | 348 ++++++++
 .../imx8mp-nitrogen-smarc-universal-board.dts      |  17 +
 .../dts/freescale/imx8mp-phyboard-pollux-rdk.dts   |  50 +-
 .../boot/dts/freescale/imx8mp-phycore-som.dtsi     |   4 +-
 .../boot/dts/freescale/imx8mp-venice-gw702x.dtsi   |   4 +-
 .../boot/dts/freescale/imx8mp-venice-gw74xx.dts    |   7 +-
 .../boot/dts/freescale/imx8mp-venice-gw75xx.dtsi   |  16 +
 .../boot/dts/freescale/imx8mp-venice-gw82xx-2x.dts |  19 +
 .../boot/dts/freescale/imx8mp-venice-gw82xx.dtsi   | 533 ++++++++++++
 .../boot/dts/freescale/imx8mp-verdin-ivy.dtsi      | 512 ++++++++++++
 .../dts/freescale/imx8mp-verdin-nonwifi-ivy.dts    |  18 +
 .../boot/dts/freescale/imx8mp-verdin-wifi-ivy.dts  |  18 +
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   |  12 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  25 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |   8 +-
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |  89 ++
 arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi |   4 +-
 arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi  |   4 +
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi   |   3 +
 arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi  | 209 +++++
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |  34 +
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      | 298 ++++++-
 arch/arm64/boot/dts/freescale/imx8qxp-ss-conn.dtsi |   4 +
 arch/arm64/boot/dts/freescale/imx8qxp-ss-hsio.dtsi |  41 +
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   6 +
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |  70 ++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         | 214 +++++
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi   |   4 +-
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts  | 115 ++-
 .../boot/dts/freescale/imx93-9x9-qsb-i3c.dtso      |  72 ++
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    | 158 +++-
 arch/arm64/boot/dts/freescale/imx93.dtsi           |   8 +
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  |  86 ++
 arch/arm64/boot/dts/freescale/imx95.dtsi           |  68 +-
 arch/arm64/boot/dts/freescale/mba8mx.dtsi          |   6 -
 arch/arm64/boot/dts/freescale/s32g2.dtsi           | 153 ++++
 arch/arm64/boot/dts/freescale/s32g274a-evb.dts     |   5 +
 arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts    |  13 +
 arch/arm64/boot/dts/freescale/s32g3.dtsi           | 153 ++++
 arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts    |   4 +
 90 files changed, 8095 insertions(+), 109 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-kontron-dl.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-ivy.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-nonwifi-ivy.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-verdin-wifi-ivy.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx-2x.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-venice-gw82xx.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-ivy.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-ss-hsio.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-9x9-qsb-i3c.dtso

