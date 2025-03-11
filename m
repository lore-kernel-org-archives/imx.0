Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5135B260A20
	for <imx@lists.linux.dev>; Tue, 11 Mar 2025 16:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741710868; cv=none; b=Kh9s0sZgcwb7g8LrzRMMaUcpQLpAC755tTblEkP0KSwSyW74BSALruLs7ZgxPWKJBjlr5Gjlz0CZAd2wLr1nrJp8FIUsdZutytdm+Z2XTqPBQ7W1XDo40ViQog42KXOmDp8D2AI3o8JlaT1Ydhm7irCDm5VjN8zUZ8PD/UvxAVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741710868; c=relaxed/simple;
	bh=RT2VY9JqMuEddn2VQTKWzBs4dZez2Gw5N7kDC4CqOVo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bzEZRSZHJgwIr5m/z/pvyQjEobFrBGdPIDs/dwtgrw3AzxOZiExgZ8h+Zd3nsRlYbOS4WzifqkUWNu3GbLTthTmFJB3psHbK//QkIDgSS6QdHXskAcr15yCEWuHi8UDUgiUGhP3ysZ7tZiXKmZZmt5bIMuD7dgY1THSzkt3dIPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NBMW1I9v; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBMW1I9v"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4394a823036so48987495e9.0
        for <imx@lists.linux.dev>; Tue, 11 Mar 2025 09:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741710864; x=1742315664; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmIEpE/8tfCzc9/UJAcbQGjEHM9lYmWTxU+CF4VeXxA=;
        b=NBMW1I9vi5GikMcOLXtqBVBMNoHScmUNC9mrSMV7Dx232Bc1a8QT6LFHk+5EkmmC2w
         L4TpXSKq+QFNY1Ap2fcuuxKe/PZbcKE6GOFd2wyVY7DH/7sGwaa9YljYsjNo43csZKRc
         twV0UdAmDG1BsJsiAJPvwN2Sso5y/J9MyZXCivamtQxMI2oySnKiqat8IoHz6D2c8Ppa
         pj2quvETYtaQo5g0AEVQlmBd6XTZPoHkXEvODhGg+fVoewFN/DH+TqBWbfxngQ37ezxV
         L1/ZN2154mYbnDil4u7cVYhqrEs5szjowvX/roax5xIEL/nc8vysEY9gllD6FkTxllPZ
         LhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741710864; x=1742315664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmIEpE/8tfCzc9/UJAcbQGjEHM9lYmWTxU+CF4VeXxA=;
        b=GHsdm7DWk/jI/DTQDosdnm+nDYSUqnZI9MWpWxrYm4ZoaF/kFOjO8oduYMrf8hY9ek
         YUs+oY0D0MlSkNXSmZaF4NPpM6nKPFqunlVM0BJVM37umipISy4E5VJ8u/Fb/i6LhlQY
         RswbcOaglpBY137n2Hf0lKv+NnXW93f4FBOyiPauSxo4FgM2Mmr5mCD5ZBhqK44cx/cs
         EvVigfRbjSD0c2u33X2ced9UX8WHTFd4fACiFig8bO9XR35ZKwBxUdQrpvL2Wo5LP+8v
         HshIWwwJVn8FlyT+SoLKiNOpSFGxgQ4KqXFqPpZoWiIiBHYjNOcH2E73q/fZetPaemD0
         XpIA==
X-Forwarded-Encrypted: i=1; AJvYcCW9vGto37gDazxAILQ1kcRrfFw92xua6pec4rAEyE5DNokBorYRAj0q/6OJqQkEg+u9WhU=@lists.linux.dev
X-Gm-Message-State: AOJu0YztV2qiZtJNOTQF5AqLk3Uc1KYwKi5fKKHFn2DZ2/ITitKBu+HT
	Q1+gb/EFEW3CWUiimHrZm2TvHo8bUF+TRTQS/vfi4AVCt/oNhFuH
X-Gm-Gg: ASbGncvgQS69VTl+4o3gqtyc1NeEsEZokWMPJA4uuHmGrjTSIaRrS9QlKTnOiJz71Qn
	Ub2dE/8imB4WBq/3oFWHFMX0Y/+Agd2jS4SZUNDwuXtFtFj8R2P3EIP44Dc6zFzFavEJCj8hUdF
	QZapaPpw8mcm3IWfFNPPctAmjn+r1yM/1JFXKouPzUb2CwV+XTwB1IjpC9SIwKXCV5OfqbXZzr8
	zQ5aL7qexdh2GcMx+stNLTxFJOCsbwFaojtDmfF8jTHC5zuefJEe98lLldlS+BDVpg1JaDFi+mT
	NXKBr5Yg301t6Ktzs1WAxMzPllx4InDKnXjVgQYcC4FPjR8YNPMIXKyQuxe5jQIuSZFVC6SR0t7
	u3Nz7NOw=
X-Google-Smtp-Source: AGHT+IFEWyfiuJdnyqtyoZYKg9bklwY80ObfuMi86YATpJPQGXZVWeSfXdJIo6hDrYC4S2OTrqZGsg==
X-Received: by 2002:a05:600c:198e:b0:43b:ce08:c382 with SMTP id 5b1f17b1804b1-43d01be6dfbmr66002135e9.16.1741710864569;
        Tue, 11 Mar 2025 09:34:24 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d07fd046esm13398935e9.19.2025.03.11.09.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 09:34:24 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 3/3] arm64: dts: imx: add imx95 dts for sof
Date: Tue, 11 Mar 2025 12:32:55 -0400
Message-Id: <20250311163255.2664-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
References: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
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
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  1 +
 .../dts/freescale/imx95-19x19-evk-sof.dts     | 84 +++++++++++++++++++
 2 files changed, 85 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index be6ef4c56fbf..fa19250b6676 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -299,6 +299,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxca.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-tqma9352-mba93xxla.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-var-som-symphony.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 
 imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
new file mode 100644
index 000000000000..808a9fe3ebb2
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dts
@@ -0,0 +1,84 @@
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
+		sai3_cpu: port {
+			sai3_cpu_ep: endpoint {
+				remote-endpoint = <&wm8962_ep>;
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
+	sof-sound {
+		compatible = "audio-graph-card2";
+		links = <&sai3_cpu>;
+		label = "audio";
+		hp-det-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_hp>;
+		widgets = "Headphone", "Headphones",
+			  "Microphone", "Headset Mic";
+		routing = "Headphones", "HPOUTL",
+			  "Headphones", "HPOUTR",
+			  "Headset Mic", "MICBIAS",
+			  "IN3R", "Headset Mic",
+			  "IN1R", "Headset Mic";
+	};
+
+	sound-wm8962 {
+		status = "disabled";
+	};
+
+};
+
+&edma2 {
+	/* channels 30 and 31 reserved for FW usage */
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
+		wm8962_ep: endpoint {
+			bitclock-master;
+			frame-master;
+			remote-endpoint = <&sai3_cpu_ep>;
+		};
+	};
+};
-- 
2.34.1

