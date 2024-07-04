Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2BD13CA99
	for <imx@lists.linux.dev>; Thu,  4 Jul 2024 17:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113828; cv=none; b=f+7aGjsyMBvLdLOAzY+HaeBpopuk2QyGFpxNPlawiz2Ra1wzobLJkai2/p67ay+2c4UrTL7oP9ngbsaYe1TCL56LepkXss9ix/idC29S56veSRLI4eUTlPj/hiX5AAi200UY+qzvNv+MvNPQLhIF8xMRec6l2dze2yVA/inPv3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113828; c=relaxed/simple;
	bh=iaBF13NOr1XPkiRrsRFdEpI6lgqiWVNSRbGWT5OqpFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KkTqbPpjrHIE7+ZOOI+sc8EtOCnrQ3yU0dnxqyqf/4vZ6/+D3yUmM0Asgop5hIvoiE6teUyjPL4KtNYyJfeYG4BblcKmqgVtdJUz7zilmSD1HU9pBF/LdlgSlx7q+GdlmpD/WygEYGYZJbN+8647vuY/jYOjzDx56wuYNtelYeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=juf3aQoZ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="juf3aQoZ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4257d5fc9b7so7323515e9.2
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 10:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113824; x=1720718624; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IpaImdJvWvSJvjBxL7f9lYNmbsKrZex9zQVuWAEj5kU=;
        b=juf3aQoZc4VXXRukkX6UrgHOF7YAyfyx5kV0OP8eeSyAcZLnoZ2OJs3nTI/q2n9Kfb
         VItv9erpJaur+5L0L2p1dIl2h22YXnpMsS28Gz4XJs9uq6MNYtX1n5nxlQDkX394eRKq
         UfkZTDs1xY0yfqqzzkxUdydFZgtXmX9qbpMCoFk/pedKADvCqoQLsIfXEoSzn+2camse
         yqWwVHktKdqlSvqWx3heumi8TYMUMURK1lj0aSCaxdLaQsGmqKnv27rkqQ/jnEMf6fB6
         xLrjvC7RbhDTsS3uFdMCPa8B31A6ZB36zSJZ1EgLvhnRKjIyeAdTkGQ9zDH9HYaSXEf9
         pwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113824; x=1720718624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IpaImdJvWvSJvjBxL7f9lYNmbsKrZex9zQVuWAEj5kU=;
        b=Y68Lq67CLl/FM75wRvUszGbDLkkhy+kRw4agwqUIVsdR/scfxYZp7tzt2/G5HIgpKM
         JN2AffJYU1y4B2dztbqUO5f3VMHdpe5RyGbr3ZvcpFMdW3W0wIuXraKIHzlniaXhZi0p
         XZpcNs/0g3wSZShYGDCMjBGjWW6wTk5l7siXVv4DqjyLW7XfSdAnlZ1CcMhaZ3GEoueC
         i6KXbwhkGzMavOXpVlZmvqsb1xN+iXlxOqbogLcyDnh6+uIZRq5kG5HK/fl27YuPzRDU
         wXQJL0VWzyqZfn7MQwnpZ+5YfRARk/Yw7SnclbR19XJoQnz7GPwrmGRutEKSyzsPMYoE
         1jrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQ3o7IRKM2/vF1I93iFEPEPAilzr0qw9sJ2S5Vj57BsFEV1lSy7b4cG/1MfaUJRH/WPkL3zFM2KyJedQh51nUZO/Aj
X-Gm-Message-State: AOJu0YxYjgiJOjYCVpIrvbggbkbJI421dI2eEySWR0bTpVdo/v3ljyqN
	b1K0ZvNViq6dQnOnNUptkE2gzScxQTsx2oCH0/sFVpbqNxgYPDEr
X-Google-Smtp-Source: AGHT+IFn70SGfz/PbRUH9kwgyz1pEDMFMqDPHavxrHHe4NlUGcp5CAuaBhl0qng6xKy8CAZYdYP57w==
X-Received: by 2002:a05:600c:4b98:b0:425:672a:769a with SMTP id 5b1f17b1804b1-4264a3f2fb3mr23812065e9.31.1720113824428;
        Thu, 04 Jul 2024 10:23:44 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:44 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:20 +0200
