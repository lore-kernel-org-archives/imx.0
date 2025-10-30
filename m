Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE45320397
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 12:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761825773; cv=none; b=XVX/spyp5Fqk3kpZmqM41puwaH/w+SMeA7RvZDkGs2xsyW9gHseTd4Lq5tQGb8e2Db2AZi9fywt9AKphubzSUe84Hk7y31tBhCWCrTd+yfg8FssNvt6NdMzC2LfhhVEO7qhz2z/+LTPVpIL/MIcd6IeDGFBOIQPe8phW+Okg7sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761825773; c=relaxed/simple;
	bh=e8pxQEqLtW1Slow0rZY/48Rg7tSYJ1oUbuHVlI3G87Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qGgj+r2JXK36om5de3VDrdCm7CPEYhYcXn67ffCRlBw14jAGSFlnUnTjp75RcIONbhl20FkhWXtrQLy086YzaFgbwezrU82w/To9mUIm3fmqIAvJw7FonniUjebLJ9+SgkEvtgF77ObQ7BOqVIpW+n5z6LDtccZZIVkYnTrNV7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKxuE4d+; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKxuE4d+"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so634092f8f.0
        for <imx@lists.linux.dev>; Thu, 30 Oct 2025 05:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761825770; x=1762430570; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qu8nOseerJIwiaKexI9V+78CH5dDbgipqtlgAiyDwbk=;
        b=nKxuE4d+WhxDNxflyLr31Bm2JsHuFDrFa6KaLbRVTxvtOJwBk8Oxi9tGuhqys4mWrt
         jAOOyzhs+jsO8BzKQeMgWtfQ96lYpVsld+Rf/UQ5qja/yTmpKUsPbjOg/gbxDfrZ7evQ
         XKS59v3iq9HgXDM7C+SZRbxVKMR1GIoAaKmuXb4vO6EW1uFyTXedHiVvI4CjOLReZpW6
         d7/8FlMKo0Ky86qxnQwqYS7wf2fmOVP2W7E1yMcbTxa8/zLuxqh76q3h5TnXC9pSLwgJ
         FDaXv97bbvK4SOnFKhAKc3EwVieLjdPKsI8WK1X99aLKJQMjqiOYqKg5VzQO/ya3Sx3q
         hhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761825770; x=1762430570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qu8nOseerJIwiaKexI9V+78CH5dDbgipqtlgAiyDwbk=;
        b=jPlXysfGButzYLyF1y4SDkZXguYyE7Vdw7OU050cZBTYDj27aUl81Q3+ogkLKF1lHP
         OvipJkR0Y4Kda9VxwRhShoQkMO4TCEi/SPV2ZSp+N5hnA8bn4fg85NNr/wXlcEVsNRMO
         Hao0x3n6dCjGl3Lge1wLxo+a2VR6XOSNxpV7sv0DEDoC4uxLvZyB7ikYB/693VU3BbfR
         umiGwjvse+En9SWHQfSSE7omLmHGpwaNKcNSO9Mfz492R/tiqM4bX5CvNk7iPi6ywsMU
         Nc5zKOL1aJsCB4R1vHSUKn4Pg9zOkO/XPrlyj/bOivM8ETcISe8vymIwCZbEaVRm9DRn
         KBqw==
X-Forwarded-Encrypted: i=1; AJvYcCXSip0ORmB3hmquHPaLuCGNipfTyfmGUY4zCuUeo/NmXQo/YBuP87o5l/hcUnkvoAnzjn8=@lists.linux.dev
X-Gm-Message-State: AOJu0YymwYn4zrqWjwRqFh9fNsefKVzxqSi10Ug4E0WYzZQFkbXgaa2c
	7MkW3NoSruQesTOri0bOiDA/lHiifx+SRgqEQn4J9Oin9s//cSpel7Zb
