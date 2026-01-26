Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1AE332EA8
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 14:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769439398; cv=none; b=S5fxaA9Q7gYkyO/kosLeADDcDEtDwOEWP1kCCO2bJi0T91/doOnNVTbTm+gFV002rRrUHqLOzb2FWlG10TGTMTv8RVtkOmB7gyF2LjUDQC9wJzp/CIztwO8FvoCfsS2z4Mv09+JT2zGqn6kNxD/E68ILRqJM9JXCEgdyFq6iN44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769439398; c=relaxed/simple;
	bh=FXRkYQxW/Oh77PruZvMs8Ux+ule7NHMljC/BkJecFvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CkPmQ8i5OyJ7o9HFn89z39xNny0NcQEzNZs6hZWmqdKwvtVdZTmjZTCd4t/W7DHdu1kaSHruhCsXhRoT+R9iE1hObgbT9EeqN69EWeutui+silkMr8BSkL94ubbGKw3rcWujXr94+6xNvKOQCLe7yMHk42Hog94upbCVdQJNVaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L08UkmyB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L08UkmyB"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso46458645e9.2
        for <imx@lists.linux.dev>; Mon, 26 Jan 2026 06:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769439394; x=1770044194; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RQKD2gj0rQ1+sFwLWUcjWNz3iCRkkjiPuUiecwAUgg=;
        b=L08UkmyBOMj8kLyuZ3PIEWtBzgCeDdIQzlhurRBW/kmejhRbIjS1vRmn0TAL6JBhHQ
         6SRN+pEqpQO1JhUPOH5IjrsPFIM8NglhKBMSoX38inaVrCO4TBHKZPVKlA3+NnYxpxOv
         Vga603jWRnt6SWWQsi7+eQrKUBmNWNSXydvxdJV6/H+6muIs3a/TETQXnyQ5PYnfxq4H
         wG0EGmyY2y0r1RmGNPhOqnyxmYVZ/w+SYPlE+Vc4OUvS8PpmCO26drxb1zYS4dEf7z2n
         5Em0DvSkpNODUenc4Qc1Vkv55BCWdAJ56buvlErLrRtEFvSNCw1l6st56OWqsxK/N0bi
         jtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769439394; x=1770044194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/RQKD2gj0rQ1+sFwLWUcjWNz3iCRkkjiPuUiecwAUgg=;
        b=fn9whGaTACM3NNrnDvifLsHjk7em27ZrwOQPsJECjLLx2uCDbbFQY2/vWMSi6SzVBP
         RjzfsrB2P9///FW2+CwDpt3Nl4ZEOi+3Y17NpXuu7ngMy4Kjbh7G2L9rx/1GhtNGYHWK
         OLhsmv/qCDSh7s8Lqae4IIdP7rzO3KCRvniAUCxVJU/pnWTO95jp8PEZTwJKmvOziBIL
         YgUKiTDABTYW0u9dMdoyveCBCYIX54FSDZeROaosZPJON+j8wZ0PxTNI2Koh9+0Uohrb
         Z/fCkF6MxhWddCmz1ObqwbDfF8Cj8hSGDmgOeljpWPlZA9U8OcwJc2aWb3hSU9yVmPzA
         eljg==
X-Forwarded-Encrypted: i=1; AJvYcCVefmgfivgp+mBRRQ2jkwUxtadoBii0nWVljWbY7kraqfb123Z7EDnBUQ3F/t3nI05Zr0c=@lists.linux.dev
X-Gm-Message-State: AOJu0YzwFYDdODMwzrepMYXuj26wJd9rfmMbkpIVME8EcuGejQzkgX+G
	aVo5oSx4ZyErODmowEbvW69m1qMwtVqxtw4r37/Y/N1kh2KelZ/dt+y/
X-Gm-Gg: AZuq6aJfPOA+p53mN5xerXg4gxMhswXshPvb2G5ipE+zqyKgCPDGKOKoOhINqLmkVhs
	T4dAPMNelOYWjn+d9zXw7gtE1tYsmM4fo+BnzwwO55nfImoo2YcNYAuxxzyxOUUQXvqEcg0oFPP
	jZkWCiuDzrB5EDh3wYhj5+lRPeT+zMhdCE/6uCxX4hu/4+fEF/acBErzGCS4GE5ZIliv9+/XTGg
	LWykE+63V+AKPlIFNgHbgGVdAQTHMGEF3ncTYhcQC7RE4P1FJe1jDB5n8sJH/68x6YI57YzzRMz
	Pqd5KSoNs8kMlAW8wv5pGaAM4iiGFCOMQj7+IZVrNH+5+al5Gs8rWwL6ge4+IvdpEfjtwl2pVNc
	zq+DXbGaQF+yMOkSxnxoV3wSuk+UYlFoLDL1txHnZsogBzyyuyR6jEy5R0MC14AjOa1/gCTqkP1
	gExiSxSb1Wcg0I0gjnsboxxlHlDj2X6VtrzU37xg==
