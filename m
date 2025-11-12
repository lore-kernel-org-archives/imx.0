Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52193451BF
	for <imx@lists.linux.dev>; Wed, 12 Nov 2025 17:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762967913; cv=none; b=RzZnrJF5f+7Z8g5R3wv3MJR8MUTpI/E3vZi4OhrKEV7M78Apd9Aq75Y3Vs0iGUqan9+2B+zmq0o7oqdHdoWViBI9XL4/RGIz0QcrlcIuM96ctLcQpPhIeOBiSAdpQ2a20GYqMIBG0NLzuIGuqwFteMSSIhRoGijICWPHFLuODpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762967913; c=relaxed/simple;
	bh=ks+sEAj6GQVaXnYu8XaFbXtzxs88Lg0JjUVI5fWnGOE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CsBys+DI/oMoJuUXlrDIzFvrmrmnFC76FMsMivFKQobhgQY0KXjPZI/vsDSeIa/4hkUUj4mJVCUpG+UZVkgDPU6d9dyv+V2Fr3X7DaWF38EEE+nnOtJbflKyCfN77BXuQpxDwlN1rMOj60rhWetKf69QVLEdN/hfnPXdUA0CNno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=UXjKU65d; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="UXjKU65d"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64180bd67b7so1497098a12.0
        for <imx@lists.linux.dev>; Wed, 12 Nov 2025 09:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1762967909; x=1763572709; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5BwUXFYlbD6N53XtEJgB9mVWjzWl6gDwebbOYaZsPHA=;
        b=UXjKU65ddb4dnmX2ZaNyGLVcQ/sdJpUF+7JCazoYf7OnW/aX6f+NbV78/6CzCvgO8g
         nlZPsqZQqSalBhN9kNk9bhE7WG74BIHm5Q9mRdko5yTrlwR9g9ow/cbk8cy/RDn3pBZs
         MNfzwrN3l9hcNqK0OtumNv39k7WwcvCgPqYi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762967909; x=1763572709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BwUXFYlbD6N53XtEJgB9mVWjzWl6gDwebbOYaZsPHA=;
        b=o3AA7F3e5mGORKhOIkG0FYlNxL5lOhzsn4VU8FfEOv9k+nVAmeJ6g4UrvXRwDqQ8TQ
         02Z4Txwv1G3qsW0lfjet59M9Cv+CIaLcuXyo4Q/L7YfoQn6FMHJ75bSprH7RchwjYiDV
         1yj0ZDeRiHLCwVRkRzf93YOW/p2Qe4OULK3v7TraITkSo3prhqH2TmLJxkv0nj3cub2o
         g0AhLvTLtE0GmbOXRf1YONAeCOPpDgxeYJS3snGLBEe3kC7FyCUc8yxsbyQ610q9e6pT
         DnlHbMExT+MwJ/eZdCLJp9sQQ12m3yz502tv5m7t5M4hV8RrVpTHYRRA+7R3sXBanf0R
         AbIA==
X-Forwarded-Encrypted: i=1; AJvYcCUhf0u3TxniO1++8TZzNfjrpvT8bTeDx/QDfT1YfWwaJjKp55lI9wYcykE/lnEBS6nUoJQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMDk+JPWIHReQY14tHvxIpr042bibrTUYy+uFbQx2s/G5og9qg
	ic2AWIpc+ftMIcUH/olqqt2YRWdmYRkmizjYofRgxN/nP/XxMXjdb9srKLY1sa7GgaE=
X-Gm-Gg: ASbGncvt5n1rPH1FF8ST/mamfjsztjNDfdXM8XObc7/tr+wxNFndYUwiAN2krGER1vb
	AIl6QZnSc8fMy+1ewb1rqTAhVl6AQv2YzymP4mGu0aZoBBILWn/xOvwBYQxWMO+HbOZIXCJmTLt
	/0fg5KRnHCjIgNc1ivP3NTqbAHyrEPa8DmdaqFGKrt9TcuYd6uI3d+EAffExRrn7+OtX4/uV6xr
	vKdyYLVhV2Pr/bnPGedDYzorC3IJ58odIg+SHGw6OovRj2rRLl6yQYrSrXCgcYzwbC4DPSr6+KJ
	aOUYhAwNOsK9YoC7xzE2caUHpXth0rioPBt4X4x6e425tfdtUwPReVkoGv+421WXVMxQTzM6Bxl
	O6fNxSrQfBgHonQ6/7rGxR36gs8YSCrxcpd65YVIMu2TDmpWZjghKfBzw2OvQvjkpGnNxKJLSHA
	D9QQjryzW/XRAQpQH3nPY62ho1lcuO+kpIe6WfbYoyFIZOpsKEcrFvXjYbI0dhVsOBg+KBPAhSd
	6/d3nNflWncBYUTv9oxMF8ZXbOMJ9jvfHr5bVNEQHn3
X-Google-Smtp-Source: AGHT+IGY2/902SKJFzIS3Gu24NoIxJSLCSqdXyB/GpWGp3CPdaOhQYc9wwsjQIgb8wLhfnUpqSpx5w==
X-Received: by 2002:a17:907:6d0d:b0:b70:b5b9:1f82 with SMTP id a640c23a62f3a-b7331a6ef31mr445484266b.31.1762967909196;
        Wed, 12 Nov 2025 09:18:29 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-71-163.retail.telecomitalia.it. [79.54.71.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b73381dd3besm180731866b.43.2025.11.12.09.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 09:18:28 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [RESEND PATCH v2 1/2] ARM: dts: imx28-amarula-rmm: add I2S audio
Date: Wed, 12 Nov 2025 18:17:12 +0100
Message-ID: <20251112171820.4046537-1-dario.binacchi@amarulasolutions.com>
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

base-commit: 24172e0d79900908cf5ebf366600616d29c9b417
branch: imx28-amarula-rmm-audio
