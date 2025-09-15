Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475CA296BAB
	for <imx@lists.linux.dev>; Mon, 15 Sep 2025 19:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757966043; cv=none; b=g/vsQvFvqPJLVW9TVlgclpGxLJk1x1GKR3cv3a6IUe/3BWCqFc97XyM4RhommUonkxmp36TsOwtrxsERPnyg51z+9bznVZxXPKBsrGSGXA5Oj2VCiWpm3GVDUAVDDwX25jbTVX27CtH9+MOPeT34y8uOoNhI07Lfuhh/unEH3IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757966043; c=relaxed/simple;
	bh=PWtJQS5FRtbC8eI744kro5v4M7mGct2HyyMhtJCrfWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qISKSRbtTpjHIcoFtiBu/178kev7xrzRKMWENkznQdWl9ulQWuRzxO2wdsGL4SS4T2K84rPGAjlNb+5sj1VUkGcP/1Fgn45SCT15dqn4oepcS7khTaB5GTDWLFQsZI+iQkjZYw6SaNAq+S1Bj2AXvlEr8WdeYxpXxqr7wLVc+D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=r3r9pmEG; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="r3r9pmEG"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45df0cde41bso35025405e9.3
        for <imx@lists.linux.dev>; Mon, 15 Sep 2025 12:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757966040; x=1758570840; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqadXdSW1D0YdX9y/VYCHcP9OLLjsnrvbDdXfqIeuyU=;
        b=r3r9pmEGw/RLUqvBRhfGFDWGy1s1Ymm3D7zDJE8RIzmrsKrdY1klDquBAc/RetdZZ/
         zn02xvNqPkgBVz4KDvZaX28OSGdxFhs++6vq3xji1MApykdBDUAxOWdStr2LcLlcIf5E
         uwNvu4Gpm9z/LPJtOPqiBhVh5Y5w/5CHVx7U4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757966040; x=1758570840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GqadXdSW1D0YdX9y/VYCHcP9OLLjsnrvbDdXfqIeuyU=;
        b=HL75LbdIaUQF3f5DKJNWoj+PJu0F+xbjDg5HS7oxMBXpU6grjF1ZudwJO7nlmPpenG
         w95KN5G5OGPHJoaorOCCoO41+ym2ww8cBUjKeSmghAi+RHhCdcrfvTRAZ/G89JV+7Z6P
         SJEndpKhDfo0mGIr1nfvkODNpFC5CKzQlOxbNkbyqCUG+Z2Q2klkQsKHxUHajZ7ZYObX
         144vItDgfL+fcvFvnec1fK8x9MvNnjCDCDmYQ7qCI/J+w+q4zhl8zwxskSATx6KwxwMg
         Q7ypOjWL//woYfpbc2kwkNOstjC7zm4K5p9MGJVXVJNNvoVakIEa4+pBENi96ATTqWva
         qrxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXp9NnAf0TN9SA3lYasmL7IW69W+xSMx61UKJdm4VNU+5JsbZmp+j/zajFnOKcAVX8PqVc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ1RItdMpQ7OK6P0kNe8CKsViPhVmR/dYZxE1krM/vespSeBAy
	rOkn3Y96hDZ6xy7BEIbUMIMiT0NerQ1LF8AKfFxqKqG+Il7MmMjTmFXvPXdEEO5qejQ=
X-Gm-Gg: ASbGncsLtg0d7OkOOTUnfl7gWHVxLrmMJiXPxa6BuP63N+h38adDfdwbvk5mK8wgeJH
	rPJpkUrauYGmyjA7OkVgjwSt8vryZeisemYayM6siyDIIu3ULA7pR68rCgKO03Vh9nbUUZG0Gqq
	4qOZbJANdpGOEKB9Bt2vE2JrcesSKDrHL1Yg9oLNSUO88S5oXl5b4YsyoiHhdh7chSGWh/DL/x4
	8LcmTezhQVLUx1p8659lhQ7iTHSuuDP0ek7vO/thwFimjttmaOIVIaahgirT9HCqp/vwEsNdA7s
	gyRjuqUyO3g4CXs9zvMJ90F5sQq5356yY0CM47hksXvqIMz8Q+4dXA+JUzQIpRKm6zWLPsP9f/I
	JLZs1IRjVBiFR4UNuaSgJ+fIgG2Tu/GG6jQDMIQQDP3k1q8ceIluMNxwxFnjiz6I=