Subject: [PATCH v2 10/24] mfd: intel_soc_pmic_bxtwc: Constify struct
 regmap_irq_chip
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-10-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=2909;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=iaBF13NOr1XPkiRrsRFdEpI6lgqiWVNSRbGWT5OqpFk=;
 b=evJMf6OIRqyV5kGTNmMo9WHWYOfq2aTbuW+ej5rXKo6Qc84a4dZXpK4NYNxGCz1WuhNEbB4fV
 gxG99rFE7KKAcJ8S/aDLRbzGUme5K8p4FroKeVs+Dfm160Xl0RFIMEI
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

The regmap_irq_chip structs are not modified and can be declared as
const to move their data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/intel_soc_pmic_bxtwc.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/intel_soc_pmic_bxtwc.c b/drivers/mfd/intel_soc_pmic_bxtwc.c
index ba32cacfc499..c07a01c85a46 100644
--- a/drivers/mfd/intel_soc_pmic_bxtwc.c
+++ b/drivers/mfd/intel_soc_pmic_bxtwc.c
@@ -138,7 +138,7 @@ static const struct regmap_irq bxtwc_regmap_irqs_crit[] = {
 	REGMAP_IRQ_REG(BXTWC_CRIT_IRQ, 0, GENMASK(1, 0)),
 };
 
-static struct regmap_irq_chip bxtwc_regmap_irq_chip = {
+static const struct regmap_irq_chip bxtwc_regmap_irq_chip = {
 	.name = "bxtwc_irq_chip",
 	.status_base = BXTWC_IRQLVL1,
 	.mask_base = BXTWC_MIRQLVL1,
@@ -147,7 +147,7 @@ static struct regmap_irq_chip bxtwc_regmap_irq_chip = {
 	.num_regs = 1,
 };
 
-static struct regmap_irq_chip bxtwc_regmap_irq_chip_pwrbtn = {
+static const struct regmap_irq_chip bxtwc_regmap_irq_chip_pwrbtn = {
 	.name = "bxtwc_irq_chip_pwrbtn",
 	.status_base = BXTWC_PWRBTNIRQ,
 	.mask_base = BXTWC_MPWRBTNIRQ,
@@ -156,7 +156,7 @@ static struct regmap_irq_chip bxtwc_regmap_irq_chip_pwrbtn = {
 	.num_regs = 1,
 };
 
-static struct regmap_irq_chip bxtwc_regmap_irq_chip_tmu = {
+static const struct regmap_irq_chip bxtwc_regmap_irq_chip_tmu = {
 	.name = "bxtwc_irq_chip_tmu",
 	.status_base = BXTWC_TMUIRQ,
 	.mask_base = BXTWC_MTMUIRQ,
@@ -165,7 +165,7 @@ static struct regmap_irq_chip bxtwc_regmap_irq_chip_tmu = {
 	.num_regs = 1,
 };
 
-static struct regmap_irq_chip bxtwc_regmap_irq_chip_bcu = {
+static const struct regmap_irq_chip bxtwc_regmap_irq_chip_bcu = {
 	.name = "bxtwc_irq_chip_bcu",
 	.status_base = BXTWC_BCUIRQ,
 	.mask_base = BXTWC_MBCUIRQ,
@@ -174,7 +174,7 @@ static struct regmap_irq_chip bxtwc_regmap_irq_chip_bcu = {
 	.num_regs = 1,
 };
 
-static struct regmap_irq_chip bxtwc_regmap_irq_chip_adc = {
+static const struct regmap_irq_chip bxtwc_regmap_irq_chip_adc = {
 	.name = "bxtwc_irq_chip_adc",
 	.status_base = BXTWC_ADCIRQ,
 	.mask_base = BXTWC_MADCIRQ,
@@ -183,7 +183,7 @@ static struct regmap_irq_chip bxtwc_regmap_irq_chip_adc = {
 	.num_regs = 1,
 };
 
-static struct regmap_irq_chip bxtwc_regmap_irq_chip_chgr = {
+static const struct regmap_irq_chip bxtwc_regmap_irq_chip_chgr = {
 	.name = "bxtwc_irq_chip_chgr",
 	.status_base = BXTWC_CHGR0IRQ,
 	.mask_base = BXTWC_MCHGR0IRQ,
@@ -192,7 +192,7 @@ static struct regmap_irq_chip bxtwc_regmap_irq_chip_chgr = {
 	.num_regs = 2,
 };
 
-static struct regmap_irq_chip bxtwc_regmap_irq_chip_crit = {
+static const struct regmap_irq_chip bxtwc_regmap_irq_chip_crit = {
 	.name = "bxtwc_irq_chip_crit",
 	.status_base = BXTWC_CRITIRQ,
 	.mask_base = BXTWC_MCRITIRQ,

-- 
2.40.1

