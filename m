Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8B71E2125
	for <imx@lists.linux.dev>; Wed,  7 Aug 2024 10:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723027347; cv=none; b=Z27q9oBw+eI5iI7EnbltfeuQ5j3Z94ov8Y2iEN2GVKqNKv4wlV/XaeNc+m0umhenFYEFReW2iXUDerslvtPleprzIU1mzydJbi/x3n3paD8stH0Gp970bxsFJAWwoeNLLz4popesG+tQExtOC0MUwC49oLiOe3tEDYCgdr0YKkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723027347; c=relaxed/simple;
	bh=0TfCvzJgPoazultcYN9+hO/7yuwX5/8GGYM0pn/O5uk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Eq1OV6TBl7nJghGfhFnspbwUQXqQ/FUXmEgMsUlnOt+UTQX2rqdEnC/23rqoTjn9veI83JgyxNk2t8SHWZi6WQcuPqzPAw0bdP4TMlu1e6iXzMA6o2KYkE/zd5lTlPadiIyWkrPVtCxQUjQmZn4FZHPHO1U0iKJqm5VAC1gkRig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=fail smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=v8KmmTDK; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="v8KmmTDK"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 06401BFB46;
	Wed,  7 Aug 2024 12:42:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1723027341; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=jroDDOQR/0744C6J84EjLUXLcIWqH8y5RsHY256rmns=;
	b=v8KmmTDKKCvJmUFehvx+O2+u39liWy4c4gnaklQsQycoY02ub0ZAQsMwBgEyhy0Yx+BNwQ
	8cCL5HaJrzbgS89LaM052Cy9WMpsK6y7SKpAyk5CrhQc5UhImYJDR2iP4uJGy38KnBoZfz
	Vqh1LLEJjcMQmHYFWnpssxfLA49g7s7VjGMqv16MV8Ll6xAyIQzNbDo9sEDIVSriAvNNE6
	neihqVC2eTVHuPIgAt0OkXs9AT/utS+NqFoS4nipSQFcj/oHSF2jdyTEFrNnUtdgQOGrkX
	z3bqM4O7PWksuCVcemfOzi/o37uc4c3t7dANB24xLUXmasXtuP7vQrCrvpG1UA==
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
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	Parthiban Nallathambi <parthiban@linumiz.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 0/3] Add support for Kontron OSM-S i.MX8MP SoM and carrier boards
Date: Wed,  7 Aug 2024 12:38:45 +0200
Message-ID: <20240807104137.558741-1-frieder@fris.de>
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
 .../dts/freescale/imx8mp-kontron-bl-osm-s.dts | 307 ++++++
 .../boot/dts/freescale/imx8mp-kontron-dl.dtso | 112 +++
 .../dts/freescale/imx8mp-kontron-osm-s.dtsi   | 908 ++++++++++++++++++
 .../imx8mp-kontron-smarc-eval-carrier.dts     | 258 +++++
 .../dts/freescale/imx8mp-kontron-smarc.dtsi   | 281 ++++++
 7 files changed, 1885 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc.dtsi

-- 
2.45.2

