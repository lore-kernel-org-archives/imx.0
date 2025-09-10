Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA97D322550
	for <imx@lists.linux.dev>; Wed, 10 Sep 2025 13:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757512766; cv=none; b=LacK19W7YLgDM/adDJ0BV5/UWnlx8hV37Z+QFzjvZarX3opJxbYDtHiuTzPutRmjNGidOBwFHv6i885EvGKLZ2nmI43CR2NBu844gACX2tg7Q+HNHH/tOkjQhRZiXBvLb5f7eGYqZgb5/2ShDm9xyZz9OULP5crJXq9VBwQLOUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757512766; c=relaxed/simple;
	bh=mAnzVAui+Zh2pgPs+xFJHjOfsAlD+iZi1XelY8rp6FQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=csFwmQDGy13tU6eYlSd06TThJE87dhh8OalHB0JrK42th0tyOGMCbqXbuALMht0dYFYpF+Z42QJmCb5OCErX9T7F/tYcKhbGJOeMDPkHdb31iE37gIYjF07vGwKM78t1AtnUJ0t87OZlUq9QQBRd+vZVw9uj+COO5t9PflUYFTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=eYNBPCRI; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="eYNBPCRI"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b0449b1b56eso1005320166b.1
        for <imx@lists.linux.dev>; Wed, 10 Sep 2025 06:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757512763; x=1758117563; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0R5rRW0Dwv8g9EBflVK6bi6TKX/71M89TmluJsUG60=;
        b=eYNBPCRIcmysBhEILEFQ9v3OziDs2XvVVkXtylDmmdiOTLHXCV9ABcrr55n/6UjFts
         lTuzAyhPiZ+rvlp5SKeP759NI3cM4BF9hIuN4DaNkGGxAdzWuBPlZvVY+AIjXT3Ma5zF
         /pTZz8ripgnjx3pxVHNE906PitqFNoXd6I/pE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757512763; x=1758117563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B0R5rRW0Dwv8g9EBflVK6bi6TKX/71M89TmluJsUG60=;
        b=OM/p/jZF2OGH6lDyMlLM1qeTWDkSmgfO64lHOccLrgZc+belyeI9uEeu6z1DQyz8e4
         l/PatyeM7W6UplI+V1wJsVYv44kCnBx/44QmCtXsJlYSM7fTO1O0icFfE6DUlaZlSWNl
         4QOkRt/ojmGSWUHESgpxiUaj2EkDvKltATOk+7Yxw6x2H+Y5nuFQ/0+p3GvsJ0jwVKHZ
         KxcOkM782dLafJWzAba/StP9Po3KJBwrBCB5UpxhfFOU7I/sBiuOiIblakCMeVzVXRtB
         h8Yvv5ABLtyncev17tHtjGaID18/LN/JiKLM+lZTEC9nHRYz9u7fBIzHO9dD6i6RlUiC
         FcWA==
X-Forwarded-Encrypted: i=1; AJvYcCUd9CHJ48FX2L+Hbw6irnhK07NsCtSVFP/8oXleivD2X4YMxeGfTcoBsT5q5NYLsKGTQlY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyAbOkdRGluBl4GW71Lq8ieZryVsSPmBxIp2+YvpQojp3mGMoms
	Fk5QIy/pla3SlhnDI1rp0Rp5HCixVFBdtRRKBsULV/ihoYb7CerTXA1PsuTcL28KdYU=
X-Gm-Gg: ASbGncvtVMTYyOUIDLsjw1+WIta8bze6pxlni43RQ0qq0bEcE26tNmthBDoXGuU+FFw
	EO21L3zqSZnM+wNuuMXEN0eQCSUbvHzFhiCsd2oDtwuSZTe5Z7LCgN2Md4dRdDzoFd8C8z8j554
	JqnJzccyZfOLHCoiYUdPIRsTdydQfCKBMnEpyWCZi/DywlKL7DfKU9t9+7LmtZdJtapb/ORUN+K
	YG4ZRHc3J8mhZFPPW3Oy7MXUmWAD1XoAZRTz+ydH+TVcbtO1Kn/eW4TRtH4693DCTQ4xropaLeS
	UOV6kk3vSjGJE9DMSP3GLkV1/y/CdCHT7aUNJgtPGfgiL/z6eLwqdSy6z6HoILKXnVpPCgF6jV4
	ngg5Vt0sqMB3uM10a1rh8ZnAt8Po5zHKq0kwSP16BScXgoE5VXJf5QOWn8BnOJ4fQQqFH7t2ZQb
	xsZSv99mbVs+tavJP9uW62nFbnUiRpIT0RBa3e2fFOiOqoZXrezligknT5TSEiX4d8
