Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C7218733B
	for <imx@lists.linux.dev>; Wed,  4 Sep 2024 08:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725440134; cv=none; b=bO6qW+0/BkeLFMsXPU5HUFgqxglMt9MPqrewNUYL/qgieIcFptnPkCeMKgo2msK5Zw3k2ys/96HkFe8acAviT6rqXqIWz4s6ECa3eV+baBRIjM8Qx2npUcZNQj3KfxG+x+PRHEK6C5hafocEEqvKv8o8dv04EH+leRZLh9FzFLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725440134; c=relaxed/simple;
	bh=sJ1DPREOCwqu1OVMfYWKRaG4pLDx6igLH9g1iZYw91c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eCUwR6Iq/mZPjuRybI+wAU5oHnQH7yVRhRWbgiXBrHaqGyHlYnslizxwY9F6Szw2emEmGrPXbjUWzuWcrLyMDSVVvnL4ubXGDkQCufYP9q0p0sIMiGWIuVbN4iofYbtrGl0bB5CWU8/4/QnRL9/KtTQUdvtZWU1xD93n5MOFuJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=fail smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=mBO7W3sJ; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="mBO7W3sJ"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D4152BFB4B;
	Wed,  4 Sep 2024 10:55:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1725440121; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=tkvDCLWUEZYeYckxRogBfP+jECpYcjBnqLACL5yPBR0=;
	b=mBO7W3sJ0oKgkemCvBSn24vHqHZ0GRYfyBZLqDIH8geas2L3avZm0CeUMmn1U9sLtO5oyY
	tzbG5r1diqepvWh0EqzeRfS7QIrkeDscPVA6N0Rga1QFXjq6/DGd+Z8PtcjL/VnO0SIV/f
	atKffTZaMiNpYdg14GaJofln7Fl/xBsWDqnYp3GO1Jb3JYrFvvR6VvUWxJrUqIYJ6sAxCk
	gtbN6mIriob/oi4klAb7MIar4DJgzHDtQ8jkljR/TNp6eSgcSSsJUwjgmZmDY1A2PyVk1I
	B4En0p74nsxb6Bhoe0G9yV/OgHCHKPxbSsqdouwGGl9WA8tJDMxCaKZ+o0rBAQ==
From: Frieder Schrempf <frieder@fris.de>
To: Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	Michael Walle <mwalle@kernel.org>,
	Parthiban Nallathambi <parthiban@linumiz.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 0/3] Add support for Kontron OSM-S i.MX8MP SoM and carrier boards
Date: Wed,  4 Sep 2024 10:53:18 +0200
Message-ID: <20240904085415.645031-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Frieder Schrempf <frieder.schrempf@kontron.de>

Patch 1: board DT bindings
Patch 2: OSM-S i.MX8MP SoM and BL carrier board devicetrees
Patch 3: i.MX8MP SMARC module and eval carrier board devicetrees

Changes for v3:

* Address Shawn's review comments (thanks!)
* Fix HDMI DDC interface
* Fix gpio-hog pinctrl in DL devicetree
* Fix DT check warnings in DL devicetree
* Adjust LVDS panel node to match that of proposed DL i.MX8MM

Changes for v2:

DT bindings (patch1):
* Add tags from Krzysztof and Conor (thanks!)

SMARC DTs (patch 3):
* Fix GPIO labels
* Add support for TPM chip on SMARC module
* Disable PWM in favor of GPIO5 on SMARC carrier
* Enable LCDIF node to make HDMI work
* Add support for GPIO expanders on SMARC carrier
* Remove SPI flash as its removable and should be in an overlay
* Add CAN regulators to fix transceiver enable

Frieder Schrempf (3):
  dt-bindings: arm: fsl: Add Kontron i.MX8MP OSM-S based boards
  arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier
    board
  arm64: dts: Add support for Kontron i.MX8MP SMARC module and eval
    carrier

 .../devicetree/bindings/arm/fsl.yaml          |  13 +
 arch/arm64/boot/dts/freescale/Makefile        |   6 +
 .../dts/freescale/imx8mp-kontron-bl-osm-s.dts | 305 ++++++
 .../boot/dts/freescale/imx8mp-kontron-dl.dtso | 110 +++
 .../dts/freescale/imx8mp-kontron-osm-s.dtsi   | 908 ++++++++++++++++++
 .../imx8mp-kontron-smarc-eval-carrier.dts     | 254 +++++
 .../dts/freescale/imx8mp-kontron-smarc.dtsi   | 280 ++++++
 7 files changed, 1876 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc.dtsi

-- 
2.46.0

