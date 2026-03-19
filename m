Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060B93F7A92
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 18:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773945722; cv=none; b=t4lwsgy0vnJvdDpyBbqY2YtHtTD5ANbV2H5FQk8FQDgKBSzB4nSxPfl8k7Z1LgUTvPBZp/BIZnefHlrvyVS0i3RvT0/co/rccvzchJLI3drjvg5Rix4GAaZ3tSFSTkOEghG5/ajoYOYVCUCpWGqXUEkZla4XidfXSCd3i0Qjg0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773945722; c=relaxed/simple;
	bh=XchDX/MJGRebsCi/1qOf1usvUugxZNhKwF3lSzC48kU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MtCCY6FNhFiCc+3FgjSYCMV/IaWZUzVTTF814K2EyOnDWHmE4lY8sbxVCpccFCiyX0iH5DGpZiNK8BaybzGDzBgKhMMbEIMA2eYSRAYobL4cuXC308eFRdhDLkObGjgmc3sotj7pX8uRCqfQZvcjo0CCl0490rMdy9ydqxCy00o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=md6BQMXg; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="md6BQMXg"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso14048045e9.0
        for <imx@lists.linux.dev>; Thu, 19 Mar 2026 11:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773945718; x=1774550518; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DI1p11Y3NFQSHggE4wU2LNnBCXfD26cQdpGZhKmz8bo=;
        b=md6BQMXgBpnzGij9byyIwpm75OKBjubSm9lQl63zn8zMBhQSZkqJlyAMN8oh968QFd
         2VUShs6G+MYrSDq88ahRQyywk1rfCrOhGaivt7ukfkQjgajVpDj34ewcLu5ACz6a4Ebi
         oovyP6a/pJI5FP5/OELtt0yBijNbbpoBNISPPwViJ7tOX9WQBhE4T1zLxYi/A43lOQNU
         +taA/fVFJUmFoobtP0L/tkriUU4+KK5B7e2wjVnBtISi7jBoo+Lu/B2sppDK/eF33bHe
         Wp4OmDkXBCkTSi3fDn4+7LOh4JDOExo5jBTyqFG+srxZMEn9oMd0IkSe/NcRDBQgQq/X
         WqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773945718; x=1774550518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DI1p11Y3NFQSHggE4wU2LNnBCXfD26cQdpGZhKmz8bo=;
        b=p0DTAtn/L2kRHcRHSB85/cYD/aep9i+9xT80pHwWg7A4SJ+4MBgVg95lzCyCYrjchL
         7vfrC46q8w7uR7lLBQhaMFfejTrZSijVihTidxl9EMapJPCGIivn/r4g+D+iPcx98eQ/
         NEGo3lybWKTZSFzUDJDmWfEI5au5BI+mh2jyWvVkcQFKvdUWBRAjHq/Yqm3wxNPDEkvv
         tpxbbVTtTlmJZu+rEj6R7NPrZ11s0ZsqiEGeTZYogFFOdHA8TOp4zKorYVstzXrWz9DD
         JhVAi05SUL4lYv3hH/YOV6V7OPG5fsLPyij1k8hrtNLdKx6cgkgmNbNPpMM6K00jojTH
         htPw==
X-Forwarded-Encrypted: i=1; AJvYcCXr99evG6asqrXw7ny/K9TFmVROpNg8BU6dyIGJUFoTm7m1qrZERrK/sY3tu5OvIew7rjw=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywj0s0dTECcrA6pxiUD0/i1YMyeTPcEaMaet/BV0SxkgkE1Xu97
	9QdJ9aAU01Il52pmOO8FfFaux0ruz/reuxSkUTzx/Wy+QYyKWSTUJTCn
X-Gm-Gg: ATEYQzypb807j6Q9dz68ENKpUxerTTjcTLvWZoeC6D7R5MeZD7UrKxCKNg9f6/Sxhvk
	hClhiVmLKWIHQze4ZAtZpLGGl/Q6/iASEXqWahJuMNMnoiPJb8Ea8h8CDEwnEcgb6Pd038Xmsg5
	6HlRWpPicWbQkcPrLsSfETir2FRMgunO30JPwe/aQNykHwulNM1GKnPknm8o3bsXXUZ7IfXCNu/
	IZebGM6LfBVn4lCcsneutzNU52Vi+2kEmrpBQ1Ry7qW9ONpgT/NDe57aUpAaA7BWWMbY4c8aHiI
	ULg6ZoPkQ58Xr1i6/pz1S96982wxDRoLSHKZn4dN/rvG0W4GtyakRxunYof4I/+DVODq/eybX7U
	EtiyY4JEU3TN5zQuZZz0IuUBmk7y+90OXVVcRwhLOFv5LvJofnpIBa04D17LKAuCCri5bFSBXUy
	KnUX6w05lexOuEQQM7VTJDQlEByJK6yUCI0Po6+EU8Q1ZmnRKAGQyHcmlP6ZLuG+mV8hul/b/PI
	X/1F0XybClgrmBQBJz3RygJRoBPqDYJgZVteo8=
X-Received: by 2002:a05:600c:c083:b0:485:3f72:324d with SMTP id 5b1f17b1804b1-486fee0481amr1849725e9.14.1773945718217;
        Thu, 19 Mar 2026 11:41:58 -0700 (PDT)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b1fe65sm77289195e9.5.2026.03.19.11.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 11:41:57 -0700 (PDT)
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
Subject: [PATCH v4 08/11] arm64: dts: imx8mm-var-som-symphony: Enable uSD on USDHC2
Date: Thu, 19 Mar 2026 19:40:28 +0100
Message-ID: <2181c11d9b15d7a048e5f881a867ee1f7fa82ca1.1773944896.git.stefano.r@variscite.com>
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

Enable the microSD slot on the VAR-SOM Symphony carrier board.

Configure USDHC2 with card-detect GPIO, pinctrl states for the supported
bus speeds and the required VMMC supply.

Update the VMMC regulator to match the latest carrier revision by moving
the enable GPIO to GPIO4_IO22 and adding the required off-on delay.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mm-var-som-symphony.dts | 59 ++++++++++++++++++-
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index a425ee0ed8a9..6da29845985f 100644
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
 
@@ -220,6 +221,18 @@ &usbotg2 {
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
@@ -280,7 +293,7 @@ MX8MM_IOMUXC_SAI3_TXD_GPIO5_IO1		0x120
 
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
+			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22	0x41
 		>;
 	};
 
@@ -304,4 +317,46 @@ MX8MM_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
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

