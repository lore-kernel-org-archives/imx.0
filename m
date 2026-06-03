Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827E1481235
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 13:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492381; cv=none; b=j9gK8B/M3Czc7BbqAagDaIB9MdrhWr0/M8fSPbt4acI1qF1gqHcm5NiC8sbAansmGez6viwWmERQkA1VwfCKvC+Yagx65lsKgyvg4kZLRVXexi7wX9ORHYahUMWX5EgABZNif/PnesmZ0pLccMn/NWJTqdFlTgaNs4RK0x9OY1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492381; c=relaxed/simple;
	bh=WVscJC/fx1xSpj32I+N9plejP2D/twXwc+e6YBbMyOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nSHchBptolxxLehyVXvTHg2by9wX+TU7kxgFGZ/yYkQDdbV8YBXdO4/rx/AVfDx2U/7G/fyRlSkzxAdTP5O69iYYkDv+eIlMu0VSBJ66eOwVnX4yW0jZXuYBQ3u6eJGcMaW9F29Mp9Q5nblpHYcCMNQUMjfkhWhnZbB1qx4wa4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MtmvKSlL; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MtmvKSlL"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ebafde87cso8656996f8f.3
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 06:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492376; x=1781097176; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6L+XCOUCzdHOAi6HIhPFjvoFV9l5V9yicUXKuwNTGww=;
        b=MtmvKSlLHl0fNxeZF4W7nKYLtGvcEPjgUBe6LHhdRDBifDAzIrZ1mjDxnSM/eUITrJ
         Vzdb+UIBjrqYCUr/n7oRgy1USE+ifaycIj3+AzFO+Eg8kC4l1iiX00ns/GyT0+QVD82F
         Pk0yUykXLboXr2TdHjs6Vn68EtFxNF52ZaTgpHUzy08fNhkhMm1XEpsdbiINJ7mJ4hi0
         InUR5V2og4uGIUaduI+We/OIvQ15K6OWo20w8ZCV9TZxDWR2sAmnH8IqSrd+56x1o+Y6
         jbGVmlV9I8LjJ7555Qzi+tJ0FundCa+khebcZximR6dBroWDz67oEa8VSuRVBLYhjWNN
         tszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492376; x=1781097176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6L+XCOUCzdHOAi6HIhPFjvoFV9l5V9yicUXKuwNTGww=;
        b=Xa/TpDo3fXIwvG0M9HOMMt7EbVsvBaKb/DybF7ti9Vg1edUne8cUOp5izPaBweg5p2
         CMVSNV96oslFIipzeCKALW4d0S7nOZwkFxOKjr5aDAfLwKT83TrB6fU8lpRHW6HX4P3P
         UxCo8gW8TAJ1KTnqgYCgoNvLLXfBTAUD6bugUU2ryznbzr6F7k/d+Q8B30/yNYs9loXM
         StCqttaXo1S/RgFDwjTGxm1BYpKDyqBV/g1cxGUkVwx3GKqCKPl6OTGVkgm9uZ6N7Umx
         HEtme6zHMDak8PNfogoG+iuZTe8T3c0yzq8AiOvGx4uN/opt4fN8ptOp9C0T/nFCCrXW
         fDuQ==
X-Forwarded-Encrypted: i=1; AFNElJ8N4MpnFOGbOpDXmyeXHz8oySIYz7mz5ROdw96bX7eirRMjD6GoVlqykmFWVfRPsSaWle0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdjDJJy4PG0/g2S2URb1vqkIKJ1wBonSCCdpwRz0TGD/l7WJ0k
	qXilestPjki9XhjG4PURy9TZkxGQI1aZ47GjowbzDcVuWq4mPzVTupra
