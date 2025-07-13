Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9415778F26
	for <imx@lists.linux.dev>; Sun, 13 Jul 2025 05:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752386119; cv=none; b=aS81zEOhwuyYh90P2QKqU4JC6hX2PLyNASVs/fyK06TWXm+fk7IPZPwxdd1mBYgq9a8FMM3k5kgOjrTgYl1X4FvGwbr44W8geRREPQNqx2vQNZQsSb1K3NvsqlQ5bBtnjXV/n+33lw0L4UAWfTJiR6KpXQt9/UYdFHFgPHbCbcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752386119; c=relaxed/simple;
	bh=WM1s3M4DAL8ef4edBU44pA0HHT5AcEMAL2xFwluL/8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i50XTKxHGNbxekEYlWkoadwKxnJvHHAB8c4x1E3NagnlQwIMm3J+7TqPUOEkIG9Huqk673GBrutqcm3NuEi5cW+yVH9U63IdSI4rojQnPVyCccMSV37wKus5cCe+aAbniizMCAPeWjZylns8imgz50fDENkMEXLuoCEnAISjyQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=LklGH2Rc; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="LklGH2Rc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=65uVdE/VoTyBYsTEgzuRdb+Bqc9FPd5Kw8PkUHPSGoc=;
	b=LklGH2Rc7/GSGBkSYuwjuTyesZoRmQsjtAM+SpBWIHzItkVmj4Xzu522A1oVzw
	OdIeqFDykCAIRy5Ii10MNcwOlAMfJAdoB4X0dThCyjlK7fMgRCyDT41fnoAIM+Oe
	z5635M1p6QJtrRwrjI0XdPXTTKcEw8LzMtvF3b12SPqNs=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDXb50mSnNoHrt9AA--.3344S4;
	Sun, 13 Jul 2025 13:54:49 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/5] i.MX ARM device tree change for 6.17
Date: Sun, 13 Jul 2025 13:54:32 +0800
Message-ID: <20250713055441.221235-3-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250713055441.221235-1-shawnguo2@yeah.net>
References: <20250713055441.221235-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgDXb50mSnNoHrt9AA--.3344S4
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jr43ZF4furyfJr1DJFW8Zwb_yoW3CFy8pa
	4fursxWws7Gr13Kry3JrWqg3s0yw18Zr4Fvrs8Xa48GF43ZFyUZ3savwn3try3XFWrJa1S
	qwn5u3s7J34DuaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j-2-nUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiARuJZWhy+B7xZwAAsc

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-6.17

for you to fetch changes up to b23de67d4b69963f961611ac8e2352488677dd2e:

  ARM: dts: imx6-gw: Replace license text comment with SPDX identifier (2025-07-11 16:23:19 +0800)

----------------------------------------------------------------
i.MX ARM device tree changes for 6.17:

- New device trees for Engicam MicroGEA-MX6UL and i.MX28 Amarula board
- A couple of changes from Bence Csókás to replace license text comment
  with SPDX identifier for Karo and Gateworks boards
- A couple of imx7s-warp updates from Fabio Estevam to improve Bluetooth
  and Wifi description
- A set of dt-schema fixes for VF610 based boards from Frank Li
- A couple of imx6ul-kontron-sl-common changes to add SPI NOR partitions
  and correct QSPI NAND node name
- A few other random improvements

----------------------------------------------------------------
Annette Kobou (1):
      ARM: dts: imx6ul-kontron-bl-common: Fix RTS polarity for RS485 interface

Bence Csókás (2):
      ARM: dts: imx6-karo: Replace license text comment with SPDX identifier
      ARM: dts: imx6-gw: Replace license text comment with SPDX identifier

Dario Binacchi (6):
      ARM: dts: imx28: add pwm7 muxing options
      ARM: dts: mxs: support i.MX28 Amarula rmm board
      ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL SoM
      ARM: dts: imx6ul: support Engicam MicroGEA BMM board
      ARM: dts: imx6ul: support Engicam MicroGEA RMM board
      ARM: dts: imx6ul: support Engicam MicroGEA GTW board

Eberhard Stoll (1):
      ARM: dts: imx6ul-kontron-sl-common: Add SPI NOR partitions

Fabio Estevam (2):
      ARM: dts: imx7s-warp: Improve the Bluetooth description
      ARM: dts: imx7s-warp: Improve the Wifi description

Frank Li (6):
      ARM: dts: vf: remove reg property for arm pmu
      ARM: dts: vf: remove redundant pinctrl-names
      ARM: dts: vf: remove redundant layer under iomux
      ARM: dts: vf: rename io-expander@20 to pinctrl@20
      ARM: dts: vf: vf-colibri-eval-v3: add power-supply for edt,et057090dhu
      ARM: dts: vf: vf610-zii-cfu1: rename node name *-gpio to *-gpios

