Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1840F34D904
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 09:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769594059; cv=none; b=l3tK9qRkD3ks+e+JWzTy8b+AM3LrKdsvVibz52XvxO/0Ytzp3d2mMayUAvpgyjy/ZcIa26i/qiAL89TGjSR6QC6SwLIvvlKzTaBK9NY36rgFzU/YilbGmq6YdlKCkivfvl6jeJOUZZCZKDc4ahOI8zSztbry6yK9ra5DbMVgwyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769594059; c=relaxed/simple;
	bh=8OOj3Wng4dXaPJsiDwVOM1LzCgSn6Um4RNSrv4895sE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OM3M6sdzT8DE30XoCD1JLLsGEgVMcHWxyVdt1t+RJH2hdnLMrIRG3n3cn780ekiO1H4TdgHmOmTKuXv54ELFwmylv8Hyval93Cs+XXx3e9os++tMC3j0IhHijmeqGbQbjaQHTRFwn7Uyp7JycN/RuP4hZcI0Ix6FsX4QGd2xhqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lgDDcNGb; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lgDDcNGb"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4807068eacbso2555605e9.2
        for <imx@lists.linux.dev>; Wed, 28 Jan 2026 01:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769594056; x=1770198856; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=93zs4bIGQjJ2eAJOoDnsMxPVORSrFYYCc5PKWJTbXFs=;
        b=lgDDcNGbfxbealH5Cq+ebbZBsiTogLSvydqDIQSxubfoTftL2ElTxb4lfS5YXXF14Y
         mAyEGll5h2pjGkk2KxBW/VAn7vsowtFbeNue5jVO36r4CvpeNX5gTBJtTwp8aGtGnaaz
         fT+EE87z8TQwYGUSB1jpawRGj3+KZzA1eG6uD1/LT/8fstgJZr08dGaUrdt3Hy+iMMPS
         9jVVuUE2p+l3Ld4JJSve7JgK25dqQtt56121lwa/3PQdSDfAkt4i2XnP2LoBhfVMsgZz
         qDlphLcQo2RNwmgbwVwGf5xa9wFXsfHW20hLBSXxXSdkQho8GsRV8CH1caBpDbzFoYNU
         rOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769594056; x=1770198856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93zs4bIGQjJ2eAJOoDnsMxPVORSrFYYCc5PKWJTbXFs=;
        b=Zrm4It58TqyCqwS/sdnrBcyy3t+rvhEGdTz7K++tfMhSqtAMkadsQg8D5wSgtBkaqo
         /+tn/hxIoAWZIJVwRN8M650G+H7nh9Sv9uJmlpLJk5JuEevdynE8XQfUris6i3+fyma0
         e/XhuQ9dC9MqPGP6+O0g5IuyZAMzFQggmDikvoZp9zepygWWgCkQO2Hd79Qhm2ydRM3+
         SFpLBaFQ70vV3PaQpkl4t1KYDWqdPNQujoLLhB+TCZzIHa2wval3YBLjP4flttEQgfdm
         PQdcoSky4DOzibvecx8x/wFPb3M5/L7cpVX24LPXG/M7xeEIWHGnDNsRJohoNhEggEV2
         3zgg==
X-Forwarded-Encrypted: i=1; AJvYcCUl2VHWNFTd5AFw4fkJzB9i5JI5aFeZWwAb6TK2FZjjQDVBoZF/rG4gJ3VPVbqAxcRiHBc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOxuKJHYY11pau1XL2MHVrZw8N2ctdA2Dp9ccsbiyLNxGrBNFy
	tERj2/p9+KLwM7M5exs/+VQP+r/+Dfc96/08mvsKP36bSQ11NhXvudGoffFgmswjB4c=
X-Gm-Gg: AZuq6aKOTx0qb7F7IYCrJhW4+yBP0oIzqbJqJmu4doNR9GFAmcs/MtFLbyOROHkxHFn
	IbJfU0Bmhn7aAS1nJaw1zgeugK0uK1OXAAYuaM9vqmBsehu5mVE6U+/AIa4+AU5Ym8uvX10Zbfg
	65pq314BWwJ7jxDEdrLlrT1r272ysBAvslQf0HoxMAj9jt5tzVFRh6XA8G8Cfs7Rk9x1kCTm6/h
	UFHRLnb//Rr24+A/LXUJ0FEezVyPAgSMnf/UE8Yq7tgkrtzzOZfgbs8FGPlqKLqBuJFLT1p9kBS
	qSc/L5EWigptFRMXk6QT8wDQmZdT+Of7+KFGX/BUrdlqk5BkQfr5oVoJUNr9MnifeV/ipU2AAIO
	z6v7NnW/ARyy+atWTSi1xwvKD59wlHWs832g/ctfOM00yV11/po2j8uqvdhrH3SSTca7qoGBJ9l
	o2EElHRSzMQJCwdm3o
X-Received: by 2002:a05:600c:1d8c:b0:47b:deb9:f8a with SMTP id 5b1f17b1804b1-48069c7c4eemr58122425e9.30.1769594056369;
        Wed, 28 Jan 2026 01:54:16 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1354114sm5903050f8f.42.2026.01.28.01.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:54:15 -0800 (PST)
Date: Wed, 28 Jan 2026 12:54:13 +0300
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
	netdev@vger.kernel.org, linaro-s32@linaro.org
Subject: [PATCH v5 3/3] dts: s32g: Add GPR syscon region
Message-ID: <1fbfa51de753039f132edc2554c41667e00c0176.1769592679.git.dan.carpenter@linaro.org>
References: <cover.1769592679.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1769592679.git.dan.carpenter@linaro.org>

Add the GPR syscon region for the s32 chipset.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v5: no change
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

