Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB7E3A4F5D
	for <imx@lists.linux.dev>; Sat,  7 Mar 2026 15:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772898928; cv=none; b=ijr3AQ7G73ZyJy5gFknw+iq6qtRc0alcdCUeU20147QaDcg5ZUtHa9jRgykKgXhLKJD1KmGWy5JvQ+1s7GUEv8R8s7LlG/gvKeRV54BhFbD2Ja6/Q7Q6ebrednzb5rMPtQq2qnflkRl+PifMTDxBhiKz5XvZTF/1TYuAuyKHi+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772898928; c=relaxed/simple;
	bh=WwcnzTDrYZrReBeFBRi/rGMg2hr6XWFysYmo4wdipsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jb/RZDfx1ZCUkfTqOK12am3S0c++/R5w+i6g537rsRgiU9elWYTs4Yke4xDhL2OAaAms52+XY/p77gRyVqNZXt0aIcCP2t8Z0FUCOYBFMrSGgiVjWUYTzWHDeABeNPTr/M+cwRhk31Oyx/i4HVcQTMK+5v8bmVdMHlgKbQBVnxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UBXA+P8L; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UBXA+P8L"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439b73f4ab4so6917795f8f.1
        for <imx@lists.linux.dev>; Sat, 07 Mar 2026 07:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772898920; x=1773503720; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAEe+cuuDHuRMfbZjHa6/1YpDdum6v0UhYvwnCVfMAE=;
        b=UBXA+P8LqO330tGhw3uQge+y6W1hRvW5eYAwvQLziFa7R+/dJE0UtdJYcSa/qSehqz
         MJK7EmqZb3OIVEu+RkU3wGwFN2cACOry4sWO+/Rbkk/wK5LdioQWQLTI1OyO9N5krdRD
         1runihBPdwnYyFfZmGp/BAllBRCSz7mLi7X0/NGeJYP5eEgUw5Q51rXMgg/1QsJ+dEqG
         y6ZjewzauCIKSVD1JARKttnS3IlRcgLCLQRoJ0ElTpO8aOUI5GyTu5tONZclP8QB+0Sl
         KkYcsfBkeVLLcHzv9arVUrbpAZ5ZUhlO+oiL6NNP3PFFIXpM56QPfrIAMaW7EI53ilnf
         YAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772898920; x=1773503720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tAEe+cuuDHuRMfbZjHa6/1YpDdum6v0UhYvwnCVfMAE=;
        b=pGNyq2pZoAZZ0a+Vp+jakmg3pQTRSj6+6cPhKrVclScNZsmZbyHOe+O02n6I8cXaOX
         qAuVYlfnQUDTrTwfPqIIrqGKoVXaYcy7eQ9SOXwA6+OKaUvxywIkqIFzAh2nBiaOuPFM
         hI5B4vnGKEh241V+mwpjpDm5qlnWl8WYVoDnDvJEpLtrVzaPLJVWGLC+Ug5utgFh3s4V
         krLkHxVYA6k3nQ0Sl1xOC/ehB/T0IkdSB7W8VCNfrFCjOVdNkxyUX0By9a+Z4dt+q1Nw
         T5YYiB0BK99mEOZpSYthOvRj5Trr7piOumAyZzOqluj/q6irwl4mkN23pWo+i2G6vDcT
         rhnA==
X-Forwarded-Encrypted: i=1; AJvYcCVVrPhoh76iqXd37j5+ftBE6EPtgJe0tYPeeoXwfnMziIgsBEqfBcNsMih8Q/tac0azyDY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxuCBRfy7U8V8U2VrWT8Eqv6wlY7q+Wr1sZvXOeCzDQNBlZj04G
	S2XhExxNlwjV059/dM6xP8KIBVB9PE/KLD2cJ8JvOuA42SkdtuAZ1Dmx
X-Gm-Gg: ATEYQzxQgOadh2j1PORciiznfZCuxsJ7wNuptPYOua7MuhUPYibco33lgaiDQEF56FG
	ROiQvyL/TtnnF7qWQWMDNwHwW9ZrUlIxaauJdsAg/AONe9mDyx+rrjB+p/sb2iKrHlArJLMkkrO
	+a2zP967hSHRi5JCHQ/wVtMcdOeiLlnEVC7Jc5+vrNWI80Y9v4TwKanX7r+nhBLaWthqu5ukML0
	/BOWuHyGlfpI66uK0ls8QEIEAXSuD1dAL5oB6WS/rCZ+/Auj/A74wDkNg9qrHS8UxZk5b9sVKmM
	0nmiHK41Wqkdnhvq/aH1a59QcZp1FXRDGPK0bUNL5+Kl1bLEtJOAKmMC5hO204QK0EebQQpnF5p
	nMC5PNkUwFiR74wvTbogNdOUPfzNPGWEe81B6otGk+Eu62ywYV/QRi32jAAMqJ7A7nbG3kwNnaO
	VIlZ5NRxmprp8qE5o6wYyWSRciyiag9aa+Qb+amZGGP4I68v+nv1evBLxubil1hMQ5vZyoM3DNO
	bwvbS8XwfPTmd8K4YNM93Vpjg==
X-Received: by 2002:a05:600c:8b01:b0:477:9814:6882 with SMTP id 5b1f17b1804b1-485269198bdmr97014915e9.5.1772898920009;
        Sat, 07 Mar 2026 07:55:20 -0800 (PST)
Received: from GLaDOS.lan (93-35-179-236.ip56.fastwebnet.it. [93.35.179.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm261097785e9.4.2026.03.07.07.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 07:55:19 -0800 (PST)
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
Subject: [PATCH v3 08/11] arm64: dts: imx8mm-var-som-symphony: Enable uSD on USDHC2
Date: Sat,  7 Mar 2026 16:54:44 +0100
Message-ID: <852dfa2a90430b3f43dca70d3fae18c6df953250.1772898346.git.stefano.radaelli21@gmail.com>
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

Enable the microSD slot on the VAR-SOM Symphony carrier board.

Configure USDHC2 with card-detect GPIO, pinctrl states for the supported
bus speeds and the required VMMC supply.

Update the VMMC regulator to match the latest carrier revision by moving
the enable GPIO to GPIO4_IO22 and adding the required off-on delay.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mm-var-som-symphony.dts | 59 ++++++++++++++++++-
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 86246de8f36f..66c306f755af 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -24,7 +24,8 @@ reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		regulator-name = "VSD_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio4 22 GPIO_ACTIVE_HIGH>;
+		off-on-delay-us = <20000>;
 		enable-active-high;
 	};
 
@@ -227,6 +228,18 @@ &usbotg2 {
 	status = "okay";
 };
 
+/* SD */
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
+	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
+	cd-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&reg_usdhc2_vmmc>;
+	bus-width = <4>;
+	status = "okay";
+};
+
 &pinctrl_fec1 {
 	fsl,pins = <
 		MX8MM_IOMUXC_ENET_MDC_ENET1_MDC			0x3
@@ -287,7 +300,7 @@ MX8MM_IOMUXC_SAI3_TXD_GPIO5_IO1		0x120
 
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
+			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22	0x41
 		>;
 	};
 
@@ -311,4 +324,46 @@ MX8MM_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
 			MX8MM_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
 		>;
 	};
+
+	pinctrl_usdhc2: usdhc2grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
+		>;
+	};
+
+	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO10_GPIO1_IO10	0xc1
+		>;
+	};
 };
-- 
2.47.3

