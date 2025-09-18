Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DEB3191B2
	for <imx@lists.linux.dev>; Thu, 18 Sep 2025 15:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758210775; cv=none; b=OiGw18SW2DxnBhtAFN3KblILhNgHgj0crqchIxSm3o6/TpJ91zUlolKPpL9ND63Lm3RypjUcWKJpPHCxCmVzoAMx9hs2ZmXmM3gxVt4WIHJxNyiZKkkUccqmHgcFmi+Zshhu7aZEk1gx9246tgRI56ECQPSB1agsjAi+BOX+7Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758210775; c=relaxed/simple;
	bh=yv6FeFDp/A6lsGDbam0/SBW6Pnp8tVcvuRDKL2ma60Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IWV60SzTrwfZQUndykUNv3ci4MOtF2GjLSpHt72kWjsET+bW03ofH1EOLZ4StMWdq4v0tpvlgO8LbnXm377bmbc9+K2KZ4bz1sQ7AJ27gf2+2ZT/zd7KjAqfTcIXOr2W6Lk9C/OZBp/dWoirDHh48+Be6IpoJnuhqndQn2Iimak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=YEe5UK6Y; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="YEe5UK6Y"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b211ccfda1dso144033666b.3
        for <imx@lists.linux.dev>; Thu, 18 Sep 2025 08:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758210771; x=1758815571; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/20C6aqh7jqDUANzEy0rtZwUuYaJgtco0TQqT9aNmo=;
        b=YEe5UK6Y6fq3xYGZhAJ0BVIznTza3Y1pzMxeOq1PCrGVMq8Kbxg3PhFbE5NEQUvXqn
         0tNAgM2/Z0u9Q+oE+nPP+6ntdMD8EI61eXLzDV81w5S2PFEbMe3tpqdr89NdN6/u2/Io
         P8aN0YmzXGVh8ZRvVfdwrmSLeW3Qw3SO+IGPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210771; x=1758815571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/20C6aqh7jqDUANzEy0rtZwUuYaJgtco0TQqT9aNmo=;
        b=mJeA8qAev6YB6/svS5dYqi/z26SK3CXqVsgH+bT/4LdDfTYFAmMh30d9RAUaYYSTcc
         0mKzwitzd5euY5ATtQfKsM5lj+3HyBpiWhJk5uewo8KrL4ahHm3CF+S01nytozZ9NSG3
         BvOLtoaUIRB7ty5e5Xj+0NKSmhJNBTloToqwLZDL6d4YUo3u8bpae82XUzXdXAOPKjcL
         Ii3XvVQqCHqkQI0lCiLwABN38ZjymgxPGIewm1fc8jnM4vzfWpvmtdzIVLhNJqrO9HBI
         4p4NwynWYj+LEh7urNt0zCAStNYch3b2D9dSLwbtywl+UsMvasEDnc+QO9+nrRFWvMUE
         +PxA==
X-Forwarded-Encrypted: i=1; AJvYcCWoWvcgtttZ69NAEMP7SuEqIq/fziCH38Vj3izlZ6PkRGONE4kOznOFJGWvM2zDT6+mcOU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzpB32vd/0oskxG3svGi1KAI5D7dyqT/zeAQZ5PTxlJUpmQJkp
	Zp6HHsWeE3y0xuiAsIOsbw0LtutPJwun8bxDzBltEv2suc8+Li+fBmCG7d17cJNA90s=
X-Gm-Gg: ASbGncvAKMy+pdKEXsRWr0xqpZbxPg0gIvw0BRzxn4sVKTsRkScG8KjtEA4PM7XLhQD
	4L7QP3QKmoE9BbEFnj8ThPgrfECn63x/bYtAM901F9olgRZOoCMVnElN0BESe+mvgFmM9mL7t64
	xnRsw/yPQU5UzxHhkcbgcKCeT7YGFufmzx4WwXXAK0rXM+2iUUQrH7jcxssSYtyPzbAQ2z0CpI/
	yj1tom2/DxVCXviYA+hF6EdFSjodxzTTTMLMo1082mgrSCGIBV3V7yZ/I/iNWetmUpazDpJYWBO
	2Gg69K/H0/uUZCTmh8f4tY1Tqgq2iaLN9eUi9gYOktkWCSlw5yp2QY4vHzWTmQZR6ulGa4BRABX
	0KLGZxyXKsU/SzDnWRf7KVlA5Dw9w184Dbtjn+eHNhBitVdTOgW0NbFKuIMXt0VORBNwamNJ4Xc
	gr0lEtQdj9ATju7CVltyt5/hn4rjPpf7qODmeRby64Yt4L2xYx2w8W8b+MHD06S1XF+mrSYuWSd
	4kVfMKWCn4=
X-Google-Smtp-Source: AGHT+IHdHnn6wGZnvdSsol0igEGKm/m7Cc1hmskwoyS0/5RbE78pl/2ywFREK0jIWPVIywFZyPEDcQ==
X-Received: by 2002:a17:906:730e:b0:b07:de95:1c70 with SMTP id a640c23a62f3a-b1bc02f66d5mr759256666b.31.1758210771452;
        Thu, 18 Sep 2025 08:52:51 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b23a1227bacsm60449766b.41.2025.09.18.08.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 08:52:51 -0700 (PDT)
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
Subject: [PATCH v5 6/6] Input: imx6ul_tsc - set glitch threshold by DTS property
Date: Thu, 18 Sep 2025 17:52:34 +0200
Message-ID: <20250918155240.2536852-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
References: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Set the glitch threshold by DTS property and keep the existing default
behavior if the 'touchscreen-glitch-threshold-ns' is not present.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---

Changes in v5:
- I didn’t remove patches:
   - 2/6 Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros
   - 1/6 Input: imx6ul_tsc - fix typo in register name
  even though they were accepted, to avoid generating conflicts detected
  by the kernel test robot.
- Re-work the commit message
- Add Reviewed-by tag of Frank Li

Changes in v4:
- Adjust property description fsl,imx6ul-tsc.yaml following the
  suggestions of Conor Dooley and Frank Li.

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

