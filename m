Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CBE91F541E
	for <imx@lists.linux.dev>; Wed, 12 Mar 2025 07:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741765263; cv=none; b=lKzP+MQbpgUI3+8pHT9L6VpDXNvlQdKSIgESsTgZI015nOzsZM+jxwVi7D4GjH61lweTn0ajcQxM/FBEDXSkNSTaAB/HPE7cvZYp9RP+jJZcJLjZPvb2TV1lyKRI/qT2tVQilKR/GE/eOyW+KWWSCYq1FFqEZTe8U2W9KV93hJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741765263; c=relaxed/simple;
	bh=4nvS7dRyv/387qRi27wK+ra0AvCXg+OhnGQ4t3534j0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PyqnR2NDokA36Mv3NYUJBphEOXlsn0XDsFYSSyidgbrlNybUEysgfao3dvbpN79dnmqDWlBnmacVbE/lVZoTdQhUvMYN5w1uc+hp54Z0ReCjw5wPLNKu017Jk+4KMFObyOcqlVYb7DiXVS5vXqwL/Jto4corGEBFh0dBHM83I+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=UF9CXpkg; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="UF9CXpkg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=tkkCK
	sKh/UBLJXGmcNKAUnu7X2uUkZ7nN1RHhS9lQiI=; b=UF9CXpkgHiOcl1Gt5AVNw
	wArJ6q/yjwGJoAGbLWiX5TNsCb8grxL3BBoYVNfUZo8sB/L7vVfhbWRzAtWnIisx
	dVpSj4s11CFcRknJiCYMoXPqGTdeN9m3hTh+GxBST2h3sZP4FJtTuoO/jrMIs89h
	w6fxThEPwEkXFBwhv09swo=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAnwdRtOtFnQ6_FAA--.2767S5;
	Wed, 12 Mar 2025 15:40:32 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/5] i.MX ARM device tree changes for 6.15
Date: Wed, 12 Mar 2025 15:40:04 +0800
Message-Id: <20250312074005.663165-4-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312074005.663165-1-shawnguo2@yeah.net>
References: <20250312074005.663165-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Ms8vCgAnwdRtOtFnQ6_FAA--.2767S5
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jr4xAFy8WFWkZryrWr48WFg_yoWxtFy3pw
	13urs3GFs7Gr1xK3srA34UK3s8Aa4UZrs5Zr15Jay8GFW3Za47Ar9aywn3t343ZFZ5Zw1S
	qr1kur9rGFyUuaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jwtxDUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCxcOZWfRB3jvOgABsq

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-6.15

for you to fetch changes up to 082f59a62474fbffe7e952082f6d265f11bc37a0:

  ARM: dts: apalis/colibri-imx6: Add support for v1.2 (2025-03-11 11:40:10 +0800)

----------------------------------------------------------------
i.MX ARM device tree changes for 6.15:

- New boards support: Variscite VAR-SOM-MX6UL SoM/Concerto, i.MX6
  apalis/colibri v1.2, i.MX28 based btt3
- A bunch of TQMa6/7 cleanups from Alexander Stein and Markus Niebel,
  ordering DT properties, correcting 3.3V supply, adding partitions
  child node to spi-nor, etc.
- A bunch of changes from Fabio Estevam to fix dt-schema warnings on
  various boards
- Other small and random changes

----------------------------------------------------------------
Alexander Stein (5):
      ARM: dts: imx7s: Move csi-mux to below root
      ARM: dts: imx6qdl-tqma6: Order DT properties
      ARM: dts: imx6ul-tqma6ul: Order DT properties
      ARM: dts: imx6ul-tqma6ul: Add vcc-supply for spi-nor
      ARM: dts: imx7-tqma7: Add vcc-supply for spi-nor

Antonin Godard (2):
      ARM: dts: imx6ul: Add Variscite VAR-SOM-MX6UL SoM support
      ARM: dts: imx6ul: Add Variscite Concerto board support

Chancel Liu (2):
      ARM: dts: imx6ul-14x14-evk: Complete WM8960 power supplies
      ARM: dts: imx7d-sdb: Complete WM8960 power supplies

Ernest Van Hoecke (2):
      ARM: dts: apalis/colibri-imx6: Enable STMPE811 TS
      ARM: dts: apalis/colibri-imx6: Add support for v1.2

