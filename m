Received: from mx0a-00176a03.pphosted.com (mx0b-00176a03.pphosted.com [67.231.157.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB864AEC2
	for <imx@lists.linux.dev>; Mon,  8 Apr 2024 09:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.157.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712568805; cv=none; b=VTvm+nAEAQho8MQR91E9EuP2ZAGWQiv6CK/ntbsbBZzvPP7EI+aqOGxj2RKqvzWHihAZ2ZJRc3gUQz1JnhlYoYrhv+3bQE33skN1aWVigrJAhZpJKWLH72MjOugugvK2+VzdNFKZ72vTT1NdQmyLZBMkEHHt5gjeiP6TqJO+Gxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712568805; c=relaxed/simple;
	bh=VBbyy+f6ApNNw/g8S5UqMO+gnfsVcOxeQZsix2HzRAE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Qmy1QFlm55WqZlFEX6gNwVtl4K/EF7whqLz4pMQvO8l4QfWsbFdoKhU3pmt6fCVCCjIQKZl7sMeiFZgy+GXzrJfOygrUT4BEficm6N80yOHcw4jX8qKaFOD17Af5a1BOWyFju0NcVQLJI7lSfbH7NaBvoeff5jaBeBwUmDfJc2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=o4vdlasY; arc=none smtp.client-ip=67.231.157.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="o4vdlasY"
Received: from pps.filterd (m0048204.ppops.net [127.0.0.1])
	by m0048204.ppops.net-00176a03. (8.17.1.24/8.17.1.24) with ESMTP id 4385URX5032525
	for <imx@lists.linux.dev>; Mon, 8 Apr 2024 05:25:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	gehealthcare.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=outbound; bh=qYN2gTSX
	hF9fQTvXvqjS4pLs+E5SrnBzBEJm94NG1bk=; b=o4vdlasYAGzFSXaGpDDp754F
	VPkKd1iB60geg86+mCnlAq2BH7pzAV1yC2+cFKO4kw15IhVaEhLlCcsoETCzsy5g
	1rk4HqxtLv/JccHcfNQ6ydnIRYQbadwzdIThr0OIfvGW4DJppG2xaWqEgk2j+Yu2
	h+SIktSytYfKvkf6Q5vsHqctUZZKLRcBIHXQajKl3BlhHOW+7SxJ5X0o/WvBT1fR
	n+yw+MJNPKvWdpd5D2fYFENufmBOZ7rRw22uny64qXREkrDurN8sv3rNLidICzW8
	zX+yWMEp4pBx4V+iJ4Q5+NaztVbSulQU8ElkSlcQbG2oplH++OZbAIGzCryQng==
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
Subject: [PATCH] arm64: dts: imx8mp-msc-sm2s: Add i2c{1,6} sda-/scl-gpios
Date: Mon,  8 Apr 2024 12:24:49 +0300
Message-Id: <20240408092449.6-1-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EePwetGPxn-nc2Pymxzjcx6heDzztJ67
X-Proofpoint-ORIG-GUID: EePwetGPxn-nc2Pymxzjcx6heDzztJ67
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_07,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011 malwarescore=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404080072

Add i2c{1,6} sda-/scl-gpios with the corresponding pinmux entries.

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 .../boot/dts/freescale/imx8mp-msc-sm2s.dtsi   | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi
index 61c2a63efc6d..7e4327084d26 100644
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
 			<MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA		0x400001c3>;
 	};
 
+	pinctrl_i2c1_gpio: i2c1gpiogrp {
+		fsl,pins =
+			<MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14		0x400001c3>,
+			<MX8MP_IOMUXC_I2C1_SDA__GPIO5_IO15		0x400001c3>;
+	};
+
 	pinctrl_i2c2: i2c2grp {
 		fsl,pins =
 			<MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL		0x400001c3>,
@@ -636,6 +648,12 @@ pinctrl_i2c6: i2c6grp {
 			<MX8MP_IOMUXC_SAI5_RXC__I2C6_SDA		0x400001c3>;
 	};
 
+	pinctrl_i2c6_gpio: i2c5gpiogrp {
+		fsl,pins =
+			<MX8MP_IOMUXC_SAI5_RXFS__GPIO3_IO19		0x400001c3>,
+			<MX8MP_IOMUXC_SAI5_RXC__GPIO3_IO20		0x400001c3>;
+	};
+
 	pinctrl_lcd0_backlight: lcd0-backlightgrp {
 		fsl,pins =
 			<MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05		0x41>;
-- 
2.39.2

