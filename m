Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2394432E738
	for <imx@lists.linux.dev>; Fri, 28 Nov 2025 15:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764342042; cv=none; b=NSwmVCaDucGqSBzWmIPWJNfhuUUuRGeu7YTK3LPVlULnn3l6iwbcAO1MvkV2O1pUQ/lm3SB4eocnROIWFoAz8A77oQmFw0L/kmSOguYB7Pc8bfon6caQwMHso9WzydnH/IZ1PCTqnAoTP2+n2s3xrafr78Ql96LlaT13CJM+9Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764342042; c=relaxed/simple;
	bh=2n1mGD5+ic6ozAMvN9X1jkRUnYXHrZr0BK+Mo+Rbuok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O0wjXtGveZkvh3N4Xq5g7ucfV1L6ICGceWzvVHbBJ2BNTRqvr+4KZjeCjUVMtoHXs5qaCVR6CFHkPza0BZoLrtE0xRTa+3s8Fuh9NKvcYOFZI+kqhb4ufd9b3UqnqN85H1lIKABGocg4fSjzu04a8JInJXl4qV4Shnf66/y6gfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kf8fcw6w; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kf8fcw6w"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso10653225e9.1
        for <imx@lists.linux.dev>; Fri, 28 Nov 2025 07:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764342039; x=1764946839; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLPLsMZ0Rfo+ZS4duCCd3bYfWswLZlnM4WVeFNQjOUI=;
        b=kf8fcw6wNtjyisAgtTI/f0AV01D+/POJSdj/WCX9rFqJTM89PTtWq2Zhc90/KtYd24
         SCwu8PFZ20lnx7CRtB4NFWiq1S3WW3Ynxsh9nDDnYgTad3rG2owk1r65o5VrMfyKs5VP
         U0/RNwp4CEnZvnl9rV2Q7f6+9emoapQ6LTyVfjJlWL+YvXlufY6w8a4sjtzTQlmiFvE2
         cUnR8hZLnB1HWpdE+a81rO//hXd+Lxg1YRWBviSLlsT3CbDtAvZQKVWmAvP/KQFfuadE
         z3X+g83csS0+yM9YQiVkv+gRNJCDEwvCzRQBXnOdLwb8L/GoutPTIfIl+1I+peINE/mu
         05Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764342039; x=1764946839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pLPLsMZ0Rfo+ZS4duCCd3bYfWswLZlnM4WVeFNQjOUI=;
        b=HK+vdzlNmULC0x9qAhyh99hMWtbhT8aEO+ekyyPvKGDEApsIQFoY0ID0z2I1R3fY4F
         HH/NFlUuYK4RT5LtZ8G8T25+DSDcLdyvLF3z7xxYEoViCLG0kP04HVl2wIzXYDa7nXEa
         Y2oZcgWA918gyQ+CxojXve/4+7ASjT6Cg0W1KYglCMg5qmYtLwBZxh7Epkv12ycIMqp1
         4uHdw7mjGUqgAZVZlzjNdwHHzaOKrIOVJxOWTDu7ktdfknkj+KOnYHo6yhYduvBUCZzM
         0BocMOB2iVyYPDf8xJ7GVa5349meYfCUNsFQAPlyRRcIambcDaJS2qMX8Xg6WCshMJqy
         BxxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXF1CHdy5YnrzFTXq6tzybR0a0B0Uad37o0ROmwZmgkTC5VhAiTLZ/kuSsTTiah0PDGwM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwY9eFJ3mE8T/VhO5U8RwW3mGhRYUd4IaPG3iDx77qSBvlwf6mp
	NArKMHjNp4KJQBkzHFYdFGZ1y1VACf7W/fJ7ierNvngbjdJ0vmxKnuWy
X-Gm-Gg: ASbGnctJvCRbOJwCyO2wN/CXzJUc5NC7ZAgweBzTcV0eNrkZa2QYMrucj6a+Sag8PnL
	LkdU6+xD44Us70OBJL3rU2bKvMfx09+09qCyRoWIQFNBMjWa2OYCYpXN4Q1x8+RjaRMMZ33kX2H
	R++yD+RDRIRlu+4RUvIJ8ZMNvPNEZD/RmBCAqb6GnCJlScjVMdp7Vd+GA/rqBbcwmmJ1GwbEP2a
	WLetsQgUkLNlZZoU16ddVQrcMe7J1bD2KNzt+jGaYBfbou403oo9cQvG8zfPsV5Jt7LYZ09broP
	bM421PFVQ1O2L5Czw6yVfDqCNGS+7PKU24q378jqR+UFVSPJWHDpccJEm5bbd43YWGnDwN8QcrX
	DxWdun3NWb4Jy8TA0uT2SCYQuPgAJmaagk3rzGvtRheZOws7UM48O1DXWBoCfGbHrqIS3yhp35b
	Uj1yoLMpkX8RqveHloxbUiHEipt4U=
X-Google-Smtp-Source: AGHT+IFlgJFRf2JMoaAN9eltREbdMzQ6kGR0QfXm0xys/mdvmCQM8er4HNjXsyUwxtFVt0idR/zaNw==
X-Received: by 2002:a05:600c:a41:b0:45c:4470:271c with SMTP id 5b1f17b1804b1-477c1116de7mr269345345e9.18.1764342038958;
        Fri, 28 Nov 2025 07:00:38 -0800 (PST)
Received: from vitor-nb (bl19-170-125.dsl.telepac.pt. [2.80.170.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47905303963sm93117975e9.7.2025.11.28.07.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 07:00:38 -0800 (PST)
From: Vitor Soares <ivitro@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ivitro@gmail.com
Subject: [PATCH v1 1/2] arm64: dts: freescale: imx95-toradex-smarc: use edge trigger for ethphy1 interrupt
Date: Fri, 28 Nov 2025 15:00:27 +0000
Message-ID: <20251128150030.35931-2-ivitro@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251128150030.35931-1-ivitro@gmail.com>
References: <20251128150030.35931-1-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Change the PHY interrupt trigger type from IRQ_TYPE_LEVEL_LOW to
IRQ_TYPE_EDGE_FALLING to match the PCA9745 GPIO expander hardware
capabilities and avoid emulated level detection.

Fixes: 90bbe88e0ea6 ("arm64: dts: freescale: add Toradex SMARC iMX95")
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index afbdadcb3686..2cbd5606cb19 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -582,7 +582,7 @@ &netc_emdio {
 	ethphy1: ethernet-phy@1 {
 		reg = <1>;
 		interrupt-parent = <&som_gpio_expander_1>;
-		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
 		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
 	};
-- 
2.51.0

