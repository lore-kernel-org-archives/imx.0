Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0791F5825
	for <imx@lists.linux.dev>; Tue, 18 Feb 2025 18:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739903905; cv=none; b=Bm8/FFCXchdjIuY12OuvTTwlFdv+tmFpDOWeBDi+Sy7xNWnGcKFq2UPkqhUqlecll5UnRL3NT3Rda4lSNzgF8DCMuHg8jSpAEnWfUGlX1WHFpoVxJhz8cCiQVJHKmK9gjxHds6tSsYKWgSIZoQrHT9s1a30d6NKMIDfXsrrbpXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739903905; c=relaxed/simple;
	bh=Vy5EvgIcy8KunjsbRGvsYmhlPSqdIP9V0a83g680R1M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J1OEra+Y0xdhuVrH1BnVMaSlck9Z/Ib82GyYmMDp9BcvD+VqTmg6GgJ4C+tKlUSAhURnJZ8J6Ro5OdiS0FIPEuM0tS8bdYbqLHPA8Bl132JPDBJMn93uHiJi0LmA2K0lN/2/vj4krDHUrPJGXTqo/viYZKwqYJmB6UwrPcOtivY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tkSU2-0000Gu-QH; Tue, 18 Feb 2025 19:38:14 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tkSU2-001dai-1H;
	Tue, 18 Feb 2025 19:38:14 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tkSU2-00AL9G-10;
	Tue, 18 Feb 2025 19:38:14 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH v2 0/6] arm64: dts: imx8mp-skov: add new variants
Date: Tue, 18 Feb 2025 19:38:12 +0100
Message-Id: <20250218-skov-imx8mp-new-boards-v2-0-4040379742ea@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJTTtGcC/3WNyw6CMBBFf4XM2jFt5VFd+R+GBdgBJoaWtFgxh
 H+3Ercuz0nuuSsE8kwBLtkKniIHdjaBOmRwHxrbE7JJDEqoQkhRYni4iDwuepzQ0gtb13gTsG0
 brUSe07nsII0nTx0ve/hWJx44zM6/958ov/aXlKd/yShRYFUorQ11UlXyOpHtn7N3lpejIai3b
 fsABBI/g8EAAAA=
X-Change-ID: 20250106-skov-imx8mp-new-boards-bba82044e96f
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>, 
 Oleksij Rempel <o.rempel@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

The Skov i.MX8MP boards are a family of climate controllers.

There are already device trees for three board variants and this series
adds support for three more:

- Basic: Barebones DT for use as bootloader device tree and as fallback
    when a device is unknown
  - BD500: No touch screen, but a few LEDs on the front plate
  - TIAN G07017: with a 7" touch screen

---
Changes in v2:
- Added Conor's Acked-by (Thanks!)
- Fix comment typo in binding document
- Rebased on top of Shawn's for-next to resolve a trivial conflict
  around the RTC I2C frequency
- Link to v1: https://lore.kernel.org/r/20250113-skov-imx8mp-new-boards-v1-0-75288def1271@pengutronix.de

---
Ahmad Fatoum (5):
      dt-bindings: arm: fsl: add more compatibles for Skov i.MX8MP variants
      arm64: dts: imx8mp-skov: move I2C2 pin control group into DTSI
      arm64: dts: imx8mp-skov: describe I2C bus recovery for all controllers
      arm64: dts: imx8mp-skov: add revC BD500 board
      arm64: dts: imx8mp-skov: support new 7" panel board

Oleksij Rempel (1):
      arm64: dts: imx8mp-skov: add basic board as fallback

 Documentation/devicetree/bindings/arm/fsl.yaml     |  3 +
 arch/arm64/boot/dts/freescale/Makefile             |  3 +
 .../arm64/boot/dts/freescale/imx8mp-skov-basic.dts | 10 +++
 .../arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 58 +++++++++++++-
 .../freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts  | 11 ---
 .../boot/dts/freescale/imx8mp-skov-revc-bd500.dts  | 91 ++++++++++++++++++++++
 .../dts/freescale/imx8mp-skov-revc-tian-g07017.dts | 81 +++++++++++++++++++
 7 files changed, 243 insertions(+), 14 deletions(-)
---
base-commit: a8fd7fa3f9846eba45c3fd0390e2f6ee2ed2d22a
change-id: 20250106-skov-imx8mp-new-boards-bba82044e96f

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>

