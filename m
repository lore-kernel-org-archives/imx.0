Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B09200BA9
	for <imx@lists.linux.dev>; Wed, 27 Nov 2024 16:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732725883; cv=none; b=NmfA5L7UfWYkxiDC0etZRreIXiTAHxRyAajIssWpWB8xt/YM5RorI3m/TAulHxe5X0Vq8ZGCLRr2VA/yBeIzc7+VLFnphBEuUGXHmfR0yOOMJVixeeVOJ2izeF5a9+3qB4eX9mRNtYT0wUd5u2iXv5s96ZKNmfKBSlGdNqWe8/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732725883; c=relaxed/simple;
	bh=gUjM1dpIwBdlgK1gcDpU85tOGxsJBAbOWJnShHwzhL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CtCh0UNy1Fl/tJpNWYhLEBGwnvY+ue0NB3mwpgAhDCMK3xEXdHJuTuuwb5GYWf2DpCd83PkyMKqXRua7daKiJwEjDHZGK/zX3av2iPNseM38jIneZlj62Az9RGcaYrRNJh4waGoUqytz4Xf7jJYYiR0aKOdTM547+TBsgX6vb3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=PhfuUTss; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="PhfuUTss"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6433CBFB98;
	Wed, 27 Nov 2024 17:44:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=dkim;
	t=1732725878; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=X1oXhqEsz9Br6MRzf1dH+hH5nzNYl1h9TOKMungz6pU=;
	b=PhfuUTss9WT1lTnktA3gwOzlukMBwMCL5XxMcHMzvuVZxzw405Yu/EdBKcgLpLs1oPRium
	nsAfKe5cPl97Dciy8rJfBUmw8kpqbQSgkDy7/GQLwBNAZuyu6xAIbvH95woGjV2dENQopq
	7Uryj0YpuJFClA31uUMIHAQuxSYgSgTqsjKZwjHhBO3gMAHITVBXmEOCD26WmaN90wcux6
	QfsoZHeHe7bwQPSBJL+1iAS+CIpDwd9rL7YNWInh8z1jOaXt31Y6Uy0YUlmY16Gytz8qdN
	vkY17uogNSb5XKx4N/FsvE/O35tnVY+QpitvfIJaGyuGtaWnKs3GHmN3mzRwhw==
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
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 04/11] arm64: dts: imx8mp-skov-reva: Use hardware signal for SD card VSELECT
Date: Wed, 27 Nov 2024 17:42:20 +0100
Message-ID: <20241127164337.613915-5-frieder@fris.de>
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

The USDHC controller is able to control the IO voltage of the SD card.
There is no reason to use a GPIO to control it.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
Changes for v2:
* new patch
---
 arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
index 59813ef8e2bb3..33031e946329d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
@@ -232,7 +232,6 @@ pmic@25 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_pmic>;
 		interrupts-extended = <&gpio1 3 IRQ_TYPE_EDGE_RISING>;
-		sd-vsel-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
 
 		regulators {
 			reg_vdd_soc: BUCK1 {
@@ -555,7 +554,6 @@ MX8MP_IOMUXC_I2C4_SDA__I2C4_SDA				0x400001c3
 	pinctrl_pmic: pmicirqgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03			0x41
-			MX8MP_IOMUXC_GPIO1_IO04__GPIO1_IO04			0x41
 		>;
 	};
 
@@ -623,6 +621,7 @@ MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0			0x1d0
 			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1			0x1d0
 			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2			0x1d0
 			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3			0x1d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT			0xc0
 		>;
 	};
 
@@ -634,6 +633,7 @@ MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0			0x1d4
 			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1			0x1d4
 			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2			0x1d4
 			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3			0x1d4
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT			0xc0
 		>;
 	};
 
@@ -645,6 +645,7 @@ MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0			0x1d6
 			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1			0x1d6
 			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2			0x1d6
 			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3			0x1d6
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT			0xc0
 		>;
 	};
 
-- 
2.46.1

