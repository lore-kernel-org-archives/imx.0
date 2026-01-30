Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D4021257F
	for <imx@lists.linux.dev>; Fri, 30 Jan 2026 13:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769779199; cv=none; b=I+c+gxvdDsr5YRF/AdExjBigTCDQLXo6UaP1rrcBtMqOxSUCVyYTAEv+S+MQIK6Qt9XXa3aUMWfQYx9sXvQoYVl/O7UzZ/qMOqjZih93DTx+kJsIt5n85Yc/UA3TS0X8GNbAbvvjDwoViib6D46rymxkYDe8H72WnnSN/o45TuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769779199; c=relaxed/simple;
	bh=lyq2+FgR/1ySLRVYYvLqN0e5dDkbuV/hAjk2MnK+D1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Szx4JLKCXaIDiMXRhvp2SaunvQNAWLCmWd1JFqLWZ2oplqcNWq0SQbkh2pYRYBzaP0Si5ACb9+dTn1f+JMAVdBHTCOyi4hraMvSff+SoP27MAywHlvzPt/ePR5IUNZsf0iIWozMDLlTDl+95SE2P0P2rdXRux6j2wW1EPP/xIac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dCG9B2mb; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dCG9B2mb"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4805ef35864so18108535e9.0
        for <imx@lists.linux.dev>; Fri, 30 Jan 2026 05:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769779196; x=1770383996; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7iqxSFKMNDlzFewoVPAW0lYx5PILeCQdoigY8yMUaRo=;
        b=dCG9B2mbV831e/+PSFqNAS3rcFam199KoULNeIGzPSAAZUy944DjwAoO6oUv5zUeo0
         9bqfVylctug2QqkldpyboNLNwWk6p3Cu+pkemsjcQMSarpYFIZyP/WDcF8MIcT7iyUhT
         6VgCnY364mYL6h9hhJImXPW2cmw+WpsHJeHxXIXC6CR9n0J3/euxIwJEVPckn3M11/bs
         cBmXoCSzzYuYulpGqw+NEC81dTFF61k6P3RQrzjvnHFnhSgoyOHXI6ayQCqgXyd1S8BL
         tIkTvD6/KnrUdy0bkmd5L1S3VkGSI+6IfnJwuUSoPP7PXF9hJlfNchADPAHFtUofez4z
         xRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769779196; x=1770383996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7iqxSFKMNDlzFewoVPAW0lYx5PILeCQdoigY8yMUaRo=;
        b=NrSsgcfDg0KUcHweBZwcy/l/Q/slnY6hu2+thlKyLzdb3g+oMzGTJB4tOBPMS53uIn
         SXoGOrfjQhznFDHJ8NUq1wTSgpY7eE61rU2YoH/+0ktTVAhqDaAlZg3LAk96mLJFfJo/
         23qBb9S3knKxvHnqcYOxtAhR07Nxx25NNfMq/MYSnSKFjU1w1XyDfNFurruVBmr9Xn3l
         DmJxfweYxjpJBXwBbMabvvS929A75HNrSa5ZASIh0amP34+8UrJPuUIX/3DTVI/cGlrC
         dt/Yd8tTe5HD9kw+QpYE4ww05gVHMDfjf1ghl8fFTCcKrK+03PeVOczJLHH8TB1YnXEc
         lRIA==
X-Forwarded-Encrypted: i=1; AJvYcCWLEqjbOP8rJj+yO2JSXZgonbvMgfDwZ/umippGHYK7QI6/IGIe0eeGJTi+Ge41eoDANV0=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywe3LBXd4W27CXmFAxyY3N9CCscY0yP3OFV5xLxgOOwsX90D8fP
	JVR/OTPxP8+phyGWIzwxjkmUiAQPkKRsHkyH9JknwTyNzs+cmt1pBqYodB4+jN3e0R4=
X-Gm-Gg: AZuq6aIQmiMhlfouKrne4CetCpUx2xLTCNmyTo9//mhtGi0eGshxQbQxJifYIIXQNVi
	INoQxObgjBS5ioCZyBxrdmBBAYJPaWvT2yt1vGHV+JpFLnKXv+94owacvCQWrFwyCLrp7oSABox
	V+HO8YR59ztrEiqLwyplVEayWRvHnfDX/q2158Bq0WDIG4ihUVdXk5rcZi2u5mPd9lHt8z9YeB9
	rlk4ydG2D0WDLYNCA3EyuD5ROru6qenmDkVRlSvUPrbyHKA4wdIMFijDHBrlx202K8y1DOedqKQ
	E+crJ0xlCVdwnJkh4tfeINWi4UtfKnIujLunqajIV4xMsgltp0b7XxZtpEFIAyn8YUy3Y03o4dW
	wUHG3mb6KPtU4zw4PZtjWrLMDNGfpDrIfkxgQcIxmRPs+t045tvOsOryW/wt/Wv7pIq4T8X2eba
	FahUHbG5XtyXFk0qs9
X-Received: by 2002:a05:600c:1f8e:b0:480:1e8f:d15f with SMTP id 5b1f17b1804b1-482db447b14mr34825915e9.2.1769779196189;
        Fri, 30 Jan 2026 05:19:56 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132303fsm22863188f8f.36.2026.01.30.05.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 05:19:55 -0800 (PST)
Date: Fri, 30 Jan 2026 16:19:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org, netdev@vger.kernel.org
Subject: [PATCH v6 3/3] dts: s32g: Add GPR syscon region
Message-ID: <0e922537c02d1c47734142090f98eb78e921ed34.1769764941.git.dan.carpenter@linaro.org>
References: <cover.1769764941.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1769764941.git.dan.carpenter@linaro.org>

Add the GPR syscon region for the s32 chipset.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v6: no change
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

