Received: from mx0a-00176a03.pphosted.com (mx0b-00176a03.pphosted.com [67.231.157.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC566A342
	for <imx@lists.linux.dev>; Mon,  8 Apr 2024 12:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.157.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712579052; cv=none; b=gPE0rE0fG781kN3YojRgouGZ4pKQHvTDL9D3BUtoD0Rx+egiifcVBo/KKyeHM67iuYIUOol2x46vDcXt+m2WG6NWbRnFlBJoybiEhNd59ny1nmfzUM8PGykI1tA4uedB9SN2n0bXPbDI8JuTtbpcFKVjm++UAVDa9BXNnx2szXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712579052; c=relaxed/simple;
	bh=iMn14yBFHMKIIIY04H1NPIFmozgmActewqy/9b1TMfM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QIQ8m7WmGbCmzYXaL/ItZcKqkJ5lXonrF9nDiMp7phHQDg3hnIMPLlmJiHf6vC+W8/gQqsRKZ1WUZC+hxCfDllVtBMItend+5WBKw3CBT70e8P6MNNPYXi2QfUMrapgTwht8UBt3+yVYa2LOBo7X1LQfCBbMR5aoOBMGidfhBpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=jk+8p+fC; arc=none smtp.client-ip=67.231.157.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="jk+8p+fC"
Received: from pps.filterd (m0048205.ppops.net [127.0.0.1])
	by m0048205.ppops.net-00176a03. (8.17.1.24/8.17.1.24) with ESMTP id 438B2W4l039139
	for <imx@lists.linux.dev>; Mon, 8 Apr 2024 08:24:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	gehealthcare.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=outbound; bh=vG3EaXqf3b262/c0/QoTfdhXWijF6zXQ/VHlqLDA1hs=; b=
	jk+8p+fCR+KIvao7S5Fu/QH6X9TqxSuKIervYNHHCN9PfucDNBr1g7Cs7PnwI2+n
	QO3Q1AmZh6CU2liBwnxzziUna5bbw7BP+objIHtXVP5SmIONdpa7+969NlvkSkfA
	yPQZeonltnEbxT72hFhHyZBMLTlHqD9bK/pf+CVLW9zP6hTcd4fe6yU/vVrdEEPB
	zSfRjatqqBjrXOjG2BhNm72PrUOj1TAkSQ+SG5V3ccWolV1Q6zvqdhWLLH3PZSWa
	UwuNn47k32QW7nicDhw4dCNI4CTKIBz5nQ1LAa5ZGpcZC14FpwNHVFn0KVAaG7Xz
	/+IQyx8elVald/XLkKbUuA==
From: Ian Ray <ian.ray@gehealthcare.com>
To: Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: Ian Ray <ian.ray@gehealthcare.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2 2/2] arm64: dts: imx8mp-msc-sm2s: Add i2c{1,6} sda-/scl-gpios
Date: Mon,  8 Apr 2024 15:23:21 +0300
Message-Id: <20240408122321.464-2-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240408122321.464-1-ian.ray@gehealthcare.com>
References: <20240408122321.464-1-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: F12oe_9OQC3lfOop57iq0KOx0XKd1bcR
X-Proofpoint-ORIG-GUID: F12oe_9OQC3lfOop57iq0KOx0XKd1bcR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_10,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0 mlxscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404080094

Add i2c{1,6} sda-/scl-gpios with the corresponding pinmux entries.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 .../boot/dts/freescale/imx8mp-msc-sm2s.dtsi   | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi
index 940bdbe115a3..aeb557fe9dd6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi
@@ -200,8 +200,11 @@ ethphy1: ethernet-phy@1 {
 };
 
 &i2c1 {
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-1 = <&pinctrl_i2c1_gpio>;
+	scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	clock-frequency = <400000>;
 	status = "okay";
 
@@ -241,8 +244,11 @@ &i2c5 {
 };
 
 &i2c6 {
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c6>;
+	pinctrl-1 = <&pinctrl_i2c6_gpio>;
+	scl-gpios = <&gpio3 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio3 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	clock-frequency = <400000>;
 	status = "okay";
 
@@ -606,6 +612,12 @@ pinctrl_i2c1: i2c1grp {
 			<MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA		0x400001c2>;
 	};
 
+	pinctrl_i2c1_gpio: i2c1gpiogrp {
+		fsl,pins =
+			<MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14		0x1c2>,
+			<MX8MP_IOMUXC_I2C1_SDA__GPIO5_IO15		0x1c2>;
+	};
+
 	pinctrl_i2c2: i2c2grp {
 		fsl,pins =
 			<MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL		0x400001c2>,
@@ -636,6 +648,12 @@ pinctrl_i2c6: i2c6grp {
 			<MX8MP_IOMUXC_SAI5_RXC__I2C6_SDA		0x400001c2>;
 	};
 
+	pinctrl_i2c6_gpio: i2c6gpiogrp {
+		fsl,pins =
+			<MX8MP_IOMUXC_SAI5_RXFS__GPIO3_IO19		0x1c2>,
+			<MX8MP_IOMUXC_SAI5_RXC__GPIO3_IO20		0x1c2>;
+	};
+
 	pinctrl_lcd0_backlight: lcd0-backlightgrp {
 		fsl,pins =
 			<MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05		0x41>;
-- 
2.39.2

