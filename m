Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1BC14D297
	for <imx@lists.linux.dev>; Thu,  9 May 2024 10:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715251733; cv=none; b=CXMslRVr2tforyN1a0mwT+Ftr6iFRjeVau2WEw35CYYAtnmiFg+ZHpGF60vl0/FJvIfPMMrZXtjD7G+yo6UqLnd2JVaTLsOAJ/saDGIr9+afUBeFSJb36JFeifeV10dfLPuar9gEvFKFurYv63IHtGdVCstHY/ZFNVPUN+WAYdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715251733; c=relaxed/simple;
	bh=8s5CSyd/XLbgiSPGylu8EmjQ7QDKYBFmeE5ErG7toDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pTpjaTXkmj1+4//35AVUdUXnVJ5Dk/MSTKp40rtbMBoJbmYuy590O4W63VNP22eTyXjfxdc133HChqXekxVi3nI0s/29g541kAcJX9tqwMWfCvVWSHXbgj5hAykui+xGkkwCSZqEK9+P3McMmUM/avc8/B1NpkjvM336uorNitY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qern1khh; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qern1khh"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51fdc9af005so1035818e87.3
        for <imx@lists.linux.dev>; Thu, 09 May 2024 03:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715251730; x=1715856530; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxOuwvgu7vIPeq1UiZIJt6cAqtzNCiq0jwfBAlXCxvg=;
        b=Qern1khhKPN4pW4XHNI+wpMUfJJeSUx/WuDcm3JQ+Y1/J/TpPSvd6nnvMfOBmN3b+s
         pZUz9YyHolCf1G6uhB3wOJ4CK774JDesxeiUBHrccUzIUPWrRUN95XesxWzlxu6/sF2v
         ocww9X4rxMT6VhY2vUgMZZOF6NUOHpOoZ00gbH3ywBo0IK90HW4s9q/X+djnlhslYekh
         cHauNDKzTky3NoZmeG9tih6jjqJkM4rcWhVgoOp32YdHFb+eP2c495/pVwnSY7Cj3Gg4
         NycZcEIjpx6SW9z0J8pJNE37bXAmCFV78z3hwK527OYEJ5Du9l6AdYfjz2MfNuIz6E2m
         pU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715251730; x=1715856530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxOuwvgu7vIPeq1UiZIJt6cAqtzNCiq0jwfBAlXCxvg=;
        b=wefDMP+htUYXwn/RzWyH7zGkVtJmthcSzhnlMTTfcsfSSH359kzwkmZnuV/1/zcNYQ
         A7zDu2e9ACQSHnEJ6nYF3eUGoikOMFqrhxRgajwq1fV2qj+Bjo03G4Qi5v2mUucIxUpQ
         xHHU0t74Jj0Wu63Rf2YKv6TTBujFmO93IoUWsKLMiNmn3Cd4dFJfbuvea+MuKzvPXSGy
         /MZVhl6OEbtwwbnOJwfLHd8qZ55aiPxW8LvYCkhI6uNiGVItx6wqCanstZqH7FsvtKaO
         Q7S9zuvvTPL+PJcWXONZDnnh4/bPxlRO8Ozh70THvYE10t+fvh8N7sdduAVvabd93WpQ
         7upw==
X-Forwarded-Encrypted: i=1; AJvYcCVib9kW8ZlvNk3ObkUr8SSzNg+OTOhKUFTpg4yj2OuZg7U584yWC1lkSgNEuDUTxRfDdADjqbFWGha2i+4MUecpihl5
X-Gm-Message-State: AOJu0YzKxLryIxY9gnLBuBpJuV7k2MupnA8DZw+uVpYoM5eJgV2jzDbU
	q4ozFD6JwLn/EeKWxCHZtKtOWqZvUGZIaj8H+SnFc12diFU20BYEk7tWcmExQvM=
X-Google-Smtp-Source: AGHT+IHLD2gIMOkPBD+A9kauwL3dxUht5OhDxERrvQNI9J20Gmyp3rqdIBVZJKilkJXzKEKqkqbJiA==
X-Received: by 2002:ac2:5986:0:b0:51f:6223:21ff with SMTP id 2adb3069b0e04-5217c760a08mr4174927e87.39.1715251730109;
        Thu, 09 May 2024 03:48:50 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17894d85sm60195966b.72.2024.05.09.03.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 03:48:49 -0700 (PDT)
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
Subject: [PATCH 5/5] ARM: dts: imx28-tx28: drop redundant 'panel-name' property
Date: Thu,  9 May 2024 12:48:38 +0200
Message-ID: <20240509104838.216773-5-krzysztof.kozlowski@linaro.org>
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

Panel timing bindings do not allow 'panel-name' and there seems to be no
users of it: neither Linux kernel drivers, nor U-boot as of
v2024.07-rc2.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts b/arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts
index 5485fe118dc4..d38183edf0fd 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts
@@ -323,7 +323,6 @@ display0: display0 {
 		display-timings {
 			native-mode = <&timing5>;
 			timing0: timing0 {
-				panel-name = "VGA";
 				clock-frequency = <25175000>;
 				hactive = <640>;
 				vactive = <480>;
@@ -340,7 +339,6 @@ timing0: timing0 {
 			};
 
 			timing1: timing1 {
-				panel-name = "ETV570";
 				clock-frequency = <25175000>;
 				hactive = <640>;
 				vactive = <480>;
@@ -357,7 +355,6 @@ timing1: timing1 {
 			};
 
 			timing2: timing2 {
-				panel-name = "ET0350";
 				clock-frequency = <6500000>;
 				hactive = <320>;
 				vactive = <240>;
@@ -374,7 +371,6 @@ timing2: timing2 {
 			};
 
 			timing3: timing3 {
-				panel-name = "ET0430";
 				clock-frequency = <9000000>;
 				hactive = <480>;
 				vactive = <272>;
@@ -391,7 +387,6 @@ timing3: timing3 {
 			};
 
 			timing4: timing4 {
-				panel-name = "ET0500", "ET0700";
 				clock-frequency = <33260000>;
 				hactive = <800>;
 				vactive = <480>;
@@ -408,7 +403,6 @@ timing4: timing4 {
 			};
 
 			timing5: timing5 {
-				panel-name = "ETQ570";
 				clock-frequency = <6400000>;
 				hactive = <320>;
 				vactive = <240>;
-- 
2.43.0

