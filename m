Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB5C431484
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 09:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330517; cv=none; b=an/9coeUn4s0hag36W2J7mwfzQiozFAVMvBFm3klZJbRyalvUkPbU9wIDCq6lgOeBt6bnGRzI225+o4Legf56WEFi7BEoIlZGYUvH9niwk4YAn2xKjfiF59xaAyxgmSP40nc4Zx/69aJhlCV/9/mSWPUjqQZ4FEnCi+CGjMHSCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330517; c=relaxed/simple;
	bh=3O06oozCuT+TwuN2glHZbbQbB6+qN9fnq5UtKepRLIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C3W/KrkP/jt5qAGCT+Va5tbUDCWWXHk468npunGYcxvxqGkEMi1nYRJyho8bdiHNKZQTTWEsIacFw15bP2YzOx8fruMQGQVWsQAKoBdT1NJRp2q34yRKkoE2xEtF2VjnNjeQRF7tbvEvyEDdvgqhHSIw1uTjQoOcfwpMce4m4uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMPKpLKG; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMPKpLKG"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493ba701891so22061275e9.3
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 02:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330507; x=1783935307; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SrmXb78uApy7T4RFmz7aic+KLko6/J+77KD9l2EYeuo=;
        b=nMPKpLKGSOItkAWZkI66e3FIi1eBKUcN8+y36JJA2IH+SrX0Wz/0JKWQ9BfK9Um59w
         zTF8gChLzFIErA+I0WEEKBL5S5+G3xsUYzVfraB+8405h9VGGAjO4iFDfoKJtGRfR/aI
         9MutXZFci9rsVBe49XzM/jGFEa9UaTOG4AEf1189hXVzvK75BaD+kjsYvtdbVG1Ytfdf
         ZzBbFhRZO7SCT60WcTBMsvcYK8vX2STjuulrFepQX9lYvcfVC2rWWpb2o+i8EyCBE4g+
         t6/IhOFyME9ENoXJ6ubPR/eD6N4NQ0nY/JtSLzCIljtHApdv7+FHDs+KdWs8Kpnko09G
         jC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330507; x=1783935307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SrmXb78uApy7T4RFmz7aic+KLko6/J+77KD9l2EYeuo=;
        b=c5fISpQcva71YE5GhaGwrFnQwvqJJNxcAiFM8o9MLysyhW0Jj6Knmxu3doFC7WAr9c
         O+C0my1pVqv+xorbn/ynnIDsEyS0x/E7sUo7PgWZmU50jisphABnAlGtBuERi1yVqBLV
         9uWndCTJDqUHL1Y7QC7d9mZSvrmv0YR/Dt7I5nqxJsB4UDTB+ELJ0yqzFitx/j+lE1z6
         YCzzshe7fboMFouDKtoN/DsHxPMu9YQANnKtADky9ezdr0V+mRcviwiz+wwWKq+lhvrT
         qpAxf/4I8ldDnkesBjqygPSR8uI7f7vMCecTl1NsJavAe0Mf6HyxGxXp3QcYE/LeqEmw
         WvHg==
X-Forwarded-Encrypted: i=1; AHgh+Rp1M9b1RC2NfMIingjUk5SMGWwA4HplKUnKJK7zkrDrUNWBqBXnlPRg/p69pBWkQVn+VXI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwP1CWinrfjr7Y6VQnA1cCV6yvYRpuRXZDu2pu/pWKlKirNjIqy
	lczxAdhZmA3zXYmouHVLfSAyCvx34iCnA5562u1JAwRfGTO2J8w/pQF9
X-Gm-Gg: AfdE7ckPVUDgks3UNg8M2H3dSoUWjQuK9j5r5g29o5Ll4k8oDJh2vkM1+mNV3MDzsJB
	gbK7Z0klkUWbtVboGnY3b/iI6B0N5qudvzBx+fBX+xHM/9Cv/cGrVSBamtVvAaPg1UROR16c9At
	o29D+vfI/eRBIrPhkop/DPk2QdaiSbmA1VrjMquPAeZOQEINNnVTF7tdLWWQ/fev60676uAcxpJ
	jZHbiviuArfujlaFFC7B2mrGUCsc6oi+nJ4Z8UueKfJdV4tG9n/rd91jNH387qoBr92Bm4ubvJJ
	bLLuB23zepswP3M1tm3WaGKxWCQjiKeg750ZbxMQQClk4qMyOmVghl2Yb1DsvAvNKiz4wV3pt8L
	DbIcKDj3pDiyu4c0M48YoDGL6Sktp6eG55uv/WLIIywod3GQiB9/hFSDKIzlA1eFVdAEBrNPRXZ
	lSwCI4T6ZY3WNtSllD6QdkRn/aDXxRP2WhvsHjY+0Terz5SSlp7vlu0yZGSsXWHCgcb8RZTtu7x
	r2T1Z6d4uogsiamG2RVYCWfsw==
X-Received: by 2002:a05:600c:46c9:b0:490:e19b:bd99 with SMTP id 5b1f17b1804b1-493d11faa18mr95203205e9.30.1783330506886;
        Mon, 06 Jul 2026 02:35:06 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:06 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 14/15] arm64: dts: imx8mn-var-som-symphony: enable PWM1
Date: Mon,  6 Jul 2026 11:34:44 +0200
Message-ID: <e7b7b016bda85d2d3fe3e804ec868565049a3791.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable PWM1 on the Symphony carrier board and add the corresponding
pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../boot/dts/freescale/imx8mn-var-som-symphony.dts   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index ddd4651b35d7..2afb5b438b68 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -217,6 +217,12 @@ &i2c4 {
 	status = "okay";
 };
 
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm1>;
+	status = "okay";
+};
+
 /* Header */
 &uart1 {
 	pinctrl-names = "default";
@@ -310,6 +316,12 @@ MX8MN_IOMUXC_GPIO1_IO11_GPIO1_IO11	0x16
 		>;
 	};
 
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SPDIF_EXT_CLK_PWM1_OUT	0x06
+		>;
+	};
+
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			MX8MN_IOMUXC_SAI2_RXC_GPIO4_IO22	0x41
-- 
2.47.3

