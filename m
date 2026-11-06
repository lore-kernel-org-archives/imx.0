Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793970025;
	b=PgkiSBH0mWPjgbJCOGZ5okPKeyjx9R+3Y/fpcgAgCZDc/qHwYnf55VmeNYgasJmFp+pL
	 V1ww3LcTsfzf+t6ZceeWzeuBNjI4ypSiyd0V+ka6X37upxDjuaNEX9bWOdA2oZMl5hq97
	 i37H7KYay0GmyVWWv3ndgoR/DuLzjw0/vyCRHvF163m2bvHNz7UoyD4lQYbH0iBJXTM4Y
	 RT4WgSEo6HgeDPgQ9G2dEjm9TbN4z7LoIei7q2mGWpeKX/7espG85LwYFYqLSUmmhBT4E
	 p5Zpph4/SntRlV00IQo+woPjVTDshsJlWSiYgsElDqCwCiwT07T5fIIbYqwGjUc/2MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=NTm2q5CE9vxYpIg+R5qLU7TfFksBO/ab0fXIHYsQ1No=;
	b=CkHcElMzjKeLdiQdXIhDctim3af/7k0AWLwjI16rbSrdlAD2eYwLTZQCkjSTjaRC3B2N
	 97JhWWKXa4q62SvhJP1ALGVPaeQZidWiTeIBO8xV0k4p/vO6jrJYQR+bDDg+SzBF6zcFq
	 timuidPJHp9NyhOv0ET7XKy/+HLXDLUCWT20HDLnZ27HFo5zofUtie+FiMWjt1jWUtcGd
	 W+xk/ngoOr5jYDBFVW575sOYnd9H1FQ2eCMnPZ98cKJZEZ2Z1P1NE3oLqcg/vu7DqXRj0
	 6BTvTK/RGPEYY99M5YpHa+Am+LbtZuQmSmorO63jwzzAOPRBXM2QowG3DlclKAs92sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NGr1uLLp;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524E2606A32E
	for <imx@lists.linux.dev>; Fri,  6 Nov 2026 13:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 524E2606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NGr1uLLp
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-491846221ffso514289f8f.3
        for <imx@lists.linux.dev>; Fri, 06 Nov 2026 05:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793970022; x=1794574822; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NTm2q5CE9vxYpIg+R5qLU7TfFksBO/ab0fXIHYsQ1No=;
        b=NGr1uLLpdev+fcvO6hmhh+0wmGRhnl5892sS8VY51B4iZAu0GPy1pmc13fpdPIWRIu
         /uUbkDtKVKY3trN4NKgadcotoF6GqfBVGeqy9zFMSW3WjvNDDv4KiW1Z8YlWPup8bzK1
         2QmZ/itrAXKCs2FNOviVjMH5xqWx0/yPAp5JoSMEyFMi4Rwy/h8IDSPIGPz/W6aKgrty
         5siTTL9VbARGggPxcv/Iab6fdHswksotD2eZ8nNccMRfI21/vLetFsfPTG6DzAFh2bn7
         IOATanTEvNS0nxGDfcuxFupSAr4yErPySg+vmkcP9GTXbhvUdQEOepeXRqESHJodaf3r
         JOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793970022; x=1794574822;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NTm2q5CE9vxYpIg+R5qLU7TfFksBO/ab0fXIHYsQ1No=;
        b=UJULTUhnlwLr8VJo7Voin60UR9MuJTXNM16LDATO1XFL3zVi7UkIYnJomEXFIJvV2q
         nGlhFySB6EknWK+4rEUGbn3x12vjOuq7Sm4bk2jFUNckdxFVDNEXhG1PCDArHuap8vy/
         E0XAGw8SGS3nHPY9XeM7lj1ZN6w1kVd7bUufrgzmdwJweSoAtox/BXziIAOUDpsVyTHG
         l8Or6+KMWpXC4loB5ahtKXgBC3eM8jpJ9bpf5fNq5tfC6Lqg7cDpyrvjH1AmjsfMEEBB
         QyHs6sJ3ZcyQyo699WkaT0ImIPr4k/dK1byydq9761P1pMgFzDNXrpZTpfrKOW51OO/k
         rraQ==
X-Forwarded-Encrypted: i=1; AL+hErFNjBpfmI/EnkdmNAJo4ATk2zyPF1ocYF7/LRXpJUjGRxRCoWDnG6CqRNFN0zbXY2YquYM=@lists.linux.dev
X-Gm-Message-State: APuU4Z80U3ow5FisCTqu+eUn7aZbQb8cGQpJLj4e/NyVrky++z+ESs9+
	ldTk9KiXGQPjMCC+YFeze2dX2WcIP9JY4XP/Yrmy4H1onkgo9Yh43CoPOO0KWWJSZmg=
X-Gm-Gg: AYBFou1MhM415WCtOw9a6zS7Y8Ywo4H0wKTrFDAvx/JiRtq5HtHWb2Dqt9/N2hZNR3y
	d2c2CSPXPtTQd30mok/UA8WWuMX3/bIDgJKJ64J+nmgzJ8d4Z7prRsjN+BlJO8d7R7iXmUdXbkA
	ngs5hogWpUty+m750Sq66KLKAzM/mPJqpoPRS4qxgs+ujoKb1rS6+EaCZOwJ6g64X44gSh8+21/
	UjS4ReUrsazTlFYqm2FsP40XDAZq1/RXysFFarggr4LZf7Ykiyhrc7nKvWlp3f78t4xEVaeGn3i
	tMHC82/5whvAe/3HW+gYvsBfGAHVVKvH3/D7WRurLrhWq70cNY5C9oRwjPCJ6XIac6yiYOKRC4/
	lnyV0GotsSd/yKBRGyMtIRiN5Zwm7RIq+hUjgE0kN6E+AhjF4tSxn+t0LfW8RamaUOyzdRtFiDS
	PRV+JJSEA5exNvU3CtI7exTLF0nXZEd0VDBuXqGP+mPRCGa7XfOBpWgGBf/rT+UIf8edD8kWY48
	rLpKm4gsMew9dHiDqVuqtHhxIOqZPqpt88uGHeNlJowV53zHP/WbiBAskZY4RFYOb4p203DIsRD
	bZRLIdiykP0KIX7MmGHYUlw=
