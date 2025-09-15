Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8804F2F3C29
	for <imx@lists.linux.dev>; Mon, 15 Sep 2025 13:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757942780; cv=none; b=AZGBHRS17UcO2XlCUlVMVxLglMN/A+hWwSw0vgjG6W4FXSZMk0G+pJ90EYwqBsiIZ/054d4Qa5FDOz+ry4uXa+nTDF+m19XNspS1TnloXejmSbqWXYhQriyziFBm7GlHeFAVf07PBOMZq5oqISEBwi/4yXHlwLfUcDyAHJWu/v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757942780; c=relaxed/simple;
	bh=KXwLwLmTUzey+NkRDbCdsA+DiVCwmpZBIIFhB57NBV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W/518TsC+8yR9J18MV3FwPovmiIzKrLxyRkUjqSGJ+V0iK7rKAfAAvxX8KPX9i85TFUpzXlDxQwY0p7orxo368iorP5TQ2S5IZoqrmeI4O3vJsiCwIKRmIQV1qcMq7VrQSyaBVc7Z6OoZE9Ax/wejJy0eWJZfx1sJocjdnA+t8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=FNHH6hHE; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="FNHH6hHE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=4tdMRdqH0QELiom1TGpU4AYkAg0QP5t7pEZDuQZm0f4=;
	b=FNHH6hHEJVYUfIfhra1ObputCEd1TGSSzp4+teJYw6SaheYSfzPJRkbH6840iB
	DlnLua4P+Ubf04irkcXDifRlGUp8Xg+FrLq5SSm4paPWelv4+ZDhGUAWNmBGxcAW
	ekrY9Beksv1YKmuqacQOkeWmvmOXkx+EGxVZqgRnPGc6o=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDnjyTaE8ho5MiXBA--.47709S3;
	Mon, 15 Sep 2025 21:25:49 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/4] i.MX ARM device tree changes for 6.18
Date: Mon, 15 Sep 2025 21:25:29 +0800
Message-ID: <20250915132535.253859-2-shawnguo2@yeah.net>
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
X-CM-TRANSID:Ms8vCgDnjyTaE8ho5MiXBA--.47709S3
X-Coremail-Antispam: 1Uf129KBjvJXoW3Xw4rtryDWr1DuFyxXr1kZrb_yoWfCrWrp3
	yfZrsrGr4xGr1Sq34UArW0g3s0vw10vF1Fvr15Jay8KF43Za47Zr93twn3try3ZFWrW3Wf
	Kr1kur9rJr1DuaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j9vtAUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIh1IrWjIE921zwAA3O

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-6.18

for you to fetch changes up to c56b0b3c2465aeef72348272d7bec786c27619ad:

  ARM: dts: imx6sll: Use 'dma-names' (2025-09-11 11:32:41 +0800)

----------------------------------------------------------------
i.MX ARM device tree changes for 6.18:

- A series from Alexander Stein to clean up the most of dt-schema warnings
  for LS1021A
- A couple of changes from Bence Csókás to replace license text comment
  with SPDX identifier for imx6-display5 and imx6-aristainetos2 board
- A couple of vfxxx dt-schema cleanups from Fabio Estevam
- A bunch of changes from Frank Li to clean up dt-schema warnings on
  various platforms, VF610, LS1021A, i.MX6, etc.
- Minor whitespace cleanup on i.MX8ULL from Krzysztof Kozlowski
- An imx6ulz-bsh-smm-m2 workaround from Wolfgang Birkner to get resume
  via console work

----------------------------------------------------------------
Alexander Stein (14):
      ARM: dts: ls1021a: Fix gic node unit address
      ARM: dts: ls1021a: Fix qspi node unit address
      ARM: dts: ls1021a: Fix sai DMA order
      ARM: dts: ls1021a: Fix FTM node
      ARM: dts: ls1021a: Add reg property to enet nodes
      ARM: dts: ls1021a: Remove superfluous address and size cells for queue-group
      ARM: dts: ls1021a: remove undocumented 'big-endian' for memory-controller node
      ARM: dts: ls1021a: Fix watchdog node
      ARM: dts: ls1021a: remove property 'snps,host-vbus-glitches'
      ARM: dts: ls1021a: remove undocumented 'big-endian' for memory-controller node
      ARM: dts: ls1021a-tqmals1021a: Remove superfluous address and size cells for qflash
      ARM: dts: ls1021a-tqmals1021a-mbsl1021a: Remove superfluous compatible
      ARM: dts: ls1021a: rename rcpm as wakeup-control from power-control
      ARM: dts: mba6ul: Add MicIn routing

Bence Csókás (3):
      ARM: dts: imx6-display5: Replace license text comment with SPDX identifier
      ARM: dts: imx6-aristainetos2: Replace license text comment with SPDX identifier
      ARM: dts: imx6ul-tx6ul: Switch away from deprecated `phy-reset-gpios`

Fabio Estevam (3):
      ARM: dts: vf: Change the pinctrl node name
      ARM: dts: vf: Change the NAND controller node name
      ARM: dts: imx6sll: Use 'dma-names'

