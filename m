Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E597D2F6904
	for <imx@lists.linux.dev>; Sat,  7 Mar 2026 15:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772898915; cv=none; b=e02HxrBOjF6GgtpE1wTOLIv4AufnRadK2NFKPn+VMdVciAyPFwnWfAs9Ur/aG7UzYYRo8RwRyzTwzEA+Vw1zukgTljVaEdNb3ITKmf47zA+m270abcs3yRlx3DfPlLDiHyrmrGVYXL+ETVDm0siSePHiaG1BbDAWjSXwFthFSoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772898915; c=relaxed/simple;
	bh=dIVrsvVFArK8qAyJ47A5dbgp6jhMWsp0icTIy93oHO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kD6xA/CGOiquwhS2w0wmwrPSWK17DK7O8eYMR/kiL4SEKp0p77vOzEtXLiQOksmXfafcf7F0YS5vtBHrETuWNJJV4PdP1XFvE5rkUquSIF61PnS7DLwt2OeomhfBerZNhGS1wHWa/63mz2ll2V3HJrEs8N2cIxfWwnwUnXFJwGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncNdRQTn; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncNdRQTn"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48534237460so1047085e9.3
        for <imx@lists.linux.dev>; Sat, 07 Mar 2026 07:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772898912; x=1773503712; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRLx3w7DdmIIviZN17jgEZ3ypM6cFQn5Fi6e2rWnxGg=;
        b=ncNdRQTnOW2CwsutovUeal/XE5Sz+/Wc5en2HML+g1AQMycTe3yEFzVCaFc7olUCm4
         5Y0PZOUIvhT/gfbJnUjdCe5dGptTwBBjmIflV26lpDx4EuJgDvQ+I/X5G3fW4pLrCXXy
         TseT7e8rySdWtCQeyMKkxVPWqTqwUJQaZ0mEORESlPlovM8UbXlaYLgeSIUcyZOyDyrZ
         jLaE6CroVMVgzFBPwpGLqZZaJ/t7IPmWRZW4FAg4zw8v5nnNvNrA5t5ejaOlOc4on79Y
         xAmWOoQdTb7wb1NhwbZNDiPZKyz2MnRLEgc1cWy+doMVypJjuwIQ2qi8vc/j18wKeEC8
         j2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772898912; x=1773503712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oRLx3w7DdmIIviZN17jgEZ3ypM6cFQn5Fi6e2rWnxGg=;
        b=iexP4WB+/HLKLmnAHC+kUQOfzXMIFdkU0YlSD2KHYz2OAJ2C+z8kRgNCOrhXaZ6X8W
         D+/yWOg1IxyCdUn2lXOIAh5e9CzxmV4xCGQo7OhXu+SCSdcQkvfTlOuJGreJ6qZOjzDw
         Y5zAojKFhbCeXU19Vzn/AepA28pdhLlPn4hyVv3fuae95hmZ31f4wNhe6uFICSkW2kI8
         Mt06cb1yiMiK2Hr9qyKbccOmmhnSIJ3PgT77JtwL660Y3xgF+fJdNWJ4p7PS/hS/Rvdw
         Xn7s3luUUL+dDYwK9H8MpW6QZ5sXh5+t4fRkr+fouCth0m22tr2P9HjxzG2zdIURvWxf
         2sfA==
X-Forwarded-Encrypted: i=1; AJvYcCWcFM9XRcaNAURlJe8otB/NzUwzmsi4SqCBtz1nMa+07PUfkqWSRSUjo3m30mU2T9Ai7gA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwENjsS9nVCtNXDcXcpr5BOKYONtUZP/RVvKtsa5NtUgWOom3Hm
	7VMRdETDWB1HJXRVfovYOBLP6BFVEYVlwmuXTphfHFx9YtKNWtxr/RZa
X-Gm-Gg: ATEYQzzVq4MEhwGESOUe0aBMzPeGE854xUsv1AWSimpkY3AXoInXixS7RR5LntfelTK
	19Scl6WXpHju+IiL8VUD3JJk4byTQv34fW31zD+fH3mPK8JjxFpoTlHEFL7Rt53oxQds+NmacBb
	5VSLY5UB6W8b3qO0xyQlPxyvi1sydAv+d2XQCQxf+tMRGXNkf3eyiLpefdpmiGljQrLi7Ktenwc
	Ud68KB/QC7ZibS0Mx/+4IHfi4pQKah08+0qd3qUdrnZX1paTliDkDpTzafyi2ayb2817Jvqoy6Y
	B8WtJJVmCoRZHBoHRMpk4RCa53nSAkmv+vuig28wUUmaxKNFxe/SoS1RHdZU+EKfcKsW5s8NZM3
	/A1LWhtXXtuJX45mCHVNGpYcBsUNFM0SK1UAXE6qaM8o0HmNp6sQdrMJIQzukh+Z57U6QNWqqVb
	o2N3lxem3WjEhL51OuxfgucQKUNpezk0Mfn5nIBAFcQ2JAxzQtlxtZNow0BRAnhVgxV4zVXzQiw
	9cUcIguGjQo6gbcOJiiGGu2Aw==
X-Received: by 2002:a05:600c:3593:b0:482:eec4:74c with SMTP id 5b1f17b1804b1-4852695881dmr99969015e9.22.1772898912232;
        Sat, 07 Mar 2026 07:55:12 -0800 (PST)
Received: from GLaDOS.lan (93-35-179-236.ip56.fastwebnet.it. [93.35.179.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm261097785e9.4.2026.03.07.07.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 07:55:11 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
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
Subject: [PATCH v3 01/11] arm64: dts: freescale: imx8mm-var-som: Move UART4 description to Symphony
Date: Sat,  7 Mar 2026 16:54:37 +0100
Message-ID: <b2ac5175ec9ddb308261746b967d13557958ba0a.1772898346.git.stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772898346.git.stefano.radaelli21@gmail.com>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

From: Stefano Radaelli <stefano.r@variscite.com>

The VAR-SOM-MX8MM module does not provide an onboard debug console.
UART4 is routed and exposed only on the Symphony carrier board, while
custom carrier designs may choose to expose a different UART.

Move the UART4 node from the SOM device tree to the
imx8mm-var-som-symphony.dts, keeping the SOM dtsi limited to hardware
present on the module itself.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

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

