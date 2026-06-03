Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6702948B381
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 14:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497460; cv=none; b=qVRaJNpi4QLp2Cjf4Eams7hWXefUbqjF0ubRy4bIXwEOzmJfDL23iXlfEESSaISJ25KeBZflLVgWSP4+yXKtkyj2O7n1Xbe0hJ5eMRhyAdyXTo8d6F8cM5LOTClj7ZTQIxKkPnGnXHaC9rhrE0Xv3Hs7R43uUxqQtX/L4raL7b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497460; c=relaxed/simple;
	bh=f9lN4eCpeq6X4GQCWW5yGIkY8Fi5P6Oy/MMPAeTG7TY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hZVuWPbSpeLbXBZczEILaa/jD5+Av6E/DyzMux4w/t6HN4UYg7hrpcPMDCoS9wnZLX4C7crWCr1wGNuYdUTnvCgEW8cDA9PilLpDsdhtts6wRMonQwNQlRuRIkEOVXz8twX8qwTL3kUE1oHUwsIjs9N39HoNPH+zM9GI2Hn8ukc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b391gAA6; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b391gAA6"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b09e4cccso18343425e9.0
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 07:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497457; x=1781102257; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUKMxUWlLW+OJ1vtsYh4pQyPHiovNF3yTxr4Eq5gQRo=;
        b=b391gAA6yL881U2kWz0j0eN3GhDKYdrmGbd8oBwKz0soG+AvtR6vczyD5ogC/aOM9s
         w5RTQ1k8wd6ItphgZaY3FJlEmXlAg62zdr7dtNf1BjMat+EbWoUqQF5MC4DCWbNNIlD3
         2N51brQ298B7Rmt9DHb4g7LBQVQ5qweTAjcUP/9DE4pO7uJxNCyXfqEvoGIWl6WlpNx4
         7Mp3X7xZ3nTEE+/odQzG4xxk+yocv6tegXaofp8QweScuA1O6KjDXl24pKhSOZ5sQfd3
         PemNy/j+xgqVYgUEae+X0KgZ6s6nDSbLZgsd5OKEd95MExkBLLIM9SqD7u6H5A+X4Zgi
         x5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497457; x=1781102257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IUKMxUWlLW+OJ1vtsYh4pQyPHiovNF3yTxr4Eq5gQRo=;
        b=lWbTzh9N6Fer+t8o8nO49cjQ7Mksp9qgR4VHAFFKn1DlmkOSUTtGVSMbu8kRr84sf8
         J3hLQT1GWoObdOXYgcAHXqusn8yIdObi9pfvcCuE8n7Q5SmF9U1xVDSKYvxi3kpBiob5
         YgG/rohYqHloF1m1qQbhySVnf+AwHu9aFiJjT/ihqfOJx3QkUHUH0bVizz3p2D/lnDmM
         ew0hpQzc7KXkKrALNcIu+m4nVCvD4xsv6omdY8+85HDOpAjzYKqX1F6GzTZRITdN7YgY
         hOKbX8ZJMcjV1Xpc0/+azgXN6p6lRuoX2neSiH3TBoFf2sGmcR0wcun5T+QUrGuwKqE1
         qtbQ==
X-Forwarded-Encrypted: i=1; AFNElJ+rqpkcnHy390MvqIEK9Lb6Cxwg3ajY5hhwkFqCEALGCASzjziVKAslHFzF0RaizPl1Xhw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzs6fjSDAkNpNO6lw3pJoFKoNw58RAA+NyLLqfhWt9lhflc4Oqd
	MdXjv+x0v165hpv2RXTl9fjF2J9pvRzY84RrOJLHxd/pn4wSAo7ZzL3M
X-Gm-Gg: Acq92OGpkWj5/2A6uWLiK0TCvQhM9A+adWQLAkOr0XvoDj7Az2fkWJ27noE9lUj8n3k
	iAVkPKB+4VmzQIV7SYUEYHGf/jpFgtWgrHW/9WeLzRNOAziFF831nElka4y2Z849Ua5S7mC7M5K
	+91TU4A81z4ZAxRbyQpaU30Jtn9Gh04W717YpJKFilk1XOWasct+JRxDir0NCRWPPU/wc7LtOQJ
	cjzN1aTAPPkZ2pB2WD4ZyxARX8j7G5G+yQa9b5aQBTlFTzf0bPjg0Qz1m6mVNnzLWoSVjbybGT2
	jiUAd3HIGP0nxM3Y6Y7GiWKHIE45fVz5TMzScUg3ozf9FQRAHDbxN2uIGRl6dqChnpIM7CmIrZJ
	CeOgZkxbjVsyDtEclxVrkflmJRmB3Wk5yVQi1YVavfu0h6KK7Bpuk4lSOGYEz9k7J7I56gV0Icd
	cUTFRSUcxR/FG0P2iZYnwEf2cMYXbEiI3MCZ+hxcH8XrSuaJCdZdMDRNFe7685K1omuyLxJvQ1r
	hjqOGO+ku02llUOpl1gQjfTfWd/bBasisM6lb1JZw4wcCmo
X-Received: by 2002:a05:600c:8b64:b0:490:b642:ce31 with SMTP id 5b1f17b1804b1-490b642ce7cmr62747555e9.2.1780497456542;
        Wed, 03 Jun 2026 07:37:36 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:36 -0700 (PDT)
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
Subject: [PATCH v3 09/14] arm64: dts: imx8mp-var-som-symphony: enable ECSPI2
Date: Wed,  3 Jun 2026 16:37:16 +0200
Message-ID: <5532bf65f31a8b476d0e1cd030bdfb066400b518.1780497188.git.stefano.r@variscite.com>
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

Enable the ECSPI2 bus on the Symphony carrier board and add the pinctrl
configuration for the SPI signals and chip select GPIO.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 93098799211b..9d08785cdae8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -99,6 +99,13 @@ &aud2htx {
 	status = "okay";
 };
 
+&ecspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi2>;
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
 &hdmi_pai {
 	status = "okay";
 };
@@ -327,6 +334,15 @@ MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03				0x16
 		>;
 	};
 
+	pinctrl_ecspi2: ecspi2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK				0x12
+			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI				0x12
+			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO				0x12
+			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
+		>;
+	};
+
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
-- 
2.47.3

