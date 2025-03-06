Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31618219302
	for <imx@lists.linux.dev>; Thu,  6 Mar 2025 11:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741260661; cv=none; b=brkKqR8dH+hk29q6HXnlg2PtTKjZf4D3mWxg6JYKKi2W5mTOi1kCyNOshaSkyWa5w0n7aV2GRZdWn3RK2ZeW3FeH0mf7d3hx9HW2wmYYD4Act9FbKCaa7q7/KUuvjHzE7rxq+B5yvKmiMsDlfvhutO57q4mk0c0BSL1/lUp/wIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741260661; c=relaxed/simple;
	bh=7yYZJd86bIYU+vT8RAjY7wEp1oq0Xfmfy1RQITDVRe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J45UbXa6VaFAsmy/VsgPd/ocuasNlb4fTxcnvshis9vpjBmRp4qYg23TdstCfgeSaKZJTN18/RhigL0eR/BKLFen9neEy8gOAGsr9vdOVbR8xC74vRlTI3ow9xwsmI2N9VvlbAIBtF9ns/P4+v5RjP9ox2+r/lLSQnDItmfTNLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=mBEX0R6r; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="mBEX0R6r"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43bbd711eedso4007855e9.3
        for <imx@lists.linux.dev>; Thu, 06 Mar 2025 03:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1741260656; x=1741865456; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=;
        b=mBEX0R6rQ5X0KRpLkSAVqTLT1GQJD9OBtDGHDRDdEu06UC/QU7Te8RdYpdN0WsD7R/
         udhELxrrC/Z/A34VY8zU4RqdUoJr1Nb5E5/q7ATo+N8NUPG7eo423N9LI9C1DqA1lsNL
         2NRTczb1IuJpqZSyL2CcFC/c0rQVJlEgyviVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741260656; x=1741865456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8grfYWwIX4hpiA7jlx82Mk2yoAsYJcNHuOuvJvnYwRc=;
        b=dL343c56nfb1DmCBfuU9LsmWEu7SIi3tgff3W7hi/JbAYv2+Pe2hxmbFFLQJvQsjCq
         ZdMtrWTyPZss/C6Y0sN1FMuLNh7fYfKH2V8BXXFJHWSm1nFXNLBTX5FInZJqjZf4b9a5
         Zq5qsU/y95+5YWeer56IsY7EM61jlrscX/29hY2w2FWEOzVDSaMTNZjwagduVedxj6gO
         12o6nlshD9GGA3wbtLeFlDZT2+HvSRSOP45F1EmubVaJhqWWGOm55rEYAdj5FoT27tLb
         doaVj6voiORXL7oXROhz3sL7LnM0o6DOd0aoQMA9tAlE8CevpYfTBXLf5YgE5wLlDIZr
         7qCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhAdG/pDpPhS0omjzH/o9/Z0rzV+xMhR/9GNVmedQf9oUKIP0BchOmsjklcP66gVmPYSg=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywrmxh6sXOGDWpdhddes/5R53gmBODrNbOKHHwHBNB3RPL1YRmB
	DcryrKLPGKqP5DudfEZrgvjurX6RNHpwvii3hnihRmNClgaPsBkuRHwwafKvAqw=
X-Gm-Gg: ASbGncuqMTp0NgmibjSP9i2RV7QjE18Lf09pk3PgNqoT+j+4OU0ridcpyLbZc4ONzny
	+6KulJZiy5M9VWNBNdWrwIAMtkh/KoAPe7ftQtsTQ5i1l9rwM7dga6rthdHgD8z6Bhj63eAJr8w
	WRsYPZIcvw4duxdGa0/m7vVEWp8yGkOwSE7RC7yTa81jACkGQm/j17rusqKYBHSzVXw0WNMwukc
	WUP2jfRRuuUO00yixppdaIH/VtRMXNVmpHNCZcEIg6Zq/hXjE/0dGxFmIdtJO+8ULrC/qbhKyD8
	2KloJbBHGagu/LsWSd32lfyazyBkU6WhZcxRmhMQXZRZeV1JU7tHhkonAYgQfHDNiNepqRt/CoP
	s5bvCFA==
X-Google-Smtp-Source: AGHT+IFeKvGyyBqN0xdpou0tHRjJGAp0jFx4x573e2BTr5KjxvJqJCsFOx3f7ZBV0vsm+afHKUXGSA==
X-Received: by 2002:a05:600c:3b87:b0:439:6101:5440 with SMTP id 5b1f17b1804b1-43bd296abc2mr49684235e9.8.1741260656050;
        Thu, 06 Mar 2025 03:30:56 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4703:aa8c:6eab:8161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb79b9sm1749650f8f.3.2025.03.06.03.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 03:30:55 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v10 17/18] arm64: dts: imx8mn: add PLLs to clock controller module (CCM)
Date: Thu,  6 Mar 2025 12:28:06 +0100
Message-ID: <20250306112959.242131-18-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
References: <20250306112959.242131-1-dario.binacchi@amarulasolutions.com>
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
index 49be492b5687..01013c1fd61d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -643,9 +643,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL2>,
+					 <&anatop IMX8MN_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MN_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				assigned-clocks = <&clk IMX8MN_CLK_A53_SRC>,
 						<&clk IMX8MN_CLK_A53_CORE>,
 						<&clk IMX8MN_CLK_NOC>,
-- 
2.43.0

