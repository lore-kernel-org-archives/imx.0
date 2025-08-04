Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DFE274FFC
	for <imx@lists.linux.dev>; Mon,  4 Aug 2025 15:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754322931; cv=none; b=OYdT9/MQO58QoSkZbecmUfCOYdZVkkgELD8TO3x0E7B33XwDZt0emHwHKHbPAXrcfcXAHhd5auYiVtBFeZAwS0FNCmrgdv6gZEn43uLXkuWyqzM2yL4cDXuATU7arCeWU8kExODKgt52TflDpFmbGA6hrp+c0w/Z0ZkckLnRIeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754322931; c=relaxed/simple;
	bh=G3AOG/bEGmhO/+ziIgJS1IJ9V+kVnQuf2DhW0m1MM1w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aSP+Ot/N/Dv5bfkj7Q4p7NAT1EMFjjPmRZT8zJtEtxBXKppF4Hsk6QIJaNu36Y0jeIlXb900cTksPmCj4TxIcBo5C8xsRUHwH7kHObAfNhd5/rIToB7aZZo4AvWTlITdaSp0LAQQDdeyDVj6uxbZd0z4DtW1lYcUwLoNnd1PEYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEpEixZp; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEpEixZp"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6156a162537so7046631a12.2
        for <imx@lists.linux.dev>; Mon, 04 Aug 2025 08:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754322928; x=1754927728; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLlT+oF+y8eGG+KGSJRAGU5NF1zSKfS78wOa934bYI4=;
        b=SEpEixZptzPkAOEd8BeFROGU056GTj2P3WJ2p46UVZhqNcXpaZfppCi/gmZdJ+0f/n
         93qTSZ8eMgHX1c5AuxhTmf7gtVobudzCUm2GJkFa9IV+NUCC8J6JaeQ0Ejn7KI9my54q
         E8+itXq22rvHZWEJltaGTzu+kfR228ZLE4XoK/kkwPq286/5g1LkpIxCsmNSz7MY0vzW
         jBLJ3uLhWSvztyY6t4kzcgw709tAlBt7N6Yrc4XOpJr0LQCqzkxTmSQTw53kL06uSSE/
         HBBDR/7R7Qdbyj+PuVb3tg/kgnRQ6Msy6JThLRs3oX8Qw5J5fGJnjTPnYbP20pJR7TtA
         fOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754322928; x=1754927728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLlT+oF+y8eGG+KGSJRAGU5NF1zSKfS78wOa934bYI4=;
        b=b8xgToRD5Sy3qIxckLAZ7a3FrKrhieDcDnnc8yAOc9S34my02Nr7A4nZU/0IK06puw
         6E3eVzxhBv0Qtv91IeYUfoQesi1SsyOzr3VISwjIrK7w7zQMF474/bjFhZkZwOSoQiFs
         hGe+eDD0jz9tKtFxHClgEgCDjnqTGfj8QDWqrD5Mk13z5PUYw6nu6K+jnOSkCuapoHKf
         m5U59wXn7WRbsG28nyK02BQ+tpGj9uyfw88JXWYUaRg6mdvN7cmAU/5F+Wg79mt4ZD/G
         dMnTfAIlXx7V8T6hQOsfFMMwmktYShmgVjQeuRacTaZ/tQDJyLcu4RRTZQ40qT4BsMsO
         5Vhw==
X-Forwarded-Encrypted: i=1; AJvYcCUctatVhVHm1/vyzmRldBTS80fwDtxejqnCBzxG2Tq7BWlNlYv9U/YwA9prdZ5tlzISUOU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyxm6UdwdLdgIgDkAQ/PpY7gRdIx8iBy3qFxM2UWYQexrPdo9Ez
	EBtthL8hClh07MgyOoHE1wSNVquk4Hs60Q0cHLItk3LQPFqjPI0ZKohXojpVHQ==
X-Gm-Gg: ASbGncuz8rcfwTtM6EiV8DYWwik/+CleBiGyCAW1ydfxzdgLw2RmjSDlfqpXENe0iZS
	ZUP989eHvok6rNEpC5H/4R8/+wo+I7ext14pUeztHXqshUhnCit28BoOMX2YeRubEBFrS1znsY9
	qgqT6fYw0XbSrrFk9+d29Y0HLxH+Ji2KkTiO8rGV85yupffousuirADWOY1/wl2jft9EOV/G+Ro
	SZm7lWGfqsI8JqnNkR4CaVha/ZrHP36MkmAOQYRFmx/yy+oY8CljTdcqwnqnMPIO8Nc3+WPlf5m
	5/imZ9LtXK5T/sWJN2o6uCjU2gFS4cxxz3GwZx2l2OE6ixuaD3+MjZsg2GKZrjUSU8Czehr/Tvh
	ibngwVOfCP3YZ17aOil50cnnbyXTNsl0q5rEmrAx1NfFPEu7BZb5QnRCysaE=
X-Google-Smtp-Source: AGHT+IFkQCoHBvtFXtmc6tn7x2i+nDP+sB5y4q5vfMQOe0tSDU1cK5lDy/Byu6GA2X7xwsf3VhALxw==
X-Received: by 2002:a17:907:97c5:b0:af9:3773:8232 with SMTP id a640c23a62f3a-af94001e6eamr1176790666b.18.1754322927566;
        Mon, 04 Aug 2025 08:55:27 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a075a74sm761114266b.17.2025.08.04.08.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 08:55:27 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 7/7] arm64: dts: imx8ulp: add sim lpav node
Date: Mon,  4 Aug 2025 11:54:07 -0400
Message-Id: <20250804155407.285353-8-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
References: <20250804155407.285353-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT node for the SIM LPAV module.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4..d84f50d8ecc0 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -776,6 +776,17 @@ edma2: dma-controller@2d800000 {
 						"ch28", "ch29", "ch30", "ch31";
 			};
 
+			sim_lpav: clock-controller@2da50000 {
+				compatible = "fsl,imx8ulp-sim-lpav", "syscon";
+				reg = <0x2da50000 0x10000>;
+				clocks = <&cgc2 IMX8ULP_CLK_LPAV_BUS_DIV>,
+					 <&cgc2 IMX8ULP_CLK_HIFI_DIVCORE>,
+					 <&cgc2 IMX8ULP_CLK_HIFI_DIVPLAT>;
+				clock-names = "lpav_bus", "hifi_core", "hifi_plat";
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+			};
+
 			cgc2: clock-controller@2da60000 {
 				compatible = "fsl,imx8ulp-cgc2";
 				reg = <0x2da60000 0x10000>;
-- 
2.34.1

