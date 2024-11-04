Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F01D823AB
	for <imx@lists.linux.dev>; Mon,  4 Nov 2024 09:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730710889; cv=none; b=N5K9h5x7ENtfVBdYYPW2AzM5TkZo7TFH/GTmVGbN/TdsUo7UYvDkffjfkdsT2EJW1cBcNSRc3Z0VyJdeERgPZI0nxhKoBriwj+bUcX+mCfCtMLSFjIuzUaKT1vaBBTvq89cAKl6D4dbaKJ02Z6ysZhPg1p0lCIWL2JuysQXOfTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730710889; c=relaxed/simple;
	bh=LQHQFSm1/1RTmg5dk42v6DO+KNrjt785fR3OilF/xPo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SGesbwbdu8oPkeKIA6Xoo9ggqE2njWQoLvOhuWNmhPrUc7U6mfvzTc72qaK2mk0DnmIF3ZlU+b2iR8l2alI77fwDHoNIekNc4rcPN5KXhDlseaieamiTrIeKFP7yGm3atJwMagFEYaK/jmMk/FwL1572S+6ccz15nxSca16/g7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=IfwQ3YDK; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="IfwQ3YDK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=CmHXE
	PbIW64zlXlGyFqu8hz7xr4H9/FCSxzLzFSsrTA=; b=IfwQ3YDKDkeQC7M1zOSuu
	MFd8I8gm2K9AEyCnltD0Rq49wlrz+Oq40SxFTwjtx0COi2vGzuwjvakeOCXIsutq
	TPoTaUqvvUnAZ5n42bildf9+0a3uo3ViDKzG1SVjTCpLrwdvjQkSxmBpn5nsnqic
	c8tfH1+tLd2ACqCJbVnjGk=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBXD75LjShnSBmkAQ--.16437S5;
	Mon, 04 Nov 2024 17:01:02 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] i.MX ARM device tree changes for 6.13
Date: Mon,  4 Nov 2024 17:00:53 +0800
Message-Id: <20241104090055.1881860-4-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241104090055.1881860-1-shawnguo2@yeah.net>
References: <20241104090055.1881860-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgBXD75LjShnSBmkAQ--.16437S5
X-Coremail-Antispam: 1Uf129KBjvAXoW3uF48WF1kCFykKryDJFW3trb_yoW8Jr1UAo
	Z3Ca1Fvryvkr4UZ3y5ZF1rG39YqFyDGF17Wa4DXr1fGw4xZF9xAFyY934q9w15ZryfWr1D
	ua1UKFW5Ar1DtrZ7n29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4L05UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhSNZWcog7shqAAAsQ

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-6.13

for you to fetch changes up to 4de1651cde04eac0bfce834d0a4f75e043a45230:

  ARM: dts: imx: Add devicetree for Kobo Clara 2E (2024-11-04 15:15:41 +0800)

----------------------------------------------------------------
i.MX ARM device tree changes for 6.13:

- New device support: Kobo Clara 2E, Comvetia LXR board, i.MX6DL DHCOM
  SoM on PDK2 carrier
- A bunch of dt-schema warning fixes from Fabio Estevam
- A set of changes from Hiago De Franco to update audio card for Apalis
  and Colibri devices
- A series from Marek Vasut to improve pin config nodes according to
  bindings
- A couple of changes from Sean Nyekjaer to add DMA support i.MX6UL
  UART ports
- Other small and random changes

----------------------------------------------------------------
Alexander Stein (1):
      ARM: dts: imx6qdl-mba6: Add reserved memory area for CMA memory

Andreas Kemnade (2):
      ARM: dts: imx6sll: fix anatop thermal dtbs_check warnings
      ARM: dts: imx: Add devicetree for Kobo Clara 2E

