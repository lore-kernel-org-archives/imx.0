Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E687B1BA062
	for <imx@lists.linux.dev>; Tue,  2 Jul 2024 14:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719930167; cv=none; b=ZguX3bM8rlCIvD7uH0DTxr9MKuD+96uZDGqrTQ96ZCnNxwmftzKlzKHwnyqs8cYar1o76oP6aRDc1nWZFx8si7g+XDXd1TVpUoTXv7DXjCV2Svnzip/8geB+I6UmCvisNsV05dgeBqgPTKLV31IiBnKGqNEybLorE9SFJVKvG/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719930167; c=relaxed/simple;
	bh=/98A36SRiW45Wcsl/YaMI6VU4ma+NFTgGx4sf5UOHqE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DpF4QZ1YdThT+c28KrY71kFyYFcAgqy5ip+sP2z6OJf6WgRlFZekSce8pdC+Baf7bxR5wRp3qzwCJkOoRpjKKWEWh4kn06u0sIhWTOnJRCc3PmjphetF/LfH8X6qBsUQfDssbGHbKWtXckocKuxcRwVxxgcqT4BK0dfgpcjJapg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=P+uUpR+k; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="P+uUpR+k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=5S9coaHfFP9suqWHXRdjzaCaszsYzEDDDN0fywlX4jo=;
	b=P+uUpR+kM2mqUy1Q66VSXP0k/7EJ05rCa3Kry34diEk4ocryXS/etXFow031uv
	Buu4ScOCttmloNs/M6pZIm/GBWk5NI0wAjLGy3TDySxyEtThjJnn6AHPCd4KuEi9
	4LF31kf2KoKFyRHnBtkCJoHT3X6kHQTSl0Riix6jAPugM=
Received: from localhost.localdomain (unknown [114.218.218.47])
	by gzsmtp3 (Coremail) with SMTP id M88vCgC3H+0TDYRm7sMJAA--.947S5;
	Tue, 02 Jul 2024 22:22:13 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/5] i.MX arm64 device tree change for 6.11
Date: Tue,  2 Jul 2024 22:21:52 +0800
Message-Id: <20240702142153.413061-4-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240702142153.413061-1-shawnguo2@yeah.net>
References: <20240702142153.413061-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgC3H+0TDYRm7sMJAA--.947S5
X-Coremail-Antispam: 1Uf129KBjvAXoW3Aw1DJrWrJF4kXF1fWFWUXFb_yoW8Xr43Ao
	W3CFWrArWjkr47uF4jvry7Kw4Yq3WkWr1xXFWUXrWrGw48XFyay3srWF4j9rWrJ345CFyk
	W3W7Kr15C3yYg34xn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxO6JUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBUQZWZqrzOkxAABsV

From: Shawn Guo <shawnguo@kernel.org>

Hi,

Tag imx-fixes-6.10 is merged into the branch to resolve a conflict on
file arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts.  Please consider
to pull, thanks!

Shawn


