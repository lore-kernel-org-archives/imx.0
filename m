Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C324A2047
	for <imx@lists.linux.dev>; Fri,  2 Oct 2026 13:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790947941; cv=none; b=gbIqucDoILkUn4gEFMm+HnoZOOZuZK+e8tBuk0y0GzaHKydvnsm3/d4QK+5RyT3jsIysmBZWfd/ADKWblzmSWn8M0029QS/DPTIG74qguJdkk3krspE+laE9XwPp3au+8wnR9wG73GhtJJXh2zs92kNmyQyvuxr2gMpPkIfSvJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790947941; c=relaxed/simple;
	bh=jGF7Uptp7PeUJv+mf2mKrbCqxmD4rFQSTNs6N/+yV6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZvcE7kjmsJNLYT0fuN2ldm7ImVTSukFhf5I0W9ju8hn1eNvjpI9kdfZbPCJt+RFcynuh2qIXymEEd1viTAsxOHXqXHX7ooxI6lsaN4vuBfSuNX9JUCyeU6Y2cyZDgDFBwTz2Z4OLnxb2GG3WjfSkD++EQDONpnOFUs8n70Umurs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k10g7+9u; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k10g7+9u"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48afe3b2383so2430872f8f.1
        for <imx@lists.linux.dev>; Fri, 02 Oct 2026 06:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790947938; x=1791552738; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQmzTc7JIS98CiZhgyzqtKCnw4uoHREsl6YRZzXnBUw=;
        b=k10g7+9uTa80PhrmKZauun7T2Xub0rPGKy1Nf26X2qLvVcb+noWG2oMChwEWsLfk5W
         Q91c1GKLqVv98KiZNeuIpIlDi8UXKBQIQ4rw5Ghl/5k7j3AETZhwgKCjAKebfqjP7qpV
         n9tRaVJW5gC3ZS1AQ7pgijbRgMXuYk0u7zHoKR+PK+CMVHA8Navz2xZXq3bJl4UsOuQx
         EaWJc8KzM7C1nzFqozKdq/s32AAP9N0bIBgdSx6xjiL9np6rJwJY33md8bMyuLwSEW8p
         vruXDMIJkA6oxyknfnwbwn1hSg4GAdXQTNNwHMAtYn3TYvI9HyRQzLjDRj5Wt/1N6Mqy
         RfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790947938; x=1791552738;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RQmzTc7JIS98CiZhgyzqtKCnw4uoHREsl6YRZzXnBUw=;
        b=ruooxu0g8VzYMFTUcleSV9UrrUrjL7Swkn2xLF6XnBvTeG2acERnO7TBal9pSNHUcZ
         45PM9W+Ev2Mfg3ODH95RF/6Ajp7+GXmV+DWD6HEDJYVA9s6Juezqo6213kvNnRUGyEQY
         ALdhroIAnacQwgfrGa4Qnt9JFthpeCIqlwh5A7avgi3ugVmx6MNDH1B5yTeimW2EKEPl
         gRyxZ6VtWYRUaiRl7nsoSH/L81vhh6VFhWhmksamua0AsBk7Oc/ZZM8jp3aVkCcwz8kt
         wj7SVLI8CZuGQpj8oZ6c5u+IGK59w2/BSdvL71g3PvX+WKYZ5jmse4zk4uEzSA+9euQy
         17xQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvYIujSJFZIGI0FPqdJ0eVnDv+8yZ2Ra/pjKCy3okUOe0vXP3n77uZY39TiP6CqnfwfPA=@lists.linux.dev
X-Gm-Message-State: AFuF++kCziPHeYyX3gU1k/awrKRM+hEzGRmxL/Jf3S51opzfGjurvNx3
	3WaFhy+S7L3Uib1K9QlEeMUdM6D8uSbjY0ObULsVR7C8qAf2eOCyEn0lt5y4Ni8Z7LM=
