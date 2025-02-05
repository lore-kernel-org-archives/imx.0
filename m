Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851B1211A11
	for <imx@lists.linux.dev>; Wed,  5 Feb 2025 20:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738787459; cv=none; b=cLrYPr0Tn9PdAfIS8BjQM303dIOlP76HH2hBfqM8gPnMQmbTc9t6djvsvWbsh2t9qI1bSmTknpmQVacumMiHFOvuTIeNnlAI3EOeWl3r/GI6pe1JU2KO+Prt14d4r52XC0yGa4sYQ1pjBUEhsrfOVLqQEW1eDVglNAUC0cqLaHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738787459; c=relaxed/simple;
	bh=GcW1kSz459Vd9vb2qwAZIMnK4oF7sYJj5RmTxinVhZA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T8omfX3tXuWQfLZmGQvsDVQFemQ8fywfnC2M8vcdp6tEYSkgYeQNooIGqWNeseFfBwBoRRSM7j5y70GekL2bwal30xnnJLCqJPIi7EnwjvUYp125oSVqJdEZ6+/AMvpZm6ncfoPELH5+pkZCOskD36vtneQ91dn6u4lD/EAW6H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EYs7v03i; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EYs7v03i"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5dce1d61b44so427261a12.2
        for <imx@lists.linux.dev>; Wed, 05 Feb 2025 12:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738787455; x=1739392255; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIveuwLAg8JX+xXcUtntb5/6MpTHm4i8JPZEsqwAciE=;
        b=EYs7v03ixCtB6bJ+dCLYZX0/84PCSOAv8h75WOdW/act0brWhPt2irK0Rqz/r7T8Vd
         0a/Sw5uB1Vx9PyD9nnq4fV2uq2P75f4Cr7z5Pwleb1+bxcJ2UjAU4S1Va08HBZ5J0naW
         uLi5T4LWQR9yG7U17E2lTz+xVDsHf2kflg7uDKppA6vY1dHOJXAG6HSqSOhUQ3cMOeFX
         MHNXQKJ9zma3UO4+Vn+pgZUUwjnnWPbzRjjTzqhkSHyT2jsrZCujbOWweP0hQSG4QbVR
         llS86+YJWqRNO5d02zqWRJbH0+EVx2TGEc4p11O8oc0PzqZ8ifdMFFZPLIa4TiBoAeZk
         l4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738787455; x=1739392255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIveuwLAg8JX+xXcUtntb5/6MpTHm4i8JPZEsqwAciE=;
        b=V9QaSdymKKzmnTPt4e/T8P6+mX+i+Kd84nhohs7L5CXfpNwhPD0mYMy+LoR4oq49Ue
         iB2CCqhb5qQY3aK24uTV1KK07ey7rqpkfrINKqZsCjxn5xH5caytKO1WjHrWY7hcpwW7
         D1W8Gw94Hd7ILxlFXzG+VihSLs8oKH3bF156ZrVlbUM9pSeWgfo5FLdY8u6XPT0iocl7
         Tx+ORZYvv0spaaNS5j/gc+vYrEd5ojJHUCrvL+m2FVqNnNnePqaeviS16DgeaH31TLPL
         5wD0g7LqpQ8uJ8+Wg0kT2rSsibgGi6NRcnKL6PKdo9zCSumAjk6LA7KOOQgvK3aykbTu
         Jrog==
X-Forwarded-Encrypted: i=1; AJvYcCVeYXUmdGdXyv20Tubb/aKYFQnsKTdfmt/VdcEKNPkMuoKVyMJUz9An5+zy+MprjpmIXRQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YySurzBQvHbfFRTwmjY+hZU+NtQ2Sf/WZLnpxHXN8d3qayyPu3V
	U5swPRGAZ/dis4GK76JdrLA2ekH6gmMq9X90r81KeRcotxiN+ZmwqYMStTiG
X-Gm-Gg: ASbGncuARmASA3I7S0oj+Z9eC0gQxTZ5t/QlCWRa8ccyTND/Xyp6HcvL/O+oQNoKksP
	6ekvyrP8GT/6VLBCHyYXQFqX0KiWXrrXbLab2l774AkHfpvcq/9nElLyTt/xgxoLXUGw8Mmc7Vi
	JDKRbaGeHzgk/sFcfIKY6qzRXQ+1t98PXKwSjgV0MK+DAIPs919bqs/wRNzpZ78j/We2gCkSRfd
	+vjaf40eQhDhp8pASNKy2MxHPxeGgF/6IPP0WuXtY/eM4+VgkgEr19XMTGJg61sxYcixF2QRYX+
	krb4QeRvdfXWZI5LepllU44JYGeqqCIoS/ITDO/w9ppsgb/gyIZaOg==
