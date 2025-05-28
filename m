Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5CC220699
	for <imx@lists.linux.dev>; Wed, 28 May 2025 19:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462257; cv=none; b=OR6nWqRTSzPI2Gp1E3oqy7VzumCYjbsf2JfKzCNlPAKSIssitDPexx0IWq2CLj2gsmYHuZf7/FcadUi1zVVdv8xy0Wpq8Viu8kLXYtMmOqJhmr9kMnXEXGTPAJKgfgJ3VA7x44e7vcuSExshUJ0mraIbhXpTVJGPnZjWFqVzd7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462257; c=relaxed/simple;
	bh=i2dxoD/ntV/m+7Q5jL4UXhdg7tXX+Sj+P2vtWuv/Nn4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=tU0vTP+liFgTo/8VyL6TxxsT14SYrWuNJKyKLaMLUDCpR2zeWwKX3R4hIOy/zaP9lNrOb9UBMlPPcsQHRXoR7vKWupNr/xmp9l76v7P2XO4l8DzGI8mU55geBnVloNLw10KEhIC2JBxS0eP+2+gHoo3s8Eu/uz8kUgJskogHCcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D8NjzlNz; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D8NjzlNz"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfe574976so2207135e9.1
        for <imx@lists.linux.dev>; Wed, 28 May 2025 12:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462254; x=1749067054; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GKc4b0imfgOxaE41XqyuXMz1AcDIj93rLftfhbVsUB0=;
        b=D8NjzlNzEge0yNMkEp6MspwUd9/MoNCnsj/oDfX1z0qi2c3blhi3XenAab21tSxjWQ
         8NpxtT0c6bcLrepYlxjjbbXDdcDW8eVA/wlaidyaNNQrSJ4E3QIEaQaO63eBRRdQstE5
         hyPiiq/UYSSxcmyAaqkftl/m/Ym3REMo52od5vsF8UtFqLPz0oBP1f4zbwZ/4PPMNB1s
         oimE7M8IeRL+o10Mgn5pzsiyHC0JYkPwVasfb0MVJk308QMlatYmkDEJlCFiIQ9tHJtC
         jgSHwWHpdvMtHme5/QzMo0C2Ws0wg0Sz+xhH7QUj0F/D1CbVaDahO0x78G4LCRmasXCQ
         xd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462254; x=1749067054;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GKc4b0imfgOxaE41XqyuXMz1AcDIj93rLftfhbVsUB0=;
        b=EX1rI8BUwipg+txQHuKGwoUspJwY9N9WHSpt5fc1EOA91Ln/esQT0QEQD839IqNnWu
         1imThLf35ze/0Bt1K+OvpNiU4abyLtwOr8Ci3ytBXdtPaJmiNxCU/inm3fXvp7K2MEDI
         4FHzube6LadiZLt3MxXQ24S7fLQ3cY+/xUeOMpFqnEN00XBhZg5y52jzJ5v5Tx4rQd9Z
         kx7hpdGUjubm26XF40D5D1MjzKGQyiXs1SxZ702B7zRQwUINn2yWr128kwXSqqA3dloG
         7QIYpOi1QrbzmgTzCjP1Ee+O/xg9u3H+B7E+c4LGlKxGjcfQimUFAvpXxiFXLwvm/scL
         cI9A==
X-Forwarded-Encrypted: i=1; AJvYcCWao0wh9+Xw2WIV8ZyZKc1PwzajQBFR7NWoOC/1Lf7bUPGXDI9OzY/ZStw4OWlWToNIn2I=@lists.linux.dev
X-Gm-Message-State: AOJu0YxEZGuatD6R3vI8ExSRURuZDThJ3+UDPwSPjlaLQII2zp8++Zi9
	+kZ1N9W/UQCzjJd3+8+2oGwLDB1aTBCzgEVG44trUN3bHPlE7psU9Wv/XrA2IOSJyrc=
X-Gm-Gg: ASbGncunaG7QyjunHG1Q5TdYXf5Qw9xvo34+/oOSTh4aUhMeJ7YEsn+cK7p6pGKoBTY
	DvrEoAB6CtSFAWNliCU3m/z4Ym/AqdccTUXlv66xHGY3NCm2/lYuwth7JiUlvsHsoTdYPh/tnRX
	cI39MWaEgV3tw0BPUb36gODq2L55JMNoEFBEEGykWG/y3LlMwMwi9i9wXsKvwYu7zCmTOOLFyAV
	SfpyL7Am5bagGsN+fWWBD68OdGzM6lYH2gRIo6Sqfwq48VoydDy8QSxcHlgXP1oJq92Xel+iJEn
	S2Y5ZKioRID6obhp+VOx5KZUTNJxppNIlVEDJgjfTq+6oKuqjzYnos0=
X-Google-Smtp-Source: AGHT+IGn7oYiU84+Os9KZ1JyFhYBfIsC6UZXONKWGrt/yYdV1Jw5Q48vqbVCHgdSg+N6FNSblY8qrw==
X-Received: by 2002:a05:600c:a00e:b0:43c:fe90:1279 with SMTP id 5b1f17b1804b1-45077d424bbmr33816665e9.21.1748462253763;
        Wed, 28 May 2025 12:57:33 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4eacd7909sm2308059f8f.78.2025.05.28.12.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:57:32 -0700 (PDT)
