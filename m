Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2672648124F
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 13:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780492383; cv=none; b=SNtpTZZF71PmigfFest/q5wYlp47UzSsYtrtE3R7Ri/IM3U8flYvIoaxz4IiPgPutDjXGAxVgGC84aal+00Lpk4dk3SCWpvW1RJu6rUbuBzFuuyK2K1Ktm0JQ9FPhMnhy48XwGZVPQPRFAhUu2y2aDTmcvwU7FGa8TtgWWdHtnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780492383; c=relaxed/simple;
	bh=CqAtrMIAuTr+WyduzWNqSyX4HgxvH4WS0Z4W7V7NMwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VHnvxHqhCxe7nSh1vz9Isy9XP1boMaZeqPlSXJ7f7KVTlv/jH51UDO8ZK7+89fyB8pUdbQe2vuBoZOuyo/f7K3xI/9cxGXGAeGkxyCv8FkB3SKMFi60rLrb5KoHSs6hlQfvTfZSOa4kzgVNONWsQmds19/J8vwyz7SYKHtPyhm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjJ4B+sc; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjJ4B+sc"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aa68d65d24so3890994e87.1
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 06:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780492377; x=1781097177; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LItmvUsB8D4hbVjxhrNTZcvzqIugkVhfkUtCucFdaKU=;
        b=FjJ4B+sca+2ktnzZbcNEik4EYgTk+H4GusN4Fg05LtGMrV0o2Fq3CU4xhdhMNMI47P
         tPmrG4TTlfAPS81YTuH+8Kgb60Ya9vyKw8l3fcRNh1gwjCb8ACEYwgZJD6arVJxU0H+O
         as6JY5xmR7WhMlSg9c2d3uf15Vbc+7fQNcYEek6m8PCtKANkDOKz49SN49/ogNOjC3Hp
         i0h4mNPVYD7BsSMoZ43Gx0kxWNV0lOJpcyqklC2Q62wpJWn1FPIBrPuYKnJxuHMHy422
         fsra2r+hnaaZvhnA+VEeWjPxrHwbo7KBpFkT8KtDKuuvOhyoZ/r8wymIK4lAa4v/kZXN
         d4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780492377; x=1781097177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LItmvUsB8D4hbVjxhrNTZcvzqIugkVhfkUtCucFdaKU=;
        b=Av2MYJDu9lxYy25ptseYZ1s1+jvz4Megu4GaAS8FOiwbvRQ7eJEn8O8qa5kQcmZaxt
         mPfDMdso2o9OU7FD5r7uJ43IdxkP0TU0W7sIqVBN0occXQFNIz+czCu+ZvP3N8VyZsxE
         On9GckNZ3gQ0drwKqyLMlKrDfIu1ZkeJwWbR8pnqnZa2cf/PDy7k3te5zyCEY+tVdY7l
         FxO/2u/QJVwWXUmbR8ayOsTd6qaY84lGcJ1ZjXSK2x0PLYdinF2rJJn2pukzNLOzOQjI
         OPaebUJpoZX+afrSPP8JP20VEjr+R224D5w4lfbf20qLHsCpalWpnu/lkUK+EUGWLCyq
         9Usw==
X-Forwarded-Encrypted: i=1; AFNElJ+9uVJsGQ4nJDuAxPjLWOfwhKQB5MaD8Akd8qMVFQDOfBwR/fOEfzmjURWNx1oUsN3/gRM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzgGJpgpP9f/mGKDs3DTowjd8ba2ilJQ7MYXcIBSmHo8b2VdqEm
	+ZnJyiyVIFOJAFeyjNzJiFZryMIrE1dhAa/Iyin4VmMnUXyRNb+/52tw
X-Gm-Gg: Acq92OFeQZeSbyeBMx5W5Kvw1PvSSx7JulgGnTw8OvaEP5zVh6CwMXjjs6F40tuLgvT
	UevELdJxzshGfs4aPiG0vHd/a51ck2BICfuNSAfZdvjQYYS/YinF3XPAax3WB2gF3BC7pU2Dx9F
	ZVgxFhsfEPXaZUqTU0EA4QIoOEQXE3Na+nQ/yuhDmeubXXMFBmCY3VplDeFA6q5Q+9B6LZnNQcN
	FV7H0uzUyMwYOxfEPSTB/7WW29XqtvyMuDTRSWVYpl1pMX0YTW2do/OGkvWOuwRQTXx5c7OXbMk
	df8BFnFay1VHPwgKkqTW7gqpacekFoUky0VNt1jbsc9EBP6HF0c0FCaAQX1T3BzFUGfEXISGzhu
	EEaGMUxFNanLXGAbDaE2Htbf2aEQa3dvcbXvKvQHUErc4kl939CBZysQ/IUcpyqke1XuRXHuaEC
	hWrBFKvJLDehtHFCI1ymRybE+La6eKuJju7ChE/SUtqC9538oKsJEXVE1YUh0j7s+Ce0mGOLzJQ
	kjI15Yw3ntqJb3g4kzkP+hmdYIJj+SMhyfv7E5ufjRYcFKDupAyy/KAH4U=
X-Received: by 2002:a05:6512:40cf:10b0:5aa:6e86:55e5 with SMTP id 2adb3069b0e04-5aa7c09b9c5mr1017427e87.13.1780492376896;
        Wed, 03 Jun 2026 06:12:56 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm8361306f8f.20.2026.06.03.06.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 06:12:56 -0700 (PDT)
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
Subject: [PATCH v2 03/12] arm64: dts: imx8mp-var-som-symphony: add TPM support
Date: Wed,  3 Jun 2026 15:12:41 +0200
Message-ID: <2e7ff00b61aaa855aaa2c6d9ad6e98eb673bacf5.1780492180.git.stefano.r@variscite.com>
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

Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.

Enable the I2C4 bus, add the PCAL6408 GPIO expander used by the TPM and
describe the TPM reset line.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
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

