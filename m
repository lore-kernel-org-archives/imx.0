Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 134666A353
	for <imx@lists.linux.dev>; Sun, 28 Apr 2024 12:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714306401; cv=none; b=Kw4cxGDHBDMUjlinbwTWAjysFBsIGSAfjUraKkzICeIa3jZNgenkimHpB2WC/yhJM0e/VojsJbuTH8/VSSXOYdhe2IbGT7fmLjY+BwDOumdwEfxacLXUIA6sfvXhgHpCuL0bomo4BBdoVkmhPxIPRhLnkr0HlNn5AsRO/AHeoT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714306401; c=relaxed/simple;
	bh=tp5Gy8mM9tlsA0asA10kWkevTFCuZjHRwRmKQa/XbPQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dR/peJQdCnOt0Y9KUBzEP17ueve2x7FsXPrgFlvu4M9cEioZYHWF67smVn/kdLvcNwYoyBWz1/lZuxwrzxwXV3O/FBGXO/mPZsQ3sAN2Y9N405KV+K2PlL/eg0yta+2nulhfk4zObudNLvJzC2ftqSuhRkZXj5qiqTuVjeQI5zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=p3w5sESd; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="p3w5sESd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=xq4mqDRxHLFlUuScYThP1TGPHrncl/xeG/DuKQgqljA=;
	b=p3w5sESdR14/55gLXquy/p3wJJC0r6c1S8tnmWhZ+G2kxLh2PkUKTj4A2EMCyT
	BMFtTyoz7BTM6nKZEQYdJFB9rnocTNBQmkim/ZLAI8lADB5YXMEf+sA5Gqj5M30u
	P86LQ0EH8zPlcFjmOoe6UEkhyZp/HSyDnxDgJ67dMfvW4=
Received: from localhost.localdomain (unknown [114.216.210.46])
	by smtp1 (Coremail) with SMTP id ClUQrAD3v19HPS5mcJTNAw--.22534S4;
	Sun, 28 Apr 2024 20:12:57 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/5] i.MX ARM device tree for 6.10
Date: Sun, 28 Apr 2024 20:12:45 +0800
Message-Id: <20240428121247.10370-3-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240428121247.10370-1-shawnguo2@yeah.net>
References: <20240428121247.10370-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:ClUQrAD3v19HPS5mcJTNAw--.22534S4
X-Coremail-Antispam: 1Uf129KBjvJXoW3Cw1xAw1kWF1UWFWUWw1Utrb_yoWDCw4xpa
	4S9393tFs7GryIkrZ8X340y390vw1UAr1xur15GFW8KFW3ZFy7Wr9agwn3t345XFn5Xa4a
	gr1kur9rXw1DGaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jDhL8UUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBQnOZVsVCgSGJwAAsG

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-6.10

for you to fetch changes up to 68313ee6961ca59a77c164a55cc352cc8bbfa6ec:

  ARM: dts: imx6ul-pico: Use #pwm-cells = <3> for imx27-pwm device (2024-04-28 15:56:17 +0800)

----------------------------------------------------------------
i.MX ARM device tree for 6.10:

- New board support: Seeed Studio NPi dev board, UNI-T UTi260B thermal
  camera board.
- A couple of IRQ config correction for touchscreen and RC5T619 on
  tolino-shine2hd device.
- Add snvs-poweroff support for i.MX7.
- A couple of dtb_check warning fixes on i.MX6SX and i.MX6QDL ESAI.
- Enable USB support for imx6qdl-udoo and imx27-phytec.
- A big series from Uwe Kleine-König to adopt #pwm-cells = <3> for i.MX
  devices.
- Other small changes and clean-ups.

----------------------------------------------------------------
Alexander Stein (2):
      ARM: dts: imx6qdl: mba6: Add missing vdd-supply for on-board USB hub
      ARM: dts: imx6qdl: Remove LCD.CONTRAST pinctrl from muxing

Andreas Kemnade (2):
      ARM: dts: imx6sl: tolino-shine2hd: fix IRQ config of touchscreen
      ARM: dts: imx6: fix IRQ config of RC5T619

Fabio Estevam (2):
      ARM: dts: imx7s: Add snvs-poweroff support
      ARM: dts: imx6qdl-udoo: Enable USB host

Frank Li (2):
      ARM: dts: nxp: imx6sx: fix esai related warning when do dtb_check
      ARM: dts: nxp: imx6qdl: fix esai clock warning when do dtb_check

Michael Grzeschik (1):
      ARM: dts: imx27-phytec: Add USB support

Parthiban Nallathambi (1):
      ARM: dts: imx6ull: add seeed studio NPi dev board

Sebastian Reichel (1):
      ARM: dts: imx: Add UNI-T UTi260B thermal camera board

Shengjiu Wang (2):
      ARM: dts: imx6sx-nitrogen6sx: drop incorrect cpu-dai property
      ARM: dts: imx6: exchange fallback and specific compatible string

Stefan Wahren (1):
      ARM: dts: imx6ull-tarragon: Reduce SPI clock for QCA7000

