Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AD2346A1B
	for <imx@lists.linux.dev>; Fri, 17 Oct 2025 11:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760700120; cv=none; b=omULYalAcscKmJ3o0sIj2lBHydqdpQt+FsyOvpt+JG5bs4Xk2CxiEkIM0Em/dMY0c6CUrex9PbibsBLrwWSyAmS8ugnW7ZJ2GWQmKbozUads8yR1BA4d3EjuwCKiSYd8tCu3/y/qrrCwqqihQXZM8CeHK5NDge2tkYreANuCgSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760700120; c=relaxed/simple;
	bh=reyT7epGuDbHKxj5CF2p8t32wHXo5XDRn4abwGmB+p8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lkgiTrPqzrVU6N3YBWlQEPYRQBj+EU6s10YDsGzCzWRN7wQa1e0SkXCp89bYhaPGXlBMqRNpnOhZUcjzXtVWICLTgYagfxlbLDDnyDiWDzePidWRj/8FBg/gC8RUvEgVm1xd/iU3yMvs4aNeC3AIBxF7yWm3pvEN3j3QLhHl9rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6+VTjrW; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6+VTjrW"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b48d8deaef9so349429866b.2
        for <imx@lists.linux.dev>; Fri, 17 Oct 2025 04:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760700115; x=1761304915; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xzm/FgKGwWcjtUv18XH1u/v0xKsrXzejWZqgQud6hqM=;
        b=j6+VTjrWhyjXXfTnOIiQA2H80z8j7u/bYDQyOLzXtBPrbO4FSSG1TURcvR8/SIPyfk
         AqxCx+kxKtBWf7O8tbF6smneU2zEEl5YyIZBhBEQ4hdR4TA8fXlI04bJg0wXzUdi2Vkb
         v+Kb+wqKIVJ7vZVV2zRhXls94/0xscJ6x5IvOODjQGlAMRV7SYYP4R9Wh+Gr/L4obIZK
         LF1VDDBvA+5X1m7obQNFa0cuiq6pJPnMg35M2rb8lprFXFlU9je4IGkQedug8Tl8qABu
         p4ukH1zSmYMNjfcGhFrGbFbta1RR1yY6cYbFWWft0D1wLYNo6mEdYKNC7cES3FUsKwBC
         hzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760700115; x=1761304915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xzm/FgKGwWcjtUv18XH1u/v0xKsrXzejWZqgQud6hqM=;
        b=P0ni6pAmyLuDIhF9gusBya//5Rk6wHSGvLwmIVtriwLOO2CmauA6otTOp99qiGE2cP
         UGNEj93xAP24Z/y4nM5oPdwLlWtz4S/J4iFiFG1zJ2b0yfilBr3qhU4PUR7F1Y6pgke3
         gwerJ4CqD2WYFISzxpznommTFF4JKf7FnIVsLOWJ+OFVSCTz+XYThbCKu2jiprMox9Ft
         Wpp6lBqYsHMPSxeO4b+k3DhzPHa7U4jM6SX+ERha+Eenh9/B0q6TneCwgTqWZrnsqv7H
         +AvwoBmguUSr5cdA3/IFz+jLrJ0+1B3IybhLIk+LHIn/tBBjoiKki0RzkMjWyrfWqdTk
         WFaA==
X-Forwarded-Encrypted: i=1; AJvYcCWEuMnc3tX03OLrofhQXEuyW12jZwgAWWwgbUSUugYhs4KB+UeWdrx1HIHuSnBPJf3ilMc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyHrr0/TQ6TdPtTr4pxMPsNu2fUl/6y59vl8EqkO66sRzf6hixa
	xxl4QiiX2sMjiJaQeHyMhkGsT1tf1bFZHbU/Cqkjq6ze7p4SawAlwkPH
X-Gm-Gg: ASbGnctyjjkREOS+ay7Gep29Ckgvvw3smqQXH7pN6Fg2MFW+BrjoC4YiiFXZew3UgR5
	rkblw2HDKP/KtgAJLb/nqeb26E56SzmhZ59diyU2hzPNnZvw3W/4viq8o8OEfodyoUZzYCjRv4X
	aM3tVICDI/KPnU2AhMZqe16UeyAHqyxmFP6wbW8isBqbGM2mhZzfdIvd11TSenVfdOuqKb6+3iI
	FRg/VINqbVk6aIgZN1eWDM3Hv6YNYnuErroj1zuObov9QFGZUzAJgWNstPvN7uAGl5XHD7umvYp
	sBOzLg47KNXmhgbt3ECpl7VTHika7p82CQKFEozFwtKLHDA7ir/veIdqCeZyEYQUE68PTMZammp
	tG17hvskEwd63Sjs3sYGn0c3zkCPpnypILCqaj7acrsPXVwgVCg5cMxaXVCJt3z5IlIQAIEvgFU
	CRLFstImlMZfvApP/nPqLWAp7KxNG7eBT46lKmXg==
X-Google-Smtp-Source: AGHT+IHbOMwzwvv5nUDzrBEiBFccEUf8uDKJMJplrGe4Op1dHXqciaqfLUTbrWYo3IymF5T3YQroCg==
X-Received: by 2002:a17:907:fd17:b0:b5b:3ab0:a5b7 with SMTP id a640c23a62f3a-b6473952023mr381066566b.42.1760700115096;
        Fri, 17 Oct 2025 04:21:55 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd1af35fsm788256166b.60.2025.10.17.04.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 04:21:54 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 5/8] reset: imx8mp-audiomix: Switch to using regmap API
Date: Fri, 17 Oct 2025 04:20:22 -0700
Message-ID: <20251017112025.11997-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

As far as the Linux kernel is concerned, block devices such as i.MX8MP's
AUDIOMIX block control or i.MX8ULP's SIM LPAV can simultaneously act as
clock controllers, reset controllers or mux controllers. Since these IPs
offer different functionalities through different subsystem APIs, it's
important to make sure that the register R-M-W cycles are performed under
the same lock across all subsystem APIs. This will ensure that registers
will not end up with the wrong values because of race conditions (e.g.
clock consumer tries to update block control register A, while, at the
same time, reset consumer tries to update the same block control register).

However, the aforementioned race conditions will only impact block control
IPs which use the same register for multiple functionalities. For example,
i.MX8MP's AUDIOMIX block control IP provides clock gating functionalities
and reset control functionalities through different registers. This is why
the current approach (i.e. clock control and reset control work using
different locks) has worked well so far.

Since we want to extend this driver to be usable for i.MX8ULP's SIM LPAV
block control IP, we need to make sure that clock control, reset control,
and mux control APIs use the same lock since all of these functionalities
are performed using the SYSCTRL0 register.

To do so, we need to switch to the regmap API and, if possible, use the
parent device's regmap, which, in the case of i.MX8ULP, will be the clock
controller. This way, we can make sure that the clock gates and the reset
controller will use the same lock to perform the register R-M-W cycles.

This change will also work fine for cases where we don't really need to
share the lock across multiple APIs (e.g. i.MX8MP's AUDIOMIX block
control) since regmap will take care of the locking we were previously
explicitly performing in the driver.

The transition to the regmap API also involves some cleanup. Specifically,
we can make use of devres to unmap the device's memory and get rid of the
memory mapping-related error paths and the remove() function altogether.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 95 +++++++++++++++++----------
 1 file changed, 61 insertions(+), 34 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index e9643365a62c..c74ce6e04177 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/regmap.h>
 #include <linux/reset-controller.h>
 
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
@@ -19,6 +20,7 @@
 struct imx8mp_reset_map {
 	unsigned int offset;
 	unsigned int mask;
+	unsigned int shift;
 	bool active_low;
 };
 
@@ -26,24 +28,27 @@ static const struct imx8mp_reset_map reset_map[] = {
 	[IMX8MP_AUDIOMIX_EARC_RESET] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
 		.mask = BIT(0),
+		.shift = 0,
 		.active_low = true,
 	},
 	[IMX8MP_AUDIOMIX_EARC_PHY_RESET] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
 		.mask = BIT(1),
+		.shift = 1,
 		.active_low = true,
 	},
 	[IMX8MP_AUDIOMIX_DSP_RUNSTALL] = {
 		.offset	= IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET,
 		.mask = BIT(5),
+		.shift = 5,
 		.active_low = false,
 	},
 };
 
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
-	spinlock_t lock; /* protect register read-modify-write cycle */
 	void __iomem *base;
+	struct regmap *regmap;
 };
 
 static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
@@ -55,26 +60,15 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
 				  unsigned long id, bool assert)
 {
 	struct imx8mp_audiomix_reset *priv = to_imx8mp_audiomix_reset(rcdev);
-	void __iomem *reg_addr = priv->base;
-	unsigned int mask, offset, active_low;
-	unsigned long reg, flags;
+	unsigned int mask, offset, active_low, shift, val;
 
 	mask = reset_map[id].mask;
 	offset = reset_map[id].offset;
 	active_low = reset_map[id].active_low;
+	shift = reset_map[id].shift;
+	val = (active_low ^ assert) << shift;
 
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
@@ -94,6 +88,50 @@ static const struct reset_control_ops imx8mp_audiomix_reset_ops = {
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
+	struct imx8mp_audiomix_reset *priv = dev_get_drvdata(data);
+
+	iounmap(priv->base);
+}
+
+/* assumption: dev_set_drvdata() is called before this */
+static int imx8mp_audiomix_reset_get_regmap(struct device *dev)
+{
+	struct imx8mp_audiomix_reset *priv;
+	int ret;
+
+	priv = dev_get_drvdata(dev);
+
+	/* try to use the parent's regmap */
+	priv->regmap = dev_get_regmap(dev->parent, NULL);
+	if (priv->regmap)
+		return 0;
+
+	/* ... if that's not possible then initialize the regmap right now */
+	priv->base = of_iomap(dev->parent->of_node, 0);
+	if (!priv->base)
+		return dev_err_probe(dev, -ENOMEM, "failed to iomap address space\n");
+
+	ret = devm_add_action_or_reset(dev, imx8mp_audiomix_reset_iounmap, dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register action\n");
+
+	priv->regmap = devm_regmap_init_mmio(dev, priv->base, &regmap_config);
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
@@ -105,36 +143,26 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
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
 
+	/* keep before call to imx8mp_audiomix_reset_init_regmap() */
 	dev_set_drvdata(dev, priv);
 
+	ret = imx8mp_audiomix_reset_get_regmap(dev);
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
@@ -147,7 +175,6 @@ MODULE_DEVICE_TABLE(auxiliary, imx8mp_audiomix_reset_ids);
 
 static struct auxiliary_driver imx8mp_audiomix_reset_driver = {
 	.probe		= imx8mp_audiomix_reset_probe,
-	.remove		= imx8mp_audiomix_reset_remove,
 	.id_table	= imx8mp_audiomix_reset_ids,
 };
 
-- 
2.43.0

