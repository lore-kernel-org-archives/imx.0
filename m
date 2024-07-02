Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1881B5831
	for <imx@lists.linux.dev>; Tue,  2 Jul 2024 14:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719930162; cv=none; b=Z+f0h/NpU323uDLt3+M4qFtU14yawVCB/U1KrYj2xN5jrmACwC6nDQnjstHFep0ViFGHiodzMmpS29mxapRpUS9o4wDE3arwBtHB0yllylxhTqbiBZ2J57SmFX0U/iHja06lSxeb9hCGRFw4YyIA34G0sJIXFO12yuGO+ayHm5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719930162; c=relaxed/simple;
	bh=mt4aUiXp4i9Hf2G/5OrxXnOzBEDH6aCQfsOpFIRU4uc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ncm/OPl7DvOy/6wFOihHm3LYvr8HVbKimR/ydvi1S1cjAu8RBmYMmcGCc2xIrBtj2qyTcAHp67CikhbZkclhD5HZ/c1ILoKbH+MV+VqF/iaBc8BSGQFIUIQwYJJBwav12pyNkOsQZll+mKIG899qTIts77+nK6Aq7dC6cAxVioM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=C2Y1atNH; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="C2Y1atNH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=C0pnlAVeKpphDiHhO+1BwpkHwEbNj3K46SZG87CaeuU=;
	b=C2Y1atNHwyV8nmwd6I/we8QZQYuMx6IK6GDsFmuKSp4WQkgLtPzSSnv9hDJpPs
	YfNpWsNDDwEeEdpInFFRmn92aWRhJqDiWAKDf08Y44gGsSkBxCgQLMv8NgJ9vqwU
	8ezGYUkeJcS2lHwCcwbhrqr4b1aBAdguDmVfvl8PChxxs=
Received: from localhost.localdomain (unknown [114.218.218.47])
	by gzsmtp3 (Coremail) with SMTP id M88vCgC3H+0TDYRm7sMJAA--.947S4;
	Tue, 02 Jul 2024 22:22:13 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/5] i.MX ARM device tree change for 6.11
Date: Tue,  2 Jul 2024 22:21:51 +0800
Message-Id: <20240702142153.413061-3-shawnguo2@yeah.net>
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
X-CM-TRANSID:M88vCgC3H+0TDYRm7sMJAA--.947S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr1DKF1xXw48AFyrZrWkJFb_yoWrZFyDpF
	Z3CrZrG3Z7G34ftryqqry8Kw15Aw4UZr1aywn8Ja48KFW3Z3W7Xr9a9wn3try5ZFWrXw4S
	yw4kuryxJw1DuF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jQ4S5UUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBUQZWZqrzOkxAAAsU

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-6.11

for you to fetch changes up to dac1c5043a083c570592dd048266e9f87b001c4e:

  ARM: dts: imx6qdl-kontron-samx6i: add actual device trees (2024-06-27 15:25:04 +0800)

----------------------------------------------------------------
i.MX ARM device tree change for 6.11:

- A few changes from Krzysztof Kozlowski to fix dtschema issues
- A series from Michael Walle to improve kontron-samx6i SoM support by
  fixing various errors and add kontron-samx6i-ads2 board
- Add LVDS port data mapping for M53 Menlo board
- Convert NVMEM usage to layout syntax on MBA6 boards

----------------------------------------------------------------
Andreas Kemnade (1):
      ARM: dts: e60k02: fix aliases for mmc

Krzysztof Kozlowski (5):
      ARM: dts: imx: align panel timings node name with dtschema
      ARM: dts: imx: correct choice of panel native mode
      ARM: dts: imx6dl-aristainetos2_4: drop redundant 'power-on-delay' property
      ARM: dts: imx: drop redundant 'u-boot,panel-name' property
      ARM: dts: imx28-tx28: drop redundant 'panel-name' property

Marek Vasut (1):
      ARM: dts: imx: Add LVDS port data mapping on M53 Menlo

Michael Walle (12):
      ARM: dts: imx6qdl-kontron-samx6i: fix phy-mode
      ARM: dts: imx6qdl-kontron-samx6i: fix PHY reset
      ARM: dts: imx6qdl-kontron-samx6i: fix board reset
      ARM: dts: imx6qdl-kontron-samx6i: cleanup the PMIC node
      ARM: dts: imx6qdl-kontron-samx6i: fix SPI0 chip selects
      ARM: dts: imx6qdl-kontron-samx6i: fix product name
      ARM: dts: imx6qdl-kontron-samx6i: always enable eMMC
      ARM: dts: imx6qdl-kontron-samx6i: add SDIO_PWR_EN support
      ARM: dts: imx6qdl-kontron-samx6i: fix node names
      ARM: dts: imx6qdl-kontron-samx6i: fix PCIe reset polarity
      ARM: dts: imx6qdl-kontron-samx6i: remove wake-up-gpio property
      ARM: dts: imx6qdl-kontron-samx6i: add actual device trees

Rafał Miłecki (1):
      ARM: dts: nxp: imx6: convert NVMEM content to layout syntax

 arch/arm/boot/dts/nxp/imx/Makefile                 |   2 +
 arch/arm/boot/dts/nxp/imx/e60k02.dtsi              |   4 +
 arch/arm/boot/dts/nxp/imx/imx51-apf51dev.dts       |   4 +-
 arch/arm/boot/dts/nxp/imx/imx51-babbage.dts        |   2 +-
 arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts         |   4 +-
 arch/arm/boot/dts/nxp/imx/imx53-m53evk.dts         |   4 +-
 arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts       |   1 +
 arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dts      |  14 +-
 arch/arm/boot/dts/nxp/imx/imx53-tx53-x13x.dts      |   6 +-
 .../boot/dts/nxp/imx/imx6dl-aristainetos2_4.dts    |   5 +-
 .../arm/boot/dts/nxp/imx/imx6dl-aristainetos_4.dts |   4 +-
 .../arm/boot/dts/nxp/imx/imx6dl-aristainetos_7.dts |   4 +-
 .../dts/nxp/imx/imx6dl-kontron-samx6i-ads2.dts     |  12 ++
 .../boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi    |   2 +-
 .../boot/dts/nxp/imx/imx6q-kontron-samx6i-ads2.dts |  12 ++
 .../arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi |  25 +---
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi      |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi      |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi      |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi      |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5903.dtsi      |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi      |   2 +-
 .../dts/nxp/imx/imx6qdl-kontron-samx6i-ads2.dtsi   | 148 +++++++++++++++++++++
 .../boot/dts/nxp/imx/imx6qdl-kontron-samx6i.dtsi   |  58 +++++---
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi       |  12 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi       |  12 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi   |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-lcd.dtsi     |  21 ++-
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-lvds.dtsi    |  20 ++-
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi        |  14 +-
 arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts           |   6 -
 31 files changed, 287 insertions(+), 123 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i-ads2.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i-ads2.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-kontron-samx6i-ads2.dtsi