X-Gm-Gg: Acq92OGkb9K87O0GMXixR+LwYbwMn6rGIKX0x6bKno9b5OhcOnmE+GGq1IFAkpFALyg
	jWylWsn5n0184SK6nK7IPdTENqbHZ+lBxAXUy4K+AR1BSFe//tCCo9oKc13q5zv+5u6eufjFlwC
	4k15zKo4VH2t8P2eBXS+D6Y8eR0CQowcVCSNZDh7JhXII5HBcizWlAIV78UmYcRG8Cf2LZZ2X9x
	YzOxoh37yX1gfl0kFHZDxCC0Wjb7DZ1xYtCveuaMX40/qBh4sBaG+ReJcrWC44TFYTdt3hhLjbc
	7+u3LOZn4vu6bdQnNG27Pqd6bmHpL1m7IjteYkWm2XUKZqoRiRQl2WuVvEtX8ueNFPT5pr1NEfc
	KOo5hJDSumDfRY2JWGDHQWURrIOXUZqEEE1slKBIFjuv+6r73HTCM5Cwf/CEGmxTwbxKatEkhgP
	JCliY5T5zl0g6z5tK99k+02xK5kBeMDURzp0O8xDSnyTLVp221bKI2zMYUubYop7H+NkEGIX0Jp
	hlkDSzwO5W3VUsUcQ73Dqtxj8E6YTdGEb5t6vqXKWY3D+zS
X-Received: by 2002:a05:6000:4b11:b0:43b:5b25:67f8 with SMTP id ffacd0b85a97d-46021726505mr4743494f8f.20.1780492375917;
        Wed, 03 Jun 2026 06:12:55 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:12:55 -0700 (PDT)
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
Subject: [PATCH v2 02/12] arm64: dts: imx8mp-var-som-symphony: enable USB support
Date: Wed,  3 Jun 2026 15:12:40 +0200
Message-ID: <7d8b29b9a29b1976cafc3d279482012efae1a994.1780492180.git.stefano.r@variscite.com>
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

Enable the USB controllers on the Symphony carrier board.

Add the PTN5150 Type-C controller for USB role switching, enable the USB3
PHYs and controllers, configure the I2C bus used by the Type-C
controller, and set the first USB port in OTG mode and the second port
in host mode.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Update PTN5150 interrupt trigger type

 .../dts/freescale/imx8mp-var-som-symphony.dts | 80 ++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 25f707012f62..76928b005826 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -72,8 +72,11 @@ reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
 
 &i2c3 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
+	pinctrl-1 = <&pinctrl_i2c3_gpio>;
+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	/* GPIO expander */
@@ -95,6 +98,22 @@ usb3-sata-sel-hog {
 			line-name = "usb3_sata_sel";
 		};
 	};
+
+	/* USB Type-C Controller */
+	typec@3d {
+		compatible = "nxp,ptn5150";
+		reg = <0x3d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ptn5150>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <5 IRQ_TYPE_NONE>;
+
+		port {
+			typec_dr_sw: endpoint {
+				remote-endpoint = <&usb3_drd_sw>;
+			};
+		};
+	};
 };
 
 &snvs_pwrkey {
@@ -108,6 +127,52 @@ &uart2 {
 	status = "okay";
 };
 
+&usb3_0 {
+	status = "okay";
+};
+
+&usb3_1 {
+	status = "okay";
+};
+
+&usb_dwc3_0 {
+	adp-disable;
+	dr_mode = "otg";
+	hnp-disable;
+	snps,dis-u1-entry-quirk;
+	snps,dis-u2-entry-quirk;
+	srp-disable;
+	usb-role-switch;
+	status = "okay";
+
+	port {
+		usb3_drd_sw: endpoint {
+			remote-endpoint = <&typec_dr_sw>;
+		};
+	};
+};
+
+&usb_dwc3_1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usb3_phy0 {
+	fsl,phy-comp-dis-tune-percent = <115>;
+	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <33>;
+	fsl,phy-pcs-tx-swing-full-percent = <100>;
+	fsl,phy-tx-preemp-amp-tune-microamp = <1800>;
+	fsl,phy-tx-vboost-level-microvolt = <1156>;
+	fsl,phy-tx-vref-tune-percent = <122>;
+	status = "okay";
+};
+
+&usb3_phy1 {
+	fsl,phy-tx-preemp-amp-tune-microamp = <1800>;
+	fsl,phy-tx-vref-tune-percent = <116>;
+	status = "okay";
+};
+
 /* SD-card */
 &usdhc2 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -129,12 +194,25 @@ MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA                                 0x400001c2
 		>;
 	};
 
+	pinctrl_i2c3_gpio: i2c3gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C3_SCL__GPIO5_IO18				0x1c2
+			MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19				0x1c2
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                             0xc0
 		>;
 	};
 
+	pinctrl_ptn5150: ptn5150grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX                            0x40
-- 
2.47.3

