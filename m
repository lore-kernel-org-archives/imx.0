Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C59481670
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 13:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492388; cv=none; b=sujmqtc4AvhEsPE63WOvn8MWRRXYsoNBPDo71IDDsediufjKwq4Tvyj8kQRYwIYypd4Yqapu8BjqZXF2vYIls4LWfe6z8vwzPF8JQg4yc8EGhYwC/4zRnltYL271gGp9Fj5NJZkwg9tANT9Rg1syqLCw5bcXf1TgNd79u7uajPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492388; c=relaxed/simple;
	bh=0mBB7Nmgdb9DHOrwSylsGjr/VAlcq02PlWCpkRtemKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G6+WDZiKIeYIy+pq/h5UBthaKjqHK2N/ceyCduihHz7qKVLkkyO0dd9KSkdZZI5cMnVCsTEB3KnQWD9csVeDEFaY6aGT5R+YTXfTRrBTmnx5lmoWW2JU+0+fjuuZNg/JX9k/X9kDbytaXBabBTxqWBPbzqdpO0B3KyEOATu9mu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMl6XjEU; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMl6XjEU"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45eedc94d37so3400733f8f.3
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 06:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492381; x=1781097181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvJmI32sOXVJLiEf+jgSSaHeJ/NqIU3qMVlXDmBqCbM=;
        b=bMl6XjEUHlIAZoivVCt4sMtEtQzBX30vJD9zicb2h4iAZdZ3zjp3mGERQFpswV3MDx
         cZrrCRYHlqU9df1faP+UJoht36eQApKAgaX1YNt2PUFF1/hwEyToZfBZdPfQwyJ/UyvC
         I9dzmqAmxicdxUw/dwR6HHb39OI6GKDuLx1888aT1+sz8Hd1DjbwAOqHFhxS/qKNQQel
         7RsR/k6dkfnvAiTTdVw/gvEYem1HcPTfIntKUALpDtSk25QNs6tYDQ3OxyVJ3FScq+UT
         s7rrzgAyUYNlKwFFOVhVUnx2ODD6n6gN0zLAn+zLAKB1IDzACCIaf0fhB9UZ1W2ynjv5
         eRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492381; x=1781097181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MvJmI32sOXVJLiEf+jgSSaHeJ/NqIU3qMVlXDmBqCbM=;
        b=Wn+78INwFyCegP9JZWh5CESKew4e0cKUDdcGOIvhzZo1fzc3v4tCtdEmVKA4HHH2de
         J6wta73quHPJq8u/8ZUBn+GdVPQ5nxXKorIoMcob8HPyf5lf0UseS/vVM6btthFIotP1
         8XnmiRDIObWPw+JaDecDDRLYm4rlS096SkPzz47gnOOQEYtkX1Q8jHgqXkorp9Q2g0zA
         dy2KDVAbF5QyUxqkovmKRWnH1fn6llykt3bqKsr5SH/NUKjHdOboaVlEvQwE5l8HjqfH
         6HlO+vnRKY7IzIJRdzSlVsBfCZ4T0vLbZ4dxN+M596F21zSBzKTtePz41rIQPsW6Jzr6
         xAlA==
X-Forwarded-Encrypted: i=1; AFNElJ/7dB3tS0e6vi+WNwIaPcN1pL2gpLGRlrV7IQNg2XoZwMsKefxF+1g9E6cbsdkpSh7w0LY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3ezc+xkmVbqb8u1FkNJHkKEcGL64oq/iH94rZs6qTsoi0jtLk
	jQRCzoVjCnoGlaVw05C/UqtnJUxj1WcHmuEkf2szu5sZLriTxWUskL0G
X-Gm-Gg: Acq92OG9KL0aYmBPW53gZkfg4QMpmuPN5wuQdPiSPbf1iTdzQYr/qb9lmRLruVTsAPw
	aIrNmkEZ1LFqiP3MSuYQBwS0wFNdHBZ1BUp0SjIMMtq5EGqe3eBumxk+HKPOLkiiHOdLl6VAJhE
	xtFLmNIvvkihhO6znmGnBfRMD03pIRbAB/UWKGbRldcMVQq1hS8pk0On/j3Sb+AynCdqYng2n6X
	0VtU8ce5a5K6hDTcT/H2J0dpsKgC9GiimPcffUjcuh2gpYKF+IpBGRBSxlST04/GwN5Cz7kl694
	3PeDLnXxtfJ9h6DBhCvLgaeaamNgpsYFEyzPR+AUjCe+5PtyQNEY8DtS+IZC7uZFGV0XabCDPFQ
	UNOkojstIetML+1i+lE5q6qpeLZ12sBiKBBCIpUICRb4hDU9hd7IfEV9E7xns176+EahtDskAtk
	MAxKoJ5LqQhI8/8nfJa20RA6imiV1QGBeI3VZT2jumxv2n/mZ3voDXI+mTW+NMuxQFvo/6oAKim
	/wL38488QBfTPy8XUMaGoxPvVpmAYB9T1geZ6p4qZPcIxK0
X-Received: by 2002:a5d:5702:0:b0:43d:775b:c9bd with SMTP id ffacd0b85a97d-460217a6ff6mr3663164f8f.10.1780492380895;
        Wed, 03 Jun 2026 06:13:00 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:13:00 -0700 (PDT)
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
Subject: [PATCH v2 07/12] arm64: dts: imx8mp-var-som-symphony: add HDMI support
Date: Wed,  3 Jun 2026 15:12:45 +0200
Message-ID: <44c0b8b81ee16d0a47f4745428bca54497f993ac.1780492180.git.stefano.r@variscite.com>
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

Enable the HDMI display pipeline and HDMI audio support on the Symphony
carrier board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Add missing HDMI pinctrl configuration
 - Enable LCDIF3 for the HDMI display pipeline

 .../dts/freescale/imx8mp-var-som-symphony.dts | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index a928dc2d9adc..4d8791886a78 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -48,6 +48,18 @@ led-0 {
 		};
 	};
 
+	native-hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "HDMI OUT";
+		type = "a";
+
+		port {
+			hdmi_in: endpoint {
+				remote-endpoint = <&hdmi_tx_out>;
+			};
+		};
+	};
+
 	pcie0_refclk: pcie0-refclk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -74,6 +86,43 @@ reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
 		states = <3300000 0x0 1800000 0x1>;
 		vin-supply = <&ldo5>;
 	};
+
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		model = "audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+	};
+};
+
+&aud2htx {
+	status = "okay";
+};
+
+&hdmi_pai {
+	status = "okay";
+};
+
+&hdmi_pvi {
+	status = "okay";
+};
+
+&hdmi_tx {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hdmi>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			hdmi_tx_out: endpoint {
+				remote-endpoint = <&hdmi_in>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
 };
 
 &i2c3 {
@@ -152,6 +201,10 @@ rtc@68 {
 	};
 };
 
+&lcdif3 {
+	status = "okay";
+};
+
 &pcie {
 	status = "okay";
 };
@@ -252,6 +305,14 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA			0x1c2
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC				0x10
+		>;
+	};
+
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL                                 0x400001c2
-- 
2.47.3