X-Gm-Gg: ASbGncsQ29uSUFLY5hvj9cJg61DrtKPgb7BVKIY+YDrODrVdogz/B+uvMFOC9Vdruv8
	BnoeVwiRJPbfs5+02w5QYh3Z5p43qVeUrN0+9xQTUHvd83UYKlhrHfZcXq/weHMampVF21PX5Ub
	9lnLZntDB3X30j01ZQXd+f90HWoJVam441xrsu6Zlm1Oo90uI18o61YGDT5XmZSmbadbR80Oc8H
	Ar8jEEWfnb9VI8grtE9ViGHqE/KGVhyhQwe15zvcdaYgWzvju2Bak4/l2SYj8YUKNVHvvBQCRbn
	de2uSZNtWDWw1YHMhl+UPnme8FRlYjfG4O3zGm0lvIn2XDJ/hcIC1Qrn1TtAFnkWMwyOvYA7QsM
	MxpSba689tkZNO3DkuiYnsoaKrMCeQwPBWrzTf3X+0IC2H29Lde0N1W0B5plx9CHVpy7kv2/Kbk
	wvwi0QSRKzyIMqrKpBUEG+p+8CUsbGaeFPdTlpXxbEmBPuUvR+3zQfbXTMsFe9iTVH+Pmo9zoC
X-Google-Smtp-Source: AGHT+IHFni13l9ewEcMuX6++qZosCb8kSPle7LBBV+o9CF/LKnPDmcWv4Piuhrw/JZlMYaZ2eGkiDw==
X-Received: by 2002:a05:6000:1a87:b0:3e9:3b91:e846 with SMTP id ffacd0b85a97d-429b4c73527mr2728446f8f.10.1761825769830;
        Thu, 30 Oct 2025 05:02:49 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-146-98-100.cust.vodafonedsl.it. [93.146.98.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429b9b436efsm2399848f8f.23.2025.10.30.05.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 05:02:49 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 4/4] arm64: dts: freescale: imx93-var-som: Add support for ADS7846 touchscreen
Date: Thu, 30 Oct 2025 13:01:24 +0100
Message-ID: <20251030120127.509933-5-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030120127.509933-1-stefano.radaelli21@gmail.com>
References: <20251030120127.509933-1-stefano.radaelli21@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The VAR-SOM-MX93 integrates an ADS7846 resistive touchscreen controller.
The controller is physically located on the SOM, and its signals are
routed to the SOM pins, allowing carrier boards to make use of it.

This patch adds the ADS7846 node and the appropriate SPI controller.

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
---
v2:
 - Fix pinctrl alignment

 .../boot/dts/freescale/imx93-var-som.dtsi     | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index 0b7f6740e5ad..2dc8b18ae91e 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -212,6 +212,38 @@ wm8904: audio-codec@1a {
 	};
 };
 
+&lpspi8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi8>;
+	cs-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	/* Resistive touch controller */
+	ads7846: touchscreen@0 {
+		compatible = "ti,ads7846";
+		reg = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_restouch>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <29 IRQ_TYPE_EDGE_FALLING>;
+		spi-max-frequency = <1000000>;
+		pendown-gpio = <&gpio4 29 0>;
+		vcc-supply = <&buck5>;
+		ti,x-min = /bits/ 16 <125>;
+		ti,x-max = /bits/ 16 <4008>;
+		ti,y-min = /bits/ 16 <282>;
+		ti,y-max = /bits/ 16 <3864>;
+		ti,x-plate-ohms = /bits/ 16 <180>;
+		ti,pressure-max = /bits/ 16 <255>;
+		ti,debounce-max = /bits/ 16 <10>;
+		ti,debounce-tol = /bits/ 16 <3>;
+		ti,debounce-rep = /bits/ 16 <1>;
+		ti,settle-delay-usec = /bits/ 16 <150>;
+		ti,keep-vref-on;
+		wakeup-source;
+	};
+};
+
 /* BT module */
 &lpuart5 {
 	pinctrl-names = "default";
@@ -307,6 +339,15 @@ MX93_PAD_GPIO_IO29__GPIO2_IO29		0x40000b9e
 		>;
 	};
 
+	pinctrl_lpspi8: lpspi8grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO12__GPIO2_IO12		0x31e
+			MX93_PAD_GPIO_IO13__LPSPI8_SIN		0x31e
+			MX93_PAD_GPIO_IO14__LPSPI8_SOUT		0x31e
+			MX93_PAD_GPIO_IO15__LPSPI8_SCK		0x31e
+		>;
+	};
+
 	pinctrl_lpuart5: lpuart5grp {
 		fsl,pins = <
 			MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX   0x31e
@@ -316,6 +357,12 @@ MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B  0x31e
 		>;
 	};
 
+	pinctrl_restouch: restouchgrp {
+		fsl,pins = <
+			MX93_PAD_CCM_CLKO4__GPIO4_IO29		0x31e
+		>;
+	};
+
 	pinctrl_sai1: sai1grp {
 		fsl,pins = <
 			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK		0x31e
-- 
2.43.0

