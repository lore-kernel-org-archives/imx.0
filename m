Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26A21D5CF1
	for <imx@lists.linux.dev>; Wed, 23 Oct 2024 19:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729711619; cv=none; b=rA5eXpgQ0pf1jL3E4g5kZToMPC9LC/Lj1vEA1yz/KRibnsT5PqImTXKGbZijTzu0LH0lu3mJaICs/ME0F2cM4sbdUKwcW9jOe4keSoujtjxC8lMK5iK5vxcaNnl5/SInptuipvkVCqy+joLu/YzdPZYgjfCo5x3vcy7WxCg/Too=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729711619; c=relaxed/simple;
	bh=33voqyc4TLmcbxl6giaAWjh04Z+4AjFGJzickroykX4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SrnfFTvhMTzfkbEKC77AztmJomLJbxhVNYj4T09DXUkrVRv+kfob/RpFfuTygK/rKTMwxBWXgABCMkYEm0G3PlqCTguK0cXjkjPQid1N2ih1seHQ2QYMf2H8zaNappwx4E+WTe7t0z1iWP4xtkQRSp/6NNrJANiCUkSexdwOIag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ce8kHR1u; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ce8kHR1u"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7ea8c4ce232so115359a12.0
        for <imx@lists.linux.dev>; Wed, 23 Oct 2024 12:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729711617; x=1730316417; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZZgc7NDi6YlZ282tPqnjhZ3qjRGLRGk4q9ZK0X/XpA=;
        b=ce8kHR1uHE6criRqF0XM70hlf6pPwaLDNDF0qm+fdF2APFnh7LuRudgCMgzoboGP31
         PbeZ4eq/Qe/JZdWydlOE5hSrcuSV6QB8+DxInvO7QPLZ4HVqhHMeKMNanECajWInBM7E
         Xb6TVC08KuYRDXN4x4ph267JeCLuGnK/9upEvHXY3QDcyrbY8vsV5pYfaKOiX9/TfEsl
         LXz3omFD7f8UJWy9JKuvkciDq0y7TzpRlf4B57XwQeMn4bJJGGZFefVM2EogCy5IRLjT
         QRVUO8VoFyWzsL4+XJlzHCpaeF+XPdUpaR7IR6yrxDj8Z9EKMnCRwQSpX+SNHKzhQSD6
         6vpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729711617; x=1730316417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ZZgc7NDi6YlZ282tPqnjhZ3qjRGLRGk4q9ZK0X/XpA=;
        b=XE8TvmUpYyAOQwzlxhsmhgTA4UmHBt9zUXfb7Fg1zfnhTKpLzAIJ7iTo0l2xeBvdiQ
         WpjU4re6jJ8FRUTn5pyJip7ACpft4ToysEcIXs5stGtpyz1LQMlUGhdq3a4qxzxW6jYJ
         6S8J5UNUJufzF5Ub9FhQTV/+G1/g7kceFX6b41SuMS+F3iH2+zxqk74XPtAaV7WjDnOf
         RGmbX327/SBZYZ8Ax0dBGNt2sFVM+twSV50ZvHke94D3Z1oPKsABFfHvQwH1u9dgBOxH
         UPatgJzCXUlqHjqdM/3969uh1q6q/L4H5ctik83ndOAxEYZ4Fa5cYSUkJVmzpzStN6b3
         iR4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUuwK14nfH7zeFzbv25OfecgZFy2c/DCXBYWypOxhyPOOCuaLjZbZbLcuffgVJkvR1dUS8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx16UxsL3jckM+jDzUij0r44/KCKv0hogcKLsNnpN9VevDlX0+K
	dhKwHl8ojNiWE+R6xsNvQstDBK/R338FysIoef0Isx6bhrzgOEGl
X-Google-Smtp-Source: AGHT+IE8cfK1Q3ro7s4ioQMLwil46AxPf6iM3nXK71sYBrDHb0MP+dy8N3vAGTBNXN/kiXG3Lo3xUQ==
X-Received: by 2002:a17:90b:3890:b0:2e0:894f:198e with SMTP id 98e67ed59e1d1-2e76b6cdb36mr3930784a91.30.1729711617201;
        Wed, 23 Oct 2024 12:26:57 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:248:317f:2ba9:e66c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e76e0877a6sm1837839a91.54.2024.10.23.12.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 12:26:56 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/3] ARM: dts: imx6sl: Remove incorrect mmc fallback compatible
Date: Wed, 23 Oct 2024 16:26:37 -0300
Message-Id: <20241023192638.1214045-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023192638.1214045-1-festevam@gmail.com>
References: <20241023192638.1214045-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Per fsl-imx-esdhc.yaml, the correct compatible string for i.MX6SL is:

compatible = "fsl,imx6sl-usdhc"

Remove the undocumented "fsl,imx6q-usdhc" fallback compatible.

This fixes the following dt-schema warnings:

mmc@2190000: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx6sl-usdhc', 'fsl,imx6q-usdhc'] is too long
	['fsl,imx6sl-usdhc', 'fsl,imx6q-usdhc'] is too short
	'fsl,imx50-esdhc' was expected
	...

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
index 6aa61235e39e..0883dee72bb6 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
@@ -859,7 +859,7 @@ fec: ethernet@2188000 {
 			};
 
 			usdhc1: mmc@2190000 {
-				compatible = "fsl,imx6sl-usdhc", "fsl,imx6q-usdhc";
+				compatible = "fsl,imx6sl-usdhc";
 				reg = <0x02190000 0x4000>;
 				interrupts = <0 22 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_USDHC1>,
@@ -871,7 +871,7 @@ usdhc1: mmc@2190000 {
 			};
 
 			usdhc2: mmc@2194000 {
-				compatible = "fsl,imx6sl-usdhc", "fsl,imx6q-usdhc";
+				compatible = "fsl,imx6sl-usdhc";
 				reg = <0x02194000 0x4000>;
 				interrupts = <0 23 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_USDHC2>,
@@ -883,7 +883,7 @@ usdhc2: mmc@2194000 {
 			};
 
 			usdhc3: mmc@2198000 {
-				compatible = "fsl,imx6sl-usdhc", "fsl,imx6q-usdhc";
+				compatible = "fsl,imx6sl-usdhc";
 				reg = <0x02198000 0x4000>;
 				interrupts = <0 24 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_USDHC3>,
@@ -895,7 +895,7 @@ usdhc3: mmc@2198000 {
 			};
 
 			usdhc4: mmc@219c000 {
-				compatible = "fsl,imx6sl-usdhc", "fsl,imx6q-usdhc";
+				compatible = "fsl,imx6sl-usdhc";
 				reg = <0x0219c000 0x4000>;
 				interrupts = <0 25 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_USDHC4>,
-- 
2.34.1

