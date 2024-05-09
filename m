Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D2512F582
	for <imx@lists.linux.dev>; Thu,  9 May 2024 10:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715251729; cv=none; b=sMTQXhOx8A9/E1DXa2XhMcbN7IR2YEvMuPzA6jSvSNKUrEHGAmeHixbbA5rpzm5vUOUINa4Hwx/UIpDAlJOeCr/Su30LPLX8KDx6IBl25Xm4IzzMupGWk2x4bUFpJzMRf1TEuOO2psNSpmua7RPBAnUGYTspBwY/tlGlMSJH0Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715251729; c=relaxed/simple;
	bh=vr0JkEDr29fBsYwVrEj21BsVRokcN68DvXqh0duEgEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PQWiEGJRai/gBJrWLZGY0/T9f7lalY4fQ40Y6uJuD3cdmuKpVMlbPF28O/gCdh+Zg19+7INFVPMrTpHZt4b97Ah5sm5RhdtTjAKwPaGszAGFNigG3P3r0xcpjnPE0UttK26O0AWr8ffqmQgdksDtCjWyxBCoI8hpBLUFYqHrUiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tle5IKuR; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tle5IKuR"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a59c0a6415fso194323766b.1
        for <imx@lists.linux.dev>; Thu, 09 May 2024 03:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715251726; x=1715856526; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NAnteY4Ku2+wEU6Dmp4nyfLK0/g/WbuTESaTngARvs4=;
        b=tle5IKuR+uM54QQ588CeluJuTPHy2iXVNbZTqetXkHLlbV/XT0uwP7/+gcDmpQtczw
         kfzL7w1FQo/hbuuY/RrN3EnLvEqNp09xn/n7wiJhhtD9g59oyimHR3qD2KuzKwIqS2cz
         d9h2v0svSsL202UNXeLYobG3eMJ8AuqQmajF2WlZ5+OslwxTsEwPHP2uBnwOmjjc6lJY
         0n6XssLTAJkVEA8DfY62877k5TIdxXIYfg7uj1RtBESe2haUllVHrJy30r4oro47XvyC
         F5/p1AyGBWlpQLuaz7n58suq3CyDx8roJZKmYHw/WP0C/z7CNEkmIgN/T0DTyzKbbhkn
         5r4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715251726; x=1715856526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NAnteY4Ku2+wEU6Dmp4nyfLK0/g/WbuTESaTngARvs4=;
        b=DwUXUWW53nUz/TjmSCvYKPfCz9w6EzOtPHXl0CiwHlHreZgeoGALsWRoHRH7lAQ2LS
         s37jKslYrC24k4Kc9eHLDt2TbLOTZmnhWrhWLiQyP39KWz6g0RS+XIjLHvX17gTI9eNb
         UyHgcDpIThYAgET5dbFpYt6vVu4L7islalU5Rec4H0N7Pb9T5Ke5+qR9EOd8h0pAK3ZE
         ielleeHjKcSLtK3QE2WDTRq2M/RCKFaSYNfvLyLWjqIpoSOfiq5g2KGjmp68FBF2MvjK
         edc0F9/70VDLbrkazUHmmdj44Po9NyeIUaomZLOXD7Al+kPZXQINDq3icDeFdFngcGvI
         eHlg==
X-Forwarded-Encrypted: i=1; AJvYcCXj31ABfrv41/uJAYqfPQhvFcTDP1OM6gn3o4kE/OEpIGDo7bnByCTYyIHGsvAGQ9URhZrOcslDUI3JvIx/JWVs/jOI
X-Gm-Message-State: AOJu0YyfSX4E0HGymH6Y8CuETibZ84PhTEmiPw2AirhXcEodN/ap16yk
	wRXfuNUTgVxauRsVXpXd7YB7RH0CzbaHx3XU02QH/c293vTiXxopa4oSUKwoTf8=
X-Google-Smtp-Source: AGHT+IFOTVe25O3pIsAX/rCgSborCXKvhCmHmsBLt39hPOEhp1TeTMpFQcZ8/4M/6lj5v0rs2vv/ug==
X-Received: by 2002:a17:907:2685:b0:a59:a3ef:21eb with SMTP id a640c23a62f3a-a59fb9dce5fmr414990366b.73.1715251726392;
        Thu, 09 May 2024 03:48:46 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17894d85sm60195966b.72.2024.05.09.03.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 03:48:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/5] ARM: dts: imx6dl-aristainetos2_4: drop redundant 'power-on-delay' property
Date: Thu,  9 May 2024 12:48:36 +0200
Message-ID: <20240509104838.216773-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240509104838.216773-1-krzysztof.kozlowski@linaro.org>
References: <20240509104838.216773-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LG4573 panel bindings do not allow 'power-on-delay' property.  Linux
driver does not use it, either.  Reported by dtbs_check:

  imx6dl-aristainetos2_4.dtb: display@0: Unevaluated properties are not allowed ('power-on-delay' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos2_4.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos2_4.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos2_4.dts
index ec806b8d503a..c9b2ea2b24b2 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos2_4.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-aristainetos2_4.dts
@@ -82,7 +82,6 @@ lcd_panel: display@0 {
 		compatible = "lg,lg4573";
 		spi-max-frequency = <10000000>;
 		reg = <0>;
-		power-on-delay = <10>;
 
 		display-timings {
 			native-mode = <&timing0>;
-- 
2.43.0

