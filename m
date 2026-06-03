Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644D548124A
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 14:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497455; cv=none; b=ZRAQK2vOcwo6QiSLS3twHvreJa1ZvUM2yyX18YKZ+kQgyaUmm9hspwNydQbXO2e7S35U4vRsWZ9b1Q4PDEd2aSth2w+JzXH1xFJSU2xn7L1DD9jUVnY0D99l4gB8oDy3EOwmSMR5xt1g3rFO4dndyn7rPpIZRQJAL+fAMxbQNVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497455; c=relaxed/simple;
	bh=T43hXh82sAKDwWzRE2fzjebOhdXYM6MalzxyP6yv00I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dbSDPPhvoHcY63HxzyKsdtIw6BOsVQxWiYLe24XQSz2IA3LRZpBa2Z+RcOOIrdWwVPi6AOx20bOPHIjl3+hehdJUY9uBZkpaPVZPm9BlJLxD35YgARobyr6A9xGteJb6t2yQ9HiBaQPj0iccooOWkZM/eQQeHLxYV8HKK/ANkuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sU8Y1LyO; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sU8Y1LyO"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso125835705e9.0
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 07:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497450; x=1781102250; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6HeY09Hs/yA1VsCb12QfnOsD8A+OUTuSPAKRpX1XwI=;
        b=sU8Y1LyOWJoQ+cugrHKHjhTuuk5fLa/OeVlgfCQX2elyMlGUtdhMHk7l3RI9xIPO7R
         kSMbrV4fExvWxiJhwL9AoJ2wm+u2BYk4BeHJXwpfhY6oqldlJ99vvWxYH9OGGYy+i/B/
         ydhkK3SUstKrJx4eIOUE2fC0WErGWhtxg8fGwdnOlQ/orWfeEgj5W0vvvFdkKho/jGm6
         jk2YiWOGS9yJbUjXBoXl2VxFwbiLX6e5EfQOxLkoycBwAQXty1tToJgJiTBDvxgyB+MO
         wIiaRLow8Ii4MSgpoqKj7kcOdQjooxaPNVvgstN3KCjAcigs4IwkAvrmYfQUEXeWPsQn
         jBiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497450; x=1781102250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I6HeY09Hs/yA1VsCb12QfnOsD8A+OUTuSPAKRpX1XwI=;
        b=tUnMCy0FHn/t7EjymKaU7r0MlhH+YiByQ2KIR+EPjrBH1jyzKRI1Bw7zb0qw+TFFV5
         rtC3H1DkQfvPOaSAuVW6ouW21I7evucmSkruWfluNxqhOyzPHqi4m5HhlvJ/EGxItbgQ
         HqPWKeN6ZCPU2U1RyDYLkxICDwrzZwPjyg3h/eYlcqGhE7NmFJYcndG06KzHVBPLy2r4
         MeogAit9cQ9VaLkudVw8He1R4c0Ycc5AZQSix4+OQTGpq6H+plSocNkcJfdnvPnLsUAO
         oAvQb10Pvfe+hu5LQy03SN3iP88TIH2mJRUSUXJ3lDViPyjJ+C8vq5ZZrqTsIazBufTx
         okxg==
X-Forwarded-Encrypted: i=1; AFNElJ/RkNo0t4xFfWCBzAvAVGDCmLZycgdjz/JbasXYEgWoeTx0VFrPkpgGPB7rVG6VNWSsZwU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJR86We5hlg08e/VF94VEFlX0kp0GQDTZEYzkcwWRzVirGLVXy
	kvWEi1Ez4hr06X9bAlrnKNZfpI9+ko15+sH4iR4gtomaHLbv5iV+75dj
X-Gm-Gg: Acq92OHZRmd84/2RApqN8MBB+k1UMTgx4qT61PlekX6oCoLrNVO7nof7/3USMQATEtb
	pfAJ5eqoCyuPFdQ4htzgcjzpmsk6Aq3fkHUFraCOdBSpVrlH7buCXwdQ6cKWszrmxeSCD6Q7Kxe
	vTuo+ut/nW+lZyiVaUMeMrsvYyW/KD2qR050Uco48Sg19tn5wh7PkOsYcXtYZ5dak2MMoO6VtuH
	Sc5QXbHZ6sTPEiMkvEexlRbeysflL2WEVK7y8UGpO1RKLb/n6y3s4Eugdly4YBd1ytKpZPvgw4n
	Er3zraC+lR28LAm2lo977wyxJTMFA0nMZuZkjchzhmVIHn/W5zM/9JPPaRbE+QnXdNc6zKg9jxT
	xaKC/F5rXJfmbyYoxDgWtIuDdr/FwAd2JOfG3/p2zIe50huZNj9sOgbp75BbkotHTI60DDfQnzt
	eN+fwFSuC5gVZAjK+d56bh5jC484q4EED71MSjLwBGrZy5Qonej374zD3EJk6+h4ve+eGIoO6iX
	4rSx1tEvGSKNdmjhfPbqb64e2ZyB8LElLqQPjxGMFAmWbym7jYbdzwz2Jw=
X-Received: by 2002:a05:600d:4452:20b0:490:b58a:dcbf with SMTP id 5b1f17b1804b1-490b5e763a4mr43825555e9.27.1780497449675;
        Wed, 03 Jun 2026 07:37:29 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:29 -0700 (PDT)
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
Subject: [PATCH v3 03/14] arm64: dts: imx8mp-var-som-symphony: add TPM support
Date: Wed,  3 Jun 2026 16:37:10 +0200
Message-ID: <2e7ff00b61aaa855aaa2c6d9ad6e98eb673bacf5.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.

Enable the I2C4 bus, add the PCAL6408 GPIO expander used by the TPM and
describe the TPM reset line.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 76928b005826..6c19a63ce405 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -116,6 +116,31 @@ typec_dr_sw: endpoint {
 	};
 };
 
+&i2c4 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default", "gpio", "sleep";
+	pinctrl-0 = <&pinctrl_i2c4>;
+	pinctrl-1 = <&pinctrl_i2c4_gpio>;
+	pinctrl-2 = <&pinctrl_i2c4_gpio>;
+	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+
+	pcal6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
+	};
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -201,6 +226,20 @@ MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19				0x1c2
 		>;
 	};
 
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__I2C4_SCL					0x400001c2
+			MX8MP_IOMUXC_I2C4_SDA__I2C4_SDA					0x400001c2
+		>;
+	};
+
+	pinctrl_i2c4_gpio: i2c4gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_I2C4_SCL__GPIO5_IO20				0x1c2
+			MX8MP_IOMUXC_I2C4_SDA__GPIO5_IO21				0x1c2
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15                             0xc0
-- 
2.47.3

