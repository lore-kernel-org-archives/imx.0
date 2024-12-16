Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFFE14A0BC
	for <imx@lists.linux.dev>; Mon, 16 Dec 2024 14:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734360687; cv=none; b=cHfuRUQlPezDHhPEwnBril0ufpVen1qVdStQ/kDCrFYFfAtQktlZ1yf4chs3yx3ebhe+7DiM316+rcA6sDkWa98cAsb/iDcLvs91BGAM9W8VuUnZs9MgO4vewsYx7gXl7L0vZDDIjgm7heskGgNaDShMkcazgK5lsYxuERDoLl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734360687; c=relaxed/simple;
	bh=AkMTmkKlrQ8VFXVorPrHhF449gun9/lsauN+Wej1SvY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CsiV5zrouO8V0e5idqVNGMPBZMRYmfWPQGptXOwLyhEKeXTrdv3pjheMDzmsJJDxWXFjHo5Fo7B9vH7x6mVvjmcNs2HnqFBtEQVFYfGfyufpX7pedqMIfIO8wB7MSXqIypDuT7f696Mpwbq+4vyzFXveVW0p3DvwEWTf7TaidcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0DE1MVX; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0DE1MVX"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so41265225e9.1
        for <imx@lists.linux.dev>; Mon, 16 Dec 2024 06:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734360684; x=1734965484; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAAKa/iJbcg0hE8bXqvcJeWPfM0/EwIS0mrbbFrulwU=;
        b=A0DE1MVXPplYFrmLOabJTtygwAQs+LhFa4U+NNxp2pCmVv72wSDJDXXMXUJUdzjr88
         rP1e+FndxrEFx+wm3j5XmJMEBZYHAa5wGqB7+1rQVEFVSovXjN2PQ75LP+qf6zqhELb3
         5D2bSgPFqbmiMbupkIVMMCUNc26MvHPBW2LZ0cEv1m6uZ0fAk6SqlC2Rcl2kTwESePOi
         UzlIVLIhVLQupURlF1hhMX5K67RCzA4WlaO/CKveGtrUd+YUV/fL52aR35ddXJ4gywYX
         rr+7Gv5DK3heoc9PAAB/xD35o20PnhNP0Bl+rAgy6i6idferRmTbbJT1zkAfsSMpZPZA
         qfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734360684; x=1734965484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EAAKa/iJbcg0hE8bXqvcJeWPfM0/EwIS0mrbbFrulwU=;
        b=t8TaUUmuOonK2+Uy5JNKcJLoZoPIs8DnzAH0scwgowKNYw/odCXOHz3F0ktWvx8Rtd
         nDwzW0eHtlpMGyrqAFdOJU0UKj8TcaElKABX37OX5jsCgMq8yp+LWJe0EUeTJtEwL04Q
         AY475YLR9dUWMMTpWmO2ZumLKzW1EfCsrSz3NwiAhDMbIqQD1+AYgYEU1ROVnkvn7znK
         t++f57AbORuSwD+LkixqIgKC38yjeuI94IjjZpWwFyWgHXTLwhGQ3Fs3C3rHmHLmF5ku
         25cT/5tJ8HL7HR9y9fhvpNBjae6Q6YRSWH3+sCmGSHP74q0jQQXtDVVu1tAbiG7PvXA1
         B44Q==
X-Forwarded-Encrypted: i=1; AJvYcCWilkEZworay8UgtN6cA91ZeC/bRwlxMmreSbs/OnwvuSfKGn2lsAd25hqGJXBWvEpsH1E=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyf3tU8DoQPSiqaV7iwqe+hvkCf4iDRZIwknsWBjRGqIJyJ285P
	RWeGVeM4rRXdrRBnToaG1VMNF+MIB6z1EPVvH8UrHIHY9xzE4AaB
X-Gm-Gg: ASbGncvOENtgltgV1GMTHU5RvoMWxDTHWnCBsnxRH80AO+vefKi2bAtucVAYCxwrdSS
	XhumaDvAnQQu14H98qu5Lhpp+NjeiVXlzsJzEcGFKEUWQLmobEYPZLW+UHmdyo6uxvvhXnE+tX1
	hbeGDG0SuXS3erWFGMmEu/zUtKDtWKFqoJQ5HdZ0tCkHnCpFEtuqxNnR2Q3OpnizCLHny5v1Ooi
	NIJgqMV5ECpb/U9a5sQyOYgNsQ15OY2tsjrHB9ZvBpXz1Q4/IKGBWNc491+ZZQa5aeSs7ZSEWY2
	q82bc87H8w1ZH4Do
X-Google-Smtp-Source: AGHT+IF6mGQ66zqt23wxmdgyvCpFmx39WbIi+8c7emJk9Jb285zsFEtWpp62qxObMAzNXGOH9H4hJg==
X-Received: by 2002:a05:600c:a011:b0:434:f819:251a with SMTP id 5b1f17b1804b1-4362aa3a029mr127042805e9.9.1734360684343;
        Mon, 16 Dec 2024 06:51:24 -0800 (PST)
Received: from playground.localdomain ([92.120.5.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362559ed6csm141616455e9.24.2024.12.16.06.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 06:51:23 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] arm64: dts: imx: add imx95 dts for sof
Date: Mon, 16 Dec 2024 09:50:39 -0500
Message-Id: <20241216145039.3074-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
References: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add imx95 DTS for SOF usage.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../dts/freescale/imx95-19x19-evk-sof.dts     | 75 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 839432153cc7..27f64e333e4b 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -282,6 +282,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 
 imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
new file mode 100644
index 000000000000..8eef83d7bdd7
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+
+/dts-v1/;
+
+#include "imx95-19x19-evk.dts"
+
+/ {
+	sof_cpu: cm7-cpu@80000000 {
+		compatible = "fsl,imx95-cm7-sof";
+		reg = <0x0 0x80000000 0x0 0x6100000>;
+		memory-region = <&adma_res>;
+		mboxes = <&mu7 2 0>, <&mu7 2 1>, <&mu7 3 0>, <&mu7 3 1>;
+		mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
+		cpu: port {
+			cpu_ep: endpoint { remote-endpoint = <&codec_ep>; };
+		};
+	};
+
+	reserved-memory {
+		adma_res: memory@86100000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x86100000 0x0 0x100000>;
+			no-map;
+		};
+	};
+
+	sof-sound-wm8962 {
+		compatible = "audio-graph-card2";
+		links = <&cpu>;
+		label = "wm8962-audio";
+		hp-det-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_hp>;
+		widgets =
+			"Headphone", "Headphones",
+			"Microphone", "Headset Mic";
+		routing =
+			"Headphones", "HPOUTL",
+			"Headphones", "HPOUTR",
+			"Headset Mic", "MICBIAS",
+			"IN3R", "Headset Mic",
+			"IN1R", "Headset Mic";
+	};
+
+	sound-wm8962 {
+		status = "disabled";
+	};
+
+};
+
+&edma2 {
+	dma-channel-mask = <0xc0000000>, <0x0>;
+};
+
+&sai3 {
+	status = "disabled";
+};
+
+&wm8962 {
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_SAI3>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>, <&scmi_clk IMX95_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>, <3612672000>,
+			       <393216000>, <361267200>,
+			       <12288000>;
+	port {
+		codec_ep: endpoint { remote-endpoint = <&cpu_ep>; };
+	};
+};
-- 
2.34.1

