Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA272FE560
	for <imx@lists.linux.dev>; Wed, 29 Apr 2026 13:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777471047; cv=none; b=k89Ga0HjX6r+9Di0RuaioE02HQ9FeE+8TPHYy24sroH13wEX5vRtyl185abbUa0rVyZBWpXS4QSzOFXkEQZI1y9XeP7NSkmmJapojWHRv992puKWnEGZlRRe9rRN4y5v/bqXAEHqvfcsCnsaFirD4q+ThPsxo+WBmAx+78cS6TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777471047; c=relaxed/simple;
	bh=gGk1cuRh5R6nn8Nt99YcR4IXdl6kUEHJN5Vhj/i9vC0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GYfkTbai8WbfqUEHL7gJyd/A1zX+8RBpGNRAuGU8uKRTEDjdPuBLwpGfYSMOx88hFA1khqkn226tunp6NjUoLEvgVhlYEBn1TztS1tjNMHZbbupabXSrB8riq+TRye0Xm10prlm9XF22wO4kzxE70IqReKA2UCyVhQCMW8aJFvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=deviqon.com; spf=pass smtp.mailfrom=deviqon.com; dkim=pass (2048-bit key) header.d=deviqon.com header.i=@deviqon.com header.b=Ui7SxrcE; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=deviqon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deviqon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deviqon.com header.i=@deviqon.com header.b="Ui7SxrcE"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so108812015e9.2
        for <imx@lists.linux.dev>; Wed, 29 Apr 2026 06:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google; t=1777471044; x=1778075844; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ei2I23cxbDY7cAitx1gRFwNnFrB/uSmdwFv7/9roIc=;
        b=Ui7SxrcEVN4F6zCK+P6EiNiWdQfghX4j+mRlpo7++3pOjh1FYlzog5K5pzXVzfTQW3
         N7TOqUvIiCe73BLYmqTMZrlY5lx7SCUKnnC5rr9B72nFFj8LsD5H96JzUaLSNFmKIKIx
         BvJ8CNXv1e3+o9jEpzOwUsyRhl4C0ybBfWMr+cmpw55sCt0tFju8dBT3GVtPutfqLPUv
         tV6Wxafh7oZ69DX0W2PvYaRoqgmO+H9jsfuKFD8+7FbghZ8MS8+w/rHjywQOjEmw21dL
         GTQtix6+eFbcu0tKwnf8FM35x3qDBeXbNY1w/S6L3audOIBSaRK1SVO6z7TVRtW7cmx+
         J+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777471044; x=1778075844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ei2I23cxbDY7cAitx1gRFwNnFrB/uSmdwFv7/9roIc=;
        b=Pn/TIz/SzXkZh6a6x6rlCqDdBykH3FVPFVYA1X0e1MXYzqBKl+pL5K3l84N1RR5Gof
         GOgcHTIs8bVNGTXY2B8keTj3m9WcGEoerICwiv3RQSR+ZJ6a4SGZTIlDLzZDIgSyL1L2
         /3fZaYRgttwTGo4ALhLtQ2RZJ28xe307culzDWm904sBiY2vsLZaPEt98u3LT9hh+t+y
         nsduZzVT4av6+mTgas76NpDPrTTrDr8eIT/6FfSyeWKW7gRQ240rq5Zm/sArTPj3GFlf
         xJcVYuSzNbLMqk+sC5GRBX+tMqj2KCGji2u4OKS5xXZME4NyVyn4ZuiIxLsLKKsJU0vm
         JAGA==
X-Gm-Message-State: AOJu0YyYMDixV6s3yBCwNHorxL5XNiz3uxFNm6+LUjpJ/ECWITDpO1hA
	FAgXgPknSFpw4hj02ncbSDOI2YL/232Nfp5w/0kOAXha70mHyNZX+x3xNdt0oyNI84Xg/nJsL+5
	npEgJ
X-Gm-Gg: AeBDievvpK/2u3S2n8/WIOXk4gqbSdm+I31F/Pzr2D9GbdBN3VyWeuWgsMCgc09dBqg
	BNL0gZgLuKyrYd/FcyOyD7ZaIyCAMf7Qx8lzAuZ2UazWcc0M3SKP6wCZ+ROTMRGsA6m9+vTf/2G
	vWxJLsfFKz3jOl/hSxzOCOmgHW1BfBG/XK7FsGbqJe08dKPPWkCoH08tiMbFymE9EciNVldWEem
	6s8QierloTeAVZiQ3mqmpyGvpGpNsbKiWivzkhuhgiNvKTjfuEWA7oDrr8TvhLHy7OkIRXNPcyC
	wChLyLOSo+ApbR7WVCq67cgCnMswnQHlPNQLIsmBjwUJu5BjK/U/aqMQIjtWbsw3nDrf9QiQqpz
	oSfYexbWI8RqYKf8JuG2P+2aYq8mT6wcglUUe8QWCpc3s+e7t5EKWsHYMJNVrIC8mtphLBPC4F9
	QPc4DqCcDD4vvFLrObjyICmfOnKXguHF40
X-Received: by 2002:a05:600c:4e91:b0:471:700:f281 with SMTP id 5b1f17b1804b1-48a7b54b1c7mr69612835e9.25.1777471044190;
        Wed, 29 Apr 2026 06:57:24 -0700 (PDT)
Received: from mercury.. ([188.24.13.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7bc1cbfesm68516515e9.4.2026.04.29.06.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:57:23 -0700 (PDT)
From: Alexandru Ardelean <aardelean@deviqon.com>
To: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: festevam@gmail.com,
	kernel@pengutronix.de,
	s.hauer@pengutronix.de,
	Frank.Li@nxp.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Alexandru Ardelean <aardelean@deviqon.com>,
	Xiaofeng Wei <xiaofeng.wei@nxp.com>
Subject: [PATCH] arm64: dts: imx8mp-frdm: add support for SD-card
Date: Wed, 29 Apr 2026 16:57:17 +0300
Message-ID: <20260429135717.178982-1-aardelean@deviqon.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i.MX8MP FRDM board also has an SD-card slot, which is useful during.
development.
This change picks it up from NXP's BSP repo:
  https://github.com/nxp-imx-support/meta-imx-frdm

Adding Xiaofeng Wei's as he is the original author of the DT.

Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-frdm.dts | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
index 55690f5e53d7e..84034b0ccb12d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
@@ -42,6 +42,17 @@ memory@40000000 {
 		reg = <0x0 0x40000000 0 0xc0000000>,
 		      <0x1 0x00000000 0 0x40000000>;
 	};
+
+	reg_usdhc2_vmmc: regulator-usdhc2 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
+		regulator-name = "VSD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &A53_0 {
@@ -237,6 +248,19 @@ &uart3 {
 	status = "okay";
 };
 
+&usdhc2 {
+	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
+	assigned-clock-rates = <400000000>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bus-width = <4>;
+	status = "okay";
+};
+
 &usdhc3 {
 	assigned-clocks = <&clk IMX8MP_CLK_USDHC3>;
 	assigned-clock-rates = <400000000>;
@@ -289,6 +313,12 @@ MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11	0x146
 		>;
 	};
 
+	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x40
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	0x140
@@ -305,6 +335,48 @@ MX8MP_IOMUXC_ECSPI1_MISO__UART3_DCE_CTS	0x140
 		>;
 	};
 
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d0
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d0
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d0
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d0
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d0
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x194
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d4
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d4
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d4
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d4
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT 0xc0
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x196
+			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d6
+			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d6
+			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d6
+			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d6
+			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d6
+			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT 0xc0
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12	0x1c4
+		>;
+	};
+
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x190
-- 
2.43.0

