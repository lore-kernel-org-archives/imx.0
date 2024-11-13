Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E3C20966B
	for <imx@lists.linux.dev>; Wed, 13 Nov 2024 19:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731527612; cv=none; b=cE81/lqaxGbL68BM0cqJWGQniKfoc1TCoMaxiZhIsHydkOU8ab97VihGhhREt/GvHDjFAtAAELTYNc6QtwKk3+C3q4+PwGkcpb2P1eAd50KCdTo5MERmgJOaClfGsQLmlXhmnwBTRQrM9ld2MiPv/bOqJ4GzgWY4IUMwbNdKIiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731527612; c=relaxed/simple;
	bh=7K/cyMoay2nX9mxkWcw+cOgGAMlaSf60f/rCoPj0sRw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ks2T6enhcUkEZu9mlGatCgeMtA1/lBQr6MVp93RcoDcxOdxI5nxD36vvG9rrFUlUQt6zgktbcJLRYn4VLSw4AJqnWcTf0pB4qmrsanY0cfZ33DO+6dTCVyGMTSpXY14Hu1/Jj5sFYIGrCEFZFLtBODJupyw8zd6EJbNHeFU9Adc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nPJaP0Vu; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nPJaP0Vu"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-432d866f70fso5667495e9.2
        for <imx@lists.linux.dev>; Wed, 13 Nov 2024 11:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731527609; x=1732132409; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyiKN4j8ScToVeD29C1kvH+uEOhOz+pcRKy9I30xNm8=;
        b=nPJaP0VufJ6De6wHt/ntO7IeTSbcXWOsp+s0olyt2xXqQGGPYSWU+59A6L8wrWGiWB
         R+zHT8IYL+RkRHTLwXrcl0YlThAdm5GQg7+XkqreX0jtzPzfyNzvutGwpHWSg/Y2m+7I
         KMF2/myu68uCT8V8+ofJz66NYFoX8dP6j4Qv+Sgkk5wpwvrJBxADBCyLuON6x/OML7mK
         LZBYENSMc8ba6oY4RIlJJCMP84tmzKwW0CRtgAWNfJkpfIe+xaFxRq1Wd8MxOTEOWx7z
         PFlDzXjA11CutdeTvU3SNIt2w4fHAW/CtsZDjBkwLml1K33pt0wWk+pAP0ySkwXSi8rd
         C1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731527609; x=1732132409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyiKN4j8ScToVeD29C1kvH+uEOhOz+pcRKy9I30xNm8=;
        b=woBgTIw4E2DP+L+w6G++4R17GJsl3B/l1tmR9M0q+JJyIK87pppyIUR8Q/Kr6FBSf9
         yj7MPeQjyEZG1mPlRx/1pXvvieF6UuR38QUh7Di3Fw9T3vCcjWycwxCoPIuuksYqF+Mj
         QFT/Oh6+BUlNKHDpBdo5eXQ1mQ7HslnMXCAZkNG5hAzsoQ/HoN7ckYRA5B38o/HY/ds2
         kkdQQ482O8nMwQ7gcuW7kDTMJipeZuCkqLcAOULmzF8Rm0pxIO9rF6N425Mj+gQKmVeD
         fq6DW1uKceroSv7YTcJDPKcRvS+ffVD89z7tu3Q92tb1aDqyg2ByQ9IUeKjOCIkHR9P5
         PqXA==
X-Forwarded-Encrypted: i=1; AJvYcCVopsgA53B+mAVBdjLcFfwRSO4XOEpeFR42jD/h9GwKleq3lTiXrRG+hfrVY2NNTbIdtic=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYKWtqwBtn1jkywxY/2Jxr3cybM2AolbRtMkcWyzgvh7h6AnFo
	xvxSFknqXz0fF/Jbd7WUFNTLJ/5EKyIcMqZv6zu2pvpqYV/RIwlm
X-Google-Smtp-Source: AGHT+IH5pQOH+tdTlfkMOvIS+MQ4+qFU/bkE57iZL/f5drqJXEIAe1r5ZHxHvXGCYhMteIXIcTN3Ww==
X-Received: by 2002:a05:600c:5251:b0:431:5a0e:fa2e with SMTP id 5b1f17b1804b1-432b7515a08mr170581965e9.21.1731527608970;
        Wed, 13 Nov 2024 11:53:28 -0800 (PST)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d5503c58sm34633065e9.22.2024.11.13.11.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 11:53:28 -0800 (PST)
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
Subject: [PATCH v2 5/5] arm64: dts: imx: add imx95 dts for sof
Date: Wed, 13 Nov 2024 14:52:40 -0500
Message-Id: <20241113195240.3699-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
References: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
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
 .../dts/freescale/imx95-19x19-evk-sof.dts     | 74 +++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 42e6482a31cb..0a313133d013 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -269,6 +269,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 
 imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
new file mode 100644
index 000000000000..3fa4c252e355
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
@@ -0,0 +1,74 @@
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
+	reserved-memory {
+		adma_res: memory@86100000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x86100000 0x0 0x100000>;
+			no-map;
+		};
+	};
+
+	sound-wm8962 {
+		status = "disabled";
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

