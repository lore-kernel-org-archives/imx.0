Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E71D3375DD
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 16:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769444536; cv=none; b=S751uIBm3NLJZzoE5O2Te9skE+/O8Yt/31Zo/uebqO7PnSZ9+wG/OFjnRlsv3uhMFxcKs8EGsZSjvDAoZlJI7xQ0R28LtT0VqgIvb0z1J4IDaR35XhhUclE7OPpSs0g/YnKNjMoY21Lt0pxotfOuGa0en47JhygeXcWxQbtornI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769444536; c=relaxed/simple;
	bh=yhPuiR6XrfoigONn7YjeXv5GIwSDKgMVMn3NKSqWbcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FCHll7V9meRpzX/u1wSqodZd7sOMDLSA56UpUo9uq0wIx63rEA8fdDWxCF87N00TOg0fOwe1khTTyzpKbRM20MXViw3JMZ8In7ntF3e29F5eoSX5dY4Yl6vVSfwuDeZEqtdVc22k9hq/Vyxmgjsp8M2dVOuZab8uaCl5k5ravqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cE/nVRZI; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cE/nVRZI"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47ee9817a35so35927535e9.1
        for <imx@lists.linux.dev>; Mon, 26 Jan 2026 08:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769444533; x=1770049333; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/PKuQqJhmcmf0FdDQDCr8/x7Yh0ZaImvK0r2Y0Qm/o=;
        b=cE/nVRZI1tj2wufAgxIc6xhmFMbwvHb0lhjbVveOPj7zzdFDV1QHxt+PQ5ysu5JnWd
         rEqbHQHANwhWcR/L5dNiH7cSGRs77X1nBN/jR/rZf8AdOQ7EXLqnI9ppJz4Ifl7IvwE2
         a5hdN9cODfvmfItyKKsuorV15sC8nNboMIkxGZ5b9ECKJX9K55DXfjveSxL5xMsDtbgM
         aEk8NIbLkPL0Af3pB7nSS4ge7Q3JyiFQV/I2d7cBPsHx97lgaOUwA6FYCr0VB17kDAFW
         h989Eczjs8cC4Fd5hFgkI1aP+9PCbWJhzyx3jEz2WZg78436Y404q/g24FKS+MZQGdhQ
         jHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769444533; x=1770049333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R/PKuQqJhmcmf0FdDQDCr8/x7Yh0ZaImvK0r2Y0Qm/o=;
        b=M3JhST9ubm6Z5cycLcMuWz9Dhj/qVoYXoEEhHeMUL4y3LoguYqAhUwm4VqGgGBv2LP
         drZP4fCHwRroEoLk8i3nSAbrJUqGyltZRYd6+eDbl5n8ORzwlc5B9M5o65WJOHXGu60Y
         hN4eLAYcIFr28TvaWyDpVGzEVJxUOr1lmF40rEP9YSuDFESch+Ond9RxEnzsQSNWl/P6
         pQAVTmiOzZEtHrGjKVoE9G+OJwK7E/T5I27pPMrnBWePyd4Cfbuh6938vy/EQ+PaOmL3
         AjIEyTOWLA+nIGTSpCZE+7/2LI+p67Qid5V5NmhkqIY75lubte4ZIumu5bI+2e/8frTe
         QSbg==
X-Gm-Message-State: AOJu0YxZNqTZG8RMRis4+ReyqIe7UcCR6NnbEyK/+nPAIBfDe2vp1Rga
	iR0zuIK5bv/Uc8UMw515lf5H+vrnixafOoy0O/2umhLbVgkH3OyfiWha
X-Gm-Gg: AZuq6aKVo7T266pQ4X6ItnX96ySnXk7OEy1ia+R7Tx2PZzNt8+EUQkhlXbcoc9Aecrx
	n26T2Ve1e0k/qBYtVgEXfEO0tO4QToOIfZ7LHV0PWgKEwE5SQdIscMuhdPfZY/TuuUNGFgFFGsC
	DyYWwEdUSpJgJyvo21izUEkoF/GOu5c2sKpNI4E8scYOmnS49kkI5XpPMOUxVGETFQe00vWC7kQ
	FOWuT+UwrWHi2T5WQb4fo1Hsfu8ZHPvUdRNA48ofDGcgHKUGNoRmS9gdaBveEDA7ETIHxQUW9GP
	/5Ck60M+4GXkf4bQZ314HHbgy5NrhiQWAp6XJ91+icEVRAlkwIfspUTm8SRsuysMm43piTSuPKQ
	5pow/OaFo4E3vRo3uebkDxQLlC1cJeOYCFqIHLUN27Bvau8omMvhzsuiLjmLCCDQoWd4vsoK//k
	QmJImW6Qe2yf7qfJsBAyo1n50iJ484fwXvhGYt+A==
X-Received: by 2002:a05:600c:6748:b0:479:2651:3f9c with SMTP id 5b1f17b1804b1-4805ce4e654mr79695865e9.14.1769444533295;
        Mon, 26 Jan 2026 08:22:13 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470cf1acsm370371035e9.14.2026.01.26.08.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 08:22:12 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v7 2/4] reset: imx8mp-audiomix: Switch to using regmap API
Date: Mon, 26 Jan 2026 08:22:01 -0800
Message-ID: <20260126162203.708-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126162203.708-1-laurentiumihalcea111@gmail.com>
References: <20260126162203.708-1-laurentiumihalcea111@gmail.com>
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

