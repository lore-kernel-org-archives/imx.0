Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5662A39900C
	for <imx@lists.linux.dev>; Fri,  8 May 2026 11:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778239603; cv=none; b=nX/w09GL2/CR29HI72DP8f+U5zEuJ9lENi7awtt/p1BRFyeqxG764orW4QcLSYcmEoZrATO43dK1/3eVl3AiHt+W0n2qOwx1Tzj/cpKLln4uTNXb5v0eADg3+TkfTi8jdEFt6w5vaSt0THoL7vQB9pPxLM3+XULKzxaLAIxOvcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778239603; c=relaxed/simple;
	bh=QE7XiNGp11ntZ8cY+ErYOWVQH1yYu1BzYi3BRu8v/Cw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IzGhFyu+PM1kiim46ysT0aVD9JUmeobNSXY13KNFhSePJL6KW3hg3DPY1b7mio8+Fuwd2rNuD8/cHSj1nyJQFaM4/ghArR/Gbe78AwiEp+zC74kxmJDFxBMGmRcnHMCs5j8b/6QkId8sq2pAw6akVQRCvafEADyuzpH1iYGam3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cop4AObC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cop4AObC"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488af9fdaa7so11553615e9.1
        for <imx@lists.linux.dev>; Fri, 08 May 2026 04:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778239601; x=1778844401; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xwMAiJr6rLTnqtrgyITSok37EhglhZRyua+A57fW1fo=;
        b=cop4AObCM++LGBL5BigpKEMGrx5ValzjO8GbraVe+ZzAmjAr5T8+uA6Ie/Vh0h4FCH
         CYHLdm8/kRnpWZRO/V8jKjwtlfMiKukiq8wDbvY7YgxtgcVOtn7vcwIu97EAmVy2/WaK
         Z8D5EpCIbPCsYIrvq3ETEvRfoRodmBEB0TW5OWJ0wnvurjqTP2jDUgdzZNfZIgoOtn5L
         e0MT5XS4Q9EC0uzf2LL7bJ43LvPFz4Ei0rXtwaJ/c4v7yN0MA2JF//TK/ZVb4vFWShKo
         SR78K5KyfAiU0XAPcPDSnCO44LJP5MRopWaXpiymGD2FT7Fut5iP08EOz7E1tzBAFCYJ
         gvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778239601; x=1778844401;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwMAiJr6rLTnqtrgyITSok37EhglhZRyua+A57fW1fo=;
        b=L0B6oFNXsG919FcfSYwCg7kZPuQvcaorOeLxCQUIlHL2nmleP9XnItLt9J8oaFCvOe
         iQsclbIJzwI9IKYNubSam7kUioGprFU5n7ikJAw25VPiEeT+DS2Fl9o4uX793NmGfwg+
         Q3wh/S9zGT1MTyNnPooNXz1ImXi2kSn6tD4kXdpHSw+Va5ukrlMj+vtIN2HLaSRIGFXZ
         n3ClFBdgz9eirgwcDQcEycUbHOBS4d+EnW8nngWN9obxhsgc1DyNPsQ6QLO5Sr9pWA8S
         bYjp7uwTvpEYRUmJTYHPAypNYs2ar7C6LnNTaPMOb6rEwSnshQPzd/A1wqPV2avpforE
         lalg==
X-Forwarded-Encrypted: i=1; AFNElJ/zQU/knw//rk7nujHRxFlc9zU/dqkiL24/ODfD01m9lTsyxecgJcigql1RoKlkF5bi8Xg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyIfiIVTLk5EXflUeof8HYcAlAPdavgq2ntSaR3aoS6BQ8uacqT
	wWwjRPvZQ5edPymujD9Jty4zHmCkriku+8Nozitj+cbl5UZZW8HGnaaN
X-Gm-Gg: AeBDiesb6OCJS3rF5CdfP2NXfSARBuT/7dFyCUVjrhz+4FbD5gW8BGIS53S5VSvP62O
	k1l1OBJ4jvCMlI1nPbyboy3kj6+dO+q0Hjr0uU7d6C2rNtcbDdzEJP1vMUL1YBwQmVspBxKXE3K
	DgeWbbs1m9j4R8ezFeS4doOF/5V7lbALkVrKrZd/Eh5rqVS42Y10u3syt0npKUm0RFn9fOpJwjR
	DKofnfMnF5BeXNPYTRZn7Hnw4WugiNSeSG8T5I28N9qEIYpS6/qTXrTdac7kTL6Kh9cdcFKnTt5
	bEEFApleIGxt+ELbPc2+uqggtJqgmiUGwIoikFMsXf2lIjg0VZjwQtMMG/WYr45gA3zHEiq2z0D
	JbrIjY8HMCLBP00/9vLTO59HXHmicZdCJI/ELl+f1zME5uy6AATX+kKiRk3LSh6YLuuJR4sGBW9
	hOr2KaeneJ3Q+mBsxTlhwxKehZcFzSmWDGOQOGsEtwdoHL70h7iXPjOpirDF0hRvVtsfIXznhku
	6ChXftKRjIrpQh9vwzXb94wTj7PZ9LFZ1Vywu1swhLN8/N3Wb0=
X-Received: by 2002:a05:600c:3548:b0:488:c40b:c8a4 with SMTP id 5b1f17b1804b1-48e51e097a2mr188764295e9.1.1778239600520;
        Fri, 08 May 2026 04:26:40 -0700 (PDT)
Received: from [10.0.1.145] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68edca90sm58547205e9.5.2026.05.08.04.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:26:39 -0700 (PDT)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Fri, 08 May 2026 13:26:36 +0200
Subject: [PATCH] arm64: dts: freescale: imx95-toradex-smarc: replace
 deprecated gpio property
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-replace-gpio-property-v1-1-ec67cc64e576@toradex.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDQAxG4atI1gbSEUV6ldKFHX81UJyQKaKId
 +/g8lu8d1KGKzI9q5Mcm2ZNa8GjriguwzqDdSymIKGTVnp22HeI4Nk0sXky+O/gsQufRgRxaoR
 Ka45J9/v7el/XH5R0UcFnAAAA
X-Change-ID: 20260508-replace-gpio-property-d62b300ecf30
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1099;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=AB5PPdLVkqMs1sCS4RHSNfyDkv2JV7ytgY+zBknYgik=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsj8eyI/eeLEqoz2PwW+K+TerhSMbTm52LC6oSnAW2BCx
 PSwshPVHaUsDGJcDLJiiiwZT1QF+RRCZD04mpNh5rAygQxh4OIUgInY5zMyzNbV9tFsTAvgXb5S
 lXdmpsGr09s4RT9JxixdvnOuAEtXNcN/X1GXxEDZZWkn7l6RO+hUlKvxrLl9h+5jTvnUd8HSBdf
 YAQ==
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

From: Antoine Gouby <antoine.gouby@toradex.com>

Replace deprecated "gpio" property with "gpios" in
regulator-vmmc-usdhc2 fixed regulator node.

Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 8eef26eb0f87..7d760470201f 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -113,7 +113,7 @@ reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usdhc2_pwr_en>;
-		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		off-on-delay-us = <100000>;
 		regulator-max-microvolt = <3300000>;

---
base-commit: d570a0d019a3d84832bfc6867647d3581b0052f3
change-id: 20260508-replace-gpio-property-d62b300ecf30

Best regards,
-- 
Antoine Gouby <antoine.gouby@toradex.com>

