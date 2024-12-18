Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3661A23AE
	for <imx@lists.linux.dev>; Wed, 18 Dec 2024 15:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734536212; cv=none; b=UUh1EPmoA84RD4Qf2I0zk1PW33g3UVWFhP3MBREg72RZ5kI5VB0YqpvJNo6KZCbZikokarkqGO65oe1CBuB/E2FyxlYIHpNtze/ZNg2peAkDcNOj3k4XzMtq3lL/dQQhkSC3fzH719inizb9R1re9iKxQu7w65obMpC3QFJBQSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734536212; c=relaxed/simple;
	bh=5fMsmLg5KHUEUPrUf2Pto3GpDW2VQowzb6lukkGsX+4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ahOSzJdJebxiaX8kLKLKEhfGb/9Je/8jvVYCHum1Oysd6W52SO5aQ0j849wduqt2x0i6TQBghwfRRbq9BA1qERYSWZVuGQfozbFLtQ6w4iFdMrtmP1ycvrUcLLBsJKj5PhHbjhPSAAoo/Q7rHv/UCdUsZfyVNLxX1OoByUgRQ/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=BwINfTHU; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="BwINfTHU"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B09E4BFB25;
	Wed, 18 Dec 2024 16:29:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1734535782; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=fZ799AujDvtHo1AcXdC1mifOZNGSfZzq30OtsIXAG1U=;
	b=BwINfTHUHw0yknjCNyH11gosF6cTLF5S52H/bsiZPizbQ6lFiRAdVf5lOlTTGHW9LS9OqO
	IB3FQCUE6tu5CVMH8S1BMvUnrhRXvQSLEfMU8wA86tpirVpEzNMrjNa5aFhbdzMgfu43PJ
	aYQEAVwsIIuNC98oRlGvhBNOmNGFkCe0jyLanvzVC8rp8lzcEHbSzxryKkxzeFobTwUuUD
	3k46oI967WYscyUjctXxXHVdIYqqXcsDfT2TH6ulJN88/vf9L3JK9RJP+5DzUw2tcSqlaz
	G2i3ZKl/SdOlNMTM5rJW5MXt7DHyt0FzJt9SddoJxsPg0uhiG86vtWDunbMgOg==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@denx.de>,
	Conor Dooley <conor@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Robin Gong <yibin.gong@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Bo Liu <liubo03@inspur.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Joy Zou <joy.zou@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 0/9] Use correct LDO5 control registers for PCA9450
Date: Wed, 18 Dec 2024 16:27:23 +0100
Message-ID: <20241218152842.97483-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Frieder Schrempf <frieder.schrempf@kontron.de>

This is a follow-up of [1].

The main objective of this is to fix the PCA9450 driver to
use the correct control register for the LDO5 regulator.

Currently the control register to use for LDO5 is hardcoded to
LDO5CTRL_H. This is wrong for two reasons:

1. LDO5CTRL_H doesn't contain the bits for enabling/disabling
   the regulator. Only LDO5CTRL_L does.

2. The actual output voltage of the regulator is determined by
   the LDO5CTRL_H only if the SD_VSEL input is HIGH. If it is
   low, then LDO5CTRL_L is used. The driver does not take this
   into account.

This can cause several problems:

1. LDO5 can not be turned on/off and we rely on the bootloader
   to leave it turned on. On the other hand we can't save
   power if LDO5 is unused.

2. There is a potential for corner-cases where switching
   SD_VSEL via USDHC_VSELECT and writing to the (wrong)
   control register can cause wrong output voltage and therfore
   SD card failures (not observed yet).

3. Reading the current voltage of the LDO5 regulator (e. g. via
   sysfs can yield the wrong value as the voltage is read from
   the wrong control register.

At the same time there is now hardware that hardwires SD_VSEL
to a fixed LOW level and therefore relies on switching the
voltage only via a single control register. We add support for
this through an additional property "nxp,sd-vsel-fixed-low" in
the LDO5 node.

Summary of binding changes (patch 1):

1. Adjust the bindings to remove the old and abandoned use of
   sd-vsel-gpios property.

2. Adjust the bindings to use sd-vsel-gpios in the LDO5 node to
   retrieve an input that can be used to sample the SD_VSEL
   status.

3. Adjust bindings to allow "nxp,sd-vsel-fixed-low" to be used
   for boards that have SD_VSEL hardwired to low level.

Summary of driver changes (patch 2-6):

1. Remove the old sd-vsel-gpios handling.

2. Use the new sd-vsel-gpios property to determine the correct
   control register for LDO5.

3. Fix the enable register for LDO5.

4. Support hardware with fixed low level of SD_VSEL.

Summary of devicetree changes (patch 7-9):

Implement the changes in the devicetrees for Kontron hardware
(i.MX8MM, i.MX8MP and i.MX93).

Changelog:

v2 -> v3:

* Merge binding patches into one and extend commit message
* Rebase to next-20241218

v1 -> v2:

* Split binding patch
* Add solution for hardwired SD_VSEL
* Leave regulator core untouched as requested by Mark
* Add devicetree changes for i.MX8MP and i.MX93

[1] https://lore.kernel.org/lkml/20230213155833.1644366-1-frieder@fris.de/

Frieder Schrempf (9):
  dt-bindings: regulator: pca9450: Add properties for handling LDO5
  arm64: dts: imx8mp-skov-reva: Use hardware signal for SD card VSELECT
  Revert "regulator: pca9450: Add SD_VSEL GPIO for LDO5"
  regulator: pca9450: Fix control register for LDO5
  regulator: pca9450: Fix enable register for LDO5
  regulator: pca9450: Handle hardware with fixed SD_VSEL for LDO5
  arm64: dts: imx8mm-kontron: Add support for reading SD_VSEL signal
  arm64: dts: imx93-kontron: Fix SD card IO voltage control
  arm64: dts: imx8mp-kontron: Add support for reading SD_VSEL signal

 .../regulator/nxp,pca9450-regulator.yaml      |  29 ++++-
 .../boot/dts/freescale/imx8mm-kontron-bl.dts  |  10 +-
 .../dts/freescale/imx8mm-kontron-osm-s.dtsi   |   7 +-
 .../dts/freescale/imx8mp-kontron-osm-s.dtsi   |   7 +-
 .../boot/dts/freescale/imx8mp-skov-reva.dtsi  |   5 +-
 .../dts/freescale/imx93-kontron-osm-s.dtsi    |   5 +-
 drivers/regulator/pca9450-regulator.c         | 103 +++++++++++++++---
 7 files changed, 133 insertions(+), 33 deletions(-)

-- 
2.47.1

