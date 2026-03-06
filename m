Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92873128C9
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 19:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772827135; cv=none; b=c2V1+wgT3keVQ3qLVlCTrPBkSphK+Ffz3MTfdasRWWbLzBtGtYiE8gG0JGRtuY5BW4b6o335aqckvFpAHFVv7+TI0sDpbBXjYqi4vyRb64LjOzRBlxhuo1SawtgM9TqAB4uA7j2920mpmdSECFV4MrDtqP2+DOZ00UrhoAUOZ4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772827135; c=relaxed/simple;
	bh=3tics7Sp+ACzJ3fwwu/k4s5EkZCHDCq4yzTDw8EoxK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qrate9Gsw4giE9sIhoUoxF3Zs5blhV+sFEDnp/BRYS8acAYgrtggxt9csDY4ShnTLgxmbzCZcbm2hneEOAr5ktsedyEG054fZgVi7RxMSNnAd1RgaPAf/Js4SsXjl28CkepJhYi5g/IV/808jYHt2UTSBVV5E4+xOxuYJu8QYX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1YpZkSk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1YpZkSk"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48370174e18so58720935e9.2
        for <imx@lists.linux.dev>; Fri, 06 Mar 2026 11:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772827131; x=1773431931; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSGdR/fONreoDaJVUI/JFgQUgIkT771I117jJn+3wes=;
        b=k1YpZkSka+7ABtR4ShhCaE+O11BRpsttBVGs7DTZd38Snc5GxjpKthENxBwHWFbZRj
         BrKzzfw1uTZwTlWDjsF8ORCaDpKOrGJk/M6UUJK9YNP5uB290MOM+NSiDc+TRm3h6Ehj
         d2Yb+wbl95cCXzEgvlErKYEQ6Jxsn9iLq5E0hP6BfwyF+/oTGLGiKmWPPX8Lpcjk47WL
         6ILu4a1pczLA7uIrON2NVXQXjyIrVaSBkBfocvxoKF8z+BQRpiJeN6b4/4aLFhMIVoc7
         EPC52uMH0WsSp/+zo1/wnohw48gYAgcwQeZDBluq9KvLHfQkdDTUt7XsuomjCt0+U/Yz
         fA7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827131; x=1773431931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TSGdR/fONreoDaJVUI/JFgQUgIkT771I117jJn+3wes=;
        b=dtpjs0r7+n/Zy1cn2Gm8odaR/VNN34pllQrUP2QpN6bguBQ44hzG7toKwfo+OysBeU
         hX6eMODhpsL9QpRzhFAp4nyyxILmvjnqkiSzlpoi7BqM7oG/kfucRX9II/498EY3y1As
         HVi9AWFxYGHZOfGMjHHQjgPC68BZTIXtoUK6bYSUOhcfHjCFptaUCmaSurVw6TYXm2ra
         DAoPZn8PseQakdqDh7YIlNFUTrnOUJjrR9XeOg0IDkBf6CG67OB7l1Eg75q/OWqhO7uR
         hoBnW0Yh+lsHgbOehUbk6DDX3z8VaZsQHTthBrTul8A7vlKB7d6/Y5HgiMEY9oh7JjU5
         mSUw==
X-Forwarded-Encrypted: i=1; AJvYcCVLtRdOwWwgWCtZXsRYWhP7/uE673WpH0O2PUtgQaeujYIxB/9/ka0rvKV1L0jWUmELqt8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/ELpRUxmi6JFpK4s3BxWBIu/kGUNzXkcK/mogldA91gBYbXV0
	XE7JnZedpAi8I9+7eEOGmPmuP8zP06qdfJrk/RCLPE7xsb5jcP1rb7aG
X-Gm-Gg: ATEYQzx9qCts/Si2mMYAVe6FCAoSqJOPwBoEbIRahv3yBiwV6CwIWkuFz1A9bBapno9
	S4y3Viee6ZjdTYYN82VHmWslHFEoS0F9lFHIpbN8TszDosiVtR46nARZTsczuBgZUF6GCTBXly9
	EGcPiRyHylwBjSAwb8JBANABzVdhOMKI01b9B72GbaZHXL8+/ZirwpGvBj4fg/UQKJ3o+9XOLn4
	x5172qx74qf4qsDCDPO352GOz5B9mxoVEUhulRmftUIMaVwrykzuSaftUDFT6k7998AZVvWmRVS
	G8GSexPewwHUir5FuzmNuhL/84xDW/ItBUcuGqf6U8OheUANSf0luZtdy2kO3A+Ye2xPDwOpOnU
	kwuOqXSkw9UqUjnlGqXSuh6wGBQmQNxHBGNT6QWkdynLHClMqM9NHsozta9L3JlE2/lTzxpwEEi
	BPIZw7KZCXX21XNXRRWwg4lMEQnG+z6DViSYfmSlRRdMQh5aRTk5fytg5ZZhxQQoHKAZi24qkm9
	rVH7NNj/XcuAO20JVrdtgmA+u9Fhu7Gbgq6VAI=
X-Received: by 2002:a05:600c:a12:b0:483:badb:618f with SMTP id 5b1f17b1804b1-48526966b07mr53084435e9.25.1772827131139;
        Fri, 06 Mar 2026 11:58:51 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48523803b5fsm25167265e9.7.2026.03.06.11.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:58:50 -0800 (PST)
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
Subject: [PATCH v2 11/11] arm64: dts: imx8mm-var-som-symphony: Enable PCIe
Date: Fri,  6 Mar 2026 20:58:30 +0100
Message-ID: <a029d4f029274a368af0e9c58e9b41106857e436.1772826534.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772826534.git.stefano.r@variscite.com>
References: <cover.1772826534.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable PCIe support on the VAR-SOM Symphony carrier board by adding the
external reference clock, configuring the PHY and providing the required
clock and reset properties.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../dts/freescale/imx8mm-var-som-symphony.dts | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 9a29c81b06eb..0aa288af6c5e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/phy/phy-imx8-pcie.h>
 #include "imx8mm-var-som.dtsi"
 #include "imx8mm-var-som-wifi-bt-iw61x.dtsi"
 
@@ -17,6 +18,12 @@ chosen {
 		stdout-path = &uart4;
 	};
 
+	pcie0_refclk: pcie0-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -205,6 +212,27 @@ &i2c4 {
 	status = "okay";
 };
 
+&pcie_phy {
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
+	fsl,tx-deemph-gen1 = <0x2d>;
+	fsl,tx-deemph-gen2 = <0xf>;
+	fsl,clkreq-unsupported;
+	clocks = <&pcie0_refclk>;
+	status = "okay";
+};
+
+&pcie0 {
+	reset-gpio = <&pca6408 1 GPIO_ACTIVE_LOW>;
+	clocks = <&clk IMX8MM_CLK_PCIE1_ROOT>, <&pcie0_refclk>,
+		 <&clk IMX8MM_CLK_PCIE1_AUX>;
+	assigned-clocks = <&clk IMX8MM_CLK_PCIE1_AUX>,
+			  <&clk IMX8MM_CLK_PCIE1_CTRL>;
+	assigned-clock-rates = <10000000>, <250000000>;
+	assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_50M>,
+				 <&clk IMX8MM_SYS_PLL2_250M>;
+	status = "okay";
+};
+
 /* Header */
 &uart1 {
 	pinctrl-names = "default";
-- 
2.47.3

