Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA0A2D0C80
	for <imx@lists.linux.dev>; Thu, 31 Jul 2025 14:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753970521; cv=none; b=Tp7KPnKJw5XzImohD77IRAncBM2daSR88WBCoNLnBM73buyxPiUIueXma3OjgFMZQWq74QeWGaRVTrI/2EH3913S2vB+J762ScmLB1Mz2qbU920Aa5HiXfcUD5v0+lZ535wQ4Oa1Q1etfcvDi7knPcdXXaY4C0ok9ydokjJk6hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753970521; c=relaxed/simple;
	bh=Xpc1QjbDF2eak56qCWUaPd3vkbEYlZ3tB5wz0Bz9ZkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H5PzZpxcP61A9tCgapV8bJxnDWy9qC/IJZMRT1gWEvpCcyuvTz/yYYLLPBuaCU52jUQcYqtZYNuM2BOxyUERatH4Htk3Djs1JePKAEIhp0CDq4z6bB0iGyjR46Kc//v0d1enBAlurGpaptAr3lMKtbqbbwCaBUXhuQBloNGnVuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=boT0c+zR; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="boT0c+zR"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4563cfac2d2so9144345e9.3
        for <imx@lists.linux.dev>; Thu, 31 Jul 2025 07:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753970518; x=1754575318; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mwFsTsG6VVVIEYXelcVJDGOE+gmfaFKEIVGQh0yHCdM=;
        b=boT0c+zR2MndmeiGjzeCFytlU4grs2AcbNdUpNYciY6UKRWTF6awOjlNP3ChcqsUlR
         FeyVUFsH3EPAN08C9Zo37du+VBmsnZwkGwCgOokbqpcv2RQR1MW1Kapg2gzJfT4Qh5F6
         rDEhCrBgMgVLBM+HoKDgbbIsiwbxv0IRatpjtq+6EVKVYq5sD0/3erC4ckwia8GAHX7j
         a422TUr2ft7x6Ppfy52HpxP+4FPEFOGTuYWH+KaErffaqn5sO3uNLRA5HVWbUqO4RHRU
         4pJUSz8c+IPFOaDsB2MF5ocozalwy8I7e/CGNNdLy7R7ZMk1zkHOEuZUt5TABMjJp91f
         hwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753970518; x=1754575318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mwFsTsG6VVVIEYXelcVJDGOE+gmfaFKEIVGQh0yHCdM=;
        b=kVyAUvf6H5c5BE73ugjbrunAeStxZTK4q/aoOCCknf39AL7FnsL7SgJuSmU418kw56
         Dy6s15t/o0i/DE3mmhggfftPwrZ+YFXM+U+Ib8PutcDT3PoR24CfcFSPbZ5C9CESCsZD
         ti5CI1r/tXVzZ6QwpgStHAtiIRlG+uGDWhEK1gfqDPdIKYAkuRJtB7I1Nwm91OOFiH0S
         UBSxd0tFGiLGgjBav/a/hFUrhsG/IM4tPl+aoDQmlrRkroew/geB2SXex9ksOsaFJndF
         z34ZYQmljwiZT/FZbLfT142o/BjRWP3xIX7nPTMZ2lP2sV0+CxplOnS+cf9AWt1bcqXJ
         6sjg==
X-Forwarded-Encrypted: i=1; AJvYcCVTOHtyaetLDFTlMUD8mNnCg8llWUtrLjtbhfsVQTUaAPcaqvZJYaNvRc3wOWaYdc6uwT0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyLkDFt0WAxH6Kx6jdzzX703B4z81GFnq3kGl1MLkkLyc3VsYyR
	xQvldBME9RrQ7vdJ4R9mmQ7WGeOLmOY3PJ5kJ5QpVUy2OwZas3sEMA2bSs6qB9na76E=
X-Gm-Gg: ASbGnctYJMG4WRG6V953/93MH66NDP9X5+YRUzUHwiPQrln/yjr381AeoMV1DRYKodQ
	NIRqBeQOQGhZL6j6FnFN6hjvdfIb8XzVpx80uUG5VV5ZUycQNj/MaT9sUkLKwFzzsfQMAoYuVM4
	Hz2sPTESlMBX4Gzs5F/AlD1lCnUQug5k7HGAOYkeix/i3L3CRnDi0h+/LMsbx4PUWWSpd3FceLT
	lkxo3GXeo2TqxhQcw12dNFBxFWrxxYDB2d/VYLmYiwKMPeYfF9LnLzy0W3XLrvQLBw9jI10NAzQ
	d4Z40V1H1T5O5Hw+rbpLd/bBEibzIokNnPmDMLnOT7nNZG/oUdrmoneIy9IGBFiU1I7Qa85q1g1
	svfqbF8adcKbeGGk0Yg7qOa3In4EzBf3M+RxYDnxJ5JTdFEYx
X-Google-Smtp-Source: AGHT+IE9qKRVnjaVEgn1UAlBxYnmTqRy8r5vlmAdzB8hFwkW2dkNsNPHqiJWxr1+s5Cb5BtT0A9yoA==
X-Received: by 2002:a05:600c:35c2:b0:456:1dd2:4e3a with SMTP id 5b1f17b1804b1-4589c2b7c59mr53270125e9.3.1753970517567;
        Thu, 31 Jul 2025 07:01:57 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589ee57c18sm28121285e9.28.2025.07.31.07.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 07:01:57 -0700 (PDT)
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
Subject: [PATCH v2 1/8] arm64: dts: s32g2: Add the System Timer Module nodes
Date: Thu, 31 Jul 2025 16:01:34 +0200
Message-ID: <20250731140146.62960-2-daniel.lezcano@linaro.org>
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

The s32g2 has a STM module containing 8 timers. Each timer has a
dedicated interrupt and share the same clock.

Add the timers STM0->STM6 nodes for the s32g2 SoC. The STM7 node is
not added because it is slightly different and needs an extra property
which will be added later when supported by the driver.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 63 ++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index ea1456d361a3..1783edb81350 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -317,6 +317,42 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		stm0: timer@4011c000 {
+			compatible = "nxp,s32g2-stm";
+			reg = <0x4011c000 0x3000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		stm1: timer@40120000 {
+			compatible = "nxp,s32g2-stm";
+			reg = <0x40120000 0x3000>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		stm2: timer@40124000 {
+			compatible = "nxp,s32g2-stm";
+			reg = <0x40124000 0x3000>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
+		stm3: timer@40128000 {
+			compatible = "nxp,s32g2-stm";
+			reg = <0x40128000 0x3000>;
+			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			status = "disabled";
+		};
+
 		edma0: dma-controller@40144000 {
 			compatible = "nxp,s32g2-edma";
 			reg = <0x40144000 0x24000>,
@@ -409,6 +445,33 @@ i2c2: i2c@401ec000 {
 			status = "disabled";
 		};
 
+		stm4: timer@4021c000 {
+			compatible = "nxp,s32g2-stm";
+			reg = <0x4021c000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm5: timer@40220000 {
+			compatible = "nxp,s32g2-stm";
+			reg = <0x40220000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		stm6: timer@40224000 {
+			compatible = "nxp,s32g2-stm";
+			reg = <0x40224000 0x3000>;
+			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
+			clock-names = "counter", "module", "register";
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		edma1: dma-controller@40244000 {
 			compatible = "nxp,s32g2-edma";
 			reg = <0x40244000 0x24000>,
-- 
2.43.0

