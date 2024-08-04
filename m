Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0BC20B04
	for <imx@lists.linux.dev>; Sun,  4 Aug 2024 22:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722809066; cv=none; b=J2nEzznFK2zkOShPtwktt0hJ1WTWd+nyAU+LzHCluPx6SDw03qBNP3mkSjjQM9+U6gKGhzBmkkHJteYNhll8sbtzRQZc8ZUgeXWhsz5M8KraXalJShSPoIlkT1FUL5/VBGg/9CaM16AGQZyuhlfvy+AyVIPh+EUIevFU9xtVAWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722809066; c=relaxed/simple;
	bh=z4wi75PNAboR2lxgQE3YdzgMCgupKn4VZ+ArK3acU9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kcuWLcM5aUZZe2mpedqCmtX959+uI1UeQl9S+c7bs5EW9heyMnvEILgr/XbmZ8AcruOUg6aOHuNU8VaEmOIZT8a3J0X/A+RMyiKzAlgyNvVlLG2dnLYeIPp7Ogz6sRgF2FiYS66NHU1yUCt6HOPtdujqpoyq8O2ZriUT3C4SW1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAYaKfuK; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAYaKfuK"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-39b3a4d2577so3109995ab.3
        for <imx@lists.linux.dev>; Sun, 04 Aug 2024 15:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722809064; x=1723413864; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8vmMJjRMQd17EzBs/h7XMs1fJdBitfgzTOE4U25Q4t0=;
        b=EAYaKfuK9IBar38A4bQRYc69H0y+R4MTI5zWR4zibLVEYAEuLP4ybwERXMkYikPYX4
         gpYX8HLG0aJ5vTzJwTVG8E8ZPD+5iHb1sMeSn4ztYyMuPdCChSxwYFyNWjPKuyBZLZUN
         LsemEfRRFHz1n4p1X83wx66WveSTPsaZiBq0wUpU/qt4+k3MVTkR+Ks+Jm786OeLq0Dn
         aTjpcamnuKC34vZp860pHGIyqVqcNT5+toJVpSSE2atV8d5Fic5KDLEzV5vROvtrT3pq
         MTby/EisZDW3ePMVzKTyRKI3iVNzwxTGImU4JBdB2jJPEa+zfjMqB6gmMsqz85mOPAlT
         Wvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722809064; x=1723413864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8vmMJjRMQd17EzBs/h7XMs1fJdBitfgzTOE4U25Q4t0=;
        b=GuwETlOjUHymOU4OuGhVLsqAWUl9scqgWJmJuVQRTgaLSZVtfaJRn7HUPkh3tYlQN+
         p8Qka1CpscTsfCVeVzgTqIvq3mJO3xDgJI097eIZiGg1VoyWkl8o1sFl5KPr9mzr+jtr
         xU1y4joi9854GA7XYYWmOvaCw64gdnee6AwaHyjBO928kZXWn6InYladviIrznKJ8dWp
         pET8mkM0k82aWbr5PbgMnfCRJ0vhyImfH3p9yaWsP7KbzPaoY6G+yAv1lKQ6x5LdRL4k
         rQx0BS4OoMdUeE5x75s9pRI5B34vM2v4ruX8B9yGjFBF9IS/yxQMh4kDYI/BgWcASKAd
         AUig==
X-Forwarded-Encrypted: i=1; AJvYcCVBuzgJfeKcmetdB2kBfYc7qNjh0m6aNZ4Vm8qcOKkIf8fx8aQt1jAV5K3QVKElWbfAtPgR0w+FdxMdLCYbBdxlfVNq
X-Gm-Message-State: AOJu0Ywdh2o37rYjPD8OHRQjXsK03Cyl+7Wg9FizHdVb35HXLASpho14
	FXHIZyl0QSlo6+WhqSK8uBRmk22mx5jJRsU2f/f0zlUmAlnX4K1Q
X-Google-Smtp-Source: AGHT+IGoccGsX8AZMUXX9KIyUx6+YwpekG7jw//dTqiyiehK3d9ozOQPa8v/xPF2Rnt7ED2EfEYV/A==
X-Received: by 2002:a05:6e02:1a81:b0:39a:ebcd:f2fa with SMTP id e9e14a558f8ab-39b1fc2641cmr147513735ab.20.1722809063798;
        Sun, 04 Aug 2024 15:04:23 -0700 (PDT)
Received: from aford-System-Version.lan ([2601:447:d002:5be:80e7:218c:9d07:360])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-39b3b7e6708sm7863495ab.36.2024.08.04.15.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 15:04:23 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8mp-beacon: Enable DW HDMI Bridge
Date: Sun,  4 Aug 2024 17:04:10 -0500
Message-ID: <20240804220411.180264-1-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a second HDMI connector on the baseboard which is routed
to the DW HDMI bridge through the PVI to the LCDIF3 and requires the
HDMI PHY to be enabled too.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
index cc9b81d46188..bd12420d9fd9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
@@ -105,6 +105,17 @@ hdmi_con: endpoint {
 		};
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector: endpoint {
+				remote-endpoint = <&hdmi_to_connector>;
+			};
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -282,6 +293,24 @@ usb-mux-hog {
 	};
 };
 
+&hdmi_tx {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hdmi>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			hdmi_to_connector:endpoint {
+				remote-endpoint = <&hdmi_connector>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
+};
+
 &i2c2 {
 	clock-frequency = <384000>;
 	pinctrl-names = "default";
@@ -344,6 +373,10 @@ pcieclk: clock-generator@68 {
 	};
 };
 
+&hdmi_pvi {
+	status = "okay";
+};
+
 &i2c3 {
 	/* Connected to USB Hub */
 	usb-typec@52 {
@@ -464,6 +497,10 @@ &lcdif1 {
 	status = "okay";
 };
 
+&lcdif3 {
+	status = "okay";
+};
+
 &micfil {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pdm>;
@@ -646,6 +683,15 @@ MX8MP_IOMUXC_SAI1_TXD7__GPIO4_IO19	0x140
 		>;
 	};
 
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x400001c2
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x400001c2
+			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD		0x40000010
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC		0x40000010
+		>;
+	};
+
 	pinctrl_i2c2: i2c2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL	0x400001c2
-- 
2.43.0

