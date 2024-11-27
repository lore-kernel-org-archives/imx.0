Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DDB20100E
	for <imx@lists.linux.dev>; Wed, 27 Nov 2024 16:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732725900; cv=none; b=Qgi/qBF8WBcHut11l5UrwhdA8Dn7rAdXtO8FR/suowaYRsKjL8kNLHyplTC79fZT8WrhDhLIZpq3nLNycFomQ7We5DBPLJIvKPg1wfkKCS+Msb0PLarZoqUoCdiJAfT114svg7a5Upk2PtQTSOt222jMtJP/Seje80gROgCWVBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732725900; c=relaxed/simple;
	bh=n1YjRF7cGKQ4u5dbooVh3Fr3b8HUU21GakLh+x1zEx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K43guw36DpZqTRXz3fzNKOAAknR0uQvyrkih2yv5lq3tKoz01N4nr/89aowgmUxYbG/TgztRkP7b4b8n1xGj0jP8X/M+XLEW3gFkLkbmxiuaL42JLtdG8ofFXGjmfFEUrWxaPQpdpbGyulRT3Juy9SsuINvWSoT0SOoTgOQPJ+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=XLr7BeQB; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="XLr7BeQB"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E5C5ABFB93;
	Wed, 27 Nov 2024 17:44:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1732725895; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ATsLoK4DRFXJHrtqjTSevth3sGwOLm/Y/NthQk/7Fec=;
	b=XLr7BeQBbDjoeFmSKX2hfD/VQatWkvwpxQC6RfHvNhvBpG9zd1F3BwQ/pgP5WHNc3+6XlR
	d0Kh67/9D91w78jBBMvmXEXux9SmhzYXoShVCrL5mAK0umfvaYDcphMqeaz+3ACRcwCCBs
	DOKg04MiEqBRcQPpsdV7LlB+MqIonaZah5+tKCJNG1nbykbgcDcuyNlF4v/0ImRUYuka5d
	Yvzb1lAOU5sXrGePUHbSX9dlxHuOJElvcxPzIxLBAICkFQjOBsywvRwLrwgq/ilc+mfCbZ
	z7qfBhslh2JVupxA8fEPnrcQx+NvyfB/XtFfLGnnvrUU8Hb8tgSaI/4IztHnsQ==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 10/11] arm64: dts: imx93-kontron: Fix SD card IO voltage control
Date: Wed, 27 Nov 2024 17:42:26 +0100
Message-ID: <20241127164337.613915-11-frieder@fris.de>
In-Reply-To: <20241127164337.613915-1-frieder@fris.de>
References: <20241127164337.613915-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The OSM-S i.MX93 SoM doesn't have the VSELECT signal of the USDHC
controller connected to the PMICs SD_VSEL input. Instead SD_VSEL
is hardwired to low level. Let the driver know this in order to
use the proper register for reading and writing the voltage level.

This fixes SD card access with the latest hardware revision of
the Kontron OSM-S i.MX93 SoM.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes for v2:
* new patch
---
 arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
index 47c1363a2f99a..119a162070596 100644
--- a/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-kontron-osm-s.dtsi
@@ -189,6 +189,7 @@ reg_nvcc_sd: LDO5 {
 				regulator-name = "NVCC_SD (LDO5)";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <3300000>;
+				nxp,sd-vsel-fixed-low;
 			};
 		};
 	};
@@ -282,6 +283,7 @@ &usdhc2 { /* OSM-S SDIO_A */
 	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
 	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
 	vmmc-supply = <&reg_usdhc2_vcc>;
+	vqmmc-supply = <&reg_nvcc_sd>;
 	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
 };
 
@@ -553,7 +555,6 @@ MX93_PAD_SD2_DATA0__USDHC2_DATA0		0x40001382 /* SDIO_A_D0 */
 			MX93_PAD_SD2_DATA1__USDHC2_DATA1		0x40001382 /* SDIO_A_D1 */
 			MX93_PAD_SD2_DATA2__USDHC2_DATA2		0x40001382 /* SDIO_A_D2 */
 			MX93_PAD_SD2_DATA3__USDHC2_DATA3		0x40001382 /* SDIO_A_D3 */
-			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT		0x1d0
 		>;
 	};
 
@@ -565,7 +566,6 @@ MX93_PAD_SD2_DATA0__USDHC2_DATA0		0x4000138e /* SDIO_A_D0 */
 			MX93_PAD_SD2_DATA1__USDHC2_DATA1		0x4000138e /* SDIO_A_D1 */
 			MX93_PAD_SD2_DATA2__USDHC2_DATA2		0x4000138e /* SDIO_A_D2 */
 			MX93_PAD_SD2_DATA3__USDHC2_DATA3		0x4000138e /* SDIO_A_D3 */
-			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT		0x1d0
 		>;
 	};
 
@@ -577,7 +577,6 @@ MX93_PAD_SD2_DATA0__USDHC2_DATA0		0x400013fe /* SDIO_A_D0 */
 			MX93_PAD_SD2_DATA1__USDHC2_DATA1		0x400013fe /* SDIO_A_D1 */
 			MX93_PAD_SD2_DATA2__USDHC2_DATA2		0x400013fe /* SDIO_A_D2 */
 			MX93_PAD_SD2_DATA3__USDHC2_DATA3		0x400013fe /* SDIO_A_D3 */
-			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT		0x1d0
 		>;
 	};
 
-- 
2.46.1

