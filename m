Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1147D1AD3F6
	for <imx@lists.linux.dev>; Wed, 23 Oct 2024 19:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729711616; cv=none; b=GPEE1bKL1FzUnP4qt7wJjxiq7V2oWm2eeSZsSREw+qEIdhtce6X/tV21KXuZ1fzvyqfzg8fLvmtE8aJsAEaCBdMEtChAc1ywCHUqUHnqZElkQ678xaSzvWUSkGlcMq6/4uuW+yp4JIyD1NGDjMM5zlZeXS3E8WDr9sNibKuE3Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729711616; c=relaxed/simple;
	bh=PnHFdvXXOHbGeeTZ8SXistTs2X5Rh/8helFqpLpz0jg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Rua4fIDP20gsg2+PyWHfXAbZwHVzdyTG8anOtkRa9eXJeHZw1X2YnthFNi86GdyfSYJYwxNknHWBQ23iTOwiquhDOJg9TepxiXJgzPIfF4IwSTzqmpXUMDM3LAlDWGqCplZfrobzK/bTxSZIGq0sIPZJJcVf3zzsLGXB+JZy+2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCERDgl/; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCERDgl/"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e2ad9825a7so171650a91.0
        for <imx@lists.linux.dev>; Wed, 23 Oct 2024 12:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729711614; x=1730316414; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DZ6VmVLdmhY28VtA6wAyYo/0YXHAiwZFjFaUDgu9nIM=;
        b=gCERDgl/roDPdJygJCEkedhLQnZmkPsl36YtSy3vBugiEPA6AujJAYAQBtaf8muX2F
         I0Gs/WebLMvAwEbsiyLZeIk2bMZxMrYwqWkjnJtwuKmMmEbmN0NGI2pSbvxAX59hvVOE
         Qs8nUrDpC+m69AT1ek78Jwtrn89+XcVGZtXBFWPhPQaUx4zKzvB3pfh8g08USyYyjBFg
         +CktouhlVagzg5uw7qtYCErGVS5mmelnZFQMZQrtUh0UR1YD/Rxovp/E/DBjThv6oLpj
         rt0mY7SVUYcx1GUjkSntrIe2HR3p9nEJL9v1ZBmo0Rr9+nvIhmu1xDwcSB22V2d7GvuV
         axsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729711614; x=1730316414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZ6VmVLdmhY28VtA6wAyYo/0YXHAiwZFjFaUDgu9nIM=;
        b=nI5JnyiXWIvQA/MgyuC+tgRMCUNGn6t4PbSmTO8lhwtcv/rqwaCCksjt8BPDY84FcV
         L8zfGSUiQZdgJNrQNMvMhX74wSO26rSCegUCqxmmrLP2+wCR3OitDKVOlX8J33Zi2+iG
         BZl1GuUW7QBltuHBb7ormEDJIBbBZatLQ8xCe689v9XOSMfKlOwoNXjDU+FRjZE1/yQO
         GHqPD/YmPNMPe1rNsSxvyvPZqsQlmrUtYrKmTyWXo6YSfpSzcA0OYf6iYP1op/k82wjZ
         5aNp1dpE1EYMB7CN1vHevlKpy+/MqC0kosQdTxKPP8H2LxjWlZlXOUFT6DO2jg9c/ZST
         /6/w==
X-Forwarded-Encrypted: i=1; AJvYcCVRKsMMJ4KujsAiQQ+4YmGS9ha2+4QL3xjIDcMJ0HbhhVFFc5dY7viUodVpWUOmkBYOvjI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyrHuWcTnHacSOCr06SPmnZJQDYL7tBgaTI1RcOHpjuPKpKGqz+
	Tr/dQcSkDBphHCB29wOpRIrT2APkuGZV9xzmD+nOFmsNsvC8KScH
X-Google-Smtp-Source: AGHT+IE7vid8RJXkhmDafU8mkpKEz7Hv+OtCNibLynfuRwXFP6i8LTmLMJHyAoI8Jc308/MOiT1EEA==
X-Received: by 2002:a17:90b:1e42:b0:2e2:d61d:60e6 with SMTP id 98e67ed59e1d1-2e76b60d423mr3473435a91.17.1729711614266;
        Wed, 23 Oct 2024 12:26:54 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:248:317f:2ba9:e66c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e76e0877a6sm1837839a91.54.2024.10.23.12.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 12:26:53 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/3] ARM: dts: imx6sx: Remove incorrect mmc fallback compatible
Date: Wed, 23 Oct 2024 16:26:36 -0300
Message-Id: <20241023192638.1214045-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Per fsl-imx-esdhc.yaml, the correct compatible string for i.MX6SX is:

compatible = "fsl,imx6sx-usdhc"

Remove the undocumented "fsl,imx6sl-usdhc" fallback compatible.

This fixes the following dt-schema warnings:

mmc@2198000: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx6sl-usdhc', 'fsl,imx6q-usdhc'] is too long
	['fsl,imx6sl-usdhc', 'fsl,imx6q-usdhc'] is too short
	'fsl,imx50-esdhc' was expected
	...

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx6sx.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
index b386448486df..a94bebaa858a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sx.dtsi
@@ -998,7 +998,7 @@ mlb: mlb@218c000 {
 			};
 
 			usdhc1: mmc@2190000 {
-				compatible = "fsl,imx6sx-usdhc", "fsl,imx6sl-usdhc";
+				compatible = "fsl,imx6sx-usdhc";
 				reg = <0x02190000 0x4000>;
 				interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SX_CLK_USDHC1>,
@@ -1012,7 +1012,7 @@ usdhc1: mmc@2190000 {
 			};
 
 			usdhc2: mmc@2194000 {
-				compatible = "fsl,imx6sx-usdhc", "fsl,imx6sl-usdhc";
+				compatible = "fsl,imx6sx-usdhc";
 				reg = <0x02194000 0x4000>;
 				interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SX_CLK_USDHC2>,
@@ -1026,7 +1026,7 @@ usdhc2: mmc@2194000 {
 			};
 
 			usdhc3: mmc@2198000 {
-				compatible = "fsl,imx6sx-usdhc", "fsl,imx6sl-usdhc";
+				compatible = "fsl,imx6sx-usdhc";
 				reg = <0x02198000 0x4000>;
 				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SX_CLK_USDHC3>,
@@ -1040,7 +1040,7 @@ usdhc3: mmc@2198000 {
 			};
 
 			usdhc4: mmc@219c000 {
-				compatible = "fsl,imx6sx-usdhc", "fsl,imx6sl-usdhc";
+				compatible = "fsl,imx6sx-usdhc";
 				reg = <0x0219c000 0x4000>;
 				interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SX_CLK_USDHC4>,
-- 
2.34.1

