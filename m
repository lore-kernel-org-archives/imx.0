Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4C8322761
	for <imx@lists.linux.dev>; Wed, 10 Sep 2025 13:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757512768; cv=none; b=pllWzV/wIFWkQQOxv2nXckbkDl+jSd33CsrtyPZvRiwGuY9noJzeYetCYrj+2mv5gdTlRUNGh7FTNLbStZV9ZxBYz4jFHxhQAkMXRNwFKzFLzKeGGXSUXNdSlFYxjgXXRDNWfXSN1910TpMa2QKwbk5CvQn8efHWiT/FEKWqHeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757512768; c=relaxed/simple;
	bh=544owQth2eYHOtuZem85B7R//X9yXkusHL8qgRLe1MY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ahOH6sSd1MKgE7J9KPz5/+Grx6Iy8m/Z/xPSSdxQXJ15a4MLZDyCY6XT0XaySS8BAZJkrgfv4yF/C8YMzPDIQ8S9ocJSUZ8ZMePRUrPWgakfcTzZtPrw4JjA0iZxKUAYi9f0Yff9RGaTaD3FTohj/950YxBslaoBsP6bjKQZ08w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=FBF0JxxT; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="FBF0JxxT"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so1068495866b.3
        for <imx@lists.linux.dev>; Wed, 10 Sep 2025 06:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757512764; x=1758117564; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2oVD/JfoNNaDmsm+Xmi5oDSaNjfSX3YkjZgxJuhnDRo=;
        b=FBF0JxxTJW3wg3h5j0SdCPhTJxMLb8D5NHPGCzGuaS8LU/7bOrIjbtiAgbQ9SqA8up
         PSv5XnhNKRxJS+xjVuaZrgeKlApJAiSmQ/6MwyuW59HgY0zCrXiGprK+Eqk5V+ORXPA6
         /o60fRuxxLQULXyUrS0SJg8L6XtSx6bBCWIdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757512764; x=1758117564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2oVD/JfoNNaDmsm+Xmi5oDSaNjfSX3YkjZgxJuhnDRo=;
        b=TUS4xwymK0TydJ/cb0EfyOoUdAabFOyGxYG0ulZ1zDRv32dGRUoigNtFtdqXT8xxGO
         eOFEZGZAoHMDnYR+Byauz8f/uVFxSWiTPmwSXr4CB+LzR+nIU2Af/khzkL8NN85w0uq8
         9IjpnYvOMxywvDKCdLyZe8sKxfCxxGXC8+mI38rEab9slDAEvPR1aD7JHgxZy1UzV/qb
         rSp913Jdkbinv+bSClrGCobepzwJ/c586CY5/gkaqfuSwKGNNsMQ+PhNMdMJZKXtmO51
         oSgPewy+mE3fhKPa6K2KT9PBuGEyb5GTJsOux5D8HZsnJJOpoFc7YEg4Han4Qsyjj+jX
         jhJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf6ekuOW8xXR+b+7S1pQk36Imn+ewYkT3Pa8BMx0h7z1wBRqYRRL2XF/KeqhgM5kb0D90=@lists.linux.dev
X-Gm-Message-State: AOJu0YxX+15K7q9jI9q8WNcXubHyzlRj7cML8TBW840N8Nku3krSNwoZ
	d++mteth0getSO5KXkTzbDWFCLmigFoJA/V4EnagFo9GQhf5KKnyHwxR+qmis2j5NDY=