Fabio Estevam (8):
      ARM: dts: imx53-ppd: Fix touchscreen reset-gpios
      ARM: dts: vfxxx: Fix the CAAM job ring node names
      ARM: dts: imx5: Fix the CCM interrupts description
      ARM: dts: vf610-bk4: Use the more specific "lwn,bk4-spi"
      ARM: dts: imx28-sps1: Fix GPIO LEDs description
      ARM: dts: vfxxx: Fix the order of the DMA entries
      ARM: dts: imx31: Use nand-controller as node name
      ARM: dts: imx53-mba53: Fix the PCA9554 compatible

Francesco Dolcini (2):
      ARM: dts: imx6qdl-apalis/colibri: Remove compatible from SoM dtsi
      ARM: dts: vf610-colibri: Remove compatible from SoM dtsi

Krzysztof Kozlowski (1):
      ARM: dts: nxp: vf: Align GPIO hog name with bindings

Lukasz Majewski (1):
      ARM: dts: mxs: Add descriptions for imx287 based btt3-[012] devices

Markus Niebel (8):
      ARM: dts: imx6qdl-mba6: change sound card model name
      ARM: dts: imx7-mba7: change sound card model name
      ARM: dts: mba6ul: change sound card model name
      ARM: dts: imx6qdl-tqma6: limit PMIC SW4 to 3.3V
      ARM: dts: imx6qdl-tqma6: use sw4_reg as 3.3V supply
      ARM: dts: imx6qdl-tqma6: Add partitions subnode to spi-nor
      ARM: dts: tqma6ul: Add partitions subnode to spi-nor
      ARM: dts: tqma7: Add partitions subnode to spi-nor

Max Merchel (1):
      ARM: dts: imx6ul-tqma6ul1: Change include order to disable fec2 node

 arch/arm/boot/dts/nxp/imx/Makefile                 |  10 +
 arch/arm/boot/dts/nxp/imx/imx31.dtsi               |   2 +-
 arch/arm/boot/dts/nxp/imx/imx50.dtsi               |   2 +-
 arch/arm/boot/dts/nxp/imx/imx51.dtsi               |   2 +-
 arch/arm/boot/dts/nxp/imx/imx53-mba53.dts          |   2 +-
 arch/arm/boot/dts/nxp/imx/imx53-ppd.dts            |   2 +-
 arch/arm/boot/dts/nxp/imx/imx53.dtsi               |   2 +-
 .../boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dts |  11 +
 .../dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dts    |  11 +
 .../dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dts    |  11 +
 .../boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dts  |  11 +
 .../dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dts    |  11 +
 .../boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dts    |  11 +
 .../dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dts   |  11 +
 .../dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dts   |  11 +
 .../boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dts   |  11 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis-v1.2.dtsi |  57 ++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi      |   2 -
 .../arm/boot/dts/nxp/imx/imx6qdl-colibri-v1.2.dtsi |  57 ++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi     |   2 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi        |   2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi       |  25 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi      |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi      |   4 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi    |  32 +++
 .../boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi    |  11 +-
 .../boot/dts/nxp/imx/imx6ul-tqma6ul1-mba6ulx.dts   |   3 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul1.dtsi     |   2 -
 .../boot/dts/nxp/imx/imx6ul-var-som-concerto.dts   | 320 +++++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi      | 233 +++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi           |   2 +-
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi          |   7 +
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts            |  32 +++
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi               |  56 ++--
 arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi             |   2 +-
 arch/arm/boot/dts/nxp/mxs/Makefile                 |   3 +
 arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dts         |  12 +
 arch/arm/boot/dts/nxp/mxs/imx28-btt3-1.dts         |   8 +
 arch/arm/boot/dts/nxp/mxs/imx28-btt3-2.dts         |  39 +++
 arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi          | 313 ++++++++++++++++++++
 arch/arm/boot/dts/nxp/mxs/imx28-sps1.dts           |  13 +-
 arch/arm/boot/dts/nxp/vf/vf610-bk4.dts             |   4 +-
 arch/arm/boot/dts/nxp/vf/vf610-colibri.dtsi        |   1 -
 arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts   |   4 +-
 arch/arm/boot/dts/nxp/vf/vfxxx.dtsi                |  21 +-
 45 files changed, 1301 insertions(+), 91 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-aster.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-eval-v3.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris-v2.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-v1.2-iris.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval-v1.2.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-eval.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.1.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora-v1.2.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-v1.2-ixora.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis-v1.2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri-v1.2.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-btt3-0.dts
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-btt3-1.dts
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-btt3-2.dts
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-btt3.dtsi

