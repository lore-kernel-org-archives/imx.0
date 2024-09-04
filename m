Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E42763D
	for <imx@lists.linux.dev>; Wed,  4 Sep 2024 14:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725460563; cv=none; b=tPQN4zRKzlUgtaP4mOFeCVTlAWHVYSL2kKQ3raSr+tz5kyNqeXee9RJtly+B4s1LwWDuU5wzGij2qpTJNs+zzn2LKkNpXriJGcA9M9kStZgG65a9gCCuxDeNCoPN+fsISgn9yI6tf0sYwuuf7Ai1mjrlBe6iz8k05h/F8KXDTpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725460563; c=relaxed/simple;
	bh=Ypm0IeZk80VHKclg2RP5OYo3uJvVaK3azEdzNQr2kiQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rfu9fkLe6WV1JJNzDcBroD83n2ORGQmDeQ/ocd9sqfEmvO7iCF+WUGHuzMEhTH1gt8YYwQz7CjkgWKwCYqRAexMCfi4pADGMX260fjVOIUvE0cruIfQ6MsC19eXBriDnrggRd/dI/LPDm40J31/Io2eUzdkoWYgOipxMY5H2ZUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=MYvdhG5D; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="MYvdhG5D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=H/NDy
	R/ItK+Lbs72oZbvRAK+iE3r/454WBpxdLxx3BQ=; b=MYvdhG5DgZ2bVDcR2KaC3
	quwCq2pAABBmhUNej8lMf4Ez7rYphbq/Kkxs+oHgk718dEW3EZ+au4EZAlGcGh8F
	7mAiSnsQffUCNkSSftZYK41/Esb3YhZWrmpF+ZFFyV7L3QeueDcuu3IcErA5vBgx
	U/1nZp9A4e+uJhsYkwJ4c0=
Received: from localhost.localdomain (unknown [114.216.210.89])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCHd9UEcNhmUkhrAA--.17423S5;
	Wed, 04 Sep 2024 22:34:47 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] i.MX ARM device tree changes for 6.12
Date: Wed,  4 Sep 2024 22:34:37 +0800
Message-Id: <20240904143439.211552-4-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904143439.211552-1-shawnguo2@yeah.net>
References: <20240904143439.211552-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgCHd9UEcNhmUkhrAA--.17423S5
X-Coremail-Antispam: 1Uf129KBjvJXoW3JrW5Kw1DZw1fZF4kAr1kKrg_yoW3GFyDpa
	ySkrZrGrs7Cr1aq34UJr40g3s8Zw1jvr1rZr15Gay8KF43Za4UXr9aywn3t345ZFWrG3WS
	kr1kur97JrWkuaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j7BMNUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBVQZWbYPvF8rQAAsE

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-6.12

for you to fetch changes up to c30f4711b8bf938c447750f31eb6ad00a67782b1:

  ARM: dts: imx28-lwe: Remove saif[01] definitions (2024-09-03 16:23:20 +0800)

----------------------------------------------------------------
i.MX ARM device tree changes for 6.12:

- A series from Fabio Estevam to fix dt-schema warnings on i.MX23,
  i.MX28 and i.MX27 device trees
- A bunch of changes from Krzysztof Kozlowski that corrects TQ Systems
  DTS patterns in MAINTAINERS file and fix various dt-schema warnings
- A couple changes from Liu Ying to improve HDMI support on i.MX53 QSB
  board
- A series from Lukasz Majewski to update imx28-lwe device tree, fixing
  partition definitions, reducing SPI frequency and cleaning up SAIF
- A series from Markus Niebel to improve TQ-Systems device trees, adding
  iio-hwmon device, using better compatible for LM75 temp sensor, moving
  I2C3 pinmux to a better place

----------------------------------------------------------------
Elinor Montmasson (1):
      ARM: dts: imx6: update spdif sound card node properties

Fabio Estevam (5):
      ARM: dts: imx6sx-udoo-neo: Properly configure ENET_REF
      ARM: dts: imx1/imx27: Use dma-controller as node name
      ARM: dts: imx28-apx4devkit: Fix the regulator description
      ARM: dts: imx23/8: Rename apbh and apbx nodes
      ARM: dts: imx28-tx28: Fix the fsl,saif-master usage

Krzysztof Kozlowski (10):
      MAINTAINERS: correct TQ Systems DTS patterns
      ARM: dts: imx7d-zii-rmu2: fix Ethernet PHY pinctrl property
      ARM: dts: imx7: align pin config nodes with bindings
      ARM: dts: imx7d-sdb: align pin config nodes with bindings
      ARM: dts: imx6ul-geam: fix fsl,pins property in tscgrp pinctrl
      ARM: dts: imx6ull-seeed-npi: fix fsl,pins property in tscgrp pinctrl
      ARM: dts: imx6ul-tx6ul: drop empty pinctrl placeholder
      ARM: dts: imx6ul: align pin config nodes with bindings
      ARM: dts: imx6sl: align pin config nodes with bindings
      ARM: dts: imx6qdl: align pin config nodes with bindings

