Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2F72D1F55
	for <imx@lists.linux.dev>; Thu, 12 Jun 2025 18:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749754266; cv=none; b=bCArKZ0YLqZWbAZ2oqSkK3t356gxdoHxGGUW3WkkqDIsCm4n6QpeBybHJfIrGgldOdI1KsHb5SeoLOxQKzR0Hz8tvdgkyWI3HbxswE2sQh4hqRnwR16M1XSaeWHvNb8stCF+o4UpZ5mHPL5A0g8atxX/m88kf0pBDaFgVITlrkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749754266; c=relaxed/simple;
	bh=Ti66POowjToKmJfrE+6x34fyibhTpawJRvQadMeL9L4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CsO6XJHowlz6WbMxP/4SmQXp167g8SCpNPlAb0WqB49V4FOXQ26SHP7eWgHYS4MJlfsp3BYCm65dyn13DaCv6N/yuSTJgB+MjHWY9SOoafw4FjSHGXtCu2GcSulbWaVZC4I6cMdpLz15ySAqvEUsM/Yr4HB2VgfYNmKbI5UQfvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EPJGpnia; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EPJGpnia"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451d54214adso11271725e9.3
        for <imx@lists.linux.dev>; Thu, 12 Jun 2025 11:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749754263; x=1750359063; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ItSlMM/wBlLoKev8FS4kVPMptl6b/7qaX2G05ZNLbgo=;
        b=EPJGpnia6X/7yZE5YEyD4AG/ZYM7FpiETde4BRnkcm71RhXaBiF/xR1Gggz4/ciIWH
         OqjslcJsFrltxcR0PZiWOG8ejPQ25Q/QnpM7V34GoZ+FJhgQZ8DpBAPnkbGg2xbzcXiO
         iI/zf7Nywzjoh5MrhPt1cjZB9aXhDHQiZRe7HGlvzLSLJ7vuujQI9T5PLbAWVILA4Yxq
         DO6zK++/y+dcL54icoxWECd+wBZDxnbKfKa7ynpPv0vjSGESXKlCLAugUuCAMgibGhwM
         0mcHQT8aLLX6NjJPILP+1JVpqgsNiqSgMwaM3OnimFKs2BaOUOxazTPETuHVzk9L/O/X
         7y8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749754263; x=1750359063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItSlMM/wBlLoKev8FS4kVPMptl6b/7qaX2G05ZNLbgo=;
        b=gU9cwN5WYQ+gGXASqkGmEs1aD/jelLJweYhFu2e7w4XO/WpdsvKMQKKcQ82Sfq/Khm
         La/MdA7HnDo4Ulk9+5UYUmMtQwfCvHZPnIK+RfEG0fJC/f/0RQwThGDxAORiHLbvytxg
         8z/WFrNEkrJbgw8ekMH1XwCplq2Tj9DcXOOuaQssGwtrrEi+g0mGk+VKzorQCNkobWGN
         j0lhzd7j1s9++X14zhV7ToVwYyeZo4u8sWrCuKrJpvwfPfu0b6A2hk/65j47GgxdsQUr
         l8n3SwwevnoeQlbqk0TC9ti11eELKHBA2L4bww5oQ9ILx944QiyJWoDvyBHOeLIBfB8a
         drAw==
X-Forwarded-Encrypted: i=1; AJvYcCVWN7kAxcB8PXWdoI+/guy1ZeFkdLpMqlGYYx/qJ3fPzB5PHZO9RQ6tsFQcKFtOkdp3ZTc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxkOpGphRH1glZe4eDuwTOb2JJ9Hd43Q3g7+XYX8zuKx/k0oJU3
	+vKrM0+OvG6IZ5N1mhK6xz0pCBcWBsNSjzUy8bxDqe1BFMRwE/9ok24XAtyic/whQt4=
