Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B1171B7E2
	for <imx@lists.linux.dev>; Mon, 26 Feb 2024 03:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708918985; cv=none; b=NjXWIXRINSonZo7nBRFC9eOXduWhzK+HSbEeBPUyBTlekeFBVCmYGTwpgqILpuAnuEW06qrEO2lbZtfz8+Te43efpaEumCKFbL27JDXUOIlDuh93OFTF4NK5SfEPpEy8MBZR93ITNQHBM5M11T0Zmy7MuEM+bFaaWbC1dp4b3/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708918985; c=relaxed/simple;
	bh=LwWdEHHiN7X6GYW4zlutXE6cktnsBcUbLi+q86ickIo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eLKn5wcWnnc37mumcWIlO2kmgPCnM0zJXL82TnDJMwd4DTaTgb1H+wzJa9IKBW614vtqzKRrXZ/Rer9jAw9tQpSpjARhxyeUhvjGgZ5IoUUd0wVj/0bo6J2f+8rJTiyt6+ZwERt6lnEucfaG+jbm8GinwRYIzOflX/0Dk4eMA8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=bOkKdxHz; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="bOkKdxHz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=rbCFkl4Ty8GOMPM2Hmjiz+SbURzIBrhq7FTfCHaMUA4=;
	b=bOkKdxHzBDv5fOn0hkCVUqrSsPMRhNrPmwpa7CbdyE+Xw1tsQB7VoXHtn58Lmy
	TONFxyIAIgNs+ycZ2WnBVndJQzjDVvh0yjsuG9AD/rzU9b8IGMEBktIDGZwVdb2d
	Fu2OQOON5JauNEfl8PVtPGv5IuQmxYfivXaL/Q9Dfkv8Q=
Received: from localhost.localdomain (unknown [183.213.196.200])
	by smtp1 (Coremail) with SMTP id ClUQrACHSyCmCNxlT1hhBA--.22032S4;
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
Subject: [GIT PULL 3/5] i.MX ARM device tree for 6.9
Date: Mon, 26 Feb 2024 11:41:44 +0800
Message-Id: <20240226034147.233993-3-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240226034147.233993-1-shawnguo2@yeah.net>
References: <20240226034147.233993-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:ClUQrACHSyCmCNxlT1hhBA--.22032S4
X-Coremail-Antispam: 1Uf129KBjvJXoW3Xry8CFW3Kr4kKr4kZw1fZwb_yoWxGrWDpa
	y3uw47GFs7Gr1Igr98J3y8K398tw1UZr18Zr15Jay0yFW5Z3W7Zrnakwnay343ZFyrZw1r
	tr1kWr9rJ34DuaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j689tUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBQiQZVsVCUT1+QAAs3

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-6.9

for you to fetch changes up to ccda9e5c365f6c4c3af5fda9c15cce3779cb2bbe:

  ARM: dts: nxp: imx: fix weim node name (2024-02-26 09:35:07 +0800)

----------------------------------------------------------------
i.MX ARM device tree for 6.9:

- New board support: Sielaff i.MX6 Solo, Apalis Evaluation Board v1.2.
- A bunch of i.MX7 TQMA7/MBA7 updates from Alexander Stein that add
  various devices, improve hardware descriptions and fix dt-schema
  warnings, etc.
- Correct touchscreen rotation for imx6sl-tolino-shine2hd board.
- An imx53-qsb update from Dmitry Baryshkov to add HDMI expander support.
- A couple of i.MX1 and i.MX28 device node name fixes from Fabio Estevam.
- Enable usb3-lpm-capable for LS1021A usb3 node.
- A couple of imx6dl-yapp4 board improvements from Michal Vokáč.
- A series from Sebastian Reichel to improve imx6ull descriptions.

----------------------------------------------------------------
Alexander Stein (24):
      ARM: dts: imx7-tqma7/mba7: convert fsl,pins to uint32-matrix
      ARM: dts: imx7[d]-mba7: Move ethernet PHY reset into PHY node
      ARM: dts: imx7[d]-mba7: disable USB OC on USB host and USB OTG2
      ARM: dts: imx7[d]-mba7: disable PCIe interface
      ARM: dts: imx7[d]-mba7: hog Mini PCIe signals
      ARM: dts: imx7-mba7: Mark gpio-buttons as wakeup-source
      ARM: dts: imx7-mba7: Enable SNVS power key
      ARM: dts: imx7-mba7: Add RTC aliases
      ARM: dts: imx7-mba7: Add SPI1_SS0 as chip select 3
      ARM: dts: imx7-tqma7: Add i2c bus recovery
      ARM: dts: imx7-mba7: Add i2c bus recovery
      ARM: dts: imx7-tqma7: fix EEPROM compatible for SE97BTP
      ARM: dts: imx7-mba7: Fix iomuxc node names
      ARM: dts: imx7-tqma7: Fix iomuxc node names
      ARM: dts: imx7-mba7: restrict usdhc interface modes
      ARM: dts: imx7-tqma7: restrict usdhc interface modes
      ARM: dts: imx7-tqma7: remove superfluous status property
      ARM: dts: imx7-tqma7: mark system data eeprom as read-only
      ARM: dts: imx7-tqma7: rename node for SE97BTP
      ARM: dts: imx7d-mba7: Remove USB OTG related properties on USB node
      ARM: dts: imx7-tqma7: Add missing vcc supply to i2c eeproms
      ARM: dts: imx7-mba7: Add missing vcc supply to i2c devices
      ARM: dts: imx7-tqma7: Fix PMIC v33 rail voltage range
      ARM: dts: imx6ul: Add missing #thermal-sensor-cells to tempmon

