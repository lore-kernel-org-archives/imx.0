Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3939B17B50B
	for <imx@lists.linux.dev>; Sat, 31 Aug 2024 10:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725099097; cv=none; b=fkEhLA9yC8qd/lTCci5GDLEfiKC94XWstZJ79d5jMtnJBU2VM4UkJBG/svue98+rsgufv6wNqyFzj1bV6Vh2eNGAad7fH/2yWyjHlB8NBh4ezGTczsU9UX6ystbxGlKkI9AsVS59rkYOa1cdml4g08Ua3KuQAawvqIlX2QmLOLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725099097; c=relaxed/simple;
	bh=6A/KZXl0SOszbMPxJ54MyjSi/j4NMy3w33LDYgwEuUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G7HMqeQdG6FFdIQ+B8k2ncQRO8Z5G51hEmxYM2YcHIMvsJphK9xzRgz/vvrgHAUD4vlzCxFuFb6QE8y95/IRMZxl2oH61JIjr4Arxy2BhHUsaY27b4A+OWiKMgjFxkrua+nUKXDFc2w9asMLTnJXDDcEjaxce0auKp0kAAwBE/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TCoLokZK; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TCoLokZK"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c243ef5237so90293a12.3
        for <imx@lists.linux.dev>; Sat, 31 Aug 2024 03:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725099094; x=1725703894; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAA/88jUmPoX8j9EzkHuwxEf+0bfdEcorfVyfMeqjt0=;
        b=TCoLokZK59d4yMIQVymD66nRJuf/84pTIgnr5DJzO5AijHl9V+4JvnLZiErtc95YOv
         3QKoNyu1WDPt6T4TOimxU8w4NHG55zvfcB6Q8hCyze2a0ybMDxvL0+XJL1CMqHjKmkLg
         0LhK85/qfo97bcFljzX9K1ES5eGPtJeQpzJ0q1ocme6vmBZVcqmNlKVW4nDf8ESClACf
         uOrf0ct70qiasCxe8Fk//QZn9BcfiAHEAAxp+h7atNKB2ZXT7uqCKuwPuI9h6Duv+VXz
         5tsgTyxIfHlubrOBj2WMk8N1zxY/+X8zIGTlhZ3Pkgw5czhBBIyBZyt3ndRNaGkjyKm7
         eRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725099094; x=1725703894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HAA/88jUmPoX8j9EzkHuwxEf+0bfdEcorfVyfMeqjt0=;
        b=Z43CBg9UPUU8EhKpg3B4kE/uT9DS9znSyyTQMNI5jTz5dWBzapmQxcc0DdE3YO8Njz
         PJMg/BmChkzJ35JlMCKRfdm+u5FL8077mYX/68Pv7JLumzHhKv4Wq3rnJAsnCe858V9G
         1KSiEs1Nr39fmF58RVHWTyPnY7MYMYDwGcVvpLNCVf9uu7saCZWU4gYk8HtZ3khyrg4g
         IY8OtKVn9+i8MXpR6eScwermhpw8ephMbGgpOjIMP8I9CQdX/4gErINybiffpsWcJJ83
         xDeLt2C2sLMNNsaQ95I9WO3CekQwhJ8s0suzUPh6gUUGYOed+P09ZH+LCZzuNE2exe3s
         cjAw==
X-Forwarded-Encrypted: i=1; AJvYcCUJR+bW4bhu9urMyyN2M6ceENeHlwhG5KVPl9VCgNt08JHqwbVu08kLByIThOSsLAlY6PU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxB029nonR0dq/alMu9xVYTRyyOFuwKC5gXkE06gKglWQIZs98
	Q0+D+VAt2Ch+3PKfzx2NTmm2vYcb4HuayYkj+jaJaupJBYZ6hLG9MPFqvuUUX9I=
