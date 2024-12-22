Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4E01AA1EB
	for <imx@lists.linux.dev>; Sun, 22 Dec 2024 17:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734887164; cv=none; b=pxkxeltxQM1UWElXK3/pmIrLMoqjArdjNSEnKGoYJ5Tl7Ab+ZFZGIffduTYg3o/TcIUxRQp/sq1rj8xDOQRNL6XPGYf9yPjRy8NtIGbidflNY2trXN5bwvOUX5Nr5j6sYkRJnOxs359Dhh5WD+06KnJU0qSqYmjLeShQwk1mfdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734887164; c=relaxed/simple;
	bh=2JhFTNbz+mPx9HqCC7mp/y2AepFst/c//AlKmHPYdgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c6YuGCNXZG2psvqoYnkhNPRYuJ+zTjmYRRyoKrvflsHBeKYyd0Vb7/BPqw295SCKU2Kq6nKTrxGj0jnPfCfz+dkUDZ2trlWRDRvzkMYVIcMqOvqo1u0Ozp0PQPk4/imL/tEeQWWzJmiWA/C0Y5UvlwaJ4AyTzwmF9DV4CL9rrhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=kpObstiF; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="kpObstiF"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aaec61d0f65so121202166b.1
        for <imx@lists.linux.dev>; Sun, 22 Dec 2024 09:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887161; x=1735491961; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2hCs9DBY1WcnrRGyr88Evw8OuCDQNrA4ENDf/4vgOw=;
        b=kpObstiFrrcW/0nIMtWJiA5AtlzoFabjvdZtrGmq7IPsDmPfkRmYLmbDqyCi8OjiJQ
         pe7jmmq4Yyb80hOoKZCQxb5v/KTmnoVGdFUJCwIPcpfdhFDb9ZpiuiC63xxxFWBnqRGH
         P3BhgCRemHZfM2cWBJL5PAVrXx4KDY/0r9UME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887161; x=1735491961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j2hCs9DBY1WcnrRGyr88Evw8OuCDQNrA4ENDf/4vgOw=;
        b=nmBzj3jvCKeAEN+2bOUA9cOKlNakzEz6HRpLzDdoEiL/8mS595K/kiQRgHQPldoFvY
         xXdiPbj1oTWPzqjrMlebFp4hAmI4yRUdjvFWJuMgIO17+xqJxo5Ueq39S6+n7aVy8OKb
         4ougiy0mn8jdJF26nOUtVd7352/CTbylx/ZyF4Qwk3nHTM0OX2pWhZTM2drBWkZPONez
         x6Qwtshtt1oImCS2LKUkgyBsCSJoo7lgYXC8Taukfv4hjuG1LgIwXRBHz1Xeas/0fonn
         Rbpcg8vLITKjtRi+a64mQ0hZB/gL9uLJidbgKKe3WAf0FHl89YkaLQod7mCG7PPCjAX+
         3UlA==
X-Forwarded-Encrypted: i=1; AJvYcCVc/PYssvaF7XvqVF/NajVJ5s0RpOJPWxxACtgxrk7zB08Kyhr7VJ/KVI3VxY+ym3l6d3g=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywe5ZzyxTtCKHS4iVPma/IVFNvjMQJAiuLQWxL3Ai3uXQpXwMbu
	Qr0IY4hcqBG7xokP7N/+ei0g2gkLfZEP8YHhfeSIVvfj7tIwAsm575qXHH3HYzE=
X-Gm-Gg: ASbGncuwvehB0VbzTx2gYLT6m+findWepHKgZ3TplU057gn9JycKX8jzNFulIYbmj+G
	HZ/U5WD7RMBtwE87Juxa7wMpNjrBCsskNSQUnUiC3FQ2lH0OKEALgGpwev+evm0rC1UrIzqXHR5
	AqQ/v25DFeBBD3PaWbMKBDDx2Gd97z10rks4q0dBpmi95XO9wrs0OQ6gcZPiEaU+MiuQ5Ew1bYK
	WZjtNCXpEhRMYQjHBn7yJGkF57OyPAnGlERTvOsCKaToY63aX7EfQ935UYWzB4UILrbQulYzpDX
	RHAqrF4YVnWqkL1h0j+1qxleZkROCt4qtY9qXXLWPa3Rgg==
X-Google-Smtp-Source: AGHT+IGrdnp4N/NaiyuFY3WnBeZDVSq9Cn43U29rzxiI+9WQh541chHbCDz39sJDsX8w3trYGW8osA==
X-Received: by 2002:a17:907:c20d:b0:aae:8490:9429 with SMTP id a640c23a62f3a-aae84909672mr543216266b.34.1734887161008;
        Sun, 22 Dec 2024 09:06:01 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:06:00 -0800 (PST)
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
Subject: [PATCH v6 13/18] arm64: dts: imx8mm: add PLLs to clock controller module (ccm)
Date: Sun, 22 Dec 2024 18:04:28 +0100
Message-ID: <20241222170534.3621453-14-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
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
index 597041a05073..0b35aecb6755 100644
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
 				assigned-clocks = <&clk IMX8MM_CLK_A53_SRC>,
 						<&clk IMX8MM_CLK_A53_CORE>,
 						<&clk IMX8MM_CLK_NOC>,
-- 
2.43.0

