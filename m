Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0963590AE
	for <imx@lists.linux.dev>; Wed, 29 Oct 2025 19:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761766153; cv=none; b=hWx6VKbq0fMzxS3/B9ZQ2VQL64RVj8Ve4YhRrHySLwPOJ/LPBv2kLVpz2GxP+v3CTzINuXNyXz/6yeu1M0Jnmlv3wP18VBjh6Fj7sAJyQdwWZPx3dobKx/Vc7Ayc5iCc0Ss7IgzR4QsKgtkc9PISj3Xop9s98lJIWvcw+2zD/Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761766153; c=relaxed/simple;
	bh=whFzpc1JabPaAo10HjUjIy4z4qlcYRtwGhxtqr+pOMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pUv1dddvUQrmJoxbHkmsTTWRZhe2+fie2Kjr/ZTVkWhV0j64dk/VACeqggbnsbKuKSmiFUx0HkvCXDgMucxLHTynSW4gkFknOm5seVf7XNajMhXP76RJZy8Y1UXKFvRu69e9UJOL+/UwZJcSkpQ6WtyIznhH7IBdGl7uLcm6wfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRwKTVqQ; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRwKTVqQ"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b50206773adso279876166b.0
        for <imx@lists.linux.dev>; Wed, 29 Oct 2025 12:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761766150; x=1762370950; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAZL73WPFIHN2VTWaQ6XP1b9wcDV8dTDSuc2UCDs70I=;
        b=dRwKTVqQv0e0MwIGLB4mnKeNGkJxnEOYprmYx2PjUgDwvVt1iPHlefeVBuzqPjAIYU
         n8r6rArhrlQ87oQFYT8tIXjoRrjrEDOcTPv+pA41slOdjyxO0t7xAgrx622SCrgqBBDA
         jd5UcttbCkdvydGDUk/m8UXiE6s4B2XCmqBOPn1QcuVw2g/K03XtRjr2Rqp1qN2JCPZo
         GTanZPAp66ZUPdrg+dO9y+L77gWjDMRw60QYwwrsdmUHro+SZfmzp6AtvtbaLJj+Re+e
         um4cyKE5NtGe6ErPZGJES6B3dnq958urK/djh8OVXisVgGkPrcgwtUIFlsIPO3IOfw/i
         yFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761766150; x=1762370950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DAZL73WPFIHN2VTWaQ6XP1b9wcDV8dTDSuc2UCDs70I=;
        b=NdhZirv1EtGNN56bzMhhAdsm/xxh3qv/krYy4avEv+kAal0XFQXgbTsKrHncRzH/ts
         RLTmxmZpE+TXrMbPmYGIJ/y04tSDCcNslrLVdmF1Wd1DNp81drGy2KVag6rnLxzaNk1y
         heIdBmYaOnnBk2oIHLdQSZ03juHdlcdq6iL6R7UJqUythRLcPuSXsiTB1zlcPZjTamJM
         DUU3KAV14gQeJyeKs8/4QqK/f7UVHSx5wKvCuIGnO+LZMxd/iU/ZoU6RY1iimeUHFwmN
         ci+kpLov4Z7q3BjSOdjH/nVsxOaqBZetuV4mkL2xAjRBaJmNPcH1SjoPIiY+cuFifq8j
         JTTg==
X-Forwarded-Encrypted: i=1; AJvYcCUZl6pBSW3udcXtOEbgA/BaSmX5MXIlzDUBKUDXNRzIFK/LJHiyVRICKJ/toojqdlCeRpI=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywxx3VdB91s3ctfdtN/blXqt67/d+OVJUtU2AsfibxvFaU5j+Gi
	zR5HAtD1plUFmf3YCcqPdiQZZ5KV71htK5BTAyZsbVRIdIilG93BfOEW
X-Gm-Gg: ASbGncuSbBbGAmwm810p8hrtp46ECMJLYVOFWlDDVBUmzfYij1gb693+7sbsotRrprM
	qgbXu7FvB4/tqvqpa8oXtlYs3q2Okyncl8fgil66JkPCbsBVJChzYD5f+hvvYvJ7Xdcf6br59ao
	W736FkPrVaDRwio94j95m7AWfRs3sl1Zq7+nBz6OrN/3z5eCxE2P3rAwDgJm/+zJRUp0K2FntDs
	7fZe74jEeZyU5uiE+f4SFJ3bgXK4g31sNa2Nf3eGu4v0WE92v4sRMml2xTg2MJTRjlSsmKnYd65
	mMM4ivy6DbxXDkMHK4/mWBux0xSbYv43m7sNiJMij4Rp2p49D7apjMdSg0hpjK+w+mmCcuHFj+m
	JUoCcV2hq+cZmGSBICc7qD8kitdwIXxAL7BO2u3cj3uHZeI+yNO8FLFSO06Ye55SazhPFixRKQd
	M0ewMrYBKZ4VX6+KWv9FWoRq1OAcDRW7E2JzblFgV7MXEtBhxT5qbmrfhycYopiA==
