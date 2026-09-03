Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0244F55AB
	for <imx@lists.linux.dev>; Thu,  3 Sep 2026 17:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455306; cv=none; b=GBrZt+ZU9okgHIl0bO9TELveN7u62J7U/DfdJE4wIgYoN/pQI2q+vWuB4JkeMyGC7LOaWRMbtDIdCLosok0ttRY+lSbCKsWu0v1aHIcY++6jiCTOLKc5hjYjOfTMkrt0LiIs8tmrlaPeZatjua8JXFkGoJSYZUvYUEhwh30Ev5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455306; c=relaxed/simple;
	bh=sdQHH69f077aoixYw2GEaFiPjMO2xKr62tsBGVZ1LIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KaMxULU4qz6d14a+WZ5jqL4sZklcnoSfzHPum8mGMXGaoe0kZ3GFvVSzAnT8FHegjLMBj2G/HHgldp1MjHFTkgonx3OM+oWnHqAOD05VHyPCo7qrhIAUyj/f5IQbaTjomGvcN4mW3onnZg0KvQTyhjwNNfojuTDxWtV9loucDUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r2qRC6vc; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r2qRC6vc"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so1118475e9.3
        for <imx@lists.linux.dev>; Thu, 03 Sep 2026 10:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788455302; x=1789060102; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+PNOmjiL8zGC/XcXuOVjFCBPvUZNDZ0am9nzcG73XPo=;
        b=r2qRC6vcQ0SaBfVoPulS7wUkrHghvFDYqF0V9BWjQ55l5+BlYr/zoeFezHZgB4S6Z6
         vxuPVswgi5R2PzzqeizBAwCfkJ5v0TLIZJWJzuvb3h0Nrk3xLwK+ZdycduqAPp86LUtr
         +xtdB4wxa/hij4WENJoGNOmOwObzrnRkl8wM94GQCptgSlarV9p8+tknygmSiVKkX9fA
         t4cNBgOuD+pcyrNudLjFt4W24ZQenpIw34a1JoVHZu6KOhfwVy5TlpzIEyhqWOnKohux
         rs7QTPOaInM0S6hTsiWNE+Wf1pAqnrvMtGvey0L3CGev7ooxr+tUBt7SxYvdmborlO7X
         xi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788455302; x=1789060102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+PNOmjiL8zGC/XcXuOVjFCBPvUZNDZ0am9nzcG73XPo=;
        b=OrPiwhRTptexoseYupBWtpww5tX2bGtL2Y1lxcnT0ttfC1ywncpAim/HcHxEQuPbQa
         n6d/BFmSD5zB00HV7lR7Sesnc5xur3pEc/r7LYA/yHnU9xAn2W2VwMZzUzyWiHP8eLmC
         zNKt97lqa77+mM/q+GaXOW6N8b+mYAFI1Gh8wY0DpUpwLEFzgcysGqPPMO3DK5PGy71y
         w7lxLyM7vTiEWzRqHd6L/bNDinFlQKpRIZwf5mcCXkdMnZGumRxM/Qgd/0WF97Bg9VCN
         H82BIHxsaS4IWBCWPFOgcoLMLXGUFviCAlQDGlJrIoDXy/algF4dFShphnKV5CQWSAsZ
         gbIQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2bY0/2Hmu+Ad2avko9sXRCcLHtTO/T+ihY0U7RGDOdcKeqU0Unzet3r1Uc9jLyIo04ks=@lists.linux.dev
X-Gm-Message-State: AFuF++lTg7djd2mSn2H/b9hfmYOcPfHu5uHE3AtcS5PLh5/IYW2Rf2mf
	USpTagZ1s7oNIwM03erMorvUDSm8/Vn7WAWeIa0kyE2JwmuICQIaHCfO
