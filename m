Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6603D4879B
	for <imx@lists.linux.dev>; Thu,  4 Jul 2024 17:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113842; cv=none; b=MC9T+yGsD0Ko+YxefA/3FAjquK9C1kq4odZw462XpBVU8a5J94oNJS6tGcLC74qhga+oKK6kvCjhnm715c+jCj9EZ0etWNSnD8eHuj8ELVdKK24etU/UIzwTJUeyBYwkA0CWQgkd8UFL3jGZ3PqGiB1x8IuUD227PisxrbirQMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113842; c=relaxed/simple;
	bh=1DZ6ZNTYVH+qxDLzyvoRZYeRzU6/uB98HyF0NhspnHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d3xMT8DyBJrHnVftpheZ+yj5uFuNBV2uafHsDk3hlBnLQIOZYxfFtMRs4t15sF7jfYUEzFKOFdgns4sFpMuMXjbRZbmdGjE1/fB2ovAacMSdl5T+ce1FFGccMv/ZtBP14oM4u/wKBfaL4P90u0zbph0lHOHmXvBugcykFKuQZsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzsI+aok; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzsI+aok"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42564316479so5200305e9.2
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 10:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113840; x=1720718640; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qd0Z+TzoGuFE1UpjnOMV6kYTwv4UPS1xus6pH0CzaYg=;
        b=bzsI+aoksIeXIPMwDXIwHWYB5Ebzi6tSCWAssQTRvBsdf3NEYpP1SRA5FDh/iR8R8m
         b/m9O6XBLIoVVGET0IR3XtDLRwi/NoeTT46MFh55eqmj/9xHRNOrRjq6CxnvQja04GMG
         ij7CbQW9b6wXa0ECDMm9b6NeJogJMr/GZQFholdBBJ+MKf57tn+blV1QnF37PMsk0Jqn
         dvmMUg5O55QNIBNJquKxJthT5tqpGziksnQimmTrCXWFN7Dd4P+kZXAMFFqzvrLjDnwk
         SzY6LTUJ2FGgJa928WhZNWjTypbCRDHv9z8rnK7YP2tIkmZHlkEZghQeRvyqWRmGstT9
         orWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113840; x=1720718640;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qd0Z+TzoGuFE1UpjnOMV6kYTwv4UPS1xus6pH0CzaYg=;
        b=wgBpWO/4b7w47XEZsWvdGY9LeeARmIcwIGLUhCQANMH4ucwaSqHEc2AS0AnjXb2Phk
         xjhJkYll16kDo0ADQIS6ECJS8Q75nNwXuIfzcTDda44fPjPdsBeLVXzCJ+m+v0w+8hMT
         GwfDGQmdHtZnzM8h06lHYqpF+Llg53ZqL0FsoHngXPZL4GJJYGSX2Z1tL/Xc/VGCuC2I
         lf2g4IdZX8E0mXyDpfBd/MAdqVP+B4vg93Tegh1GwL+j2PzukTmMqBjYgcWr0TKEDR7Y
         gHLbaI8QeCPFcvryrsEmkpR3lGrWuSQGGnAgNyciopSvWPpxL0XHZlvqj0MDC0uNaenN
         Cafw==
X-Forwarded-Encrypted: i=1; AJvYcCWrIZbE8UV+bJ1HLeg/WI5RgjuvW7HeCBrHJC+08c6+5UKs1A6Yk3PyMyh0JRMD4YkZJ/d7kCOTxecstbrmPBqhDVL1
X-Gm-Message-State: AOJu0Ywyrnm6p3jQl92RkqFkzjOAyKReuDqckCCQbGvudoQWnc1oagh6
	xqR3gskvg/2lFxJoytvzoMaEY1y6lvPoZA6J6DKA8P96xoUM2tPs9kcB9FJH
X-Google-Smtp-Source: AGHT+IGYWITQkdRhz4qv8j9cI3alOIpaga9mU5l0rkDSHKoFzkIRNkCv3e6d3tLaPXkedXobbHSgCg==
X-Received: by 2002:a7b:cc90:0:b0:425:6510:d8ec with SMTP id 5b1f17b1804b1-4264a3dc1f4mr17296225e9.23.1720113839773;
        Thu, 04 Jul 2024 10:23:59 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:59 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:29 +0200
Subject: [PATCH v2 19/24] mfd: tps65910: Constify struct regmap_irq_chip
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-19-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=1513;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=1DZ6ZNTYVH+qxDLzyvoRZYeRzU6/uB98HyF0NhspnHM=;
 b=dPK+o8VSAHe74YFtYLhnBDMc4W755tD/h2MKv55jyOcgXfOx3RXMh2qTQTj258fzb6Genb0cq
 ujDkD/Nm7osDku+mrsg06AsIyvM2N44JYz8j9yIOK+zo4qzqPunMjZP
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`tps65910_irq_chip` and `tps65911_irq_chip` are not modified and can be
declared as const to move their data to a read-only section.

The pointer used to reference those structs has also been converted to
const.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/tps65910.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
index 8fb0384d5a8e..6a7b7a697fb7 100644
--- a/drivers/mfd/tps65910.c
+++ b/drivers/mfd/tps65910.c
@@ -197,7 +197,7 @@ static const struct regmap_irq tps65910_irqs[] = {
 	},
 };
 
-static struct regmap_irq_chip tps65911_irq_chip = {
+static const struct regmap_irq_chip tps65911_irq_chip = {
 	.name = "tps65910",
 	.irqs = tps65911_irqs,
 	.num_irqs = ARRAY_SIZE(tps65911_irqs),
@@ -208,7 +208,7 @@ static struct regmap_irq_chip tps65911_irq_chip = {
 	.ack_base = TPS65910_INT_STS,
 };
 
-static struct regmap_irq_chip tps65910_irq_chip = {
+static const struct regmap_irq_chip tps65910_irq_chip = {
 	.name = "tps65910",
 	.irqs = tps65910_irqs,
 	.num_irqs = ARRAY_SIZE(tps65910_irqs),
@@ -223,7 +223,7 @@ static int tps65910_irq_init(struct tps65910 *tps65910, int irq,
 		    struct tps65910_platform_data *pdata)
 {
 	int ret;
-	static struct regmap_irq_chip *tps6591x_irqs_chip;
+	static const struct regmap_irq_chip *tps6591x_irqs_chip;
 
 	if (!irq) {
 		dev_warn(tps65910->dev, "No interrupt support, no core IRQ\n");

-- 
2.40.1

