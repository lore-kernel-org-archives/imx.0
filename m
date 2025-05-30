Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBB720A5F3
	for <imx@lists.linux.dev>; Fri, 30 May 2025 22:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748643451; cv=none; b=RIwzZlPyClAaHWPvmfHdjK8wA71zqiWA+vZGdxGlap5rnbKks7BuOmObH7BWk+O8tOOFz73mhgg35rzLs05yofxFE6OIUyCNHbGQtepyfpyrn8TR0eTILa5MGE+/9QcnHuLTooUmvcJvBtKCZpwOi8INZ+S6DmZ02t/izIsgwdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748643451; c=relaxed/simple;
	bh=+rOvhQd/jMBSV5uT4L5LEtK0HwicWLzbj+u/i4d3U5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y4HxQShqxsshU/nzjivkrPUQ9zVq3PeHOqUUuVOUrXe84PoIF9+kFUbT9vsauf2bt8E/Yji3VwwXgoBS/sOi9ILpH1ziozAnOBwQBWKDwPcsGiBXYFjH0GaEucLDM+fTrDLr4L4+uHwQtR5DqWz9CmT9WlCWqXmA+Z2BidMnwqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4zhppVI; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4zhppVI"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6fad8b4c927so614116d6.0
        for <imx@lists.linux.dev>; Fri, 30 May 2025 15:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748643449; x=1749248249; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89/6esdxobIB3oXPFQQO57dHmv1o6cOWK2fx905kC30=;
        b=c4zhppVID5zT/jbzTK2FX2Q+w5tQccue6EeK/sk6xSSnD3R40ilas7y9sZRZgy4+xQ
         DM373YoBX5bXG7j/ba4yS2pQPCd0H+qG7gYNSQrzRaun/tAQvnA5APW9nu0aDuP4c4Mh
         XcI1cEHKuy/lJ58Gg+xpDi19zfIbWj0nAfXDwhbDaqjGp2juvc9dohWQTN8Zi98GUtl7
         DNVyzgKmlrdYPScPCUdUYVbTfgbPkmAxvNDP7tgjbOB2UmjguB/WzftPNIUBqoHc3BMp
         HGn4iRF0t8JeSbZcLZN1nqeEIN/qiG9rUqmXuK6zil0suTvqb9jOryyM22rkTt7WeuPs
         P1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748643449; x=1749248249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89/6esdxobIB3oXPFQQO57dHmv1o6cOWK2fx905kC30=;
        b=BfOhMgvs/h0qSAG5YRghwdpH9JYwKWfihizz0msjwnUMCMcTDj/E5sH3Ang2ct4u2P
         1l5HxHfA4BV3trFir3DgOJutMQU7DB9M+S+71EpTsyQApaU8FHGMy3l9iPHy57MomGFn
         +3vKouqAxxJJ35sGbEr7p3dchB2j5O1m9rcOBEeYUFQEhr7S/XLCpVmd84bINZBnY00c
         5bwN08fvPhd+qzNwN19szva4r+gkq+gXyOzfkGXgOrwlXVQZgsPPSmVSs3tYgbBlnWPs
         kLoZz/0eC53IMfjrV30wjicoAwvvxnpX8KpoEEFe0NROI6oTsQ6xGykrY11yDo3whWa6
         2hgw==
X-Forwarded-Encrypted: i=1; AJvYcCWp4/Kxc2Mo9DdeSnpQElG86oICDRiPRBBKvU5p5nb6DHJrKntN9x4NjJ6ieoSbxw9D7tE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzt/xfPide0ltvNOKdI9KHSOg3cN6pCwhB9vvc1OJvRYg7GFzKc
	O3KNX8iEEFCZXPknjOFMc6IVh4dPHAv9p8fpEsXGX4ZK+uU96fp5vwuW
X-Gm-Gg: ASbGnct2YJguXuBuhN1Ir6FRMH80Wl6ft/OKpcXF6dAdnIaGHTIc5MzzqkyeD2V9hUj
	D88RdXtXbOORrMP+YeZX5Arej7hXaB67X+XYIWZ1l3psoj0gKlS6U1+KnDsSsjEoIG200POWI6v
	JnrKRspKGR7Wo8AJZomL320+RV9eDbkSmLjXONIy1BJyRTX92ESpibN83TYE0PZ8Mrq8P314Cwr
	i/UqQrYmsNTGJJy/p1yeqMUl/x6qMn4a+28yteQ7FcSXAF0pjrcpwSYoksCp8v0xElH7nU9Hl0l
	WwS4pj3FeY6OHX1t6PUzpNhgHU9dH1jkUPCYFjWnK//0REaJhF4hGt4YviIGE5Qw04G462q0kb5
	cIZCgD4/vRK5bkTHRnKMAG8N2Ew==
X-Google-Smtp-Source: AGHT+IH6ZsYKk6i7ecLc1HWTvwLW3YahjSaeJf60X60SsGSRpv9givwN0lV3GVO1/HEeeqSYTFYdjA==
X-Received: by 2002:ad4:574e:0:b0:6d4:19a0:202 with SMTP id 6a1803df08f44-6fad1a9d02amr63019336d6.33.1748643449174;
        Fri, 30 May 2025 15:17:29 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d4d0cesm29986866d6.35.2025.05.30.15.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 15:17:28 -0700 (PDT)
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
Subject: [PATCH 4/4] arm64: dts: imx8mp: Configure VPU clocks for overdrive
Date: Fri, 30 May 2025 17:17:11 -0500
Message-ID: <20250530221713.54804-5-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250530221713.54804-1-aford173@gmail.com>
References: <20250530221713.54804-1-aford173@gmail.com>
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
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 909555a5da4b..848b25c9b752 100644
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
 
@@ -2267,8 +2267,8 @@ vpu_g2: video-codec@38310000 {
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk IMX8MP_CLK_VPU_G2_ROOT>;
 			assigned-clocks = <&clk IMX8MP_CLK_VPU_G2>;
-			assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>;
-			assigned-clock-rates = <500000000>;
+			assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
+			assigned-clock-rates = <700000000>;
 			power-domains = <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_G2>;
 		};
 
@@ -2284,8 +2284,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
 				 <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
 			clock-names = "g1", "g2", "vc8000e";
 			assigned-clocks = <&clk IMX8MP_VPU_PLL>, <&clk IMX8MP_CLK_VPU_BUS>;
-			assigned-clock-parents = <0>, <&clk IMX8MP_VPU_PLL_OUT>;
-			assigned-clock-rates = <600000000>, <600000000>;
+			assigned-clock-parents = <0>, <&clk IMX8MP_SYS_PLL1_800M>;
+			assigned-clock-rates = <700000000>, <800000000>;
 			interconnects = <&noc IMX8MP_ICM_VPU_G1 &noc IMX8MP_ICN_VIDEO>,
 					<&noc IMX8MP_ICM_VPU_G2 &noc IMX8MP_ICN_VIDEO>,
 					<&noc IMX8MP_ICM_VPU_H1 &noc IMX8MP_ICN_VIDEO>;
-- 
2.48.1

