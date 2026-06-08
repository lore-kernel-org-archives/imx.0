Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94463C6A57
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 10:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913388; cv=none; b=OCTeU9yHGmieeR1PjoKY0AP/D5jybcXSoknUU71EFDfv8Jhi5IHOkTCWfEbSOixll5uYDNwg3MMIPBGeVG9qBaZzdS6rgGSLfFPjXFUqUg+zlyL30vwYScg1EpHoTz8BlOn6jI4b/J4NahYwxCH2+6fMTO0LwBvvxBY8+rHi3Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913388; c=relaxed/simple;
	bh=cEy1pNl7O2tt2BrarZ2/uh+MSBB2N1Ka/KQ6+Aeqca4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EafafOI/sVer2yynAfwK3lj6zDCaIndTn6H+kFR7D9W715zbPKTUxcyCSEJZU/2VcvlO4LtXQwTKprsfoXiec6zgNdxMp1ZVtPW/Ypj2yRBOnNUdcYiZsdBjL45YpSLyjJSAvlcJ8DX3wXgERwvzEWzdAx0XxgqbhZUekMDDjBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JmeSrVU4; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JmeSrVU4"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4905529b933so44204545e9.0
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 03:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913385; x=1781518185; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgtnLKHSY2AVtPo+97MnJT2AA2h1V52oQfGIO76/OrU=;
        b=JmeSrVU4NB+RMdvfNucAlzuS+z/iYrMLVx/cWJCcLWLspWTG2hKJaUxoMvakKrE1WS
         pKjENfpvwTkMyWdQmyC+9TvN9JSrmPH/CeU1g0BKdOljvzchFcAkPJHcTkTqc3t+1ezS
         hboI8PKk1gejSJyt2LSloflBWkT/ViHZaCMrSc84TfsZTxcD3XkIvWyTdz1SYQXTDY5r
         9ubgZeX7pKZw8ks5Jk9LCOZ8rniMGyB3wiNZURjmrKIjyW6ysFT3IYLOtkeFCUGFgCtZ
         4NZlOl/4a8qNn+gBtx328kOiPR/a4X9/HEG8INL2+jxmnc3BVR01Q6PFrA/nuj5s7jrq
         59UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913385; x=1781518185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZgtnLKHSY2AVtPo+97MnJT2AA2h1V52oQfGIO76/OrU=;
        b=eQMovMQpj8JS1CvNH+kV/WJxjF7Qj9+xSgW3XvLTwWdYDkHcVm0r9MjrLHmebJmi8y
         JaUQ9YrYek6JlC9xlwEV4D+a0epL2QVcqQwl4rpqP+RntGwJQKP0dEpOYVBJpwGrHx72
         zJ+6665jnvc38KFKR2RIonO74xcpXm5abafDMkjY7Bx0hlxrwGnGeNfy3kXsbN9FCTxk
         n3rSEQSy7QkC26xEt/WPeMWHfkxx1QlpF/xR+LClDHUq7CjZqGOXOzZnyKWQtn/Z4EiE
         9i8ybY91DIxxss94kLPJ99+0uhuUYXr1H/9j5FdMeiaFkwPWRN2D4Wunic/2wh8lb/sd
         ibzw==
X-Forwarded-Encrypted: i=1; AFNElJ+OlaY9D54RL6HMJLl3YgJvJnNBeQ49dOdv5hkS6Sfx+8/pKQK4uvwCCJXYv/lNBAghH/s=@lists.linux.dev
X-Gm-Message-State: AOJu0YzmRNQU3cmp/A0vxXE5OtvZ0D1KzXMbh9eY/cb6IRCzOTXF5lDA
	+PBuiMYrp7uA0jYs5XQUEL6j3wEFUF70kPHfv3DpLjRzZQJFeS3H/ziS
X-Gm-Gg: Acq92OG0ptNnqwuAyQgrKavzaV4/81xrQqkru1tfzpn6Hc3TVhOHdzGYMdbi9iTjEv4
	xWLp5GD8aY5jkuW4Zn1l3WspnCu2pRZ/GeWa11tL+PeqqYB8xhPW+bRBgqnBUxbfy9YsbjHlw5c
	xBHel1EKnMWjcYyL7MeB6CyMZu2QI2zf0O6SXrAScE7HVRYXClEPCJlfEyarSPPD4jS7AjwLX9K
	DmDfBy8w6jQVSvJ9L7M1yVRZBha2iHvVoYO3dG32a+mv2HveIBWrU2ikicoKkoqxcYSCSM+JC+T
	5ktyGdieN/Y+VLGX3ur2OYO3hS3TnDyVRH/Q8kWEO3Z6U3wnen9nBg9+Sy4h+oXNi3h/Ca9aUPl
	WZbdBuZoGPl5ufq09BAgdNbvynBWtyrIS3nYTOrcZZpx/DOgoXHXPN1DoxUasJwBOW5R+++GPH1
	7V/wE+LrtjIuIZG0vMCGVnmHSHd37ydRq0yA6IEVfnyIAmR8xtcxwpObK6nEjqCdJTboQ/qMfvj
	qD3Ky5B1K+FcpLqNiK6JuEjvcStNW+ka/vwEkIM1lPlzEjoNdO+DDAZx+E=
X-Received: by 2002:a05:600c:3551:b0:490:6237:521b with SMTP id 5b1f17b1804b1-490c25cc5c2mr241349195e9.27.1780913384743;
        Mon, 08 Jun 2026 03:09:44 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:44 -0700 (PDT)
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
Subject: [PATCH v4 07/14] arm64: dts: imx8mp-var-som-symphony: add HDMI support
Date: Mon,  8 Jun 2026 12:09:25 +0200
Message-ID: <2ee49ad6bf9313d00e64d74128399e45ad4f519c.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
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
index a2becf5409cf..f27ba602c743 100644
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

