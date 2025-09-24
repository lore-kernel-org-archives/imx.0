Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9992D1916
	for <imx@lists.linux.dev>; Wed, 24 Sep 2025 10:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758709011; cv=none; b=WcUtmv5EgH+oylvh61MqTUlyevji+apM7JcGnZnlCauX9H4IrnUwEXZKFjA8BgTKFK0YMM1fhKGINL2G9m744t77uEXzx4FkOU5qGMWQntTdJQaJ/3r2tbg3ySgOZmNYwP9GyDxeMxt/JHvrIzSVZ/vZ39MlOzTGzMtx5sHMHbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758709011; c=relaxed/simple;
	bh=QdVtGcIHzrV0fUtoLR0+CcnCf0mmDqhn9O0HeNGf39c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OqWye7zsqIII9fbC9uttJANHR6eyh0koOTgdS6O67v+UShWRuyf/QF+8kw9lRM4qKYdhFt/GQ/GGf0bNP1XPMSiHJo71MUBTEWTcZjpflNul2/6YVqFOlF6JzeIooBJy1WIEmm3QeXubjOgSICRNFPTA4CpY+EfWG5gjid+0nD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=D9B5+Yf8; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="D9B5+Yf8"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b33d785db6fso40057566b.2
        for <imx@lists.linux.dev>; Wed, 24 Sep 2025 03:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758709004; x=1759313804; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APo2jYD1PxrHJsECEd/93gcKH2/sr0pgqf5id/Ryl2g=;
        b=D9B5+Yf89pHl/Q3xvCfCyNI5dduUGslpqFftpAa3NYKgC1vxqITWV4aIGRtXqaPtEM
         rMQbLs6HWOhlbUNdYsIeql4HdNTlEPJ/KfAH9KY+XgsXLLtDeySZb0b+9R/jD8H/XntA
         rherX4/tpBCnwBf2PavcCQAGSGrpX+5rB4uhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758709004; x=1759313804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APo2jYD1PxrHJsECEd/93gcKH2/sr0pgqf5id/Ryl2g=;
        b=SQXwZCoucP88LL68GTTxSYwdeKki9Tzyl3oBvUsQCyIbVDOhR1mqeCWeQo2QTXHPcL
         rLzweX1mTqifh/vgkFSF2oAEDKhuunFEtSAz0uIDN0KYpChr8WKLoDmhcG4HGMqY+eY+
         LnrQTUdQlsGFXrcMrj0vCAjJhVAI+c/+RzllPT04ORrVQfBG/IptHWrK8PJAiZHU2IBa
         vVeJUWN+ivbwia1Piy3E+ggS4wm2ONY/Kj5IdAvtISGzRLlFfdVhuokulTriYa9rlGYd
         Y74T+C/8ABwgJuTAb4te4YnmsR3h7m8cePnP1mogvF6mZUsPi03TRRhS7bIaKQ4x0Mp0
         2m+g==
X-Forwarded-Encrypted: i=1; AJvYcCWb6kuHuI7Ng2slDQCbzwX3CE9R7W99ChaftW4Kawarh39AsfpowEccUQcnjcjJFjNHiu4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJg8SaeVMrGi7639QJbHo6ESkAyqsifSfF0tIv+HRJYN6mZAmg
	e4HIdeB2KuUPBoZLQMfk/Bi+G3NyQkJD8OIFMGn/2EaDkRj9rMiHU9iLCkG4ZTMZTPY=
X-Gm-Gg: ASbGnctDw9mADSwmsb5ju/EXuKPLwodTOjzk22rMTRxnYIjWhJ9gz7NcW+BQTUfPJ9x
	B6BARj9fxmiW+Z5Ncyw+TLeCtlds/NsyGneTjOi+JnWPw6WtE/9oj4ExEzCT0aCIgcJspI1vf9k
	tAzon9xyAXORRunAjq4eDcKusqipeRHr+igG87NgaXStGx16EE+nzo58dB51sXMKO6q3a3rF1JF
	nLT1mErqYY4fv5X+0/ePGmeAsckrPYQl+X7q1cxYyhhFe9YWw8C7j+Xfe+HeRIeErfCujLEKR+p
	ryxe9VsXoRBewiriFTo2iD6MkW+FqbonICYWDLIy63sYXFLjlpOFUm+zffAgTZE9cI+dJhPL+c5
	G1ZeK2Ls3+m4dkRv+2gfRzgTmPAaXXFWZuppm8EUjB7vHLcmcIgNJtJmtOmLzNOgZEV67jGzRF8
	tkIilnI2oXTE0r6RhkNrdopu8WFqdm+WWzIItUZlxfkPJmbdB2tuDeeVAUMaw=
