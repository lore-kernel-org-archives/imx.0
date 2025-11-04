Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D847D2F49FE
	for <imx@lists.linux.dev>; Tue,  4 Nov 2025 12:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762257849; cv=none; b=sqEAA8X2kQp0beS8ygIJh2X6ch0k5Gs15L2zgUJ/U9ASMe+dWLZ/3GtMHcFYvt5nZ+OWDm/0LEsZXM7xnoz1bv+kFs/3YUl2VcKWkG8jWnNxHKHRGPQzKn/73zJ8k2cN34N3RDDeCjR1MJOZyMm9Z5SuCPbxE5RyCK8hjEEKqbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762257849; c=relaxed/simple;
	bh=d7xwmEi0KnFnU6RGoU18XKBliBKtfnG1R0Qs2x25v9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R+xv4CIamlGSAEDLx0cWUG2qXBSt38El5di8AIOda6eSc5asvRSjV9CZf11iN4GYD5zqLnWEEMsiUuHVQcNNRRjPPsSoLOY+Qzdkha5oPomPGSLsjYaOGi3Nq5wXArG3mJFv43KcpdfUgM3hNIs5Hy1GDRE8vP8IKNp+r/njGdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RyaMwXYa; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RyaMwXYa"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b70fb7b531cso325189766b.2
        for <imx@lists.linux.dev>; Tue, 04 Nov 2025 04:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762257846; x=1762862646; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aafw4HLBs7KDKvmUtk2iQQvLgZcs98N6FosFfKLOmF4=;
        b=RyaMwXYaEgt4A36dRjeh9cLw6EEV/AaLkoddjJ2e5Eu0lZoQOq2dJSo6DHvL2Zrotq
         l5j311T6jYHbQPgeINq7f+g7rAf1wzZKgwqq0LIL+jP4068Pz4wUl/smd2+BopPnvQtC
         JFtP74zqJGAdhGpWLLcsEcO5dudlRjbOqeRB1vshg/fzYYMVv4oUgWrHmy0xBGTYm6jP
         6ZO6ed3VM8/+GfPkrpur7E5mbBlV3WeKSnI2jktTAg3uUyBA+piDVchoZRVfhcRJTfEX
         w/BYwjAsN9A/lHx5gCoWroHekYjVGaqTFtXMA2tMN3+hJklpG22UT2Aoj9sX7xbVklIY
         PUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762257846; x=1762862646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aafw4HLBs7KDKvmUtk2iQQvLgZcs98N6FosFfKLOmF4=;
        b=YmBgcDz9Im/FoMoOV3bJwTelNoXkmflNcebEp6MC10X7rOIKwMPAktX8FtdWcJxU3x
         uCEe+Edoi8IL4q4elYHsjM/gKRPjYBlu2rsu43jF3gZNsY8fUHZ3qAqVPAkit6MaXLNt
         9SzCugiWpNlgGCXoFQ1TkFaP3emRvlVSJOTLqWPUZ/ONnwoKPw1SKLJ1VC/MeqK1wVoV
         OND/tRyGsizGQjkvzgLJCJukZYTLOTTYFf+WdMcYDqNLcAMeZXTuqHZqbPD95Hv0np//
         1LTiCmxbk6G4MJ0DRnL7i5YU7LWdjHAaWbnzhzlo8n2Jc4Xtxt5+k0LPpOF0KG4kWqh0
         o1Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWQzSNPNetb9CcWiiTeMH/xhw5hLHHrTJwqQUq4cwALDYP9UxGEvtYs9FuSw+iLuO4Jv9E=@lists.linux.dev
X-Gm-Message-State: AOJu0YwwFwK4sovsfBCt1V2Rahcwu3tKsaGQt0TGn7NOrodBhQNItLa3
	ZkYZPQcKA8tNzfvHS0VCc8VfLuD5QQDi1N6Q/MLnsVOK3rPjDFKbPhqU
X-Gm-Gg: ASbGncvaOcDqZ5X1PMiiDM5olOpc+8BKV6b4ksnhAkEVeKRAraGRSoDn3JIPdR3AFsv
	hMFRSrrWPa0QpRvkXtOPWHKDEQUzuMomYflW/soCXMpYHFCHSaulxhsE5wBOfkvcNoGH9kW0MXd
	tWn28YgKbbdkSl6oKSJI2hncuU1+J6p7eGGe9rsTOkFZzMRiwjCYLQ1PYKK0vizXaJsZcs6EUB0
	k2O0S0M5Gvos9jKPz+SWTVAJM+qxsJFLJDl5XMaa9xIHk3fjzKg7qyTzj/KJnGLdo/Km9S6D1Li
	wskbwvqpihnZWiUfzOxh/wU2arcWsdukFNADYZscJ94fQ5DPDrTa1QL5eGP+E5jJ0K8gEy7hSnA
	NpEGku7HTeTZPYy4tE+BK/hX8CCIpgTuYXsROeBglbiCGc7McwVzCXqJ8umPkem9Q15HBJGFSzr
	J1F+pnXmJKxmG8ZdsCYp3aDPJB2Q==
X-Google-Smtp-Source: AGHT+IHeD+7pAL1LN+vGwVw7YenhruMsQ1qqYloFn0IzgJZ0tjNxTI+ZA1fCBUoZtXsnijqYIZ4NdA==
X-Received: by 2002:a17:907:da5:b0:b72:51fd:5a5f with SMTP id a640c23a62f3a-b7251fd62a9mr192609166b.1.1762257845988;
        Tue, 04 Nov 2025 04:04:05 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fa038e0sm200894166b.54.2025.11.04.04.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 04:04:05 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v4 5/8] reset: imx8mp-audiomix: Switch to using regmap API
Date: Tue,  4 Nov 2025 04:02:58 -0800
Message-ID: <20251104120301.913-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
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

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 93 +++++++++++++++++----------
 1 file changed, 58 insertions(+), 35 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index e9643365a62c..18a7f68aa59f 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/regmap.h>
 #include <linux/reset-controller.h>
 
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
@@ -42,8 +43,7 @@ static const struct imx8mp_reset_map reset_map[] = {
 
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
-	spinlock_t lock; /* protect register read-modify-write cycle */
-	void __iomem *base;
+	struct regmap *regmap;
 };
 
 static struct imx8mp_audiomix_reset *to_imx8mp_audiomix_reset(struct reset_controller_dev *rcdev)
@@ -55,26 +55,15 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
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
@@ -94,6 +83,52 @@ static const struct reset_control_ops imx8mp_audiomix_reset_ops = {
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
@@ -105,36 +140,25 @@ static int imx8mp_audiomix_reset_probe(struct auxiliary_device *adev,
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
@@ -147,7 +171,6 @@ MODULE_DEVICE_TABLE(auxiliary, imx8mp_audiomix_reset_ids);
 
 static struct auxiliary_driver imx8mp_audiomix_reset_driver = {
 	.probe		= imx8mp_audiomix_reset_probe,
-	.remove		= imx8mp_audiomix_reset_remove,
 	.id_table	= imx8mp_audiomix_reset_ids,
 };
 
-- 
2.43.0