X-Received: by 2002:a05:6000:288c:b0:48e:3cec:b852 with SMTP id ffacd0b85a97d-492777dbf93mr5033387f8f.40.1793970021373;
        Fri, 06 Nov 2026 05:00:21 -0800 (PST)
Received: from [192.168.1.123] ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723283dsm3434259f8f.23.2026.11.06.05.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:00:20 -0800 (PST)
From: Daniel Drake <ddrake@baylibre.com>
Date: Fri, 06 Nov 2026 12:59:59 +0000
Subject: [PATCH] arm64: dts: imx93-11x11-frdm: add HDMI support
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-imx93-frdm-hdmi-v1-1-5b05a83ed208@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MQQqDMBAF0KsMf+1AYjRirlK6CGZiZhFbEiiCe
 PeC7wDvQpem0hHoQpOfdv0cCGQHwlbisQtrQiCMZvTWGs9az9VxbqlySVV5cdlHt05RZouB8G2
 S9XzG1/u+/3DTfBdhAAAA
X-Change-ID: 20261106-imx93-frdm-hdmi-73f6a394ae51
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Drake <ddrake@baylibre.com>
X-Mailer: b4 0.14.3

The FRDM i.MX93 board has HDMI output display path:

  LCDIF -> LDB (LVDS channel 0) -> IT6263 -> type-A HDMI connector

The product schematic shows that the reset line is on the PCAL6524 GPIO
expander port 2 pin 5 (which gpio-pca953x regards as offset 21), all of
the 3.3V supplies come from PMIC BUCK4, and all of the 1.8V supplies
from BUCK5.

Describe the bridge and the connector, link it to the LDB and enable
the LCDIF, LDB and media block control.

PLL and LCDIF clocks are initially set to support a fixed 74.25 MHz
pixel clock, which supports some common HDMI resolutions, similar to
the imx8mp.dtsi setup with its HDMI overlays. In future, we could allow
for dynamic PLL adjustment based on selected display mode, however this
first needs clock framework improvements to support coordination of
sibling clocks from different drivers.

Signed-off-by: Daniel Drake <ddrake@baylibre.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
index 6e8351d12016..6dd0977b8305 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
@@ -9,6 +9,18 @@ / {
 	compatible = "fsl,imx93-11x11-frdm", "fsl,imx93";
 	model = "NXP i.MX93 11X11 FRDM board";
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&it6263_out>;
+			};
+		};
+	};
+
 	reg_usdhc3_vmmc: regulator-usdhc3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VPCIe_3V3";
@@ -38,6 +50,14 @@ &bluetooth {
 	vcc-supply = <&reg_usdhc3_vmmc>;
 };
 
+&lcdif {
+	status = "okay";
+};
+
+&ldb_lvds_ch0 {
+	remote-endpoint = <&it6263_lvds_in>;
+};
+
 &lpi2c1 {
 	pcal6408: gpio@20 {
 		compatible = "nxp,pcal6408";
@@ -47,6 +67,67 @@ pcal6408: gpio@20 {
 		reset-gpios = <&pcal6524 20 GPIO_ACTIVE_LOW>;
 		vcc-supply = <&buck5>;
 	};
+
+	hdmi@4c {
+		compatible = "ite,it6263";
+		reg = <0x4c>;
+		data-mapping = "jeida-24";
+		reset-gpios = <&pcal6524 21 GPIO_ACTIVE_LOW>;
+		ivdd-supply = <&buck5>;
+		ovdd-supply = <&buck4>;
+		txavcc18-supply = <&buck5>;
+		txavcc33-supply = <&buck4>;
+		pvcc1-supply = <&buck5>;
+		pvcc2-supply = <&buck5>;
+		avcc-supply = <&buck4>;
+		anvdd-supply = <&buck5>;
+		apvdd-supply = <&buck5>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				it6263_lvds_in: endpoint {
+					remote-endpoint = <&ldb_lvds_ch0>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				it6263_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
+&lvds_bridge {
+	status = "okay";
+};
+
+&media_blk_ctrl {
+	assigned-clocks = <&clk IMX93_CLK_MEDIA_AXI>,
+			  <&clk IMX93_CLK_MEDIA_APB>,
+			  <&clk IMX93_CLK_VIDEO_PLL>,
+			  <&clk IMX93_CLK_MEDIA_DISP_PIX>;
+	assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1>,
+				 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
+				 <0>,
+				 <&clk IMX93_CLK_VIDEO_PLL>;
+	/*
+	 * Set IMX93_CLK_MEDIA_DISP_PIX rate to 74250000Hz to accommodate
+	 * IMX93_CLK_VIDEO_PLL rate at 519750000Hz in a rate table.
+	 * The resultant 74.25MHz pixel clock supports some common HDMI
+	 * resolutions including 1280x720@60 and 1920x1080@30.
+	 */
+	assigned-clock-rates = <400000000>, <133333333>,
+			       <519750000>, <74250000>;
+	status = "okay";
 };
 
 &mqs1 {

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261106-imx93-frdm-hdmi-73f6a394ae51

Best regards,
-- 
Daniel Drake <ddrake@baylibre.com>

