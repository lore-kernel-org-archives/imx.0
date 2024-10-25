Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36AF1D63F6
	for <imx@lists.linux.dev>; Fri, 25 Oct 2024 09:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729850364; cv=none; b=IdE4WIU3DhQGTw46j0E2p8DMNL77nlebGsOnrSqb1sJLWjRFw/a4dxOceFNKBJx3liNlg1j0ZSMQ4vZdIof813zrGSOtNgUM8/6ALWF00QqnQpKdREhIQdODps5AbnAE4sJu+z00i824sgC5bof9X7/9v66EAk22iaVQ5jFhcm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729850364; c=relaxed/simple;
	bh=4DTEm7iesIQWirW8sh5Y6omeTGVkUjzxTvYToHDG8mM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e9EKUVrsRNpH9CCOOV02aEFM0WlX7hAdhkFjQjYt2ba/fKBFWmeTc/FSZrJZ2AtnGLp6syOb8RcEVBT76x7qUhWgH5AMg8LGWNyJPHjE/0+N0LbOyltkTcqY8tpHa+zSn2czshsMtRUUd4unQ3UHGlBlYhw/sm8rdTNBMGtFnao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wozcb5EP; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wozcb5EP"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so19176845e9.1
        for <imx@lists.linux.dev>; Fri, 25 Oct 2024 02:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729850360; x=1730455160; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtKvVgvka9iN+kbiGV17uPT0FqDZwLoJavxYI8Qd0js=;
        b=Wozcb5EPCFSfrx4CM1c39S/0g21fy1EMO684YJNcA9IrA9zb9O8fNKBB61O8DJCd9M
         IJek0S42GRaFDOoyZwYkGwblYjfE4Vby4LYI+TpUjLj+3YB5pbztn86plz86EPf8Jfss
         oBmnlhZE5MbsNFOaJWpyMl8dLefK7J2fjJNAMOq28trD6/fkQu1xpO2D+rbZYcY+mVsE
         l/gH0bIS4XmQwTlQXz5c0fnluUYOrwDbmxj7a2CT/sEjMfbw6jysPVNdHvMlOLQvtFPm
         woOaVC0fO5mQGqGiwJ+RA6FFk/9RvGKQuVYcmUdGP6TJmIPWx9ojQEF9NAg6unno8rtI
         m1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729850360; x=1730455160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtKvVgvka9iN+kbiGV17uPT0FqDZwLoJavxYI8Qd0js=;
        b=iKVO/qWS8I3ICyV2S69I5/d9ZQx4HKPK2Ohrvzru0OaaMeVawV8MgkUALh8BIlC1iJ
         BbH1IhMY56U2vIxu8fpbx1O9nLhf+my6/5fyIR3oPn82tMjpkVEmYtD7gkxgtASw1yNl
         eef5ecclcLhQCXGVqxzgOjDB+ZH37zRvl4x/OUVDQqiEIC0VGufD0vOrPYi+nCuLDNHo
         lzhvKwonLJf4uX+epkXgFxPW9Lf+MEdWGm+aWubXF++6ksM0j4CnTwrvfgEA57BpoEuY
         u98ho/Qe1NXhfOpHhmX0n5AUw0nGR2uDofamYy4JwLUG6yqAGqrFZiBTWG71UGi+Su4J
         45Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWLHPzIxX7OshmRuB6Gfbf2alN5MZW2qmGy2SGtazGE0Wozekg7gt3Zu3blNhuk0z0Cjbg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxIBh8ajH3wJY5W/Jk1lx2LxVEmvZBrP4OrovhUERlj2ZjC7Ixt
	t43aDGObx1sip6CGNQSICQRM1ge6RjkMjYkut12K9MHt13+zkbHw
X-Google-Smtp-Source: AGHT+IHgz1qa+4ruXXEU9mLOWIYjUTskP3J0uPmavT75tDGVcKYFxvpomruMOKNd7WxPb9yzDb7knA==
X-Received: by 2002:a05:600c:5123:b0:430:52ec:1e2b with SMTP id 5b1f17b1804b1-4318c77ee2emr44793845e9.29.1729850359933;
        Fri, 25 Oct 2024 02:59:19 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:7bc0:826e:69e3:7e40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3c7b9sm1098214f8f.32.2024.10.25.02.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 02:59:19 -0700 (PDT)
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
Subject: [PATCH v1 1/2] arm64: dts: imx8mm-verdin: add single-master property to all i2c nodes
Date: Fri, 25 Oct 2024 11:58:02 +0200
Message-ID: <20241025095915.22313-2-eichest@gmail.com>
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
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 5fa3959141911..95d5d2333ca1e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -367,6 +367,7 @@ &i2c1 {
 	pinctrl-1 = <&pinctrl_i2c1_gpio>;
 	scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	single-master;
 	status = "okay";
 
 	pca9450: pmic@25 {
@@ -561,6 +562,7 @@ &i2c2 {
 	pinctrl-1 = <&pinctrl_i2c2_gpio>;
 	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	single-master;
 	status = "disabled";
 };
 
@@ -574,6 +576,7 @@ &i2c3 {
 	pinctrl-1 = <&pinctrl_i2c3_gpio>;
 	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	single-master;
 };
 
 /* Verdin I2C_1 */
@@ -584,6 +587,7 @@ &i2c4 {
 	pinctrl-1 = <&pinctrl_i2c4_gpio>;
 	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	single-master;
 
 	gpio_expander_21: gpio-expander@21 {
 		compatible = "nxp,pcal6416";
-- 
2.43.0

