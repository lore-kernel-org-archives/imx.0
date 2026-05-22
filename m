Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605053D75B6
	for <imx@lists.linux.dev>; Fri, 22 May 2026 11:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448840; cv=none; b=hAEo9cx03UjyBm0PbDaz0IDW0ElMJ6+W79ptqsn/tzrhSt9IGXf4OBaX962VbvyqsQ4sV9MsNUQMiOkIgNKxCBpVt2nFaXqvMbw86ceiLMmcL7kipnvQkRLP6t8oRSZgTS2bHsXKjf5rRJr84UA/4P5QVJ8HEn9U2oi7eZhbYTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448840; c=relaxed/simple;
	bh=jFQm0rjgBpU9oc949n2G41f8CuJwzmzBzE8Zn+NGY2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rssXRsA3AW4GBHVKW8mjd//SDRu0Lr3EGdydc4oN+n8jlSv82GAtZWTfQHn3rHnO09pekbHPq2VfwmY1nT4eS9VKDwBSpfFQRFzDUsMbR7eNq8Im/XQggxJaVGbFzetqF6DhGIoUxsqEAol4jQ2RAbbnIbd0jmCZXTu7xnmkWuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AbWnfkmu; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbWnfkmu"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso37563305e9.3
        for <imx@lists.linux.dev>; Fri, 22 May 2026 04:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779448838; x=1780053638; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLmi76zOx0QuQbmnSuX5CmerIhmQV2urN04KM4eTNG4=;
        b=AbWnfkmusqmXCKSfelqSwbAHqOxQE/IPD39q0ck3wDApQoYuiAAaRp3taelg2USRA9
         gcIZpccIY2i2aTG3EPuWNodTXg2wEXsQr956Ee2DVRZZgBgn0lL2B4H05MjkPaHC4Kxb
         skcotpGd9apKV4qfAfibq5WQ5/437NW2HeGotqkOcFxQuWzsOKGqAFlN4cxA1Lxszbnd
         13EIORfEaUdjbmo+p47YrrbTJ6U4Yefbk+4KZ97Fclvazce3p1XM0JW5eArta5emXHFy
         X/65HzPlcNdE5Dw2QK0y+YdKGBneAZHA6Jyrce0oIchZwKeZqtrpW246+yk37sw5BLO4
         UviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448838; x=1780053638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mLmi76zOx0QuQbmnSuX5CmerIhmQV2urN04KM4eTNG4=;
        b=jrbgkfOc/nqBjFwULVTQ6DnBvv2mGP0Ab1ZUjXdJfi5kmg1jIJqerezCZ+xHowk+Qy
         hD7/3Bq0GtBtnRNNvk76eJXs8h2mUd34k3CaXfvUnxrFy7rk9pHljaRsF0yG9Tj9hYuW
         TslQGifXSU9kJMRCwRVU4cn+FKinJHAMxdmtC6o2EvDp5WHCbBdtlPajs43kKoMIoDhh
         Oqd5sP7SJ+IxnIxpNjJmkLatx4HFXH5IiYZ6hKMjdab+SqhmJIvrS7wC61RzebZFCfwl
         1AFlN1WIu1dZ/K+vtIQ7A7PhWGQ5DptQahd6YAV5pzgHFGa4Od2WIax0m+bZ+cioG24Q
         Kh2A==
X-Forwarded-Encrypted: i=1; AFNElJ+ijYR0klAEwW+Jo9DSSIxZ854YvuosSzsTD52YVQZ05Md4LcymE2mg5otWHSbjDp7Eke4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw33r5xbSLU2rLb0geoMMXCLWBvIlizUc8Uv03+cUs5wziJS2gQ
	eIFN/3p2qZfuiETCFg8UxOea2m5+/gor9LotFA4dmBxcWLv2lYN1IHTA
X-Gm-Gg: Acq92OHxAR85+g5YWDjcW5tMpzCTF8pCajyFA1twEXT00GPjPzZ9OMMiXwQiCVaU2d9
	Kr6O49K53ewjIRLyEYprTOQB0NMyhz3WEkU/InRzP7HswyuCXDCTC2bak0Pmuce+KWBuu8po9xX
	XxSXrvZ0L+hBfLTrYeFdlMaVnGvMQ2yOlXLJB4YDoTfqWlU4QNF3BaavAxuM7VkgVOAXOBxvGBr
	o/1YZkEoVaAF0oCxcIrKb5cipi6HOT3+caRlEnM870FibsYX5qEIbKoKqkfxMUKXXWyc8FCsK80
	HtyCsFGvkeRl8aIBOpKwhAekkdg/r0132TeG0hC6G27s6SEUbXM6xTgr4McztCmLiPr+gNj2ZZN
	fKWqx2OJ5labXgJrHxYg87MTcphSbV2l2xCSmAV+3NTraCLJuFYqjPZCuzRmM0WYlZgNx2htWWu
	BCE4p1gJ1Ru0wNli1MMmSVcN28t+qC/FGvxFoM9YUlefT6401Qvw==
X-Received: by 2002:a05:600d:8450:10b0:48e:82af:d9 with SMTP id 5b1f17b1804b1-490428cc11dmr30590335e9.29.1779448837574;
        Fri, 22 May 2026 04:20:37 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526ca21sm34388355e9.3.2026.05.22.04.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 04:20:37 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: freescale: imx95-toradex-smarc: move CM7 node to SoC DTSI
Date: Fri, 22 May 2026 04:18:47 -0700
Message-ID: <20260522111849.783-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The CM7 remoteproc configuration is common to multiple MX95-based
platforms (e.g. MX95-19x19-EVK, MX95-15x15-FRDM, SMARC-IMX95, etc.).
Therefore, move the node to the MX95 SoC DTSI. While at it, split the mbox
channels using <>.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../boot/dts/freescale/imx95-toradex-smarc.dtsi    | 14 ++++++--------
 arch/arm64/boot/dts/freescale/imx95.dtsi           |  7 +++++++
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 7d760470201f..c94a63a3bf8f 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -145,14 +145,6 @@ reg_wifi_en: regulator-wifi-en {
 		startup-delay-us = <2000>;
 	};
 
-	remoteproc-cm7 {
-		compatible = "fsl,imx95-cm7";
-		mboxes = <&mu7 0 1 &mu7 1 1 &mu7 3 1>;
-		mbox-names = "tx", "rx", "rxdb";
-		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
-				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
-	};
-
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -204,6 +196,12 @@ vdevbuffer: vdevbuffer@88020000 {
 	};
 };
 
+&cm7 {
+	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
+	status = "okay";
+};
+
 /* SMARC GBE0 */
 &enetc_port0 {
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 3e35c956a4d7..f8760ac067fa 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -272,6 +272,13 @@ opp-1000000000 {
 		};
 	};
 
+	cm7: remoteproc-cm7 {
+		compatible = "fsl,imx95-cm7";
+		mboxes = <&mu7 0 1>, <&mu7 1 1>, <&mu7 3 1>;
+		mbox-names = "tx", "rx", "rxdb";
+		status = "disabled";
+	};
+
 	clk_ext1: clock-ext1 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-- 
2.43.0