X-Google-Smtp-Source: AGHT+IFX174NiBczGaK/x3CIfQpHj6Pi6AzSfzk1fSmasGkNMFC1MAnI/pPMBLk/mLUpvLPRyiHwCA==
X-Received: by 2002:a05:600c:4453:b0:459:dde3:1a55 with SMTP id 5b1f17b1804b1-45f211f2fbemr160469475e9.24.1757966039580;
        Mon, 15 Sep 2025 12:53:59 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f32640f49sm530985e9.9.2025.09.15.12.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 12:53:59 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v3 6/6] Input: imx6ul_tsc - set glitch threshold by DTS property
Date: Mon, 15 Sep 2025 21:53:08 +0200
Message-ID: <20250915195335.1710780-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
References: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set the glitch threshold previously hardcoded in the driver. The change
is backward compatible.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Remove the final part of the description that refers to
  implementation details in fsl,imx6ul-tsc.yaml.

Changes in v2:
- Replace patch ("dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add
  fsl,glitch-threshold") with ("dt-bindings: touchscreen: add
  touchscreen-glitch-threshold-ns property"), making the previous property
  general by moving it to touchscreen.yaml.
- Rework "Input: imx6ul_tsc - set glitch threshold by DTS property" patch
  to match changes made to the DTS property.
- Move "Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros"
  patch right after the patch fixing the typo.
- Rework to match changes made to the DTS property.

 drivers/input/touchscreen/imx6ul_tsc.c | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index e2c59cc7c82c..0d753aa05fbf 100644
--- a/drivers/input/touchscreen/imx6ul_tsc.c
+++ b/drivers/input/touchscreen/imx6ul_tsc.c
@@ -79,7 +79,7 @@
 #define MEASURE_SIG_EN		BIT(0)
 #define VALID_SIG_EN		BIT(8)
 #define DE_GLITCH_MASK		GENMASK(30, 29)
-#define DE_GLITCH_2		0x02
+#define DE_GLITCH_DEF		0x02
 #define START_SENSE		BIT(12)
 #define TSC_DISABLE		BIT(16)
 #define DETECT_MODE		0x2
@@ -98,6 +98,7 @@ struct imx6ul_tsc {
 	u32 pre_charge_time;
 	bool average_enable;
 	u32 average_select;
+	u32 de_glitch;
 
 	struct completion completion;
 };
@@ -205,7 +206,7 @@ static void imx6ul_tsc_set(struct imx6ul_tsc *tsc)
 	basic_setting |= AUTO_MEASURE;
 	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETTING);
 
-	debug_mode2 = FIELD_PREP(DE_GLITCH_MASK, DE_GLITCH_2);
+	debug_mode2 = FIELD_PREP(DE_GLITCH_MASK, tsc->de_glitch);
 	writel(debug_mode2, tsc->tsc_regs + REG_TSC_DEBUG_MODE2);
 
 	writel(tsc->pre_charge_time, tsc->tsc_regs + REG_TSC_PRE_CHARGE_TIME);
@@ -391,6 +392,7 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 	int tsc_irq;
 	int adc_irq;
 	u32 average_samples;
+	u32 de_glitch;
 
 	tsc = devm_kzalloc(&pdev->dev, sizeof(*tsc), GFP_KERNEL);
 	if (!tsc)
@@ -513,6 +515,26 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	err = of_property_read_u32(np, "touchscreen-glitch-threshold-ns",
+				   &de_glitch);
+	if (err) {
+		tsc->de_glitch = DE_GLITCH_DEF;
+	} else {
+		u64 cycles;
+		unsigned long rate = clk_get_rate(tsc->tsc_clk);
+
+		cycles = DIV64_U64_ROUND_UP((u64)de_glitch * rate, NSEC_PER_SEC);
+
+		if (cycles <= 0x3ff)
+			tsc->de_glitch = 3;
+		else if (cycles <= 0x7ff)
+			tsc->de_glitch = 2;
+		else if (cycles <= 0xfff)
+			tsc->de_glitch = 1;
+		else
+			tsc->de_glitch = 0;
+	}
+
 	err = input_register_device(tsc->input);
 	if (err) {
 		dev_err(&pdev->dev,
-- 
2.43.0