The following changes since commit dfd239a039b3581ca25f932e66b6e2c2bf77c798:

  arm64: dts: imx8qm-mek: fix gpio number for reg_usdhc2_vmmc (2024-06-17 11:07:06 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-6.11

for you to fetch changes up to e796887c06d177155b7bb6e6b876bb3683e23fda:

  arm64: dts: imx8mp: Remove 'snps,rx-sched-sp' (2024-07-02 12:14:43 +0800)

----------------------------------------------------------------
i.MX arm64 device tree change for 6.11:

- New board support: imx8mm-iot-gateway, imx93-9x9-qsb, imx95-19x19-evk,
  imx8mp-tqma8mpql-mba8mp-ras314, etc.
- A series from Adam Ford that improves imx8mp-beacon-kit support by
  fixing dtschema issues and enabling HDMI bridge HPD
- A set of changes from Alexander Stein that adds partitions subnode
  to spi-nor
- A great number of changes from Frank Li that add audio, flexcan, gpmi
  related devices for imx8dxl, imx8qm based boards
- A bunch of layerscape dtschema issue fixes from Frank Li
- A series from Krzysztof Kozlowski to use defines for interrupts
- A number of improvements on i.MX8MP DHCOM devices from Marek Vasut
- A couple of changes from Parthiban Nallathambi that add PCIe PHY and
  RS232/RS485 overlays for phygate-tauri-l board
- A series from Shengjiu Wang that adds bt-sco and XCVR sound card
  support for imx8mp-evk
- A series from Tim Harvey that fixes dt-schema warnings and adds DP83867
  configuration for i.MX8M Venice devices
- Other random feature additions and improvments on various boards

----------------------------------------------------------------
Adam Ford (4):
      arm64: dts: imx8mp-beacon-kit: Enable HDMI bridge HPD
      arm64: dts: imx8mp-beacon-kit: Fix errors found from CHECK_DTBS
      arm64: dts: imx8mp: Fix pgc_mlmix location
      arm64: dts: imx8mp: Fix pgc vpu locations

Alexander Stein (10):
      arm64: dts: mba93xxla: Add USB support
      arm64: dts: mba93xxca: Add USB support
      arm64: dts: freescale: tqma9352: Add partitions subnode to spi-nor
      arm64: dts: freescale: tqma8mqml: Add partitions subnode to spi-nor
      arm64: dts: freescale: tqma8mqnl: Add partitions subnode to spi-nor
      arm64: dts: freescale: tqma8mpql: Add partitions subnode to spi-nor
      arm64: dts: freescale: tqma8mq: Add partitions subnode to spi-nor
      arm64: dts: freescale: tqma8xx: Add partitions subnode to spi-nor
      arm64: dts: imx8mp-tqma8mpql-mba8mpxl: Remove unused ocram node
      arm64: dts: imx8mp: Add imx8mp-specific irqsteer compatible

Christian Gmeiner (1):
      arm64: dts: imx8qm: Add GPU nodes

Christopher Obbard (1):
      arm64: dts: imx8mp-debix-model-a: Enable HDMI output

Fabio Estevam (3):
      arm64: dts: imx8mm-iot-gateway: Add initial support
      arm64: dts: imx8qxp-mek: Pass memory-region to the DSP node
      arm64: dts: imx8mp: Remove 'snps,rx-sched-sp'

Francesco Dolcini (1):
      arm64: dts: freescale: imx8mp-verdin: add HDMI support

Frank Li (42):
      arm64: dts: imx8dxl-ss-adma: delete unused node
      arm64: dts: imx8dxl-ss-adma: update audio node power domains and IRQ number
      arm64: dts: imx8dxl-evk: add audio nodes
      arm64: dts: imx8-ss-audio: remove memory-region = <&dsp_reserved>;
      arm64: dts: imx8qm-ss-audio: add audio nodes
      arm64: dts: imx8qm-mek: add sai and wm8960 support
      arm64: dts: imx8x: add cm41 subsystem dtsi
      arm64: dts: imx8qm-mek: add i2c0 and children devices
      arm64: dts: imx8qm-mek: add cm41_i2c and children devices
      arm64: dts: imx8qm-mek: add flexcan support
      arm64: dts: imx8qm-mek: add lsio mu5 and mu6
      arm64: dts: imx8qm: add ocopt and fec_mac[0,1]
      arm64: dts: imx8qm-mek: add fec2 support
      arm64: dts: freescale: ls1028a: Remove undocumented 'fsl,ls-pcie-ep'
      arm64: dts: freescale: ls1028a: Reorder sai dma-names to fix warning
      arm64: dts: ls1012a: Reorder sai dma-names to clean up DTB_CHECK warning
      arm64: dts: ls1043a: Change I2C clock name to ipg to fix DTB_CHECK warning
      arm64: dts: ls208xa: Change I2C clock name to ipg to fix DTB_CHECK warning
      arm64: dts: ls2160a: Change I2C clock name to ipg to fix DTB_CHECK warning
      arm64: dts: layerscape: Change node name from 'esdhc' to 'mmc'
      arm64: dts: layerscape: change thermal node name
      arm64: dts: imx8-ss-conn: add gpmi nand node
      arm64: dts: imx8dxl-ss-conn: add gpmi nand
      arm64: dts: imx8dxl-evk: add imx8dxl_cm4, lsio mu5, related memory region
      arm64: dts: fsl-ls1043a-rdb: use common spi-cs-setup(hold)-delay-ns
      arm64: dts: imx95: add '#address-cells' and '#size-cells' for all i2c
      arm64: dts: imx95: add pcie[0,1] and pcie-ep[0,1] support
      arm64: dts: imx95-19x19-evk: add lpi2c7 and expander gpio pcal6524
      arm64: dts: imx95-19x19-evk: add PCIe[0,1] support
      arm64: dts: layerscape: rename node 'timer' as 'rtc'
      arm64: dts: layerscape: add platform special compatible string for gpio
      arm64: dts: fsl-lx2160a: fix #address-cells for pinctrl-single
      arm64: dts: fsl-ls1012a: remove property 'snps,host-vbus-glitches'
      arm64: dts: layerscape: replace node name 'nor' with 'flash'
      arm64: dts: layerscape: remove compatible string 'fsl,fman-xmdio' for fman3
      arm64: dts: layerscape: add #dma-cells for qdma
      arm64: dts: layerscape: rename node name "wdt" to "watchdog"
      arm64: dts: layerscape: change pcie interrupt order
      arm64: dts: layerscape: rename aux_bus to aux-bus
      arm64: dts: fsl-ls1043a: remove unused clk-name at watchdog node
      arm64: dts: fsl-ls1046a: rename thermal node name
      arm64: dts: layerscape: rename b(q)man-portals to b(q)man-portals-bus

Guido Günther (1):
      arm64: dts: imx8mq-librem5: Don't wake up on volume key press

Joy Zou (2):
      arm64: dts: imx93-11x11-evk: fix duplicated lpi2c3 labels
      arm64: dts: imx93-11x11-evk: reorder lpi2c2, lpi2c3, mu1 and mu2 label

Krzysztof Kozlowski (3):
      arm64: dts: freescale: use defines for interrupts
      arm64: dts: ls208xa: use defines for timer interrupts
      arm64: dts: imx8: use defines for interrupts

Liu Ying (1):
      arm64: dts: imx8mp-evk: Add MX8-DLVDS-LCD1 display module support

Luca Ceresoli (1):
      arm64: dts: imx8mp-msc-sm2s: Add HDMI output

Marek Vasut (3):
      arm64: dts: imx8mp: Enable HDMI on i.MX8MP DHCOM PDK2 and PDK3
      arm64: dts: imx8mp: Do not reconfigure Audio PLL2 on DH i.MX8M Plus DHCOM SoM
      arm64: dts: imx8mp: Update Fast ethernet PHY MDIO addresses to match DH i.MX8MP DHCOM rev.200

Martin Schmiedel (1):
      arm64: dts: freescale: add TQMa8MPQL on MBa8MP-RAS314

Max Krummenacher (2):
      arm64: dts: freescale: imx8mm-verdin: don't limit i2c2 max. clock
      arm64: dts: freescale: imx8mp-verdin: don't limit i2c2 max. clock

Mike Looijmans (1):
      arm64: dts: ls1028a-rdb: Add EEPROM nodes to I2C bus

Parthiban Nallathambi (2):
      arm64: dts: phygate-tauri-l: enable pcie phy
      arm64: dts: phygate-tauri-l: add overlays for RS232 and RS485

Peng Fan (3):
      arm64: dts: freescale: add i.MX95 basic dtsi
      arm64: dts: freescale: add i.MX95 19x19 EVK minimal board dts
      arm64: dts: freescale: Support i.MX93 9x9 Quick Start Board

Shawn Guo (1):
      Merge tag 'imx-fixes-6.10' into imx/dt64

Shengjiu Wang (4):
      arm64: dts: imx8mp: Initialize audio PLLs from audiomix subsystem
      arm64: dts: imx8mp-evk: add bt-sco sound card support
      arm64: dts: imx8mp: Add audio XCVR device node
      arm64: dts: imx8mp-evk: Add audio XCVR sound card

Tim Harvey (4):
      arm64: dts: freescale: imx8m*-venice-*: fix gw,gsc dt-schema warnings
      arm64: dts: imx8mm-venice-gw700x: add support for PHY LED's
      arm64: dts: imx8mp-venice-gw702x: add support for PHY LED's
      arm64: dts: imx8mp-venice-gw74xx: add DP83867 configuration

Vitor Soares (1):
      arm64: dts: imx8mm-verdin: add TPM device

 arch/arm64/boot/dts/freescale/Makefile             |   15 +
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi     |   79 +-
 arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts  |   31 +
 arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi     |   55 +-
 arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dts  |    2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dts  |   20 +-
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi     |  138 +--
 arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dts  |    2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi     |   49 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a-qds.dts  |    2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi     |   72 +-
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi     |    2 +-
 arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi     |    2 +-
 arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi |    2 +-
 arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi |    2 +-
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi     |  186 +--
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     |   56 +-
 arch/arm64/boot/dts/freescale/imx8-ss-audio.dtsi   |    1 -
 arch/arm64/boot/dts/freescale/imx8-ss-cm41.dtsi    |   68 ++
 arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi    |   69 ++
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      |  277 +++++
 arch/arm64/boot/dts/freescale/imx8dxl-ss-adma.dtsi |   78 ++
 arch/arm64/boot/dts/freescale/imx8dxl-ss-conn.dtsi |   11 +
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi      |    2 +-
 .../boot/dts/freescale/imx8mm-iot-gateway.dts      |  218 ++++
 .../imx8mm-phygate-tauri-l-rs232-rs232.dtso        |   72 ++
 .../imx8mm-phygate-tauri-l-rs232-rs485.dtso        |   76 ++
 .../imx8mm-phygate-tauri-l-rs232-rts-cts.dtso      |   41 +
 .../boot/dts/freescale/imx8mm-phygate-tauri-l.dts  |   10 +
 .../arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi |    8 +-
 arch/arm64/boot/dts/freescale/imx8mm-ucm-som.dtsi  |  679 +++++++++++
 .../boot/dts/freescale/imx8mm-venice-gw700x.dtsi   |   20 +
 .../boot/dts/freescale/imx8mm-venice-gw7901.dts    |    2 -
 .../boot/dts/freescale/imx8mm-venice-gw7902.dts    |    2 -
 .../boot/dts/freescale/imx8mm-venice-gw7903.dts    |    2 -
 .../boot/dts/freescale/imx8mm-venice-gw7904.dts    |    2 -
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |   20 +-
 .../arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi |    8 +-
 .../boot/dts/freescale/imx8mn-venice-gw7902.dts    |    2 -
 .../arm64/boot/dts/freescale/imx8mp-beacon-kit.dts |   12 +-
 .../boot/dts/freescale/imx8mp-beacon-som.dtsi      |    2 -
 .../boot/dts/freescale/imx8mp-debix-model-a.dts    |   47 +
 .../arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dts |   39 +
 .../arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts |   39 +
 .../arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi |   13 +-
 .../dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtso   |   77 ++
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |   91 +-
 .../boot/dts/freescale/imx8mp-msc-sm2s-ep1.dts     |   27 +
 .../freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts   |  906 +++++++++++++++
 .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts    |    5 -
 .../arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi |    8 +-
 .../boot/dts/freescale/imx8mp-venice-gw702x.dtsi   |   20 +
 .../boot/dts/freescale/imx8mp-venice-gw74xx.dts    |   24 +
 .../boot/dts/freescale/imx8mp-verdin-dahlia.dtsi   |   37 +
 .../boot/dts/freescale/imx8mp-verdin-dev.dtsi      |   37 +
 .../boot/dts/freescale/imx8mp-verdin-mallow.dtsi   |   37 +
 .../boot/dts/freescale/imx8mp-verdin-nonwifi.dtsi  |    3 +-
 .../boot/dts/freescale/imx8mp-verdin-wifi.dtsi     |    3 +-
 .../boot/dts/freescale/imx8mp-verdin-yavia.dtsi    |   37 +
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   |   18 +-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |  120 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |    2 -
 arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi  |    8 +-
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |  344 ++++++
 arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi |  473 ++++++++
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |  103 ++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |    1 +
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts  |  309 +++--
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    |  492 ++++++++
 .../dts/freescale/imx93-tqma9352-mba93xxca.dts     |   73 +-
 .../dts/freescale/imx93-tqma9352-mba93xxla.dts     |   61 +
 arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi  |    6 +
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  |  289 +++++
 arch/arm64/boot/dts/freescale/imx95-clock.h        |  187 +++
 arch/arm64/boot/dts/freescale/imx95-pinfunc.h      |  865 ++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-power.h        |   47 +
 arch/arm64/boot/dts/freescale/imx95.dtsi           | 1192 ++++++++++++++++++++
 .../boot/dts/freescale/qoriq-fman3-0-10g-0.dtsi    |    2 +-
 .../boot/dts/freescale/qoriq-fman3-0-10g-1.dtsi    |    2 +-
 .../boot/dts/freescale/qoriq-fman3-0-1g-0.dtsi     |    2 +-
 .../boot/dts/freescale/qoriq-fman3-0-1g-1.dtsi     |    2 +-
 .../boot/dts/freescale/qoriq-fman3-0-1g-2.dtsi     |    2 +-
 .../boot/dts/freescale/qoriq-fman3-0-1g-3.dtsi     |    2 +-
 .../boot/dts/freescale/qoriq-fman3-0-1g-4.dtsi     |    2 +-
 .../boot/dts/freescale/qoriq-fman3-0-1g-5.dtsi     |    2 +-
 arch/arm64/boot/dts/freescale/qoriq-fman3-0.dtsi   |    4 +-
 arch/arm64/boot/dts/freescale/tqma8xx.dtsi         |    8 +-
 87 files changed, 7859 insertions(+), 606 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8-ss-cm41.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-iot-gateway.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs232.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rs485.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l-rs232-rts-cts.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-ucm-som.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-ss-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-clock.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-power.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx95.dtsi

