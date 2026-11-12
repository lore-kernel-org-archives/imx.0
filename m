Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794494298;
	b=X5FiZp78iFBHqpVs7BkdJ7X8jIinD11kEbTdUqDzyc9kxq/K7+tj4atGrNGg1nXoNIil
	 ABxsTa5mU7wT4DlkOGAyttSWvm/unqb81tHqqBmaFoSHQs5HpJi5NvyvIt3dE+BIS3Jf5
	 IrW1fWpZpi3cUZStxeGR+IEdH1lg1tkdudRd8TIImPuNEA1GTupxlo9pMC8JFkHZxi3a1
	 S9qEdrHt1hzL89V5JGEGa1/8A8hBXqctyGnK7YqvigjiuDwFRbU25efn/fV5nDv0jA0z8
	 gI5sivb0dOy9oARJEOzdrKfYuzLoak+9fq62IB7duW6qdRbkA8hBbzfq59nlW3kQyIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794494298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=XAIZnoux/n2tbjv162cNDAMdWgGrOolZSCwfLvbKHTE=;
	b=JFRrY/BM1dq92Grf2k6dunMw4o9ONyRjJRhAgGythQozvTeJ3R1BNh4sKT/hxOeyiBnn
	 Fdy5gKjhn07TRhMItGsZjg6cLYtTdjHHVGU6alTwHJcY/KEqfiy+YLOy+zlJKOXAWrSZq
	 DT6J0IgqWcKp0P7TAUPNgDdcKacLepk/c/zSoGTeHt8WvD3eoTdwqirUGHAsLZS+1uUOT
	 zJWI8n5p5xH756EJV6TwXCj4bstTwKmhUZXRA9rX2QctK3FXOEUSPXO5eF1fLeElqy//c
	 dIpLNgA3Pgy3WzBVRR4VsdmfZXCRndvJ8o6JLB6Ct9uJXG7m652akrw4omBPA8o7wZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0zw/N3fm";
	arc=none smtp.remote-ip=209.85.222.54
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3F0606A89F
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 14:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB3F0606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0zw/N3fm
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-97ccbba8e86so1169522241.3
        for <imx@lists.linux.dev>; Thu, 12 Nov 2026 06:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794494297; x=1795099097; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAIZnoux/n2tbjv162cNDAMdWgGrOolZSCwfLvbKHTE=;
        b=0zw/N3fmnJXb0MMMJ2+jnITXcFztAgRisMsrTUeBaCVodVHyfgaT6P+SJaTMCyu+UO
         DIHcri1X/grR5r+y8eTCu11kqfhi2kOPK11IsE08KwM64ieD/AvmPDVDu0Df+dFJf7Z8
         Jyur0XBOgHZRLD+zh0m1eZdgNT2cIj+PpakJndmwuKi0wYrkG9qdQC5/oj1L/LxnqDp7
         h1K0CyvrCVG5NAmLHYnWAdUqSsmcXjsHWOi20ouUKrUuJ8nW6aFz7lcOQr37U/jdkX5C
         CpxhuLrH00yI8pc75fSDpJywijsKb4WIha8C0lPrvitgGSXAofZMSSHC8xCxJlUrlkMC
         cQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794494297; x=1795099097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XAIZnoux/n2tbjv162cNDAMdWgGrOolZSCwfLvbKHTE=;
        b=meP5oaYUi39z9LFUolXopS8Z0VFrYvHLkLEKUkOYUO1273SOqCLz9xbuxsuecYPCgL
         CwG2VjfXtTau561FBR7li3xstBAbrQUkbAso052pSoH1V/cTw1MSoeFFXlkb9xtUkECS
         CYinwStJrr6qshZ4DWlx3t4Wkmj7u3QwfSfzUinS4YMZDtoGv9CR9oH0milTmLX0ugIF
         dt8QDBFv6F4DCYMUVCEZizXfpPJFxEfDRRMTYhyc3EfbqJLkiQTjJHh94gW1+5V/FVsN
         L2G9MsgliQp5mfnDusV9/gxUS+TvE9lcY3O0syu79BynkYKpb5RGhphpjU5RcC59OiC8
         kg5A==