X-Google-Smtp-Source: AGHT+IFlB45dEul3ujIqmq8Dxo7h/2KpPUUyuM2NL5Hz0hrjeccIA1n0Q+AYQl2uee/M95VUlejx1g==
X-Received: by 2002:a17:907:7f06:b0:a83:70d0:7a1e with SMTP id a640c23a62f3a-a89a37f673dmr133763166b.9.1725099094557;
        Sat, 31 Aug 2024 03:11:34 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988feae4dsm311707266b.31.2024.08.31.03.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 03:11:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Parthiban Nallathambi <parthiban@linumiz.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: imx6ull-seeed-npi: fix fsl,pins property in tscgrp pinctrl
Date: Sat, 31 Aug 2024 12:11:29 +0200
Message-ID: <20240831101129.15640-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240831101129.15640-1-krzysztof.kozlowski@linaro.org>
References: <20240831101129.15640-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The property is "fsl,pins", not "fsl,pin".  Wrong property means the pin
configuration was not applied.  Fixes dtbs_check warnings:

  imx6ull-seeed-npi-dev-board-emmc.dtb: pinctrl@20e0000: uart1grp: 'fsl,pins' is a required property
  imx6ull-seeed-npi-dev-board-emmc.dtb: pinctrl@20e0000: uart1grp: 'fsl,pin' does not match any of the regexes: 'pinctrl-[0-9]+'

Cc: <stable@vger.kernel.org>
Fixes: e3b5697195c8 ("ARM: dts: imx6ull: add seeed studio NPi dev board")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../dts/nxp/imx/imx6ull-seeed-npi-dev-board.dtsi     | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-seeed-npi-dev-board.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-seeed-npi-dev-board.dtsi
index 6bb12e0bbc7e..50654dbf62e0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-seeed-npi-dev-board.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-seeed-npi-dev-board.dtsi
@@ -339,14 +339,14 @@ MX6UL_PAD_JTAG_TRST_B__SAI2_TX_DATA	0x120b0
 	};
 
 	pinctrl_uart1: uart1grp {
-		fsl,pin = <
+		fsl,pins = <
 			MX6UL_PAD_UART1_TX_DATA__UART1_DCE_TX	0x1b0b1
 			MX6UL_PAD_UART1_RX_DATA__UART1_DCE_RX	0x1b0b1
 		>;
 	};
 
 	pinctrl_uart2: uart2grp {
-		fsl,pin = <
+		fsl,pins = <
 			MX6UL_PAD_UART2_TX_DATA__UART2_DCE_TX	0x1b0b1
 			MX6UL_PAD_UART2_RX_DATA__UART2_DCE_RX	0x1b0b1
 			MX6UL_PAD_UART2_CTS_B__UART2_DCE_CTS	0x1b0b1
@@ -355,7 +355,7 @@ MX6UL_PAD_UART2_RTS_B__UART2_DCE_RTS	0x1b0b1
 	};
 
 	pinctrl_uart3: uart3grp {
-		fsl,pin = <
+		fsl,pins = <
 			MX6UL_PAD_UART3_TX_DATA__UART3_DCE_TX	0x1b0b1
 			MX6UL_PAD_UART3_RX_DATA__UART3_DCE_RX	0x1b0b1
 			MX6UL_PAD_UART3_CTS_B__UART3_DCE_CTS	0x1b0b1
@@ -364,21 +364,21 @@ MX6UL_PAD_UART3_RTS_B__UART3_DCE_RTS	0x1b0b1
 	};
 
 	pinctrl_uart4: uart4grp {
-		fsl,pin = <
+		fsl,pins = <
 			MX6UL_PAD_UART4_TX_DATA__UART4_DCE_TX	0x1b0b1
 			MX6UL_PAD_UART4_RX_DATA__UART4_DCE_RX	0x1b0b1
 		>;
 	};
 
 	pinctrl_uart5: uart5grp {
-		fsl,pin = <
+		fsl,pins = <
 			MX6UL_PAD_UART5_TX_DATA__UART5_DCE_TX	0x1b0b1
 			MX6UL_PAD_UART5_RX_DATA__UART5_DCE_RX	0x1b0b1
 		>;
 	};
 
 	pinctrl_usb_otg1_id: usbotg1idgrp {
-		fsl,pin = <
+		fsl,pins = <
 			MX6UL_PAD_GPIO1_IO00__ANATOP_OTG1_ID	0x17059
 		>;
 	};
-- 
2.43.0