Frank Li (22):
      ARM: dts: vf610: add grp surfix to pinctrl
      ARM: dts: vfxxx: add arm,num-irq-priority-bits for nvic
      ARM: dts: ls1021a: Rename node name nor to flash
      ARM: dts: ls1021a: Rename 'mdio-mux-emi1' to 'mdio-mux@54'
      ARM: dts: ls1021a: Rename esdhc@1560000 to mmc@1560000
      ARM: dts: ls1021a-tsn: Remove redundant #address-cells for ethernet-switch@1
      ARM: dts: imx6: add #address-cells for gsc@20
      ARM: dts: imx6: add key- prefix for gpio-keys
      ARM: dts: imx6: align rtc chip node name to 'rtc'
      ARM: dts: imx6: add interrupt-cells for dlg,da9063 pmic
      ARM: dts: imx6qdl-aristainetos2: rename ethernet-phy to ethernet-phy@0
      ARM: dts: imx6: remove redundant pinctrl-names
      ARM: dts: imx6: rename touch screen's node name to touchscreen
      ARM: dts: imx6: rename node i2c-gpio to i2c.
      ARM: dts: imx6: rename node name flash to eeprom
      ARM: dts: imx6: rename i2c<n>mux i2c-mux-<n>
      ARM: dts: imx6: replace gpio-key with gpio-keys compatible string
      ARM: dts: imx6: replace isl,isl12022 with isil,isl12022 for RTC
      ARM: dts: imx6ul-14x14-evk: add regulator for ov5640
      ARM: dts: imx6ul-pico: add power-supply for vxt,vl050-8048nt-c01
      ARM: dts: imx6: remove undefined linux,default-trigger source
      ARM: dts: imx6: change rtc compatible string to st,m41t00 from m41t00

Krzysztof Kozlowski (1):
      ARM: dts: nxp: imx6ull: Minor whitespace cleanup

Wolfgang Birkner (1):
      ARM: dts: imx6ulz-bsh-smm-m2: fix resume via console

 .../boot/dts/nxp/imx/imx35-eukrea-cpuimx35.dtsi    |  2 +-
 .../boot/dts/nxp/imx/imx51-eukrea-cpuimx51.dtsi    |  2 +-
 arch/arm/boot/dts/nxp/imx/imx53-kp.dtsi            |  4 +-
 arch/arm/boot/dts/nxp/imx/imx53-m53.dtsi           |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-alti6p.dts        |  4 +-
 .../boot/dts/nxp/imx/imx6dl-aristainetos2_4.dts    | 38 +-----------------
 .../boot/dts/nxp/imx/imx6dl-aristainetos2_7.dts    | 38 +-----------------
 arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts        |  1 -
 arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi         |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-riotboard.dts     |  2 -
 arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi          |  2 +
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi        |  2 +-
 .../imx/imx6q-display5-tianma-tm070-1280x768.dts   | 33 +---------------
 arch/arm/boot/dts/nxp/imx/imx6q-display5.dtsi      | 33 +---------------
 arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts    |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-dms-ba16.dts       |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-gw5400-a.dts       |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-h100.dts           |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-kp.dtsi            |  4 +-
 arch/arm/boot/dts/nxp/imx/imx6q-mccmon6.dts        |  2 -
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts         |  4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi      |  4 +-
 .../boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi    | 43 +++------------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi     |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-cubox-i.dtsi     |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi       |  4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw51xx.dtsi      | 13 ++++---
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw52xx.dtsi      | 13 ++++---
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw53xx.dtsi      | 13 ++++---
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi      | 12 +++---
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw551x.dtsi      | 13 ++++---
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw552x.dtsi      | 13 ++++---
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw553x.dtsi      | 13 ++++---
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi      | 11 +++---
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5903.dtsi      | 11 +++---
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5904.dtsi      | 11 +++---
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5907.dtsi      | 13 ++++---
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5910.dtsi      | 11 +++---
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5912.dtsi      | 10 ++---
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5913.dtsi      | 11 +++---
 .../arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi |  1 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi   |  4 +-
 .../boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi    | 16 ++++----
 .../boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi   | 12 +++---
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6x.dtsi  | 12 +++---
 .../nxp/imx/imx6qdl-phytec-mira-peb-eval-01.dtsi   | 10 ++---
 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-rex.dtsi         |  2 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi   | 10 ++---
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi   | 12 +++---
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi     |  6 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-savageboard.dtsi |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-ts7970.dtsi      |  4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi         |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-vicut1.dtsi      |  1 -
 .../boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts    |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi             |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi          |  4 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi    | 25 +++++++++++-
 .../dts/nxp/imx/imx6ul-phytec-segin-peb-av-02.dtsi |  2 +-
 .../nxp/imx/imx6ul-phytec-segin-peb-eval-01.dtsi   |  8 ++--
 arch/arm/boot/dts/nxp/imx/imx6ul-pico.dtsi         |  1 +
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi        | 12 ++++--
 .../boot/dts/nxp/imx/imx6ull-colibri-aster.dtsi    |  2 +-
 .../arm/boot/dts/nxp/imx/imx6ull-colibri-iris.dtsi |  2 +-
 .../dts/nxp/imx/imx6ull-engicam-microgea-rmm.dts   |  2 +-
 .../arm/boot/dts/nxp/imx/imx6ull-phytec-tauri.dtsi |  6 +--
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts   |  4 ++
 arch/arm/boot/dts/nxp/imx/imx7d-nitrogen7.dts      |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7s-warp.dts           |  2 +-
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi             |  7 ++++
 arch/arm/boot/dts/nxp/ls/ls1021a-qds.dts           |  8 ++--
 ...1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso |  2 +-
 ...1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso |  2 +-
 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi   |  2 -
 arch/arm/boot/dts/nxp/ls/ls1021a-tsn.dts           |  2 -
 arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts           |  2 +-
 arch/arm/boot/dts/nxp/ls/ls1021a.dtsi              | 45 ++++++++--------------
 arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-b.dts   |  8 ++--
 arch/arm/boot/dts/nxp/vf/vf610-zii-dev.dtsi        | 14 +++----
 arch/arm/boot/dts/nxp/vf/vf610m4.dtsi              |  4 ++
 arch/arm/boot/dts/nxp/vf/vfxxx.dtsi                |  4 +-
 82 files changed, 271 insertions(+), 407 deletions(-)

