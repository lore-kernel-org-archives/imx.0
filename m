Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9867B14EC64
	for <imx@lists.linux.dev>; Sat, 31 Aug 2024 10:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725099096; cv=none; b=HT7euaczgL8GbGYmO+WzjxW/ia2PQUP+IgsW5B8rEKxLTm7I0mhzCH+/PRK0amx43gKEJu+eDgvKljLpbR4hPldi7LE90ioYsDYCdCWo/nQ58dgCas79LAEWMvFMPPgHHF/dEKO+6MBmONAoC3WgjdxdXePuaAeJIgfWz/g+Fj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725099096; c=relaxed/simple;
	bh=eK9lwHTGrE9nYN6gnIQ8mYnUNzrrnjm32O0cFnJTIKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=upGW3cYJpwibdo5g9kwduEygXWQFV2MlAY40427KhY7KP75GQPggMpJ/hr4Lx4BDCyZCIuCQ3a6zGwHb2VtB5GrgYmfE5gzug7XzieSQ3na+PgLpu/dAHVo/v30nSzAhU8gpquqHHdOO9eA18c+WqLq5q2SK8ag2je8hfLCrL2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PV7meZdO; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PV7meZdO"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5befecad20eso426669a12.2
        for <imx@lists.linux.dev>; Sat, 31 Aug 2024 03:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725099093; x=1725703893; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HB1tlgukKY1KvsXWQTxeELXSE2pe2uY+begkTD0612E=;
        b=PV7meZdOifzhTmVAeoMgvESYuvuLAeoHhKWJVdKB3rbFO6peAMnbvfLZCC0bm6ABfo
         Q5SLGC6Qks2tca34oI/pxpHFrkdtlQwPGd2eUv6X4trRPSudu1uMS58LEOMqQa9vgVMz
         JXazj2lFlK4WuMHGMoBuGe8GfbAzYxSAUNWyb0S3tx0szPEm5zAVpfCmBPty452yRdSH
         1DobPzehjdCOnU3n4djTSExPw8OTJTWpqDTKIQ3t3K185+1b85T2eZDCuPkxG0U53AF2
         FsbqUJ2D/Nza/THne0K5Ak0fk0QwtZQa5PI3DJcl6yI4DXGxvEgZr5CNzr6U2EAxTT4e
         Nv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725099093; x=1725703893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HB1tlgukKY1KvsXWQTxeELXSE2pe2uY+begkTD0612E=;
        b=tlxLtJgxPUiaqQYX7H3qMAhWs1T4jNFEGOv7tzcVW8HIe4be/TQfipDrZuurQuCd3E
         gnPe/8TcjXTVH1ahVBqD4AsVgERjrKqSEv9mrWdyri24kIYPA0DIbb3tgJHX5K8cyRO4
         H8pxC+MCgfaCQoXj67aD17cMUhSUC8o+ZHVclN7vLCgY9czMecGHGBZI73T8hjBI5ZNp
         tw+L4JXEO5dMUlW8VSJD/jARGG0h19tnbI3cUTd02Ze1MYVWpcPKo6MMk24Cdx88yerx
         ROD4KXdwW0DrCIpmhIr/VOjFpTNC861fj42TRmrDNumnpF4j9duJpL0xegCwC48N1VGc
         YiFg==
X-Forwarded-Encrypted: i=1; AJvYcCUKkhDYj1PMccv7ZdQXOR0vGXekU90KKWRuJxnLexdjRxT+q1sVgHXcTf2OjSyB9JV8xFs=@lists.linux.dev
X-Gm-Message-State: AOJu0YymWislccAS8dd4jdbr+BvSQ4Q+Afq3ArtAKlEX613LBRct4W5j
	ULGzczVuapp1/dIbkoSQtgbF2VyNCcHlaaMDmzYASJ47+7zKOsq1Nbb5Ed8peA8=
X-Google-Smtp-Source: AGHT+IFwVGnm/EKQ8MW41lLfc+/EkRKkHINcUVfO3ryyMSVQwViKKq7XhFYFirZ0oz/oMNb/3Yf2CQ==
X-Received: by 2002:a17:907:3f87:b0:a80:ed7a:c114 with SMTP id a640c23a62f3a-a89a2ff7874mr144197666b.0.1725099092826;
        Sat, 31 Aug 2024 03:11:32 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988feae4dsm311707266b.31.2024.08.31.03.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 03:11:32 -0700 (PDT)
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
Subject: [PATCH 1/2] ARM: dts: imx6ul-geam: fix fsl,pins property in tscgrp pinctrl
Date: Sat, 31 Aug 2024 12:11:28 +0200
Message-ID: <20240831101129.15640-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The property is "fsl,pins", not "fsl,pin".  Wrong property means the pin
configuration was not applied.  Fixes dtbs_check warnings:

  imx6ul-geam.dtb: pinctrl@20e0000: tscgrp: 'fsl,pins' is a required property
  imx6ul-geam.dtb: pinctrl@20e0000: tscgrp: 'fsl,pin' does not match any of the regexes: 'pinctrl-[0-9]+'

Cc: <stable@vger.kernel.org>
Fixes: a58e4e608bc8 ("ARM: dts: imx6ul-geam: Add Engicam IMX6UL GEA M6UL initial support")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
index cdbb8c435cd6..601d89b904cd 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
@@ -365,7 +365,7 @@ MX6UL_PAD_ENET1_RX_ER__PWM8_OUT   0x110b0
 	};
 
 	pinctrl_tsc: tscgrp {
-		fsl,pin = <
+		fsl,pins = <
 			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0xb0
 			MX6UL_PAD_GPIO1_IO02__GPIO1_IO02	0xb0
 			MX6UL_PAD_GPIO1_IO03__GPIO1_IO03	0xb0
-- 
2.43.0

