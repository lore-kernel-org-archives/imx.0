Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E861F9439
	for <imx@lists.linux.dev>; Fri, 27 Dec 2024 16:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318668; cv=none; b=s5kBcmo4iFK4zPo0RyjiA0a7kXNpXVYeVQW0/OKPkZRXb+UXQxrc6pBEBXsgBUuUeE+L2tae5Zp5JyrIPTFrRx6+cI5213eVKVDtQSSML5y5troTT0ylfjdVaxMzlVGfHy4W79/2DBxMQBTIFpI3tMPxVukaBRiKclvo/lkOjQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318668; c=relaxed/simple;
	bh=ki/DJ8Sz1UQ1qfcYAiqcjACcGQgLsaYpFgvc92kQuC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ato4Q6dRxCOtITKt0k753SgTjuhB6DQCEqeBZKOwSUNjP5uwarOsdjaP3VyIFBC/L4sYbAIx30vTAbMGGNDL0YUERKgOM2g+9qyc1DDQ7qj0yMN6a0RhoEmiC5i7s4eOQZKzN2ULB/WB/5sTNyXcFWmsY87WMUpU8q1GccEPqPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=MxPtvS96; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="MxPtvS96"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa67333f7d2so1092321066b.0
        for <imx@lists.linux.dev>; Fri, 27 Dec 2024 08:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318664; x=1735923464; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3H13EAbQnYh5KL130M+yAXwGl0WzQAYvdh+BFvfpuk=;
        b=MxPtvS96Yn7YS2HEwrLxaCoAEDTky9mvcDol76+q/bmScbm9SLcppGxqndABFwt0gh
         QwfcYBqay9S/w8rrBcgIbaNp13JebOP8Eb4tuquN67K5pdMz8Wwn5x4Gb94yJ5dGyCUS
         MlTox0+x/Cwl8Ttt5mth7R9QxdzJBN6sgsoJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318664; x=1735923464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S3H13EAbQnYh5KL130M+yAXwGl0WzQAYvdh+BFvfpuk=;
        b=UU6ZzuCiMEY/Crsv8prSi8LzWWynAU4ObjSWOoskzn1jo/qThN+FVC41JozlWpaXNz
         +CiQB/jV7+/jBBOvyBOhKk7hos8uUxlKK/nlFrnkpRfMJKN1bSq2XpFOQhfaZ1kAaO2M
         0CG00in/Xgu/sfRTgS4XGCfl1hFpuX/L2Ia7mviyuDgBrpAgcn8yqT3f3faua3yvAnwi
         0J/2yVcFfO6WxhQBqrAX7y12u/zVAF9SHTPSEjn8X911of7a2HuSJ7MWsEjaC/TppxD6
         jHO8iweX/ul0VhsUzCcbeP4EZVcyys5f4ltPAZ+PXhZCoMSfpKVyNnHQRo+ItXH26LQY
         11QQ==
X-Forwarded-Encrypted: i=1; AJvYcCXti0zeKAO1hALXil5y7WbklywF6mY7Dd36TmbPmPrY/bVfA1j9MJZoZp1LJPRyW7e41mc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/Q/rL3Oq+jpa6qG1UiozorEK6G9jbQbDDaJBufJ5e5edOHCQJ
	1QkFl4muOrTo3tlQT/TmHs7cgJIYQ9Wsm5QUsaZtMTLsVBEqGy3nwNt0+FHaBTI=
X-Gm-Gg: ASbGncs2NCSD5fkTQU9jbXkO/Nelmd70zkZQg69bs6xLMrjEhiwa2K9dZ8gXNUJ6zZB
	C5t+9SDYOCDJh+MW4MoxSv1ij/CL8+rYmbHbv9xYYpz2NxKRvymss3cba8VT6HSzL6jLNyG+HOD
	kYUqEcLurynZbOyL202RGItdVL+xdTS2vpeWX/RvD93psqICm0wQvA/ero+r2IWp7oLd8RmzGYF
	KcC7vrXElRVOzmu4K0NHgTSR5E1lSu6wymSDZzyrXXBVW6zsTcCMnkRx4+kpdGv2bQ1oTPYjnpi
	2yPJJ+plDu5od3hz55wjog==
X-Google-Smtp-Source: AGHT+IG0IOUDjXj7M8HLWY3rdlmEmUiO6k9aRVSVPoDq9wO9uWrUVEvcWB+pKuqU8J+AxzpC5sR7Iw==
X-Received: by 2002:a17:907:3f12:b0:aa6:7220:f12f with SMTP id a640c23a62f3a-aac2ad8abccmr3008858366b.18.1735318664166;
        Fri, 27 Dec 2024 08:57:44 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:43 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 12/23] arm64: dts: imx8mn: add phandle to anatop within CCM
Date: Fri, 27 Dec 2024 17:56:15 +0100
Message-ID: <20241227165719.3902388-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
References: <20241227165719.3902388-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the phandle to the anatop node within the CCM node. This makes
explicit the dependency of CCM on anatop for generating the clocks for
the on-chip peripherals.

With this change, it will also be possible to generalize the CCM driver
code, as it will no longer need the platform's compatible string to
retrieve the anatop device node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v7:
- New

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 49be492b5687..68efa77535cb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -646,6 +646,7 @@ clk: clock-controller@30380000 {
 					 <&clk_ext3>, <&clk_ext4>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
 					      "clk_ext3", "clk_ext4";
+				fsl,anatop = <&anatop>;
 				assigned-clocks = <&clk IMX8MN_CLK_A53_SRC>,
 						<&clk IMX8MN_CLK_A53_CORE>,
 						<&clk IMX8MN_CLK_NOC>,
-- 
2.43.0

