Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B4548165A
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 13:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492386; cv=none; b=Qlky6DXvCDv81nlVLUl/7HTaM/SDBalZMJcLDIqSR9NryKt1ul6S08fQKnvSkb8g6WrAY0yD1F3gUtGEezaDMmvHOhfbuLZwHr2s19rF+yl966DGeISKtFR9FNa2huzRSNXayMqoOYdB433WH6xHIZIom5QvthlK4EIKWrPgo2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492386; c=relaxed/simple;
	bh=brBknWTbJeFdLrLiJEDTIRXbjSKeg4crwnjhONTnli4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RP8xHVkOqt+iLHkdop89uv/c1FTkCglkbjXofyBVw/k4Xw/9frBJxKV13FER9s3Svj7JUYpTvBv/CIkNyqg4LptytEyo4l23P79m3zI76PO4pR88B1lwsAisWuKdymxzN0YXZOYRjURMQsWoYFlWnnVPcpc+Mj5fzwHK8vCKqbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rBXTknsm; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rBXTknsm"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso4684525e9.0
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 06:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492379; x=1781097179; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XS8EXfD0I7q+hrNj9u5k8EGUHhOwOotqLP8CFPXgTJk=;
        b=rBXTknsm8i9xVD6BfOS3B+f62Se2WHxjdB/w2dxN+shSUoY8zs4WqNia9aEJ8e0TdF
         62RXa0SMlbdAJku4mrzjekObkf86N6+MJjJ9paLFmn/o8W/sAJtNsmS79RKOF2E4MmOE
         DIYOj25dVnoiPYVrcxkqENfEl7g70jpbb9OIkkbhcLpgButXa3cvTdp8esV4eua3TsAX
         pONxPB0zzmWnLy0YWc5JD6I8kI4lak2FfHCuU3aiUfYs86tEv9MXbZy0zoLoHaify/Qm
         iWh80a3/Xzv6bsE1vZcTm4aVypViO0OXClXTuh6CipABLcjHEJkdtMwBIFJhQBwOq73p
         XmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492379; x=1781097179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XS8EXfD0I7q+hrNj9u5k8EGUHhOwOotqLP8CFPXgTJk=;
        b=oAZISf23pEO/4WC0ujcw8dCr8X3Lwrq2nPutKV5b3XTDkGjRd/xajRuaX6vw1A5KFd
         m6pEDP43TCEW6zJ/M97nSUPPZYLl54KI3OvSXMq52B24tSqUT0tvq1edhVUtPTIedv3g
         3nhAeeZY1S5GrZ0nPUWqNmmuhSPAwCA7TDvHMnkIzJlolyP+CGAMgFLTdrEA+KloErEU
         GPjWyPLRcFJghzucs7BNRsoM4P6EeYi2S+FTrYpTE/7zaZUy7OApVmQAM+MoAdia/f3p
         rflC+D4EC5hCh0XrZN2R8SlCdg7NdZFMmSJ+crdEm0Yk+GxYt+Ra+EzEJi2ca00NRZuO
         roCg==
X-Forwarded-Encrypted: i=1; AFNElJ/Vo5oU4jtQdA9I1hupjAyhtDLR1VBNsjXkpEZ8tXg1RgAZYaxVqKw0FmkD56/Kbd860dY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwD1DCJbNTo4Ct+xE6YcPCMJpzxm9WYxhhBoit6UanK6vnhFJcs
	RsqljnQeb0CVZ4CVpfPPKf5i1JhqzTXHG8CkWOq2aWC/4HquCElmnaMU
X-Gm-Gg: Acq92OHr2v1X2UFc0gT7uFnG6zBcEqT0dUU80EMBPXyHPLktFauc+lKY0fUiz1OKw2b
	MHNuw4vts/qfJWo64VJ4KNkqOUhZ6VFIx6V4a473W8LVoofYQMHnoZ7ugFBv4t8KbAb5e+9hdjx
	bvqL5GWoAVRFh2SkEZhxqNBe8+24+HXgGE2IDZHEbVPZlPA/lOzJOqTyvTCjmfsrOtusdyJTLOv
	hOkdkftj8Fbdr2Bb/zlC3GYCnVyEIjCKUCgdasjj6rt0A7PLTCX9q+UkI96KvHpC97QzTGEfLLh
	hjPM/Y6z8UsaSzC7XAhbPtjxOcjIqtvR2jZVn8XGI7hJOGB+goweF3/nKdqn/0kS63HT1bQcZ7W
	ctwCtwuDjkeZCft2S/QxZa2giJe3NdLLpQj7/oRsCYNTW7XgyOCfHvyCe4MB9cW/LIv1YFa+cfX
	bgRpobYHzU3NyxHqWk6pbYtKvS3kkOPSBv36ntLeTsVYB12qdAXrfo//mkP5wua+pzc8RGhG5Wo
	p1308AXcjDdYBAXbFdETFI4EsU1CAmawkhhuAr+mgXQgfW7
X-Received: by 2002:a05:600c:468d:b0:488:7d01:f67b with SMTP id 5b1f17b1804b1-490b611af3bmr56074385e9.6.1780492378779;
        Wed, 03 Jun 2026 06:12:58 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:12:58 -0700 (PDT)
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
Subject: [PATCH v2 05/12] arm64: dts: imx8mp-var-som-symphony: enable header UARTs
Date: Wed,  3 Jun 2026 15:12:43 +0200
Message-ID: <52dc9b387d337c646718378306e76a1bb70616e2.1780492180.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780492180.git.stefano.r@variscite.com>
References: <cover.1780492180.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable UART1 and UART4 on the Symphony carrier board and add the
corresponding pinctrl configurations.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index b15ca44b9a92..9500c9bf0f42 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -154,6 +154,13 @@ &snvs_rtc {
 	status = "disabled";
 };
 
+/* Header UART */
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1>;
+	status = "okay";
+};
+
 /* Console */
 &uart2 {
 	pinctrl-names = "default";
@@ -161,6 +168,13 @@ &uart2 {
 	status = "okay";
 };
 
+/* Header UART */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
 &usb3_0 {
 	status = "okay";
 };
@@ -261,6 +275,13 @@ MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
 		>;
 	};
 
+	pinctrl_uart1: uart1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX				0x40
+			MX8MP_IOMUXC_UART1_TXD__UART1_DCE_TX				0x40
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX                            0x40
@@ -268,6 +289,13 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX                            0x40
 		>;
 	};
 
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX				0x40
+			MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX				0x40
+		>;
+	};
+
 	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14                             0x1c4
-- 
2.47.3

