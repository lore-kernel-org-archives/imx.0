Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C646430310
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 09:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330515; cv=none; b=HD7cTymM6VsxHwhzNWtCy+vKL/msnSDOCJtJCE8+rl6gk3gwmsO8v1gPGxv0t5sMNWBwMdui/i5ruUY7rglZzN0IxM7IwqDnc797H/UdzvWntanLdDfN7Yq9IkxVU3PilwoeRATvFNBp5diYoBA112eduxxO1A9eMU6mfLsPaFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330515; c=relaxed/simple;
	bh=djI+rGgHxeyFLVfHf/xW2MhVP8M5sDcU2LY5zoiSlp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uzowF0GHC6DdQ/f5mJnkHfF/wMer2uS2cfEttlAFchaROtsLnVZnrfMNATPgUu7PAHySP5H8N4M06ybECbv+9BC4FNGXaaMJSvDkTwixKCdLv5T91k0H6GLx99rSmch2g4rSF+gn5BNaeZ7ExFK+UzUtJ9Zbt5ZB2LozQEqblMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lUXvSwcc; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lUXvSwcc"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so19069595e9.0
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 02:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330504; x=1783935304; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvZ9w1IWzzy3Hwyn8ZlFCJ5TENdJ/Z16HfTQd+G5DTg=;
        b=lUXvSwccwYCssrKILbCyQbFhggbz9w/uPEKMUg1HgPFE9L8XThZ7nuUV7xlPZK/M8G
         QsbUrPjvnbj4SZj8+oIPvY7ZMH9Q5aA7A5xo/JmbcAra66zL5c+c2cdHzYSyGhuRBOga
         TSBlIVyyySiVnUbjhiWmBZLPCw+DhDOT4Ktm/RRTZp7WCrClORCFhZ2wXVN8ON7K3ond
         e3g9XDZAO84S/MtXEyhGt0sC3WyGLAMDSecFRuXfT3RMNK62bo1/GJOm8rL6mTHkQcHS
         B2LHae0/ls93zenVW5vFLVbE9MCpPZK12ia1n1Ru3v2qSvHV7t/tz3TR+jBP9fLnWTre
         msyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330504; x=1783935304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZvZ9w1IWzzy3Hwyn8ZlFCJ5TENdJ/Z16HfTQd+G5DTg=;
        b=nY3DVJ7RadSFfblth3cPO2wTHsVrgnz2jr7WMA1BMEq5NGgXxAYYpA1i0JBymRawbw
         4Tkbw9oLY89ElHOMvzoh+0OYmij+IgM9Xwsq7JgufrAWRs1nPKMWv/N82hQTJ9fZ09HZ
         mwhktSgmEDvIHn1ALzDfUqCknT/1MeOnsiwAXer9dC+4inqVxgOQzfslEkMM5p7PQ8Ya
         D2zndtyQxQhy/sHdh+CPbypd9VivTBwWTSsK4gUXHqwncPsIfiMKryiIa43HTHAub6Uh
         TD21cd/qns9sxdixKvROm9XiMSSC6dvpmuZFWSbVjEKwJhLUks91JJ20wrRX+3JpZCIh
         lqFg==
X-Forwarded-Encrypted: i=1; AHgh+Ronic9bVpGS8FsbDFMJ+R24SR5R4Pdu1dpha6xhlI0EwPcpo0M99mQhQscha7CO0eOz+Ag=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9MW5dp30s086v5Gs43DEgPUSnCvCx7iQ/FoG/1VbQfcTTvOYI
	NBZsohwmMW5gH4Ck4syroQyXi+R7gIJhcamSEdGIpEkAJGwZ8KTLhSwjotBpJQ==
X-Gm-Gg: AfdE7clLTZMTpmbp3OfETGpidzJbLLISVhETTw+HHBEv7ucbVkd4MXtB4PpYgVm+wyp
	a4wEozve2zkof87D8130FZMWuUX96BW96XXJ29l0IS/Fz5gXss3X3Hpi+uuA6Tjjp/smXokw6ij
	wKiYF9ENCNt7q/B1VVqDZn1/d0DOhlpjCfjC0rAC/ujLPIPcQtuzhDmc4MdDpSbQBKf5qBf85G1
	oZO9GxaM9kxWKcm6qS9DjeeUTa3viL9xqK63wRuKb/3JEi+bpbtejpmOP5GA2vt9IRDH+IJcDiI
	oM0Ch0nYjvTEShZ62XZxwSP6UxvlK8yhUl5ILd0tkEzklbBuU3aTNwzhLRKcw8dCJAR4agRcJ0B
	O/bALYxSSS4nDUspTGZVzlNrc5QtroAoLRUfn6Lo58B7K1w0UnW+Uy+rx176vuPuVESd0E4mcsg
	llnZYwRCxEn3t48Os5wqklPNIvYUXi1PRKdXW3egojHC8nXC42Wg6dYMNz24TI69YBaWNpRYCnR
	GbV39nIIH64u9TLTpcFTWN3aw==
X-Received: by 2002:a05:600c:4e8a:b0:493:a960:a0bf with SMTP id 5b1f17b1804b1-493d11f3296mr116847075e9.21.1783330503423;
        Mon, 06 Jul 2026 02:35:03 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:03 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 11/15] arm64: dts: imx8mn-var-som-symphony: Enable I2C4
Date: Mon,  6 Jul 2026 11:34:41 +0200
Message-ID: <94b2e50c4f11be384161eb8fdfc82a5c1d7ebc4c.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
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
v1->v2:
 - 

 .../dts/freescale/imx8mn-var-som-symphony.dts | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 7d016ed5e911..4898018f030c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -195,6 +195,16 @@ rtc@68 {
 	};
 };
 
+&i2c4 {
+	clock-frequency = <400000>;
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
@@ -262,6 +272,20 @@ MX8MN_IOMUXC_I2C2_SDA_I2C2_SDA		0x400001c3
 		>;
 	};
 
+	pinctrl_i2c4_gpio: i2c4gpiogrp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C4_SCL_GPIO5_IO20	0x1c3
+			MX8MN_IOMUXC_I2C4_SDA_GPIO5_IO21	0x1c3
+		>;
+	};
+
+	pinctrl_i2c4: i2c4grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_I2C4_SCL_I2C4_SCL		0x400001c3
+			MX8MN_IOMUXC_I2C4_SDA_I2C4_SDA		0x400001c3
+		>;
+	};
+
 	pinctrl_pca9534: pca9534grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_GPIO1_IO07_GPIO1_IO7	0x16
-- 
2.47.3

