Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE14268C6B
	for <imx@lists.linux.dev>; Tue, 11 Feb 2025 22:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739314735; cv=none; b=aMhUHZuRt0zBvqs9wGLzGDQn3zJlRtV5A2fklBZW2t0C1/eJBjWIVmd82v/kWln2fEH1b0IfP6o2+hN9gAhP95fwzA2SbjCGUaDVfEvElYMEcaLvJuw2npykTQXATEa2We5sEsQwR/K76AIJSjHSxGSFD5/fAjy/f34mfn0732s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739314735; c=relaxed/simple;
	bh=ZYKjylCz6U/0L/L3Gbbqd3HrsBe1+tDd+PVvTCCII9o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZttOUJDHx1voV33lFWRVMNXNIHtJx38ekzN5hs0XJhI2CvSvqXuFWVQVJIpRnCUSiMXyTxARx5zChyvKOJSjWealnI8WpDS3dvlsrIJQ6FwoBuVv+TWssacyATmr9453MbJbg20/USm6vJ1D9wrAwr+/ziY8QN/8yQRBmnlMbDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJe79U8F; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJe79U8F"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab7e3d0921bso187662366b.3
        for <imx@lists.linux.dev>; Tue, 11 Feb 2025 14:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739314731; x=1739919531; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6qEcHnFbnJv5rEQMaO2HHhljugT3IlHPIHIMW9SmVWI=;
        b=PJe79U8FyXjdpiTjGA2JmcYXMGMrwOJgpPX/+pHJS7uqgyImxW++JNHm2M3Ryk8vht
         IiW20obtJhj18MYOCTCUir6DlUNpSPXdO1av1s4pl78fOeJbeTOnPzXEt1F8MGvroxkX
         Y+V8b8jBlyrQr6ln574tiy7y7xv8NSoRFEnr+Ol0QXcryMTmpBW+nI+JxglscFB5pmhv
         Qba+8sPOO9S+eZJSrmDH12fB6PIZsg7aKXFF6jvlptTTrfJZhIk1JXh3r4hKlVuJYwEF
         E5VitDZPv1eumW7yPnEkd+GV+709TcRLhJ79eKF3o7U08rhi2J2m8NnCxzbbzynv11/i
         fk8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739314731; x=1739919531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6qEcHnFbnJv5rEQMaO2HHhljugT3IlHPIHIMW9SmVWI=;
        b=BqyrKKuUUOgCIoNrGFDYh5j7z6cEWbnhOFoZYENc/Z+eslSNjXR9EZKE8iBtWAbKT0
         1P3LxY8gjRlEtuDpBe96VvCq25NuEoAEwHrloJNfQODDFPKjxr5LHmCbepo9nMipr8KZ
         FM8c9xebEaxEVWM0COwg7JxMEtdp9F0Bkqq7y6ply7bHtV8D7ls5EY8nYqAkyhAQbI6t
         sy3prkVrrzcwmEaWLwgKtbnIJ8YEYUl1Kcn9W+DLhdkV1M5jQAdRoIjhKSEFiSKbSFaI
         rxO3W5gy0W663agSANRJpVM6S/Zo5/ebkxLcl0ECLdayFNS0WnTGlt7U1Y0qLgnFZyL9
         qMCw==
X-Forwarded-Encrypted: i=1; AJvYcCXyKYL0jxItSBE8xtbrwcF4+kKTQ81FxHueY7clKmuZLr5IcY6dkmgqrZmKQLuI4a4M310=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3AuuxIRnqJjetCDuJ6TfBN1PH3HbRJUN1moLsmxRcRHd4mE8t
	b8Rb4VcH9U6SPfwYbTLzRdsBZ/rP3VpxhAmQLJ5k3WPHKFaGsXHq
X-Gm-Gg: ASbGnct1fDmE+OU89/C8VOJx2iLFne/b6oLjzihVh/6DTxKuLf81vtQdLW1gDGrVRZS
	lJykT1MgIvQTflOn/WKG+903TlySy5vrms4qdaTR9GfzCe7m+EsNPn3a4m2HhkmkDnFqB6NeU35
	k/JBoBuKoB/4C09PKMJ58lOomGjPMjFt23yLnSOalpduJ9I4use6mAnODCxScIkZb5T//a7xFFk
	id+ymjP7ZKHF8qKRY55BBXIcKenr8u1rV0ZDH/nHYYyMxQsKgdQe+tDXqNpLu5wcc84SpYNUyLO
	5qaBtJcmz4PIEKIBhfC17RSFYQ6NkqinYYBZirPy8OWZ5pEIM++13w==
X-Google-Smtp-Source: AGHT+IHyuiaJRoN+GdUxbeu3lRwZ7O6QbyCCZjzjPJTrp3NnmoIIq3WEcO3F8K15XX7Gr6EziTEjNw==
X-Received: by 2002:a17:907:3f21:b0:ab7:e47c:b54a with SMTP id a640c23a62f3a-ab7f347c15dmr55101866b.37.1739314731047;
        Tue, 11 Feb 2025 14:58:51 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7e9fcd99csm131525166b.89.2025.02.11.14.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 14:58:50 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/3] arm64: dts: imx: add imx95 dts for sof
Date: Tue, 11 Feb 2025 17:58:08 -0500
Message-Id: <20250211225808.3050-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211225808.3050-1-laurentiumihalcea111@gmail.com>
References: <20250211225808.3050-1-laurentiumihalcea111@gmail.com>
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
 .../dts/freescale/imx95-19x19-evk-sof.dts     | 85 +++++++++++++++++++
 2 files changed, 86 insertions(+)
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
index 000000000000..ce7b2384e459
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
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
+		reg-names = "sram";
+		memory-region = <&adma_res>;
+		memory-region-names = "dma";
+		mboxes = <&mu7 2 0>, <&mu7 2 1>, <&mu7 3 0>, <&mu7 3 1>;
+		mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
+
+		cpu: port {
+			cpu_ep: endpoint {
+				remote-endpoint = <&codec_ep>;
+			};
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
+
+	port {
+		codec_ep: endpoint {
+			bitclock-master;
+			frame-master;
+			remote-endpoint = <&cpu_ep>;
+		};
+	};
+};
-- 
2.34.1

