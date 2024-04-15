Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9417D5FDA5
	for <imx@lists.linux.dev>; Mon, 15 Apr 2024 11:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713181312; cv=none; b=LbbWgXJQca6IQjp3cJ5wRXFeJvTYDzIzdvGyyRBIjso36Xwvh6bmaLRAnPuKNdpBmxWCZgoyiZwB8khkyTsfFN7DK8PLY0kVPDJYrMp7rG1tcFy+CoqULVRD+8u0gcGjHccX/EadNqJlZwXn2VQy0X8Tgyj433xzNJMrNQOxMag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713181312; c=relaxed/simple;
	bh=8ijqCKcYyYvTtDhSZWtqXztHlBsveRSY/hhsB8MOag0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e+RT2j7Jwg463hGnsxVPkO+f7l7zZK0Vx76HF9LQe+UjbflK26hotkZfUUpwm7z0vBSG8h+h5OB4wIRwpFstzJ+3E+1MZkS3gKlqMradSvmipdJ6dNK8JVZQ86RN9Nb0ORzviiBMz+d3x8pvFBmq3qz7s03uEeqD2PFEpTQ26DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=I4ufWz8b; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="I4ufWz8b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713181309;
	bh=8ijqCKcYyYvTtDhSZWtqXztHlBsveRSY/hhsB8MOag0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I4ufWz8bIPkjqFBQ8XKs+iDetdz5u45YOXv7V13FggXorOQ92lK3Pyl4N+4xvAuji
	 uvRTcJ6kczJNLGNFNVHoXx9ejaQbLvwlnkZCNDQw8ctTjSLyOqf4TBfVjIcFCM6UI+
	 mEG6+vfJmewkqL6TTXRLWuGR03q02fzMs5jpNhs/AIP8jtMKJ1sxBn7ASMi1RZW113
	 Sp00FIXt4Ts48GSKSljfYB9YhbaVAd3X4QUXVJLla6PuyCEwOW2qfnqjCrlweLQKtt
	 ICq892QbTlGIf9zHlqMeYEDmJTnt+5j8K/rxft/8EZhg7uWDfBmehWxk3743igw2cN
	 l51Jr5SpCwOSw==
Received: from obbardc-t14.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: obbardc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3EC6F378201A;
	Mon, 15 Apr 2024 11:41:48 +0000 (UTC)
From: Christopher Obbard <chris.obbard@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	kernel@collabora.com,
	Christopher Obbard <chris.obbard@collabora.com>,
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
Subject: [PATCH v1 1/1] arm64: dts: imx8mp-debix-model-a: Add HDMI output support
Date: Mon, 15 Apr 2024 12:41:27 +0100
Message-ID: <20240415114135.25473-2-chris.obbard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240415114135.25473-1-chris.obbard@collabora.com>
References: <20240415114135.25473-1-chris.obbard@collabora.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the HDMI output on the Debix Model A SBC, using the HDMI encoder
present in the i.MX8MP SoC.

Signed-off-by: Christopher Obbard <chris.obbard@collabora.com>
---

 .../dts/freescale/imx8mp-debix-model-a.dts    | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
index 2c19766ebf09..29529c2ecac9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
@@ -20,6 +20,18 @@ chosen {
 		stdout-path = &uart2;
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_tx_out>;
+			};
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -94,6 +106,28 @@ ethphy0: ethernet-phy@0 { /* RTL8211E */
 	};
 };
 
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
+				remote-endpoint = <&hdmi_connector_in>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
+};
+
 &i2c1 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
@@ -241,6 +275,10 @@ &i2c6 {
 	status = "okay";
 };
 
+&lcdif3 {
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -358,6 +396,15 @@ MX8MP_IOMUXC_NAND_READY_B__GPIO3_IO16				0x19
 		>;
 	};
 
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x400001c3
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA			0x400001c3
+			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD				0x40000019
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC				0x40000019
+		>;
+	};
+
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL					0x400001c2
-- 
2.43.0