X-Gm-Gg: ASbGncvX0cbeOZvJrPYwmczIbHjj46pVXdz0inoiN9+3/HCEx5xgZMtid8QDtAoAxB9
	kRWaCOzVjt2I3+f1io+ccqYZWhykjHsFFJ+wXs4RDywfwrzh0cXwFRzB0Vmkkk/Kgy7Fi/Yx870
	VSj+QpkuXb4QdS+sBQQ9UoLiKAyljHzD2F8GofgnQlxaaF7v4G9+AJyzmFRd4oLTGZLDw6KdonR
	TCNz3UmmUuhP9ICvGO614KbNLrNllNgbtAL2rTeZk1uyOe3w/jKbYwUOwFebmCy5IpNyV33Mft9
	zKxVuGSPDz5G1tuc7f+KX6uc1EI3v+4EElifgOsgHZPNq/z6oOx6Zxtaq5w/ABf1/6ffVzHS5sX
	sjSAmJhdiAzQaZI9npfUyeYQ1hACtbAgbpK9v6Z0MTU854p1qxt4NscoypEfPglnAd3MeKRLEu+
	EEjbaRrNh/Yks/UPi6N+LHQ/Cp+azrND8Htm9nUtvdv7JQXHijMK5Pla4UehfnTgic
X-Google-Smtp-Source: AGHT+IEWhjZ2aPH1n4PeOlOpHvhF2m0dujZUWB3Bjg2NXbj0JvYYMpYB5dzB9+tg4YV0EPPwyT2uzg==
X-Received: by 2002:a17:907:3d16:b0:b04:59d5:fb78 with SMTP id a640c23a62f3a-b04b1702bbemr1507295166b.62.1757512764270;
        Wed, 10 Sep 2025 06:59:24 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07833a4e37sm172523066b.76.2025.09.10.06.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 06:59:23 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
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
Subject: [RESEND PATCH 4/4] Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros
Date: Wed, 10 Sep 2025 15:58:38 +0200
Message-ID: <20250910135916.3939502-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910135916.3939502-1-dario.binacchi@amarulasolutions.com>
References: <20250910135916.3939502-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace opencoded masking and shifting, with BIT(), GENMASK(),
FIELD_GET() and FIELD_PREP() macros.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/input/touchscreen/imx6ul_tsc.c | 88 ++++++++++++++------------
 1 file changed, 48 insertions(+), 40 deletions(-)

diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index a6066643bd48..e74999c5e22f 100644
--- a/drivers/input/touchscreen/imx6ul_tsc.c
+++ b/drivers/input/touchscreen/imx6ul_tsc.c
@@ -21,25 +21,23 @@
 #include <linux/log2.h>
 
 /* ADC configuration registers field define */
-#define ADC_AIEN		(0x1 << 7)
+#define ADC_AIEN		BIT(7)
+#define ADC_ADCH_MASK		GENMASK(4, 0)
 #define ADC_CONV_DISABLE	0x1F
-#define ADC_AVGE		(0x1 << 5)
-#define ADC_CAL			(0x1 << 7)
-#define ADC_CALF		0x2
-#define ADC_12BIT_MODE		(0x2 << 2)
-#define ADC_CONV_MODE_MASK	(0x3 << 2)
+#define ADC_AVGE		BIT(5)
+#define ADC_CAL			BIT(7)
+#define ADC_CALF		BIT(1)
+#define ADC_CONV_MODE_MASK	GENMASK(3, 2)
+#define ADC_12BIT_MODE		0x2
 #define ADC_IPG_CLK		0x00
-#define ADC_INPUT_CLK_MASK	0x3
-#define ADC_CLK_DIV_8		(0x03 << 5)
-#define ADC_CLK_DIV_MASK	(0x3 << 5)
-#define ADC_SHORT_SAMPLE_MODE	(0x0 << 4)
-#define ADC_SAMPLE_MODE_MASK	(0x1 << 4)
-#define ADC_HARDWARE_TRIGGER	(0x1 << 13)
-#define ADC_AVGS_SHIFT		14
-#define ADC_AVGS_MASK		(0x3 << 14)
+#define ADC_INPUT_CLK_MASK	GENMASK(1, 0)
+#define ADC_CLK_DIV_8		0x03
+#define ADC_CLK_DIV_MASK	GENMASK(6, 5)
+#define ADC_SAMPLE_MODE		BIT(4)
+#define ADC_HARDWARE_TRIGGER	BIT(13)
+#define ADC_AVGS_MASK		GENMASK(15, 14)
 #define SELECT_CHANNEL_4	0x04
 #define SELECT_CHANNEL_1	0x01