Frieder Schrempf (1):
      ARM: dts: imx6ul-kontron-sl-common: Fix QSPI NAND node name

Haibo Chen (1):
      ARM: dts: add ngpios for vf610 compatible gpio controllers

Krzysztof Kozlowski (1):
      ARM: dts: vfxxx: Correctly use two tuples for timer address

 arch/arm/boot/dts/nxp/imx/Makefile                 |   3 +
 arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dts      |  38 +--
 arch/arm/boot/dts/nxp/imx/imx53-tx53-x13x.dts      |  44 +--
 arch/arm/boot/dts/nxp/imx/imx53-tx53.dtsi          |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-gw551x.dts        |  44 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-gw553x.dts        |  44 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-gw560x.dts        |  44 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-gw5903.dts        |  44 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-gw5904.dts        |  44 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-tx6dl-comtft.dts  |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034-mb7.dts |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8034.dts     |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8035-mb7.dts |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-tx6s-8035.dts     |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-801x.dts     |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033-mb7.dts |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-8033.dts     |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-80xx-mb7.dts |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-811x.dts     |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-81xx-mb7.dts |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6q-gw551x.dts         |  44 +--
 arch/arm/boot/dts/nxp/imx/imx6q-gw553x.dts         |  44 +--
 arch/arm/boot/dts/nxp/imx/imx6q-gw560x.dts         |  44 +--
 arch/arm/boot/dts/nxp/imx/imx6q-gw5903.dts         |  44 +--
 arch/arm/boot/dts/nxp/imx/imx6q-gw5904.dts         |  44 +--
 .../boot/dts/nxp/imx/imx6q-tx6q-1010-comtft.dts    |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1010.dts      |  38 +--
 .../boot/dts/nxp/imx/imx6q-tx6q-1020-comtft.dts    |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1020.dts      |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1036-mb7.dts  |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1036.dts      |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6q-tx6q-10x0-mb7.dts  |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6q-tx6q-1110.dts      |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6q-tx6q-11x0-mb7.dts  |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi      |  44 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi      |  44 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi      |  44 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5903.dtsi      |  44 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi      |  44 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-lcd.dtsi     |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-lvds.dtsi    |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-mb7.dtsi     |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi         |  38 +--
 .../arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037-mb7.dts |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8037.dts    |  38 +--
 .../arm/boot/dts/nxp/imx/imx6qp-tx6qp-8137-mb7.dts |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6qp-tx6qp-8137.dts    |  38 +--
 .../boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi |   1 -
 .../boot/dts/nxp/imx/imx6ul-kontron-sl-common.dtsi |  25 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0010.dts    |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul-0011.dts    |  38 +--
 .../boot/dts/nxp/imx/imx6ul-tx6ul-mainboard.dts    |  38 +--
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi        |  38 +--
 .../dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts   | 303 +++++++++++++++++
 .../dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts   | 162 ++++++++++
 .../dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts   | 360 +++++++++++++++++++++
 .../boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi |  95 ++++++
 arch/arm/boot/dts/nxp/imx/imx7s-warp.dts           |  49 ++-
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi             |   4 +
 arch/arm/boot/dts/nxp/mxs/Makefile                 |   1 +
 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 300 +++++++++++++++++
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi               |  10 +
 arch/arm/boot/dts/nxp/vf/vf-colibri-eval-v3.dtsi   |  11 +-
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi           | 348 ++++++++++----------
 arch/arm/boot/dts/nxp/vf/vf500-colibri.dtsi        |  44 ++-
 arch/arm/boot/dts/nxp/vf/vf500.dtsi                |  14 +-
 arch/arm/boot/dts/nxp/vf/vf610-bk4.dts             |   2 +-
 arch/arm/boot/dts/nxp/vf/vf610-cosmic.dts          |  60 ++--
 arch/arm/boot/dts/nxp/vf/vf610-twr.dts             | 228 +++++++------
 arch/arm/boot/dts/nxp/vf/vf610-zii-cfu1.dts        |   6 +-
 arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts   |  10 +-
 arch/arm/boot/dts/nxp/vf/vf610-zii-scu4-aib.dts    |  12 +-
 arch/arm/boot/dts/nxp/vf/vf610-zii-spb4.dts        |   4 +-
 arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-dtu.dts    |   6 +-
 arch/arm/boot/dts/nxp/vf/vf610-zii-ssmb-spu3.dts   |   4 +-
 arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dts       |  16 +-
 arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dts        |  12 +-
 arch/arm/boot/dts/nxp/vf/vfxxx.dtsi                |   7 +-
 78 files changed, 1721 insertions(+), 2372 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-gtw.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts

