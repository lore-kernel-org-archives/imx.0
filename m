Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0AF2580E1
	for <imx@lists.linux.dev>; Mon, 17 Nov 2025 12:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763382889; cv=none; b=CsTNvd4lxUIqqfOXl6+csBaAgy1LHE1HJVZ/ADr90bq54h8vHWaH4scXgIa518pqkpKcsq8rjE+qHO247RKpSJM/7jRPC63hhe760WdET+Rkyzh57HNKIdAKUhl5aklEGDH2gkBss8CyAJDaiKecUL21hSLm+Tqx+IwqKK8mk+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763382889; c=relaxed/simple;
	bh=nWN81HbuU0DGsLWx5ds7dp1Hc9yibKGBCqezzbUFmW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LPZ7WzT7V7waI3SsEQ71FnHBf1M9zYhTj+Na6MQxlkifcyCTv0bl899f6r5NCaNYErddb50qdAotf6/yJ7DQehvqWPF7r25VezpgAtunPNpdIVvn4MWOI12MeuhTQbfC4/JCGl9h2c/Y6a6ymcbONOxdsZAkESxkn4yPvkuEDXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Z97VO8Ia; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Z97VO8Ia"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=cVtBbGpwiPbk5yGKMCAfVLSSZ1D6MnO5tcKuZZzty68=;
	b=Z97VO8IaAoKZHUJCWp8+2JcPbx1f574rTpwymEDba77d5Fp2eHKNM78wqWESTq
	v0khAKKkcGuh7lFlD8bgQg8C9hveGiynKg+UwwJSCVoomXxdILZ2qPWS9HCzwDvl
	iNExLIOH+513DhD6J7MRIzVxXA0If00sq3WpMWvBLQIUA=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAnXIhOFhtpoZUoAg--.8347S4;
	Mon, 17 Nov 2025 20:34:25 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/5] i.MX ARM device tree changes for 6.19
Date: Mon, 17 Nov 2025 20:33:49 +0800
Message-ID: <20251117123358.2009662-3-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117123358.2009662-1-shawnguo2@yeah.net>
References: <20251117123358.2009662-1-shawnguo2@yeah.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:M88vCgAnXIhOFhtpoZUoAg--.8347S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxuFW3tF13AF4kXr4DJFyDAwb_yoWxWr13pa
	yfursxGan7Gr1fK3sxArWUK390yw18Ar1rZry5Gay8KF43Za47Zr9akwn3try3XFWrWw1S
	gr1kur9rJ34DWaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jL3kAUUUUU=
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNBK6IGkbFlITpwAA3+

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt-6.19

for you to fetch changes up to 6f813b7814d305cac27b81d5cabe3ebdebd1d8f2:

  ARM: dts: imx6qdl: make VAR-SOM SoM SoC-agnostic (2025-11-16 21:03:49 +0800)

----------------------------------------------------------------
i.MX ARM device tree changes for 6.19:

- A bunch of dt-schema warning cleanup patches from Frank Li
- A couple of imx6dl-yapp4 board update from Michal Vokáč to enable
  pwm-beeper and model the RGB LED as a single multi-led part
- Enable PMIC RTC on imx53-qsrb board
- Correct rtc compatible for imx6q-evi board
- Add sy7636 support for e70k02 board
- Replace license text comment with SPDX identifier for imx53-usbarmory
  board
- Add I2S audio support for imx28-amarula-rmm board

----------------------------------------------------------------
Alexander Kurz (1):
      ARM: dts: imx53: enable PMIC RTC on imx53-qsrb

Alexandre Belloni (1):
      ARM: dts: imx6q-evi: fix rtc compatible

Andreas Kemnade (1):
      ARM: dts: imx: e70k02: add sy7636

Bence Csókás (1):
      ARM: dts: imx53-usbarmory: Replace license text comment with SPDX identifier

Dario Binacchi (1):
      ARM: dts: imx28-amarula-rmm: add I2S audio

Frank Li (21):
      ARM: dts: imx6: rename stmpgpio to gpio
      ARM: dts: imx6: rename touch-thermal0 to touch-0-thermal
      ARM: dts: imx6: rename m95m02 to eeprom
      ARM: dts: imx6qdl-ts4900: rename ngpio to ngpios
      ARM: dts: imx6: remove gpio suffix for regulator
      ARM: dts: imx6: change voltage-divider's io-channel-cells to 1
      ARM: dts: imx6: remove pinctrl-name if pinctrl-0 doesn't exist
      ARM: dts: imx6-tbs2910: rename ir_recv to ir-receiver
      ARM: dts: imx6q-utilite-pro: add missing required property for pci
      ARM: dts: imx6ull-phytec-tauri: remove extra space before jedec,spi-nor
      ARM: dts: imx6qdl-nitrogen6_max: rename i2c<n>mux to i2c
      ARM: dts: imx: add power-supply for lcd panel
      ARM: dts: imx6ull-dhcom-pdk2: rename power-supply to vcc-supply for touchscreen
      ARM: dts: imx: remove redundant linux,phandle
      ARM: dts: imx6qdl-skov-cpu fix typo interrupt
      ARM: dts: imx6q-cm-fx6.dts: add supplies for wm8731
      ARM: dts: Add bus type for parallel ov5640
      ARM: dts: add device_type for memory node
      ARM: dts: remove undocumented clock-names for ov5642
      ARM: dts: imx7ulp: remove bias-pull-up
      ARM: dts: imx: add vdd-supply and vddio-supply for fsl,mpl3115

