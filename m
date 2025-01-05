Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476EA145335
	for <imx@lists.linux.dev>; Sun,  5 Jan 2025 09:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736070735; cv=none; b=O+pjTixcU0nxRIEshY7BeR1E3657Cv286uXYqe3lzifwyzm2dTzb//r+DkUmcELBTBlU4z11mR91ON2+uxXR9evbT/0ksRNjGr8lfsEP0FBSDWYi1ChVYhws27Okm/i3lUNKyHmNkoRMJUw7JspMyZ4O/rSDJGV/IumCgey+TA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736070735; c=relaxed/simple;
	bh=JZLfAPPMCzeDdu4qlLJczPxua5AN2Svan7ndi5hadeY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R4jq8rbVi+DKHdGhkt3qi2gweakEVX/CQPvNupghcAZHk2xmsbMlJoKP2wO4+hXwmkhvTm382UTdrMRMuzldo0E/72CqQNx8oqqgHgsRWB546cTxfqr3ozUzi29vfGo2h8M0h80n/ifXqyhVd9EmGbryAdyFTWBd5SjaKsyfbSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=NKsrhu9D; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="NKsrhu9D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Irbm6
	VfXAI9JkqQJkfYYSPhkzCdRNt1ZTBLO5TrSmYo=; b=NKsrhu9D0M9m5idwyE84s
	QNWN2gIbNqbcOfbYhAkYnig53zcfE+v3yb3kxkgYC4yAemz6OmjX4W/DCpZZPP0e
	zMH/idLF/HfXlLjI7ZGCTP9izzId/snlroJJ5+ow0GYpSDGjpiPr33V/TsWWDEZw
	wevS3PCiR8xV/9Zqg04DJs=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBXGWwuVnpnZZRPBg--.62165S5;
	Sun, 05 Jan 2025 17:51:45 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/5] i.MX arm64 device tree change for 6.14
Date: Sun,  5 Jan 2025 17:51:37 +0800
Message-Id: <20250105095139.714590-4-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250105095139.714590-1-shawnguo2@yeah.net>
References: <20250105095139.714590-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgBXGWwuVnpnZZRPBg--.62165S5
X-Coremail-Antispam: 1Uf129KBjvJXoW3Xr4Utr17Gw4rGrWrZr18Xwb_yoW7Zry3pa
	43urW3Gr17GFW8Cr9xW3Wvq3s8tw45JF45Cr17WrWxKrW5AFyqqF1rKr1fury2vryxZw4F
	y3W8Jry7Grn8ZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j7BMNUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERPLZWd6RRkrYQAAsn

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-6.14

for you to fetch changes up to bd38fa3aaaceb371cf92f115c905579024b9feac:

  arm64: dts: freescale: imx93-9x9-qsb: enable fsl,ext-reset-output for wdog3 (2024-12-30 16:31:58 +0800)

----------------------------------------------------------------
i.MX arm64 device tree change for 6.14:

- Add simple-framebuffer support for imx8mn-bsh-smm-s2/pro board
  (Dario Binacchi)
- Add LVDS compatible string for imx8mm-phg board (Fabio Estevam)
- Add P3T1085 temperature sensor support for imx93-9x9-qsb board (Frank Li)
- Add support for i.MX8MP based aristainetos3 boards from ABB
  (Heiko Schocher)
- Add PCA9452 system PMIC support for imx93-14x14-evk board (Joy Zou)
- Support NXP LVDS to HDMI adapter cards for imx8mp-evk board with DT
  overlays (Liu Ying)
- A couple of changes from Markus Niebel to enable Open Drain for MDIO
  on imx93-tqma9352 boards
- A series from Peng Fan to enable wdog3 fsl,ext-reset-output support
  for NXP i.MX93 boards
- A couple changes from Wei Fang to add NETC support for i.MX95

----------------------------------------------------------------
Dario Binacchi (1):
      arm64: dts: imx8mn-bsh-smm-s2/pro: add simple-framebuffer

Fabio Estevam (1):
      arm64: dts: imx8mm-phg: Add LVDS compatible string

Frank Li (2):
      arm64: dts: imx8mq-zii-ultra: remove #address-cells of eeprom@a4
      arm64: dts: imx93-9x9-qsb: add temp-sensor nxp,p3t1085

Geert Uytterhoeven (1):
      arm64: dts: imx: Switch to simple-audio-card,hp-det-gpios

Heiko Schocher (1):
      arm64: dts: imx8mp: add aristainetos3 board support

Joy Zou (1):
      arm64: dts: imx93: add pca9452 support

Liu Ying (2):
      arm64: dts: imx8mp-skov-revb-mi1010ait-1cp1: Set "media_disp2_pix" clock rate to 70MHz
      arm64: dts: imx8mp-evk: Add NXP LVDS to HDMI adapter cards

Markus Niebel (2):
      arm64: dts: imx93-tqma9352-mba93xxca: enable Open Drain for MDIO
      arm64: dts: imx93-tqma9352-mba93xxla: enable Open Drain for MDIO

Peng Fan (3):
      arm64: dts: freescale: imx93-11x11-evk: enable fsl,ext-reset-output for wdog3
      arm64: dts: freescale: imx93-14x14-evk: enable fsl,ext-reset-output for wdog3
      arm64: dts: freescale: imx93-9x9-qsb: enable fsl,ext-reset-output for wdog3

Wei Fang (2):
      arm64: dts: imx95: add NETC related nodes
      arm64: dts: imx95-19x19-evk: add ENETC 0 support

 arch/arm64/boot/dts/freescale/Makefile             |   13 +
 arch/arm64/boot/dts/freescale/imx8mm-phg.dts       |    2 +-
 .../dts/freescale/imx8mn-bsh-smm-s2-display.dtsi   |   28 +
 .../freescale/imx8mp-aristainetos3-adpismarc.dts   |   37 +
 .../imx8mp-aristainetos3-helios-lvds.dtso          |  113 ++
 .../dts/freescale/imx8mp-aristainetos3-helios.dts  |   98 ++
 .../freescale/imx8mp-aristainetos3-proton2s.dts    |  161 +++
 .../freescale/imx8mp-aristainetos3a-som-v1.dtsi    | 1107 ++++++++++++++++++++
 .../freescale/imx8mp-evk-imx-lvds-hdmi-common.dtsi |   29 +
 .../imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso  |   44 +
 .../imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi     |   43 +
 .../freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtso  |   28 +
 .../imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso  |   44 +
 .../imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi     |   43 +
 .../freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtso  |   28 +
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |    6 +
 .../freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts  |    8 +-
 .../boot/dts/freescale/imx8mq-librem5-devkit.dts   |    2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |    2 +-
 .../arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi |    2 -
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts  |    8 +
 arch/arm64/boot/dts/freescale/imx93-14x14-evk.dts  |   92 ++
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    |   14 +
 .../dts/freescale/imx93-tqma9352-mba93xxca.dts     |    8 +-
 .../dts/freescale/imx93-tqma9352-mba93xxla.dts     |    8 +-
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  |   52 +
 arch/arm64/boot/dts/freescale/imx95.dtsi           |   93 ++
 27 files changed, 2096 insertions(+), 17 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aristainetos3a-som-v1.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtso

