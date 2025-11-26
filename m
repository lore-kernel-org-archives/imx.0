Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C403271FC
	for <imx@lists.linux.dev>; Wed, 26 Nov 2025 12:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764160989; cv=none; b=VyQz4GarhY1EucjjZkqaJ6ah9l5J0kacCcDyLOAIgmPwyCTKG6eQY4uGceRA5tMPJp0vcUfoiliz3c9RZ6/7aWqBsRb4NzoSJFLF6H1tciuAU2Bl6yUzIFa+Unha3qKve0KMOfbf7RO/S7fMG3VGd1PDu29FUA0aZf+GOYYrW4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764160989; c=relaxed/simple;
	bh=yhPuiR6XrfoigONn7YjeXv5GIwSDKgMVMn3NKSqWbcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BovotoglE0DNPWt13Ku7j/k0pq/1fqbsDF0t4DTon5AOE28KQO2c47/lrcymnzmTcD3yh/xz2MiJxuTWPhou6DPib6eYp1cYb9gcFBGpj8TtD10n0BI92Ax7GpnwXYyomV50hE8Fx4J4paLca9V+IJEU7UW6W7Rw7nIKFemASeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVAdwy+G; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVAdwy+G"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-63c489f1e6cso1284196a12.1
        for <imx@lists.linux.dev>; Wed, 26 Nov 2025 04:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764160985; x=1764765785; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/PKuQqJhmcmf0FdDQDCr8/x7Yh0ZaImvK0r2Y0Qm/o=;
        b=LVAdwy+G5pu1W31nz2dOeD2yaz+UDomx13AJ1kOSH/s/6wxGZU3cDzhIKhBPtYUI91
         IBA7hMM8eGPmUfcNUE2oHl6F7hVRZgqe0nok85ZRe6f56muHh09Z04k/0HVelN/WOq1K
         6YKcHrDPd/70/NFWknEcwVmgSeO4OMPIL365UtnseezMnALB9QbBQVvJ2FH5Hkq/ONlO
         aCgDbzIPU20Ee36ImbmmdzrpQ+wSl6qtbUCVhteV9Ha8l2h3zuP/jci+KXgxrh7QKE5y
         fZ9gT6kQDaThu89ni/lSkN/g4DY4qzpkAIWdZ7NPz3TH+0bwR8YKhFS+LWDBRbE3mCp1
         38GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764160985; x=1764765785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R/PKuQqJhmcmf0FdDQDCr8/x7Yh0ZaImvK0r2Y0Qm/o=;
        b=qCcGZQ06ubJg4SdRp9leor1ZqcinNlHDjW6klxGK4+5yg/Ugnbj4P5nCRWq0OaB8Av
         4BpMICl4/1N6o20u1LMN9VCoMQj/iPvNnVLY7BcViY/zMbh6X3x1udOfchAz15zhJQvO
         x9oWW5GvghFLGw8R9lOKXhacx63A37aFn0Iq8xIy93OISvgigk5Sj6PAFIpfckbIDJfg
         /0tVyfWL9lfL+sdkKCi1q7W2Zw1RNEWGYriKJ1BhibB0sq4K3DcxnKGHka3ww8VxO5e7
         2uHCd3jsAmiRFp/oMg7KTDEAPbox6j2TwNbCgmaBFmrf8MMybwHeUA7II7wvFRJIXPk5
         LMbA==
X-Forwarded-Encrypted: i=1; AJvYcCUFx0XwfbCokzFjl6fNgp6dOBqwfo3vCihfdlJHnYKqfyg1YwncoQBDgMZU2C6oIo3nkog=@lists.linux.dev
X-Gm-Message-State: AOJu0YxEiMbUqhqd7gaIarmKnvkbQPUNUQ2fl0NqS+MjaYoJ8uEGRvYx
	3PpGk/i3U38MjEMgTBxamsmcditBaz72Tr9iZ06svTur2CviR0O0D5I6
X-Gm-Gg: ASbGncuKzglqLSHlgJQr/ggK3ZTiB+4hC+r2sTspvWK1x7cSDQ+KukHUyk+Yu0Xzz2H
	/Lbr4VK88ZBPA5QF1U+4UW8rBjFAxXrSCBXJsgi7IedEeDhuxrBHC+30AAADF7p1Xienn/nUP73
	eYjvFniZ+1eH0v9YMfrE/sCEyKAqtaAUMZk8xAsUH86HwKLdn2tvbCv/a4UF1O7PqPAL5Vnuysk
	gSM7fGatu9IVl7TCY0box/pQxZ/9K5V+yixDFCn+l1jq+YNIELJa6bPiR6PRYKdQjfJccRsXJu/
	8E0ke3GlGM0fyWPMbYKvut2x2lqg6kB+4rIJ/D8tFjcocZqIFNCPfZupVpqxK3SbR3UQ+uUXI1u
	YIrUl5gJ/2MU25GYq35WK6wkr7YhrxnKIdfrS111EItnWpEL2F4RIqiNTO5zAYSi7paNNjA2+jM
	IpT5XwOvXb6zMsM0nXIYx7hU1qm9p3qxpk2AFF
X-Google-Smtp-Source: AGHT+IE/BZ0ev8jczVI6ig5ZypcAIr/hIiYi2tdzGsQKsQ4dJMO7/o1MUW3qqxHJXJn1yXPjYPs2Yg==
X-Received: by 2002:a05:6402:4499:b0:643:130b:c615 with SMTP id 4fb4d7f45d1cf-64539639594mr18794499a12.6.1764160984613;
        Wed, 26 Nov 2025 04:43:04 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536459d92sm17654824a12.31.2025.11.26.04.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 04:43:04 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v6 2/5] reset: imx8mp-audiomix: Switch to using regmap API
Date: Wed, 26 Nov 2025 04:42:15 -0800
Message-ID: <20251126124218.803-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126124218.803-1-laurentiumihalcea111@gmail.com>
References: <20251126124218.803-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Switch to using the regmap API to allow performing register operations
under the same lock. This is needed for cases such as i.MX8ULP's SIM LPAV
where clock gating, reset control and MUX-ing is performed via the same
register (i.e. SYSCTRL0) and different subsystem APIs.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 92 +++++++++++++++++----------
 1 file changed, 57 insertions(+), 35 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index acfa92b15329..f6152c0cc5ff 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/regmap.h>
 #include <linux/reset-controller.h>
 
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
@@ -43,8 +44,7 @@ static const struct imx8mp_reset_map reset_map[] = {
 
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
-	spinlock_t lock; /* protect register read-modify-write cycle */
-	void __iomem *base;
+	struct regmap *regmap;
 };
 
 static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
@@ -56,26 +56,14 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
 				  unsigned long id, bool assert)
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
-	void __iomem *reg_addr = priv->base;
-	unsigned int mask, offset, active_low;
-	unsigned long reg, flags;
+	unsigned int mask, offset, active_low, val;
 
 	mask = reset_map[id].mask;
 	offset = reset_map[id].offset;
 	active_low = reset_map[id].active_low;
+	val = (active_low ^ assert) ? mask : ~mask;
 
-	spin_lock_irqsave(&priv->lock, flags);
-
-	reg = readl(reg_addr + offset);
-	if (active_low ^ assert)
-		reg |= mask;
-	else
-		reg &= ~mask;
-	writel(reg, reg_addr + offset);
-
-	spin_unlock_irqrestore(&priv->lock, flags);
-
-	return 0;
+	return regmap_update_bits(priv->regmap, offset, mask, val);
 }
 
 static int imx8mp_audiomix_reset_assert(struct reset_controller_dev *rcdev,
@@ -95,6 +83,52 @@ static const struct reset_control_ops imx8mp_audiomix_reset_ops = {
 	.deassert = imx8mp_audiomix_reset_deassert,
 };
 
+static const struct regmap_config regmap_config = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+};
+
+/* assumption: registered only if not using parent regmap */
+static void imx8mp_audiomix_reset_iounmap(void *data)
+{
+	void __iomem *base = (void __iomem *)data;
+
+	iounmap(base);
+}
+
+static int imx8mp_audiomix_reset_get_regmap(struct imx8mp_audiomix_reset *priv)
+{
+	void __iomem *base;
+	struct device *dev;
+	int ret;
+
+	dev = priv->rcdev.dev;
+
+	/* try to use the parent's regmap */
+	priv->regmap = dev_get_regmap(dev->parent, NULL);
+	if (priv->regmap)
+		return 0;
+
+	/* ... if that's not possible then initialize the regmap right now */
+	base = of_iomap(dev->parent->of_node, 0);
+	if (!base)
+		return dev_err_probe(dev, -ENOMEM, "failed to iomap address space\n");
+
+	ret = devm_add_action_or_reset(dev,
+				       imx8mp_audiomix_reset_iounmap,
+				       (void __force *)base);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register action\n");
+
+	priv->regmap = devm_regmap_init_mmio(dev, base, &regmap_config);
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(dev, PTR_ERR(priv->regmap),
+				     "failed to initialize regmap\n");
+
+	return 0;
+}
+
 static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 				       const struct auxiliary_device_id *id)
 {
@@ -106,36 +140,25 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
 	if (!priv)
 		return -ENOMEM;
 
-	spin_lock_init(&priv->lock);
-
 	priv->rcdev.owner     = THIS_MODULE;
 	priv->rcdev.nr_resets = ARRAY_SIZE(reset_map);
 	priv->rcdev.ops       = &imx8mp_audiomix_reset_ops;
 	priv->rcdev.of_node   = dev->parent->of_node;
 	priv->rcdev.dev	      = dev;
 	priv->rcdev.of_reset_n_cells = 1;
-	priv->base            = of_iomap(dev->parent->of_node, 0);
-	if (!priv->base)
-		return -ENOMEM;
 
 	dev_set_drvdata(dev, priv);
 
+	ret = imx8mp_audiomix_reset_get_regmap(priv);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get regmap\n");
+
 	ret = devm_reset_controller_register(dev, &priv->rcdev);
 	if (ret)
-		goto out_unmap;
+		return dev_err_probe(dev, ret,
+				     "failed to register reset controller\n");
 
 	return 0;
-
-out_unmap:
-	iounmap(priv->base);
-	return ret;
-}
-
-static void imx8mp_audiomix_reset_remove(struct auxiliary_device *adev)
-{
-	struct imx8mp_audiomix_reset *priv = dev_get_drvdata(&adev->dev);
-
-	iounmap(priv->base);
 }
 
 static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
@@ -148,7 +171,6 @@ MODULE_DEVICE_TABLE(auxiliary, imx8mp_audiomix_reset_ids);
 
 static struct auxiliary_driver imx8mp_audiomix_reset_driver = {
 	.probe		= imx8mp_audiomix_reset_probe,
-	.remove		= imx8mp_audiomix_reset_remove,
 	.id_table	= imx8mp_audiomix_reset_ids,
 };
 
-- 
2.43.0

