Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71DE1F37D8
	for <imx@lists.linux.dev>; Wed, 18 Dec 2024 15:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734535802; cv=none; b=ZWA1TkqQsYEDRMwOxPX9tU+dR+Bh9lp/QDPa4S1ngWWXIEbY+NBEF9AZNSiUCPUXYSz9doztLb6eP7Rq3B2+qC9MjhpZh2pFb392uivI2OdChxUFEnyOqi3YSJ1tRqBPGjfq7wlQ5EIYQkWUpd2NZRP/TozztOlB4v+HJbLBhOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734535802; c=relaxed/simple;
	bh=3GhKKXTEXCvntGyNBDodbsRxDxpF+wHZHM2/dqvARGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TtPGvFTwLX1pqcm0tcQbY86qkhn4OlTgtO4V4ssPBkMi70bAgTTIOctB7BsgnPv9p9xPz8hrkmtgqbj031o22TX6f8R6BP9AlpzICe6g2/SjoI3gjJTEFfrq3ktlUp+s8BunF0G8G+2SvHmW5OOaMDfIR6aHD74QaLYE3MMtAzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=0rUi7MJc; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="0rUi7MJc"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 95AC3BFB88;
	Wed, 18 Dec 2024 16:29:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1734535799; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=wfB/TCZTripQjH6hLxg9WpKQmWcxnwexAWuVAFpfJ2o=;
	b=0rUi7MJcJDi1Eu2sqR834LN6dsxJ0Y+1qRM4wHJlZz+SOkl5n8riq56UcMNjrKHx6XaACh
	XR/vM0M0ENp0QCj3azfIG0VkHOsYNwY+O53c/Bi+xo1R3/1vegiJ08wDQxJXhmCJAbDE1V
	5vPZxtv/dTX7hahx2f7XAkP37ECRtM2/uOqoewhA/xIz1IfvJ6yfH+APshydh18CHIp6IX
	YUksesdWmF9KI9CEZQixAMPHmkBy8hvwqCx5S5+WpXf1n20pBtISLXbQR9CIXtmpm51ie/
	mbVyheV8rleluz0KuayaeZ5e19rWAKX3/s7t2SSsBBQfWwRaMOe2rcSlN/SMfA==
From: Frieder Schrempf <frieder@fris.de>
To: linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@denx.de>,
	Conor Dooley <conor@kernel.org>,
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
Subject: [PATCH v3 7/9] arm64: dts: imx8mm-kontron: Add support for reading SD_VSEL signal
Date: Wed, 18 Dec 2024 16:27:30 +0100
Message-ID: <20241218152842.97483-8-frieder@fris.de>
In-Reply-To: <20241218152842.97483-1-frieder@fris.de>
References: <20241218152842.97483-1-frieder@fris.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Frieder Schrempf <frieder.schrempf@kontron.de>

This fixes the LDO5 regulator handling of the pca9450 driver by
taking the status of the SD_VSEL into account to determine which
configuration register is used for the voltage setting.

Even without this change there is no functional issue, as the code
for switching the voltage in sdhci.c currently switches both, the
VSELECT/SD_VSEL signal and the regulator voltage at the same time
and doesn't run into an invalid corner case.

We should still make sure, that we always use the correct register
when controlling the regulator. At least in U-Boot this fixes an
actual bug where the wrong IO voltage is used and it makes sure
that the correct voltage can be read from sysfs.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes for v3:
* Rebase to next-20241218

Changes for v2:
* rebase to current master
---
 arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts    | 10 +++++++---
 .../arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi |  7 ++++---
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
index a8ef4fba16a9e..d16490d876874 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
@@ -254,6 +254,10 @@ &pwm2 {
 	status = "okay";
 };
 
+&reg_nvcc_sd {
+	sd-vsel-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
+};
+
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
@@ -454,7 +458,7 @@ MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d0
 			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d0
 			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d0
 			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12		0x19
-			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0xd0
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x40000d0
 		>;
 	};
 
@@ -467,7 +471,7 @@ MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d4
 			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d4
 			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4
 			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12		0x19
-			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0xd0
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x40000d0
 		>;
 	};
 
@@ -480,7 +484,7 @@ MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d6
 			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d6
 			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d6
 			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12		0x19
-			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0xd0
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x40000d0
 		>;
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
index 663ae52b48526..d455429652305 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
@@ -342,6 +342,7 @@ reg_nvcc_sd: LDO5 {
 				regulator-name = "NVCC_SD (LDO5)";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <3300000>;
+				sd-vsel-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
 			};
 		};
 	};
@@ -794,7 +795,7 @@ MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d0 /* SDIO_A_D1 */
 			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d0 /* SDIO_A_D2 */
 			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d0 /* SDIO_A_D3 */
 			MX8MM_IOMUXC_SD2_WP_USDHC2_WP			0x400000d6 /* SDIO_A_WP */
-			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x90
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x40000090
 		>;
 	};
 
@@ -807,7 +808,7 @@ MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d4 /* SDIO_A_D1 */
 			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d4 /* SDIO_A_D2 */
 			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4 /* SDIO_A_D3 */
 			MX8MM_IOMUXC_SD2_WP_USDHC2_WP			0x400000d6 /* SDIO_A_WP */
-			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x90
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x40000090
 		>;
 	};
 
@@ -820,7 +821,7 @@ MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d6 /* SDIO_A_D1 */
 			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d6 /* SDIO_A_D2 */
 			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d6 /* SDIO_A_D3 */
 			MX8MM_IOMUXC_SD2_WP_USDHC2_WP			0x400000d6 /* SDIO_A_WP */
-			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x90
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x40000090
 		>;
 	};
 
-- 
2.47.1