Fabio Estevam (13):
      ARM: dts: imx28-apx4devkit: Fix the rtc compatible
      ARM: dts: imx6q-lxr: Add board support
      ARM: dts: imx6qdl-tx6: Remove 'turn-on-delay-ms'
      ARM: dts: imx6qdl-tx6: Fix 'fixed-clock' description
      ARM: dts: imx6sl/sll: Add the "fsl,imx6dl-gpt" fallback
      ARM: dts: imx6sx: Remove incorrect mmc fallback compatible
      ARM: dts: imx6sl: Remove incorrect mmc fallback compatible
      ARM: dts: imx7ulp: Remove incorrect mmc fallback compatible
      ARM: dts: imx6sll: Fix the last SPDIF clock name
      ARM: dts: imx6sll: Remove regulator-3p0 unit address
      ARM: dts: imx6sx: Fix tempmon description
      ARM: dts: imx6sl: Pass tempmon #thermal-sensor-cells
      ARM: dts: imx6sll: Improve gpc description

Hiago De Franco (3):
      ARM: dts: imx6qdl-apalis: Update audio card name
      ARM: dts: imx6qdl-colibri: Update audio card name
      ARM: dts: imx7-colibri: Update audio card name

Marek Vasut (16):
      ARM: dts: imx6qdl-dhcom: Fix model typo for i.MX6 DHSOM
      ARM: dts: imx6qdl-dhcom-som: Drop bogus regulator-suspend-mem-microvolt
      ARM: dts: imx6qdl-dhcom-pdk2: Drop incorrect size-cells in GPIO keys
      ARM: dts: imx6qdl-dhcom-pdk2: Fill in missing panel power-supply
      ARM: dts: imx6dl: Add support for i.MX6DL DHCOM SoM on PDK2 carrier board
      ARM: dts: imx35: Align pin config nodes with bindings
      ARM: dts: imx50: Align pin config nodes with bindings
      ARM: dts: imx51: Align pin config nodes with bindings
      ARM: dts: imx53: Align pin config nodes with bindings
      ARM: dts: imx6dl: Align pin config nodes with bindings
      ARM: dts: imx6q: Align pin config nodes with bindings
      ARM: dts: imx6qdl: Align pin config nodes with bindings
      ARM: dts: imx6qp: Align pin config nodes with bindings
      ARM: dts: imx6sl: imx6sll: Align pin config nodes with bindings
      ARM: dts: imx6sx: Align pin config nodes with bindings
      ARM: dts: imx6ul: Drop duplicate space in iomux node groups

Sean Nyekjaer (2):
      ARM: dts: nxp: imx6ul: add dma support for all uarts
      ARM: dts: nxp: imx6ull: add dma support for uart8

