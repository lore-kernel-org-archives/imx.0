Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F791DF25A
	for <imx@lists.linux.dev>; Sat, 18 Jan 2025 12:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737204094; cv=none; b=qVZST0C6xqYXtQ9hRigHDrarM2VE14UFEsJUaS2x7cCxD4LArzKKlJRTIYlK6Hm1kGCYjhUQXmn+MFDDu1diFEYSlcx1JZ9dqoRmcM5rdiY50PpFKMqmjgdNMkO77lwOLFExwA08z1r6MaMYtExNYmy4ZC1beuExcPhvuCwtOWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737204094; c=relaxed/simple;
	bh=JvnB9XcgmJl41UfJoJnGQcnIZBMI1twZKprmYaAPr8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aH8QETtkG4/W73CYNzdEjXS2Xqm2ssFM0UtUP3XXmAn9/WHKdFF039V/f5pcc3rp+KoQGtBPsGPDSywktemDJRm/Z2zaBlAcrhAmLifsxGNr0C0eNiBWDlUVVNpqH88qkLB1q3PhrpvFJ0Lc3SzpesJqJz5zh651Kqd2JzFOlaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=UFkftzkR; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="UFkftzkR"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa6c0d1833eso600073966b.1
        for <imx@lists.linux.dev>; Sat, 18 Jan 2025 04:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737204090; x=1737808890; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvTKndiMkROVePKKMXmQxzHj6whXXjb2pDAXF1Y9+GE=;
        b=UFkftzkRJaEBeo7MDbeructLzDuplKNLPg8Y3u4s9UXUr+Zlc/MDBk1YnDkwWQPnkK
         3e1jyltN/43DjqFdhPOu03BwoFXdah/6N/JwhTbWWZuP4F+L6Jj9uxrgV9Geb5z1iLLF
         TGjcjxIDNdEX2Cvf8LS6a/VW2KQ8CDN4YAjs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737204090; x=1737808890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZvTKndiMkROVePKKMXmQxzHj6whXXjb2pDAXF1Y9+GE=;
        b=bmPyG9z2QpJwBKTsDZX6+EtsG7nWzKu70Iu1bXgBtWXRJK897a2UFWQWVLkSRTYzOr
         WaRmVjJGZcKrwdxVhoX4nUjKop6FKd2yu/Ak7GNe/XjoVuxSmsSSwlN2qlIusaVoacQu
         ITg5MOqzd9I+Gnube/YF8PUBaWI2f0lMieptpYyDHpB947hCXKJ89w0YWcdZqU+Tglts
         T2ZUcox0WKqQ4vV3qMPTyWN21FBOp+JOEHepmpcHjqA6RI6QhvMjJAYYQb0gq4qyGiDc
         IuleL9T7uMV+Vx9Lfd4jScSMHE5byd/H3QMHoaQFRrGhQzcie3m0o3TNhEPjBgXk0KbR
         foPw==
X-Forwarded-Encrypted: i=1; AJvYcCWj3tZbXNPmSrL2u0MvL0BU6Ud1EwGUo1spVYaRQP6GmoeaE2j20OfgF0iJJyhZfw4Hsrc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzjcTIZ0ALt63YaJNUL1uJ8sFaADCnPS144Xmzm3LdikhEn5yx+
	PdzfGUpijLW0V1t+FiaxtvfG4ekXq2GQ0IhCDhtPeSm/GVoXiKC3z2k0Fft+sLM=
X-Gm-Gg: ASbGncsTa9Pv6JKKebPce7/alqshsS6PpjsM+sp5O2i0HCofW0A6ZsiQDLI7Pb+gKWh
	EP/9MDvUdln4Qy+MsAOLyW7DagpyWuk8XyVWqFvPYAkaoe3rw4grLjOh/JNz5wLZJ2M3dvtFC0z
	LjMRKiO04narwXGNYz/xpNyayc3RG7y0MBU/VGhlpALFWgl454rkMoZqWbgf4OcJMxt1C50kNtb
	RjlaOdaLRlvkOek6L8MgsD30NItpx8rU/2FYgX4FlrzGOIcNGRJnrTu81TGd89s48Uoj5Gqf2Bd
	unWPH0LZbrtXsnYkvMStrSpKf7VOeV1n/ZsUMgnjxDjTqlmB6SeLGMXgoEz8gHJdLX4UL+wprc3
	mjnC4BFw2i5Vjyrfx2QM5H7vGymU6eibr2W1+
