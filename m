Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0B71FA171
	for <imx@lists.linux.dev>; Mon, 13 Jan 2025 22:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736807372; cv=none; b=ZsfMPqEsj02agdixJRkMrWyUlJDae/Xzu+bJKMYkqovU7pQsLzkzdt1YTdBg1mT/o2CHr4q058Ra1ab0PmiQLiXvEvzwdsAYCALwZgZX09iRkdgdcRuuIrSYq/xVsx9lvtVWfg13UUS2pTvGmZPv6ZzBmgkLNftqS4tXCU8bfTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736807372; c=relaxed/simple;
	bh=5xDYAYACoCdt8pbT4Sel3WN1LFWxdp2TFkWNGuIOO9c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=q8M/w++eNe/28xoDYW7tak1pv+aurJ28meejBdYH/ZyDHJsXvm/phN3CfwX/E4QG78RKB+1V+z7CwqSYzrizD83ubXbUmSlQ7kVQmrwH0czz2YY5rqqfhVLn20txj2e0k0TQV0vLbD0ecBike9YofGNwf5g9UGqkLGv92q9QQps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSvv-0006ts-5k; Mon, 13 Jan 2025 23:29:19 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSvu-000KaE-0m;
	Mon, 13 Jan 2025 23:29:18 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXSvv-008syM-1G;
	Mon, 13 Jan 2025 23:29:18 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH 0/6] arm64: dts: imx8mp-skov: add new variants
Date: Mon, 13 Jan 2025 23:29:04 +0100
Message-Id: <20250113-skov-imx8mp-new-boards-v1-0-75288def1271@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALCThWcC/x3MQQqAIBBA0avErBswKamuEi20xhoiDQcqiO6et
 HyL/x8QSkwCffFAopOFY8ioygKm1YaFkOds0Eo3qlIGZYsn8n63+4GBLnTRplnQOdtqVdfUGQ8
 5PhJ5vv/xML7vB6pXCVFoAAAA
X-Change-ID: 20250106-skov-imx8mp-new-boards-bba82044e96f
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
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
base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc
change-id: 20250106-skov-imx8mp-new-boards-bba82044e96f

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>