X-Google-Smtp-Source: AGHT+IFqcEBjt44zOm8wrtsyfEatkEXHvfUXL21ryfMgarzcolJtPz6/D2vDPJ6WkftpJpRw9fqAHw==
X-Received: by 2002:a17:907:6d23:b0:ab6:de35:336c with SMTP id a640c23a62f3a-ab75e245034mr412622766b.19.1738787454430;
        Wed, 05 Feb 2025 12:30:54 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcd309f127sm2848014a12.40.2025.02.05.12.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 12:30:53 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH v2 2/8] ASoC: SOF: imx8: use common imx chip interface
Date: Wed,  5 Feb 2025 15:30:16 -0500
Message-Id: <20250205203022.2754-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205203022.2754-1-laurentiumihalcea111@gmail.com>
References: <20250205203022.2754-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The common interface for imx chips (defined in imx-common.c) contains the
definitions for a lot of functions required by the SOF core. As such, the
platform driver can just use the common definitions instead of duplicating
code by re-defining aforementioned functions.

Make the transition to the new common interface. This consists of:

  1) Removing unneeded functions, which are already defined in the
  common interface.

  2) Defining some chip-specific operations/structures required by the
  interface to work.

  3) Dropping structure definitions that are no longer needed.

  4) Adapting some existing functions to the new interface.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 sound/soc/sof/imx/imx8.c | 522 +++++----------------------------------
 1 file changed, 65 insertions(+), 457 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 1e7bf00d7c46..25e3296a1e5e 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
-// Copyright 2019 NXP
+// Copyright 2019-2025 NXP
 //
 // Author: Daniel Baluta <daniel.baluta@nxp.com>
 //
@@ -41,100 +41,28 @@
 #define MBOX_OFFSET	0x800000
 #define MBOX_SIZE	0x1000
 
