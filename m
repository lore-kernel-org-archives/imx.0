Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DE92DF158
	for <imx@lists.linux.dev>; Sun, 14 Sep 2025 17:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757870187; cv=none; b=JY1T4v2igLDWibus0EyOoByShAWdO1KtGwXrvfS27pkDQVerpsooE5eREvlnvRW1FMqAavYsNcfHJmpH4DhyFVhbQ2A9CT3NCa3icFwZ+gFONLnrTmdghjZ1lBlWVbasdFMzT7mPZqIAVPxHrGNgpVV/Qfiz/7jLNe8OiPYTFeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757870187; c=relaxed/simple;
	bh=OV+qmjeU3NDC/Cst8F7wHNfjJbgMYyX+vlId2SAEZuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FOQ5TYtihtQZ7sDm23QAFfPltuRwr9g804mwG3gXS+ZuF9Ey11wG04ZyvLW6svsTX4AcNkcKNJxzKbHKx/SkrdMzABYrhUFo7oBvWGUmn/1R8qDayczLdbPqnJUaDYkDxMT/irFKBSkwnbdRTC3EQZknErPMrzLd0hd5ZilRuSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=RTJ9kGaG; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="RTJ9kGaG"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b0aaa7ea90fso140428966b.1
        for <imx@lists.linux.dev>; Sun, 14 Sep 2025 10:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757870184; x=1758474984; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VeIUZQnFQ6a6zAGoQDZv+bvlaQadCTCZH0QLhkeT9NE=;
        b=RTJ9kGaGOzuBOb7oMna3x4f2Ib2MUlAdPSXxyxI8J7o3aUUIXqO6S2iy9JGBiPuYg4
         U7ahpl/45B0WjqtO/MfFDVeogiD1nV0saGYE9KND46X4JSghd3VMCvCW1MJKOfPBoD2i
         F6VQLaQN+4sLYPCkQsJkEV1FvvTzb2fHJxGRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757870184; x=1758474984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VeIUZQnFQ6a6zAGoQDZv+bvlaQadCTCZH0QLhkeT9NE=;
        b=OYdu9LkxOq7FtBYb7Y0PI1iXN7MfV2LaaqWoygc3MTH1XAluI8EuPPEDS9sfk2JuJz
         dZXCOGh0LxYLeWsPHQKu9LNxjn9RMAhyuR/XuYN2JdiZotKfCZcS5qm9BVzgyZYvMFS7
         1pU5+s2gtL5Nq33wohr5oUOPE572pAstTILCQrIRhGJuKchwOokg+LTAnxVs8pgjxEEN
         FU8gi1X2O9ncUEOPN0ANPp8CXE6nhT6GBIGfBjI3Z6Xfpuomw70+D3wiJk2Q7FzUNj7b
         MaujkModnDBR7tlfexZgAiOEsZDVMQZ+s7qCx2IiBD94oLo+/Vq6lEdU+0KP0PMRE+uS
         rkUA==
X-Forwarded-Encrypted: i=1; AJvYcCXdobd2bWaFSGz0I0whaFVFm1IvP3zHFnQ3DETlrn8QM5M1v8+164f7pLng6U7dhFDj4fg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkcBsVDZkwv4bSC5tO0GSa1S+BsLozTE5hZvNliX2XLC+9wwGT
	N2ndt3diikYjkMnVSKvgmHFxF4LagFUJuCPhNVuzo/mbtrEMmI9Vrx+i2ELjw1njgTM=
X-Gm-Gg: ASbGncu74RGtDE1EHzPNZ3SdPYNLVntNhMhrBzuwcJ5vlEgiO6ufE2YF0JRKXWSxJ8X
	7Tu53s1jQEQovme6sIeY26PhBEvkNu0gUFZccS1hKTWrXYPV3peJplb92cx4C5ju/bhuF7GQXZt
	KTCym44c2e9RBLJTa0w1D/1L/VgEqY2W2KBVXHzwYvbCh/wJXolszyi68Ek7fkvxjpJk/icC3O2
	rDmPwzidFzGSM96L9FcWwMgpBLNvGrM42Z/XX42mNCamgiV9OJ+gxYldv/roYsL+Xst3W2OPDdA
	fBbRDu6rtumFumuoxkhOUgBNcskJr+fA0WW/AUTHSJ7s5sIfOLgU6p2T2HseNtNN6GfcHhc7+BO
	XsE+LVPlglpIdtBQ9BcW6qJRnfV0+7m53iSDNlIU3frhkZEPlbaYSMklWxS/Kx98hTx/SiHS/mB
	TFTrzVqZMFbQ4UtORaVOXaMtrmEqfWa1tp7gkmhTRDldYZBK+kS+bAXXupwQD8O7oe
X-Google-Smtp-Source: AGHT+IETORtFdx7V7/ajkoRQBW7LbAmBCbFNX2/FEUSZSUzDQGbJV03GOggXdksYhxvqH+4PusvMbA==
X-Received: by 2002:a17:907:78b:b0:b10:aab8:3816 with SMTP id a640c23a62f3a-b10aab8432amr71331666b.32.1757870184256;
        Sun, 14 Sep 2025 10:16:24 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b334e76dsm776980466b.102.2025.09.14.10.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 10:16:23 -0700 (PDT)
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
Subject: [PATCH v2 6/6] Input: imx6ul_tsc - set glitch threshold by DTS property
Date: Sun, 14 Sep 2025 19:16:03 +0200
Message-ID: <20250914171608.1050401-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
References: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
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

