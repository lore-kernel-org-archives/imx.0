Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B983117B500
	for <imx@lists.linux.dev>; Sat, 31 Aug 2024 10:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725100114; cv=none; b=WO46mlgnq4Nv7ueefvYfDzMMJUVLPxj8kHwWzm79aHxKi71k2idoPLIQTc+sea7hIrAxLtpCpKjOE6lx1I8426HJ3char0WqQEdHh57n4K6sdYSm8akFcF00PzwBIB85fKujobbG9ZcM2Z5AA60p9CHd4YthaHLxGXiVypFKpB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725100114; c=relaxed/simple;
	bh=52c9RCnnMOJoaoziQEd2I1WckEib4zozqHCNqeDu6TM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ViIgl4rf0TN/iTb0Jyda7sEZtbsciINJdDIGMphSGkGi/L0UK2E7qiJGTUZ6zBkVEodyHMq9vV4Htg12Yvj52XstwnnbzPi/TEgNNzAhPSbsXVQoZ4TNf3MoK0APZD17p1Q3T4ATfDRLIobFYNtDoJ08zditnHEfmCeGMqN7DoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FSsYW/jc; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FSsYW/jc"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42bb8ba2814so3242805e9.3
        for <imx@lists.linux.dev>; Sat, 31 Aug 2024 03:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725100111; x=1725704911; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C7YRYmdyh/Zvt/QYP4NaQ2fvJBdIyrQVnk5iSq+uwfk=;
        b=FSsYW/jcvOBQIQjBkxUkpAAxfnoH2kvxCfoNoqq7JrTwhSPzYXMl5UBFarWUzFYhgb
         N3rw/GHUvwDGm9kJyR/I+caqtdB6KKsN0oh8YbfIIHp5VxCVq4CVuCeTxWzHdnuywS+r
         EDFrac1eWXAxkuxmpyIFgyiqaAUgR+Z9Ol3yONo0Mr10uU1lwehAQwFPikjnhsnGkHbD
         +kBd8JUmkGpOEkp+zOx73pcDFCR5UTpe9+EpDZMzjc76BJc7jqYmdipZ6MgyF3IDFx06
         d9nZmicVQKW3uujB5b4qAgbO+lbc7koEK177Q2danBkA7rD5+bD3KjTqLfOIg1jP8Uet
         L/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725100111; x=1725704911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C7YRYmdyh/Zvt/QYP4NaQ2fvJBdIyrQVnk5iSq+uwfk=;
        b=chOPsfGd1oJwptpuZnijbc+ztJSwtSQnbKXbt3Ry6T6E6/PRKr/OLWLwHk/dz5TlN5
         yYvYBU6cZEziNoF/kGq/iBho00o6f35vGXe308ucwUbVLXmb9aEC1zJG736j4LjIWRne
         TyHDXPzRpMM9B8ctTV2ru8fK5UP2THF1UsxA6nCzfvYerMl4KgIIXNA46kzSt/9tSA3e
         48doxiOobczxeURXB9/XDleGkwszYznX3/lGGfTsMrzyBT0qS6ajDD+9HlqvZiRLXHk8
         XNBiYVSvAUd6G40tZKMEEBisqTxcYg4wUehYCKLf8dTaBhcHO0XY0tNob2SDdHR0Uxgw
         n0Pg==
X-Forwarded-Encrypted: i=1; AJvYcCW9zHWH+rAXDogRsW0d81WBGcPzv95nok2Ir8j0kdjQJdjZfqMQ46mfdhi+Od6ybLjFy8E=@lists.linux.dev
X-Gm-Message-State: AOJu0YzerU4Cd46DGAveyGDVGPEH1UAH/eV3c94c9hThJPMPw88CrjJ8
	CJW5oVIXXsEiCWEWMcAmHBAvAT5FYr31F6sfznoPoV95hRAckupr+36ocZrEeoY=
X-Google-Smtp-Source: AGHT+IH5DKcLcsMpkQFTUnkvndHQnxbZtCfYqIakVe3gz0xEgTfU8Gk6Zm7Y/mJbUc6jV8YNQKJt+Q==
X-Received: by 2002:a05:600c:5489:b0:426:6f48:415e with SMTP id 5b1f17b1804b1-42bbb106258mr19872965e9.1.1725100111016;
        Sat, 31 Aug 2024 03:28:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba63aba23sm104502155e9.21.2024.08.31.03.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 03:28:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 31 Aug 2024 12:28:18 +0200
Subject: [PATCH 1/4] ARM: dts: imx6ul-tx6ul: drop empty pinctrl placeholder
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240831-dts-nxp-imx6-pinctrl-v1-1-f5811032bd40@linaro.org>
References: <20240831-dts-nxp-imx6-pinctrl-v1-0-f5811032bd40@linaro.org>
In-Reply-To: <20240831-dts-nxp-imx6-pinctrl-v1-0-f5811032bd40@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=865;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=52c9RCnnMOJoaoziQEd2I1WckEib4zozqHCNqeDu6TM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm0vBIX5O4TnMTARD/U2ZgTKcmsZZuUyXUYvwsQ
 DejG7xMUMGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZtLwSAAKCRDBN2bmhouD
 12AqEACX7gxGL1Rgvm6+uH/t9VjFaVom1FWWIsYCUcZqabYYMh8NVLQLJ9AV82WyQ9Fn2LS+F3S
 00ydwPWmFeDN6Ji7+b45f82VroqPa8L562/iF7KPboerU67I3klKT2RNh+kp8WtJeRJ0reBlK6n
 t55za9Lg1wPXOat9UPfbv9n8X7zkpIb0QZ17kUoMsgffKF3IYrGH2Jqez2tBM7ofNEjomrbp/Ip
 jtbg9bEUzZiTXYH45atToogmepby8Mj5vLHdbuFM8pJkXp3PfrYEFMg0WWmZnodkrr3EjmSe2on
 65/IPxpXxymhcLkx4TzXmpBuCoY3NLA++w52PjyDi5iQSuGmn4+LUSe2tClG83JhV02tKlEeodG
 iZauMTQBSafwKJyhim94gTTjwB0qNeeojxBvJU0KlnV1UE4cyokaWkg9iT8Feohln80yLcSNPwE
 sDgYFzjbyERVnuEY7KF4sys4DLGd2GIE4+dLsLDMZeo+7VxFmAcl5BYuS2kUGrxm4lSxpE2z02+
 Ec8U18FtwvHGLfnymMpWm/mlLWA81vY2thl9sUR1gqlPuBHSDtNPXbVRxtiHoy72mcbDxBhc/wE
 6101Z31B3fNRaFcVUhTD6a+ZQO1cZisbA3u5GR4hL12/QBBpkYN0Q8pUA5CsgD2n5upPzFYtYYs
 9MM1mYF/nMF/0Zw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Drop an empty pin configuration node placeholder, because bindings
require 'fsl,pins' property:

  imx6ul-tx6ul-0010.dtb: pinctrl@20e0000: hoggrp: 'fsl,pins' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
index 864173e30709..2567fa52f29b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
@@ -578,12 +578,6 @@ &usdhc1 {
 };
 
 &iomuxc {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_hog>;
-
-	pinctrl_hog: hoggrp {
-	};
-
 	pinctrl_led: ledgrp {
 		fsl,pins = <
 			MX6UL_PAD_SNVS_TAMPER9__GPIO5_IO09	0x0b0b0 /* LED */

-- 
2.43.0

