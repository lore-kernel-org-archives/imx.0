Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBDB38D6A4
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 09:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774432243; cv=none; b=ozx7ztUoBVJzvTst7TaM6QdG5CCODA24N363st7wfjN+/roYefHyqnyGpnscrxIrEuTGRvkjrf1omFPMoBQFlVBECiBunbBFaFooInM8PzUR8Z6bamMcp/YBzevVkGXCfUATgEhcx8AryV/d4+GoPZ4+xSWnkBGql59iUVNnDR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774432243; c=relaxed/simple;
	bh=7S2TtGy+pFB82DMt7G19YnjCGJ08Au8tH8VwrKarfG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WNLogPIgjeNqhp+koMw4w4MiXGFvKEJkTY2+LjX+QVmJi+KgIJFgIlmMBfPqh+heLBdU1MBZxqXSqUzWmNxIN3zCuQVa4ZiCMQwdJx/MDIyalOLQSIn3rCDqWuK8PaEpqTRZJyb/aXRoLw1F1gTKgVa8BVT21S2q3oFZXFwbzsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPKn/S1o; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPKn/S1o"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso21640765e9.3
        for <imx@lists.linux.dev>; Wed, 25 Mar 2026 02:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774432239; x=1775037039; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPBXxnt46yKYRfcxb6dOkKkkhDI9ZyG+pcJC//3JKGU=;
        b=gPKn/S1o+uS9czav9M7udH7SEbnGn1sUAW80mBZ9wNCAySDb58QQ1GGkKcXxTDcSbv
         RIBfXffExpCXUJZw7GcjXjx6p0cpo63/QKLXdNqT9ZgxwW8s6rztWLwWZFYGgQ05ySO9
         8QVNnSxeeeJ0NEldw1NE1K4DxyOzamnmgAE7hcm9mMRhkwTWF9oRxWbK55vqjPQSKkOL
         wvu0RVhIQwg4C3Ed38DDqP4M6tAcriGRYFDIF2JIzx+rzvXwZMGmsRrwmM97ZxVJ3MVk
         2oNDQxnzIy9gnJ0H3f5SqKFMTFG4YlxPt4QTc5CrccN8aHEuoOxwpbVrjgnZb+OP42J2
         6k2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774432239; x=1775037039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bPBXxnt46yKYRfcxb6dOkKkkhDI9ZyG+pcJC//3JKGU=;
        b=Ci+SlnvmGZiDKvbqI0FgwTehkAjI1xmiShec43au1M3mbI04k/lkaZZanGCLoF+HMS
         Ethfv/B1n/q76WJWFGaDaS4TwRytu/mKQWtdVWIzTknlpGLUSeIlkphuOSZy2YgH+2bd
         9vou1rEOXzhNBjOOW2pWIA6Hkefq3EMuMJZocw2LzME/ZR1g3mKs/t1oiqsQYm1YuTkz
         TAmCJ7aPAj1ukhLCVvNRkNyfV1WC6pZ8FaQ27DFQKGVMgj4WUHfsokclr0cnNoVsYCJ8
         gpH8YRzrpLBdaDZnbkybKgYU3yDzY0Jg3AbMZsAdTutRLyks03JXRz0Bei40mdSNvRmt
         S5oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhprVYXA3t91gnuZT1xokAdPoUyxpbbF+xqVUh3nXnJzD79NRDV2bGVVxRdYVq6dxy06w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/UcyNN6gdck9D+wtduML/Js+xNQWHuYiaPj0kPR9cfg8Ztslm
	lk36i8HdHTJOpuANtFB0+K5xzAj6hFpyTV0RooeN7HpSnYf2SJC/gANP
