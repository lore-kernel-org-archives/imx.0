Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E2B44376
	for <imx@lists.linux.dev>; Thu, 29 Feb 2024 23:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709249767; cv=none; b=X/mtAG8YzHW2W2xH5wSJV/FDUZxRnk/TASdyPdVkHYEG/hdduivxFuDRjKBbBzyc8jKlOhglFiuPzWja3F32RoFKYyCzmwHXJhULBSULX0Ei4Kq8pHFZzZUE2hPvbOsxnJw4LYXpN+c3Q/rDP0Czj3KjfAAFmKRtS4LO0Jz1tas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709249767; c=relaxed/simple;
	bh=q4q7erHPk4dn/Nf8pXKLzbX4utEAaL/mtldvKHHBoS8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T3G+YQucjp784yPDUGz4eh5kHlvd8N/fho4xx9u1ECpBBDLqCq7nQgOZsWcfbZ3j3S28EOL0QDcrP4ORsvRLcWqsilO63DKdtb7R/ApO/AhUSAzxgs/IhGmi+mLoteME70yySOLEqW5IPYQ+PrZuCNw44Ik6cYUaukqrca/dqTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILJMITMb; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILJMITMb"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3652762edcfso6713095ab.2
        for <imx@lists.linux.dev>; Thu, 29 Feb 2024 15:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709249765; x=1709854565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+28orNpMGgXroEpuUoZhdTb8QFxzIWPQpfl/txukD6k=;
        b=ILJMITMbWXXFpdaN7BMQcrexCLr7y17yI1s/REAtDNWV/ZkI82ON1DVLBU+o0eC7tF
         FTzUYGqtQQfFkO0RtgjLH22ocMOAkWuPIoYV1/VW4a9Y1lBteiP7fkK1uI0QtJ29g5WS
         YE8tSPMfbdOJfAAufiOEcEs4A5yKKKUAQ5coKUeJzoaDt7Jkfh6sHJjIZ3BDiNbhY/GL
         0Pm4LFK6LizZzeBef7ChNKCugbMt3GU+7hqbmqdtL4uMH9Q8Ov5e4YnoEetENaB5XJUl
         vzS03cQW7A35AZvITshYxUKSdumNYVrBVTSSTFcDadbnL2/5m5lb9obiPc/oVcARVaSm
         ZArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709249765; x=1709854565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+28orNpMGgXroEpuUoZhdTb8QFxzIWPQpfl/txukD6k=;
        b=cFdEjLknKiz3MyPtrmCBI2zj0z1WAd0PcquoMC8ZajV0AR3V14q8OET9ZMc8r9Eqv6
         slTJ+d2RQRIrQHkhGxGz0MDH/nXLynrWZ3AT4q9jJYAdgnmoOc9T1+wo1daTBJck8/4A
         Wy9xuj6rsky7irJurqUjsPGq9nUQrIT8HpjmPadBGwbjGv0ha5kWRqk4dAbGJ6ERRlmK
         I8RulmGoywDK2H0KF5JkIM2drXKSFIBjT9CXn8v0X+gPJvkZHzud8S6GBBwp84jb/zef
         UzjsUdbOfaBZCKCovt1jTK/9dgD77NC/6u2YqHWLIlx3r8/e20bauSYYrvOeLN9b6pfh
         UVdA==
X-Forwarded-Encrypted: i=1; AJvYcCUEXX+8Z+2Hx+tL3+aQFP764oef2BNKtANw+Urq8m3xEmVtdySW6/E76Brw3DGU/QlMSwMSpALkRpPLYo6alvvYA8nM
X-Gm-Message-State: AOJu0YyNafxZdnVZxgyZOfXwp0G7JbCmhKoH7wzaguqvzBelYPyOOsUN
	GcBnbwzo+5yIaHBakyqaOfrP99MN3ZAR3SuZg8yurDt5En98sDTq
