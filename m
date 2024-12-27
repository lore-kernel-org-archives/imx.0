Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9690F1FA140
	for <imx@lists.linux.dev>; Fri, 27 Dec 2024 16:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318676; cv=none; b=EXj4wnBlJGQLoPR3OqrhAQJmnQlpwBIQByNC+smjw0TdTzobEfCG52hW1ZJkYnzp1kR7x/SlNC2nSNLfUsdGZYY01QPaZWPFcDVKncrJshTDiuE2GGp5DeTGFt9PaYLBTHqxae5Rbe4ZSziIKUE+iMgyyefglwLr6NJ24/AOKQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318676; c=relaxed/simple;
	bh=lZ+izl3KOcrP4dTerSDIL2lXeHI2SVlSR3OQDbuK8Bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GQM73OvdR1yGqkodi32eJgu/TPZVhd7AZzacn7O0tq0MiI9SNNnXbU24wFbypw0BuT2BMDjhwTUUUW4z4DOxzYX3KNV8Q0rT8qZRDzhvp3bhNl+kkQARwh5/TQA19dDkmmq6UBEmHg1a61Kh9kBM7bPIMwlql5/TWCUqdEc2em0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=fOJ6BuCu; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="fOJ6BuCu"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa67333f7d2so1092334966b.0
        for <imx@lists.linux.dev>; Fri, 27 Dec 2024 08:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318673; x=1735923473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tXcK4MzLANKycoQovw1YV+Lipo6MwZ9hAHR/w3gOEI=;
        b=fOJ6BuCurtJ4iySP42G8XX7Gpu4DE7/jI2kld40R2/9RMJPO111S3tQdFqaz0CsMZn
         CX3cNlu8ixfcZ8sq2UX6itnkDV98GXNL1sUoNi5zQ45Urpc5Z5GzaRgAu68mFlx+Mims
         vn77tNUvhFqJQ1tx9Dh/Z7xUxgXIH/VhWvi7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318673; x=1735923473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9tXcK4MzLANKycoQovw1YV+Lipo6MwZ9hAHR/w3gOEI=;
        b=cDi5y8VGqwyU7zY1AptsiU009GjUpMCFbhoQ0xFGfU8O03L5wAJLREl81C5nqcVN//
         HMic44IjueHnweX7jInKs2m8See2tRO/RHHsNFI7yhIY10hvx1XejcaiaaChuIqtFpSL
         mY0gOkBBqLLeK+h3DGcKq+yHJ9ufTYgOky4Lxh8RbuzE34XqBv27rfdE6IBGBMc0O2vT
         NoO+mnjGKt+83lGLdUTlGhG7ZnJtGDzrkLo7n10RCLb8+I/1uR5ZwKRk1xsMdO7TwTga
         pMewzAjDpWgZWR5st1/L9u37eYKowV+E2bEpTpFNEEt9Xe8HtgoiDYVuf3jzV1znfJVy
         mB3g==
X-Forwarded-Encrypted: i=1; AJvYcCUupHk+DAIA8VUCBgGsWMNACzenHYlFabJlUsbtc6KzuUM01S1FrUxuIQilcuQE/K+XKuM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2ZzRg4Hfo6DHprsCnOGamS05S9bb4BVG7osyJr1JRK7OlNOph
	GL3QtQg2U3IsUKrCafPlkWmnPBumTiRlRF3jHiE8hi7sB+5xdl/r71UW6hHMr9w=
X-Gm-Gg: ASbGncsi7DzYqN9UCEY0i6E8UbqevLw2N/TXs1Jq94Fux9R4eKgENyPwaBXdgk0eNld
	h5mhQgTukZg0mwmOs8iC03y51cur/bf6R25hQABE0cOA3hRL342wynWjOftBeWJQVgM3D94cQHA
	7uRX8uNfFXcTFjWfhGEz2ycn+n+BAABXBH8SoYSmprJYNTO48vLjFf6Y7n3PBBrIGDmrToAi5z9
	sCGLQr6k/Jo3WmeDyPvbewrV5ormT65FSw6BeWdtNYpS0IOvSpHI9+clt/jEP5fGyc7IW8/wjm9
	MJ6wrlEym9NxMUfNfFJNxw==
X-Google-Smtp-Source: AGHT+IELHXAIGmRFx+PeofZhS2rys3/Tv8YiD1lK/y4zs6kEicZzZbe/K6kVAhiRQW0mq2JcGswPjg==
X-Received: by 2002:a17:906:dc91:b0:aaf:300b:d1f7 with SMTP id a640c23a62f3a-aaf300bd28fmr253744366b.13.1735318672987;
        Fri, 27 Dec 2024 08:57:52 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:57:52 -0800 (PST)
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
Subject: [PATCH v7 18/23] arm64: dts: imx8mm: add PLLs to clock controller module (CCM)
Date: Fri, 27 Dec 2024 17:56:21 +0100
Message-ID: <20241227165719.3902388-19-dario.binacchi@amarulasolutions.com>
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

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index b1a4cc521bf4..c3287978c42b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -642,9 +642,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MM_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MM_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				fsl,anatop = <&anatop>;
 				assigned-clocks = <&clk IMX8MM_CLK_A53_SRC>,
 						<&clk IMX8MM_CLK_A53_CORE>,
-- 
2.43.0

