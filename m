Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73B21CF5C4
	for <imx@lists.linux.dev>; Wed, 23 Oct 2024 19:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729711622; cv=none; b=lVDpEU4A0towZTDUroP3KWh2Pj5jxZuOv8yN9DyesycZarrBtt9KpcDixkbt4ZEsyhpEKtg6QTZ17JyViSRIKi2DjuDTKwfGnXpi6PdSrCdI8lugDZu9zKJ0/RpOi4iCn9HnwdN7BgK4t1091JceJXCjNDoiTOfCsC5KC96RE8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729711622; c=relaxed/simple;
	bh=pHdB1mBKkvWlU5gLJkzbozOecCtrk6xKwLM+xZCa/GI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bCydXPVM+sVo/B+xCRjCTnyUhq31bMXfk2PrdXRtjO3+aWhtyKvaCHA6UK9v1gST+A7FQuSnkcTkcYbVH+CcGQWPapFkYNqIw1FtCzxqjj3mf0NSWXlFxm3RsDIOmRwzfveusGCEXjiQGiJlIngXYxaOSBuM62YEo+74MTTICMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIxPXyp7; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIxPXyp7"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e30116efc9so169598a91.2
        for <imx@lists.linux.dev>; Wed, 23 Oct 2024 12:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729711620; x=1730316420; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1O55tH4mg+dDTUW5UrQWZ+uhv6UBmUWklyeFXKvl0nU=;
        b=iIxPXyp7pRZj9HQz+sVr6k+9iBlEPnpYQlw/pqR2RtUTs7v9dO/CcoTdGFBBlPsPKz
         Y6AsAD9d7fLWukF2HaswyvuTagPVJQ7muE8xCl7Y8VqXwdr/7g80vdpQzI+T7P2UKrI2
         Qj0TIVZs87939MkSN1k0C87nChW9B1lisOyTMPfDxN7Y+qajHr7ukmdA2H4WOG8RFMGY
         dkOIF/eyABuR89uqr1WKSLtiAYXLxhgd27dq2ThMgNZooc7zdIFcx2qaKL2h+Wgurt62
         B3TUSGanNliryj1MulcTf1fq37pApAxBLtgs7zkqfYX7XWMGhZ1EoMRcnqSuwU4NNt8n
         y7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729711620; x=1730316420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1O55tH4mg+dDTUW5UrQWZ+uhv6UBmUWklyeFXKvl0nU=;
        b=IRCuuA9tK7InJM2DR5meSlRxYSf8mHnNSs0t8UH9zuhPBZAIjF+e2p3BVFC46ahPdn
         sxKbV1+H2NOdGTX7azTPy5qvSFyGlPYxNaw4+6w1XVuO1CW5O0NsWz3fbbmojda15vEu
         5sqC6IMKM/ForuQPbvHPq8PhwRug0rB7Wt/opkOFjkdS1saYLOeNFqTWOV5+a+0fX18J
         92kZYU3dRhGFXxb8O/Y87CSRhUUWmz8T9ABySxxbuVillg/dTZYeIm5wGf64HjMdAQta
         Wfbxb0cENz9crWpnRvbBLMXXIAM/78d2g6VY7bjmv7HDD050K1z0rLMSfzOp2rXeKZVw
         6SZA==
X-Forwarded-Encrypted: i=1; AJvYcCWduSofiVt2MP3C/a12m8SIFL5get5WucyswsnGmooafIwIE2a/Q1O1gU5QdsfgZx5uniI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMTnqo276yXIuOjVvaHaaNq469vJQc1wvBSZfWfohUCt0Npmqo
	J3FP0ihItbGkRbROkcSDL78j5J35ZQv5EBIbmDakhRDKwG0XwtBo
X-Google-Smtp-Source: AGHT+IEQiy/xrKWaVqAIUMeAVSlB84ZE8bBKTViAbSYn9QvjbVrK0iE88B1fokuihlvyMJ2UBAPz3w==
X-Received: by 2002:a17:90a:7e91:b0:2e2:daab:cc69 with SMTP id 98e67ed59e1d1-2e76b5dbaf9mr3946085a91.12.1729711620181;
        Wed, 23 Oct 2024 12:27:00 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:248:317f:2ba9:e66c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e76e0877a6sm1837839a91.54.2024.10.23.12.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 12:26:59 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 3/3] ARM: dts: imx7ulp: Remove incorrect mmc fallback compatible
Date: Wed, 23 Oct 2024 16:26:38 -0300
Message-Id: <20241023192638.1214045-3-festevam@gmail.com>
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

Per fsl-imx-esdhc.yaml, the correct compatible string for i.MX7ULP is:

compatible = "fsl,imx7ulp-usdhc"

Remove the undocumented "fsl,imx6sx-usdhc" fallback compatible.

This fixes the following dt-schema warnings:

mmc@2198000: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx6sl-usdhc', 'fsl,imx6q-usdhc'] is too long
	['fsl,imx6sl-usdhc', 'fsl,imx6q-usdhc'] is too short
	'fsl,imx50-esdhc' was expected
	...

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
index b093f2a447ae..3c6ef7bfba60 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
@@ -218,7 +218,7 @@ usbphy1: usb-phy@40350000 {
 		};
 
 		usdhc0: mmc@40370000 {
-			compatible = "fsl,imx7ulp-usdhc", "fsl,imx6sx-usdhc";
+			compatible = "fsl,imx7ulp-usdhc";
 			reg = <0x40370000 0x10000>;
 			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&scg1 IMX7ULP_CLK_NIC1_BUS_DIV>,
@@ -232,7 +232,7 @@ usdhc0: mmc@40370000 {
 		};
 
 		usdhc1: mmc@40380000 {
-			compatible = "fsl,imx7ulp-usdhc", "fsl,imx6sx-usdhc";
+			compatible = "fsl,imx7ulp-usdhc";
 			reg = <0x40380000 0x10000>;
 			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&scg1 IMX7ULP_CLK_NIC1_BUS_DIV>,
-- 
2.34.1

