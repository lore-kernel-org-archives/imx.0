Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A7D2652B6
	for <imx@lists.linux.dev>; Thu,  3 Jul 2025 11:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542702; cv=none; b=rihvx5eOLabcPDSKjPQkN5YV7IXcYrhzBApiTv/D+ECK9EWAN78pDWZ2EBY943yvqRikN5ZUQWNNY213DeabN4XvkufNhh8Ksn7jov8MfIngSN27tg3ThlzolKD8gG5mgf7vGOGBU9WiwIpI0hVqeYIPf1thtqnfDOBQsFKnP8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542702; c=relaxed/simple;
	bh=5R6ckhkY2hESttOY9KT338PgWgQIq75EHvFlZEgFiuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mhXIyaHrX5A0fG/atiW3IZhWD1pU8jOB/woy9TYM0T0nYRbMSPLv2bPYdfAuwYNeXEBlhrVdw5TuNTWQLl4t0ExisriyEjSnDlCU2OqvPnqk0RNZGEsFSIq8ejUjglA7MhT/rMM+gxz+46HI3XEHmQ//zzRKGB+dE3VAeBURYao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hr9zFVI5; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hr9zFVI5"
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-872886ed65aso659450739f.1
        for <imx@lists.linux.dev>; Thu, 03 Jul 2025 04:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751542700; x=1752147500; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OCtxfijaVm+CdySvz4wp4lXx6NKzCfTR5tSHGOmQuhM=;
        b=Hr9zFVI5XTytcyh8gIlPiP8uFkep3oe2tZDGSPbtt6D3Vfz6fk9qajl8VIYXDjm8JU
         NBhjuX6haMBghe481Fb/5lOOqkLLkV/FQS3QhaNEIm2QsGOJQ7cxVW41Ol5yfZCFy++i
         zqLyiO/ucJtd3wDtHJ1+EzMmZ7bqWTAiGXeI8tuzUT4+pvdp28rpitG4/3quM3GxJiAd
         AUaMsXf5mekE/UW+QNy1r0iKIkhQTPbHhkGi36XC69tq4n2w69fM7Z/xMcgSjBS3T0MG
         Ai3UHvPV1zw/XYlFDDwVaRjuWcQhJq0z8tpcvAz7sRMG3/19STFVVbLsniBXwHyDJtDn
         bhnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751542700; x=1752147500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OCtxfijaVm+CdySvz4wp4lXx6NKzCfTR5tSHGOmQuhM=;
        b=EvCoTJWwKTqZcIQHLClnHmBAHo6b9imYhelQZTuXqT1HtUPYn/3qkAOHudtuBw79D2
         M6TiyIIEi1GuMngupyXpQzDZpFiqtZVYW6TZzxMfyVuUvuS9+BOSd6seHS14R+Io8F2t
         Es5UsWI42gxbdpfSYSpsOc7D3nze2M3PKr/KIsjaRHQpch8l7hECnwWvSliJ5e3jfAyr
         fgEhjLolwHdVLwlyzHsukvJOAZeVVoF9hbKhjlsBv47rGDyh62CZlYyutxRo5cXp7s2j
         cFMq4J/SmV7vzyq7ZECNVa8m04iTZYJkcAnwxmMyOYliDZnP8k7V7xqX9SW6wGrd4EPv
         c7Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWv/1hYLyZ0cPBP3IwZxE+LcJ1LOyUYjTbI9i+HwooTk3sl4dmnN7N18hUVqFfNV0Wn4Sc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxsNVQNZ7xQ+ax6jjMVSeB/5/Zw9+Dh6pTVSFo72MMCUWe/iV23
	NbpH11Kn3Mzbj5VMgQ1IbY+hBcxywi70NA5e7iJsXqL6RGQ4IoJeKLD4
X-Gm-Gg: ASbGncunYK+X87/NFhn+ElP++J3/gw5vJURGBFVD4t16hy81hAVmuIoBRZO5gJGK3lq
	O3YRaOuFJMTPprNeo/XNy4zC+ozfnBq6FRN/ohpEVRRzGGQWtA+naSSQLenohjrp/QF6BDcyW2o
	dS2XvDmIN2tGQWf4IuXc7n8NuFMIjH4v0VAFsGqELigNnO0+3QKbzVaXSJ7ybOijAArDq/PN9Um
	UfZhJiieNraX9IXcJQWa+44aGG9ipvgNukWhenKjxYS1ytq9PMMFS37lxOBkfsuY3nIaNpG7Ty5
	GyDz1w2YKjZfqM2rUEe1WrVbcmfoxvDLs3LnZipzjrT9Q30RWPlvaYRZkzxwuUt+P+z1YRsoClR
	/5lIgnEy2HvnSj4c07KoA48lXHsKP7ZDaJFjL1VBv5Ssv68I=
X-Google-Smtp-Source: AGHT+IHog5B1MQo5B5fqSCOuRreuMqfrr3E0s/Y/+iP0IZARhEP16EmHsjUPLaXR/JQcDkES5v7T1w==
X-Received: by 2002:a05:6602:6003:b0:876:5527:fe2a with SMTP id ca18e2360f4ac-876c6a6fd54mr836261839f.11.1751542700238;
        Thu, 03 Jul 2025 04:38:20 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50204a57456sm3483544173.72.2025.07.03.04.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 04:38:19 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 1/2] arm64: dts: imx8mm: Configure DMA on UART2
Date: Thu,  3 Jul 2025 06:38:09 -0500
Message-ID: <20250703113810.73023-1-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UART2 is often used as the console, so the DMA was likely left
off on purpose, since it's recommended to not use the DMA on the
console. Because, the driver checks to see if the UART is used for
the console when determining if it should initialize DMA, it
should be safe to enable DMA on UART2 for all users.

Signed-off-by: Adam Ford <aford173@gmail.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
---
V2:  Fix spelling errors in commit message

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index cfebaa01217e..ded89b046970 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -915,6 +915,8 @@ uart2: serial@30890000 {
 					clocks = <&clk IMX8MM_CLK_UART2_ROOT>,
 						 <&clk IMX8MM_CLK_UART2_ROOT>;
 					clock-names = "ipg", "per";
+					dmas = <&sdma1 24 4 0>, <&sdma1 25 4 0>;
+					dma-names = "rx", "tx";
 					status = "disabled";
 				};
 			};
-- 
2.48.1

