Received: from mx-relay153-hz1.antispameurope.com (mx-relay153-hz1.antispameurope.com [94.100.133.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B458260565
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 14:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771597924; cv=pass; b=Iib6kHpPokI75jrk1KZA9AuczlclpqnhBHhYFK56KT1suSpO4D52cBzNaUQXkiFIJMVOVnlxHr687HUOMjKFHGqUviJcwTS/hDk5rPyKd4Zm+QO9UNEh5Lf2cfkK7LSdkzclNsDfQJRFnJiyt7rF+DiXChjJUdDAQGSvK+PZLto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771597924; c=relaxed/simple;
	bh=VLBNeTJVoYPKQzLti9FIX4L3Mys6a67OEwBWaVUzqg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IWPTsZCXFxMslaa5jUfgxgMDLvY7Ly8oDPgRpCYSr8SDrdLAH2zoj5STnYatqw1CZikPrOcUlETyVXOL4wtcfigPOycj2PLrugrAFCSCplY0DFo3L15uvbwIaZTOAfyBYK3+bKQbvaYwg8uebNgo2jLxMBDPdXg7mCm+RPwayMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Te8CL6P7; arc=pass smtp.client-ip=94.100.133.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Te8CL6P7"
ARC-Authentication-Results: i=1; mx-gate153-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=ENdcNjudCZOeI3PUHLeXLzIdft7hUCMR4wfbEPD2azw=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771597844;
 b=iRl+48e15aViPYM3oKbzWjf+0Ve7bPEiO8JFmMWEIt8FrVubepXpDsMemHKxsZecOwo1NDpv
 ilBsFIx5/409eN6smiS47ErBx0Hz2MaemJhxyBwVivXcfU5HhtJwvHbA5wHLMaTIijAyyjYGRdy
 CTWCBqNoxNof7jNTvFxXtOiCe6gYdkVqcmvkA5DT2q7keoBWjbYEY1nH+EuG2FUhUWdBEQqOBa4
 JWNsYKn1RxcB0WPROYTyBO6kab1Mverb3lXgz6lWrbgsi0UaErDFmR5mJAY8eDvriXyeidz53AY
 1+0FayIfbGta/FaFTNjR0x1dg4X4gdqGjxftxukU6csSw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771597844;
 b=o0LnvApQigQpJDJ5BuP7COt2Ft+jxFPFyncXgJP0FYRhJXzIzZGyYXnwBLR3L7Nuspp/KNhQ
 tfNQRKMwjP3Wqef87AG/RaJFdDZ5lalBoHxo1TfZx8m0/WodTZ7I/eczoFmExcd9glMoCNQPfBk
 tMWpStiIAXNNZ7JpPp54/jK0hpQBeqs48PNAWCTYXJAdILPCV1k0aOkfdRDIo2A2zAkeVfNvKOE
 cj99qmnT9ixTHUJaVEtgpD2T4nyUrm/nYZ5EvLl1+w5B1paFwyCS6Fyak7qrMliMtzLxIMVpEOf
 JI0LLk891GPN9yke1ujaZebqmfxJqGMGIbGSGJDQmRr2g==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay153-hz1.antispameurope.com;
 Fri, 20 Feb 2026 15:30:44 +0100
Received: from merchelm-W2.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 8423FA413CB;
	Fri, 20 Feb 2026 15:30:30 +0100 (CET)
From: Max Merchel <Max.Merchel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] ARM: dts: imx6qdl-mba6: add boot phase properties
Date: Fri, 20 Feb 2026 15:30:05 +0100
Message-ID: <20260220143008.186851-5-Max.Merchel@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220143008.186851-1-Max.Merchel@ew.tq-group.com>
References: <20260220143008.186851-1-Max.Merchel@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:max.merchel@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay153-hz1.antispameurope.com with 4fHXj31q7dzqT3h
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:f301ef9e349f7c57d41eb56594cc14ea
X-cloud-security:scantime:2.427
DKIM-Signature: a=rsa-sha256;
 bh=ENdcNjudCZOeI3PUHLeXLzIdft7hUCMR4wfbEPD2azw=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771597843; v=1;
 b=Te8CL6P76zTt/mQTO/xhgFlD9vhSwzEyg5goZvMZXkoxveIVvizzXoNbJ0n5CwM+Z9bM/J6G
 7KF+/dOyCRYXhagf3+41zpN7qG1rI4qKklaX0dDKq4drADMUcnbPDI4ig7fIuAphuwKSJkKEqST
 i1JzkrD3bimaptqQg747fv/y2HmKB3sZGTeuazVxwOLmcegwyFydoa8nEgjwTnbBtER2JDPJbY6
 ZdmkaEI8fQOpkX6Thoqz0euocLX+jb1ivvU+M8tqC2Re0IC11l9Zv0Rp9OQWqBqyy/5cF7IF/0L
 6EZzgXdEVvUlKdlXcXTvgFANGA7Yd7lGvcuDuSC51xP2w==

dtschema/schemas/bootph.yaml describe various node usage during
boot phases with DT.

MBa6 need I2C, GPIO, SD-Card, UART and watchdog access during
boot process.

Signed-off-by: Max Merchel <Max.Merchel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
index ee2c6bec92e8..74ccfe56828f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi
@@ -206,6 +206,10 @@ ethphy: ethernet-phy@3 {
 	};
 };
 
+&gpio1 {
+	bootph-pre-ram;
+};
+
 &hdmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hdmi>;
@@ -214,6 +218,8 @@ &hdmi {
 };
 
 &i2c1 {
+	bootph-pre-ram;
+
 	tlv320aic32x4: audio-codec@18 {
 		compatible = "ti,tlv320aic32x4";
 		reg = <0x18>;
@@ -274,6 +280,7 @@ &ssi1 {
 &uart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -346,6 +353,7 @@ &usdhc2 {
 	no-sdio;
 	cd-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
 	wp-gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -354,6 +362,7 @@ &wdog1 {
 	pinctrl-0 = <&pinctrl_wdog1>;
 	/* does not work on unmodified starter kit */
 	/* fsl,ext-reset-output; */
+	bootph-pre-ram;
 	status = "okay";
 };
 
@@ -544,6 +553,7 @@ pinctrl_uart2: uart2grp {
 			MX6QDL_PAD_SD4_DAT4__UART2_RX_DATA 0x1b099
 			MX6QDL_PAD_SD4_DAT7__UART2_TX_DATA 0x1b099
 		>;
+		bootph-pre-ram;
 	};
 
 	pinctrl_uart3: uart3grp {
@@ -587,6 +597,7 @@ MX6QDL_PAD_SD2_DAT3__SD2_DATA3 0x00017059
 			MX6QDL_PAD_GPIO_4__GPIO1_IO04  0x0001b099 /* usdhc2 CD */
 			MX6QDL_PAD_GPIO_2__GPIO1_IO02  0x0001b099 /* usdhc2 WP */
 		>;
+		bootph-all;
 	};
 
 	pinctrl_usbotg: usbotggrp {
@@ -602,5 +613,6 @@ pinctrl_wdog1: wdog1grp {
 			 /* Watchdog out */
 			MX6QDL_PAD_SD1_DAT2__WDOG1_B 0x0000b099
 		>;
+		bootph-pre-ram;
 	};
 };
-- 
2.43.0

