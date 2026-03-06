Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89944439010
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 19:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772827123; cv=none; b=XXpzJa8hdSIisbO2CAcuG6xiBOQTQZAtK8rbIe/On5oAIhleKupOvh5mQY4SNCBQ0jFa1wef6JJ9eYW9BcUKWTK9PqJ5T/xJuAykDTA8CA5EQy8mHeJa1mQRYaLtP5dqwnZtkrzue8Mcl9rL8zdLwpRoofieI2MV83zRNv23D30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772827123; c=relaxed/simple;
	bh=VXFoPt6FDk0uTYR1HveyNp607pXL841lrETZO/GFuoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bpAljSMPyqo7dI7R0fVkiiRO7GC/b0+MsY57/7bGLHZll24xHHYqxZHcRNsNrQbhUjWn6YPpcCFqUTpqh7OpnsYY4NMBG8xKqMBY7ivUUbHGZBuF5AOw38xtl9dCMVNFEg4GBrDz6zh7JmuuhS1mSgZquO18uNJEKXbgKWlA5iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mZ9YTPn1; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mZ9YTPn1"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4837f27cf2dso89984235e9.2
        for <imx@lists.linux.dev>; Fri, 06 Mar 2026 11:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772827120; x=1773431920; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvM/p0ei/4Q87LGneFYY4Bf76uB4N3gLQRtuf5Hkp24=;
        b=mZ9YTPn1ELNjs61EyXM5tlMWtqogg7GMaEeueBR8F5xk5JdGqLabhNw2Nw22R/e+PF
         uDHd2Dxc20UHxqH355j63+WbgeKL6Xqe7VdGiepeExzJJQ09BBT1I/hpLNYQUDtZlF6V
         oigaeXRA4hM/d4h5OzN0Njh9nJTklCtPW74EfXomKLyDT3J59Ls0lGIvToaoIhAgE3JR
         LAtcmg3IGsLkZ97ZcvOFvF+lwPBMIiW8l5/EzqQzmvoyeFSE44e5eivbxRtCT0v7qnJ/
         sK7FKD9tSKcBm8ko0h1VctXciPMizoS0MFBq3fjcoKgNIkxsgoNDz6Q2fJm8vs5xVaPS
         6Bhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827120; x=1773431920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tvM/p0ei/4Q87LGneFYY4Bf76uB4N3gLQRtuf5Hkp24=;
        b=gBHSNOJZP/JU+99LXettvjOhFGhGDKwvinpSxzD6LioxSkhu8aTmXbGiJQls7C6jKH
         bP3nS9YMhQXlw99bcuLL49c5YDDhvlJC1lbtdOO+XL4+HqxE7+mucoPyv/2loimDe6GI
         gUaceYUjz0DnUErZPu6Dpg09N/utCh7u0FnlVN7qlY0J7F7/LMp6TvsQlixPKhURwzNu
         kq6NdIutc4zVnIzgCytrnQ1tQivBazJ7R6X8krB/7XQ9ikoN/XgHop6wOAoQugn4yx3S
         noosW9t0vjOr3uFai2NH+mRppEk9aijZl2iJJJIa7DwgzDlnIpb7Awf/B7Oy5hUhcbZD
         /xGg==
X-Forwarded-Encrypted: i=1; AJvYcCXhj7pOXr5Tigbe4epVQO0GVJhXkqyrKyu7z+CCJZ7Ds18b5VD6T12GeNNwuo0HK7xIeFA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7aLG1aLN3qlyiYO62+lO7hnA/EGXGDdSmQ5XbJel9MpVGv+BW
	18OkJ8/GkfZw3D2AdVXXnUbdG6/PXWF8ULdH8JIzVk1EegQnqEqiIQaj
X-Gm-Gg: ATEYQzyKkImB/oxoc4A0CYtImCk2jxwEx5rmT6b+ntRrPRTDuaVa51Sn9a0x+E669Dt
	m++xS/5sAnrXDnLrMmPZ/6Zo/PxQfDCPYD9oQFItmtYBkps1wKGPUAFx9JOV2ZnFg0g4hz12n2Z
	c5hIuYOquhblBXJe1/XmK8HXeFz4W8KN1ZCcl6FvjTJJbwaqcsT09xqQzuFhVZeuuQJxErv+ymx
	72KQlVma/lyrsEVX6JurTLUWNYlV7YPbBtu5JtdO9DR1B8Ssbjb9+OTr5iY9zyk+JRrt8HqIeYR
	wmS9tYLG6KrxOZHlEwumkovnoW4SYGUWeE8jelPA0UFyNtNGHRr82gA7zzxn2likWQrVT02c/dP
	MHr+lAlqulOkF+Y+gV+BUS2sOuDuNydiwA8+qNYNZmbb3nr411Q/2cC+p+/7bHO3AODows7F2ti
	NiudSSdHhBUmMc0T5D1G+7wYjtEtOVyZzyUjUCQo3YqU3GFkW+HVwIn+l2LdC4y07/pHIwr0FoA
	f2/3/i1zX0WTvcO7jKOe3qaqff+MtAW4nhimzo=
X-Received: by 2002:a05:600c:5253:b0:475:da1a:53f9 with SMTP id 5b1f17b1804b1-4852692c99bmr54384485e9.14.1772827119887;
        Fri, 06 Mar 2026 11:58:39 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48523803b5fsm25167265e9.7.2026.03.06.11.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:58:38 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 01/11] arm64: dts: freescale: imx8mm-var-som: Move UART4 description to Symphony
Date: Fri,  6 Mar 2026 20:58:20 +0100
Message-ID: <b2ac5175ec9ddb308261746b967d13557958ba0a.1772826534.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772826534.git.stefano.r@variscite.com>
References: <cover.1772826534.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The VAR-SOM-MX8MM module does not provide an onboard debug console.
UART4 is routed and exposed only on the Symphony carrier board, while
custom carrier designs may choose to expose a different UART.

Move the UART4 node from the SOM device tree to the
imx8mm-var-som-symphony.dts, keeping the SOM dtsi limited to hardware
present on the module itself.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../dts/freescale/imx8mm-var-som-symphony.dts  | 18 ++++++++++++++++++
 .../boot/dts/freescale/imx8mm-var-som.dtsi     | 18 ------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index affbc67c2ef6..819707e6f3bf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -11,6 +11,10 @@ / {
 	model = "Variscite VAR-SOM-MX8MM Symphony evaluation board";
 	compatible = "variscite,var-som-mx8mm-symphony", "variscite,var-som-mx8mm", "fsl,imx8mm";
 
+	chosen {
+		stdout-path = &uart4;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -156,6 +160,13 @@ &uart3 {
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
 	disable-over-current;
 	extcon = <&extcon_usbotg1>, <&extcon_usbotg1>;
@@ -251,4 +262,11 @@ MX8MM_IOMUXC_UART3_RXD_UART3_DCE_RX	0x140
 			MX8MM_IOMUXC_UART3_TXD_UART3_DCE_TX	0x140
 		>;
 	};
+
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
+			MX8MM_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
+		>;
+	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index 190bde4edcd7..b6560c03639e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -9,10 +9,6 @@
 / {
 	model = "Variscite VAR-SOM-MX8MM module";
 
-	chosen {
-		stdout-path = &uart4;
-	};
-
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0x80000000>;
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
@@ -418,13 +407,6 @@ MX8MM_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B	0x140
 		>;
 	};
 
-	pinctrl_uart4: uart4grp {
-		fsl,pins = <
-			MX8MM_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
-			MX8MM_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
-		>;
-	};
-
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK		0x190
-- 
2.47.3

