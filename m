Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503C71A01B0
	for <imx@lists.linux.dev>; Sun, 29 Dec 2024 14:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735483866; cv=none; b=px34rvIoPHLBOvt/kd3cG+/5jCg0sRP0fsyXSysEyK4bxhq8SbxCbrNgLVeyIwd0P7VQF7DHgr+45HKjmjwTDDkLU6bPo7zLU3d1SmxLUOR/RAWsmrTC0tB3qrm9PQ5i5ccbAUYcKYnDErtxiKCVhwJbRx8L4AH7IZ9LY/4ADPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735483866; c=relaxed/simple;
	bh=wAM96yqCW+lsz81e2QPgNILmLnuIJ654UrL1361ydeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Erf+fi3s26M5d3GK1yaJyHMtOxLxTiYvCgVuMOh4Sb9x1SZowRAD9y7cURq3dhn5gA372q2vWE/SLR92MdhQbAy1kFV5VY6KdZa16L+63r7O4KPdIL4+bVtYJ6Ogc1m5FfK6Hznyk8//gjMfAJjAoJAVOVeXuIHloAncrfmHPv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=gbm83dSN; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="gbm83dSN"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa66e4d1d5aso1363804966b.2
        for <imx@lists.linux.dev>; Sun, 29 Dec 2024 06:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735483863; x=1736088663; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wKU7hDbBAEhh5ugFEv8c2E//GwNCMwODyh4qXAxbC4=;
        b=gbm83dSNG+OyHmUhQzrSkREGj//EWV1s9m9seSbFFfGDepQs/pkZZTcemPmZLaMO4B
         o5GUvaPzVh0GhCclwOgmhMZBcxQfQzNumO5SWEf89FEzD0rv0YzNLvQFZFBz/sFFPI5Z
         9hABuNdRJlWWjQ31NUzguT6rE2hhn/yr0qsz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735483863; x=1736088663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wKU7hDbBAEhh5ugFEv8c2E//GwNCMwODyh4qXAxbC4=;
        b=GLdehLPRWV7r/55BrtL6voga3/HQ0CIGHHCCkJkhl12maONSTR7u1ecCEIPegHEdxk
         j+b4WJ//8FogHpPYfAqtjx6C2n9BOl+6fPRszEDyi41xBepo/FIUR0i2NHQ3C6MP5J63
         3+bvY/7RlL7ANTUZM/mQKkJULJFEvaLZCRlEmACx+ul+SJeR7Y3OQy5wMsUId9qtMcXE
         GQ1fm2FC91osn3S2+JnhI4YN0PwwXWhMRGbVnGtPVEb6G0Y2y9SUfMsxiHbuynPGs5ps
         PpSU7LSri0ZovuJHp2pZFdGua8IDGSy3YPe2GCU6Cr2e7+Y9Zsqb+t+BV7DfZQ2nYSm+
         GrLw==
X-Forwarded-Encrypted: i=1; AJvYcCUA86QrfuBzI3tgZuDUO0G/mhDxO5y1YLwghBx89srjPSefCVtmW0magWNtmTeAACoU6gA=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywa1oIWowF8sQUXfnCnGW/Nh/SFP1n9wDMuKCOYBr37xriV1WI/
	315PvNGE2EsVsmhKmr3gvH+G2GoX9hYd7mHq0HM/H4WpWi083kbH02KDf2QWe3w=
X-Gm-Gg: ASbGncv7Pu5MO5qWFY7fuR0/51PD2HCaIVWiulgwGjKgPqaz/p42qwWqwC07L4rWUWJ
	pORSQy8ZSP/kMSgYzQ6HLdY57FyYRGOSkP2zyVBIocdsTqI8rXXoln85QVTmS2xa8aasaSlmJfJ
	Dg/B3cOx62OJsDfJOWSy+wEu5iuyFUldOaP0AG4ptx7b3oE78FmOB2BvqJt7lIy2hHLctkWAmTN
	zw2rsymJzF231FviFb6zYD5eVj3DYzV/WP2e0ZFqTghe67YC//8llZIN1XOURztraiKhC5HXDK2
	+W/Qldkym7XLMu2xcQKPEA==
X-Google-Smtp-Source: AGHT+IGuXfjaRQPAunk4u+eEYZZYA62lhB0xm8g69aCXAJE2Mnda7O4OIdrZd531BTzMeroRuU5qFw==
X-Received: by 2002:a17:907:2d2c:b0:aa6:8b38:52a3 with SMTP id a640c23a62f3a-aac33787557mr2382898066b.50.1735483861073;
        Sun, 29 Dec 2024 06:51:01 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895080sm1362084466b.47.2024.12.29.06.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 06:51:00 -0800 (PST)
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
Subject: [PATCH v8 18/18] clk: imx8mn: support spread spectrum clock generation
Date: Sun, 29 Dec 2024 15:49:42 +0100
Message-ID: <20241229145027.3984542-19-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
References: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
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

 drivers/clk/imx/clk-imx8mn.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/imx/clk-imx8mn.c b/drivers/clk/imx/clk-imx8mn.c
index c3a3d063d58e..090b5924fa01 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -306,6 +306,7 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node, *anp;
 	void __iomem *base;
+	struct imx_pll14xx_ssc ssc_conf;
 	int ret;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
@@ -344,9 +345,21 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	hws[IMX8MN_SYS_PLL3_REF_SEL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_SYS_PLL3_REF_SEL);
 
 	hws[IMX8MN_AUDIO_PLL1] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_AUDIO_PLL1);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll1", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_AUDIO_PLL1], &ssc_conf);
+
 	hws[IMX8MN_AUDIO_PLL2] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_AUDIO_PLL2);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "audio_pll2", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_AUDIO_PLL2], &ssc_conf);
+
 	hws[IMX8MN_VIDEO_PLL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_VIDEO_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "video_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_VIDEO_PLL], &ssc_conf);
+
 	hws[IMX8MN_DRAM_PLL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_DRAM_PLL);
+	if (!imx_clk_pll14xx_ssc_parse_dt(np, "dram_pll", &ssc_conf))
+		imx_clk_pll14xx_enable_ssc(hws[IMX8MN_DRAM_PLL], &ssc_conf);
+
 	hws[IMX8MN_GPU_PLL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_GPU_PLL);
 	hws[IMX8MN_M7_ALT_PLL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_M7_ALT_PLL);
 	hws[IMX8MN_ARM_PLL] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_ARM_PLL);
-- 
2.43.0