X-Gm-Gg: ASbGncv3966qhsEnO6qqoPdatsdJbc0DNRBhoptUBoGa6hf1JDKDAcMdx8E8kdgul4K
	Y4Z/yMBMck/7m4+1efRaabbjmoMLtX+lFXopF+KmM8Y465qQ0ZLoHLY9glgbkWIour/Y1H4MpcZ
	dCQty52+WT5Kp5sy2g5APcjkdtppHk3sPLu3IVYI31rSdqpEA4eX+Vy92EHHxQY/Ct2sX6+wckz
	gwaaO6VzCo71OXvSpm6Ro5SGCY0GqkNckno6HjifBpPtHmrMdvMMHDINmS+/F2YmVCg7173D20M
	0GokxhPu9q5PYeqzca6pO63rQhSOmeK/LTZkX3ToQpJ5N0hvty7FbCU0nYFyt6HI+K0=
X-Google-Smtp-Source: AGHT+IFHEWRA4DAg4P06P/t5PYCVCvOd5SOHz1nqZMsAIFIkiNf1r1XzzAQzITnujTOEyRBzX0R3lw==
X-Received: by 2002:a05:6000:420b:b0:3a0:b308:8427 with SMTP id ffacd0b85a97d-3a5686f59c8mr300638f8f.37.1749754262777;
        Thu, 12 Jun 2025 11:51:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4532e2446b0sm28363045e9.21.2025.06.12.11.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 11:51:02 -0700 (PDT)
Date: Thu, 12 Jun 2025 21:50:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, s32@nxp.com,
	linaro-s32@linaro.org, Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH 2/3 v2] usb: chipidea: s32g: Add usb support for s32g2
Message-ID: <b5da1cf4e5813d60fdbd9dd5952cd1908ee880e5.1749747898.git.dan.carpenter@linaro.org>
References: <cover.1749747898.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749747898.git.dan.carpenter@linaro.org>

From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>

Enable USB driver for s32g2.  This chip has an errata ERR050474,
so we need to set S32G_UCMALLBE for it to handle packages which
aren't 4 byte aligned correctly.

Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Changes since v1:
* Update the copyright
* Use the .power_lost_check callback.

 drivers/usb/chipidea/ci_hdrc_imx.c |  6 +++
 drivers/usb/chipidea/usbmisc_imx.c | 74 ++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 780f4d151345..e8c847eab8e3 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright 2012 Freescale Semiconductor, Inc.
+ * Copyright 2025 NXP
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
index 118b9a68496b..67ff073ad806 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0+
 /*
  * Copyright 2012 Freescale Semiconductor, Inc.
+ * Copyright 2025 NXP
  */
 
 #include <linux/module.h>
@@ -155,6 +156,18 @@
 					 BLKCTL_OTG_VBUS_WAKEUP_EN | \
 					 BLKCTL_OTG_DPDM_WAKEUP_EN)
 
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
@@ -614,6 +627,52 @@ static int usbmisc_vf610_init(struct imx_usbmisc_data *data)
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
@@ -1033,6 +1092,11 @@ static int usbmisc_imx6sx_power_lost_check(struct imx_usbmisc_data *data)
 		return 0;
 }
 
+static int usbmisc_s32g_power_lost_check(struct imx_usbmisc_data *data)
+{
+	return 1;
+}
+
 static u32 usbmisc_blkctl_wakeup_setting(struct imx_usbmisc_data *data)
 {
 	u32 wakeup_setting = BLKCTL_WAKEUP_SOURCE;
@@ -1131,6 +1195,12 @@ static const struct usbmisc_ops imx95_usbmisc_ops = {
 	.vbus_comparator_on = usbmisc_imx7d_vbus_comparator_on,
 };
 
+static const struct usbmisc_ops s32g2_usbmisc_ops = {
+	.init = usbmisc_s32g2_init,
+	.set_wakeup = usbmisc_s32g_set_wakeup,
+	.power_lost_check = usbmisc_s32g_power_lost_check,
+};
+
 static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
 {
 	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
@@ -1356,6 +1426,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
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

