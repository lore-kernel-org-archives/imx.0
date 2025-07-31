Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D367D2D29D5
	for <imx@lists.linux.dev>; Thu, 31 Jul 2025 14:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753970524; cv=none; b=kHMUONbOVbkzg+fyBBD3QhDXXvb0Ru3a+8PWzhs4d8BlplDpW/4TbpWM2JkhDCCa1qxj8QfFojmxvXZaE5S8YQrUX56arT07s7wOL3hBMVF2QKDrfDzaVjYhqzfeZWp8C4593j8Ume90LluFHKBIdTBJWYp/lM3mhS7nkSnsi8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753970524; c=relaxed/simple;
	bh=vcA02yLSNwMr2sw3WTjr/QQMCrQppMAlK1ftMTli3h8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mCkhu8lOwkgGtktxavs1P7OpXweZSU+C4dFuGttmQ11ggfoxitRZn4DZE/iwCPjlg4KPFHifjNmJWxB5mPhDAR6BT+l1RQ6sLWiPHhipexLomUFw80TwDBamrkyboV1E3xzbAYOriT2u1qFWMBfPOTDESzeMLMTxlF1akpC5hIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qmdK7Jzi; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qmdK7Jzi"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4561514c7f0so4551425e9.0
        for <imx@lists.linux.dev>; Thu, 31 Jul 2025 07:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753970521; x=1754575321; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aB00SSfP6c+OHo+3LviFK6KTCkRiE6kjMG1sy5ThVvM=;
        b=qmdK7Jzimg2JatCoU0AxvRAgnbVRb3KJ2w33v5uKhFx6YIGe2IIsDzm8OFzZ1PTA9r
         dYxISt3blMO2u1ZqEnwPGRt0lonLseXRsVPo8KjvkKmcmFtqjZWdq7/McDQVvdK1OWgC
         Ii5zdlHwvldBfdVI0/g172vl4uevGSI6uPrOjIq5IBbE8Uv2+dXCnpcBHeKK6AOuxIos
         IwxtM46d/Llr73jzN4O8NapSVz1P+4qvFNG+esOOxwjq6wEzf1VBBnkevH1OPzi7S8bv
         CyiHDS919Mdi6x1rBswCkB7PJmNY8nm49Drd7UEAIE6IFNLckikWuJoGnaVzddtEhHLD
         XMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753970521; x=1754575321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aB00SSfP6c+OHo+3LviFK6KTCkRiE6kjMG1sy5ThVvM=;
        b=M+/37LpBR8RRrqJl4m85yp+CSJj5HU4JAsPGnvK5/aEKlW2RMgYGtaBb261mxbgwPc
         e/A9rpPV31bNJrebGScTsV8JtaCxtHQzUksox/KoS5H5/zYIrTci+gscoAMpmZ6lkJtu
         OCmullyG7odnjbBhD0k3Fafge3y3vipUjKmebfqpriG6M6Q+r88ZnmXXOnM1mMUYfDFC
         XqmYHNmW9ImMm4nvvWY/QhBGDTqkSOhiTHDNXWzGi2JoGyUTqjhQc3MEZCvJ2fgv/jQ2
         VaSOxrprHZff2f89NOyjt+v15z1yv08DrvUz0IcxwZZwjbVUPqixdGEEddLlEm/WZrpF
         Y7uw==
X-Forwarded-Encrypted: i=1; AJvYcCUcrehyPAdVVsw+EUNL/XFmhCXdrUIifVLxREjMJyio5DgNr2COIQncvBoF6MqkPRPcI7I=@lists.linux.dev
X-Gm-Message-State: AOJu0YwM4h961NEh482K5LkY5NvHZw/Kq7uXTd8yuu2bV64VJcH4bcRQ
	XvCF5hwl0m6xVB0t8Vsf2lkk8FI4c0KWtbEoMF09xClxPyglm1hPdTXsHaU3CL+HRr0=
X-Gm-Gg: ASbGnct6c4XsKn6ohqjuMQ34vlJCV1OwiWnfLqRDmZsr9rj5bL1wiqafC+Rauqz8RFu
	od4LWDUycZEM2/dZu+nSeiqGRvl/GNmBFpfE58kAes9/gVHgFlMYuBkqz3AfnHbtSxNJ3qRd5h7
	C/DI5JNVbAEcxTZupK9p4AkZ0quFh4onHTkRW2kxo9ivpTMfo8UxSLoUFsCHKLHVx90PA7EycOL
	1T4kxgP+eUywBi0Qp8wAGlnjsENfWX9Rgp6bbMKJ5RT7zZxuKmWHihh0Iht3chdij2t2yBeuY1V
	dR5GvhZa4QbZDe4yrZ678A5+Sa7GYoIJNBTUajm4w3R7OG0cpqUhbUBfJj7R0jBgZvb2aQifYR7
	ymnERVnsZOXWYULgwU2gUlMZ44Lgi/zVUGGz227ZcFj3Y375X
X-Google-Smtp-Source: AGHT+IGqwlW5ma8WPKveKqUhTUAr3VgKYFhAtuL+0U//6ALH9ryJa3alHyJCYGFqgrUVq1o4bMWuuQ==
X-Received: by 2002:a05:600c:8711:b0:455:fc16:9eb3 with SMTP id 5b1f17b1804b1-45892bd7be5mr65100585e9.33.1753970519969;
        Thu, 31 Jul 2025 07:01:59 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee57c18sm28121285e9.28.2025.07.31.07.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 07:01:59 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: mbrugger@suse.com,
	chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: s32@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Thomas Fossati <thomas.fossati@linaro.org>
Subject: [PATCH v2 3/8] arm64: dts: s32g3: Add the System Timer Module nodes
Date: Thu, 31 Jul 2025 16:01:36 +0200
Message-ID: <20250731140146.62960-4-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250731140146.62960-1-daniel.lezcano@linaro.org>
References: <20250731140146.62960-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The s32g3 has a STM module containing 12 timers. Each timer has a
dedicated interrupt and share the same clock.

Add the STM0->STM11 nodes for the s32g3 SoC. The STM7 node is not
added because it is slightly different and needs an extra property
which will be added later when supported by the driver.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 99 ++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 991dbfbfa203..c2c986f03986 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -374,6 +374,42 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		stm0: timer@4011c000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x4011c000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm1: timer@40120000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40120000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm2: timer@40124000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40124000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm3: timer@40128000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40128000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		edma0: dma-controller@40144000 {
 			compatible = "nxp,s32g3-edma", "nxp,s32g2-edma";
 			reg = <0x40144000 0x24000>,
@@ -471,6 +507,33 @@ i2c2: i2c@401ec000 {
 			status = "disabled";
 		};
 
+		stm4: timer@4021c000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x4021c000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm5: timer@40220000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40220000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm6: timer@40224000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40224000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		edma1: dma-controller@40244000 {
 			compatible = "nxp,s32g3-edma", "nxp,s32g2-edma";
 			reg = <0x40244000 0x24000>,
@@ -560,6 +623,42 @@ usdhc0: mmc@402f0000 {
 			status = "disabled";
 		};
 
+		stm8: timer@40520000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40520000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm9: timer@40524000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40524000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm10: timer@40528000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x40528000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm11: timer@4052c000 {
+			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
+			reg = <0x4052c000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@50800000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <3>;
-- 
2.43.0