-#define DISABLE_CONVERSION_INT	(0x0 << 7)
 
 /* ADC registers */
 #define REG_ADC_HC0		0x00
@@ -66,20 +64,26 @@
 #define REG_TSC_DEBUG_MODE	0x70
 #define REG_TSC_DEBUG_MODE2	0x80
 
+/* TSC_MEASURE_VALUE register field define */
+#define X_VALUE_MASK		GENMASK(27, 16)
+#define Y_VALUE_MASK		GENMASK(11, 0)
+
 /* TSC configuration registers field define */
-#define DETECT_4_WIRE_MODE	(0x0 << 4)
-#define AUTO_MEASURE		0x1
-#define MEASURE_SIGNAL		0x1
-#define DETECT_SIGNAL		(0x1 << 4)
-#define VALID_SIGNAL		(0x1 << 8)
-#define MEASURE_INT_EN		0x1
-#define MEASURE_SIG_EN		0x1
-#define VALID_SIG_EN		(0x1 << 8)
+#define MEASURE_DELAY_TIME_MASK	GENMASK(31, 8)
+#define DETECT_5_WIRE_MODE	BIT(4)
+#define AUTO_MEASURE		BIT(0)
+#define MEASURE_SIGNAL		BIT(0)
+#define DETECT_SIGNAL		BIT(4)
+#define VALID_SIGNAL		BIT(8)
+#define MEASURE_INT_EN		BIT(0)
+#define MEASURE_SIG_EN		BIT(0)
+#define VALID_SIG_EN		BIT(8)
 #define DE_GLITCH_MASK		GENMASK(30, 29)
 #define DE_GLITCH_DEF		0x02
-#define START_SENSE		(0x1 << 12)
-#define TSC_DISABLE		(0x1 << 16)
+#define START_SENSE		BIT(12)
+#define TSC_DISABLE		BIT(16)
 #define DETECT_MODE		0x2
