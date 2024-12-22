Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D90C1B4126
	for <imx@lists.linux.dev>; Sun, 22 Dec 2024 17:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734887174; cv=none; b=qUiZAYHMs3m1sgvZ5xBSqoEKDr2QvTFR05BhCgV23+q+UO0p8MCmVm5t53gT1ftkdNsrq1NWTNrOYxkRlNg0dxDB9JatHjRDO8OlDYW7WRND0PEZ/K15oT9j4f9tqF2Mg4Cl8kQEIufxNuS0eCkFBT0CkbAoItiVMT0R8U5UpSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734887174; c=relaxed/simple;
	bh=bi8yUclAAwD0wSw1yOprZdA5MUHc82j8ssHIifM5FAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NrTCGGnBwphtMQVcUUkdtWRDBOIwV5612SHvKkhPuS1kUokkgyrDbqHwzvsxrgyMV5n1vobPelup6tLQjB8DAJsuBX10UhyX9zzw+UxxN8T/La2QISkLy5zoUDbyWoSqAulPxrgYi3jCbpUmTZi647p6aza1qRrMami69scxXko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=DWnFnGVm; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="DWnFnGVm"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aab6fa3e20eso595082966b.2
        for <imx@lists.linux.dev>; Sun, 22 Dec 2024 09:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887172; x=1735491972; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmS2q4PEwUxAZm6SKuFHBNxLEZy5O27yTgc+4SIr6m4=;
        b=DWnFnGVmGmj6f7Hw2dNaHIOdkJnOHPbK0hrzeRBl5FcJInu1/MPViauoBgq9yBfypO
         38IkTnfGJDJxm2rcLrpGYsY4ZtXlNgt6AtK4Q3A2b+rpUZvREtz0yszLycPR54FiXsKh
         t8Ml0QNApClu6HOBAKGKBYJr8PkbUFPnwI1eI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887172; x=1735491972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OmS2q4PEwUxAZm6SKuFHBNxLEZy5O27yTgc+4SIr6m4=;
        b=s1PMEthYFJtoMfRpJ2XwCauG46NbKk5aFJ3nO3Qi7ptLnyNQDnNlFVLT4irBJkx9L0
         h3c3PXTGqE5I20jXnJdvTYLXiAcPef7Q6K0Ar5uBw+BPjcScyJInI7EpkNc6RXkDpctC
         SRc7OM1CaZiPscOfia0Jv4Jx+CfheA6n4QziLBrW2tuMufgWS5CnZ8mEwr3buAoQBPHp
         jGS8sjK8xyU4Scphe5lzSpj3VpYbuDdpFP61npWcchvBG5Lqo94K8yH+wEz7t15eG4n+
         BOdDHOElnqLZUqK0rKI2Mmr5vR6iMcgR8Tf0eBogMDCq4Ta1KoTIdl1B9swK0qHjHew9
         iFvg==
X-Forwarded-Encrypted: i=1; AJvYcCWu3rMbHQuaCchpHW7fEKvq1aBTuQ2zDnv16IDgoO4DWsHz3yHBd/SLkndZGLg0jH27muU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyq9o4dF6g8bNy56ZzqoBrfgbk7//dF/zpe21tJhRhBl+j0uA+g
	Nl7KHivzD0s+ZA3pXmQvEahRG88OsC0WzqEOhQOCUm3GcEf5CUOGx1v5TOXpzh0=
X-Gm-Gg: ASbGncu27lVEf2vIcTKwK9qIIRDrtJALvV7JEflDDFWGLnWCAfJe1WX3LlETswMqEP1
	aUy5nDIvnWV5dMLSgO9BsGD6F8SWr6WFP8oGWhPbexmXsFfJEkSfU5wdY5gJSboFnV/63UPw4v1
	6nfnCSOFBZoV/heuWYi0Y3ObGhUp/r+4XpsdYBdaxHtX15ZxcsDOaKj8lJX3YZ/Z2HcNVHJWkoY
	97m7OoyEg0hEv80fj84YaYjTnjHNkLh640AWOwal7CyjK1PIOAeLo5UgiVYwA60DdesC9YeBSXe
	r8h6h3CSxFMi390RaTw0SnDaqspVMgMpnz/N+SlBLJjWjg==
X-Google-Smtp-Source: AGHT+IHJzculVyLqVLiiOPR1XaEdHZ7jSwaVhPg8aOnJUgPmmOr2yhR4PsirVllXClh6H0aRUqSvpQ==
X-Received: by 2002:a17:907:9621:b0:aab:f8e8:53b9 with SMTP id a640c23a62f3a-aac345f427dmr975282166b.58.1734887171608;
        Sun, 22 Dec 2024 09:06:11 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:06:11 -0800 (PST)
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
Subject: [PATCH v6 18/18] clk: imx8mn: support spread spectrum clock generation
Date: Sun, 22 Dec 2024 18:04:33 +0100
Message-ID: <20241222170534.3621453-19-dario.binacchi@amarulasolutions.com>
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

Add support for spread spectrum clock generation for the audio, video,
and DRAM PLLs.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

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

 drivers/clk/imx/clk-imx8mn.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index 588cebce6c9d..c61368e724f7 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -306,6 +306,7 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	void __iomem *base;
+	struct imx_pll14xx_ssc ssc_conf;
 	int ret;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
@@ -338,9 +339,21 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MN_SYS_PLL3_REF_SEL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_SYS_PLL3_REF_SEL);
 
 	hws[IMX8MN_AUDIO_PLL1] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_AUDIO_PLL1);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll1", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_AUDIO_PLL1], &ssc_conf);
+
 	hws[IMX8MN_AUDIO_PLL2] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_AUDIO_PLL2);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll2", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_AUDIO_PLL2], &ssc_conf);
+
 	hws[IMX8MN_VIDEO_PLL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_VIDEO_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "video_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_VIDEO_PLL], &ssc_conf);
+
 	hws[IMX8MN_DRAM_PLL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_DRAM_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "dram_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_DRAM_PLL], &ssc_conf);
+
 	hws[IMX8MN_GPU_PLL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_GPU_PLL);
 	hws[IMX8MN_M7_ALT_PLL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_M7_ALT_PLL);
 	hws[IMX8MN_ARM_PLL] = imx8m_anatop_get_clk_hw(IMX8MN_ANATOP_ARM_PLL);
-- 
2.43.0

