Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACBC13635E
	for <imx@lists.linux.dev>; Thu, 12 Jun 2025 00:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749688776; cv=none; b=oDS9TUouUyeofI+BNEW7YbmZBLei0hOpBOnTkn24KEsahvDzkartmG6vvmm39jpq11h0QjyEWteEO+1RJnU9OHNJEc0OyoT7fklLDeceHXoJpTLnw0dy8544mc95qk6Hz0IgRTBCfffqyg1CgazdbAGxZN9R+ceMXJAbpzal8x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749688776; c=relaxed/simple;
	bh=9qiaGT5spkiZqJJJHPCBqPrhM9VOU1z/Z2IVaS4z1Vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MwFHsRIeinygsH4liN5UODWgN2ANjXtpnoVzWzfEugwND1vE4v4YKPHYevWWip9kW7HaHjuq47QTpPwEfCRqYRg9inShzBH0X7aRti1WvVCFdbQWMZ0IZo5koEyvlAZF1cPBEBU4AAPYZ8palUmyTSHrRYmdTzIq8SbLpbA7JMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YvHWZs62; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YvHWZs62"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d09ab17244so42417785a.0
        for <imx@lists.linux.dev>; Wed, 11 Jun 2025 17:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749688774; x=1750293574; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyLSDtp3/79+REpFtOfivoiwhQtWS2WlyGvRoudAipo=;
        b=YvHWZs62gNGosKE3ilSx/qRye1M7+BzUHWTWi6qWJj6lvJgkDSMNRS6DoUWG9PEMff
         FxhW9spC5eEj/it0JaKKyl3jD33oaQ/KJ548TkzILNoDSj/35ss0horHqjl8glgI25IA
         fv/gcsypQa0AH4JPdMoBAfN5IN6m+hoQcf7+KMrs2FObCe/3+CrPkJ5+KiZ/m/J3LXZC
         +ogf41GtG0kdtqvc3cKYYoy7z9zRI+HI0BwnE9w5tXYm75cLRxGKIJ9W4hKSA3RCzgrm
         ajnORB7/XyI3S3T+ZJgA0+KJR9qbTdG6IvxJqKIFlUGW2YDkHfWCMB51i/GP3LS/enyF
         h4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749688774; x=1750293574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VyLSDtp3/79+REpFtOfivoiwhQtWS2WlyGvRoudAipo=;
        b=RU3MoqRO3NkygEoqIIB72sm/pWEzTlh4DCbuMsQX9yL0sZeMkf+4M0hjomtJN/N7XT
         kVR4+KOUguACsE0eV0aQrAHU2oYgPfBJwyG7M1n5yDPW1/HaBs70xHjR8hUbDxzQoghs
         ae8ZShpwFbvGYJeIxYN9iYblZ8bm95N0GZyuZPrTacmAB1vOfIaAaQKbMxzWGDvhEThK
         zWaK7LPJGmuE7ryKbjylA6rly/k2TGkbp6nXYaii4kKPIaUc9qAbyWZp11I/Dl77k99s
         klK1c16YIZtbFpPvEzE8nC6egCd8wMINC+W+mYO/uCS46g20m1ZpKC1+EEhoyEvSqK4T
         jITQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2ObhukPIylTeM/wmHHFinOk5x0B8mDvWIt45SNy5GHIHyIPhFPInIhR0EfHyvR3LVRhY=@lists.linux.dev
X-Gm-Message-State: AOJu0YztRLTsB94PLrPC+IijqzYl/8FJGjk6vr/AMhYO56Y0a5CcAtfA
	NEQelFze99cFUQCmHsLtIWlRBwoWfCpchM8CvVdsy3yiAwdDdxlJeKDX