X-Google-Smtp-Source: AGHT+IFC/pqArB6lP+2fYPukqjbNk0HklO0cbxbWcFV3TF46oG+xZmBHJNyGCFzgAtJ5215kQXOiSw==
X-Received: by 2002:a17:906:6147:b0:ab3:9a57:f4fd with SMTP id a640c23a62f3a-ab39a5802damr320445266b.28.1737204089946;
        Sat, 18 Jan 2025 04:41:29 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-30-28-209.retail.telecomitalia.it. [79.30.28.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384fcd73dsm332562366b.178.2025.01.18.04.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 04:41:29 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v9 23/23] clk: imx8mm: support spread spectrum clock generation
Date: Sat, 18 Jan 2025 13:40:06 +0100
Message-ID: <20250118124044.157308-24-dario.binacchi@amarulasolutions.com>
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

Add support for spread spectrum clock generation for the audio, video,
and DRAM PLLs.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan for imx8mn platform patches
- Fix building warning raised by the kernel test robot for patch
  v8, 11/18 clk: imx: add support for i.MX8MN anatop clock driver
- Add patches for imx8m{m,p} platforms:
  - 23/23 clk: imx8mm: support spread spectrum clock generation
  - 22/23 clk: imx: add support for i.MX8MM anatop clock driver
  - 21/23 clk: imx8mp: support spread spectrum clock generation
  - 20/23 clk: imx8mp: rename ccm_base to base
  - 19/23 clk: imx: add support for i.MX8MP anatop clock driver

Changes in v8:
- Drop the patches added in version 7:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v7:
- Add and manage fsl,anatop property as phandle to the anatop node with
  the new patches:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v6:
- Merge patches:
  10/20 dt-bindings: clock: imx8mm: add binding definitions for anatop
  11/20 dt-bindings: clock: imx8mn: add binding definitions for anatop
  12/20 dt-bindings: clock: imx8mp: add binding definitions for anatop
  to
  05/20 dt-bindings: clock: imx8m-anatop: define clocks/clock-names
  now renamed
  05/18 dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
- Split the patch
  15/20 dt-bindings-clock-imx8m-clock-support-spread-spectru.patch
  into
  12/18 dt-bindings: clock: imx8m-clock: add PLLs
  16/18 dt-bindings: clock: imx8m-clock: support spread spectrum clocking

Changes in v5:
- Fix compilation errors.
- Separate driver code from dt-bindings

Changes in v4:
- Add dt-bindings for anatop
- Add anatop driver
- Drop fsl,ssc-clocks from spread spectrum dt-bindings

Changes in v3:
- Patches 1/8 has been added in version 3. The dt-bindings have
  been moved from fsl,imx8m-anatop.yaml to imx8m-clock.yaml. The
  anatop device (fsl,imx8m-anatop.yaml) is indeed more or less a
  syscon, so it represents a memory area accessible by ccm
  (imx8m-clock.yaml) to setup the PLLs.
- Patches {3,5}/8 have been added in version 3.
- Patches {4,6,8}/8 use ccm device node instead of the anatop one.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

 drivers/clk/imx/clk-imx8mm.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mm.c b/drivers/clk/imx/clk-imx8mm.c
index d39de0a81a6f..f8413f495d5d 100644
--- a/drivers/clk/imx/clk-imx8mm.c
+++ b/drivers/clk/imx/clk-imx8mm.c
@@ -286,6 +286,7 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node, *anp;
 	void __iomem *base;
+	struct imx_pll14xx_ssc ssc_conf;
 	int ret;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
@@ -324,9 +325,21 @@ static int imx8mm_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MM_SYS_PLL3_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_SYS_PLL3_REF_SEL);
 
 	hws[IMX8MM_AUDIO_PLL1] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_AUDIO_PLL1);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll1", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MM_AUDIO_PLL1], &ssc_conf);
+
 	hws[IMX8MM_AUDIO_PLL2] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_AUDIO_PLL2);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll2", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MM_AUDIO_PLL2], &ssc_conf);
+
 	hws[IMX8MM_VIDEO_PLL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_VIDEO_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "video_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MM_VIDEO_PLL], &ssc_conf);
+
 	hws[IMX8MM_DRAM_PLL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_DRAM_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "dram_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MM_DRAM_PLL], &ssc_conf);
+
 	hws[IMX8MM_GPU_PLL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_GPU_PLL);
 	hws[IMX8MM_VPU_PLL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_VPU_PLL);
 	hws[IMX8MM_ARM_PLL] = imx_anatop_get_clk_hw(anp, IMX8MM_ANATOP_ARM_PLL);
-- 
2.43.0

