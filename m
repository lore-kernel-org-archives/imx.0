Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C3C374731
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353828; cv=none; b=aZQ0mm26oyqOHOvVfwH1/46p+t/zKf5F8qDHtKTyDVx66G9dUzAiz9xqVBJ5py5Rqdjvb33pn09jCwtd9qGrozQge1PszO8KPCUJ73enLwjy8CgXyF0BvCNVfC111VK/gOKLalQWwa3VZ68Eb3ynSvxZSOzyx1JqTl5/eP891jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353828; c=relaxed/simple;
	bh=21585bcokoJUYx4ALilZW0mEl59xhz//2F3q1cPbkR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DOP/YRhyCP898vT0g8T4qbHnT8kKTE3TgEfvbm2+5Y+yc5tFvIO/1iXkWMvICTMDLwtxVdULs2poQYfTFW/ajQXzAJf5bX35VZd95s5L3p97xJ9N/xIKAffqwjsLievJkQ/FyS4AJNcNutLqq8bBYpeoju4VvEul6RRJSdPBT4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEV5DwsI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEV5DwsI"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48069a48629so42758005e9.0
        for <imx@lists.linux.dev>; Tue, 17 Feb 2026 10:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771353817; x=1771958617; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aXn4tBUxeH2P58q8ihGRGzP4M+/r8Zrw47NlkaisI0I=;
        b=jEV5DwsIbvgIuXJ/VonifW/1tphJj4NI2azCPtQvWpCl10q1QQQz0hH/NDosgSdunA
         kgV5wmGX1mhPuU17d/k5GkeYsTYjilmET7w/b/gGBI1L9WlKfxz+5UQXM+8vYd8ZeECi
         4c0VYL+l1tBOYyyK/ovpq4zOCA+ptmgB+vYlnam8EdsLrpKSkgM9QxT0+zIiMZLm2cAt
         crFiKDvs4dE8E+Fu/clsHJZFcqiyqjXXfcaapBlijBqEOUP6ZddFDDYxDpVCIw/y/Xgx
         2lTmtS8E3l8HL+F+HdC6Kj8movNESFNeqhBqHJzofjWLfUv/AipV5dRPhPO/IEpuOUH1
         0G5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353817; x=1771958617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aXn4tBUxeH2P58q8ihGRGzP4M+/r8Zrw47NlkaisI0I=;
        b=hUXhsgxfb3LCfQrK3Pt8GBssOorZ1bAU7lo26dhAiXS7Hc//dcGJUygptVSc6bRDOL
         gzgRHGM4DjCbATyQWMLgMSBWkLMIJ27WtzblTu5D/sM9AKL1J8qDqODJUK94vVupboUu
         1jWhO8WgfDqTPZHDRnBhAk7egc431VMbeTYWph/Vxr8I1C1igwRgdELwqRzVUC/++IXx
         FsPqgghj8DOFOzneTVfeDLtLRrfY7Jz0qBzlKwpMBlXgbbQO8l+n2eVlqesdE/erLx0f
         SijNF7K1nONeTxSNbZcKVdddOSH7apHVI3ybtlPXUHmzve/qlHUq3r1N6pNb4HsxgrsC
         LWbg==
X-Forwarded-Encrypted: i=1; AJvYcCUY3lfN1vBImkXglbE95XS5c7pL7Cc0pgF3sxYD6c3IuE1jvd7bwJN7/ejWCQgEdPjzISs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCU62ZmoUDEOf2Rvuz3VzCM67CjNVxi0ducj/NLpbqDQfoCyb3
	nCzyvHN3M0nqXfBuxACyH2eFE3pk6eo1VQeBwkUgWdiAQJ2ewJNMQexg
X-Gm-Gg: AZuq6aJNcIvGQsrY/0gXMBb0FgTUXU/YBKv7xcAV2Avbvorb5oRF9NbBy/9hANx5jSs
	Wm18RqcFrVdfESZ+MMAs4pJDAH4zCbsfCoq5tgKohg+yNID1Rzb1UrHYD+LAVX/TV7dqtJWxgal
	UiiODpVO1SpleSXSW253h6DwIlGcH3HvrUOUq2z+qrKbz1hTsFXrUJbgbW9nhkks0eW6bgWp8Dt
	+/jWStaMvUApP81un5AN8eFHBi1b+7s2yIp/KsK73IW/jpl3Kl+bDhxeuY/jd6WoWx2D4BfG4HF
	OhTOdY7gao5itRxUGZl5nTOwlrv0gDGk+lyPgfes9Jl+vYJbCvW5/QU4UxDv4wZqbGn8hC6Jdj3
	Fw8OBf488llhmDSHRM7NpYr3L/pk90/xKcL/M1nT/nKEfqAeztVRAllleuBGWMX6PSbokUkzsOm
	FC2mQtNVyP4CXN7kpKBP5JVH7kAJLob81cDwCaQUJlOj2EzUHcOETXjRsv0xogoUcmPyvDfrHBk
	TC0TCoRsKz+sgc6CRWTCGnQ7pJB7aIutX8x/5Ud
X-Received: by 2002:a05:600c:4f0e:b0:477:7bca:8b2b with SMTP id 5b1f17b1804b1-48373a1029emr277764195e9.15.1771353816944;
        Tue, 17 Feb 2026 10:43:36 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839731d7c3sm1096185e9.18.2026.02.17.10.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:43:36 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 10/11] arm64: dts: freescale: imx8mm-var-som-symphony: Enable I2C4
Date: Tue, 17 Feb 2026 19:42:44 +0100
Message-ID: <c560f9a4d2de222deae6fe14d75478457fb46b58.1771353301.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771353301.git.stefano.r@variscite.com>
References: <cover.1771353301.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable I2C4 on the Symphony carrier and add pinctrl configuration,
including GPIO-based bus recovery support.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mm-var-som-symphony.dts | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index b4dba1961eee..3d9658edd58c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -172,6 +172,16 @@ rtc@68 {
 	};
 };
 
+&i2c4 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default", "gpio";
+	pinctrl-0 = <&pinctrl_i2c4>;
+	pinctrl-1 = <&pinctrl_i2c4_gpio>;
+	scl-gpios = <&gpio5 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
 /* Header */
 &uart1 {
 	pinctrl-names = "default";
@@ -265,6 +275,20 @@ MX8MM_IOMUXC_I2C2_SDA_I2C2_SDA		0x400001c3
 		>;
 	};
 
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C4_SCL_I2C4_SCL		0x400001c3
+			MX8MM_IOMUXC_I2C4_SDA_I2C4_SDA		0x400001c3
+		>;
+	};
+
+	pinctrl_i2c4_gpio: i2c4gpiogrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C4_SCL_GPIO5_IO20	0x1c3
+			MX8MM_IOMUXC_I2C4_SDA_GPIO5_IO21	0x1c3
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_GPIO1_IO07_GPIO1_IO7	0x16
-- 
2.47.3

