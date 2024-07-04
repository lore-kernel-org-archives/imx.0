Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4F11428F2
	for <imx@lists.linux.dev>; Thu,  4 Jul 2024 17:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113832; cv=none; b=Px+LBqBSAH9Ji6qoWo7m4yc5Sk+xgn7aYkYjFQPia4B6FY9WXHCDqqnou+M1BSlIs4Xlya7rsWGaBlQYVdqxvmsUrfPdRJuSpg+PfwSJMdHWJPvd92H/7oonho8/FdAtMFsqYNj66pJdQGVd3k7T/kyPt2V2NJaPvFsevvtKtis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113832; c=relaxed/simple;
	bh=AXOMZmt6S46YFRJErbndyKFAmqG6fzXUVqcz4xuQ2tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qvU4FGZJaVq9s6LmaCg/NxF68ZlxctsQm5DRs4zyX3ZtqhDV3sXNM0gZbpTvRv0ueP5FVV6ufHTkJfLYX31vxrBIkZFkFZDOiPje3ZrIAfR9KCoa3ZlzQ1Nnl2/WafYlZSIfZFqV/m9A2WYxdZvitV6+i5oMbof5rdqRoG3shSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RjQ0/1Ba; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RjQ0/1Ba"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42562a984d3so5649635e9.3
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 10:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113829; x=1720718629; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W+0aliNulAXRyPEDMGDv2VjbbbF1WfBGFJqmsV4Qtr4=;
        b=RjQ0/1BanojS7azCwZWAUe26/xaNX6weCyXN2oT1ean2Js39BoTx2qqF97UzlfWUhy
         ScfhbZ2nYYpYHe+Dd2vOPxjY9BOCQGzUtYvAUHtKBnKUjZlCSEVqBw3r2hy7ZulApoqf
         1DkUnv+I1LwRdAouEYv10k21zU+yVLNrC/JdUVR8MpD9hZfUmrXQvr+WZnLmsxk5NaJV
         z02x4M2Q/2X0URoEzRUBW514au7ZN8W7G8tU2uFZ9WHeMiRv/x/sY5L+j/oRiIBe1xgo
         bs9oygJH7UcD86BwqZ+EZLY2Yam2hV6QZ07XrPYGPsYx9xg823xM1le/rSubTFLOk15z
         M+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113829; x=1720718629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+0aliNulAXRyPEDMGDv2VjbbbF1WfBGFJqmsV4Qtr4=;
        b=DyJkggLsVHlCFlFN+ZZVu19y576f1inuf/HrOJrruAIRpzL5RgImBwr9sxx3QK24HK
         NVzahJ5qUIRuXGGm+4jigjZx268gaFs9JWCZqoVzbWqyBT4cwAH6YqLm10jDhK+5IzJS
         GRiHfTcN7hN1KOIqxkn/oij4U1bBcJSFQgWXmvVrPNXn5UcTb42sD2w+qg26Jl3Htw1o
         k2TxKO9eAihkYyMQosoyoIemIegPnvfHq2FVxRyrQBZ8A3FQ3MFhlefAmnr+prPMAELg
         mJAMEje4oyaxBZ8kFN/mH+oUSJ7GxQLxW8qJnGEPnKVPx05ceIgR0rNyx/8KNC987Ijq
         Lb7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWPAZQ+agIRqfePAEcsXmBQqvDpR5SmGa/Rh8eLFnesQq656F/Gr7eN9152YqdAZ2XPs3JnNGOvheLm45aj+2qFIEL6
X-Gm-Message-State: AOJu0Yy5BewL6UXMynFTgGVdL9q4ANXZpbruXNGu5mt0Q6CTzRigVFvB
	BeM8JicoNh1jTNs52E+zRtr3W/VvxnTOMkMazRO+kpORPIMo1XpB
X-Google-Smtp-Source: AGHT+IHa5BhDJFDyix5K8itu25mKAO+o92oPFVJcdlEdxK93UcrY5Y0/jYOh6tEheFkFp1NCVoGFeQ==
X-Received: by 2002:a05:600c:3b90:b0:425:65c5:79b4 with SMTP id 5b1f17b1804b1-4264a3f55f6mr15114615e9.26.1720113829362;
        Thu, 04 Jul 2024 10:23:49 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:49 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:23 +0200
Subject: [PATCH v2 13/24] mfd: rohm-bd71828: Constify read-only regmap
 structs
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-13-0c8785b1331d@gmail.com>
References: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
In-Reply-To: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, Xu Yilun <yilun.xu@intel.com>, 
 Tom Rix <trix@redhat.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Tim Harvey <tharvey@gateworks.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-omap@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=1911;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=AXOMZmt6S46YFRJErbndyKFAmqG6fzXUVqcz4xuQ2tk=;
 b=9iQxauCLJOP9HSJdseQBuXEwq1S2sUsM1z0w1yiASOG1r4aVhc5QMRCE9e57/9RYv+JRp62dU
 PllateXXr/GAw0YAxL7TAAYxKv6tuWlR+aixvjyRaqvaeSingyY4siH
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

The regmap_irq and regmap_irq_chip structs are not modified and can be
declared as const to move their data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/rohm-bd71828.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
index 5b4290f116fc..39f7514aa3d8 100644
--- a/drivers/mfd/rohm-bd71828.c
+++ b/drivers/mfd/rohm-bd71828.c
@@ -316,7 +316,7 @@ static const struct regmap_irq bd71815_irqs[] = {
 	REGMAP_IRQ_REG(BD71815_INT_RTC2, 11, BD71815_INT_RTC2_MASK),
 };
 
-static struct regmap_irq bd71828_irqs[] = {
+static const struct regmap_irq bd71828_irqs[] = {
 	REGMAP_IRQ_REG(BD71828_INT_BUCK1_OCP, 0, BD71828_INT_BUCK1_OCP_MASK),
 	REGMAP_IRQ_REG(BD71828_INT_BUCK2_OCP, 0, BD71828_INT_BUCK2_OCP_MASK),
 	REGMAP_IRQ_REG(BD71828_INT_BUCK3_OCP, 0, BD71828_INT_BUCK3_OCP_MASK),
@@ -407,7 +407,7 @@ static struct regmap_irq bd71828_irqs[] = {
 	REGMAP_IRQ_REG(BD71828_INT_RTC2, 11, BD71828_INT_RTC2_MASK),
 };
 
-static struct regmap_irq_chip bd71828_irq_chip = {
+static const struct regmap_irq_chip bd71828_irq_chip = {
 	.name = "bd71828_irq",
 	.main_status = BD71828_REG_INT_MAIN,
 	.irqs = &bd71828_irqs[0],
@@ -423,7 +423,7 @@ static struct regmap_irq_chip bd71828_irq_chip = {
 	.irq_reg_stride = 1,
 };
 
-static struct regmap_irq_chip bd71815_irq_chip = {
+static const struct regmap_irq_chip bd71815_irq_chip = {
 	.name = "bd71815_irq",
 	.main_status = BD71815_REG_INT_STAT,
 	.irqs = &bd71815_irqs[0],
@@ -491,7 +491,7 @@ static int bd71828_i2c_probe(struct i2c_client *i2c)
 	int ret;
 	struct regmap *regmap;
 	const struct regmap_config *regmap_config;
-	struct regmap_irq_chip *irqchip;
+	const struct regmap_irq_chip *irqchip;
 	unsigned int chip_type;
 	struct mfd_cell *mfd;
 	int cells;

-- 
2.40.1

