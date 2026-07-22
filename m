Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E396935A933
	for <imx@lists.linux.dev>; Wed, 22 Jul 2026 10:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784716929; cv=none; b=P6oRD9h/TOv5fEwrp7c9sfo+vJsSRFDz+u2SlR2SLazWKCbZ/sTZW5KfbK+iFRI8k/jqEOpEu6ArKZqWOGMZQQhyvlFUfyqY5KJWMf/5g6zt7ueK4L6mg+jixR5QlliSEM192eKxJt9vGwpKHD6zwdQlyAPMBTIhgT64DbUCK60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784716929; c=relaxed/simple;
	bh=QyBt+OTg/8NLfd7Ea1cQ1cz5tIlRNed4uskEPHLjqDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jxtl+97Sh2ZCiGOgizLmBEaGNByGaUJie+V6eTpM8e15gEBvBIHxSJr09iojIaYEh/1BF/XhnjgpaeXa6AiyO35aTB+CFePLTZofQiM3hJ09fOwxuyIi0U9i4Oc8S/RzXZBgx3PSdJjSKQ8WHzqUCNPXjozpLa2hTkPhOPy9fsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0TaY+1a; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0TaY+1a"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49547fc63a0so27296405e9.2
        for <imx@lists.linux.dev>; Wed, 22 Jul 2026 03:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784716926; x=1785321726; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EU/+Qn2XRS4DDn4lGHvzZzxZVrDtGY5ngYyeG3iNo5M=;
        b=a0TaY+1ah57b5/XupCwp+RI/LOnlNOZuDzojGEolO/Xdb5I3A3sySVLC4wDV8ns8Jw
         szvcjqJQOz6BA8lZTCPi358uqRWXcfT10ENru/hjAXvT8oztZh6ZnJDjtkCeWiJJy8u3
         zPHmnA3CmD4zP3eyCC3njqeYbCFFBkln8Vx2YAc1YPzFUs2e41wR7ZgbUEOrA5vqTwsN
         LAvmRxYzoiYp+iDvyWxfjnZBxe8q2XBE8Q8+q0X1b9qOw9GvXLhH1SKHWvzOZKZe188V
         05YfiIZCJH5qVPp/MeiGX8ncAoAvi/k1qjfdtvbwhyF10L14peDxDMbLg21NgHEt5VBe
         6uPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784716926; x=1785321726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EU/+Qn2XRS4DDn4lGHvzZzxZVrDtGY5ngYyeG3iNo5M=;
        b=rZixrP+v8a5Vd4aOWgMnYbyiys/B2q5Mt2noH0IGXDXsWTsSMbs+luumD2fTUn28pA
         RHby2mjw0zFM3W3/05+soXf+LY7EdOEfaAgdaDPLF0jWwHfZm3/niPKYCV2BL3wn7JVK
         HkXKg2I9lCFewReNMF7FRQmwYPOwB6aWIAnqE8Tb24jvqq1tf17gjzVEIeVqoWf4I6De
         /qw+AHfJITO5pkTnA89dVfbBvumlVIeeJMM3v8OnzE7vkv6HovKTdzhyw2LSG1dzL8b2
         qk0eRnM5r/Jw/YI3G9VfM2ICOU/GxvxaV4mv+8IRAALtAFlAKbhl3MtSD1M8KwZTLBk+
         /eog==
X-Forwarded-Encrypted: i=1; AHgh+RqYe5JPJcHU6HRi9XC57Yx/6Q1+OMHkrLxAAGkkfRstYQ1eUMApbWdQSNp1X404QutpW04=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyq9Y0ze1krYzKIqXaLFXdgIT3/QMWa6XGSFiOx6DoeGaGfI44p
	IpjQns/VRUcHnTQJ8EiVSrj/WraTHTaNoh1gx+LwilDQKxrV7MVTBsbD
X-Gm-Gg: AR+sD11ajqS8yhqxqqB7x0hPNjPmom/v0mZH1Pk5YnJeLyofwk/hrQpxnwmGCHYanCW
	hX4bw6/lgZLPETCoy3EjOH7+gjrHRTob4vNR0Yh1sBDCbjTbwlKz16VeezYEDP7vg9GoXZd+g8r
	WOsCIvdjAjC9HogQYJ8otoRLKsnlwLdmKaaa2QJy2UNNJfcJ6dEKbpZhDLjVeJgZVYT+cOAILXY
	5OT0giZ7PWqy8jIicb+T/awhXbyZQP+B7NvDFcO0ulEaudYkbpSC1RJiFcz44nz9u9pof5UGdQ5
	VbIeZR/Ge/nNRucfTeCSWuxD77puE81dZbXK4xM1wW9VtOk7XYw+6IJ9bCLm125n+xuoMw23LuM
	bFIdnvz+fk49OId0U5DE548wjgEbKSEGGEaPOgEaZL38dO0opxWO05+1EFRZ5OaC47gDLkmqpQG
	w2dNiQgTBkDXfuYRJmLT7BeSzPfEg4KVlfBzT8set2R7DhCEVWAif+ZI87SC+ftYZt2uWpmx+wT
	98gxtZDmU8pb3U=
X-Received: by 2002:a05:600c:5490:b0:495:6130:7805 with SMTP id 5b1f17b1804b1-49561307a51mr114097015e9.14.1784716925698;
        Wed, 22 Jul 2026 03:42:05 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c98ebsm126602615e9.13.2026.07.22.03.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:42:05 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 1/1] arm64: dts: imx8qm-ss-dma: add LPUART4
Date: Wed, 22 Jul 2026 12:42:00 +0200
Message-ID: <20260722104200.17729-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the missing LPUART4 node to the i.MX8QM DMA subsystem description.

The peripheral is present in the SoC and its LPCG clock controller is
already described, but the UART device node is currently missing.
Describe its registers, interrupt, clocks, power domain and eDMA
channels based on the NXP downstream device tree.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
index 974e193f8dcb..25c5e4423163 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
@@ -8,6 +8,22 @@
 /delete-node/ &adma_pwm_lpcg;
 
 &dma_subsys {
+	lpuart4: serial@5a0a0000 {
+		compatible = "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
+		reg = <0x5a0a0000 0x1000>;
+		interrupts = <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-parent = <&gic>;
+		clocks = <&uart4_lpcg 1>, <&uart4_lpcg 0>;
+		clock-names = "ipg", "baud";
+		assigned-clocks = <&clk IMX_SC_R_UART_4 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <80000000>;
+		power-domains = <&pd IMX_SC_R_UART_4>;
+		dma-names = "rx","tx";
+		dmas = <&edma2 20 0 1>,
+		       <&edma2 21 0 0>;
+		status = "disabled";
+	};
+
 	uart4_lpcg: clock-controller@5a4a0000 {
 		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5a4a0000 0x10000>;
-- 
2.47.3