Andreas Kemnade (1):
      ARM: dts: imx6sl-tolino-shine2hd: fix touchscreen rotation

Christoph Niedermaier (2):
      ARM: dts: imx6ull-dhcor: Remove 900MHz operating point
      ARM: dts: imx6ull-dhcom: Remove /omit-if-no-ref/ from node usdhc1-pwrseq

Dmitry Baryshkov (1):
      ARM: dts: imx53-qsb: add support for the HDMI expander

Fabio Estevam (2):
      ARM: dts: imx28-evk: Use 'eeprom' as the node name
      ARM: dts: imx1-apf9328: Fix Ethernet node name

Frieder Schrempf (1):
      ARM: dts: imx6dl: Add support for Sielaff i.MX6 Solo board

Hiago De Franco (1):
      ARM: dts: imx: Add support for Apalis Evaluation Board v1.2

Josua Mayer (1):
      ARM: dts: imx6qdl-hummingboard: Add rtc0 and rtc1 aliases to fix hctosys

Li Yang (1):
      ARM: dts: ls1021a: Enable usb3-lpm-capable for usb3 node

Manuel Traut (1):
      ARM: dts: imx6ul: Set macaddress location in ocotp

Michal Vokáč (2):
      ARM: dts: imx6dl-yapp4: Fix typo in the QCA switch register address
      ARM: dts: imx6dl-yapp4: Move the internal switch PHYs under the switch node

Oleksij Rempel (1):
      ARM: dts: imx6: skov: add aliases for all ethernet nodes

Sebastian Reichel (5):
      ARM: dts: imx6ull: fix pinctrl node name
      ARM: dts: imx6ul: Remove fsl,anatop from usbotg1
      ARM: dts: nxp: imx6ul: xnur-gpio -> xnur-gpios
      ARM: dts: nxp: imx6ul: fix touchscreen node name
      ARM: dts: nxp: imx: fix weim node name

 arch/arm/boot/dts/nxp/imx/Makefile                 |   6 +
 arch/arm/boot/dts/nxp/imx/imx1-apf9328.dts         |   2 +-
 arch/arm/boot/dts/nxp/imx/imx1.dtsi                |   2 +-
 arch/arm/boot/dts/nxp/imx/imx27.dtsi               |   2 +-
 arch/arm/boot/dts/nxp/imx/imx31.dtsi               |   2 +-
 arch/arm/boot/dts/nxp/imx/imx35.dtsi               |   2 +-
 arch/arm/boot/dts/nxp/imx/imx51.dtsi               |   2 +-
 arch/arm/boot/dts/nxp/imx/imx53-qsb-hdmi.dtso      |  87 ++++
 arch/arm/boot/dts/nxp/imx/imx6dl-sielaff.dts       | 533 +++++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi |  25 +-
 .../boot/dts/nxp/imx/imx6q-apalis-eval-v1.2.dts    | 200 ++++++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dts    | 108 +----
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi   | 120 +++++
 .../arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi |   7 +-
 .../boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi    |   5 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi    |  10 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi             |   2 +-
 .../boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts    |   6 +-
 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi              |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi              |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi    |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts          |   2 +-
 .../dts/nxp/imx/imx6ul-imx6ull-opos6uldev.dtsi     |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul.dtsi              |  18 +-
 .../dts/nxp/imx/imx6ull-dhcom-som-cfg-sdcard.dtsi  |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6ull-dhcom-som.dtsi   |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi   |   7 +-
 arch/arm/boot/dts/nxp/imx/imx6ull.dtsi             |   2 +-
 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi           | 325 +++++++------
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi          | 144 +++---
 arch/arm/boot/dts/nxp/imx/imx7d-mba7.dts           |  94 ++--
 arch/arm/boot/dts/nxp/ls/ls1021a.dtsi              |   1 +
 arch/arm/boot/dts/nxp/mxs/imx28-evk.dts            |   2 +-
 33 files changed, 1338 insertions(+), 394 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx53-qsb-hdmi.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-sielaff.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval.dtsi