X-Gm-Gg: ATEYQzwtc3y2fxZZUSw/H7n2L9ifA8pQD5exUpNefhCBhYAqZjw1RE+siPQMj+t0QUk
	F6zoKA52vTFkCColUwJ8UxJOHbAPf8JShGakR4wm0fH++h6aApT8MpRUPkYLvsez5NhJF3E76Zk
	fPDuPoRvrAO/1R0R/dC5nSURe22t5qcQwQT6wxj0sYdSYIqscuhLfBpaM7xNiioqGMACEL1NqjL
	QO59EK2pw8nSmtlZEmZSdJgVoYY745++k3TRwf3FsMXAUeoBRelJh1jNgdRDXYXTccBa2Dsv1CP
	xNPYYLGXSHtQiKiJkkAU0lhm6aWqA+8MXUlLQVRERq7BrCI3IkIizEdszvBu1WTg3lnMTMn64DU
	n9H4X6xSTrdFZCyr0p+Lg0WuUoIT9jM3GLsniUJrYOs/wyBUvy/9lTygGrZAElfmub5oglBXBIu
	bou4juPMnsLYNUErlkO2MH7kbF8XkFH7aUZ/nYAevnnDLV5ikmzfTpVQQ9rnSqObGS++4yT/+6Y
	ajiP1eu+pIGYDlviH1+lONX8qSyS/7t2hyYs+C8gjAFgFg+qGjMjpvTyGu5EVMUjS6bRnewWg62
X-Received: by 2002:a05:600c:3b12:b0:471:700:f281 with SMTP id 5b1f17b1804b1-4871607a3c5mr45415425e9.25.1774432238789;
        Wed, 25 Mar 2026 02:50:38 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116ee57esm111397755e9.14.2026.03.25.02.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:50:38 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Wed, 25 Mar 2026 10:50:20 +0100
Subject: [PATCH 1/3] arm64: dts: freescale: imx95-toradex-smarc: Add SER2
 interface
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-mainline-update-imx95-v1-1-b5ebe976655b@toradex.com>
References: <20260325-mainline-update-imx95-v1-0-b5ebe976655b@toradex.com>
In-Reply-To: <20260325-mainline-update-imx95-v1-0-b5ebe976655b@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.14.3

From: Franz Schnyder <franz.schnyder@toradex.com>

The Toradex SMARC iMX95 has four exposed serial interfaces, one of these
is SER2, which supports RTS/CTS.

Add UART support for SMARC SER2.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 .../arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts |  5 +++++
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi   | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
index 5b05f256fd52..7437e523ff63 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
@@ -210,6 +210,11 @@ &lpuart3 {
 	status = "okay";
 };
 
+/* SMARC SER2 */
+&lpuart6 {
+	status = "okay";
+};
+
 /* SMARC MDIO, shared between all ethernet ports */
 &netc_emdio {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 7a73958f6eec..1d369983cf7d 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -22,6 +22,7 @@ aliases {
 		rtc1 = &scmi_bbm;
 		serial0 = &lpuart2;
 		serial1 = &lpuart1;
+		serial2 = &lpuart6;
 		serial3 = &lpuart3;
 	};
 
@@ -615,6 +616,13 @@ &lpuart3 {
 	pinctrl-0 = <&pinctrl_uart3>;
 };
 
+/* SMARC SER2 */
+&lpuart6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart6>;
+	uart-has-rtscts;
+};
+
 &mu7 {
 	status = "okay";
 };
@@ -1105,6 +1113,14 @@ pinctrl_uart3: uart3grp {
 			   <IMX95_PAD_GPIO_IO15__LPUART3_RX	0x31e>; /* SMARC P141 - SER3_RX */
 	};
 
+	/* SMARC SER2 */
+	pinctrl_uart6: uart6grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO34__LPUART6_CTS_B	0x31e>, /* SMARC P139 - SER2_CTS# */
+			   <IMX95_PAD_GPIO_IO07__LPUART6_RTS_B	0x31e>, /* SMARC P138 - SER2_RTS# */
+			   <IMX95_PAD_GPIO_IO05__LPUART6_RX	0x31e>, /* SMARC P137 - SER2_RX   */
+			   <IMX95_PAD_GPIO_IO04__LPUART6_TX	0x31e>; /* SMARC P136 - SER2_TX   */
+	};
+
 	/* On-module eMMC */
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <IMX95_PAD_SD1_CLK__USDHC1_CLK	0x158e>, /* SD1_CLK    */

-- 
2.43.0