-struct imx8_priv {
-	struct device *dev;
-	struct snd_sof_dev *sdev;
-
-	/* DSP IPC handler */
-	struct imx_dsp_ipc *dsp_ipc;
-	struct platform_device *ipc_dev;
-
-	/* System Controller IPC handler */
-	struct imx_sc_ipc *sc_ipc;
-
-	/* Power domain handling */
-	int num_domains;
-	struct device **pd_dev;
-	struct device_link **link;
-
-	struct clk_bulk_data *clks;
-	int clk_num;
-};
-
-static int imx8_get_mailbox_offset(struct snd_sof_dev *sdev)
-{
-	return MBOX_OFFSET;
-}
-
-static int imx8_get_window_offset(struct snd_sof_dev *sdev, u32 id)
-{
-	return MBOX_OFFSET;
-}
-
-static void imx8_dsp_handle_reply(struct imx_dsp_ipc *ipc)
-{
-	struct imx8_priv *priv = imx_dsp_get_data(ipc);
-	unsigned long flags;
-
-	spin_lock_irqsave(&priv->sdev->ipc_lock, flags);
-	snd_sof_ipc_process_reply(priv->sdev, 0);
-	spin_unlock_irqrestore(&priv->sdev->ipc_lock, flags);
-}
-
-static void imx8_dsp_handle_request(struct imx_dsp_ipc *ipc)
-{
-	struct imx8_priv *priv = imx_dsp_get_data(ipc);
-	u32 p; /* panic code */
-
-	/* Read the message from the debug box. */
-	sof_mailbox_read(priv->sdev, priv->sdev->debug_box.offset + 4, &p, sizeof(p));
-
-	/* Check to see if the message is a panic code (0x0dead***) */
-	if ((p & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC)
-		snd_sof_dsp_panic(priv->sdev, p, true);
-	else
-		snd_sof_ipc_msgs_rx(priv->sdev);
-}
-
-static struct imx_dsp_ops dsp_ops = {
-	.handle_reply		= imx8_dsp_handle_reply,
-	.handle_request		= imx8_dsp_handle_request,
-};
-
-static int imx8_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
-{
-	struct imx8_priv *priv = sdev->pdata->hw_pdata;
-
-	sof_mailbox_write(sdev, sdev->host_box.offset, msg->msg_data,
-			  msg->msg_size);
-	imx_dsp_ring_doorbell(priv->dsp_ipc, 0);
-
-	return 0;
-}
-
 /*
  * DSP control.
  */
 static int imx8x_run(struct snd_sof_dev *sdev)
 {
-	struct imx8_priv *dsp_priv = sdev->pdata->hw_pdata;
 	int ret;
 
-	ret = imx_sc_misc_set_control(dsp_priv->sc_ipc, IMX_SC_R_DSP,
+	ret = imx_sc_misc_set_control(get_chip_pdata(sdev), IMX_SC_R_DSP,
 				      IMX_SC_C_OFS_SEL, 1);
 	if (ret < 0) {
 		dev_err(sdev->dev, "Error system address offset source select\n");
 		return ret;
 	}
 
-	ret = imx_sc_misc_set_control(dsp_priv->sc_ipc, IMX_SC_R_DSP,
+	ret = imx_sc_misc_set_control(get_chip_pdata(sdev), IMX_SC_R_DSP,
 				      IMX_SC_C_OFS_AUDIO, 0x80);
 	if (ret < 0) {
 		dev_err(sdev->dev, "Error system address offset of AUDIO\n");
 		return ret;
 	}
 
-	ret = imx_sc_misc_set_control(dsp_priv->sc_ipc, IMX_SC_R_DSP,
+	ret = imx_sc_misc_set_control(get_chip_pdata(sdev), IMX_SC_R_DSP,
 				      IMX_SC_C_OFS_PERIPH, 0x5A);
 	if (ret < 0) {
 		dev_err(sdev->dev, "Error system address offset of PERIPH %d\n",
@@ -142,14 +70,14 @@ static int imx8x_run(struct snd_sof_dev *sdev)
 		return ret;
 	}
 
-	ret = imx_sc_misc_set_control(dsp_priv->sc_ipc, IMX_SC_R_DSP,
+	ret = imx_sc_misc_set_control(get_chip_pdata(sdev), IMX_SC_R_DSP,
 				      IMX_SC_C_OFS_IRQ, 0x51);
 	if (ret < 0) {
 		dev_err(sdev->dev, "Error system address offset of IRQ\n");
 		return ret;
 	}
 
-	imx_sc_pm_cpu_start(dsp_priv->sc_ipc, IMX_SC_R_DSP, true,
+	imx_sc_pm_cpu_start(get_chip_pdata(sdev), IMX_SC_R_DSP, true,
 			    RESET_VECTOR_VADDR);
 
 	return 0;
@@ -157,17 +85,16 @@ static int imx8x_run(struct snd_sof_dev *sdev)
 
 static int imx8_run(struct snd_sof_dev *sdev)
 {
-	struct imx8_priv *dsp_priv = sdev->pdata->hw_pdata;
 	int ret;
 
-	ret = imx_sc_misc_set_control(dsp_priv->sc_ipc, IMX_SC_R_DSP,
+	ret = imx_sc_misc_set_control(get_chip_pdata(sdev), IMX_SC_R_DSP,
 				      IMX_SC_C_OFS_SEL, 0);
 	if (ret < 0) {
 		dev_err(sdev->dev, "Error system address offset source select\n");
 		return ret;
 	}
 
-	imx_sc_pm_cpu_start(dsp_priv->sc_ipc, IMX_SC_R_DSP, true,
+	imx_sc_pm_cpu_start(get_chip_pdata(sdev), IMX_SC_R_DSP, true,
 			    RESET_VECTOR_VADDR);
 
 	return 0;
@@ -175,272 +102,20 @@ static int imx8_run(struct snd_sof_dev *sdev)
 
 static int imx8_probe(struct snd_sof_dev *sdev)
 {
-	struct platform_device *pdev = to_platform_device(sdev->dev);
-	struct device_node *np = pdev->dev.of_node;
-	struct device_node *res_node;
-	struct resource *mmio;
-	struct imx8_priv *priv;
-	struct resource res;
-	u32 base, size;
-	int ret = 0;
-	int i;
-
-	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	sdev->num_cores = 1;
-	sdev->pdata->hw_pdata = priv;
-	priv->dev = sdev->dev;
-	priv->sdev = sdev;
-
-	/* power up device associated power domains */
-	priv->num_domains = of_count_phandle_with_args(np, "power-domains",
-						       "#power-domain-cells");
-	if (priv->num_domains < 0) {
-		dev_err(sdev->dev, "no power-domains property in %pOF\n", np);
-		return priv->num_domains;
-	}
-
-	priv->pd_dev = devm_kmalloc_array(&pdev->dev, priv->num_domains,
-					  sizeof(*priv->pd_dev), GFP_KERNEL);
-	if (!priv->pd_dev)
-		return -ENOMEM;
-
-	priv->link = devm_kmalloc_array(&pdev->dev, priv->num_domains,
-					sizeof(*priv->link), GFP_KERNEL);
-	if (!priv->link)
-		return -ENOMEM;
-
-	for (i = 0; i < priv->num_domains; i++) {
-		priv->pd_dev[i] = dev_pm_domain_attach_by_id(&pdev->dev, i);
-		if (IS_ERR(priv->pd_dev[i])) {
-			ret = PTR_ERR(priv->pd_dev[i]);
-			goto exit_unroll_pm;
-		}
-		priv->link[i] = device_link_add(&pdev->dev, priv->pd_dev[i],
-						DL_FLAG_STATELESS |
-						DL_FLAG_PM_RUNTIME |
-						DL_FLAG_RPM_ACTIVE);
-		if (!priv->link[i]) {
-			ret = -ENOMEM;
-			dev_pm_domain_detach(priv->pd_dev[i], false);
-			goto exit_unroll_pm;
-		}
-	}
-
-	ret = imx_scu_get_handle(&priv->sc_ipc);
-	if (ret) {
-		dev_err(sdev->dev, "Cannot obtain SCU handle (err = %d)\n",
-			ret);
-		goto exit_unroll_pm;
-	}
-
-	priv->ipc_dev = platform_device_register_data(sdev->dev, "imx-dsp",
-						      PLATFORM_DEVID_NONE,
-						      pdev, sizeof(*pdev));
-	if (IS_ERR(priv->ipc_dev)) {
-		ret = PTR_ERR(priv->ipc_dev);
-		goto exit_unroll_pm;
-	}
-
-	priv->dsp_ipc = dev_get_drvdata(&priv->ipc_dev->dev);
-	if (!priv->dsp_ipc) {
-		/* DSP IPC driver not probed yet, try later */
-		ret = -EPROBE_DEFER;
-		dev_err(sdev->dev, "Failed to get drvdata\n");
-		goto exit_pdev_unregister;
-	}
-
-	imx_dsp_set_data(priv->dsp_ipc, priv);
-	priv->dsp_ipc->ops = &dsp_ops;
-
-	/* DSP base */
-	mmio = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (mmio) {
-		base = mmio->start;
-		size = resource_size(mmio);
-	} else {
-		dev_err(sdev->dev, "error: failed to get DSP base at idx 0\n");
-		ret = -EINVAL;
-		goto exit_pdev_unregister;
-	}
-
-	sdev->bar[SOF_FW_BLK_TYPE_IRAM] = devm_ioremap(sdev->dev, base, size);
-	if (!sdev->bar[SOF_FW_BLK_TYPE_IRAM]) {
-		dev_err(sdev->dev, "failed to ioremap base 0x%x size 0x%x\n",
-			base, size);
-		ret = -ENODEV;
-		goto exit_pdev_unregister;
-	}
-	sdev->mmio_bar = SOF_FW_BLK_TYPE_IRAM;
-
-	res_node = of_parse_phandle(np, "memory-region", 0);
-	if (!res_node) {
-		dev_err(&pdev->dev, "failed to get memory region node\n");
-		ret = -ENODEV;
-		goto exit_pdev_unregister;
-	}
-
-	ret = of_address_to_resource(res_node, 0, &res);
-	of_node_put(res_node);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to get reserved region address\n");
-		goto exit_pdev_unregister;
-	}
-
-	sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap_wc(sdev->dev, res.start,
-							  resource_size(&res));
-	if (!sdev->bar[SOF_FW_BLK_TYPE_SRAM]) {
-		dev_err(sdev->dev, "failed to ioremap mem 0x%x size 0x%x\n",
-			base, size);
-		ret = -ENOMEM;
-		goto exit_pdev_unregister;
-	}
-	sdev->mailbox_bar = SOF_FW_BLK_TYPE_SRAM;
-
-	/* set default mailbox offset for FW ready message */
-	sdev->dsp_box.offset = MBOX_OFFSET;
-
-	ret = devm_clk_bulk_get_all(sdev->dev, &priv->clks);
-	if (ret < 0) {
-		dev_err(sdev->dev, "failed to fetch clocks: %d\n", ret);
-		goto exit_pdev_unregister;
-	}
-	priv->clk_num = ret;
-
-	ret = clk_bulk_prepare_enable(priv->clk_num, priv->clks);
-	if (ret < 0) {
-		dev_err(sdev->dev, "failed to enable clocks: %d\n", ret);
-		goto exit_pdev_unregister;
-	}
-
-	return 0;
-
-exit_pdev_unregister:
-	platform_device_unregister(priv->ipc_dev);
-exit_unroll_pm:
-	while (--i >= 0) {
-		device_link_del(priv->link[i]);
-		dev_pm_domain_detach(priv->pd_dev[i], false);
-	}
-
-	return ret;
-}
-
-static void imx8_remove(struct snd_sof_dev *sdev)
-{
-	struct imx8_priv *priv = sdev->pdata->hw_pdata;
-	int i;
-
-	clk_bulk_disable_unprepare(priv->clk_num, priv->clks);
-	platform_device_unregister(priv->ipc_dev);
-
-	for (i = 0; i < priv->num_domains; i++) {
-		device_link_del(priv->link[i]);
-		dev_pm_domain_detach(priv->pd_dev[i], false);
-	}
-}
-
-/* on i.MX8 there is 1 to 1 match between type and BAR idx */
-static int imx8_get_bar_index(struct snd_sof_dev *sdev, u32 type)
-{
-	/* Only IRAM and SRAM bars are valid */
-	switch (type) {
-	case SOF_FW_BLK_TYPE_IRAM:
-	case SOF_FW_BLK_TYPE_SRAM:
-		return type;
-	default:
-		return -EINVAL;
-	}
-}
-
-static void imx8_suspend(struct snd_sof_dev *sdev)
-{
-	int i;
-	struct imx8_priv *priv = (struct imx8_priv *)sdev->pdata->hw_pdata;
-
-	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
-		imx_dsp_free_channel(priv->dsp_ipc, i);
-
-	clk_bulk_disable_unprepare(priv->clk_num, priv->clks);
-}
-
-static int imx8_resume(struct snd_sof_dev *sdev)
-{
-	struct imx8_priv *priv = (struct imx8_priv *)sdev->pdata->hw_pdata;
-	int ret;
-	int i;
-
-	ret = clk_bulk_prepare_enable(priv->clk_num, priv->clks);
-	if (ret < 0) {
-		dev_err(sdev->dev, "failed to enable clocks: %d\n", ret);
-		return ret;
-	}
-
-	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
-		imx_dsp_request_channel(priv->dsp_ipc, i);
-
-	return 0;
-}
-
-static int imx8_dsp_runtime_resume(struct snd_sof_dev *sdev)
-{
+	struct imx_sc_ipc *sc_ipc_handle;
+	struct imx_common_data *common;
 	int ret;
-	const struct sof_dsp_power_state target_dsp_state = {
-		.state = SOF_DSP_PM_D0,
-	};
-
-	ret = imx8_resume(sdev);
-	if (ret < 0)
-		return ret;
-
-	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
-}
-
-static int imx8_dsp_runtime_suspend(struct snd_sof_dev *sdev)
-{
-	const struct sof_dsp_power_state target_dsp_state = {
-		.state = SOF_DSP_PM_D3,
-	};
-
-	imx8_suspend(sdev);
-
-	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
-}
 
-static int imx8_dsp_suspend(struct snd_sof_dev *sdev, unsigned int target_state)
-{
-	const struct sof_dsp_power_state target_dsp_state = {
-		.state = target_state,
-	};
-
-	if (!pm_runtime_suspended(sdev->dev))
-		imx8_suspend(sdev);
+	common = sdev->pdata->hw_pdata;
 
-	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
-}
-
-static int imx8_dsp_resume(struct snd_sof_dev *sdev)
-{
-	int ret;
-	const struct sof_dsp_power_state target_dsp_state = {
-		.state = SOF_DSP_PM_D0,
-	};
-
-	ret = imx8_resume(sdev);
+	ret = imx_scu_get_handle(&sc_ipc_handle);
 	if (ret < 0)
-		return ret;
+		return dev_err_probe(sdev->dev, ret,
+				     "failed to fetch SC IPC handle\n");
 
-	if (pm_runtime_suspended(sdev->dev)) {
-		pm_runtime_disable(sdev->dev);
-		pm_runtime_set_active(sdev->dev);
-		pm_runtime_mark_last_busy(sdev->dev);
-		pm_runtime_enable(sdev->dev);
-		pm_runtime_idle(sdev->dev);
-	}
+	common->chip_pdata = sc_ipc_handle;
 
-	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
+	return 0;
 }
 
 static struct snd_soc_dai_driver imx8_dai[] = {
@@ -468,135 +143,64 @@ static struct snd_soc_dai_driver imx8_dai[] = {
 },
 };
 
-static int imx8_dsp_set_power_state(struct snd_sof_dev *sdev,
-				    const struct sof_dsp_power_state *target_state)
-{
-	sdev->dsp_power_state = *target_state;
-
-	return 0;
-}
+static struct snd_sof_dsp_ops sof_imx8_ops;
 
-/* i.MX8 ops */
-static const struct snd_sof_dsp_ops sof_imx8_ops = {
-	/* probe and remove */
-	.probe		= imx8_probe,
-	.remove		= imx8_remove,
-	/* DSP core boot */
-	.run		= imx8_run,
-
-	/* Block IO */
-	.block_read	= sof_block_read,
-	.block_write	= sof_block_write,
-
-	/* Mailbox IO */
-	.mailbox_read	= sof_mailbox_read,
-	.mailbox_write	= sof_mailbox_write,
-
-	/* ipc */
-	.send_msg	= imx8_send_msg,
-	.get_mailbox_offset	= imx8_get_mailbox_offset,
-	.get_window_offset	= imx8_get_window_offset,
+static int imx8_ops_init(struct snd_sof_dev *sdev)
+{
+	/* first copy from template */
+	memcpy(&sof_imx8_ops, &sof_imx_ops, sizeof(sof_imx_ops));
 
-	.ipc_msg_data	= sof_ipc_msg_data,
-	.set_stream_data_offset = sof_set_stream_data_offset,
+	/* then set common imx8 ops */
+	sof_imx8_ops.dbg_dump = imx8_dump;
+	sof_imx8_ops.dsp_arch_ops = &sof_xtensa_arch_ops;
+	sof_imx8_ops.debugfs_add_region_item =
+		snd_sof_debugfs_add_region_item_iomem;
 
-	.get_bar_index	= imx8_get_bar_index,
+	/* ... and finally set DAI driver */
+	sof_imx8_ops.drv = get_chip_info(sdev)->drv;
+	sof_imx8_ops.num_drv = get_chip_info(sdev)->num_drv;
 
-	/* firmware loading */
-	.load_firmware	= snd_sof_load_firmware_memcpy,
+	return 0;
+}
 
-	/* Debug information */
-	.dbg_dump = imx8_dump,
-	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
+static const struct imx_chip_ops imx8_chip_ops = {
+	.probe = imx8_probe,
+	.core_kick = imx8_run,
+};
 
-	/* stream callbacks */
-	.pcm_open = sof_stream_pcm_open,
-	.pcm_close = sof_stream_pcm_close,
+static const struct imx_chip_ops imx8x_chip_ops = {
+	.probe = imx8_probe,
+	.core_kick = imx8x_run,
+};
 
-	/* Firmware ops */
-	.dsp_arch_ops = &sof_xtensa_arch_ops,
+static struct imx_memory_info imx8_memory_regions[] = {
+	{ .name = "iram", .reserved = false },
+	{ .name = "sram", .reserved = true },
+	{ }
+};
 
-	/* DAI drivers */
+static const struct imx_chip_info imx8_chip_info = {
+	.ipc_info = {
+		.has_panic_code = true,
+		.boot_mbox_offset = 0x800000,
+		.window_offset = 0x800000,
+	},
+	.memory = imx8_memory_regions,
 	.drv = imx8_dai,
 	.num_drv = ARRAY_SIZE(imx8_dai),
-
-	/* ALSA HW info flags */
-	.hw_info =	SNDRV_PCM_INFO_MMAP |
-			SNDRV_PCM_INFO_MMAP_VALID |
-			SNDRV_PCM_INFO_INTERLEAVED |
-			SNDRV_PCM_INFO_PAUSE |
-			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
-
-	/* PM */
-	.runtime_suspend	= imx8_dsp_runtime_suspend,
-	.runtime_resume		= imx8_dsp_runtime_resume,
-
-	.suspend	= imx8_dsp_suspend,
-	.resume		= imx8_dsp_resume,
-
-	.set_power_state	= imx8_dsp_set_power_state,
+	.ops = &imx8_chip_ops,
 };
 
-/* i.MX8X ops */
-static const struct snd_sof_dsp_ops sof_imx8x_ops = {
-	/* probe and remove */
-	.probe		= imx8_probe,
-	.remove		= imx8_remove,
-	/* DSP core boot */
-	.run		= imx8x_run,
-
-	/* Block IO */
-	.block_read	= sof_block_read,
-	.block_write	= sof_block_write,
-
-	/* Mailbox IO */
-	.mailbox_read	= sof_mailbox_read,
-	.mailbox_write	= sof_mailbox_write,
-
-	/* ipc */
-	.send_msg	= imx8_send_msg,
-	.get_mailbox_offset	= imx8_get_mailbox_offset,
-	.get_window_offset	= imx8_get_window_offset,
-
-	.ipc_msg_data	= sof_ipc_msg_data,
-	.set_stream_data_offset = sof_set_stream_data_offset,
-
-	.get_bar_index	= imx8_get_bar_index,
-
-	/* firmware loading */
-	.load_firmware	= snd_sof_load_firmware_memcpy,
-
-	/* Debug information */
-	.dbg_dump = imx8_dump,
-	.debugfs_add_region_item = snd_sof_debugfs_add_region_item_iomem,
-
-	/* stream callbacks */
-	.pcm_open = sof_stream_pcm_open,
-	.pcm_close = sof_stream_pcm_close,
-
-	/* Firmware ops */
-	.dsp_arch_ops = &sof_xtensa_arch_ops,
-
-	/* DAI drivers */
+static const struct imx_chip_info imx8x_chip_info = {
+	.ipc_info = {
+		.has_panic_code = true,
+		.boot_mbox_offset = 0x800000,
+		.window_offset = 0x800000,
+	},
+	.memory = imx8_memory_regions,
 	.drv = imx8_dai,
 	.num_drv = ARRAY_SIZE(imx8_dai),
-
-	/* PM */
-	.runtime_suspend	= imx8_dsp_runtime_suspend,
-	.runtime_resume		= imx8_dsp_runtime_resume,
-
-	.suspend	= imx8_dsp_suspend,
-	.resume		= imx8_dsp_resume,
-
-	.set_power_state	= imx8_dsp_set_power_state,
-
-	/* ALSA HW info flags */
-	.hw_info =	SNDRV_PCM_INFO_MMAP |
-			SNDRV_PCM_INFO_MMAP_VALID |
-			SNDRV_PCM_INFO_INTERLEAVED |
-			SNDRV_PCM_INFO_PAUSE |
-			SNDRV_PCM_INFO_BATCH |
-			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP
+	.ops = &imx8x_chip_ops,
 };
 
 static struct snd_sof_of_mach sof_imx8_machs[] = {
@@ -636,6 +240,7 @@ static struct snd_sof_of_mach sof_imx8_machs[] = {
 
 static struct sof_dev_desc sof_of_imx8qxp_desc = {
 	.of_machines	= sof_imx8_machs,
+	.chip_info	= &imx8x_chip_info,
 	.ipc_supported_mask	= BIT(SOF_IPC_TYPE_3),
 	.ipc_default		= SOF_IPC_TYPE_3,
 	.default_fw_path = {
@@ -648,11 +253,13 @@ static struct sof_dev_desc sof_of_imx8qxp_desc = {
 		[SOF_IPC_TYPE_3] = "sof-imx8x.ri",
 	},
 	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
-	.ops = &sof_imx8x_ops,
+	.ops = &sof_imx8_ops,
+	.ops_init = imx8_ops_init,
 };
 
 static struct sof_dev_desc sof_of_imx8qm_desc = {
 	.of_machines	= sof_imx8_machs,
+	.chip_info	= &imx8_chip_info,
 	.ipc_supported_mask	= BIT(SOF_IPC_TYPE_3),
 	.ipc_default		= SOF_IPC_TYPE_3,
 	.default_fw_path = {
@@ -666,6 +273,7 @@ static struct sof_dev_desc sof_of_imx8qm_desc = {
 	},
 	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
 	.ops = &sof_imx8_ops,
+	.ops_init = imx8_ops_init,
 };
 
 static const struct of_device_id sof_of_imx8_ids[] = {
-- 
2.34.1

