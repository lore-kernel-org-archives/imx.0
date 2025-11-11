Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047A0361DB6
	for <imx@lists.linux.dev>; Tue, 11 Nov 2025 15:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762874203; cv=none; b=ZAsCVipSWPH/0W66rYy5IBgw9xZglh9ir/vhOH3WSaneygbeOgY1IjZhGtcDKhu6dMCEghWfA5Sn+1q6ANRfzN4ywacXOzv6DqpKlgSzG0kTYiTsnOwyFvUuWGedaPYRo+f2/9hsfWZTUG3we4jRqNoZ79q+jc2rWJNcxeEgiKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762874203; c=relaxed/simple;
	bh=yZ+j0/iy+ZBd9Yj4M1NB97jSjXP9Qs/QMPUsVkjf/S4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oZp5Km59Me+s/nuCitK/GxCCDMnj005DEtrskdYhne6XjuRlODaA3sYfEDDLGZOl4HX1jLDJ1pWf/a85LijOve0ztEmrZlclw6HDeNFAc7RHSDUyUgSQ3uu+4v3BwcKKzqSJzVAuKTqjd8EKxl5T62X+GBhZWggrX6fga5+iwdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=hGOBYfLL; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="hGOBYfLL"
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 1A9D11FAB4;
	Tue, 11 Nov 2025 16:16:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1762874191;
	bh=2qJKbX9yhTQfJApIzP5fAiLFo+T+Q01E1IdmAI8GEyw=; h=From:To:Subject;
	b=hGOBYfLLDmyCTyHSpdgREjvwfXirFI1bt4Xl+anOm8WIDE0HMY5hBngM8zNUtP1n6
	 4h8tO7uB1EkyZlCO3XCm0+hd2aQLScYW6cMdzFyrFq6dyCKlw1n1PxcePFeHpM/a+0
	 lbvvct4WWqq1TWTONXbGsgPEmZwhSQTiIKcqfAn9an48S+YFH4C74YKdFNKGgtWNtc
	 FXyyhhrA4jVBryzMekgbkIKGb0TDVbL23AvNUU8gx4IFTyPLFN8/2aig45G4UB/6X8
	 SJ0dccH3MexLc/V7WSHrPZbZhbQHolpv9Pe6OBRvN4Fv+iI3WbWWaKWvVOdAc6PWdM
	 V2ulP8QyEk2bA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Kirill A. Shutemov" <kas@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/2] arm64: dts: freescale: add Toradex SMARC iMX95
Date: Tue, 11 Nov 2025 16:16:12 +0100
Message-ID: <20251111151618.70132-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

This series adds support for the Toradex SMARC iMX95 SoM and the
Toradex SMARC Development Board.

The module consists of an NXP i.MX95 family SoC, up to 16GB of LPDDR5
RAM and up to 128GB of storage, a USB 3.0 Host Hub and 2.0 OTG, two
Gigabit Ethernet PHYs, a 10 Gigabit Ethernet interface, an I2C EEPROM
and Temperature Sensor, an RX8130 RTC, a Quad/Dual lane CSI interface,
and some optional addons: TPM 2.0, DSI, LVDS, DisplayPort (through a
DSI-DP bridge), and Wi-Fi/BT module.

Link: https://www.toradex.com/computer-on-modules/smarc-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/smarc-development-board-kit

João Paulo Gonçalves (1):
  dt-bindings: arm: fsl: add Toradex SMARC iMX95

Max Krummenacher (1):
  arm64: dts: freescale: add Toradex SMARC iMX95

 .../devicetree/bindings/arm/fsl.yaml          |    6 +
 arch/arm64/boot/dts/freescale/Makefile        |    1 +
 .../dts/freescale/imx95-toradex-smarc-dev.dts |  277 ++++
 .../dts/freescale/imx95-toradex-smarc.dtsi    | 1155 +++++++++++++++++
 4 files changed, 1439 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi

-- 
2.47.3

