Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4DD1FA159
	for <imx@lists.linux.dev>; Fri, 27 Dec 2024 16:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318677; cv=none; b=JBYzE9Wp/1DkDY+oL/hUmEZ2FF5ZNyU4kyPzR/v6Th5/DG8vobzQQtOGEggmF8rz1ISlmO82vdgFQ4QR1kFrEVa82WhWd3XFFr1tCHTnO3x8ZKqHOmdCovRIgQHKmNR8Z7JWuvDXFUPhIF3DwLwDpK1OvCnLkmx2YOHlqoG6Ipw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318677; c=relaxed/simple;
	bh=WPI2dIsyUP0LxzdhYGphrf43j1SUNHG0CnoAlIBpkLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ml/+Hgp9eN+8fDnrkViyaXVLv9NEtg2YwE7K5bNBrtntNnoun3OdOUyMsfZf2ypUOPbiUoF2TkAIQtJer2G1WA1WHe1JH2ZJtCih01NpP40vPF7lRSLrZbPQ8YrNIhJS29JAooosZhb67zGdd4KhjcyB8JKMLp/8ikfjnRNuLSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Bpf5qSnO; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Bpf5qSnO"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so1281098266b.2
        for <imx@lists.linux.dev>; Fri, 27 Dec 2024 08:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318674; x=1735923474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rq1VSi4sJPfcoFKtG/h420vGHkyV2FuPufBKEuYsW+8=;
        b=Bpf5qSnODoosE4IurnIXT4iK3s5Sk25DQi8KDnzjWejEfzvUTeQJ3KyzGZDEOLhYJH
         epHuCsMezAD9BHC686tb7XDp4X9XiyDBkuF5MKo6gYpH6DAgtDEX/i+G/aHtoQeVhhbD
         80u74G6FybZuuPSN9oxDW05TbP1cNb9Hi4xpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318674; x=1735923474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rq1VSi4sJPfcoFKtG/h420vGHkyV2FuPufBKEuYsW+8=;
        b=tUa/SMh14JIbD2/pBcFL69hp0KMfQzKgGvwA+Yh8tu8c7+Oi7WWJuDV7INBJoVRdY/
         1dh9vOexiR6Ktv10CuUFYiy0EkBrr38JSrunYyaCKF11AGbC5bE+jG6pI2fd44JwSIOT
         TPmVE9g9+vMVWyUXgzUch3u5LiHq11OvniWzcefd/lWkhbHV+ZPAad+6/gKiZ/w4hsZ3
         uzGEPg4vF69++ttTvGcKMWmxBW435CcLs00eFSkr3yl/VZCq/Uad6+/nQUTBiAzfKtsj
         pbXS5tLvpjYvM3Pe/0uQ0+g3ZGUm2BUZZ3C3SylqIdZ40U3u4LMwGxrHlnWTrZePDMVB
         +7lw==
X-Forwarded-Encrypted: i=1; AJvYcCVkc5dTf5oxVYLC0XLmyeIKfbRnsSg5J+ERELQNy+zlSnxm+7VS4Tw0xXnKX8UXqjoBPN4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTC7nV8S26kO88B1kHji0ZF0U1uNESV+bbrvNtrcZG89drJG8e
	lJNPn6Cr+1s1IQZrYL8nU1P0xXJiuH6jmDovH8Dp2HbPtO0GT5+OaoqTZ3gSgiI=
X-Gm-Gg: ASbGnct3lIqIPYZ5QbODgh4yelvZ3K8qtG+heYOCzR8Cnoxfd7tuBXLJoYEM6ufE+Gb
	I/c0dDipHG2BYLSdFfwmkTOgCo46TN1suMVNoQfgyAgdGMCgNy6+ASPaPvdy3ZdkjxpBcdGnJxH
	4SwrYNHDXP9toCEWtz4H5mdxmvxnUtojg+jnqsIyl4JF5tycaiscApRkwg7YKnaI7BW15KnKoJE
	PZ5QbrL2FFgS2/527LXQPDEtsLoYZhDvFS6VkefS6boPd7NftsUjQFNC/0SvKwiy6xTwjGVGzCM
	UJfh3pgmRI+u5KS+UM9k1w==
X-Google-Smtp-Source: AGHT+IE7j4dDMSJzj4YF9TTof8Zod66BxHTVWnQ8MmtOChqL0trQDynsgYUTS5unrBlBn2AwqqLf3w==
X-Received: by 2002:a17:907:940c:b0:aa6:82ea:69d6 with SMTP id a640c23a62f3a-aac2ad9e63dmr3011790766b.18.1735318674459;
        Fri, 27 Dec 2024 08:57:54 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:54 -0800 (PST)
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
Subject: [PATCH v7 19/23] arm64: dts: imx8mn: add PLLs to clock controller module (CCM)
Date: Fri, 27 Dec 2024 17:56:22 +0100
Message-ID: <20241227165719.3902388-20-dario.binacchi@amarulasolutions.com>
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

Add the PLLs generated by anatop to the clock list of the Clock
Controller Module (CCM) node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 68efa77535cb..ef25c4a655ed 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -643,9 +643,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MN_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MN_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				fsl,anatop = <&anatop>;
 				assigned-clocks = <&clk IMX8MN_CLK_A53_SRC>,
 						<&clk IMX8MN_CLK_A53_CORE>,
-- 
2.43.0

