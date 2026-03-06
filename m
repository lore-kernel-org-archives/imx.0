Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E0E43CEC2
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 19:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772827136; cv=none; b=Pmwr6XRiK3VJXqH8DuKwZwSx4iQlf85oX33x38b4RsdIL8G/EAxysE2C5CwbccFZvzkHi5r0EaI4kyt/DWTi32AR3ci1D+ACI6yhq5NeS6xmbqYZdjqT4JtbEz1ldr+wn3rjyp8uWFot//rP3Yq3tGeqf6jluhfqWYAzN0cmEeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772827136; c=relaxed/simple;
	bh=u4X5+DI91wbkbi2KLD4hT90jM52B2TkovsBJfJswZb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JpY9lF5KXS/QPZUYyNRT/v7l21ze1UBAH5Tzl2YbCFLzkhrD/VllGCVXcRLWz/mbueLQRYNibwCLYHlXk+zShm7JXp4D6oIYxUQYe812MP3f68xLnF0Qsn/GJwU9MjoM8hGLU0OpnFm02v3VLy1jIHJZaDnoPWfbUfUt21aB60g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXu+aZCe; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXu+aZCe"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso3918475e9.2
        for <imx@lists.linux.dev>; Fri, 06 Mar 2026 11:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772827128; x=1773431928; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNK1v/PEn41q4OPJG8Vn10SgkMQvYdWa3Iwstjk7m/s=;
        b=LXu+aZCebgQUdRi92R37Uq/94ZHdcdrwISAfLG4xqL2ZSk7UeKnQ9I2i1TnsBR5zWy
         D2HWuhA/j1+UKR/4VirUsv67njRdjrBtShhaYMYvyroglcYf4PRtJo0m3Lyye9czyRek
         cVJ6KZN8dt3EvfYEGu7ZnRkLzY16PmEpVmYbGQDydVBE2BDRqi4e5ROPYac7T3yxzVaX
         rxh/Rcx8KciFAUZTwNwKUmOcoOHe4cu6TPGs+i08qe9PQJJsI8dIqEvVnUUOQk0GPV+o
         3lF35o7BlcDnsNnIoX416U9kL7PT5OYeArkMRICu8TLUJywlaTmj7+5lrXq/09GCeCyG
         1myQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827128; x=1773431928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aNK1v/PEn41q4OPJG8Vn10SgkMQvYdWa3Iwstjk7m/s=;
        b=VAPE7vTNp2ALn1xGZM739Zzi4FEToKyqrZMB8a87v80n7upSfamvWaX6YTtHFBrJiT
         3TOFH2tKDEAKv7153hKTEMlgCcLskGuGbyV7hPLhsV4utv2fz27NzP1KxX3cyFRiMOSN
         zAhANdJu80va1RqPSa5q6H3lGKWhXvZEuhpD9gaLRr2fsQ4ZyNwUg5lBO3W5zPCkuceF
         di/8mRQMcSi7ePwJTf9bIzl0oPQgOeJkciULX4kMwtfG89aQ2vLGWvyx7PtDurWWKf6J
         QcgSjwZMNDA3c/RLYx6+hG344JkrTsBngZNFuBAR0cbTFLPFwLxDmsxYjV4G/3fNVqjC
         6T0w==
X-Forwarded-Encrypted: i=1; AJvYcCWEEA3SsKegiPDFWHGiYpHu6qQzm8LwGrnRvhwY7P8uo11owSxc8Ehbtzbqsm+yfA8Zn8s=@lists.linux.dev
X-Gm-Message-State: AOJu0YytZrvbTW/EkzV4ZJQ/HEwWrxvR8j/KEjZsumjjaVOtkR1j8jN3
	wFmYee8EyHLFHhAvzsGjDo3SqMBOf0cSxDZd8ujZx81oGYHS4TaVnn7k
X-Gm-Gg: ATEYQzyYNuSX3Z6C4gtqPYk4ghhoDMV9v+ljiFktjXHF39Mb6iverW8Kv2eX4OuwTCT
	XLCPaR04Y3KywPL9t6KVPqJsUdN2LyAdPH4IHWsFJZxDns45QlcCGBsZTpLZQYRp1gdF5aUO3zA
	VTIX2GKpkzzj9Np6l+m/g99BWkV1fL+DjmyO6PSvjaNbDYv/zCfmnXHRTqwarAZ8TyoMTOKd6qu
	4vSmD+LhatUWWFM6vmRlSs+wtwSBCPXIuS+74UjGffY5rUjXWoL/fR8ksNLAzJwqXYDZoSp1OSX
	RNa20kw1AkWhYKLLJnhHJhYfaMpfumnqAJfPc+BHqX7kZAO4I6vWcLGLneoDpGr9k+3SyJkovpr
	vapNdjknNFgPAeCOa+nz7hDyytU1EwVCeiOucVQ/FikjlB9JdX88gB1wZHZfC7veeS76jKNAkXB
	C3NJSjKS6KieanAEDb48b9/GPVM3BtFLo3l2+nEPkmXolfANjcQkxUdtYPFv2tlQHcdxwxq0QXJ
	EURAZD5ykREddI7qWDr+0fOal8bb1mmYHN/hQA=
X-Received: by 2002:a05:600c:c10d:b0:485:2af3:3f8d with SMTP id 5b1f17b1804b1-4852af34027mr19015335e9.14.1772827128159;
        Fri, 06 Mar 2026 11:58:48 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48523803b5fsm25167265e9.7.2026.03.06.11.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:58:47 -0800 (PST)
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
Subject: [PATCH v2 08/11] arm64: dts: imx8mm-var-som-symphony: Enable uSD on USDHC2
Date: Fri,  6 Mar 2026 20:58:27 +0100
Message-ID: <852dfa2a90430b3f43dca70d3fae18c6df953250.1772826534.git.stefano.r@variscite.com>
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

Enable the microSD slot on the VAR-SOM Symphony carrier board.

Configure USDHC2 with card-detect GPIO, pinctrl states for the supported
bus speeds and the required VMMC supply.

Update the VMMC regulator to match the latest carrier revision by moving
the enable GPIO to GPIO4_IO22 and adding the required off-on delay.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
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