+#define STATE_MACHINE_MASK	GENMASK(22, 20)
 
 struct imx6ul_tsc {
 	struct device *dev;
@@ -115,19 +119,20 @@ static int imx6ul_adc_init(struct imx6ul_tsc *tsc)
 
 	adc_cfg = readl(tsc->adc_regs + REG_ADC_CFG);
 	adc_cfg &= ~(ADC_CONV_MODE_MASK | ADC_INPUT_CLK_MASK);
-	adc_cfg |= ADC_12BIT_MODE | ADC_IPG_CLK;
-	adc_cfg &= ~(ADC_CLK_DIV_MASK | ADC_SAMPLE_MODE_MASK);
-	adc_cfg |= ADC_CLK_DIV_8 | ADC_SHORT_SAMPLE_MODE;
+	adc_cfg |= FIELD_PREP(ADC_CONV_MODE_MASK, ADC_12BIT_MODE) |
+		FIELD_PREP(ADC_INPUT_CLK_MASK, ADC_IPG_CLK);
+	adc_cfg &= ~(ADC_CLK_DIV_MASK | ADC_SAMPLE_MODE);
+	adc_cfg |= FIELD_PREP(ADC_CLK_DIV_MASK, ADC_CLK_DIV_8);
 	if (tsc->average_enable) {
 		adc_cfg &= ~ADC_AVGS_MASK;
-		adc_cfg |= (tsc->average_select) << ADC_AVGS_SHIFT;
+		adc_cfg |= FIELD_PREP(ADC_AVGS_MASK, tsc->average_select);
 	}
 	adc_cfg &= ~ADC_HARDWARE_TRIGGER;
 	writel(adc_cfg, tsc->adc_regs + REG_ADC_CFG);
 
 	/* enable calibration interrupt */
 	adc_hc |= ADC_AIEN;
-	adc_hc |= ADC_CONV_DISABLE;
+	adc_hc |= FIELD_PREP(ADC_ADCH_MASK, ADC_CONV_DISABLE);
 	writel(adc_hc, tsc->adc_regs + REG_ADC_HC0);
 
 	/* start ADC calibration */
@@ -167,19 +172,21 @@ static void imx6ul_tsc_channel_config(struct imx6ul_tsc *tsc)
 {
 	u32 adc_hc0, adc_hc1, adc_hc2, adc_hc3, adc_hc4;
 
-	adc_hc0 = DISABLE_CONVERSION_INT;
+	adc_hc0 = FIELD_PREP(ADC_AIEN, 0);
 	writel(adc_hc0, tsc->adc_regs + REG_ADC_HC0);
 
-	adc_hc1 = DISABLE_CONVERSION_INT | SELECT_CHANNEL_4;
+	adc_hc1 = FIELD_PREP(ADC_AIEN, 0) |
+		FIELD_PREP(ADC_ADCH_MASK, SELECT_CHANNEL_4);
 	writel(adc_hc1, tsc->adc_regs + REG_ADC_HC1);
 
-	adc_hc2 = DISABLE_CONVERSION_INT;
+	adc_hc2 = FIELD_PREP(ADC_AIEN, 0);
 	writel(adc_hc2, tsc->adc_regs + REG_ADC_HC2);
 
-	adc_hc3 = DISABLE_CONVERSION_INT | SELECT_CHANNEL_1;
+	adc_hc3 = FIELD_PREP(ADC_AIEN, 0) |
+		FIELD_PREP(ADC_ADCH_MASK, SELECT_CHANNEL_1);
 	writel(adc_hc3, tsc->adc_regs + REG_ADC_HC3);
 
-	adc_hc4 = DISABLE_CONVERSION_INT;
+	adc_hc4 = FIELD_PREP(ADC_AIEN, 0);
 	writel(adc_hc4, tsc->adc_regs + REG_ADC_HC4);
 }
 
@@ -194,8 +201,9 @@ static void imx6ul_tsc_set(struct imx6ul_tsc *tsc)
 	u32 debug_mode2;
 	u32 start;
 
-	basic_setting |= tsc->measure_delay_time << 8;
-	basic_setting |= DETECT_4_WIRE_MODE | AUTO_MEASURE;
+	basic_setting |= FIELD_PREP(MEASURE_DELAY_TIME_MASK,
+				    tsc->measure_delay_time);
+	basic_setting |= AUTO_MEASURE;
 	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETTING);
 
 	debug_mode2 = FIELD_PREP(DE_GLITCH_MASK, tsc->de_glitch);
@@ -255,7 +263,7 @@ static bool tsc_wait_detect_mode(struct imx6ul_tsc *tsc)
 
 		usleep_range(200, 400);
 		debug_mode2 = readl(tsc->tsc_regs + REG_TSC_DEBUG_MODE2);
-		state_machine = (debug_mode2 >> 20) & 0x7;
+		state_machine = FIELD_GET(STATE_MACHINE_MASK, debug_mode2);
 	} while (state_machine != DETECT_MODE);
 
 	usleep_range(200, 400);
@@ -283,8 +291,8 @@ static irqreturn_t tsc_irq_fn(int irq, void *dev_id)
 
 	if (status & MEASURE_SIGNAL) {
 		value = readl(tsc->tsc_regs + REG_TSC_MEASURE_VALUE);
-		x = (value >> 16) & 0x0fff;
-		y = value & 0x0fff;
+		x = FIELD_GET(X_VALUE_MASK, value);
+		y = FIELD_GET(Y_VALUE_MASK, value);
 
 		/*
 		 * In detect mode, we can get the xnur gpio value,
-- 
2.43.0

