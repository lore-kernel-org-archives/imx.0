Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EF9156975
	for <imx@lists.linux.dev>; Tue, 27 Feb 2024 22:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709071510; cv=none; b=I+d6fXlA3Wuhaaic4A+BTpkeoY4ONU0aWycWOMxQbJz53mTGGuRHanlMN/D/2NQyC+zI1IEv6IC7y9wtLBCGeuW9QNkNc5DdF069048teBuOTw5qKqggJhvlHy59TnflLadhF7mbJ/nHos809ckY7slZn/Ox+6GDcv0PMcZwTs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709071510; c=relaxed/simple;
	bh=ELvNOGdyWujRqFlgFnplgvQfFBySmgvbj61MCodDqJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RLgS8kVckI9oayUMk4n09VouHUOvzsXS83+T6EyabEeh6TY1yLTvUv2txLpP5NU2nAIsFEDxd1isZWGjBIx+y/VTv+ALa0Fneg/0frLoM0mwyvzToazAlRz3qyiFmXn8PwRincm5ndD73AGnqbw7pHwPdPOnJMraLM74MDZoHuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mW9a8dUI; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mW9a8dUI"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3c19937913fso2786717b6e.3
        for <imx@lists.linux.dev>; Tue, 27 Feb 2024 14:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709071508; x=1709676308; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFej3XRK1im9Jtb1YXeIJeL5LA98qLbzr4AabBMlz7o=;
        b=mW9a8dUIN/p87l2rlXuVexfhR+s0PpnHo1ujJ6Xw1qN/g5w+19agMkFmF9vWvw+p84
         r+ihq4RBQ+bk7ixCLgVR2BBcMcicgrLpTxAXY6TzVWZOTjlHkBSP0Ac930MQJV3X6U+x
         yBKYKIYBpMgNBFec1BnOvl1o/ARyRcCsLfivI6oc88jNOp7HplTkH3qmaJ32PShIUX0z
         bBpjbUGeenbGzp1rXZJ/0VPh0dPJgJ+pJmVYG24HV7X79dwL9qYR1JlwRbkooG9Spa5M
         u2bve2DdNOnFeNx/B8gUX5Ew5tfJIgGKCidRU0CQkyn81zJt/d7GwxVtIm5RNo6cf6gp
         5iig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071508; x=1709676308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFej3XRK1im9Jtb1YXeIJeL5LA98qLbzr4AabBMlz7o=;
        b=XFo+/SQmOPMAENb72YaFWzuoh53XF7uAND5jbIQFKL4yA74BXKvs2DuKYCjiyVjWBI
         JNeJFj2VQad9iHO0ohPvIdW1UoCbk6ZQye/Nwaoc4HsHsv7PZ0y7drbkTepdD9DfIELp
         M1/C/qM7kuv1nlM88wm727SYW1zo8ie67bn2/IqJJFyKpSHxSzHIkYDxh7WeaH1yUULf
         2SUu2J/kIgux6HYmqw5VPV/obg6q89dk4TekfqX+gbJ5V50i5kBb5NSkILi65pyeI/Lp
         iw/u7ln+XcJofPlUAdyLhaytbmX9ITvKQ7b7mMKNTBxltCc5u345yqWoIRga02mzamVD
         jBaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZizgu0fxsLoLIiC4YmR/RrspqJkcb5qOOdPePfP+47Ln+81RdN1XSU6vg4VifWA9WoCUwdlSnC6/+h+J5nmZCL6bC
X-Gm-Message-State: AOJu0YzC/DWG1pooGeIMIP1lvk4FGUtbcWPlXnLMu1592fpXbCiGxyHX
	cGI1XDXfyPgtHpnEq5xebVjQ5al7ea32cUONnKkfmrqFXLuD1nZp
X-Google-Smtp-Source: AGHT+IGWgaFRlZ2IfQsw+GCY/j+lRL8LaS2tBzQxUKTZJT76SVV2NR6kEFyuRlrSS1jgmD6sVOd+Rw==
X-Received: by 2002:a05:6358:94a2:b0:17b:521f:b2ae with SMTP id i34-20020a05635894a200b0017b521fb2aemr15918125rwb.14.1709071508117;
        Tue, 27 Feb 2024 14:05:08 -0800 (PST)
Received: from aford-System-Version.lan ([2601:447:d002:5be:9ee3:b2ab:6ca:180d])
        by smtp.gmail.com with ESMTPSA id c12-20020a0ce14c000000b0068fc55bcf6asm4569556qvl.119.2024.02.27.14.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 14:05:07 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Cc: aford@beaconembedded.com,
	Lucas Stach <l.stach@pengutronix.de>,
	Adam Ford <aford173@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V7 4/6] arm64: dts: imx8mp: add HDMI irqsteer
Date: Tue, 27 Feb 2024 16:04:38 -0600
Message-ID: <20240227220444.77566-5-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227220444.77566-1-aford173@gmail.com>
References: <20240227220444.77566-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lucas Stach <l.stach@pengutronix.de>

The HDMI irqsteer is a secondary interrupt controller within the HDMI
subsystem that maps all HDMI peripheral IRQs into a single upstream
IRQ line.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Adam Ford <aford173@gmail.com>
Tested-by: Marek Vasut <marex@denx.de>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
V6:  No Change

V5:  Increase size to 4KB to match the ref manual

V2:  Add my (Adam) s-o-b and re-order position under AIPS4
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index c9bcb6641de7..18bfa7d9aa7f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1927,6 +1927,19 @@ hdmi_blk_ctrl: blk-ctrl@32fc0000 {
 						     "hdcp", "hrv";
 				#power-domain-cells = <1>;
 			};
+
+			irqsteer_hdmi: interrupt-controller@32fc2000 {
+				compatible = "fsl,imx-irqsteer";
+				reg = <0x32fc2000 0x1000>;
+				interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
+				#interrupt-cells = <1>;
+				fsl,channel = <1>;
+				fsl,num-irqs = <64>;
+				clocks = <&clk IMX8MP_CLK_HDMI_APB>;
+				clock-names = "ipg";
+				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_IRQSTEER>;
+			};
 		};
 
 		pcie: pcie@33800000 {
-- 
2.43.0

