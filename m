Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341983559F0
	for <imx@lists.linux.dev>; Wed, 29 Oct 2025 13:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761746176; cv=none; b=g7TexNpTQ2PV5HGx7VKUcP7P4mZ83uORr8qJvFFdSVq0CHTKOoA2wTBaibKtCwIGPcYDjAEKfclFjbYJGOoUpyQZuxexnR3iEcV1wkoKhISb57gd0IDbY32EDKJmUh1XaGYA+5J3G0pzkTMIx7bFJn7kjPz8FFfJALFhREAXlXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761746176; c=relaxed/simple;
	bh=jQqYazffawvob92GlM5kKbR1nnskRDKAjAEl8i3gy7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jyk+50ZYzZXJHIZ9a/l8sXwACDYgtNICI9dzNYBKnzIAc6xnv6ZuJAOO3bdTjYl9xP/bB+7fv+p1tNCjFVVxK523sNEwqQ6wzL8/SbAslutNHDvf2FSIDyaxNLKtbwpLNHJpJKvkF1IR7aZ5tTzJn8XWP8iOJef8fIVlSz9Ti6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhayeWpR; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhayeWpR"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b7042e50899so165074666b.0
        for <imx@lists.linux.dev>; Wed, 29 Oct 2025 06:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761746172; x=1762350972; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N0zuCkqo/yYV3kQ7MqBUgd3ahReWAttM1hFVGag3dBs=;
        b=IhayeWpRwVs1f46Bz36VdsxCgHzV33mAEQtqm8P3y5+dBubJhoyadQBNjkCV0whHqD
         xpZpSQfc5oCep1S8JizNgSWWF6AlrNY7cpQqWzVyy+6FNj/KgaseF7SDwfsf034Aym4F
         aVhpIhhsTS1fC1brOrIHQUA8cGClHmW29D2eFnMVUl9qpA08nb7hwikYYVlqD+7iTTBg
         kLkwmdZ9yBRAIZUlE4OJ7g2XcnHfXqQSVAM93f1gXoN4WP8RW4YZAITTT9NjTnhy8VjH
         Pl7CHajyNDrQ6Hik69+j9dAnIRlRL7kb7YWX0oUZngSe8k+px+G6Lgp3TgBqo3gX3oML
         DZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761746172; x=1762350972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N0zuCkqo/yYV3kQ7MqBUgd3ahReWAttM1hFVGag3dBs=;
        b=qCoew5YtD8fj5DaWAUXz4kuX84qD6Ziqfxyy/SqwIst4VJKYYI55rHsWt3IA6LsSqD
         maTdBpc3CO9DxSKllKYfouxY7IY3mZ/AL8xaVwZ7L3ibMWNCOHU5OGcrUm4vFPsr0OG2
         tAQE1CTvQl34g9TwMd8hUUqV+tbHefuPIUuxu2S1c24x4PXx5UvW89nYagQl8dKwrJfj
         oaro50LyDkJtRh85SHG2cg0oldRksIJLD4ckl50HwrxM6rbnZEdTlQuqxvASy7FhKvlX
         Uwu8vPmtO5UcLCVe/zEMxU8j/eFa6oFA/eThCjOw+cBfeTWqtR2YyMt6lDx1jQ3ayjh9
         W9+w==
X-Forwarded-Encrypted: i=1; AJvYcCWEFuYagHMIjaA+3ap/wGFLM8nRui8jiKNovgC8oHfFW2tfsw8UDkf64Adxb0cdCh/13OI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyRX9NzWBjjpTvWvlxFB7Sx+UXwVAWrHwIT7aWf4OOsASlbXJWX
	v/w8HBo2O7K3JgPcVwG0MeqA/ZlU8j/lgPVtYSn0OIZY82PqAykBRKsPQTtNuhmInuI=
X-Gm-Gg: ASbGncv2X9xxaq2qEXKaOD9HLwUtsXN1hgNw1F3s4E/YaFHhSePisT1XPy4GvsgeeVq
	52Sn4Lhnh+TBzaCAIEKJmP7n7gFrLup5fUuhCHxrQY0E5W57xbXOrLQiqA5hShM1C1t3VFXnKRw
	Jt8M+9vzuDH9pJlU4rHRdwZ7RfjXFGDF91WQnFkG57zMKOuTJMS+7ukn/kj6jiOv0fgscJgEY8V
	JxhmLm6wxjrggONRkd1mpMPb7K9bJSqRq+kq8uJsYdPv3AMsOP9O4BJhf6q+U3oDBcP2puzmIId
	szt7A4hV81infxLuCx9+VQQW4MbciaMJhfzvDTkuErECkqqCtO9WzTBnIMSn/LAuzcXfLZM9WC2
	ikp+m8nr2Ezy1cXwepg1/VkGAH+ysY+0Ku+fx7/baS47+mm4ZwNgBtt6rG7NoxiyiorGju//Fei
	Fdth6MZKAwG1wlCnDBFDBhatOybw==
X-Google-Smtp-Source: AGHT+IGpy31yKKECPj1bORsOgXUH7I+UUx6roxhBJ/s8FggZAtznwZBysb24BP9NWSkwCSGcK2OCoA==
X-Received: by 2002:a17:907:96ab:b0:b46:8bad:6972 with SMTP id a640c23a62f3a-b703d492f2cmr271816166b.38.1761746172314;
        Wed, 29 Oct 2025 06:56:12 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8534d99dsm1444960766b.21.2025.10.29.06.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:56:12 -0700 (PDT)
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
Subject: [PATCH v3 5/8] reset: imx8mp-audiomix: Switch to using regmap API
Date: Wed, 29 Oct 2025 06:52:26 -0700
Message-ID: <20251029135229.890-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
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
 drivers/reset/reset-imx8mp-audiomix.c | 91 +++++++++++++++++----------
 1 file changed, 57 insertions(+), 34 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index e9643365a62c..3f6d11270918 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/regmap.h>
 #include <linux/reset-controller.h>
 
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
@@ -42,8 +43,8 @@ static const struct imx8mp_reset_map reset_map[] = {
 
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
-	spinlock_t lock; /* protect register read-modify-write cycle */
 	void __iomem *base;
+	struct regmap *regmap;
 };
 
 static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
@@ -55,26 +56,15 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
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
+	shift = ffs(mask) - 1;
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
@@ -94,6 +84,50 @@ static const struct reset_control_ops imx8mp_audiomix_reset_ops = {
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
@@ -105,36 +139,26 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
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
@@ -147,7 +171,6 @@ MODULE_DEVICE_TABLE(auxiliary, imx8mp_audiomix_reset_ids);
 
 static struct auxiliary_driver imx8mp_audiomix_reset_driver = {
 	.probe		= imx8mp_audiomix_reset_probe,
-	.remove		= imx8mp_audiomix_reset_remove,
 	.id_table	= imx8mp_audiomix_reset_ids,
 };
 
-- 
2.43.0