X-Google-Smtp-Source: AGHT+IHdweJVzi0li6Hab/FnHQdGRXCIG6Nx0PPgMqfpJ3S+dtaqUO7p5/p1o4bXf82vFHRmV8q+6Q==
X-Received: by 2002:a17:907:1c25:b0:b04:5c90:8013 with SMTP id a640c23a62f3a-b04b173763amr1525363866b.45.1757512762970;
        Wed, 10 Sep 2025 06:59:22 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07833a4e37sm172523066b.76.2025.09.10.06.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 06:59:22 -0700 (PDT)
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
Subject: [RESEND PATCH 3/4] Input: imx6ul_tsc - set glitch threshold by DTS property
Date: Wed, 10 Sep 2025 15:58:37 +0200
Message-ID: <20250910135916.3939502-4-dario.binacchi@amarulasolutions.com>
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

Set the glitch threshold previously hardcoded in the driver. The change
is backward compatible.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/input/touchscreen/imx6ul_tsc.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index c2c6e50efc54..a6066643bd48 100644
--- a/drivers/input/touchscreen/imx6ul_tsc.c
+++ b/drivers/input/touchscreen/imx6ul_tsc.c
@@ -7,6 +7,7 @@
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/bitfield.h>
 #include <linux/gpio/consumer.h>
 #include <linux/input.h>
 #include <linux/slab.h>
@@ -74,7 +75,8 @@
 #define MEASURE_INT_EN		0x1
 #define MEASURE_SIG_EN		0x1
 #define VALID_SIG_EN		(0x1 << 8)
-#define DE_GLITCH_2		(0x2 << 29)
+#define DE_GLITCH_MASK		GENMASK(30, 29)
+#define DE_GLITCH_DEF		0x02
 #define START_SENSE		(0x1 << 12)
 #define TSC_DISABLE		(0x1 << 16)
 #define DETECT_MODE		0x2
@@ -92,6 +94,7 @@ struct imx6ul_tsc {
 	u32 pre_charge_time;
 	bool average_enable;
 	u32 average_select;
+	u32 de_glitch;
 
 	struct completion completion;
 };
@@ -188,13 +191,15 @@ static void imx6ul_tsc_channel_config(struct imx6ul_tsc *tsc)
 static void imx6ul_tsc_set(struct imx6ul_tsc *tsc)
 {
 	u32 basic_setting = 0;
+	u32 debug_mode2;
 	u32 start;
 
 	basic_setting |= tsc->measure_delay_time << 8;
 	basic_setting |= DETECT_4_WIRE_MODE | AUTO_MEASURE;
 	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETTING);
 
-	writel(DE_GLITCH_2, tsc->tsc_regs + REG_TSC_DEBUG_MODE2);
+	debug_mode2 = FIELD_PREP(DE_GLITCH_MASK, tsc->de_glitch);
+	writel(debug_mode2, tsc->tsc_regs + REG_TSC_DEBUG_MODE2);
 
 	writel(tsc->pre_charge_time, tsc->tsc_regs + REG_TSC_PRE_CHARGE_TIME);
 	writel(MEASURE_INT_EN, tsc->tsc_regs + REG_TSC_INT_EN);
@@ -501,6 +506,17 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	err = of_property_read_u32(np, "fsl,glitch-threshold", &tsc->de_glitch);
+	if (err)
+		tsc->de_glitch = DE_GLITCH_DEF;
+
+	if (tsc->de_glitch > FIELD_MAX(DE_GLITCH_MASK)) {
+		dev_err(&pdev->dev,
+			"fsl,glitch-threshold (%u) must be less or equal to %lu\n",
+			tsc->de_glitch, FIELD_MAX(DE_GLITCH_MASK));
+		return -EINVAL;
+	}
+
 	err = input_register_device(tsc->input);
 	if (err) {
 		dev_err(&pdev->dev,
-- 
2.43.0

