Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B56324B2E
	for <imx@lists.linux.dev>; Mon, 15 Dec 2025 14:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765809731; cv=none; b=R+MwPbmdquhpEoWHEUNeDmRwon80U4wQ5bfUbT4EEI+y6Cct3y6BoX+NVBz4dLuaIVjBcGsGD95TVaX05/wgvRRjNsvFo5S+6UWypjp+jrBeZkDHyeVUyzIZgzKSpFGSc6T71aKzxBjJjsn9lTWoqUf45rDGMSMDwEQPL3EdMOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765809731; c=relaxed/simple;
	bh=fzlFhwopirZORrgk7MsTKTjo2RuJSeOm4hSvpGQNSbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=agKDOROYzjS2BqG6/8v6ouFmGGUNgodp8XqyJmd9yIfB+XZ99av1/LDqb+otKK2oDRqkAOGwgKA72ooHHKFvNsZ6YGcF1M5kGeXOFbrIj/9rDf4PcBXBiOLit5d3EbLSMqq93LIZzJIrdLnwzLB5+bnVZyjOVWZyxprE8WOr6Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tGES+Tom; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tGES+Tom"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-430f5ecaa08so770407f8f.3
        for <imx@lists.linux.dev>; Mon, 15 Dec 2025 06:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765809726; x=1766414526; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xiDNjJReuH+sQcPwA2otPS6JuC4RYSH/oTmgctrVOF8=;
        b=tGES+Tom0JivyGWLvhKejNnmVx1AncjTse+gTAHLQ8dVMEpW8N3YtvtVRxdbfcZoRz
         LqbwI1TVhNQmm1hh5RALhDk3Pv6KyCfzG/WBGGy3cSi524Qv/M7YNwRxKDmic+oozJpQ
         Wor039XbsTTrHY725CyWi/o7C2hKuVcRJCpwdMZ7RkvAtblm3wRBUCWIOwhP+3uPwTm6
         5ZoJd2Z3e14anWo4ztE1XtJy0Y6vpeTXR/w1QhU6ZDvv9mYXhlPLuspxtQCJiAGYARyi
         EcDviY3B03oPvAl7aSQDmKh90nepp7ih0D5E9s5Zo+GHy4jWOYFcOKAZ2w56NWCnSr0T
         xbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765809726; x=1766414526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xiDNjJReuH+sQcPwA2otPS6JuC4RYSH/oTmgctrVOF8=;
        b=EsIgseU0d9ErebxdWTvYkgooWcy3LqK0PPdXeJZ6z4s9jScu6k4LfHIp216lpcNYNw
         ujsLIQyADVx/OawxY7wog4wo3XMOL1KM3y8xrQ2JQ3vFCvIvKl7aNKKcCRChmHWSuzcS
         +eqMVil+k6kjY6+ecYs5Sa7bYhH/0V2jX/H5NBT7KquuqmKVJbSxTnb5jhSusEx4Djtr
         LNZpolUE0qU3neB6QPQSKQbxdOGgAMdFyJ9IMhGwykdY5snom2+DZCns5QjuZ/zmdVHa
         JabljWntk5GQV/DoL67QgWtDOTx4XXZWxMNzMa79BQr5T7iVNJMP7+t62oOJ1eTyzJ4t
         +Z/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/jMm4MDVeGBMLS4DffPSvyBo1xvsP6aXDQz7/FsBricJWLPRWaAXsvxR3MaphBLLZT1o=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQhiFx/QSPSrGWsJNi8jygGqrxlnNr+eqpwIrjqE8Op0tMjdrz
	trv48YUEAxe2dHVBrAC8O5tM+wASgRxQ3OQbIdGkYgLavIKH1wZIU90IH1pbYxt08Ok=
X-Gm-Gg: AY/fxX4W9ns5kmB4AiDidXPP2FMunmrk+eWBBH0tNO/SJta6zMKz1p37XzLsXWbKTzl
	R/slv2B+K6/VnKpprAE3A4dBfWI822f38enz4HKKVL0gFpP2Qs2krLVb5XC/AKHCTM5OjOkdrRs
	mIl/SPY4yMWXVJDCKyQOVpmFNc5JIaTnVv6wWo8/dx5dqOsqYLBxyZ/hrsG1o5VBkESl8aPnzzQ
	cEc5pimGj1BuYhD23sNiuGPRS2uWzwYKY8LHmsWTQZkG6ZNZew9EUslRB9sRlFCakZY5RHfrh5n
	lwa2S6lqmeN97DYTXZQtWQEFo2NLNhmGHoOEuug/f28aleJ/r9jR+2u2HAqeLrv5eIjisPx4HAA
	NA6F6xGfNA8dArb8zjWOr6ItEM8AacriDfEYAmqEqd5MAfp9ddrzMdu57ivNj6XDerdflyAJRFq
	1lMQAo4aHWUX6jjZwV
X-Google-Smtp-Source: AGHT+IG8c3SGHRSscuhUyyGSsZusN01T0eo9ZxX9zQGjydj3gQVdrRgDNwh4QNxdusEz1PCq34CxnQ==
X-Received: by 2002:a05:6000:18a9:b0:430:f463:b6b4 with SMTP id ffacd0b85a97d-430f472faedmr8436759f8f.50.1765809725859;
        Mon, 15 Dec 2025 06:42:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8b9b26fsm32113105f8f.40.2025.12.15.06.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 06:42:05 -0800 (PST)
Date: Mon, 15 Dec 2025 17:42:02 +0300
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
	linaro-s32@linaro.org
Subject: [PATCH v2 4/4] dts: s32g: Add GPR syscon region
Message-ID: <990c6317baca68b1ec0391eba3b66f511d75710c.1765806521.git.dan.carpenter@linaro.org>
References: <cover.1765806521.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1765806521.git.dan.carpenter@linaro.org>

Add the GPR syscon region for the s32 chipset.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
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
index eff7673e7f34..71ee1c043d03 100644
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

