Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E075E30276E
	for <imx@lists.linux.dev>; Wed, 24 Sep 2025 13:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758719277; cv=none; b=Pi6PxqkWp540GqNha62snZndvmAGrsuts8FHXfNBJpcnKIbikPFQbxbasX0Sht8l9MfFkbH6qyVHoJb2iHlnNw9kXv24h9vQqGfy0WPBUv1UDGhqr78reZXqzkDKXVXrQ1SeY6FqHHZ4lmAlGyZhFXFGgTxtML4efB/Ib++M6Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758719277; c=relaxed/simple;
	bh=QdVtGcIHzrV0fUtoLR0+CcnCf0mmDqhn9O0HeNGf39c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y6KuV2qOCiDbs+/HbrQKM80wBZaYItEoJC0idg+M+SdWd9cxCpv27E8CePjFk++VMVXyoltXkySnPv1Dx2VRxk9nhaQbbjDfl7lWUSQALSQQpLnuVHwqG9HLyJ4dU0VPbCyh9ynOMYeI6ECMzC1qVOwtJpuu6oCPG0qdIfc7UHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=HdRPHjn4; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="HdRPHjn4"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b33d785db6fso78205866b.2
        for <imx@lists.linux.dev>; Wed, 24 Sep 2025 06:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758719274; x=1759324074; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APo2jYD1PxrHJsECEd/93gcKH2/sr0pgqf5id/Ryl2g=;
        b=HdRPHjn4DBOUZjnb72Gp1UCj10YjhgpQ6yCtg2IIVVIYgDB3BcdH5w18PAg2Eh87go
         UkkKw9yA0qI1DvSWxp1bC5e0lguGsmmZSbLMHQ3ZmUXRuUo+x5qcg9rW2FO0J03mn9fc
         fSQIuIfuYBiBCmRKE1SbCrKcqPF1Ar5K92tok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758719274; x=1759324074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APo2jYD1PxrHJsECEd/93gcKH2/sr0pgqf5id/Ryl2g=;
        b=d5hqjasKaw7vyDvF7AbO2SO4AyjQzwHM+bnvI/7vc6Qg5ZY8JtZCrG8aI8pCN57/82
         CePWZ3cwG3RSKaXx8XOlEu3L7J1R1z7HKEYEddEcDq77UE3esSSlXsEK7UFuOU8HT1QX
         O+Se0eAGC8uh+nnHTm6lKIdy+q9t0kmVejBDGoUwMXCnWgjjhUbkZVmno/vSt6I1LXuF
         hq1Cz1vXVzYfsQ9L5eyKswc9YKmgXKGW1jPY45SmUGfmakPfO9rfbE3oHGV0xIGLy31l
         SyhhxNLFvYRu9V6UG0orr5/VEHfo7ngj63TuJvL9e8G8OmBNmwM2WzSu1yOpLdysO5vw
         +p8A==
X-Forwarded-Encrypted: i=1; AJvYcCXG6Ona470d0ZuIijH0E/7GkYGqDxF0FrlhWcp4sG7TaDCW3d0k3zjIxRye4hSyeIcvA6A=@lists.linux.dev
X-Gm-Message-State: AOJu0YxkcnT3ODo/qaldGRaLlbt8B16S/78HExz5omRGjToOLq4aN1/1
	veS7SrKgniKayshtXIsXxAQ5dVgKZRBp92Y6+3lfLknrCGwmOMscd3j8bzItqRaMTt0=
X-Gm-Gg: ASbGncucTYHOK6h6zZNSuMsRFJr2wbqEm8KVPiNeLamllErFZ1MuXkJPo3zzAj65ydM
	AQgGZM5AvUkLDtr6DEoLQTI2JTw3a8y9RB+Wnp0nO5aBuyzykIJFamoVmy68lj6SxYqxbegxSOS
	R1dM6sSLkBL1ayQAUzPGtqTX91q4JoiS5uzdMiL8YVWE6lZTQr1s7cyW9JfVvdcO8DduUhOatfQ
	UDt5BK/4o63D4KKHlB5EsjD6p7039eVsPo6NqtO3onWXGQ2olh2ZrccPkOls9gGeN1z9suY5lrH
	ZWgcko3OKsAJhABn6jz0dX7nwRSDoA7zhvNKJ39INYZNkkBZ2vZGGnwBzJ1dpRVuijyj76X4JGy
	Aq9NyyUBvjNCiDZ34neLeFh9+0bJFnv5gwYutuTndYFSmznMsUIZhuWPCYNCqwlnA/uhcJjT3Jx
	2rE+XSEjhR+onEkeenyP/QfeSNaXopyjGEjn9BxXdM2uaD752cSZp3BzVOnxc=
X-Google-Smtp-Source: AGHT+IF67mD/mI0gnp/TuaWCgcn+3WEoNIAZH9oCfonzva0RaGE9yWAfNCRhfJo9YzLJalRUTsq/KQ==
X-Received: by 2002:a17:907:6e90:b0:b04:25e6:2dbe with SMTP id a640c23a62f3a-b302c1fff60mr622859266b.63.1758719273947;
        Wed, 24 Sep 2025 06:07:53 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fc5f382b0sm1574379866b.2.2025.09.24.06.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 06:07:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH 2/3] ARM: dts: imx28-amarula-rmm: add I2S audio
Date: Wed, 24 Sep 2025 15:07:45 +0200
Message-ID: <20250924130749.3012071-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924130749.3012071-1-dario.binacchi@amarulasolutions.com>
References: <20250924130749.3012071-1-dario.binacchi@amarulasolutions.com>
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
