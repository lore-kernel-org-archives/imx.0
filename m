Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF1C47D93C
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 12:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488017; cv=none; b=EH5bNWCHYHA+esRLaRMUDp8mlLsWxOU/DN1U74fd304TC4bEg0kH0oJ6uTQ0IG1nfwPxTwGPO6QYaaeZHnpRVDGPrtIJfVLEMlz7HAjP+pblCvdMHRE42X9cZ9voT53aOddcTOba7swA305oliVPWk9P3yUxYpqr7tSEfdeUJB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488017; c=relaxed/simple;
	bh=iDzCVHKlS/caaXxuqnyZ0CA4X7dCoZ2adVSPzilWPV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C8wrLxeaWDbprQg0Z6SziCzLVJx1RUHzqe4uD2snn7RL1xcmuVMr7nGD2kw+qlbbIjCwtO5NL4A0wt1Zxx7IDU4Vf2zgHGHxk+ynn0kMx2sQUsyoxnF+jAZgcq8W48Q+Ny9PXs0zBmUJBIA9MgOWYD47SAs8bnklxJbTwL1p8qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWUKGw3n; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWUKGw3n"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490b43e2b95so9628605e9.0
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 05:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488015; x=1781092815; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OC1wDCeyooboIhfSEf5L6MjWXV2UqSS71W6WzHJhc0=;
        b=jWUKGw3n5eYX/SlW+FaCj1duE1HVTQ/4GXCR7Duxo4aE50lqyZqIJ7AiQWe7/JYJIn
         hVD1MIGdJ0+hWS9dN5Ff0jMoeCrPk/qhTF8Y9EjHIhjPcqUh0eB/SNvJkdncv59E/VUt
         nsZGnmg8wdpihuprAZcDDqbk9yVQ9Q5UUojTsZImY9+g2n/XkA/9V1CidaY09zI7FwGC
         Lro/gLU3h4RZxR3tun+gB3n9kqNR1dGiO4jggL3QcD6EDXqUB3Ail8u81u9wmGaDyx08
         Be+qTVbQiOexM36ZBDt3jgbyt/WbYzSdKQsXdiw0oNKk+EhZVQLoWOgbGYZ6ZYn1HC+N
         72Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488015; x=1781092815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2OC1wDCeyooboIhfSEf5L6MjWXV2UqSS71W6WzHJhc0=;
        b=fqFmTlnbN7Nw6+cTvKy7GV4Kcjm1XKEfhDTFf4H6OcJGXZg4ZtMdasfcpKoII4zyjK
         yot65FbZzcwH6qzJnbmdOutj0FUTT2C0lcyAlW1/GgSFNaQly+fF4tV8zr/cJoEWHBys
         a+AVdSJ0WE/+2FnY/5ih6MgS5aIX/fC2K5CHTZfNfXkLj2U60IQba655cGV8lbSe4xyF
         XALBw95VNfaDu1w6zsAHCNwXERyX6o40VbT82NeYJqwqEpLWxKDpsIF4WWoJxriX8gXN
         y65EMynHr/a1oW5OF3nIewmm7M8NyPP5aM9SmOqMlllP8WL0G3LbMgHMm+D9vJxSS7mc
         +lDw==
X-Forwarded-Encrypted: i=1; AFNElJ/OdMAN7BXghhGDlfEjXTahf6ure6AELOZ6KlaENg9kv3q8g94aH0ColitM5CeLjMjK9NE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6HthldGASXjf+VG54RIBdXq9w1gerP8+Mms4IQt100Pi9hwEh
	usUmFOm5yI4VvM3eRw2Z52jHY+IGRvs3a4BLj58drfZ5czEnOoahmZc4
X-Gm-Gg: Acq92OE2s3x2i1EQnOJy8kOyQcTXZxpt3rkLqY/oP/qOrMC28m2hzDWcV+xzhLNPkmT
	4A+ZFMbl2NRCMU6x4jfySf2tA6Z4Swdya1emVkNYDCKD+8FYSUWgcg76URycuxO6ZrxQ7u7Mdae
	+V0lchYpkeTGq4lq2V9f1OfhCLvogBdqZVprDzoTbMN1ezRZAvZvFTHPciDFKAPXONZOYZApK2w
	9+O14w6M5MEHDQ7EDdFd+A97Mr8lSd5DR+/CWq/thtU2JqFJ+7eO2r39KCMOFp01A6LShOQb5HH
	/EFwBziEF7F/CRlwzhFYIIeF+5asSmawlYDkBJ9xKaHFADytEWgKpY4ZnWY6QjFQVcfaM9cOmxE
	3EEEnudd3TY/zVjJlm4DqsBz99DHRThaXM6NbVENQHtxLzhGBF+VFTCK0Ne6FlSgwL9LAVxAnOS
	YLk1W9Jc7bfelhuZvLo23bIst/c2Lb4zM3c9rFSMncb/wHFOU4ReYN8BFdx2XStpZGjpqKRB5fb
	MnBOcIGOJN6O0JdNFrb1vyBLDNIhcCMHzLF9XrSk9pekJ1m
X-Received: by 2002:a05:600c:64c5:b0:490:52c0:744c with SMTP id 5b1f17b1804b1-490b5ed43cbmr49272055e9.20.1780488012933;
        Wed, 03 Jun 2026 05:00:12 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:12 -0700 (PDT)
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
Subject: [PATCH v1 12/12] arm64: dts: freescale: imx8mp-var-som: add I2C1 bus recovery GPIOs
Date: Wed,  3 Jun 2026 13:55:50 +0200
Message-ID: <9924a29ac63d025cee7a91b92e11486be46ab9b5.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
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