Liu Ying (2):
      ARM: dts: imx53-qsb-hdmi: Do not disable TVE
      ARM: dts: imx53-qsb-hdmi: Merge display0 node

Lukasz Majewski (3):
      ARM: dts: imx28-lwe: Fix partitions definitions
      ARM: dts: imx28-lwe: Reduce maximal SPI frequency
      ARM: dts: imx28-lwe: Remove saif[01] definitions

Markus Niebel (6):
      ARM: dts: imx7-mba7: add iio-hwmon support
      ARM: dts: imx7-mba7: improve compatible for LM75 temp sensor
      ARM: dts: imx6qdl-tqma6: move i2c3 pinmux to imx6qdl-tqma6b
      ARM: dts: imx6qdl-tqma6: improve compatible for LM75 temp sensor
      ARM: dts: imx6qdl-mba6: improve compatible for LM75 temp sensor
      ARM: dts: imx6qdl-mba6b: remove doubled entry for I2C1 pinmux

 MAINTAINERS                                        |   5 +-
 arch/arm/boot/dts/nxp/imx/imx1.dtsi                |   2 +-
 arch/arm/boot/dts/nxp/imx/imx27.dtsi               |   2 +-
 arch/arm/boot/dts/nxp/imx/imx53-qsb-hdmi.dtso      |   6 -
 arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts         |  15 +-
 arch/arm/boot/dts/nxp/imx/imx6q-prti6q.dts         |  15 +-
 arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts        |   9 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi      |  15 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-apf6dev.dtsi     |   9 +-
 .../boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi    |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi     |  15 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-cubox-i.dtsi     |   9 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi      |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi      |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi      |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi      |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi      |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5903.dtsi      |  10 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi      |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi      |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5912.dtsi      |   4 +-
 .../arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi |   9 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-icore-rqs.dtsi   |   8 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi       |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi       |  11 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi   |  13 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi       |  14 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi      |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi      |  20 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi         |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi    |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi     |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi   |   9 +-
 arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts           |  12 +-
 arch/arm/boot/dts/nxp/imx/imx6sl-warp.dts          |   8 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dts     |   9 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi          |   9 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-udoo-neo.dtsi     |   5 +
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi    |   4 +-
 .../boot/dts/nxp/imx/imx6ul-ccimx6ulsbcexpress.dts |   4 +-
 .../arm/boot/dts/nxp/imx/imx6ul-ccimx6ulsbcpro.dts |  14 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-ccimx6ulsom.dtsi  |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts          |   6 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi        |   4 +-
 .../boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-liteboard.dts     |   2 +-
 .../nxp/imx/imx6ul-phytec-segin-peb-wlbt-05.dtsi   |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-phytec-segin.dtsi |   6 +-
 .../boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi    |   2 +-
 .../boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dts    |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi        |  18 +-
 .../boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi    |   8 +-
 .../dts/nxp/imx/imx6ull-seeed-npi-dev-board.dtsi   |  20 +-
 arch/arm/boot/dts/nxp/imx/imx6ull-seeed-npi.dtsi   |   6 +-
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts   |   2 +-
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi        |   2 +-
 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi           |   8 +-
 arch/arm/boot/dts/nxp/imx/imx7d-nitrogen7.dts      |   4 +-
 arch/arm/boot/dts/nxp/imx/imx7d-pico.dtsi          |  20 +-
 arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts    |   8 +-
 arch/arm/boot/dts/nxp/imx/imx7d-sdb-reva.dts       |  34 +-
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts            | 608 ++++++++++-----------
 arch/arm/boot/dts/nxp/imx/imx7d-zii-rmu2.dts       |   2 +-
 arch/arm/boot/dts/nxp/imx/imx7s-warp.dts           |   4 +-
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi             |   6 +-
 arch/arm/boot/dts/nxp/mxs/imx23-evk.dts            |   4 +-
 arch/arm/boot/dts/nxp/mxs/imx23-olinuxino.dts      |   4 +-
 arch/arm/boot/dts/nxp/mxs/imx23-sansa.dts          |   4 +-
 arch/arm/boot/dts/nxp/mxs/imx23-stmp378x_devb.dts  |   4 +-
 arch/arm/boot/dts/nxp/mxs/imx23-xfi3.dts           |   4 +-
 arch/arm/boot/dts/nxp/mxs/imx23.dtsi               |   4 +-
 arch/arm/boot/dts/nxp/mxs/imx28-apx4devkit.dts     |  20 +-
 arch/arm/boot/dts/nxp/mxs/imx28-cfa10037.dts       |   4 +-
 arch/arm/boot/dts/nxp/mxs/imx28-lwe.dtsi           |  38 +-
 arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts           |   2 +-
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi               |   4 +-
 76 files changed, 617 insertions(+), 570 deletions(-)