Date: Wed, 28 May 2025 22:57:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, s32@nxp.com,
	linaro-s32@linaro.org
Subject: [PATCH 3/4] usb: chipidea: s32g: Add usb support for s32g2
Message-ID: <7407d9e557bfce2a5541fd002d36c15a041c0cc2.1748461536.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1748453565.git.dan.carpenter@linaro.org>

From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>

Enable USB driver for s32g2.

Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/chipidea/ci_hdrc_imx.c |  6 +++
 drivers/usb/chipidea/usbmisc_imx.c | 69 ++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 780f4d151345..ce207f8566d5 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright 2012 Freescale Semiconductor, Inc.
+ * Copyright 2020 NXP
  * Copyright (C) 2012 Marek Vasut <marex@denx.de>
  * on behalf of DENX Software Engineering GmbH
  */
@@ -78,6 +79,10 @@ static const struct ci_hdrc_imx_platform_flag imx8ulp_usb_data = {
 		CI_HDRC_HAS_PORTSC_PEC_MISSED,
 };
 
+static const struct ci_hdrc_imx_platform_flag s32g_usb_data = {
+	.flags = CI_HDRC_DISABLE_HOST_STREAMING,
+};
+
 static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
 	{ .compatible = "fsl,imx23-usb", .data = &imx23_usb_data},
 	{ .compatible = "fsl,imx28-usb", .data = &imx28_usb_data},
@@ -89,6 +94,7 @@ static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
 	{ .compatible = "fsl,imx7d-usb", .data = &imx7d_usb_data},
 	{ .compatible = "fsl,imx7ulp-usb", .data = &imx7ulp_usb_data},
 	{ .compatible = "fsl,imx8ulp-usb", .data = &imx8ulp_usb_data},
+	{ .compatible = "nxp,s32g2-usb", .data = &s32g_usb_data},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ci_hdrc_imx_dt_ids);
diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 95759a4ec60c..43098a150e83 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright 2012 Freescale Semiconductor, Inc.
+ * Copyright 2020 NXP
  */
 
 #include <linux/module.h>
@@ -158,6 +159,18 @@
 /* Flags for 'struct imx_usbmisc' */
 #define REINIT_DURING_RESUME	BIT(1)
 
+#define S32G_WAKEUP_IE		BIT(0)
+#define S32G_CORE_IE		BIT(1)
+#define S32G_PWRFLTEN		BIT(7)
+#define S32G_WAKEUPCTRL		BIT(10)
+#define S32G_WAKEUPEN		BIT(11)
+
+/* Workaround errata ERR050474 (handle packages that aren't 4 byte aligned) */
+#define S32G_UCMALLBE		BIT(15)
+
+#define S32G_WAKEUP_BITS (S32G_WAKEUP_IE | S32G_CORE_IE | S32G_WAKEUPEN | \
+			  S32G_WAKEUPCTRL)
+
 struct usbmisc_ops {
 	/* It's called once when probe a usb device */
 	int (*init)(struct imx_usbmisc_data *data);
@@ -618,6 +631,52 @@ static int usbmisc_vf610_init(struct imx_usbmisc_data *data)
 	return 0;
 }
 
+static int usbmisc_s32g_set_wakeup(struct imx_usbmisc_data *data, bool enabled)
+{
+	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
+	unsigned long flags;
+	u32 reg;
+
+	spin_lock_irqsave(&usbmisc->lock, flags);
+
+	reg = readl(usbmisc->base);
+	if (enabled)
+		reg |= S32G_WAKEUP_BITS;
+	else
+		reg &= ~S32G_WAKEUP_BITS;
+
+	writel(reg, usbmisc->base);
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+
+	return 0;
+}
+
+static int usbmisc_s32g_init(struct imx_usbmisc_data *data, u32 extra_flags)
+{
+	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
+	unsigned long flags;
+	u32 reg;
+
+	spin_lock_irqsave(&usbmisc->lock, flags);
+
+	reg = readl(usbmisc->base);
+
+	reg |= S32G_PWRFLTEN;
+	reg |= extra_flags;
+
+	writel(reg, usbmisc->base);
+
+	spin_unlock_irqrestore(&usbmisc->lock, flags);
+	usbmisc_s32g_set_wakeup(data, false);
+
+	return 0;
+}
+
+static int usbmisc_s32g2_init(struct imx_usbmisc_data *data)
+{
+	return usbmisc_s32g_init(data, S32G_UCMALLBE);
+}
+
 static int usbmisc_imx7d_set_wakeup
 	(struct imx_usbmisc_data *data, bool enabled)
 {
@@ -1135,6 +1194,12 @@ static const struct usbmisc_ops imx95_usbmisc_ops = {
 	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
 };
 
+static const struct usbmisc_ops s32g2_usbmisc_ops = {
+	.init = usbmisc_s32g2_init,
+	.set_wakeup = usbmisc_s32g_set_wakeup,
+	.flags = REINIT_DURING_RESUME,
+};
+
 static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
 {
 	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
@@ -1363,6 +1428,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
 		.compatible = "fsl,imx95-usbmisc",
 		.data = &imx95_usbmisc_ops,
 	},
+	{
+		.compatible = "nxp,s32g2-usbmisc",
+		.data = &s32g2_usbmisc_ops,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
-- 
2.47.2

