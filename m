Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0133A1E91
	for <imx@lists.linux.dev>; Sat,  7 Mar 2026 15:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772898928; cv=none; b=pdR87qsLEcpQyvYDmzNJdJvvYDjv66eoRdaHBMNaTlGQUEmuI/WSHF0dxDwwYuKsvBZsHLbGsfLzL7J05vbFQlTYQjIt86W0FR+siq9F6F2mapYKoF/gjdXK2Lb0H8iKdFRuOOlXNDL1Qz8hwWJtu9B/oLOCNYNtdurIw3wsSUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772898928; c=relaxed/simple;
	bh=ObTtrQlb2jYlqMDNbq3CyCy3XMEw8rpLNCaIh5h1cNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MZJ0Fmek4qMwLyDJf6SPIJqOVGA0GM8SmCWxbk0ngExZSLB9ZXGSVD0QI1Gr5u0fBvDaFsnVplUqUAnGhpzCscdmtG63vCkdY4CfS6lTVg5QFE2DXiU0Z5ual6SRyF7SUTRKFVNaE5oheGRzDQGhMuIK4mI1SxWT+H4sVwe2zXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h36r8o59; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h36r8o59"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so5653745e9.2
        for <imx@lists.linux.dev>; Sat, 07 Mar 2026 07:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772898922; x=1773503722; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UwJ2eq1zLJMsCb7zWFBE8c4gt2oUB4SlgMSSSoBm2w=;
        b=h36r8o59HpZuAjIyEo2MHJhqit86wLpM5Wn7WpoF3uaZLWIdW6rPl0tFbF8hnBPC4E
         Q7ZGBDj68lDT2V3jNo9TkFCOVdnIWEzKvg05L20e1hWHEOxXOjip4KzMFL08/Jp70oyD
         ubm2OnyM4RymcjR4nQy2iyTHi6q7zLAtFV+kIDzMkU4kQ1EP6yDuzhMlFyq9xA1cxDsP
         HpoQQ1shmHz54yeOZ4XtseBFJ1MLU1Js1AltYQ7ILbPFLXVRLr59b/3g5ehQ4ktAum7L
         HUr3VuRkt+Qem0j/Jb+H2t7V08xczU2egU/pVaLxuy0mwF9CO1nhVTnq/uZXbPEoX4yW
         F+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772898922; x=1773503722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7UwJ2eq1zLJMsCb7zWFBE8c4gt2oUB4SlgMSSSoBm2w=;
        b=w9dm7EIKOVZYeKytuRP1uZEsa0FpenNtXxXVz/s+PhHAYgyP3EkKC0xsjuttZAV/5+
         o8+Sa0om40PS0LwTd3DhNQxQ5k6wgfzD9ebfP0i5LAKOi8Bl8t45jOa7hw2hpKOkOvzM
         KL7LWIKX1nD0SaMFpulvDKxi0f3pew4mJna0jjIimMfXMScEJUdZ+MajYcS4lIl6QcGY
         7n3MFyl1VUp66Q0XnsR4B7mszQMg83eBBrHiIXblei7O4dTctAkanRW47l+07vbVupvk
         IdkM4T0/6S5fHY1/M5n/o0YuDnJRaMPd/5yJ0WNijP0Wte9GokTrJHcmVhiNKG5lqzhD
         J8dA==
X-Forwarded-Encrypted: i=1; AJvYcCUmX7MISnWUj84M67PEXlUIzgUhjlzRVqDhjLrmyK1T2FpCSUVh6IJvx4eTN6sfM0C8SWY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvnPmQYxj9pnQdkdq1dLxEQuiDoZ8WhPtvzfI9bdlEDGz6M4/J
	/1R/EqToFho/5brtKjDHardmkGOmxwb2DZSqkY2rKNfXCP4/x+2zvN9i
X-Gm-Gg: ATEYQzyNRWJJ0w2sM9u7FtAhaRvLX3SmMk3vdqevhIOVSy49IClV3sGEZWzsNuDpAnG
	WF/oQHITkTB5LFdf2i+65JfhAD5uupoxB3poNi00yGFz5V3TqzmfQrdqSePlmUVvjEDIl5jZh1D
	vFf292WvH3zEK5JrVD37SUQdGjMlBw7SOdm4Epimj6egse6rrj9Nhvs7PFOwVhQezVWYS4mEMkv
	wkvLO6VGGSNXYT71rM3mKQCotXFhbwI0TUvb3BStZ/TrhNmP18via6Yycnyk2V06bvn8ud6SPy8
	ASFJPVyvLLcI4MQ+utLce8zsjn876Sb7NXc8l6U4W3HsZUNBHUTikEfH7amyWXmiVoSlYOOEPSI
	TSc6aNtPfagMJVokvpY2j4CWaIhAVTe67DzENXrCEUh0VA8SELP+2rUSP7dahcO1diq3Rf+TUZn
	ZjiQSi5Sj+O6vMjSyNdHO1V9agcbdDzGcoMegcOgxJ7RSA/B9j+j6b5QYT2RtQg70AqE4QwDXPO
	aHCl3Dwlyyz0mlCYrfM5Ydq5A==
X-Received: by 2002:a05:600c:3e08:b0:483:7eea:b172 with SMTP id 5b1f17b1804b1-485269675a7mr104390265e9.23.1772898922163;
        Sat, 07 Mar 2026 07:55:22 -0800 (PST)
Received: from GLaDOS.lan (93-35-179-236.ip56.fastwebnet.it. [93.35.179.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm261097785e9.4.2026.03.07.07.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 07:55:21 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
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
Subject: [PATCH v3 10/11] arm64: dts: imx8mm-var-som-symphony: Enable I2C4
Date: Sat,  7 Mar 2026 16:54:46 +0100
Message-ID: <02dcc47d59674a9945ade8a6f2c42f4c0908942d.1772898346.git.stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772898346.git.stefano.radaelli21@gmail.com>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

From: Stefano Radaelli <stefano.r@variscite.com>

Enable I2C4 on the Symphony carrier and add pinctrl configuration,
including GPIO-based bus recovery support.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mm-var-som-symphony.dts | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index a77085b264e5..9a29c81b06eb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -195,6 +195,16 @@ rtc@68 {
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
@@ -288,6 +298,20 @@ MX8MM_IOMUXC_I2C2_SDA_I2C2_SDA		0x400001c3
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

