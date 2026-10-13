Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBE24B515E
	for <imx@lists.linux.dev>; Tue, 13 Oct 2026 09:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884755; cv=none; b=rm/VIgONDnMgqUAFsVamZ3/bdMW2R1rs0kpVRK2DmtuqCjEaXTO9tn7ludj7yo8eyyADcFFQ+plqH+EuXP1BbAE4yGp7zjWHtYX6DYwWRgjsUH0gVL3aQ0TU6evpN8gv5aaxYtly3o3DTgKrC9ie5bP9DzZeowYYINFvdeJGCdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884755; c=relaxed/simple;
	bh=oQ1HgMMLK7mjhAUv32lUkeAKxYNg94V1vvJ0Nox4AnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZUXwVl/YGr0y9l1Flamu9G7RBbzRC50m++Pb7h+nLiYQ3CupoAZwfCk+EKCrevNAgKsG17dKgSPmstg4La2tidoK9w17PJtFz8Ij9xF8s3uEIKchfrCiQxPmK8c5flfrY15hmOw/8xwzob9THognQ62oefO6uVL3pRl1KywPgrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=T72C/PhT; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="T72C/PhT"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791884742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=spLaJFBDA2I9mv/iGjdSPVlGR48vOUEIla/fx1TJJh0=;
	b=T72C/PhT8ZNZUOcjrgMiDKhS+DjWiqA58Vnk63sU29TSpoqH/4rH3oc16rH8+yJHl5idbZ
	2Ma814Zs5xaceblmywgjjAUWz5dss3o+IjQVoW9NWH7/2m4SuqBkzAVJ77PUf/qGBdX2ZL
	2jUVplLjstEth6ZyInd1u+EBbZ+F8dWD4/BXuxsrsSNmSeQo7mJDpLaxwlFkmOZyZ+QNTa
	0KINd25aX74q1u6uwNKn2L2UeeX6YHwoFAa/34gBSZE07pBceKU0GBeioBY9+z/hyvyi/3
	6QG8M0JWIq2TlBqHU3Si6/TGTBtlGPEsiLtwtcShtnHZ8Q1H82KkHwFyPBT42A==
Date: Tue, 13 Oct 2026 11:44:46 +0200
Subject: [PATCH 1/8] arm64: dts: imx8mp-kontron: Fix GPIO label assignments
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-upstreaming-gpio-label-fixes-v1-1-94f09ec520ef@kontron.de>
References: <20261013-upstreaming-gpio-label-fixes-v1-0-94f09ec520ef@kontron.de>
In-Reply-To: <20261013-upstreaming-gpio-label-fixes-v1-0-94f09ec520ef@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Eberhard Stoll <eberhard.stoll@kontron.de>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=2122;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=om7LyEc69G6kO1gRBMD5Mt5tCVN+v7qqCDAAFMdEM9g=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIevs3yPzHjO8SlpWzPZU8s1ylzWR7I1/L+lnHJaO3aeXO
 Xf51+WNHaUsDGJcDLJiiixS/Bavbc1ifeSPVUfBzGFlAhnCwMUpABOZeJiRYfcnhZ/Ws12V2369
 EO0/H+SeUPfMfE3f6diJjHtm3rX8cpKR4VP93AN9M07qP3h9qF6wO6RzbXiCyiS59z6F2fXKva8
 O8AAA
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Eberhard Stoll <eberhard.stoll@kontron.de>

The OSM-S pad names GPIO_A_7, UART_B_RX, I2S_LRCLK and PCIe_CLKREQ
are incorrectly assigned. The labels I2S_B_DATA_IN and I2S_B_DATA_OUT
are missing and SPI_A_WP/SPI_A_HOLD are unconnected. Fix the labels.

Fixes: 946ab10e3f40 ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM and BL carrier board")
Signed-off-by: Eberhard Stoll <eberhard.stoll@kontron.de>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
index ea69c639b30b8..3c183ab573bed 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-kontron-osm-s.dtsi
@@ -158,8 +158,8 @@ &gpio2 {
 &gpio3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpio3>;
-	gpio-line-names = "PCIE_WAKE", "PCIE_CLKREQ", "PCIE_A_PERST", "SDIO_B_D5",
-			  "SDIO_B_D6", "SDIO_B_D7", "SPI_A_WP", "SPI_A_HOLD",
+	gpio-line-names = "PCIE_WAKE", "GPIO_A_7", "PCIE_A_PERST", "SDIO_B_D5",
+			  "SDIO_B_D6", "SDIO_B_D7", "UART_B_RX", "I2S_LRCLK",
 			  "UART_B_RTS", "UART_B_CTS", "SDIO_B_D0", "SDIO_B_D1",
 			  "SDIO_B_D2", "SDIO_B_D3", "SDIO_B_WP", "SDIO_B_D4",
 			  "PCIE_SM_ALERT", "SDIO_B_CLK", "SDIO_B_CMD", "GPIO_B_0",
@@ -178,7 +178,7 @@ &gpio4 {
 			  "ETH_A_TX_EN", "ETH_A_TX_CLK", "GPIO_B_3", "GPIO_B_4",
 			  "GPIO_B_2", "GPIO_A_6", "CAN_A_TX", "UART_A_CTS",
 			  "UART_A_RTS", "CAN_A_RX", "CAN_B_TX", "CAN_B_RX",
-			  "GPIO_A_7", "CARRIER_PWR_EN", "I2S_A_DATA_IN", "I2S_LRCLK";
+			  "I2S_B_DATA_IN", "CARRIER_PWR_EN", "I2S_A_DATA_IN", "I2S_B_DATA_OUT";
 };
 
 &gpio5 {
@@ -189,7 +189,7 @@ &gpio5 {
 			  "I2C_B_SCL", "I2C_B_SDA", "PCIE_SMCLK", "PCIE_SMDAT",
 			  "I2C_CAM_SCL", "I2C_CAM_SDA", "UART_A_RX", "UART_A_TX",
 			  "UART_C_RX", "UART_C_TX", "UART_CON_RX", "UART_CON_TX",
-			  "UART_B_RX", "UART_B_TX";
+			  "PCIe_CLKREQ", "UART_B_TX";
 };
 
 &i2c1 { /* OSM-S I2C_A */

-- 
2.55.0

