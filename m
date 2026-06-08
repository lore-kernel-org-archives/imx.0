Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FC53DEAD2
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 14:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929701; cv=none; b=T9F0yiwwi3vXspPN8arYJlpLgBAeOt5qkhsoDId0LxPQizR/sOr1h9TBQrhPfQpFEd4wg2WC0p4cMA9KtcAiB2fOcbFxc1akuIpVF9Z5ysJksgovE7szO6DqM4jInsh+Eepl3YL6/mKzTOfBj7o5OfFw/jSZjBDCnWVV5Q5F6lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929701; c=relaxed/simple;
	bh=KUBVO4OiU3EVeg6FTS6bg7rhrJDe7/xi+q/lqgFM628=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fNEPub6ttuY81CuRxu9eo2rStItTdsZAA3ja2CJCOc9UMgd1PkzH3dVJ2KiNnTKzBAIwcbmPAy+ABJEnl0VrJi2J5ysr1Psd/fiE/HrvoGMRrdnJPr/U9aNt9K3UV9GBqQ9s/IirTD/TQtHcZwUs22pgaOCys/FoWN5rc2XSmzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Upi/i9B3; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Upi/i9B3"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45eedc94d37so2206654f8f.3
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 07:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929698; x=1781534498; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NaEH5o94OCHyzbwIH4HUGdDm5Drm/31IJdPh56FPBdI=;
        b=Upi/i9B3TtohrWzzSXhU9Gl0JJziv5RPN+euwApvCSCgFAm1WO//WpYK66ZTdoSGN7
         532TrWEnJgO1hy2yZA6hhhawn1dnaOE4CLpKqqMPUCbYImj9GgK3zIMLfnL8Eng3RCfm
         GoJrz4I2QInbBYlxq+aKN3DLRvsMqfYD8Q3DmSCYhGtMQnbBmHN1Xua0iKBTucqDEFI8
         974SOq37jMNX80BF3fVTemqdREJjCNkjHTvQ+gX5zcYVkPxV29cs/4Bjjl0ebveE8is2
         tgMiELKVd/iPh4IPuWxTYlSfkxX495acaRfNGPlWerD0Q7i8Fd6CLPfcCsqveVIBRTTW
         oSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929698; x=1781534498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NaEH5o94OCHyzbwIH4HUGdDm5Drm/31IJdPh56FPBdI=;
        b=hFVd6pqjfUOMXh67ajtUb/ig97o8wzeVg2EwKIaJU6XKT+Z5z7eyOO2Ff/eyh6OGRs
         fWQZh+Mtneequ90CFS8BPsPsjMiDsMOCIJqdtwWYMQqmZhBJ4/C7IMOXxoJE84Ouca81
         5qtAUQYcVmUA/3OrZIo3GbM+2jXRyCCn1G9Aq2agem2FcQSuOTkG5QPf2i4Eaf25K2ac
         w7+shn+QFe66kg5j9YsCwRogjXS7m5dDjVu+KqHX/KoJ9JflAwe3mMdk9XndY4dzq4Te
         ZUxDGTkj8SVCHegWlRdMHAwLN2GX+IhZcVAaxDS8SxhBhw/pHwSc/WgWyRsPhfApCCOS
         UjcQ==
X-Forwarded-Encrypted: i=1; AFNElJ/AOA+UnQOXtF1RcE0E1Cen6rtRNjjSwmMfUgmK2Kx02CqDsHkl/aDSTCHyvS/gSV0/jPY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZrZCTqGu/gmMOPMme9XdgHF66vvzIblQ5N080SgLO6pYnBXhO
	gVSgWsYSuwFZfW09s3NGDaj+zpwNd5iEo9Ty5BNY/0p8nX7FWQonj6UR
X-Gm-Gg: Acq92OE1FXxh/BD1W8ZwW+CGB9tCDkqXzNiqP/6bTImRJaoA7E8IF/biI6QfUA9JQi1
	wipkpuJfCCpKO6MXNf8UgDU9/V02QYfSzJO1QQe/AEtcXF/Q8h+7CDOBhu2wYOYC2NZJNXbsIbG
	3CUbDUedOKDjWu3Md4qTT9PLuSLwSx+ezhX/6i2d7UL1IJdvGZqbEQLRD5xDBbu9P/gMUPEaiN+
	4H89EyodF6I/w1Q8XYCNDaRj8WBE5yd/EmnsEgVqFHW0wiK201IUENDiIqfAlQgDKSUkc7IPeDP
	EfIuqmmVUkJaktYzO91Ny8WCNqRWOj5+TARhKpSCO5UAlcEaZszB73HJHeBFvORI3tMRiPlRRWH
	vcTnyPLoQNztaAN6OtykW+wZC9ftjRTiAWGgKToEXkDnhGXVa/ULkgiY6vehxcDF/irhtqA/8XE
	NvsW6xZY1EiMmYIAFXVTjxlqPSayfukdN/0mC+k2pj2EE542hd5zbrEP9g565KQ4hoKMKnFTfEi
	pnfo2RByc9Q17rIcoUGDDvUY7nNnOn/fsJi9Ixx+CYn/POvfk/nhHH23vk=
X-Received: by 2002:a5d:5049:0:b0:45e:f765:ff9 with SMTP id ffacd0b85a97d-4603063d61bmr18372379f8f.24.1780929698123;
        Mon, 08 Jun 2026 07:41:38 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:37 -0700 (PDT)
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
Subject: [PATCH v5 14/14] arm64: dts: freescale: imx8mp-var-som: add I2C1 bus recovery GPIOs
Date: Mon,  8 Jun 2026 16:41:15 +0200
Message-ID: <06fd759e57a5ee35c46a51947ec0ee24c7eec66f.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the GPIO pinctrl state and GPIO descriptors required for I2C1 bus
recovery on the VAR-SOM-MX8M-PLUS.

This allows the I2C controller to recover the bus if SDA or SCL are held
low by a device.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

 arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 49467b48d0b0..61786eee0e82 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -180,8 +180,11 @@ led@1 {
 
 &i2c1 {
 	clock-frequency = <400000>;
-	pinctrl-names = "default";
+	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c1>;
+	pinctrl-1 = <&pinctrl_i2c1_gpio>;
+	scl-gpios = <&gpio2 6 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 7 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pmic@25 {
@@ -415,6 +418,13 @@ MX8MP_IOMUXC_SD1_DATA5__I2C1_SDA				0x400001c2
 		>;
 	};
 
+	pinctrl_i2c1_gpio: i2c1gpiogrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_DATA4__GPIO2_IO06				0x1c2
+			MX8MP_IOMUXC_SD1_DATA5__GPIO2_IO07				0x1c2
+		>;
+	};
+
 	pinctrl_pmic: pmicgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04				0x1c0
-- 
2.47.3

