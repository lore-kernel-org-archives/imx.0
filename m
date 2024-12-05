Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47701FA152
	for <imx@lists.linux.dev>; Thu,  5 Dec 2024 11:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733397612; cv=none; b=As1A6z4G5ckVrHhlycXqvlQkLSueUPJtHke5FEcsqiJP5aL3jFrQFDVjEP6R0VsxqT1bOMeSjMWdA54smuKW0a3Pcrc6TQiRNoEqEr+uTe6pQpfcG7nbaRXkBLmttH6yf2r7ko1moGEZ7q9we7hXlDU4auyYprreParh2G7hZkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733397612; c=relaxed/simple;
	bh=esezWmna9GVq9r7yCdcGJZGlaSCNF6WPrEuO3eSEza8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rGHVyKK1d/yV8kB8FzkrFujV4xYC2GC6u8PGlBS2BJKtJVYCcwSWjEL6lyDHncGSR/GiDRR2rZCJTlMUEVzgYWPxG5l69lJiEeitOXNhho2D2lzPeQTOpK/fJ73fU9PpKyFBEUKDf+TQ2loymL22PM1mswhYalRNDVcjgFZm4x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=OrqWtCYH; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="OrqWtCYH"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53e274f149fso389673e87.1
        for <imx@lists.linux.dev>; Thu, 05 Dec 2024 03:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397609; x=1734002409; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biWMPay2nyJxiRsIuM7kfYUrVvGohPt2+JFfoRTvr08=;
        b=OrqWtCYHrrbBhlp8MQJwm6Q6kfOh7RVCPHuKwXtRQH/NyMDThKJ38A3nkTdt9ytKJX
         GuG/tLC18DYaNwZCvqu2/LM9xN8lsln42FBhn+FhByW5RF5UieIo9OHv5pJb3k5lPWoH
         pZptjwpD2slAjpsxXdXobdggc4vcSC3O13UJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397609; x=1734002409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=biWMPay2nyJxiRsIuM7kfYUrVvGohPt2+JFfoRTvr08=;
        b=GLCwXLl1d+cyP0pQlJveNPCdd/JuHyBk4Cy9eJb+sVMUc45nt49NESddOhQx86oYqY
         0h47otbDil7J1weDQDaRo1Q/uG4g87AOLySJWR3Hl4S5q5hN8VaYDinLIpSJ6olk3quP
         h6q47mgxqvoA4GTFyOzPGR+qD2vF/uA1JxiFhsPyz5K4rW7oxmMjsdF8xtuD72/EFLd2
         GiG0g0xkRsd0QjHLiF4SkS90NzjdDcdUMLl2CcHTQT0L7Xy3HdsPXrDSH3JklieCVj9/
         DtEojW0d4lMxJDwwPLLlWk0vcLGOHBGJ+PdmJfoLNrcaAVe27DiE/qFxpaffmWGxtDeN
         QlnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2lTe1gTL46hSo7WZBpBkohoLLoFBEyOInxo+APQXkGn4+M1pxAIkdMJZoygABAEZmITE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkI7alN/YHpAE8iOIzV0lakRPQDKDtunxm7YCIIgBPk293iEzs
	Na6RedL/2MWWHbvHXbu5jQwKvrI4jF75lLTqhr+y6ekM88WZMXVMrV5Yjez0Xe8=
X-Gm-Gg: ASbGncuKNsyhkFBZlZXlD1F1+Cnym0EkHorMzrPuPPgZfpNo3MCxFZVL+N6N34tTtuz
	ClJxg60Rg0AxSSPCqfgy5fqARVH8CCQzerbYs6/FIThBSuWA+G/HvBXWcLV0Yx2b99yhceCXWd5
	1wjD/GfMn2UlEr7gdt89lLsER0AjbKkETdx6l7I/sBl7qJgG1H+FMzASNqknq3MMBdmErlqFoL7
	rFEwX7r6JZd4dHKsC66yMjAGlwl7TpcWRNoNLSp3QPUUbgNOO3T3w3QCF5/QoUBi1VyYRfwaE4V
	IhY6yZo50FT0bcDg+I46pOsF4HzFYWAOOZq1QCz2SGXFtg==
X-Google-Smtp-Source: AGHT+IEWp4UoDnwBUpXtmDUlrG4M6Gl9Nup3DKpNDi+ZT2s/ZJqbnUNyO4bcuE37hxKCpJ5erMuTvA==
X-Received: by 2002:a05:6512:b14:b0:53d:edf6:c560 with SMTP id 2adb3069b0e04-53e12a05948mr6199533e87.29.1733397608945;
        Thu, 05 Dec 2024 03:20:08 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:20:07 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 18/20] arm64: dts: imx8mp: add PLLs to clock controller module (ccm)
Date: Thu,  5 Dec 2024 12:17:53 +0100
Message-ID: <20241205111939.1796244-19-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the PLLs generated by anatop to the clock list of the Clock
Controller Module (CCM) node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 0b928e173f29..861bd4f4dced 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -751,9 +751,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MP_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MP_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MP_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MP_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				assigned-clocks = <&clk IMX8MP_CLK_A53_SRC>,
 						  <&clk IMX8MP_CLK_A53_CORE>,
 						  <&clk IMX8MP_CLK_NOC>,
-- 
2.43.0