X-Gm-Gg: AYBFou2zBNPlfyi5WcFZBBm5UWNajJTRXpIyPg+8ogXEFYco4e+CNLJSnINW/eVFksS
	LYSSyu92V2cYR1K5Fj3Ckh1MRUXUP1xCx6qHnGbYI4YDVM29tjAXJxgH1wNSilgR2iON17RNaKs
	iOQgalHVKZ2/dqLVFlSTfK7OVAVEYXjTHflu0H6gsyMJc5mFSlmdzOPfIh3hQEkclFiWcyvohCw
	x4/O3gmLUJOexvSxzzYf60iyEDRKvLSeav46d4xLBHAzICbh+3Y1tRUEdnrYoh55VzPZtVVzhe2
	vlW9rj6vYKu+PeovJQV0fOqGo+vXtJJeomROPMmxAzP+eMZb8XNuTG4ES1rAFb8cbWyA5Jn0QJX
	7aCdi7geF6ZYOKgH3+XVD2dJ0CReiLuUGckkYnGkza4yVmgnrldx7eHFYWwqik5Vq/rT29t7lnT
	xCZeqQwPPuIIn46BXAJjoxcv2wTAaCrrtGR/1h3ZqH1kTcSI1W2lWmCp+VcVvcwItgyoVYjJh32
	t0jV02jQni6f4GJEvYSjen5ZfCQ3LJ+svoYlhFcdskY7M3UVlD0NY4DI01dVEpFudKsDhaslv/7
	iovB9EYnPjeEDFuV74ax77uqq/c1FD1tSs93UQ==
X-Received: by 2002:a05:600c:c168:b0:49c:cb6a:1687 with SMTP id 5b1f17b1804b1-49cf5bc7608mr35422415e9.4.1788455301357;
        Thu, 03 Sep 2026 10:08:21 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm107799565e9.3.2026.09.03.10.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:08:20 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Thu, 03 Sep 2026 19:08:02 +0200
Subject: [PATCH 2/2] arm64: dts: freescale: imx95-aquila: Add ENETC port 2
 in SGMII mode
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-add-enetc-port2-v1-2-2a21139d7a7c@toradex.com>
References: <20260903-add-enetc-port2-v1-0-2a21139d7a7c@toradex.com>
In-Reply-To: <20260903-add-enetc-port2-v1-0-2a21139d7a7c@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2

From: Franz Schnyder <franz.schnyder@toradex.com>

The Aquila ETH_2 uses the ENETC port 2 as a SGMII Ethernet interface
on the Development and Clover carrier board.
Enable the required support.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts    | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi       |  7 +++++++
 3 files changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
index fd93043314466..365bce73eddd3 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
@@ -67,6 +67,15 @@ &enetc_port0 {
 	status = "okay";
 };
 
+/* Aquila ETH_2_XGMII */
+&enetc_port2 {
+	phy-handle = <&ethphy2>;
+	phy-mode = "sgmii";
+	managed = "in-band-status";
+
+	status = "okay";
+};
+
 /* Aquila CAN_1 */
 &flexcan1 {
 	status = "okay";
@@ -227,6 +236,15 @@ &lpuart7 {
 	status = "okay";
 };
 
+/* Aquila ETH_2_XGMII_MDIO, shared between all ethernet ports */
+&netc_emdio {
+	ethphy2: ethernet-phy@4 {
+		reg = <4>;
+		interrupt-parent = <&som_gpio_expander_1>;
+		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
 /* Aquila PCIE_1 */
 &pcie0 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
index 3df17700b632f..2ff7bb8d6ac43 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
@@ -99,11 +99,29 @@ &dsi2dp_out {
 	remote-endpoint = <&dp_1_connector_in>;
 };
 
+/* Aquila ETH_2_XGMII_MDIO, shared between all ethernet ports */
+&netc_emdio {
+	ethphy2: ethernet-phy@4 {
+		reg = <4>;
+		interrupt-parent = <&som_gpio_expander_1>;
+		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
 /* Aquila ETH_1 */
 &enetc_port0 {
 	status = "okay";
 };
 
+/* Aquila ETH_2_XGMII */
+&enetc_port2 {
+	phy-handle = <&ethphy2>;
+	phy-mode = "sgmii";
+	managed = "in-band-status";
+
+	status = "okay";
+};
+
 /* Aquila CAN_1 */
 &flexcan1 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index 69dc962a24a1d..f930965cb341f 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -16,6 +16,7 @@ aliases {
 		can3 = &flexcan4;
 		eeprom0 = &som_eeprom;
 		ethernet0 = &enetc_port0;
+		ethernet1 = &enetc_port2;
 		i2c0 = &lpi2c3;
 		i2c1 = &lpi2c2;
 		i2c2 = &i3c2;
@@ -209,6 +210,12 @@ &enetc_port0 {
 	phy-mode = "rgmii-id";
 };
 
+/* Aquila ETH_2_XGMII */
+&enetc_port2 {
+	clocks = <&clk_serdes_eth_ref>;
+	clock-names = "ref";
+};
+
 /* Aquila CAN_1 */
 &flexcan1 {
 	pinctrl-names = "default";

-- 
2.43.0

