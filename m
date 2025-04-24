Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3D9205ABB
	for <imx@lists.linux.dev>; Thu, 24 Apr 2025 06:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475755; cv=none; b=T50V0cZewT+nRHMgSDc+gBTId7HEXO+QURaqOW+9e+aAcbqwXoIbt5f9pT95oM1iwMVC+bNaScvAeSllBC3Kq5BUmDdXyuw95jolTW0NJnK8k8EWSmwnGm6c203UEgloPzaqScnpx29ReHCGVfzHlnQiEOjc2EnrOtglL+R+jy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475755; c=relaxed/simple;
	bh=gzAb8Vev7F0m4l48I407MYxa8qXR/pteEzI03GTE0HY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ox9vaSSKMJh2YspggkKD1Pu6LaLatMjKfhvFPOHLE2W1M+/PRVcsfG/Yr0oa0mI8/q11MK183XdzJy10G5HHEWbTGbTx31Tvjo9s72zbH3VmEN5Jtni1BrLo4RA+p/O+BCbBrpinAUE/ab4Q7CMcpecoh9WIheKBiCO1Bqk56D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=TzloaDJ1; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="TzloaDJ1"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso6340905e9.3
        for <imx@lists.linux.dev>; Wed, 23 Apr 2025 23:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475751; x=1746080551; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=;
        b=TzloaDJ1oywhHkdjFOWJeSrVWlpeHPoI1mk5xCQM+2d1G/v8LdSMGodebfy+NdAWSd
         33g5OaRADra6/OZKZxTIr9OhHmd1FA6jABxzfmdXS7bULIA60q5jnx1jxaOgau4t55Qk
         yUjYFzaEQzuRrGBQT1nOsaed1HLp0wPOd1ASI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475751; x=1746080551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FS59gZd32BjVBMnl0y8BuCd7aMfa22x1ZHu9pei4qQQ=;
        b=R5SsVnPTxUaM9Dgo9YFTgrs0Q7HymnWVNdfAwmaZZjclH/asgvjlegrB7GKuCkir7M
         fhM51VrQNYAZbkJG8AKtAIXnqkg0doGFRIppaAiAWwIBqd/vTZ7f2bYQasZOykj0HIXB
         3fabvQY9uooO33MF/MhhfVZM2xAKQku3/sHAUcuPkIunQ3v479SAPyf2tHrrh18OfWzG
         W1vqJhYl957MxsQ7R1f6jZ1worAqKVUQYWvsM6VshmGhF72GYZR8J0Q/6yF2rqhKyY7O
         lAr5U7OVNNjoTJnh+F+XgTbWr22ouHBYgU9CeYvnZvfoSnnJe+8+ukBd2XZzlhpfokvx
         LrDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWuQ5TqtNr+gFJkgSe2JvZIEcHmslKdebOlSRk82YRcaT0Zhx8G344ZX+cyYKB/UTukPk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPCQSqtqKeacc7oXOr7gznqpMIc6Js9mYrcPrYg6oyfzChTzdI
	0EqaqDQnxrZU8GiEKei6SYocEBXo1pPShWNAjOH+cAsNtZIKhvUdefiXGNuQZRI=
X-Gm-Gg: ASbGncsDDq1OuFtqEfiwHLJOJYqqmQcugGwd0CNH+NqkHIeDx3nFeCvRENjVGB+u4Tk
	sx+FxjGYvWjQGLq49Ne5ZBRyqw672HHDAdG2aWqVhTZ4qUY6Ejhp/1CnsoHPfCV+DpziMefmHsv
	lMhsHbIg7od+Ln/Q/l2KP/owqZ9DZOAXb+HCDetuojaALiUCbFDTOKRHU4f+urDvbTJ7fN2W70M
	9KEZepOe7kFjfuwJjT7MMGD0lCvNcw6ukt2aKKXaRiOaHmyDXBrXK8MWjXeQD5lWIyUzf4OVWF5
	J8WohY0Ph6OWNIZF49TS9jYaaAa57QZwUNKH804n37m0gwJ5G2y0UtNzRdBAKNea/cmyIWPjEjp
	U330u
X-Google-Smtp-Source: AGHT+IERMp+XWsY4F0x3mSBeRwTvbYJcZ3M/RXSGGiprl/mRX85K/4aqN6WtoEv+WLusrd9qS8Cjww==
X-Received: by 2002:a05:600c:3553:b0:43c:f63c:babb with SMTP id 5b1f17b1804b1-4409bcfc11fmr8017185e9.1.1745475750966;
        Wed, 23 Apr 2025 23:22:30 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:30 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v12 17/19] arm64: dts: imx8mm: add PLLs to clock controller module (CCM)
Date: Thu, 24 Apr 2025 08:21:47 +0200
Message-ID: <20250424062154.2999219-18-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
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

