Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD3C263F5F;
	Mon,  5 Jan 2026 20:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767645603; cv=none; b=pbhtxKcZQCoz6bqShbXAsbx/pKCnA4t2CtwwRLvh0znxMgXQMIKk/u6bqW2mrdl3u7OnfQojpCOE3qoyDYiiAdeAXl49Vth0Ia803v4L933HggQ05AkhOYG9j7yJZ0TFReGrYQ7CuPrvCyNU2tZQCHIA29EfbGR8LVEFwO+YUBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767645603; c=relaxed/simple;
	bh=QY/sR66KXOWACg6VsyKEm43HAKNN0tLF1bG2O/nHTUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HxD1rdsH/rLRG3xDEavaoK5+kpSzuQBCHhF8krxBMMzmWgi3r8zR4zr3Yi2O/+yIrYZdmQesGBt1HujtqHzM2Fra27Aa1c5A5US2SO+6/IeJyBIdMfBpTOUGsPUuHFglIlEvLfoznEFR180/+4Iwd577ZTT0G6qOa4TQa1hvKRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=os4h+sTQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="os4h+sTQ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E10A9C19422;
	Mon,  5 Jan 2026 20:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767645602;
	bh=QY/sR66KXOWACg6VsyKEm43HAKNN0tLF1bG2O/nHTUQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=os4h+sTQd7d63NDeKBKZWKdwkN5KFUXR3+H3HO6NnMY4Zjhj/GedsM24SsKBDP2HF
	 Qyu9KTJ1Z52JqaP639EwWjmPkLa7oAu6brwEb6H9zj4nTDAU9Jd0kbES7HNILMg2/C
	 aV5aJ33hxO5alz7qs2y3DRfgoCeFjw76454T+gd4ytYK24PBhTQT9xTFvWY44tlTOY
	 cyRiT6YurBBeLihij3JsUwCyH95PTePTCuPfjTIyFifWPgeYTapLqdnMiFvaVHHzuo
	 Dnnff7p10G2L1Ck1FYoNG+ZDGQTStKLV7Xxtv7fNCB61tpeefVKguJFaWJJDL5f7yq
	 BMwLvcDX0l1rQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D12C1C98335;
	Mon,  5 Jan 2026 20:40:02 +0000 (UTC)
From: Sebastian Krzyszkowiak via B4 Relay <devnull+sebastian.krzyszkowiak.puri.sm@kernel.org>
Date: Mon, 05 Jan 2026 21:39:38 +0100
Subject: [PATCH 1/6] arm64: dts: imx8mq-librem5: Enable I2C recovery
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-l5-dtb-fixes-v1-1-f491881a7fe7@puri.sm>
References: <20260105-l5-dtb-fixes-v1-0-f491881a7fe7@puri.sm>
In-Reply-To: <20260105-l5-dtb-fixes-v1-0-f491881a7fe7@puri.sm>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@puri.sm, Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Denis Sergeevich <galilley@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3624;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=2CPEfJJK6ZBfWNr7wJ/vjJqV3vNXoiRAgqzj5tKt60c=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpXCGgpw5ShwVRjjkNYF/A3liv5xsJ6t5/Uq4v+
 pvF0nfbkbCJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaVwhoAAKCRDo8jXPO9vD
 /7qrD/98HILeJmN1zQegk9fyQSB2sK4lmpDcQ/yvHWNA1OARqgTfhKpZb7MSIx9hR6jM9rqvy7d
 JxtWRGA2loigoNm2u9o+4bz+AOPR0XEy8R2omH6Yh/Tu6JjDQH/olLEnisojByN5XPAzLVe//kE
 LCUga/qy8XOnAlKsuY6EJIY+kRmYg+UoTHQyG8Xkz8GAt3qM4C6JBSP4O0Gj7SAZ1gTgUIxUA6J
 PXIeNghROc3jcayCLhCdX4aQNOqqYa8u9AIqz5wHx/mmdkplfGkAGJMAJIXu8KmFSFvOx1mQlJe
 5/Ad0v3lB2WQs4Ri6wPkhHAm4ZtOEDUYrBCHyOxnYSZjdVn0RK0yGVcwCDHAv0effjNeitOSD34
 2y8ZPilfsP+BQF9bV9vWRmobmr80imyn/3OvaLQE94QDH0aX3nQDtVrgOKTF0DWPg5m95mKNTRx
 pVw4RRqr0NmP8c/3Tt/7PAcuwVRi5Fl/8AGOTNWLWg27/tbW/MruLZJcqjPNJtI/n5bcAu7p//K
 TgI1HHco0d6X27i25+zoGbbLzqgl/EE83LV8WB18rm7WBQN1DECSFQmt72AWn5Pl9zJoHF0ZAo8
 A5h5SElDAjARwUbgtFvoQ3/fLBMnjCRYkENQgebIxHrHZSQnCcfY5p/aEjN+DPmtu20tjnHvM8i
 jSAwge6QTFt5vfw==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
