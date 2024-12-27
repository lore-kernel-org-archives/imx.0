Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916EB1FA8FA
	for <imx@lists.linux.dev>; Fri, 27 Dec 2024 16:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735318685; cv=none; b=Fqf73WqLtqj3ZlaZPQKFFQPfUpFMCJYGx3aqsCX0i+sqVIbvXkjKgtDUN3GadS3UGEMG3iRCjXF7hy7ooi+TP17aBrVQDJHC4XyybXahgaocOKtMOCPxXKq/mfZXAaiwoAhHtrM20q0WTb19ClDnouV01Njukr22rCOeuCPViXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735318685; c=relaxed/simple;
	bh=WZLHxjjfAOfMCaEcJm9sBvWmLHmiNf40rsBp758aQrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HAxUGKlmuZLu16QcnKXrd1/s6f7p1I0eqNA5uCupxDzOK4tuIQnMcG9yaTwcLwzoSVbhft4wIxGS5X94/HwHRxMDPAWIlsy8lp4+6kU+N1kUQLl0enKAUjc6g3F18aaJi+ao3ZAI1D2BxrSXNn8312kosRqQhDQ83F4SFvwFgkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=rOB+op6T; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="rOB+op6T"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso586999666b.1
        for <imx@lists.linux.dev>; Fri, 27 Dec 2024 08:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735318682; x=1735923482; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9y65mSKckiOGkTEuAAogO736LDDvGviKkEok9cQB10=;
        b=rOB+op6TZ8xLPVMbrhtMBmxnD3cXOVVbQGcFqfURvyXfgbJqX+CDpoAlT9vtGMHwZU
         +mk4Z99oi0NpfO0Os2aBkXX3ZOwrBjCN72JKqx12k6Qd0SwldZOenF/vwfqHWg3yCMPd
         umA+9VD3j63kVRn/Uc10u5gKj0aTWbT5r2yuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735318682; x=1735923482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9y65mSKckiOGkTEuAAogO736LDDvGviKkEok9cQB10=;
        b=sW5wBf1Ty00Lh8jrJMgn361C9dsYT9uIwOmnZlSwtMa4cWv7cbX8u2BcLEMGQY3rkr
         DxMMuV32/rmZ4pbqrLAaCZIMbYNxAQnuHDFKFIVH341242+nG9vXqKHSUPxIGLMPROeE
         8664Y10p+I5rsEZHYu25zjsEZYEQ1alTWIg+DuzV2ARRM2xNdzp9A5GYC7hAcqc4Hzey
         OxjcXEX8Cz6fB7yzeM+hUgVQpCPRwuIaQeOQPMz+WR1+kRLCra8OZ0KW8e4qyDy4L5AJ
         t7yL7Rs7WIdqx8xPNhcGkkqV03nZvHAMhplhLk4gJCFZ55dK2LMQ8f89EhgQoMtwSZil
         a/8w==
X-Forwarded-Encrypted: i=1; AJvYcCUHdhK7UmqIlm7hgUeEa+JAqjESkLuvfIcj2ROCTMg5SE+9JVTiK710tImcQZMTS51c1M4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVFOMZ8pSI2l0ICfv7DFrrAw9sMOqrTgX6/6DKYWI2uV2xD8Ew
	/Iupwjitq1Ato26KL4mi6Q9KICvu8nLaEo6xNAViATK0wV+H82U987TUwB0fwiA=
X-Gm-Gg: ASbGncvcPvscTj13fbBPLMK/EZ2h/QXM6qdtWZMH7ye2vxYHK8P4lrgZDd/+EP4C/r6
	UtMgz8DGeq1naFV3+bpc0+Z+/ozPsbFC5IqgNOMhMVCAs1GSqR3+egwQsFNhMuPsgpuem7r+yo2
	5wv1jWNk5G+CyG9mm5xLWLn/Q6RjRbjCzDqz/qGp7QfeMs0PePo7QjwlzV8X2aRbqYb//EPcGan
	UXx0tGPile1zqxh/VIque6aD0Qn8t0ga065ah7REZGqaFa0jM0V/gNQc3Aa/wkdZ63OXy+CnOFD
	bNv8f4ipnZA0bBkon4F53w==
X-Google-Smtp-Source: AGHT+IF5jJPOX6kcBf6BRntab9qdhEP5H59U2Fi48sPndxAdgm1w2Y9ddhMbzuVLYYL1IC/eBjryeA==
X-Received: by 2002:a17:907:2d2c:b0:aa6:8a1b:8b78 with SMTP id a640c23a62f3a-aac271318f9mr2143573966b.6.1735318680458;
        Fri, 27 Dec 2024 08:58:00 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0159f1sm1130097266b.154.2024.12.27.08.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 08:58:00 -0800 (PST)
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
Subject: [PATCH v7 23/23] clk: imx8mn: support spread spectrum clock generation
Date: Fri, 27 Dec 2024 17:56:26 +0100
Message-ID: <20241227165719.3902388-24-dario.binacchi@amarulasolutions.com>
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

Add support for spread spectrum clock generation for the audio, video,
and DRAM PLLs.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

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
index 984331372139..9a04e8138b7d 100644
--- a/drivers/clk/imx/clk-imx8mn.c
+++ b/drivers/clk/imx/clk-imx8mn.c
@@ -306,6 +306,7 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node, *anp;
 	void __iomem *base;
+	struct imx_pll14xx_ssc ssc_conf;
 	int ret;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
@@ -347,9 +348,21 @@ static int imx8mn_clocks_probe(struct platform_device *pdev)
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

