Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7186330FC10
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 16:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761581453; cv=none; b=KdJlygjuKB3Th3cgvueCmHPPjL/+yppIuKyuMnAONMjWY1oSQPgyFHxzsdlciqz39LL5KuEqdKiWtTE3hud20HHKft1oj3W0sBWjW7RZD4IhWMyMTJe9/FJaTg0ftU1a7+lH+oJVgGOyq77UHhRSV+S/hOFIjDcKkdQIHAsdmM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761581453; c=relaxed/simple;
	bh=q0KsMgAElv0vgdV5eooiTkRZl79F0ej2oBY71GeUUCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k+vki7D59T2gmSw63XNxWJRLHifJOulTmdKmzXomXiS4cwCoZprUGQ0I43nijh4Vy0YW1UvLsMGii24IWsxe+KHWz+idoZRF1AdcDinULHGD6BCmKIkGiqW4R8SzcthtpUoZMuLQUYVxOajCPIK34gNArkdaExSFRFgtZfokkAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=YpAvPu6c; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="YpAvPu6c"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b6d53684cfdso1087720366b.0
        for <imx@lists.linux.dev>; Mon, 27 Oct 2025 09:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1761581449; x=1762186249; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Veu3Rsq4FjpOJipbhAFeCCYDWDFK0CBkfMfLFx9DhXQ=;
        b=YpAvPu6c8fKzDiNXy+xLpYOr+Evll6ADhcS8N2FLkE+34hc5Hi8cj9fvYk8B0VGED/
         DcKEncr1OJRVtYJARPd/E4KneYedntfMBW7/Czp5W9fKsRmkRA7vFdZKqttZOCwMzyTe
         HAHODkl5kMnukY2lAgyXXi9QZ4U+X5zElnQFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761581449; x=1762186249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Veu3Rsq4FjpOJipbhAFeCCYDWDFK0CBkfMfLFx9DhXQ=;
        b=SmElS47YOnGNYm2kPHx71lUC37W+Uqd7MEnxy0ToeR1I/eAJq5ltEsKiens8lhkAVh
         LjSO34SutNbpG5MhH/mstCK5WlcjLztBrqtJK7qbEiKYvxTHepFOpMO6+WnDL6vW7U3C
         5FAo6cIIgK4848vXLAn2nz3fIbeAyOUCgsR7EvDMbFVv5WnSVrkPWoWBgtBUqjI7rfjw
         7DwtOk5e3r/LTZ7VklAWiu4rvJNeCzXJchJ4fMOLWUT661Sl+ahBABLrVQGSkmWirK6M
         FDwOo4hY5d8FSY29jup8lBjw9xhn9KfM+k/H8Pe9MhYVhNqD0SvbdJskBP2qMWGvkZX1
         JQJg==
X-Forwarded-Encrypted: i=1; AJvYcCV6UdqcoLcXHpkV41YlRFoD+7WMuV8irV5ED/kAcdzRRh4WeCjIsBMm+kIsD+gukK4prvc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxE3xeXhUbgyPhp18FO4F/DOR0w/WLuZxOPn65Frpq9E3K6D9GT
	XktnVC/XCFpNqPyuO8SHvoYAHcz+TcnElFe7PlKwZBXFbSsKxOzzBoqWeaDCFEFMlWw=
X-Gm-Gg: ASbGnctBTpACygNoeiteBW/8mz7vEMj9mERfUlUSg9/AiazciTbq9ZPGkL4BBhVUKOn
	dWLDSDMiZc9vMUKtD6pKDqobQXiknYEWjJphzMZ4PwqvPOZWLkjp8twz4KsOkHO/aJ0UFVkNNAQ
	YaPT7y2t7I9QW1ZBwxulQtDNUV24oeM3cAzG39qbuIvduDemBL6a0e8kdMMkX3UHLWXmukuPo5F
	X7EwvKVICxGh7e2USqslT2i3ZJ0rey/fkI7zRoyPcNVCmjT5FGHm2iMJbrmI+Gtpz2yC4+t6FJi
	dMgarxGll1rSenkrf1MhB7Jh2zBSgsKK3XQ+B+iiqKsjwgF++IFPLKfEhdREXyCwHYKlhRayE6b
	9D6TN2Wlw+Hdq4HNPQzHo0lc08t4WX4v2n6z1ZVyvM4T39f/SZKCw7LZFBCUiSPffhh2WmrcdAD
	MM/xg+O/Mtwku8QycKjbckJULaopIpgCLGV90Gdzh7LaHQpDU3hpaU41pOyCLQnctgkKegjfNWp
	gPAsh0aM6dVM2flv0c8Pm0QAC169xbXl3iqOV1MpOgm20+/f7NBjt8=
X-Google-Smtp-Source: AGHT+IHNVBcPF4r1uhIP+zj56hLjLDUq4AexzJeI5WwqZEYSfzmRjyop2h3ZCez24VELoNyVU95XiQ==
X-Received: by 2002:a17:907:86a0:b0:b0b:f228:25a with SMTP id a640c23a62f3a-b6dba5f0b7cmr39405266b.64.1761581448554;
        Mon, 27 Oct 2025 09:10:48 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-50-34-170.retail.telecomitalia.it. [82.50.34.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8ceeaffasm742437466b.45.2025.10.27.09.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 09:10:48 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Mark Brown <broonie@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
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
Subject: [PATCH v2 1/2] ARM: dts: imx28-amarula-rmm: add I2S audio
Date: Mon, 27 Oct 2025 17:10:23 +0100
Message-ID: <20251027161040.2020623-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
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

Changes in v2:
- Rename the codec node to audio-codec@18
- Drop an unnecessary newline

 .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts b/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
index af59211842fb..ddb64f3d0471 100644
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
@@ -154,6 +177,19 @@ &i2c0 {
 	pinctrl-0 = <&i2c0_pins_a>;
 	status = "okay";
 
+	tlv320aic3x: audio-codec@18 {
+		compatible = "ti,tlv320aic3x";
+		pinctrl-names = "default";
+		pinctrl-0 = <&tlv320aic3x_pins>;
+		reg = <0x18>;
+		reset-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		DVDD-supply = <&reg_1v8>;
+		IOVDD-supply = <&reg_3v3>;
+		AVDD-supply = <&reg_3v3>;
+		DRVDD-supply = <&reg_3v3>;
+	};
+
 	touchscreen: touchscreen@38 {
 		compatible = "edt,edt-ft5306";
 		reg = <0x38>;
@@ -246,6 +282,14 @@ MX28_PAD_PWM1__GPIO_3_17
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
@@ -269,6 +313,12 @@ &pwm {
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

base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
branch: imx28-amarula-rmm-audio