X-Google-Smtp-Source: AGHT+IFpQBqR2EjhTZVRTHRSZLs3fZz5buNTzVetrB34OkV6yZBLhzpHgpCMW625+nJLMte6I1dBBg==
X-Received: by 2002:a05:6e02:1d83:b0:365:b9c8:4436 with SMTP id h3-20020a056e021d8300b00365b9c84436mr183974ila.10.1709249764757;
        Thu, 29 Feb 2024 15:36:04 -0800 (PST)
Received: from aford-System-Version.lan ([2601:447:d002:5be:c0ab:242c:2712:ad44])
        by smtp.gmail.com with ESMTPSA id j5-20020a056e020ee500b0036576880ffcsm584260ilk.85.2024.02.29.15.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 15:36:04 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: imx8mp-beacon-kit: Move sai3 to Audio_PLL1
Date: Thu, 29 Feb 2024 17:35:54 -0600
Message-ID: <20240229233556.116944-1-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Beacon board has an LVDS display that cannot get a proper clock rate
from Video_PLL if the DSI is operational due to the way the clock divides
the pixel clocks from video_pll.  To make the LVDS work, the LVDS needs
to use an alternative clock.

Because the clock rated needed for the LDB driving the LVDS display
isn't divisible by the clock rate needed by SAI3, move SAI3 to use
Audio_PLL1, and reconfigure the CODEC to use a 12MHz fixed clock.

Because these clocks are no longer in sync with each other, the sound
generated as the wrong pitch, so reconfigure the SAI3 to be the master
since the CODEC can internally compensate when fed a fixed clock
reference, even if it is not an even multiple of the desired rate.

This now leaves AUDIO_PLL2 completely free for the LDB without
compromising the audio sound from the codec.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
index a08057410bde..1f827ef38e36 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
@@ -211,20 +211,20 @@ sound-wm8962 {
 
 		simple-audio-card,cpu {
 			sound-dai = <&sai3>;
+			frame-master;
+			bitclock-master;
 		};
 
 		simple-audio-card,codec {
 			sound-dai = <&wm8962>;
 			clocks = <&clk IMX8MP_CLK_IPP_DO_CLKO1>;
-			frame-master;
-			bitclock-master;
 		};
 	};
 };
 
 &audio_blk_ctrl {
-	assigned-clocks = <&clk IMX8MP_AUDIO_PLL1>, <&clk IMX8MP_AUDIO_PLL2>;
-	assigned-clock-rates = <393216000>, <135475200>;
+	assigned-clocks = <&clk IMX8MP_AUDIO_PLL1>;
+	assigned-clock-rates = <393216000>;
 };
 
 &ecspi2 {
@@ -370,8 +370,8 @@ wm8962: audio-codec@1a {
 		pinctrl-0 = <&pinctrl_wm8962>;
 		clocks = <&clk IMX8MP_CLK_IPP_DO_CLKO1>;
 		assigned-clocks = <&clk IMX8MP_CLK_IPP_DO_CLKO1>;
-		assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL2_OUT>;
-		assigned-clock-rates = <22576000>;
+		assigned-clock-parents = <&clk IMX8MP_CLK_24M>;
+		assigned-clock-rates = <12000000>;
 		DCVDD-supply = <&reg_audio>;
 		DBVDD-supply = <&reg_audio>;
 		AVDD-supply = <&reg_audio>;
@@ -499,10 +499,9 @@ &pcie_phy {
 &sai3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sai3>;
-	assigned-clocks = <&clk IMX8MP_CLK_SAI3>,
-			  <&clk IMX8MP_AUDIO_PLL2> ;
-	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL2_OUT>;
-	assigned-clock-rates = <12288000>, <361267200>;
+	assigned-clocks = <&clk IMX8MP_CLK_SAI3>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <12288000>;
 	fsl,sai-mclk-direction-output;
 	status = "okay";
 };
-- 
2.43.0

