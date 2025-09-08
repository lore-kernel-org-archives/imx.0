Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0529B1FE44A
	for <imx@lists.linux.dev>; Mon,  8 Sep 2025 16:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349898; cv=none; b=ACsjc7ZF9jKmwjYYE7097GTbod7os9JkfiGmsIQdxhlBVlYTPJFx3W+9eWUSL2PBUjc1dtd+WH3+HTInjE3rlRqouK08DNwpRIyltfO3MXP6ottl1cILxx5/MzCaM8VgD2lqCHNv7Zlt3G7XDErRndaUT7Sr6aX8KIujz6hEM9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349898; c=relaxed/simple;
	bh=eNMOk6yX33mnpYcf2JxGWNrXNRaPQCRWV/mLtQ3MjA0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Y+eSaHVKDKcpGt5X5ijYdVRRVU+Ia6gZ6ueNqJ9+rfnZCaejlD9EpPXny3E3vAOgbEcYD9dArKqsToPYR2pC2R/zMPlbqC+jkhy6nfR0btCo9BNRHq/lCEbZajrPccav8Al7l4PXHZPbX5HN/Yhne5f1kFhlu+DbacFOCNtjB/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gmB8Cvv5; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gmB8Cvv5"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-89e5b87f406so1365904241.0
        for <imx@lists.linux.dev>; Mon, 08 Sep 2025 09:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757349896; x=1757954696; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FTDiYUkL2CUr9l6jV622a3f8KP7BPruwWZ5gte8PmvI=;
        b=gmB8Cvv55kiXtkQfp6FQAUcRaMv6FkpN97OBS0tPU2/DmhZZPGvXgVFPQCfdeXMpTa
         hXzUB+KUAh1tOUzlxrGoj13ZOa6N1zi8FRNak0bWh3ncItxeuio5MdlcAy1NPvFn4z+Y
         53qwGediBQOweVu6u8LLXXCZ1NiXaoxE+Xe1nQWZoUFxh3uXxbugkf/iQ6ryMwS2s+fC
         PiiyADZYlUt9j+ZTtxLDth60nlJOnaYgc3tG6sVIrQeS1cMWrEVjQ2jXBj4H7laKcq+k
         4IgOSHpFuJLfSsLGAf4OOtKAkSdBJf2SusOcSfrVnWeZ7OTSzwTgFaqplRkLe0fIajEb
         bkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757349896; x=1757954696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FTDiYUkL2CUr9l6jV622a3f8KP7BPruwWZ5gte8PmvI=;
        b=ULNeuZ6bE/yM86gETlySVy6lAvwy5dQGuDoGY5vUmvSasvL6w0dNEnCvO9nB0aFmRZ
         GNkUOpJcT5dvZ77rRRFv1PhYWldo5SCXqtwcV4yxRcOPVVyGf7iIFaQUV3wqY4n5IBP1
         jcMUVtkILHueS55849P4MSTLdrU4UqRmGOgTkg8hGJCko3Ya9qCdSH2NekRS7ZhD1PMQ
         SxY900RAWA4mNAWpl8W14eYQcaxWx+o4RbQA5WlzZjUng2I6zIJUctFpF/hjkdq/si2m
         sWjGJzUt6ULFdKiNkIaS4g27TljkP0aClz+/0imewd6Ct3/2m5a0jDJ0rHA1Jv7VQYhW
         Zlug==
X-Forwarded-Encrypted: i=1; AJvYcCUAHGHGYAVgfj028Y/lJvp1M3+2l/2D5SOe6gHGKL6lNjXnh7W1tzedJNRJ4Kip566zBzI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9Oj/8OdEl0l8ZXmWjbHDhfaDvDIj0vH+a+V5eP19yUCNSCxzq
	HntZIarZhlTKHbBcnrlhhJsLkLeY6fuadWLbzdaWCAgm/eUjaclAyAa1
X-Gm-Gg: ASbGncvlLJ3IH5I+qPwZCIBolYsd4t4MCa7PIn1r/aKgPSmyP3W05r+/sgximswAcFM
	pmLarfFXBnfLpQM+8vvkCtoYQfXGPD9rtixpMWoXg36Tk46WRgMp5GscMx+EKeSOzJgd02zRiva
	4jf7S5xHl+ZX7EPB3redRx9yOLAWMu9w6FyahiiFRbXTS3SqNCnD2rUWhcCJCI0cVMtfnrPGc+T
	Hah/gB/hYPsURDMzpgTYzZauokoSi4xN/y+GA0hsztyRQdE8Yu5MOCXzKuM2WQEnkg8JAwrHjs7
	DDz9Nm6zCqBPIZEnBT33NU9XhTENgyUA3ARc0GkAEWm5L7Eu7ifwgUqfvVqrmuEXKTtBvun76Jn
	zw476IZ+/Ey2+pm6oHdF8VipvfgO6cdpvFHM1
X-Google-Smtp-Source: AGHT+IEaTNiP+f9nKLoXBeh5yoJCXM8uvjtKSeIiQ7v3ifbHJ4bT4AcLveiBFitDVMsUfEgSA1p9QQ==
X-Received: by 2002:a05:6102:ccf:b0:51e:92cc:6e6a with SMTP id ada2fe7eead31-53d160d3f9cmr2416721137.33.1757349895788;
        Mon, 08 Sep 2025 09:44:55 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:c727:aee6:b2e8:7953])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-52aef458d62sm10689214137.3.2025.09.08.09.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 09:44:55 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] ARM: dts: imx6sll: Use 'dma-names'
Date: Mon,  8 Sep 2025 13:44:31 -0300
Message-Id: <20250908164431.67052-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'dma-name' is not a valid property and causes the following dt-schema
warning:

dma-name: b'rx\x00tx\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'

Fix it by using 'dma-names' instead.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
index 8c5ca4f9b87f..704870e8c10c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
@@ -309,7 +309,7 @@ uart3: serial@2034000 {
 					reg = <0x02034000 0x4000>;
 					interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
 					dmas = <&sdma 29 4 0>, <&sdma 30 4 0>;
-					dma-name = "rx", "tx";
+					dma-names = "rx", "tx";
 					clocks = <&clks IMX6SLL_CLK_UART3_IPG>,
 						 <&clks IMX6SLL_CLK_UART3_SERIAL>;
 					clock-names = "ipg", "per";
-- 
2.34.1

