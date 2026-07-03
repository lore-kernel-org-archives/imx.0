Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654AC37D126
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 08:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068373; cv=none; b=gfGv6FsfCn0t6qqMnNsZ3RfRkIVgOKnyOILr2Zba4veHo4Yy4J7fEVa1gKhXk7CmEYgeP2nMRf6eS2J7PdzLCSf4sEk+xEgBr8gd9R+8dY97eWLPqm1ESnQ1y6hxpGbTit22KrEvBEGcq0PLOq9lSdW0A8qPSg7TWIdvReJL+sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068373; c=relaxed/simple;
	bh=E8D2Pp3GZk7l8flDyWsDGN+v1xV8lS1HufxU972x9Do=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HQpKfkV7gOXAiEqYS5ZYzr66G0jdaOMLEQQX/4Zee1YwZPB41vHx+RiDd4pgrkxxb8f6cQF9TmhgUVtwo6qoOdw3e+gRsp7m/M6fspQhSeI9e48U+D1h4+oXojxwydEg84QLa+sjdGo+nsNhB3itoXZDrrfudWQSEyiCdNRNNmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qg/xEzs2; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qg/xEzs2"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493bab44440so1741065e9.0
        for <imx@lists.linux.dev>; Fri, 03 Jul 2026 01:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068368; x=1783673168; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/Vk5h3C2/HoI+a/W5fGw2if/3IbStBgrfTZj/tnSBs=;
        b=Qg/xEzs23C0qg676WY/JOQSLQycq2gyZNPglcR4z1TAoAFd1oslE3cQsQ0sVJKPitr
         KusFFNPSV/r7eUVlkbxH4uKHWs0VsRfvYodR9CqsRsji8caPZkdjlnbBWxzZvcsH4JYi
         FJ8A62BLZpuiIKTIZECwGRR83nFC15ieiUBkkWX4JM9T/MMCGegI2/xltOUvFOWhZuaV
         rxPKc06XL+SOiYjiY6/JqnotaUu8qF4tjS045PYDzQIht4gOD2pSX8PonUmpqMXLJnPT
         8KbMmLmMw5IcCrBYVbNnAKmQnbCEs56iX5qQcGU7CAWnxN7ql3H4L+hwnYhs4g7K5kb6
         cTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068368; x=1783673168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1/Vk5h3C2/HoI+a/W5fGw2if/3IbStBgrfTZj/tnSBs=;
        b=sQwNHlI8zsRAfSAtkjkA1yP+okNqv5mHHYyxj8lop7G+FZY+pO1sEkveHQtO/QvGYN
         VMmXwD0setuDNjH+35JfX1C2RG14345Iu1dUNf/ST4O4N2kr/1kXJTyYPyNszmmvV9KH
         dEFSAI33jrBXNOJOgUzlFwTyxnF7xiNyZSxoHPMeDRkEyALaC9O26ArpHPmAJ3Uj13n5
         YhGGB8sjXxdH9NVnPQiQ90Nd59BVnquc+DS51p7QqBtup9rzc8oJcE3BG66in8iCcHds
         Z9GVdgXIQ4Avd7wL7kZFxTzS2j3wwEwGNHqIGBVjaKFnOCyfB4n0TSO8mSOT5/b6nevW
         AybQ==
X-Forwarded-Encrypted: i=1; AFNElJ/IjNpvZYmPa/7CbEXsb8IaN7P0nZ4L/gC2cCLlgNM2BH64Yzf+eu0gom048mnaVHyhOb8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTav80It0U049x6Fg0F00WDl3hY0+lGTGPiYZzcN0DGUwK4xNF
	8ZH3iu9F+azstNVntdlSA0zbWbCu7YFHZ3IlNRhEYCxq7X0+gD2xiaAe