X-Received: by 2002:a05:600c:5494:b0:47e:e78a:c833 with SMTP id 5b1f17b1804b1-4805d064297mr74645505e9.32.1769439393871;
        Mon, 26 Jan 2026 06:56:33 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d8c0aebsm278448735e9.15.2026.01.26.06.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 06:56:33 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 2/2] arm64: dts: imx95-15x15-frdm: support AONMIX MQS
Date: Mon, 26 Jan 2026 06:55:37 -0800
Message-ID: <20260126145537.2301-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126145537.2301-1-laurentiumihalcea111@gmail.com>
References: <20260126145537.2301-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add support for AONMIX MQS (i.e. MQS1).

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 73 +++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95.dtsi      |  5 ++
 2 files changed, 78 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
index ca1c4966c867..0f43e3be7058 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
@@ -243,6 +243,12 @@ codec {
 		};
 	};
 
+	sound-mqs {
+		compatible = "audio-graph-card2";
+		links = <&sai1_port1>;
+		label = "mqs-audio";
+	};
+
 	usdhc3_pwrseq: usdhc3-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&pcal6524 8 GPIO_ACTIVE_LOW>;
@@ -473,6 +479,21 @@ &mu7 {
 	status = "okay";
 };
 
+&mqs1 {
+	clocks = <&scmi_clk IMX95_CLK_SAI1>;
+	clock-names = "mclk";
+	pinctrl-0 = <&pinctrl_mqs1>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	mqs1_port: port {
+		mqs1_ep: endpoint {
+			dai-format = "left_j";
+			remote-endpoint = <&sai1_port1_ep>;
+		};
+	};
+};
+
 &netc_blk_ctrl {
 	status = "okay";
 };
@@ -534,6 +555,51 @@ &pcie0 {
 	status = "okay";
 };
 
+&sai1 {
+	clocks = <&scmi_clk IMX95_CLK_BUSAON>, <&dummy>,
+		 <&scmi_clk IMX95_CLK_SAI1>, <&dummy>,
+		 <&dummy>, <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+		 <&scmi_clk IMX95_CLK_AUDIOPLL2>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_SAI1>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>, <&scmi_clk IMX95_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>, <3612672000>,
+			       <393216000>, <361267200>,
+			       <24576000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* leave unconnected - no RX in the context of MQS */
+		port@0 {
+			reg = <0>;
+
+			endpoint {
+			};
+		};
+
+		sai1_port1: port@1 {
+			reg = <1>;
+			mclk-fs = <512>;
+
+			sai1_port1_ep: endpoint {
+				dai-format = "left_j";
+				system-clock-direction-out;
+				bitclock-master;
+				frame-master;
+				remote-endpoint = <&mqs1_ep>;
+			};
+		};
+	};
+};
+
 &scmi_iomuxc {
 	pinctrl_emdio: emdiogrp {
 		fsl,pins = <
@@ -618,6 +684,13 @@ IMX95_PAD_GPIO_IO31__LPI2C4_SCL				0x40000b9e
 		>;
 	};
 
+	pinctrl_mqs1: mqs1grp {
+		fsl,pins = <
+			IMX95_PAD_SAI1_TXFS__AONMIX_TOP_MQS1_LEFT		0x31e
+			IMX95_PAD_SAI1_RXD0__AONMIX_TOP_MQS1_RIGHT		0x31e
+		>;
+	};
+
 	pinctrl_pcal6524: pcal6524grp {
 		fsl,pins = <
 			IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14			0x31e
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 55e2da094c88..0c55861d673c 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -391,6 +391,11 @@ scmi_misc: protocol@84 {
 		};
 	};
 
+	mqs1: mqs-1 {
+		compatible = "fsl,imx95-aonmix-mqs";
+		status = "disabled";
+	};
+
 	pmu {
 		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(6) | IRQ_TYPE_LEVEL_HIGH)>;
-- 
2.43.0