Xu Yang (2):
      ARM: dts: imx7ulp: add "nxp,sim" property for usbphy1
      ARM: dts: imx6qdl: convert fsl,tx-d-cal to correct value

 arch/arm/boot/dts/nxp/imx/Makefile                 |   4 +
 .../boot/dts/nxp/imx/imx35-eukrea-cpuimx35.dtsi    |  62 ++-
 .../nxp/imx/imx35-eukrea-mbimxsd35-baseboard.dts   |  88 ++--
 arch/arm/boot/dts/nxp/imx/imx35-pdk.dts            |  38 +-
 arch/arm/boot/dts/nxp/imx/imx35.dtsi               |   2 +-
 arch/arm/boot/dts/nxp/imx/imx50-evk.dts            |  62 ++-
 arch/arm/boot/dts/nxp/imx/imx50.dtsi               |   2 +-
 arch/arm/boot/dts/nxp/imx/imx51-apf51.dts          |  56 +-
 arch/arm/boot/dts/nxp/imx/imx51-apf51dev.dts       | 176 ++++---
 arch/arm/boot/dts/nxp/imx/imx51-babbage.dts        | 438 ++++++++--------
 .../dts/nxp/imx/imx51-digi-connectcore-jsk.dts     |  78 ++-
 .../dts/nxp/imx/imx51-digi-connectcore-som.dtsi    | 292 ++++++-----
 .../boot/dts/nxp/imx/imx51-eukrea-cpuimx51.dtsi    |  68 ++-
 .../nxp/imx/imx51-eukrea-mbimxsd51-baseboard.dts   | 192 ++++---
 arch/arm/boot/dts/nxp/imx/imx51.dtsi               |   2 +-
 arch/arm/boot/dts/nxp/imx/imx53-ard.dts            | 116 ++---
 arch/arm/boot/dts/nxp/imx/imx53-kp-ddc.dts         |  62 ++-
 arch/arm/boot/dts/nxp/imx/imx53-kp.dtsi            |  90 ++--
 arch/arm/boot/dts/nxp/imx/imx53-m53.dtsi           |  64 ++-
 arch/arm/boot/dts/nxp/imx/imx53-m53evk.dts         | 268 +++++-----
 arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts       | 320 ++++++------
 arch/arm/boot/dts/nxp/imx/imx53-mba53.dts          | 114 ++--
 arch/arm/boot/dts/nxp/imx/imx53-qsb-common.dtsi    | 274 +++++-----
 arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts           |  10 +-
 arch/arm/boot/dts/nxp/imx/imx53-smd.dts            | 242 +++++----
 arch/arm/boot/dts/nxp/imx/imx53-tqma53.dtsi        | 274 +++++-----
 arch/arm/boot/dts/nxp/imx/imx53-tx53-x03x.dts      | 112 ++--
 arch/arm/boot/dts/nxp/imx/imx53-tx53-x13x.dts      |  62 ++-
 arch/arm/boot/dts/nxp/imx/imx53-tx53.dtsi          | 460 +++++++++--------
 arch/arm/boot/dts/nxp/imx/imx53-voipac-bsb.dts     | 110 ++--
 .../arm/boot/dts/nxp/imx/imx53-voipac-dmm-668.dtsi | 124 +++--
 arch/arm/boot/dts/nxp/imx/imx53.dtsi               |   2 +-
 .../boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi   |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-aster.dts |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dts    |  20 +
 arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-picoitx.dts |   2 +-
 .../boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts   |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts         |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts        |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-prtrvt.dts        |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts        |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi         | 446 ++++++++--------
 arch/arm/boot/dts/nxp/imx/imx6dl-riotboard.dts     | 360 +++++++------
 arch/arm/boot/dts/nxp/imx/imx6dl-tx6dl-comtft.dts  |   1 -
 arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi |   4 +-
 .../arm/boot/dts/nxp/imx/imx6dl-yapp43-common.dtsi |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6q-arm2.dts           | 198 ++++---
 arch/arm/boot/dts/nxp/imx/imx6q-ba16.dtsi          |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-dhcom-pdk2.dts     |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts    | 232 +++++----
 arch/arm/boot/dts/nxp/imx/imx6q-gk802.dts          |  92 ++--
 arch/arm/boot/dts/nxp/imx/imx6q-h100.dts           | 200 ++++---
 arch/arm/boot/dts/nxp/imx/imx6q-logicpd.dts        |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6q-lxr.dts            |  87 ++++
 arch/arm/boot/dts/nxp/imx/imx6q-mba6.dtsi          |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts         |  48 +-
 arch/arm/boot/dts/nxp/imx/imx6q-prti6q.dts         |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-prtwd2.dts         |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6q-sbc6x.dts          |  82 ++-
 .../boot/dts/nxp/imx/imx6q-tx6q-1010-comtft.dts    |   1 -
 .../boot/dts/nxp/imx/imx6q-tx6q-1020-comtft.dts    |   1 -
 arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts    |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi      |   2 +-
 .../arm/boot/dts/nxp/imx/imx6qdl-aristainetos.dtsi | 428 ++++++++-------
 .../boot/dts/nxp/imx/imx6qdl-aristainetos2.dtsi    |   6 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi     |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-cubox-i.dtsi     | 136 +++--
 .../boot/dts/nxp/imx/imx6qdl-dfi-fs700-m60.dtsi    | 192 ++++---
 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2.dtsi  |  21 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-som.dtsi   |   2 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-ds.dtsi          |   6 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-emcon.dtsi       |  39 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw54xx.dtsi      |   4 +-
 .../arm/boot/dts/nxp/imx/imx6qdl-hummingboard.dtsi | 160 +++---
 .../dts/nxp/imx/imx6qdl-hummingboard2-emmc.dtsi    |  30 +-
 .../boot/dts/nxp/imx/imx6qdl-hummingboard2.dtsi    | 456 ++++++++--------
 .../boot/dts/nxp/imx/imx6qdl-kontron-samx6i.dtsi   |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi        |  14 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi   | 354 +++++++------
 .../boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi    | 506 +++++++++---------
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6x.dtsi  | 406 ++++++++-------
 .../nxp/imx/imx6qdl-phytec-mira-peb-wlbt-05.dtsi   |   4 +-
 .../boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi    | 292 ++++++-----
 arch/arm/boot/dts/nxp/imx/imx6qdl-rex.dtsi         | 274 +++++-----
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabreauto.dtsi   | 554 ++++++++++----------
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi   | 428 ++++++++-------
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi     | 430 ++++++++--------
 arch/arm/boot/dts/nxp/imx/imx6qdl-solidsense.dtsi  |  78 ++-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-brcm.dtsi |  86 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-emmc.dtsi |  30 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som-ti.dtsi   |  88 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-sr-som.dtsi      |  96 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-ts7970.dtsi      |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-lcd.dtsi     |   1 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-mb7.dtsi     |   2 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi         |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-udoo.dtsi        | 224 ++++----
 arch/arm/boot/dts/nxp/imx/imx6qdl-var-dart.dtsi    |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi     |   4 +-
 .../boot/dts/nxp/imx/imx6qdl-wandboard-revb1.dtsi  |  30 +-
 .../boot/dts/nxp/imx/imx6qdl-wandboard-revc1.dtsi  |  32 +-
 .../boot/dts/nxp/imx/imx6qdl-wandboard-revd1.dtsi  |  78 ++-
 arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi   | 247 +++++----
 arch/arm/boot/dts/nxp/imx/imx6qp-prtwd3.dts        |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6qp-sabreauto.dts     |  40 +-
 arch/arm/boot/dts/nxp/imx/imx6qp-sabresd.dts       |  58 +--
 arch/arm/boot/dts/nxp/imx/imx6s-dhcom-drc02.dts    |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6sl-evk.dts           | 480 +++++++++--------
 .../boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts    |  16 +-
 arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine3.dts |  16 +-
 .../arm/boot/dts/nxp/imx/imx6sl-tolino-vision5.dts |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6sl-warp.dts          | 208 ++++----
 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi              |  11 +-
 arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts          |  12 +-
 .../boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dts    |  23 +
 .../boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dts    |  23 +
 .../dts/nxp/imx/imx6sll-kobo-clara2e-common.dtsi   | 511 ++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts |  16 +-
 .../arm/boot/dts/nxp/imx/imx6sll-kobo-librah2o.dts |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi             |  24 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-sabreauto.dts     |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi          | 572 ++++++++++-----------
 .../dts/nxp/imx/imx6sx-softing-vining-2000.dts     |  18 +-
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi              |  11 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi        |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul.dtsi              |  16 +
 arch/arm/boot/dts/nxp/imx/imx6ull.dtsi             |   2 +
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi        |   2 +-
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi             |   5 +-
 arch/arm/boot/dts/nxp/mxs/imx28-apx4devkit.dts     |   2 +-
 130 files changed, 7253 insertions(+), 6664 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-dhcom-pdk2.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-lxr.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-a.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-b.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clara2e-common.dtsi