X-Google-Smtp-Source: AGHT+IFoA8vHjH7L7A7O5BYxTWm3kdq9AbZkEIotO1WtkkfV9Jwy/FnFo8J2wfIiFOBVGEd666tsSA==
X-Received: by 2002:a17:906:7947:b0:b6d:545e:44f6 with SMTP id a640c23a62f3a-b7051f630abmr98050966b.12.1761766149655;
        Wed, 29 Oct 2025 12:29:09 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-146-98-100.cust.vodafonedsl.it. [93.146.98.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8548eda6sm1496673266b.75.2025.10.29.12.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 12:29:09 -0700 (PDT)
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
Subject: [PATCH v1 1/4] arm64: dts: freescale: imx93-var-som: Add WiFi and Bluetooth support
Date: Wed, 29 Oct 2025 20:28:46 +0100
Message-ID: <20251029192852.656806-2-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029192852.656806-1-stefano.radaelli21@gmail.com>
References: <20251029192852.656806-1-stefano.radaelli21@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree nodes for the WiFi and Bluetooth module mounted on the
VAR-SOM-MX93. The module can be based on either the NXP IW612 or IW611
chipset, depending on the configuration chosen by the customer.

Regardless of the chipset used, WiFi communicates over SDIO and Bluetooth
over UART.

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
---
 .../boot/dts/freescale/imx93-var-som.dtsi     | 94 ++++++++++++++++++-
 1 file changed, 93 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index a5f09487d803..97198007b545 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -12,7 +12,7 @@ /{
 	model = "Variscite VAR-SOM-MX93 module";
 	compatible = "variscite,var-som-mx93", "fsl,imx93";
 
-	mmc_pwrseq: mmc-pwrseq {
+	usdhc3_pwrseq: mmc-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		post-power-on-delay-ms = <100>;
 		power-off-delay-us = <10000>;
@@ -70,6 +70,18 @@ led@1 {
 	};
 };
 
+/* BT module */
+&lpuart5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpuart5>, <&pinctrl_bluetooth>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
 /* eMMC */
 &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -81,7 +93,27 @@ &usdhc1 {
 	status = "okay";
 };
 
+/* WiFi */
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
+	pinctrl-3 = <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
+	bus-width = <4>;
+	mmc-pwrseq = <&usdhc3_pwrseq>;
+	non-removable;
+	wakeup-source;
+	status = "okay";
+};
+
 &iomuxc {
+	pinctrl_bluetooth: bluetoothgrp {
+		fsl,pins = <
+			MX93_PAD_ENET2_MDIO__GPIO4_IO15                         0x51e
+		>;
+	};
+
 	pinctrl_eqos: eqosgrp {
 		fsl,pins = <
 			MX93_PAD_ENET1_MDC__ENET_QOS_MDC			0x57e
@@ -108,6 +140,15 @@ MX93_PAD_UART2_TXD__GPIO1_IO07			0x51e
 		>;
 	};
 
+	pinctrl_lpuart5: lpuart5grp {
+		fsl,pins = <
+			MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX   0x31e
+			MX93_PAD_DAP_TDI__LPUART5_RX            0x31e
+			MX93_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B   0x31e
+			MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B  0x31e
+		>;
+	};
+
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
 			MX93_PAD_SD1_CLK__USDHC1_CLK		0x15fe
@@ -123,4 +164,55 @@ MX93_PAD_SD1_DATA7__USDHC1_DATA7	0x13fe
 			MX93_PAD_SD1_STROBE__USDHC1_STROBE	0x15fe
 		>;
 	};
+
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK                    0x1582 /* SDIO_B_CLK */
+			MX93_PAD_SD3_CMD__USDHC3_CMD                    0x40001382 /* SDIO_B_CMD */
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0                0x40001382 /* SDIO_B_D0 */
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1                0x40001382 /* SDIO_B_D1 */
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2                0x40001382 /* SDIO_B_D2 */
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3                0x40001382 /* SDIO_B_D3 */
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK                    0x158e /* SDIO_B_CLK */
+			MX93_PAD_SD3_CMD__USDHC3_CMD                    0x4000138e /* SDIO_B_CMD */
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0                0x4000138e /* SDIO_B_D0 */
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1                0x4000138e /* SDIO_B_D1 */
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2                0x4000138e /* SDIO_B_D2 */
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3                0x4000138e /* SDIO_B_D3 */
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK                    0x15fe /* SDIO_B_CLK */
+			MX93_PAD_SD3_CMD__USDHC3_CMD                    0x400013fe /* SDIO_B_CMD */
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0                0x400013fe /* SDIO_B_D0 */
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1                0x400013fe /* SDIO_B_D1 */
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2                0x400013fe /* SDIO_B_D2 */
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3                0x400013fe /* SDIO_B_D3 */
+		>;
+	};
+
+	pinctrl_usdhc3_sleep: usdhc3-sleepgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__GPIO3_IO20            0x400
+			MX93_PAD_SD3_CMD__GPIO3_IO21            0x400
+			MX93_PAD_SD3_DATA0__GPIO3_IO22          0x400
+			MX93_PAD_SD3_DATA1__GPIO3_IO23          0x400
+			MX93_PAD_SD3_DATA2__GPIO3_IO24          0x400
+			MX93_PAD_SD3_DATA3__GPIO3_IO25          0x400
+		>;
+	};
+
+	pinctrl_usdhc3_wlan: usdhc3-wlangrp {
+		fsl,pins = <
+			MX93_PAD_ENET2_MDC__GPIO4_IO14                  0x51e /* WIFI_REG_ON     */
+			MX93_PAD_SD2_RESET_B__GPIO3_IO07                0x51e /* WIFI_PWR_EN     */
+		>;
+	};
 };
-- 
2.43.0

