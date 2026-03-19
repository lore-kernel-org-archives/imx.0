Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EC7311956
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 18:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773945715; cv=none; b=tTwfRSEkndzE6+rOP7DVzgdBqg4edHvHqDGDF/irTfhew8Le4bHYIkZR8cmjp//IpnQZEnFd/v7j8g/Fr7wLYHyzJ6/MVT9Djz84mlV/dnjMulFHK/fiXu3Xaqh2TsVlEXfRH76obBJDE4Jam9ZbfJyZ6DCFLZbNs90PzwsxxOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773945715; c=relaxed/simple;
	bh=3jne8HIksbKA7WNAVpfua4BMiAl+n2r+dvdWoOSNPI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SmG5GYgpqZViAyG4kB/cACKCFyMrrIo4mtr3p+H4VSyfV2IhjYrvihgnPiow4pL6uyngP3Cc5AJrzHJzO18zI+8R5fRDmh0N8d4TIKdoyeldSxTDP1AmBhKl3Klw7Zkbnp52MI5XdpAx1PfaalgwrQVJhQDWNlOuc8yx1LZZwhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UYp8vOGk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UYp8vOGk"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-485392de558so8362945e9.1
        for <imx@lists.linux.dev>; Thu, 19 Mar 2026 11:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945711; x=1774550511; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kt+R8rdhnMH0JxLkvpX/7AhCeFXaCuhgwgruVNrcyX4=;
        b=UYp8vOGkUHzRvOT2/P/G1XSLj2Wc6VXKndiKA2W+y3/uZ+LX1vVXBdxXdwxysy0+hz
         sHhnB6oT1vKIExgJeQ9RQbj95Iwscqf86B9ONyf2IYsUKOeknII7Z6IwdNdvVdDxveOg
         Zp8tgNVmj6KFfA84lK+HIfNL7pXfGYMCMqNLTY85mgBjNi8k8nH/fZ+9SH27DDdutlDd
         MpXzAAwC5uanjJ4Xw+FSm5NQx3QtmaWni5GKJxuAX6pkAtJcQA7Ksk9GWF82KAsl4Zrp
         xNuSFaIw2zmAFHXvm6XyMO8hPfziaM0ZYZaBRUmtDXFAE0R3hWwZfuex6hXPHB8KmIK1
         DNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945711; x=1774550511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kt+R8rdhnMH0JxLkvpX/7AhCeFXaCuhgwgruVNrcyX4=;
        b=kNuRsDUdyt5/LvpxAZZf2PFhId9Z6spRfW1Mqspc59AZzEhB53FeFLUI4A+2vDMtqH
         N1vt8Ler8syvijF0Sn8o0elDjzAqxBSPLS4eaFcuOUVEQ1sq3m8P7Jl6qU6z92Qj3L0p
         dSsyykVyxUzYlHyUpQu8isteOCp4/9jnD878F8hxvmaFIzp4r0UIaD+YkDDvvgf9J+o7
         t8/3UNs1Sv3k4ke5otOysekzlPkudRlEMEKUWi2SvCtQ41p8M16L/cRy0d2ZdWPZ2EIa
         VMTRcPATYz6OVwJ2qlidLDMxjjK0SuzRF2eyfEQ88698UC73GdqdHC7P1Z9vqWRCuHxy
         hT5g==
X-Forwarded-Encrypted: i=1; AJvYcCWBAj5FeshkwquCH0cylD6QwjIqQc4tJKrrS+1+rNIXbEyKdVUB17cXFlQnAKweek8pn7g=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmSKlhUfvQvdaQjyQyX9wXeqdaXwAz5sUTaptDUYh4TR+sJkCo
	opoEjQAmvK8txZ+0hIg8MVwqM9Tx7eH9EIhlAAr7dwHtwK7SdvK9V7Ur
X-Gm-Gg: ATEYQzybjp/COmolfsENJkKW8Cndi9ocWtN/OSMgky7itBI+6z9lDAf6HA0Z+gid8Ac
	sFxtEru8K0JvN4hNUCdJ85fRgsFs29JChnUgTqYWO/vwjOpzVJjobVy6KcqJnlv55cynDhrtiH7
	wYjjRKTBgSRfIJjfRDbpE01IeH/xso+JviFOEmwIG1RHDa/rLcse/NaV7envXucRGpXTD7resRz
	Qj81HyO5kdQd8POPAhHUzYYmb+Cy/nfbz7h1rSihWZneKeOEv7HJjeE0zdqgtO+bz1K/7OV5I1g
	UmtjsPQ3NE6Ypj523g0JAorhgm+A9oz/2iUGsiPRVMJEEPnxwv7yScN5x0fDNTSoJy9CFdIr5kT
	EwhsKlGdcAqudpXQIYkRFhYZZ10DMnmIFr3stG05eVbTiNUA37x60s85bdCu3fkovP/Rw+WpoPj
	WXw3yDttiaRc1mSA2m/Vv6Riza6psd6IP86QYQoRbTt5/COvFkOdb6ICmpcxXAclf445flcQnKI
	pk446F+xPm6Ht6pnUH81Eenk/qjhLASyy9o2MJd/LbsNPpP9Q==
X-Received: by 2002:a05:600c:3b07:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-486febb59acmr2852815e9.5.1773945710872;
        Thu, 19 Mar 2026 11:41:50 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm77289195e9.5.2026.03.19.11.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:41:50 -0700 (PDT)
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
Subject: [PATCH v4 01/11] arm64: dts: freescale: imx8mm-var-som: Move UART4 description to Symphony
Date: Thu, 19 Mar 2026 19:40:21 +0100
Message-ID: <d3fbc6a0d5782e86a2294f28786b415a7b072d19.1773944896.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773944896.git.stefano.r@variscite.com>
References: <cover.1773944896.git.stefano.r@variscite.com>
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
v3->v4:
 - 

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