X-Gm-Gg: ASbGncunVLoAKIKjINkmJqWmh/wg4GK7dTix5Ul4OEsZM9R8ZruQ9zc3k+v9r4VlrsH
	18FQ/j1R5M5lri1e5yiOo+q+ajgOLfb/nwHywcm8KO7y6CAh7PHjOu+8b6s/lgob7snxHzNpwxD
	htBRP1/NPbmS4jcxT1KdiMEiCRFidJLoPxYPiD7KY/rs9vCiJIPtRSbV5+wf5BRz/mEXv6f4E+t
	euJJKW7X0RJmQoLhOXgXPrborzse3Vsaka9+livmnnM4UlEnF1mrCJliPp/qMlCjml28lgNXAvV
	P+X7g+OQOu7dTBUXNCAieeuoFvb99T687vYq6k6/FkL4tphGqjIzSgfcTUqsA9K0vWBkV2HiDR/
	y4IVrqg/y87fzHoidAPmoLmGAn2OtdtWWeEYg
X-Google-Smtp-Source: AGHT+IG1wkiN8hZKQxPPHMcYnO6q68DrpDvat0v3sRECZKC1dxLK1aUfI6nU+MNWxjZ/Pnf7eAsbVg==
X-Received: by 2002:a05:620a:450e:b0:7c0:b523:e1b6 with SMTP id af79cd13be357-7d3b2a0001dmr241481285a.11.1749688773986;
        Wed, 11 Jun 2025 17:39:33 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b528c300sm35935485a.101.2025.06.11.17.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 17:39:33 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	m.felsch@pengutronix.de,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 4/4] arm64: dts: imx8mp: Configure VPU clocks for overdrive
Date: Wed, 11 Jun 2025 19:39:22 -0500
Message-ID: <20250612003924.178251-5-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250612003924.178251-1-aford173@gmail.com>
References: <20250612003924.178251-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The defaults for this SoC are configured for overdrive mode, but
the VPU clocks are currently configured for nominal mode.
Increase VPU_G1_CLK_ROOT to 800MHZ from 600MHz,
Increase VPU_G2_CLK_ROOT to 700MHZ from 500MHz, and
Increase VPU_BUS_CLK_ROOT to 800MHz from 600MHz.

This requires adjusting the clock parents. Since there is already
800MHz clock references, move the VPU_BUS and G1 clocks to it.
This frees up the VPU_PLL to be configured at 700MHz to run
the G2 clock at 700MHz.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Move VPU_PLL assignment into the G2 node, since it's only needed
     for it.

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 909555a5da4b..8884b3fe5e60 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2256,8 +2256,8 @@ vpu_g1: video-codec@38300000 {
 			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk IMX8MP_CLK_VPU_G1_ROOT>;
 			assigned-clocks = <&clk IMX8MP_CLK_VPU_G1>;
-			assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
-			assigned-clock-rates = <600000000>;
+			assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>;
+			assigned-clock-rates = <800000000>;
 			power-domains = <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_G1>;
 		};
 
@@ -2266,9 +2266,9 @@ vpu_g2: video-codec@38310000 {
 			reg = <0x38310000 0x10000>;
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk IMX8MP_CLK_VPU_G2_ROOT>;
-			assigned-clocks = <&clk IMX8MP_CLK_VPU_G2>;
-			assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
-			assigned-clock-rates = <500000000>;
+			assigned-clocks = <&clk IMX8MP_CLK_VPU_G2>, <&clk IMX8MP_VPU_PLL_OUT>;
+			assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
+			assigned-clock-rates = <700000000>, <700000000>;
 			power-domains = <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_G2>;
 		};
 
@@ -2283,9 +2283,9 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
 				 <&clk IMX8MP_CLK_VPU_G2_ROOT>,
 				 <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
 			clock-names = "g1", "g2", "vc8000e";
-			assigned-clocks = <&clk IMX8MP_VPU_PLL>, <&clk IMX8MP_CLK_VPU_BUS>;
-			assigned-clock-parents = <0>, <&clk IMX8MP_VPU_PLL_OUT>;
-			assigned-clock-rates = <600000000>, <600000000>;
+			assigned-clocks = <&clk IMX8MP_CLK_VPU_BUS>;
+			assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>;
+			assigned-clock-rates = <800000000>;
 			interconnects = <&noc IMX8MP_ICM_VPU_G1 &noc IMX8MP_ICN_VIDEO>,
 					<&noc IMX8MP_ICM_VPU_G2 &noc IMX8MP_ICN_VIDEO>,
 					<&noc IMX8MP_ICM_VPU_H1 &noc IMX8MP_ICN_VIDEO>;
-- 
2.48.1

