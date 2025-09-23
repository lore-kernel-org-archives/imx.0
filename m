Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAB0269811
	for <imx@lists.linux.dev>; Tue, 23 Sep 2025 14:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638283; cv=none; b=Pw+CCpJkgcbJVuVhzPAYPLjuLpvzVdxXgk/ggY3O38fmGWcV0KuAx8jmxGUNdaH6wwoq2tEfNVx+2fUaMRmbzMGbWN0gRBReRdmu+RONEg04Is5Rx7pqWe6PfATH7eoCsKoyeOclLVah69AuTyrioiGI7TFtBz8teafYbhv3oOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638283; c=relaxed/simple;
	bh=cVdvKFAidRA798hHdWHXhbSX4GS5WDwzy360IlmoSTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QsbiYiYb2FdkyZmPASESVXbM38lDopRxKCwJnsDHNI2DFYmja2B2mmJc9Q2g60VJP4uumKMmF92KPnQr/1EQYcEiE5R1WtPTwZELQtMIdp+4CZqh6ubaDWocvLwMBieqPt4EODCbk6z6JYDOLMloKtlmoOSYSW7B/yzcbyHOvA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ivxHaqL5; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ivxHaqL5"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61feb87fe26so7297813a12.1
        for <imx@lists.linux.dev>; Tue, 23 Sep 2025 07:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758638278; x=1759243078; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1NZM4v8G7kVFRobZkkcSJXgVxob1GWmO5LhOiwNAgs=;
        b=ivxHaqL5TW4CBs8WkPUfh3jcY6WVRL3Ja7e8aw0UNTeO/pYlh03Vd7W9eWtbz8iFuv
         tb7RaeXKehD6lWqDzTfuYGIxRV73wyzZ3QsIXMfO1HT5+enyC3G/oJ9AOXwpyO+jKU20
         PbbI87m9dMq3iX0IF6aetGG6CbV+13knNIsNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638278; x=1759243078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1NZM4v8G7kVFRobZkkcSJXgVxob1GWmO5LhOiwNAgs=;
        b=YCmPEEOXVP0cV9GKm4JpjH0w+saQlAy5OBuHcrsC+VXGFzQ4K7kEncxbJ50BwtipUi
         i6wE+Obms33F/pN8uODRPKWhXHjPCK5FNUuc/eEEp+Ax9QiFyRgPC4eLetKr9AFyGBwJ
         j2zLKSakMhbF1/ro5WPSwRQ8VU0b7CUM1DNCSF7V1iRwZOpV5QwqMD7/HWHA+gOILhdt
         kwv2wKCyG4pbwVTJ6McO+q5CxaC6lNZK63h784VCTmrAzMwWgMOnCCU1c4wu21l+e/N0
         gukV21J1WIqCab704uPSi2zWvtE4su8VcFi1bdEy31v3pLtc9vahE+czS+zgFvvMPK2n
         3uLA==
X-Forwarded-Encrypted: i=1; AJvYcCWCpCT+ZuX9ng1cYuv30Ntdw5CXNgaSC2Qi9+Gdt6v5cX/n4BxuyhsiyIrpv98iCsDlLrM=@lists.linux.dev
X-Gm-Message-State: AOJu0YysoeXhTXZNbclVhDOjLYGJDBPW8oCV/9A6UPz6IYduKVCXVdhx
	/Dy41qs9BLtf6f/+GP9MUyYEZQz9gc8aekYuqxNwOBhc6ZD5Gw/zaRFYQpo1/3n0U8M=
X-Gm-Gg: ASbGnct4CitNRJPhsnMVPdcAqhZ2S1+VbNCzPSzkFzqHkdIVl29F70jKxcjK6RIbAup
	LrLQ4u1oiXsE75U4p7PbqHXp2hDEvnPG3ctQaoKBiDcwBLLVleStEx33hiTqqea5MVD2yFuMm+w
	jENpCc+P74JDwX4eF0JWZETEsbPljpKPqouvNyZsJdjbapKXnC1cwpMGVDE+Pfojv8oA5jS/+x5
	j4v+xOG678HWcXek/MYNXtVbabTREB7AkUb7QRaFMjl1rX6dyzUg9FOXJnvat3uErNLwaSIO/Yr
	QlV86tlqyXAaCUP4ZndZ+Hcy+8HuIl8/NuatOjAb5+o0HI7NjWznm8/RV+GUknZPnANlkatbKI/
	zOR0rXizW7Se4+ecwVAC0HrHV4lciN6wPPWksE7Wi/Q+Ma0CES8U6/lHQAmspNeznTb8ve5h1hN
	AE4ShWXdrPfkM7qbz4d9DFdwRwDkMCbKqJcSN9eRnaz3meDzxMRco6LxEHyPKbxvlj
X-Google-Smtp-Source: AGHT+IEUmE6xkdZeJdkLL9TsBhYJubk/EzndUqe5eNZwoBqgNfIIOlpziTlRhmGHtKqRgY6aB2HfsQ==
X-Received: by 2002:a17:907:7b91:b0:b2c:3967:eb71 with SMTP id a640c23a62f3a-b30268949e6mr298598066b.3.1758638278355;
        Tue, 23 Sep 2025 07:37:58 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2a2a5f6c7asm665204666b.28.2025.09.23.07.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:37:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v6 6/6] Input: imx6ul_tsc - set glitch threshold by DTS property
Date: Tue, 23 Sep 2025 16:37:37 +0200
Message-ID: <20250923143746.2857292-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
References: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Set the glitch threshold by DTS property and keep the existing default
behavior if the 'debounce-delay-us' is not present.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---

Changes in v6:
- Rename the deglitch property from touchscreen-glitch-threshold-ns to
  debounce-delay-us.
- Read the DTS debounce-delay-us instead of touchscreen-glitch-threshold-ns.
- Udpate the cycles calculation.

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

 drivers/input/touchscreen/imx6ul_tsc.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index e2c59cc7c82c..85f697de2b7e 100644
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
@@ -513,6 +515,25 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	err = of_property_read_u32(np, "debounce-delay-us", &de_glitch);
+	if (err) {
+		tsc->de_glitch = DE_GLITCH_DEF;
+	} else {
+		u64 cycles;
+		unsigned long rate = clk_get_rate(tsc->tsc_clk);
+
+		cycles = DIV64_U64_ROUND_UP((u64)de_glitch * rate, USEC_PER_SEC);
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

