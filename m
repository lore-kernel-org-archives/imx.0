Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719773CD8C1
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 14:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929694; cv=none; b=Mfb8dxIbcTrP0bs0GaikhA/Y01mYq/gdA679e5uJXCKyW/AG5C+h6es15XIi4sZoVR4Xl7wQ+KL9OKXNl1CZ6kC4LkykScu2I8Klp7Yo7tsjACaWWKr6Hxfy/t2mhoapdOZrRyVDZCSEUhSZ4HXOvAQBqPXu9udZIDp1CQIsR2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929694; c=relaxed/simple;
	bh=JgfDiFgKLf+4MiKTXk6cHADRjszHUEvVwoMpC6ok5NI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QGwoIJ7CB3/E7o0l7g9CrZT7lyDw7z1tDnO86ispOuBPdwqQLBHQgd8yIJEJvPcUGr+l8TvDLSzYNlAN1TGXDzj7BTpEBkL398vKFbY06W0YlJmGq/35IwErrbUyg/VTcxTgG5ml/kX6bPwWKvSnATRx47WIdukWsQFUsc05WpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JxleIdW2; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxleIdW2"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45efb698ef2so2023296f8f.3
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 07:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929691; x=1781534491; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGTKa5ZDbrqE8PBt++HRT37Y2HMbYqrX7rou7DzMfEk=;
        b=JxleIdW2oU8O3HVnG0jdUeKNQXTKyqn30YNmHlhnRrspx+2usGVc048lSHFQGcp0Gg
         W3O8oerkUiBv5abkC4h9YoA3Vbn36eGp3ZEu9uJ87uA5+IdiP0kl35pDkrGO/FcOC18h
         35Gcf/vblg3yHiJFASX/mmZQsdPmmRlK0HjNXz1bo8x6acFwB1EWYiIPgi4mjT/Eexy0
         rZkxeZieYEhXNoRfkiUjKLQUVXGWN5zMWcow2+rA56d7jKAcmXdoPfevA9dcTKR53K0a
         FGckffLq8xI03t+FUecDkBC2Pun3jzBJT0HrubtL6rNa3kBKR4g/pmWRU9a7ZVEr6JJR
         J7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929691; x=1781534491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jGTKa5ZDbrqE8PBt++HRT37Y2HMbYqrX7rou7DzMfEk=;
        b=SdV5BucW5iTGh5V//gaxcs+za3mbny/NPucrFQvEvICCc8NbP5xLrHZcWI/KREOVug
         d0joPwn8zlvjL4VKEc/S0IDcRxiq3UBbtz1d1j5fta0vGfhnSfcDcIOsjz4EL6tqVeZg
         Dw/Ttu6XqJsTsnkgbxz80rX4dUBhFAdHgymBI6WD9ZKEovzQ5y57pMc+JkATwol+xsx2
         /fOoOCnD/fRWy24OZTQPz1F03uSFNaqccVobWHVpFtsPl0SZYWKMU7KOifMxkmmESt+e
         Cy7rrydqtcbth8XUG3qShAtxIebaiWxOFJYsHKyuJTxGRi1FvSclXOQiV5XvOHM16E0K
         KY9A==
X-Forwarded-Encrypted: i=1; AFNElJ9UKSgg2vPQ9U8v6eShze2Sa5rqbdnjNdyvgbxMr7uSyfEA4HMNiPYfgIk5y0bjV1y1Wx8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyLU99c+1XF+76hCFAe+6BeNYsMUWB+0jZole+cNVnp5PHz0ZQZ
	q2HhYCoRPyZto6seMcz3VFxz0ViALwUlYG8pCwXWQP1PyHL9gq4/YdX/
X-Gm-Gg: Acq92OHDraqTOBzqAdXheHQsnJzy1kQlwtVYu1T1tkFcfibYCxFl+tAl6kmAb3YT2bR
	GUW/RIz3C9S8z7LDjg/5OAj7LrxDR21R+n/H9J7Fg4SxVyDTL4ZV0p08NZVA+5+tMdq6Md9OhNx
	nFPPZKQkQJQYYg7Pu0tJzbN7yd+erzjNT8td8IUcg7ATQS9xQ/wot4SY+dSaGkno1ZUGXn0HBiA
	J8JyrtBJY/9KaTnGzJjd8/zFzCxgZKZ1gUqt0/yDl0My+AABsCnAEMWs5GVO9d9hoCHiOikTcER
	mclXiEQXNfOPXrZRiyec4zDVlaXV+dg7vptD3LSCXZTpNo0fZqYuDsDQRkuhiTpwHsoYi6lPHvo
	NATmmahVc1rUi6GxFxEEhBo+mtx8SKVYpamYQyd4Kk2kOrvQIBMU6KB6LNhwMqC9PyHfcJRyPTG
	OOEpw63t91JDuMedfvZNo51t3pPQsK07aOSi6iuNbRXbqZbhV1NCrDWLq8rpHFXAKAcjrhqIhVt
	HU0SW1cabXlMvUIg7hH+TpASCudnPVK3I92mu5Bc8EOmmvy
X-Received: by 2002:adf:fcc6:0:b0:45e:8866:e58d with SMTP id ffacd0b85a97d-460302ed4c7mr17961168f8f.11.1780929690742;
        Mon, 08 Jun 2026 07:41:30 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:30 -0700 (PDT)
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
Subject: [PATCH v5 07/14] arm64: dts: imx8mp-var-som-symphony: add HDMI support
Date: Mon,  8 Jun 2026 16:41:08 +0200
Message-ID: <173d32d3a4e28fa3c7678b1e2566d9da3a477488.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
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
v4->v5:
 - 

v3->v4:
 - Add HDMI HPD support

v2->v3:
 - 

v1->v2:
 - Add missing HDMI pinctrl configuration
 - Enable LCDIF3 for the HDMI display pipeline

 .../dts/freescale/imx8mp-var-som-symphony.dts | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 698f02fc39a5..0beaee5f81c9 100644
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
 	reset-gpios = <&pcal6408 1 GPIO_ACTIVE_LOW>;
 	status = "okay";
@@ -253,6 +306,15 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA			0x1c2
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC				0x10
+			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD				0x10
+		>;
+	};
+
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL                                 0x400001c2
-- 
2.47.3

