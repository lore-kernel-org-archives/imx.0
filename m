Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C426537472C
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353819; cv=none; b=B7lQpgYWWOP+by0wiQv8apC3mR/MLJlzopFLA4hw0ITpEzqzXURRqpToE6BgEcJg8ElKL3ug2vook3yrmpE7Gv2OhzQ3oIY3n9uXGYYzyHOc7/CrweWJ1pQfU4OcX06tDIPNCCojNqFIrtI7/b345csPDWuwCoNwa0d0DLVQLn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353819; c=relaxed/simple;
	bh=jr4LTkn52z5QWAEcJ21KwMaQSIYkNkR2Mn04H+8sPrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QWJxDRLMRptBVZjEmu3AcudQ5kbaJ9ku944b754meZzJsac2fYHMqTUaJdYBpdhT9+Z2BUoMouInsDZTijWgur+Ndsd7kY6qzb4hrQG9JuGFTfF06YTWw1DMdwAIOYuVUaM18Bn323ZBUQhUI8huIU8jYyiLfPdFUYPQ3zRHR9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TmxeKAVi; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TmxeKAVi"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48372efa020so33405615e9.2
        for <imx@lists.linux.dev>; Tue, 17 Feb 2026 10:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771353815; x=1771958615; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYsU7UyOcFO6rtK6/iQ1Qf2xKJGmW7ahDM2xNeH4+nA=;
        b=TmxeKAViM/jWRMPLzElrQFHPK+rQZP94sopZGGm1veXY38Z6pfoJ0Fb+g/dx0Gph9g
         N5CNc4Xq2xhnQkc+HmzEuctZCRtu0f7kBqGdcyqyxj7d0TI9zyLmBKA9v9sA+h572q4o
         b7nt2qAtXVPXHj65lP/ApPjDAW7pvRIvSHVJR8c8h3BMQwxDV0qafy3h334ogJvQojz1
         Y8CHy2UhkUIyjfAHm+MwGlHKDcWzybrexU7RBOReTy0uKIHYcDnbjxHf5eOgXp/gvVE5
         1rRDS0ZH6260p8NO33lA7JfnuKmhWyprwiotP2Z/NXCepQ4kU/wlAhjA8mhpEb93G2gv
         P25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353815; x=1771958615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vYsU7UyOcFO6rtK6/iQ1Qf2xKJGmW7ahDM2xNeH4+nA=;
        b=RIZgkJ4G1x/FzXK91jbCLZ4SjlPdy9J6LC4E8IEEtC886VYr1QYALVhhn69XUNbJG+
         9gz/ZNm1EE1BUA+LhEh6Cc/QrNp5q3ygVGK77WKeJAVKHq5G4BIDT5YYUB+YO5YJsNZ+
         QYiD8oypN/BvVUDCNK977RRjhIvZroaDMqTPmjEXyvVhjbUtHkKNE3qDNaN/qJBFov4Q
         iU/z3aMdCj6iftmhNP7AVETHSR+N41b7GQNcM32bDKqehozoFglEZ9ttOCJ7nW+ONv34
         suGa1rfYMPO5/LvtUZNeY5b1VkRKIT3GwHVIXxTJl3XUsEEZEIvCF3OTVpnHMMORMyqp
         73aw==
X-Forwarded-Encrypted: i=1; AJvYcCU5ykoHQ99rMz2kpfPp0SiVetpx3p10xOMrdUJ9pcopHoJLfSytxSjhtZD3lCewT3nn4oI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmpshPFpQGFIEZDwbZYjzpP/TW2ARvAuFVXbPKSoGezAGY3jeJ
	CbXVyu85EpIx247U5XissRU0cfSmopQua3VCByM1F/ONI3QMKi/0i3NQ/4xRMA==
X-Gm-Gg: AZuq6aLDbIK1fUsWkfykUuEsrAr1tuBAOdqUYrXoadJ1+CBsa1cgEDjpdQ/GjdjlCsD
	v5l7JqFzwyoObcyh6E0GcwNMe6p3XYXGeqKJJSLH/cvV/88w6YgVfo2/WgH23B6AfWc6hboXE2m
	5KiEOhF28971LS6173H3pszBkijArzNuTE7Lk1YZPXwdczMGn8aKkxL6GkEwByVSvW3w5o5WbFO
	8g4fazu8elgmyJ81SMHu4ckrl6ZKgCtBshBEyCT4pc+9v1LtqjRFSk5bM3LR94DwpL8zIbY7PpE
	9nTVDJXSq9xqg32w7Q5r5ogbx0NhwfkxjxEbyTexZLQIZPZ4VSI2YaLHGq5S9b4JVPZd2HvZ7fu
	J571QaMxrL+moOJYn3qtevRlMB902Lh1yQLfBVu0+Si8WyXrCGYRv719xSFXfjNyjLRV9F9fRKi
	maqZ1AO00AWM5qQXLODB9Zl6m4VwaGjCJ/DZ760JDTThjbsWB/RasiKjHLmr+5DY9Xdl40+n/pn
	E4ZrM3Afkc/KWR4EOM8aj1DhTrX5J7WPTKKBWNB
X-Received: by 2002:a05:600c:1c07:b0:477:561f:6fc8 with SMTP id 5b1f17b1804b1-48379bac86bmr242020185e9.5.1771353815118;
        Tue, 17 Feb 2026 10:43:35 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839731d7c3sm1096185e9.18.2026.02.17.10.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:43:34 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 08/11] arm64: dts: imx8mm-var-som-symphony: Enable uSD on USDHC2
Date: Tue, 17 Feb 2026 19:42:42 +0100
Message-ID: <4b23da4592f50a49009fa59e45fbdc12d277eef9.1771353301.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771353301.git.stefano.r@variscite.com>
References: <cover.1771353301.git.stefano.r@variscite.com>
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
 .../dts/freescale/imx8mm-var-som-symphony.dts | 59 ++++++++++++++++++-
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 3242a0b739f6..40ffa1f36b2f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -22,7 +22,8 @@ reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		regulator-name = "VSD_3V3";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio4 22 GPIO_ACTIVE_HIGH>;
+		off-on-delay-us = <20000>;
 		enable-active-high;
 	};
 
@@ -204,6 +205,18 @@ &usbotg2 {
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
@@ -264,7 +277,7 @@ MX8MM_IOMUXC_SAI3_TXD_GPIO5_IO1		0x120
 
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
+			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22	0x41
 		>;
 	};
 
@@ -288,4 +301,46 @@ MX8MM_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
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