X-Forwarded-Encrypted: i=1; AL+hErFb9jfHKTmzD1OVzllwqG8ahCF2VYFiieUW6CVCO+8FK33ul0PCOkHWL7lDEOxZ0OqwapY=@lists.linux.dev
X-Gm-Message-State: APuU4Z+osoVFHGxmYNaeKJz0wBN57+ZlQ7Ui4H5QxG2Oy1m0zOD3NPgP
	MVNm6DOwV+bdxWvYgIti3cQIPch7y5FpNRg5P1EPwPTwnkU+bHuycD3mOi1pqimW
X-Gm-Gg: AYBFou1jIgGxKDSzNwpvjS5x53jLPRSlOp1xkkoAEWXH5mbWLnQDIobYn5lfdZOsNyZ
	rlxrHmjd1cEkYVozPPxORsTPZ8e5I4Cj2xWJgqE3Ofnn2wiGi+ARIj7b4L0rw7RzpP2/MxsVsKW
	0se8bUg12D34wek0IZNLoCdJMvkW/JxmJOjrOuxrAynCEOuZwb/+VmvvdmPqMCbhOtJm3DDWbHf
	l8Pwe7X37enir1909h4OZzw0dhaV8/ZAV2Sgq2cn+BEk6Zi5V0uuYfv8rZV6fEl1CDUZokOq6id
	4O6xOmdVU8u8vfbN/ciZ4MLy4DocJfoG8ZBfbCTqIIPCJL2RbQQu2a4JuC7L/lQRJbVT1mtmA/i
	WidUqDj1HhaF2O+7gGHuhdVeDI0EPuRFaF3J6lbqLd5SU8jRa597bnqhW3UoR3Zrb52DZC3y3h2
	7SuoTCeeRzdyIiLrcVh7uvwxw3ZVFfKvLPNJG6tYKGbrbpdlp8x2MXMHdt1YSbiYV6mKoKYEzgu
	qiY10awKxfvjn6UwGuysXjBC8qPgGmJ2eM8DAl5IJuEJ65DIbhPpAudLqKLFpZHglq3LiTIHSiu
	AjICDeuMEWbOrA4UMcS9mLBhCuaZVnSpWAkcjBYFSHuRrnuz0Hy2800=
X-Received: by 2002:a05:6102:c4f:b0:7d2:75bf:2fb3 with SMTP id ada2fe7eead31-7d4edd1c21dmr1830857137.1.1794494296470;
        Thu, 12 Nov 2026 06:38:16 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fffe12dsm5177230241.5.2026.11.12.06.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:38:16 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Thu, 12 Nov 2026 11:37:34 -0300
Subject: [PATCH 2/3] arm64: dts: freescale: imx95-aquila: Add GPIO
 pingroups for the Lotus Carrier Board
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-b4-v1-aquila-lotus-dtbs-v1-2-ca150bb4b0f9@toradex.com>
References: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
In-Reply-To: <20261112-b4-v1-aquila-lotus-dtbs-v1-0-ca150bb4b0f9@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794494281; l=3366;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=E6ByCUL0N/O7LejHb/X4auWSlo2ji9+18EP0glmb2AE=;
 b=kfiguU1plVyEnzHlHbVhmFtsvSJI1nrPiCltOAJzbi1SapThDG0yPx+EWCJJJBvaKpqrocvLg
 RtvqJCcTPwkD5IZL3ScBoHZCa8ifHFmHWe7d6TDcrTjEJPFevtjwiEb
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

The PWM_4_DP and I2S_1_* signal pins, except for I2S_1_BCLK, are used as
GPIOs for SFP+ low-speed signals on boards which contain an SFP+ Cage.

Add pingroups muxing those pins to their GPIO functions and update the
gpio-line-names properties with the newly added GPIO pins. Additionally
extend the modified gpio-line-names arrays to their full size.