X-Gm-Gg: AfdE7cm+MDtS/Jew2905HujXppEqtwZKnRwS853yeYGy1uMwMls3j1fzUuid9Ke0i3m
	onGoBFqecP6suZfas90lzcbwbwgDz4rtLBD2nHSfniFbc48p2OVV0xHJ6mt1vWui8fpyjR7ZZUe
	i5dA+ouAyc73dkkj8dQnci2aoBB5/aFxm6W0V43GoNtwBPxW3VBL2xuvzmpb+0w2VHbCHlf7JOv
	cCkuSde5BOMrM4dOdbCxuIuT+WzvR93sFwNA28k73+7kgWHW/FXPnY+ozKE3Fx6/CRBlkSWR2gU
	DjF/Blpe2H1otCOX+8lXbLdwfuqvk62bB6OpoGXzVsjitw+BZjbMXZZiB7LzkVVQSh+V+5pcZlf
	pTumL9u9q0k0w+DNrFFXgzQt4vjv1dRoY7eIPazLTXlQXCLB3IZwNW9Hw9qW+BxAu2depQxy1u+
	Oan7DhJmS8yj6FwjXQ6O/bdvQUnYk48eVBgLM1WhutkSFGayG9m7UP2TIBeLFc7HYusjVu/UF7R
	jedmAA9HYNiopRwWse+eV/qQw==
X-Received: by 2002:a05:600c:3f0b:b0:493:cbdc:7cd2 with SMTP id 5b1f17b1804b1-493cbdc80cemr21533515e9.3.1783068368277;
        Fri, 03 Jul 2026 01:46:08 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:07 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 01/15] arm64: dts: freescale: imx8mn-var-som: Move UART4 description to Symphony
Date: Fri,  3 Jul 2026 10:45:48 +0200
Message-ID: <3ddf65049a048dc4760df1e8ae5af4d3e91ca77f.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The VAR-SOM-MX8MN module does not provide an onboard debug console.
UART4 is routed and exposed only on the Symphony carrier board, while
custom carrier designs may choose to expose a different UART.

Move the UART4 node from the SOM device tree to the
imx8mn-var-som-symphony.dts, keeping the SOM dtsi limited to hardware
present on the module itself.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mn-var-som-symphony.dts  | 18 ++++++++++++++++++
 .../boot/dts/freescale/imx8mn-var-som.dtsi     | 18 ------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 3434b189fa58..b07e71d3adee 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -15,6 +15,10 @@ / {
 	model = "Variscite VAR-SOM-MX8MN Symphony evaluation board";
 	compatible = "variscite,var-som-mx8mn-symphony", "variscite,var-som-mx8mn", "fsl,imx8mn";
 
+	chosen {
+		stdout-path = &uart4;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -171,6 +175,13 @@ &uart3 {
 	status = "okay";
 };
 
+/* Console */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
 &usbotg1 {
 	dr_mode = "otg";
 	hnp-disable;
@@ -234,4 +245,11 @@ MX8MN_IOMUXC_UART3_RXD_UART3_DCE_RX	0x140
 			MX8MN_IOMUXC_UART3_TXD_UART3_DCE_TX	0x140
 		>;
 	};
+
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
+			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
+		>;
+	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index 38ef9e4fdf07..32f101ef2850 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -11,10 +11,6 @@ / {
 	model = "Variscite VAR-SOM-MX8MN module";
 	compatible = "variscite,var-som-mx8mn", "fsl,imx8mn";
 
-	chosen {
-		stdout-path = &uart4;
-	};
-
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0x40000000>;
@@ -274,13 +270,6 @@ &uart2 {
 	status = "okay";
 };
 
-/* Console */
-&uart4 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart4>;
-	status = "okay";
-};
-
 &usbotg1 {
 	dr_mode = "otg";
 	usb-role-switch;
@@ -432,13 +421,6 @@ MX8MN_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B	0x140
 		>;
 	};
 
-	pinctrl_uart4: uart4grp {
-		fsl,pins = <
-			MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
-			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
-		>;
-	};
-
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK		0x190
-- 
2.47.3