Michal Vokáč (2):
      ARM: dts: imx6dl-yapp43: Enable pwm-beeper on boards with speaker
      ARM: dts: imx6dl-yapp4: Model the RGB LED as a single multi-led part

Stefan Prisacariu (1):
      ARM: dts: imx6qdl: make VAR-SOM SoM SoC-agnostic

 arch/arm/boot/dts/nxp/imx/e70k02.dtsi              | 25 ++++++++-
 arch/arm/boot/dts/nxp/imx/imx53-ppd.dts            |  2 +
 arch/arm/boot/dts/nxp/imx/imx53-qsrb.dts           |  1 +
 arch/arm/boot/dts/nxp/imx/imx53-usbarmory.dts      | 39 +-------------
 .../boot/dts/nxp/imx/imx6dl-aristainetos2_7.dts    |  1 +
 arch/arm/boot/dts/nxp/imx/imx6dl-b1x5v2.dtsi       |  3 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-lanmcu.dts        |  8 +++
 arch/arm/boot/dts/nxp/imx/imx6dl-plym2m.dts        |  4 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-prtvt7.dts        |  8 +--
 arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi         |  1 +
 arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dts        | 10 ++--
 arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi | 44 ++++++++-------
 arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-lynx.dts    |  8 +++
 .../arm/boot/dts/nxp/imx/imx6dl-yapp43-common.dtsi | 63 +++++++++++++++-------
 arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts      |  1 +
 arch/arm/boot/dts/nxp/imx/imx6q-bx50v3.dtsi        |  4 ++
 arch/arm/boot/dts/nxp/imx/imx6q-cm-fx6.dts         | 34 +++++++++++-
 arch/arm/boot/dts/nxp/imx/imx6q-dmo-edmqmx6.dts    | 10 +++-
 arch/arm/boot/dts/nxp/imx/imx6q-evi.dts            | 12 ++++-
 arch/arm/boot/dts/nxp/imx/imx6q-icore-ofcap10.dts  |  1 +
 arch/arm/boot/dts/nxp/imx/imx6q-icore-ofcap12.dts  |  1 +
 arch/arm/boot/dts/nxp/imx/imx6q-pistachio.dts      |  3 +-
 arch/arm/boot/dts/nxp/imx/imx6q-prti6q.dts         |  8 +++
 arch/arm/boot/dts/nxp/imx/imx6q-tbs2910.dts        |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts    |  5 +-
 .../boot/dts/nxp/imx/imx6q-var-mx6customboard.dts  |  1 +
 arch/arm/boot/dts/nxp/imx/imx6q-yapp4-pegasus.dts  |  8 +++
 arch/arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi     |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw560x.dtsi      |  1 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-gw5903.dtsi      |  2 -
 arch/arm/boot/dts/nxp/imx/imx6qdl-nit6xlite.dtsi   |  1 +
 .../boot/dts/nxp/imx/imx6qdl-nitrogen6_max.dtsi    |  9 ++--
 .../boot/dts/nxp/imx/imx6qdl-nitrogen6_som2.dtsi   |  3 ++
 arch/arm/boot/dts/nxp/imx/imx6qdl-nitrogen6x.dtsi  |  2 +
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi   |  5 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-sabresd.dtsi     | 11 +++-
 arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi    |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-ts4900.dtsi      |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6-mb7.dtsi     |  3 ++
 arch/arm/boot/dts/nxp/imx/imx6qdl-var-som.dtsi     |  3 --
 .../boot/dts/nxp/imx/imx6qp-yapp4-pegasus-plus.dts |  8 +++
 arch/arm/boot/dts/nxp/imx/imx6sl-tolino-vision.dts |  1 -
 .../arm/boot/dts/nxp/imx/imx6sl-tolino-vision5.dts | 24 +++++++++
 .../arm/boot/dts/nxp/imx/imx6sll-kobo-librah2o.dts | 24 +++++++++
 arch/arm/boot/dts/nxp/imx/imx6sx-sdb.dtsi          |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi    |  8 +++
 arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi        | 12 +++--
 arch/arm/boot/dts/nxp/imx/imx6ul-pico-dwarf.dts    |  2 +
 arch/arm/boot/dts/nxp/imx/imx6ull-dhcom-pdk2.dts   |  2 +-
 .../arm/boot/dts/nxp/imx/imx6ull-phytec-tauri.dtsi |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-nitrogen7.dts      |  8 +++
 arch/arm/boot/dts/nxp/imx/imx7d-pico-dwarf.dts     |  2 +
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts            |  2 +
 arch/arm/boot/dts/nxp/imx/imx7s-warp.dts           |  9 ++++
 arch/arm/boot/dts/nxp/imx/imx7ulp-evk.dts          |  1 -
 arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 50 +++++++++++++++++
 56 files changed, 388 insertions(+), 122 deletions(-)