Also add the I2S_1_BCLK pin (AQUILA_B20) to gpio-line-names, as it is
used as an Isolated Digital IO readback on the Lotus Carrier Board.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi | 61 ++++++++++++++++++++++---
 1 file changed, 55 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index dbb0b44583a55..369d5aa469ce7 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -277,7 +277,29 @@ &gpio2 {
 			  "",
 			  "AQUILA_B42",
 			  "",
-			  "AQUILA_B43";
+			  "AQUILA_B43",
+			  "", /* 10 */
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "", /* 20 */
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "AQUILA_B58",
+			  "",
+			  "",
+			  "",
+			  "", /* 30 */
+			  "";
 };
 
 &gpio3 {
@@ -323,18 +345,20 @@ &gpio4 {
 			  "",
 			  "",
 			  "",
-			  "",
+			  "AQUILA_B23",
 			  "AQUILA_C22",
 			  "AQUILA_C21",
 			  "AQUILA_C20",
-			  "", /* 20 */
-			  "",
-			  "",
+			  "AQUILA_B21", /* 20 */
+			  "AQUILA_B20",
+			  "AQUILA_B22",
 			  "AQUILA_C23",
 			  "AQUILA_D23",
 			  "AQUILA_D24",
+			  "AQUILA_B24",
+			  "AQUILA_D25",
 			  "",
-			  "AQUILA_D25";
+			  "";
 };
 
 &gpio5 {
@@ -1041,10 +1065,30 @@ pinctrl_sai2: sai2grp {
 			   <IMX95_PAD_ENET2_RX_CTL__NETCMIX_TOP_SAI2_TX_DATA_BIT0	0x11e>; /* Aquila B22 */
 	};
 
+	/* Aquila I2S_1_MCLK as GPIO */
+	pinctrl_i2s_1_mclk_gpio: sai2mclkgpiogrp {
+		fsl,pins = <IMX95_PAD_ENET2_RD2__GPIO4_IO_BIT26	0x31e>; /* Aquila B24 */
+	};
+
 	pinctrl_sai2_mclk: sai2mclkgrp {
 		fsl,pins = <IMX95_PAD_ENET2_RD2__NETCMIX_TOP_SAI2_MCLK	0x31e>; /* Aquila B24 */
 	};
 
+	/* Aquila I2S_1_D_IN as GPIO */
+	pinctrl_i2s_1_d_in_gpio: sai2rxdata0gpiogrp {
+		fsl,pins = <IMX95_PAD_ENET2_TD3__GPIO4_IO_BIT16	0x31e>; /* Aquila B23 */
+	};
+
+	/* Aquila I2S_1_D_OUT as GPIO */
+	pinctrl_i2s_1_d_out_gpio: sai2txdata0gpiogrp {
+		fsl,pins = <IMX95_PAD_ENET2_RX_CTL__GPIO4_IO_BIT22	0x31e>; /* Aquila B22 */
+	};
+
+	/* Aquila I2S_1_SYNC as GPIO */
+	pinctrl_i2s_1_sync_gpio: sai2txsyncgpiogrp {
+		fsl,pins = <IMX95_PAD_ENET2_TX_CTL__GPIO4_IO_BIT20	0x31e>; /* Aquila B21 */
+	};
+
 	/* Aquila SD_1_CD# as GPIO */
 	pinctrl_sd1_cd_gpio: sd1cdgpiogrp {
 		fsl,pins = <IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0	0x1100>; /* Aquila A1 */
@@ -1070,6 +1114,11 @@ pinctrl_pwm3_dsi: tpm5ch0grp {
 		fsl,pins = <IMX95_PAD_GPIO_IO06__TPM5_CH0	0x11e>; /* Aquila B46 */
 	};
 
+	/* Aquila PWM_4_DP as GPIO */
+	pinctrl_pwm4_dp_gpio: tpm5ch3gpiogrp {
+		fsl,pins = <IMX95_PAD_GPIO_IO26__GPIO2_IO_BIT26	0x31e>; /* Aquila B58 */
+	};
+
 	/* Aquila PWM_4_DP */
 	pinctrl_pwm4_dp: tpm5ch3grp {
 		fsl,pins = <IMX95_PAD_GPIO_IO26__TPM5_CH3	0x11e>; /* Aquila B58 */

-- 
2.43.0

