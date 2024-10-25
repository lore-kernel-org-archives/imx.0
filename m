Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31071D9324
	for <imx@lists.linux.dev>; Fri, 25 Oct 2024 09:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729850364; cv=none; b=Q8wCHR2ZwsSBEg8sZHtc8EyAeAbV74mCzVszpkqg0Bwvqt/hZbFWf4M8Yw8ZPnUH26ZtsA1S4g3h52MrAlR3lf52UUwv3xjGpY90z0KklIhwGvs7j42SSJQAD+wNA7rNKO9YXZ02fhapqGOd0WWRZYAr2Kbt78xnIVv2Y43Rwpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729850364; c=relaxed/simple;
	bh=fBmyIDKPno0DYsTiITeI60p5mA0bO0r2hrftp9ABmLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P04i6OkuRLrV2x/Ui1J7S5R7wRdAl3o71hOJgXZNQiz4Lh4XMCZ/t36loJ8waNZtPDxY8fO98fCs+o6LJnRmHxcXB7OqrJ6nxCbyfl05JoaVXwg5Cz2uMSG9ZwNzTcm4ZUNLtgjspIspc2GPqCvWhFWHYOvMINVJQn0GRjw1g4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJ6Rd13+; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJ6Rd13+"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37f52925fc8so1278016f8f.1
        for <imx@lists.linux.dev>; Fri, 25 Oct 2024 02:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729850361; x=1730455161; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujk9DybyKkZDF/2MtHXApKNICNk9/HaCwbVOr5hVCKk=;
        b=gJ6Rd13+I4fVobZZr/kwMF0/Q2gSSuaOciGBFQvLEVOa+dIEiDyV7WaPuwrGlUlWhm
         JFEeKh6yr9PTMN37c1C8dJk7Ct3smZzggA3wqhXRHs8VXj7dRbEiCCKz1lsk19WpEHEu
         4MXCnH49hoX8MGUn+/Qrs9vfN7/BLsOGFjV/iYAn64jZslbFAenMWadQHZm23EHwhj9k
         iETWuH98rh4k78NQDoH53L50OQNOf9xQVbzZGt/CO64cuZlhZt98rGg+1pSiLrlGZQuE
         CkPmcBCxnfM7toGEO1WTPEYomUniOWtlKG90LCQk/SxYhRp83yDEYAKFwxpnKFZGDteE
         Wy6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729850361; x=1730455161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujk9DybyKkZDF/2MtHXApKNICNk9/HaCwbVOr5hVCKk=;
        b=scVgxD+v5jAD2302TRIcdNoak2D5Oq7qA+5KPk7ywds5I+0t5LbD5Ny74/GXIsBw7f
         x+7hFAtrwuLLw1n4VzjAhQ1zTPr2F8sbrFD4pY1O+przUDwR9iXBhLazBkpixMVXeXKx
         JrekdNUrbok58v3Zlxf1myUMZGyIOZe6BI/O3BNgVd0zy6agVIuAZbHDmTICGN1yveAD
         iUdCLQ8EDOYx0+vW/oYkSlvqFLYAhq9sx8q53K8zFTC//QGoZcFkqMgVlrifquRJUIRH
         +BdPOoIhMUz9MhgTdV0+dY/lJHthYZPYlbwFh4MQ5g7g+XrN9+BtBCgqoJbixFv8ujNc
         Sjig==
X-Forwarded-Encrypted: i=1; AJvYcCVsrpTonKZUX+zXuGlzRXzYkEkV37f4HIy0+QgAoaLXmxH7OLlxnMf4SC05G2nkGdkbcvg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGRU3Rks+Zd6HxLafmfDTrRxCfhLJYyWTJqXwSlFkS4QxEJlba
	Y4U4Nf3J45IEjtf8OZQj2JvUUE/KoBgM/V0FAm/Znzd1flRzfgRh
X-Google-Smtp-Source: AGHT+IGQ/FkY+lqoyXqrOcHuZexookS5gw8fVWByzJEmmycGhV4kbog53gMdjkWU0W54WsbGNSPHXw==
X-Received: by 2002:adf:a442:0:b0:378:7f15:d51e with SMTP id ffacd0b85a97d-37efcf7f306mr5781853f8f.43.1729850360713;
        Fri, 25 Oct 2024 02:59:20 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:7bc0:826e:69e3:7e40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3c7b9sm1098214f8f.32.2024.10.25.02.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 02:59:20 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v1 2/2] arm64: dts: imx8mp-verdin: add single-master property to all i2c nodes
Date: Fri, 25 Oct 2024 11:58:03 +0200
Message-ID: <20241025095915.22313-3-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025095915.22313-1-eichest@gmail.com>
References: <20241025095915.22313-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

By default we expect all i2c nodes to be single-master, we do not have
any module or carrier board that uses multi-master mode on any i2c
controller. With this property set, we benefit from optimisations made
exclusively for single-masters.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index a19ad5ee7f792..323b45bac281e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -478,6 +478,7 @@ &i2c1 {
 	pinctrl-1 = <&pinctrl_i2c1_gpio>;
 	scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	single-master;
 	status = "okay";
 
 	pca9450: pmic@25 {
@@ -669,6 +670,7 @@ &i2c2 {
 	pinctrl-1 = <&pinctrl_i2c2_gpio>;
 	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	single-master;
 
 	atmel_mxt_ts_mezzanine: touch-mezzanine@4a {
 		compatible = "atmel,maxtouch";
@@ -690,6 +692,7 @@ &i2c3 {
 	pinctrl-1 = <&pinctrl_i2c3_gpio>;
 	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	single-master;
 };
 
 /* Verdin I2C_1 */
@@ -700,6 +703,7 @@ &i2c4 {
 	pinctrl-1 = <&pinctrl_i2c4_gpio>;
 	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	single-master;
 
 	gpio_expander_21: gpio-expander@21 {
 		compatible = "nxp,pcal6416";
@@ -788,6 +792,7 @@ &i2c5 {
 	pinctrl-1 = <&pinctrl_i2c5_gpio>;
 	scl-gpios = <&gpio3 26 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	sda-gpios = <&gpio3 27 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	single-master;
 };
 
 /* Verdin PCIE_1 */
-- 
2.43.0