Uwe Kleine-König (49):
      ARM: dts: imx51-ts4800: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx53-m53evk: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx53-ppd: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx53-kp: Drop redundant settings in pwm nodes
      ARM: dts: imx53-tqma: Use #pwm-cells = <3> for imx27-pwm devices
      ARM: dts: imx6dl-aristainetos_4: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6dl-aristainetos_7: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6dl-mamoj: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6q-ba16: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6q-bosch-acc: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6qdl-apf6dev: Use #pwm-cells = <3> for imx27-pwm devices
      ARM: dts: imx6qdl-aristainetos2: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6qdl-cubox-i: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6qdl-emcon: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6qdl-gw52xx: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6qdl-gw53xx: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6qdl-gw54xx: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6qdl-gw560x: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6qdl-gw5903: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6qdl-gw5904: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6qdl-icore: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6qdl-nit6xlite: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6qdl-nitrogen6_max: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6qdl-nitrogen6_som2: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6qdl-nitrogen6x: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6qdl-phytec-mira: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6qdl-sabreauto: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6qdl-sabrelite: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6qdl-sabresd: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6qdl-savageboard: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6qdl-skov-cpu: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6q-kp: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6q-novena: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6q-pistachio: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6q-prti6q: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6q-var-dt6customboard: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6sl-evk: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6sll-evk: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6sx-nitrogen6sx: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6sx-sdb: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6sx-softing-vining-2000: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6ul-14x14-evk: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6ul-ccimx6ulsbcpro: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6ul-geam: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6ul-imx6ull-opos6uldev: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6ul-isiot: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6ul-kontron-bl-43: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6ul-kontron-bl-common: Use #pwm-cells = <3> for imx27-pwm device
      ARM: dts: imx6ul-pico: Use #pwm-cells = <3> for imx27-pwm device

Xu Yang (1):
      ARM: dts: imx6: remove fsl,anatop property from usb controller node

 arch/arm/boot/dts/nxp/imx/Makefile                 |   3 +
 arch/arm/boot/dts/nxp/imx/e60k02.dtsi              |   2 +-
 arch/arm/boot/dts/nxp/imx/e70k02.dtsi              |   2 +-
 .../dts/nxp/imx/imx27-phytec-phycard-s-som.dtsi    |  78 +++
 arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts         |   3 +-
 arch/arm/boot/dts/nxp/imx/imx53-kp-ddc.dts         |   2 +-
 arch/arm/boot/dts/nxp/imx/imx53-kp.dtsi            |  10 +-
 arch/arm/boot/dts/nxp/imx/imx53-m53evk.dts         |   3 +-
 arch/arm/boot/dts/nxp/imx/imx53-mba53.dts          |   2 +-
 arch/arm/boot/dts/nxp/imx/imx53-ppd.dts            |   6 +-
 arch/arm/boot/dts/nxp/imx/imx53-tqma53.dtsi        |   8 -
 .../arm/boot/dts/nxp/imx/imx6dl-aristainetos_4.dts |   3 +-
 .../arm/boot/dts/nxp/imx/imx6dl-aristainetos_7.dts |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts         |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi          |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts      |  10 +-
 arch/arm/boot/dts/nxp/imx/imx6q-kp.dtsi            |   6 +-
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts         |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6q-pistachio.dts      |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6q-prti6q.dts         |   3 +-
 .../boot/dts/nxp/imx/imx6q-var-dt6customboard.dts  |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-apf6dev.dtsi     |   3 +-
 .../boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi    |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-cubox-i.dtsi     |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi       |   9 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi      |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi      |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi      |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi      |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5903.dtsi      |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi      |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi       |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi        |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi   |   6 +-
 .../boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi    |   9 +-
 .../boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi   |   6 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6x.dtsi  |   6 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi   |   7 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi   |   9 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi     |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-savageboard.dtsi |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi    |   1 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-udoo.dtsi        |  25 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi             |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts           |   4 +-
 .../boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts    |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts          |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi             |   1 -
 arch/arm/boot/dts/nxp/imx/imx6sx-nitrogen6sx.dts   |   6 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi          |   8 +-
 .../dts/nxp/imx/imx6sx-softing-vining-2000.dts     |  12 +-
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi              |   7 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi    |   3 +-
 .../arm/boot/dts/nxp/imx/imx6ul-ccimx6ulsbcpro.dts |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts          |   3 +-
 .../dts/nxp/imx/imx6ul-imx6ull-opos6uldev.dtsi     |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi        |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-kontron-bl-43.dts |   3 +-
 .../boot/dts/nxp/imx/imx6ul-kontron-bl-common.dtsi |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-pico.dtsi         |   3 +-
 .../nxp/imx/imx6ull-seeed-npi-dev-board-emmc.dts   |  19 +
 .../nxp/imx/imx6ull-seeed-npi-dev-board-nand.dts   |  19 +
 .../dts/nxp/imx/imx6ull-seeed-npi-dev-board.dtsi   | 424 +++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6ull-seeed-npi.dtsi   | 155 ++++++
 .../boot/dts/nxp/imx/imx6ull-tarragon-master.dts   |   4 +-
 .../boot/dts/nxp/imx/imx6ull-tarragon-slave.dts    |   2 +-
 .../boot/dts/nxp/imx/imx6ull-tarragon-slavext.dts  |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6ull-uti260b.dts      | 566 +++++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi               |   9 +
 70 files changed, 1366 insertions(+), 186 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-seeed-npi-dev-board-emmc.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-seeed-npi-dev-board-nand.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-seeed-npi-dev-board.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-seeed-npi.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-uti260b.dts

