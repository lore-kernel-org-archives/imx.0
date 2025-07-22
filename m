Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CAA2E2667
	for <imx@lists.linux.dev>; Tue, 22 Jul 2025 10:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753180642; cv=none; b=KfgSnxhvqNPYUWuAN8zWAJ/6Qvkpxvxwm9oa0T+zSUvqi1dy1Sxz61559gmfLN5iYssAboj3ySgDjWTfFPzv0NedyD21v/Wx3jnQ9E6HvlixyYruZSEUr8dLODFsVK1YW0RyMnxY80LykKS2heYgS68Y8mo7yxIabqW2L3mOo7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753180642; c=relaxed/simple;
	bh=mAnzVAui+Zh2pgPs+xFJHjOfsAlD+iZi1XelY8rp6FQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EiGMsGpgEyKdXd2eBsNHY34zLtUh45HOEGyl5h38ZCjuHfw4k7I/67E9Bq0+DQjEl9vjG/v5ZIUsglpf9UOLT9dyuotdc+5gClev68Xp2O0h3RuzQhYVqRxQjQTB+3Lb2tsUPqxz9VNN/NRfb4JP/evEnCvji/gPaTGenKGeWyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=LDg6K0T+; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="LDg6K0T+"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-612b67dcb89so7460172a12.1
        for <imx@lists.linux.dev>; Tue, 22 Jul 2025 03:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1753180638; x=1753785438; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0R5rRW0Dwv8g9EBflVK6bi6TKX/71M89TmluJsUG60=;
        b=LDg6K0T+ECnxKQQAhWxmG1sN9HISTTHwv9ykniXUYz+M1wZVhoHE2ocza2lOraj9Y2
         ywuPKMEhxtEgrCad0HMiyUVB/WSCuWeazQj0GA+BHnqZT8JC8S4NVFySG4YbzNBwBpFp
         TVARzlGnlbPuJYom272KdbciIoZKAdBHXqR1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753180638; x=1753785438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B0R5rRW0Dwv8g9EBflVK6bi6TKX/71M89TmluJsUG60=;
        b=VhdzN11OmJu+Vz1mF+ov31xcy5eDnS6a8EmIlQD7jnH/3m/C3ss4fw5IMWlZ3TB/8Z
         AMhsew/LETkCWsJAjvjvOd6OwR9PpQmbh0l8R+wb4YF1CZzCCPVIIRJPihEDWWBHad0O
         fI/zKRjIuLazeRwGjxr70YWK9f8bDvPd+gmiZbN8H20fJS0CyDx7wgP9Vs81+6qKMKAF
         i3Vs7PcIWBFu21JAFrS2zhiyM/SeT+r8wtxypAQkVz6w4vYuvjr+Lk6OXIypUalMcpM+
         WXFJl3rrZXBsfGQOu7jCr6Fc62G5XjdVg/5qcAr8SG4EKmH3u+JH/asf8JEwQpvYsRpY
         pKAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiATqrw5d4FgYUtBdXWC+G/gvCRvcAHAfiHJzjDXvJaGXdzGfYkYBswCyVltr0oD5CMI8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4N+Q620vMMcUfdxJWR60Er1ALKMC+L4D2pDj+cXpg0EQFEVza
	S+sdwQEx3vkxnxQwjDnSSuFpnfvRdfqZ7V5TX+s/TgyE07txLYS2GfAEV7XBP0qy+9A=
X-Gm-Gg: ASbGncuB1aPu9vLtUFNi0ic6Xzl1pQsVjCpo/OAfh7Zr84zSSIg6bA1HVLnanwHrFCE
	1Tj42QAqU1NFivPAKxwax1iRXqTlsNGtRKmvKRDmHOu4V0s5TcGeyPTvspYCBoC0PBdb/Mf/m21
	drKEfdnjWF3+yB3q+th9kuJxKSu19X5V27F35ajPyoG7JeHhPIZYRTCGpXm8zqzMUjhVEA0tXZh
	KUEWEGlvXclv0srE2wjSsZhR0t7kqV7k0xQKfLoE5FbDbHBjWeVKi0ZKrdU/bGjITwCVx7gSrrg
	wxtLnGK13OcQcqfChCoiGlCNSorBUknWK5thsBX64HVULlXet6j6iCok/4ytmmotYs6UXCX3tTN
	BGM058WaydzrrJd43dI1jT+PvFBQY5jiq6V8bambce+3FdwOpEnQvooDi7sI=
X-Google-Smtp-Source: AGHT+IF5XH+ULXAJm2Yd7fdwy7Og8oahMPwKCKBYQfiU9IiXyUwIgGfm5dtLgUZCNSYYUrIZy4YonA==
X-Received: by 2002:a17:907:cb81:b0:ae9:c494:1ade with SMTP id a640c23a62f3a-ae9ce199db0mr2520430366b.53.1753180638060;
        Tue, 22 Jul 2025 03:37:18 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:2bba:d7b0:8e79:c982])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca310e2sm844568766b.79.2025.07.22.03.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 03:37:17 -0700 (PDT)
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
Subject: [PATCH 3/4] Input: imx6ul_tsc - set glitch threshold by DTS property
Date: Tue, 22 Jul 2025 12:36:17 +0200
Message-ID: <20250722103706.3440777-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
References: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
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