X-Gm-Gg: AYBFou1P9GGhSZClXn1X9Sbz96h/qexzZAFTQQ6zY8jIU6pPjS0Xtyefx2+jREYSYk5
	TSlgMZOEdvgw5BCjJAydeqiNfF/a2RYsUGaqleWtZTmsEnIDY9ID+t0eEOdHEaBQ/T0zHFFJ+Gn
	Umrvw8+q/jIYEmT8qRYlm7eqIhTTwfynLNX3A9YMkpETLXvlJNGHX3lU5WQG65/3HORx2GkG7+V
	6CEGBo3eZeqJOxqfoVh9OLYFPkWJc9dLwijWVWE2L7ONwKv7aXn+ITuk9cri8HoFinWfOkuvNEh
	iopljjFpUHR5zOsRI3RwmH7m0Z1wQwjy/Fs3uUvX4QZZ47gKEXXusO+LpX1Wcdz5QWrzgcMNzhM
	tUuQB35O3cUo1NVzth6lFVEbk6JUwT+tTTndtR9fo9bHH4kAgSJmcMkgjQpK5rbVPXpaP3ncZ5N
	oKu0UnGgMiTtKbpFItXPjsxNnnkbRx9esgQDsx3rgPorEfU6YrzRwJYCpocGPvQqptElJDgc1ko
	hRtusvZlf38NhBWTd9dTr8gAQJR29WlDVDoJFa4SoGgK56lU8tMoKKitnoUzL1heoMe9Z+mjxMc
	6QhX7CgJ
X-Received: by 2002:a05:600c:154c:b0:49f:fe88:e7d1 with SMTP id 5b1f17b1804b1-4a02769c438mr56562015e9.15.1790947937422;
        Fri, 02 Oct 2026 06:32:17 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f9bc0sm5809855f8f.41.2026.10.02.06.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 06:32:17 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 02 Oct 2026 15:31:30 +0200
Subject: [PATCH 1/2] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 camera connector nexus
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-v1-smarc-imx8mp-cameras-v1-1-a0e89182c625@toradex.com>
References: <20261002-v1-smarc-imx8mp-cameras-v1-0-a0e89182c625@toradex.com>
In-Reply-To: <20261002-v1-smarc-imx8mp-cameras-v1-0-a0e89182c625@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

The SMARC Development Board exposes two 24-pin camera connectors with
reset and power-control signals routed through the SoM GPIO expander.

Describe the connectors as GPIO nexuses and add stable labels for the
camera buses and CSI receivers, so accessory overlays can use the
carrier's interfaces without embedding its GPIO routing.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 .../dts/freescale/imx8mp-toradex-smarc-dev.dts     | 26 ++++++++++++++++++++++
 .../boot/dts/freescale/imx8mp-toradex-smarc.dtsi   | 10 +++++++--
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
index c28d63293149..e0096388fbfe 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
@@ -13,6 +13,32 @@ / {
 		     "toradex,smarc-imx8mp",
 		     "fsl,imx8mp";
 
+	smarc_csi0: camera-connector-0 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CAM_0_CON_RST     (pin 11) - SMARC GPIO2 (P110)
+		 * CAM_0_CON_PWRCTRL (pin 24) - SMARC GPIO0 (P108)
+		 */
+		gpio-map = <0 0 &som_gpio_expander 2 GPIO_ACTIVE_HIGH>,
+			   <3 0 &som_gpio_expander 0 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+
+	smarc_csi1: camera-connector-1 {
+		compatible = "toradex,camera-connector";
+		#gpio-cells = <2>;
+		/*
+		 * CAM_1_CON_RST     (pin 11) - SMARC GPIO3 (P111)
+		 * CAM_1_CON_PWRCTRL (pin 24) - SMARC GPIO1 (P109)
+		 */
+		gpio-map = <0 0 &som_gpio_expander 3 GPIO_ACTIVE_HIGH>,
+			   <3 0 &som_gpio_expander 1 GPIO_ACTIVE_HIGH>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+	};
+
 	hdmi-connector {
 		compatible = "hdmi-connector";
 		label = "J64";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
index eb8b9db7e3cd..e8e718ef7822 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
@@ -587,7 +587,7 @@ &i2c2 {
 };
 
 /* SMARC I2C_CAM0 */
-&i2c3 {
+smarc_csi0_i2c: &i2c3 {
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
 	pinctrl-1 = <&pinctrl_i2c3_gpio>;
@@ -616,7 +616,7 @@ eeprom@50 {
 };
 
 /* SMARC I2C_CAM1 */
-&i2c5 {
+smarc_csi1_i2c: &i2c5 {
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c5>;
 	pinctrl-1 = <&pinctrl_i2c5_gpio>;
@@ -655,6 +655,12 @@ fec_phy: ethernet-phy@2 {
 	};
 };
 
+/* SMARC CSI1 */
+smarc_csi1_rx: &mipi_csi_0 {};
+
+/* SMARC CSI0 */
+smarc_csi0_rx: &mipi_csi_1 {};
+
 /* SMARC PCIE_A */
 &pcie {
 	pinctrl-names = "default";

-- 
2.43.0

