Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75D42773C6
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 19:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769197887; cv=none; b=CU/0upBQIWO2zn/4R9SagG3Vik/760daxdQjC7RhVHUKt8HjSVLdPJ1e/YITAwfWwYYBmzk37zAFgZC1LAZXzA5D9uQCJb8HBI81HNdRxbbfyV/ojLrKkkx75v0g6X4ddjoIh/UwN206wh+m85Ke44jUnG9oI1mOmBD80kKY5kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769197887; c=relaxed/simple;
	bh=CsVAGnJYyt1gpIKIOyO13ylzg/PQgaXnaqCXcwteapg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JnX3Sm8FdtFjG9HKrr+CncRuMA3bGHyfftEYu0/GdCK+mYfHkCkV/f1+TaRdnQulX8ynHsQYBPwJkr9CMoSxqQEnOBTRhIXOSRAFh0/EarYAgLs4Ijl8iYyu0EjlN4zgdArSTEKIxAD/wn4QQT2rWndhfieFhqYQinSCjIh4uKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f/ufrs4A; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f/ufrs4A"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so22145785e9.0
        for <imx@lists.linux.dev>; Fri, 23 Jan 2026 11:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769197884; x=1769802684; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MNmEBAcCOcnCArGc8pe5UUOL3dPUYv44y06uRTFe1O4=;
        b=f/ufrs4ANslldKKIS+Ttr86byl8em2Zf8RdQ3IjZI7wSFHuaRKTjXlJcGSPdlsqsWZ
         HNeTaTvFDoXHUYx0CoKgQsNuxzneZo/GlKwhhzLCQaM9Slld3Mwae9JUaBtN5xLZD8Ye
         hz7BZWniLItDtIeVG6wT/KB7miekwjYSPfIiSvB4UIBAYODAmZnMcrnqZgpk0j6vlLEd
         flqxW3LJOnZzCvPYZ/PlDYPyIabD8L+F7qvp/UHPIEb/A51fHi37tbOFXujm7+yzDsYE
         uM/JNdTsYtyRJVTJkEphE3DaV/0RDOnFxmjxqdxp5uqsw4UtB1birIsSCVTCJimZ7H9e
         p7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769197884; x=1769802684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MNmEBAcCOcnCArGc8pe5UUOL3dPUYv44y06uRTFe1O4=;
        b=SsvkcbzrVD6XIw9o7vXv4Dnf8WaY86NM2lyxQeAOLtQLZCZfFguUNK/4shTGm5frja
         mryPlRhsx1TKzM2aI+r0Fm+ISLSj/pabTJR6mR9M3UpAZlwIQ4ZttIkketht9L1t0mC5
         3qi4MMZOiXnDr5wYcxj2mrugPDkb+mtO3bJekcpDdyfF+g7vDn9F7rUA8PbF4QbNU7ol
         nYmOTXmvaVkv88k0PHoWky68b4YGetvy1Yw8jAkTBXiQey/q5ZWzbIegUk7lCTbkKbMQ
         t1wbuVNx9kKHV2NR+OKsxL+ds36RkFb2xOqtS1mx9xOCoCTAmUUsMZex7Ri/c29780rb
         q74Q==
X-Forwarded-Encrypted: i=1; AJvYcCUhHBeG+XUgATm5aMVoxqeE40qYjhsCxtnGCX9GYDu+6YXninSUV99EXAI8hZYhuY6ErOo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxkpRVTD5g5adHdgiV+ystf//cCuc4MP2bZUYx4GTVo3VfdFWcu
	cA0Ze08xPArL0JuSz3OKjifzG5Gq+PpaRgp4DNZpjrGMFHNtXCfMIDVHezq3YHsdMHU=
X-Gm-Gg: AZuq6aLAAHlvHdn5MXy9kRN42MDEg/TuZVzI7ZAi0rp+433/+dgXSBYIlGQsYLC8Wld
	PMpizyn+e1g52Vl2I+GAS6RlOFwJ0hzpjcwtatPZs5ddC/oTTsHtiZH7sxAUfko/Z9GP7KLWIza
	BbDD0dw14AUXjceCpZK9I6UISLbjocYH9JH3h9Rryq0BF046aJeafu3of/6PEduiHQQ9VFfApK2
	MrbDAbfIp8FVmv5uMR6XTh+E4YxHBbx5ZH78eV3DP28WHNtBEuwDt/1SiSGL98jIY8+ciDJutyv
	JiOw+lrKIX7UWij18n7Sp41HJJ937ip+Zd8qtom9kJdm6zDD3zcAB51N0kdj3V+UBtTWgydjaLI
	x7bN2GUlBY2iLZUfU3KXDcfQ2P4sU0sYrITzrmNXUM82fvCckXkcTk1WSVWLqWQWeSiNMe+a1Ty
	/jhJ/+9yZd7jzbepXU
X-Received: by 2002:a05:600c:3e0e:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-4804d307b0cmr68595535e9.16.1769197884089;
        Fri, 23 Jan 2026 11:51:24 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470bfe42sm156761385e9.9.2026.01.23.11.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 11:51:23 -0800 (PST)
Date: Fri, 23 Jan 2026 22:51:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.li@nxp.com>, linaro-s32@linaro.org,
	netdev@vger.kernel.org
Subject: [PATCH v4 3/3] dts: s32g: Add GPR syscon region
Message-ID: <34ac20223cf6833a0fe4291cfb2db5309f4e5eed.1769195864.git.dan.carpenter@linaro.org>
References: <cover.1769195864.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1769195864.git.dan.carpenter@linaro.org>

Add the GPR syscon region for the s32 chipset.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v4: no change
v3: no change
v2: Remove #address-cells and #size-cells

 arch/arm64/boot/dts/freescale/s32g2.dtsi | 6 ++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 51d00dac12de..b954952d962b 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -325,6 +325,11 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		gpr: syscon@4007c000 {
+			compatible = "nxp,s32g2-gpr", "syscon";
+			reg = <0x4007c000 0x3000>;
+		};
+
 		ocotp: nvmem@400a4000 {
 			compatible = "nxp,s32g2-ocotp";
 			reg = <0x400a4000 0x400>;
@@ -731,6 +736,7 @@ gmac0: ethernet@4033c000 {
 			compatible = "nxp,s32g2-dwmac";
 			reg = <0x4033c000 0x2000>, /* gmac IP */
 			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
+			nxp,phy-sel = <&gpr 0x4>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index e314f3c7d61d..be03db737384 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -383,6 +383,11 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		gpr: syscon@4007c000 {
+			compatible = "nxp,s32g3-gpr", "syscon";
+			reg = <0x4007c000 0x3000>;
+		};
+
 		ocotp: nvmem@400a4000 {
 			compatible = "nxp,s32g3-ocotp", "nxp,s32g2-ocotp";
 			reg = <0x400a4000 0x400>;
@@ -808,6 +813,7 @@ gmac0: ethernet@4033c000 {
 			compatible = "nxp,s32g2-dwmac";
 			reg = <0x4033c000 0x2000>, /* gmac IP */
 			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
+			nxp,phy-sel = <&gpr 0x4>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
-- 
2.51.0

