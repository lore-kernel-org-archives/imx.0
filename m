Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEAE1ACEB5
	for <imx@lists.linux.dev>; Sat, 18 Jan 2025 12:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737204078; cv=none; b=Ek8xH/QJ9X4pTbbi/2YF+GLul/dEgJYg4sJ+j851DRTXI/LOy+lEjTFF+qucHUC7G633X4vSyCqtrB6rffrC+tp0zmEPtswLNgQ5tK7TXYH/MowCWQWIH1Ybdax53gRuPTJatKJpnrHdAcBfF4zbQMGohO4wrQa5xEtPowNB14g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737204078; c=relaxed/simple;
	bh=gzAb8Vev7F0m4l48I407MYxa8qXR/pteEzI03GTE0HY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qhHJY64yW/nT5puh1rVDVxt/+PYqkgnJlLfdUNe6pM2ykjZI3YzwR6WddtAmvfR6foQlbh8gsOD0jLDxv6jv+dSCcW7wN7lPE6ZWtDAu4Bcfz0mEb3GP99V31osYd6FRnR478gQGPjnIF+XhUtNubdlV7VpLa4fm+1Kao3Pl8jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=RO/MjQQh; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="RO/MjQQh"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so4771683a12.1
        for <imx@lists.linux.dev>; Sat, 18 Jan 2025 04:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204074; x=1737808874; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=;
        b=RO/MjQQhTRSwQNqNP98RQXe9WmNvsoA6b7x7gcr1JGQPGNQqJ0KcJN45llD2M3Dc2/
         VD9R91XChdhILop4NfLjCh/p6+DishpfCf2PfFM9exEkYigAJc+ZGmb27VjbH6dcbHEj
         f2mNDnSRMsk9yDnhQPkkyhbZzZYFGSKM01c0Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204074; x=1737808874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=;
        b=Paomhg+Qx05IXTUWWcW13Ml7weRZm1qjxsnsbeZsCmoGhoKNMrWMp37ppQhGTvfmgf
         fQeQzugCWH4XUYI8KAPczkSC5MPdlZ4TZXd6IkEf7FJN8t4KzbOGvlV8Si7vGRyyPU6G
         mlYFTQ1Hc7tbXmhaq1NwoFE+gr1R0yHbPjxYsrkCfkcT5jpFC8/p2wiVPMCHV+dhDnqk
         /iCjmsjTWZ+OzqFkkU7BHFuaErRi0c3H8dJLsKGTSjypqjcXqpoMCNpPI1PMFMwePTUU
         oaC5VbbN2JZhu18VACsGmmSAHyBWHjXUEmJtAst8payb3ta7RHNzT/Lqd3DEp4hLpvJ5
         TNog==
X-Forwarded-Encrypted: i=1; AJvYcCXqjNaSp1nKQY5GtE9ySmn4ObhwFBHE5Mj1Uhx8EmSzPom5/kf2nCWq4iRDQHFl6hqXEMQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQM8k7mRoz0rlCsW2Lvyj3cgQQ63mIHE3xv4UBiRkPYKm2Kx0w
	stZu9RLIQbuz6WYkWVNI361tl/PfvbxqmknLQcW8CWClcPzRPB5sHBiniwfSfpQ=
X-Gm-Gg: ASbGnctuS3/pWXoUnYWh2yhRuGg/6zRWd7VMJ6NjWG88nBQS60hU1vCqSO0pGXVyg81
	vYZ5Dcx9uW0JeWExuLx7E+QfWUqyhtYktoE2tZwHUn8kEPga+n3wHwkFt0k8bXlkz+F64D9jRt0
	AgV8+3u0jeWSfxNVqSsulpTERWHhYMuq7LxWZ0y00707OCq5fHauE82/Br81F9Kz2NkLs/0RQu8
	iEfz+/B7zwVasmBYk9WIzciUmsQU3rAM6GC4rX+1i3i6L+UCVyyActC3HIGDGGZbk0zU/ZAnurw
	30xNBOWjrp1x4ZZe3M7/Y9V4qikHybw5BnZlOX2a2Td0fVI5wYWjE/3MVPVjwKAtXKR6oHSOXmg
	QLtr8qWzOLdNUuK7sj/xOynVXl3/INah3Jwut
X-Google-Smtp-Source: AGHT+IGnqr4YT5Wzyd83pkMxDhSEUlvVDC6B0O6kz7Yyd6w6Exw8TgSQIXoiI4laqNBgm+rQzNW4YA==
X-Received: by 2002:a17:907:1c19:b0:aab:dee6:a3a2 with SMTP id a640c23a62f3a-ab38b4c6500mr487244966b.47.1737204074293;
        Sat, 18 Jan 2025 04:41:14 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:14 -0800 (PST)
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
Subject: [PATCH v9 13/23] arm64: dts: imx8mm: add PLLs to clock controller module (CCM)
Date: Sat, 18 Jan 2025 13:39:56 +0100
Message-ID: <20250118124044.157308-14-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
References: <20250118124044.157308-1-dario.binacchi@amarulasolutions.com>
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
index 597041a05073..79f4c1ae7d8b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -642,9 +642,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MM_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MM_ANATOP_AUDIO_PLL2>,
+					 <&anatop IMX8MM_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MM_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				assigned-clocks = <&clk IMX8MM_CLK_A53_SRC>,
 						<&clk IMX8MM_CLK_A53_CORE>,
 						<&clk IMX8MM_CLK_NOC>,
-- 
2.43.0

