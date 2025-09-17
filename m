Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231123093BD
	for <imx@lists.linux.dev>; Wed, 17 Sep 2025 08:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758096349; cv=none; b=jOEO5XkaKjNt0EZRGuahlwsfkZDKBxNXb+83JIkXIksmSxSHJS/PK8XDrzLhn4E4UVcSGW/JN/LNhUSnXS/iRtZE2WZk0c7xr6h+LHQZIKpUxRZwf3Nr2cr7+wKNlhKYrKMdCQYpohTuDHSi/0c/kgbUprHEj7qp29hp2Zc7YJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758096349; c=relaxed/simple;
	bh=wAZaEZozJlMdBdZEd/EmVdgizyzZlx0rNEkj13bbzo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DPrZ9FA4PO7zbl3g9zqBpdj7szxKyYMt19R3D8vhGmkYlnEl3OM3XAgAkatReVX0AOCh0vHUG8NxxFNMVY/62heUyMvcynpSc4l6x4Widev9d3iJnHoR4NgPSE7fnIRxh+s7eFnWMrVqwijX5OfyVsfLcb7O6Yu2eBj+j8gI3Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=LAKtOtlj; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="LAKtOtlj"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b046f6fb230so134416666b.1
        for <imx@lists.linux.dev>; Wed, 17 Sep 2025 01:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758096346; x=1758701146; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/q3PAqpa8JFRI5D9goTpJtfgHgbqQ+Qd/SJYCaxuYg=;
        b=LAKtOtljP5jK2MAenkMcVn3ZedEU6C8hCpPAZciXlfOWvi6wHwfWMi8KXG6NbaWyC8
         NUHm3DsvlfJNJhL3zLe1lgHYCxCImImBDMhsODuu4Rzv+KT5oDUijZDYikrCL2PlkdRr
         qLNQXflbBq7HZCgXC5slPJsJnt0i9EWgR9eM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758096346; x=1758701146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/q3PAqpa8JFRI5D9goTpJtfgHgbqQ+Qd/SJYCaxuYg=;
        b=YGGWjqgbb93kXItpi1eyldnDg6ITCnBViQyq6aWL2OqtXJyDVsVHUMKoGgYkfkBG7u
         SKIAE/OARkRIm5nYgeWEG1SUmlbayBC/zt6u9x1kbz692kEvIfJyxLOVTHLumDowwd5V
         +RZGPjf63wVK5WvLGDGIh6zVeSantoAxhRV5RLDJwNQOJ/IEFsDgc/28yItMg8n/zEf8
         d2rGQwOQo0kXjyrHPtf1xcxTlogGjKFH2GBIc5yos1oin5UR8vbSjQJ7V1fOcWb5/oLZ
         hSuch0PRrMQc7kx3L90p/2hy8KOXxHhWHMsrd03LR8DV0oyXpH78jJeenBBYf6kJJGbv
         orGg==
X-Forwarded-Encrypted: i=1; AJvYcCUzg8nNtBWcUU1TXfjYgRbE1wjhEsUW1RgkQb9wejxvz054ecHbInz61I2Fzhj8AkqsL7k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4yWwyG7UQcMQEMDgzoB8k36Byt/bpY3Bk+tuPXEwnDGP/J9UK
	XB9axOOfeoAg1fOlJ7MFjxOeZnIBuea85E8H+kwhimOTALqSs8xBAlhHyFoLq+NPcNw=
X-Gm-Gg: ASbGncu5uvAMBLty4ynrjVvEh9zFaxZLeS9kHEK/gA6syod7Ses73G6UXl455SbyWt4
	M0jZhhoP1TB6gtqSri8lb4wHXizntVyMmyfDGiC9p/EG0WfsYKMhqaCwVDLXYGmkmvueYqRWoNW
	hEY7BUYxzH/hviV85CCwTVCcHLDlypUM/Yns3Bp3QKE9dtGY2ug7nde4vJbxGs/f+N6uF4b89Du
	Niqhlp4vu8Aykf41HqK7psvABP83UV4A9TWNpJyWLjYG7+ULYhAZvk9jBg3KjcR/dPOiF4WgE5D
	RaYUZcO6y8W1vwHVR1aWYTETqIJGZ5Y7Azj834zSzYNpu3TIa3mJelSjSgXDIieUBCgxSD39/h2
	5QzuNoAwgv96vXb3UpaJeh9Ebw5nQrPVH874QAa6OElgfS9uqt8oLXFkT385HvXThTY24eQ==
X-Google-Smtp-Source: AGHT+IFI+EUW9a0B9XdUO1VlBQi6AjaLzsT/+VpJZU5LQRGIlw+U+tPUlEHvyjyZdrFs1s7rII991Q==
X-Received: by 2002:a17:906:c14c:b0:b07:c383:8104 with SMTP id a640c23a62f3a-b167ea6334emr662752366b.13.1758096346480;
        Wed, 17 Sep 2025 01:05:46 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:1215:4a13:8ee5:da2a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07e1aed5ffsm924936766b.81.2025.09.17.01.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 01:05:46 -0700 (PDT)
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
Subject: [PATCH v4 6/6] Input: imx6ul_tsc - set glitch threshold by DTS property
Date: Wed, 17 Sep 2025 10:05:11 +0200
Message-ID: <20250917080534.1772202-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
References: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
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