X-Endpoint-Received: by B4 Relay for sebastian.krzyszkowiak@puri.sm/default
 with auth_id=32
X-Original-From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Reply-To: sebastian.krzyszkowiak@puri.sm

From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

i2c-imx can perform bus recovery by temporarily switching I2C pins
into GPIO mode. To do so, it needs GPIO and pinctrl handles to be
provided in the device tree.

Suggested-by: Denis Sergeevich <galilley@gmail.com>
Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 48 +++++++++++++++++++++--
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index 9e0e2d7271ef..ce039bd701c2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -512,6 +512,13 @@ MX8MQ_IOMUXC_I2C1_SDA_I2C1_SDA		0x40000026
 		>;
 	};
 
+	pinctrl_i2c1_gpio: i2c1-gpiogrp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_I2C1_SCL_GPIO5_IO14	0x26
+			MX8MQ_IOMUXC_I2C1_SDA_GPIO5_IO15	0x26
+		>;
+	};
+
 	pinctrl_i2c2: i2c2grp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_I2C2_SCL_I2C2_SCL		0x40000026
@@ -519,6 +526,13 @@ MX8MQ_IOMUXC_I2C2_SDA_I2C2_SDA		0x40000026
 		>;
 	};
 
+	pinctrl_i2c2_gpio: i2c2-gpiogrp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_I2C2_SCL_GPIO5_IO16	0x26
+			MX8MQ_IOMUXC_I2C2_SDA_GPIO5_IO17	0x26
+		>;
+	};
+
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_I2C3_SCL_I2C3_SCL		0x40000026
@@ -526,6 +540,13 @@ MX8MQ_IOMUXC_I2C3_SDA_I2C3_SDA		0x40000026
 		>;
 	};
 
+	pinctrl_i2c3_gpio: i2c3-gpiogrp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_I2C3_SCL_GPIO5_IO18	0x26
+			MX8MQ_IOMUXC_I2C3_SDA_GPIO5_IO19	0x26
+		>;
+	};
+
 	pinctrl_i2c4: i2c4grp {
 		fsl,pins = <
 			MX8MQ_IOMUXC_I2C4_SCL_I2C4_SCL		0x40000026
@@ -533,6 +554,13 @@ MX8MQ_IOMUXC_I2C4_SDA_I2C4_SDA		0x40000026
 		>;
 	};
 
+	pinctrl_i2c4_gpio: i2c4-gpiogrp {
+		fsl,pins = <
+			MX8MQ_IOMUXC_I2C4_SCL_GPIO5_IO20	0x26
+			MX8MQ_IOMUXC_I2C4_SDA_GPIO5_IO21	0x26
+		>;
+	};
+
 	pinctrl_keys: keysgrp {
 		fsl,pins = <
 			/* VOL- */
@@ -782,8 +810,11 @@ MX8MQ_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0x1f
 
 &i2c1 {
 	clock-frequency = <384000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-1 = <&pinctrl_i2c1_gpio>;
+	scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	typec_pd: usb-pd@3f {
@@ -982,8 +1013,11 @@ rtc@68 {
 
 &i2c2 {
 	clock-frequency = <384000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c2>;
+	pinctrl-1 = <&pinctrl_i2c2_gpio>;
+	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	magnetometer: magnetometer@1e	{
@@ -1031,8 +1065,11 @@ accel_gyro: accel-gyro@6a	{
 
 &i2c3 {
 	clock-frequency = <384000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
+	pinctrl-1 = <&pinctrl_i2c3_gpio>;
+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	codec: audio-codec@1a {
@@ -1121,8 +1158,11 @@ touchscreen@38 {
 
 &i2c4 {
 	clock-frequency = <384000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c4>;
+	pinctrl-1 = <&pinctrl_i2c4_gpio>;
+	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	vcm@c {

-- 
2.52.0


