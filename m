Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680413;
	b=vpumcSKO3HtCtxWnwwpqgrjy+4LBJpUlY/+LqitQJ9e+JITnyCfOOTe5AJSmKQm/Q5Wv
	 +6Hpiw1xLGygdTh5i7N6Zv0cm1yR17m3odFr6THEDFLm96QSO77EyYW63XCJI65X9l5QS
	 ikdfrMPsVocVzrHeLHp3LdRRohxFy/bFdJMp2f106Af+2jh+yXGt6okffJlGCQdd2OoCF
	 rhLBBhoaKAOyd9UMUlyYXHczjr3CMFJCFTQeAaQrOK2bCQy/hFWLiBAvD/O/cH8lp4GR9
	 RW+9b24AJon2eb/sC1642GD1uDUIl+gNBgeedmIQWRi2T14DD98ALKtc23rST8VLIHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=RQmzTc7JIS98CiZhgyzqtKCnw4uoHREsl6YRZzXnBUw=;
	b=IugXcpwJYxU5j9Gh226T7utmT8U7TNYSD6A6wbq2QpSlIapfhwurGjucJsdq7SkXgBOu
	 sZNqBFM4sLWxrUO/cz5p0w9Xi2Be6FGQbaK04QIEj4dxz9iVVcgJawkg4/xcHJ28t9wat
	 vKjdTMH84q9xFS7AAhj5uQD5qX+82qfttUuUKBTorz2tTHmNQuERMOV+TbrVWTKDMJuCC
	 pTDJSZjdQAxHl4YDHhtfcGLXoXEeDafbLHdNifkfjTw7duyqAypdl2sww2QPsvROxvSjr
	 XvOLkQznJohqXaXxoVZqYaMeJadx2gEcWME70fuT9NwfgcL81iaF0n3PkHMC14tCoiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HSL2mAB1;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADF0606A330
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 14:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ADF0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HSL2mAB1
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so10296935e9.1
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 07:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680412; x=1793285212; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQmzTc7JIS98CiZhgyzqtKCnw4uoHREsl6YRZzXnBUw=;
        b=HSL2mAB1ZoxoRdv7rgulH5t+VTrh7oJPvhyPvGJUd6CWkMA5VnTb7hAI4IK6nUdEHB
         hhk2yaMD5MJcXSVqwJOpwbf6xQIOo6pXnFgHxsld+3OdxpWd4k6BslA1P5xGzWZ+stOG
         qQZCxcp8VmUpd4PIkO/HuTAcBbXo9oIDdgPvf5mnYCHnTA23PU1ietM5dqgxLuw4T2OG
         WWlPc7j7Gp0bleuesM0RQXyhzu1v+6DQaDaUhpOTCVUNv7DDRpL1YJp25FhJrwnbHlXl
         tlohLcRCA6g7uKJ6q0G1aSWx+RPVbPMW53ToQqZts7QrGM5LycRRGTXoaXMfDNOAw1jC
         qyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680412; x=1793285212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RQmzTc7JIS98CiZhgyzqtKCnw4uoHREsl6YRZzXnBUw=;
        b=GFdFoOU9ilqaBjVkf3sAe17hfh2JqurczcnVMDH4hSszlj7fNXUa11STWIHpOby/dB
         rIkJcUQBV9vgJJZeFkj6x1WBvVAAixUtaQqOp98KwLA4FSdAAqNLBT2xU/Yce9OOe//8
         ddzlEJJhy6NFPeL8hN3g+bdBd7VpmkrZQoIXgMCy87qJt4kjA2gw8e9TXnFkV8aTR/ET
         U78H78CHGWLnbGSO7Lh2ANkcVoB3qKa6lnBrxcliTKXHzM9Y/drV8a1UfPRPBW9IS//F
         YTRSZFWAjKla+ASEUiRhdVPIqFHyvHHK7UvGLjTfbcESvHZOgdougJK3v5lBNlB5caJU
         B4mg==
X-Forwarded-Encrypted: i=1; AKwUvBz5t4RFPp6J45TebWeoKV4+JeKSNbs96Nkp3YZm1odeiSo078ar8+S5A1V6fpJk8Ap/Cok=@lists.linux.dev
X-Gm-Message-State: AFq9FYKTTRl/ti24dqy7sal+8BBqhdY5y00Lm/KDuLkpxydVfszFOve7
	zpyv9t8gsmIPlH0UPT+Ow1NELAO1aiJJnVbU7KQAy4W6IIt4WshjY5v1
X-Gm-Gg: AYBFou2yENP7FFkfsa84DsPT9hlznAqkMwtzztl9gGr9XG4vVt0v+wA+GdjyT2jzV4u
	ROqlQ+gNbANxs1wbwqWI5XEHWA40HIZs1YVwmtIhn7Ai1f1C3PVjA9ogixWCELDgbo4wHydeyB/
	rsFUtr76dUu0b2jShs9oqJx7Sx6wcoe+V7cxzhygbajj9pUX07SY1dX/2bZPua1fspTrUKAYIii
	Plf/vATO2eDp0uWhrvXUkHhJEnAsDy8hsvOmUuRdhCQcsg7UZGVet0rFi4iN8icQ+2WTvhuAwuK
	VTUSm/WjDNohBOzuoBwTVrX98xWT+7+g3cMWliHbXh6L1eLv9m5a0IJMqdYcJ+lQ805fOqIbq9u
	nmEydlf2zUCsbSw9HeSi2ZG77xyhzEgoZJg1P1Lj+gd+ki49xX4NSLQhJHImdMRZaKt4Qo2J4CU
	9+Hb1IpBunqihqdhS6ze7l17mUFEFnq2pKNKZ620oHOdXvN/xG9DdDpkE0CaGRoIEQnoL2LDBEW
	aUBojv4Xlx7q2vXIJSWUT2jkqdYpruOPustECi0ZRAPR16T0eCixhPRZUOidJ0WY0F6hbq4EqG9
	0r0/CouDjrF/KfTgOxWjS3jXYiv4Z2UrtQSJOMLWJDE8mf+7/MjeINym
X-Received: by 2002:a05:6000:4b0a:b0:48e:1080:3a92 with SMTP id ffacd0b85a97d-48e264c9785mr11826653f8f.32.1792680411774;
        Thu, 22 Oct 2026 07:46:51 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828c6dsm13672146f8f.24.2026.10.22.07.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:46:51 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:46:45 +0200
Subject: [PATCH v2 2/3] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 camera connector nexus
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
Message-Id: <20261022-v1-smarc-imx8mp-cameras-v2-2-cfe3d25e7aed@toradex.com>
References: <20261022-v1-smarc-imx8mp-cameras-v2-0-cfe3d25e7aed@toradex.com>
In-Reply-To: <20261022-v1-smarc-imx8mp-cameras-v2-0-cfe3d25e7aed@toradex.com>
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