X-Google-Smtp-Source: AGHT+IFpgDJanqCTLTKh+/RXRTMpj1SXZmnA3vhBPvdRPeNe6cdiq1+fp18qRHYn/FojREkTohVOcg==
X-Received: by 2002:a17:907:d8c:b0:b2f:faf6:dfc3 with SMTP id a640c23a62f3a-b30260c9c01mr624226666b.3.1758709004422;
        Wed, 24 Sep 2025 03:16:44 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b28d206bd13sm949712766b.31.2025.09.24.03.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 03:16:44 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
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
Subject: [PATCH 2/3] ARM: dts: imx28-amarula-rmm: add I2S audio
Date: Wed, 24 Sep 2025 12:16:26 +0200
Message-ID: <20250924101640.2942635-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924101640.2942635-1-dario.binacchi@amarulasolutions.com>
References: <20250924101640.2942635-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for I2S audio on Amarula rmm board. Audio codec
TLV320AIC3X is connected as slave to SAIF0, which provides
bitclock, frame and MCLK.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts b/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
index af59211842fb..0c5b52f67178 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
@@ -112,6 +112,29 @@ reg_usb1_vbus: regulator-usb1-vbus {
 		enable-active-high;
 		regulator-always-on;
 	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "imx28-mrmmi-tlv320aic3x-audio";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&cpu_dai>;
+		simple-audio-card,frame-master = <&cpu_dai>;
+		simple-audio-card,widgets =
+			"Headphone", "Headphone Jack";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPROUT",
+			"Headphone Jack", "HPRCOM";
+		simple-audio-card,mclk-fs = <512>;
+
+		cpu_dai: simple-audio-card,cpu {
+			sound-dai = <&saif0>;
+			clocks = <&saif0>;
+		};
+
+		codec_dai: simple-audio-card,codec {
+			sound-dai = <&tlv320aic3x>;
+		};
+	};
 };
 
 &auart0 {
@@ -154,6 +177,20 @@ &i2c0 {
 	pinctrl-0 = <&i2c0_pins_a>;
 	status = "okay";
 
+	tlv320aic3x: tlv320aic3x@18 {
+		compatible = "ti,tlv320aic3x";
+		pinctrl-names = "default";
+		pinctrl-0 = <&tlv320aic3x_pins>;
+		reg = <0x18>;
+		reset-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+
+		DVDD-supply = <&reg_1v8>;
+		IOVDD-supply = <&reg_3v3>;
+		AVDD-supply = <&reg_3v3>;
+		DRVDD-supply = <&reg_3v3>;
+	};
+
 	touchscreen: touchscreen@38 {
 		compatible = "edt,edt-ft5306";
 		reg = <0x38>;
@@ -246,6 +283,14 @@ MX28_PAD_PWM1__GPIO_3_17
 		fsl,voltage = <MXS_VOLTAGE_HIGH>;
 	};
 
+	tlv320aic3x_pins: tlv320aic3x-pins@0 {
+		reg = <0>;
+		fsl,pinmux-ids = <MX28_PAD_SSP0_DATA4__GPIO_2_4>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,pull-up = <MXS_PULL_ENABLE>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+	};
+
 	usb0_vbus_enable_pin: usb0-vbus-enable@0 {
 		reg = <0>;
 		fsl,pinmux-ids = <MX28_PAD_SSP0_DATA5__GPIO_2_5>;
@@ -269,6 +314,12 @@ &pwm {
 	status = "okay";
 };
 
+&saif0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&saif0_pins_a>;
+	status = "okay";
+};
+
 /* microSD */
 &ssp0 {
 	compatible = "fsl,imx28-mmc";
-- 
2.43.0

base-commit: cec1e6e5d1ab33403b809f79cd20d6aff124ccfe
branch: microgea-rmm-audio
