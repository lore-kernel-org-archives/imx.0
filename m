Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C556612EBEA
	for <imx@lists.linux.dev>; Thu,  4 Jul 2024 17:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113820; cv=none; b=CbpyArXN3BW0Vc4PW6Bm6UafhvMC92Alz7QIiyy5T77wUylJBxAxVRdNUO8vJ7I8mxJisDQs4sgzHuc+Zuo+lC35k/soyCbJLnoUcnBqJbMB8QzDjwc8GHfS9xPeHapKXYgki2FnAA/vUTJi3j2TOqZRbuBM4pLPy6ywqgPbCpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113820; c=relaxed/simple;
	bh=pfp5RcagdNcIGe1QQNjVuwzMf32RmDK/Hd4QnG6Cv0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y7lzsoJSnRLj9Fw6iWpkk8xd2tjRAhbzps8QLUG4VanEFutHJiy8u4rduvSHf8kGmhzC/1YVXhCvjrgPGf3wF/gDTqBIKcNmOHCqBNW0MI1OCiRXp0mrg+0qMWtxaQ4R5yVKmFZw6BTYnOderFFa87xI29MPW82waVho7gZ3hb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpbiEKOM; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpbiEKOM"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42573d3f7e4so5684765e9.0
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 10:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113817; x=1720718617; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UV1ltKTKaW4yZCRIt1PBVlpTJKfjEFuyvDZdCLF6YdU=;
        b=SpbiEKOMxHg0WDk6YohPP9e2l07cJexq8uPerYrZNM8nvqdamIxwkjfc4uGvOKrv/Q
         s1eOYh9EpfPWww+blqyNhIHm7zpLLR3uIM3cfhtKJ6H34mTYoR/FTZFUe1KJu8UAziaQ
         JnBbOfrAyTmTceujWBNe8g3fI0TMdq1VMjH+Mr1I4WFGg9YWuE6hYdDCvAaZtqnu0MZd
         XtEcmq9s7ZvvqgX5n8uu2t0IjqTKbKODxNsQZUa4ySyrXcjHfAMHF2RgLv7wxs+QXymP
         clSgohqrCgHpZtg++cLpI3lFCFpTA0KZ37NHhziCoqMsFGMf+W7d+U+xGfMkxosTRRWE
         Truw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113817; x=1720718617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UV1ltKTKaW4yZCRIt1PBVlpTJKfjEFuyvDZdCLF6YdU=;
        b=AfruBbo1Pag/CHVQY8ofrceSmmixnolzg1k+lCspDG5E4iG/khkmAdHOGw81rknUfY
         AN15/8sZOvPN3YkN/XaS2hpPvcpso7RPvPJSMeT1P+JkTxtnsn5KMWfpcpmBPJSacJ5S
         p7r5UTSS7L8fxxGN4/VvvBKt3Ujp2vo89bNlG91li4H9aISvEh2n5eVD0mvaS5ZYQ2A6
         ruzB+ZKqVAYgodWPalhyF8TkAaZ1ZkenRULTHQ5x4SDptq3SuMwckk56p1iFCTyG/QTT
         oYkHQp665YiU+otw8QLZ3PAyC9mbwD6mCIEumJmS2m1QGeT1414BWQKDif2jlgu+heCS
         tTJA==
X-Forwarded-Encrypted: i=1; AJvYcCUA5O9KvnYFtwJYVB8Mvg+UqYQsCwHEL6WqQKCZhrX3NDkVB0GYekSQSThOAWm/+DvWFHFc1TV1BhbSTy2nx1Ic+pqR
X-Gm-Message-State: AOJu0YxW6cygHvhCyLjMUbTV0HnDRkHgsV2/nQcBZzKsu85oQlq4nMez
	1KezyNP5wuTczzNgm2/SxhWdQHPFoGTw29GWSA26MApIYjG3EaZ6
X-Google-Smtp-Source: AGHT+IFayGbOWU2NuV+LVeotJFd37Zf8oQyJqVq2J1/NgNQICLpdvZCrbJvr8r1EBe2/OU/bDuu7Ww==
X-Received: by 2002:a7b:cd05:0:b0:425:7c29:7480 with SMTP id 5b1f17b1804b1-4264a48cb74mr19709845e9.38.1720113817105;
        Thu, 04 Jul 2024 10:23:37 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:36 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:16 +0200
Subject: [PATCH v2 06/24] mfd: rohm-bd9576: Constify read-only regmap
 structs
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-6-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=1538;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=pfp5RcagdNcIGe1QQNjVuwzMf32RmDK/Hd4QnG6Cv0M=;
 b=7Fa3AFgLDuDESYIOxUfDUDhsjrx89iv7ob0w7RkVM53841DbBwwV/uqHvUqzzinL++/HsfgdT
 gBovMDhBC40Cjpvl23ffJlzByWK0PUy0vzsA7WqG0uxz1GWcaPQA81G
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`bd957x_regmap`, `bd9576_irqs` and `bd9576_irq_chip` are not modified
and can be declared as const to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/rohm-bd9576.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/rohm-bd9576.c b/drivers/mfd/rohm-bd9576.c
index 3a9f61961721..17323ae39803 100644
--- a/drivers/mfd/rohm-bd9576.c
+++ b/drivers/mfd/rohm-bd9576.c
@@ -57,7 +57,7 @@ static const struct regmap_access_table volatile_regs = {
 	.n_yes_ranges = ARRAY_SIZE(volatile_ranges),
 };
 
-static struct regmap_config bd957x_regmap = {
+static const struct regmap_config bd957x_regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.volatile_table = &volatile_regs,
@@ -65,7 +65,7 @@ static struct regmap_config bd957x_regmap = {
 	.cache_type = REGCACHE_MAPLE,
 };
 
-static struct regmap_irq bd9576_irqs[] = {
+static const struct regmap_irq bd9576_irqs[] = {
 	REGMAP_IRQ_REG(BD9576_INT_THERM, 0, BD957X_MASK_INT_MAIN_THERM),
 	REGMAP_IRQ_REG(BD9576_INT_OVP, 0, BD957X_MASK_INT_MAIN_OVP),
 	REGMAP_IRQ_REG(BD9576_INT_SCP, 0, BD957X_MASK_INT_MAIN_SCP),
@@ -76,7 +76,7 @@ static struct regmap_irq bd9576_irqs[] = {
 	REGMAP_IRQ_REG(BD9576_INT_SYS, 0, BD957X_MASK_INT_MAIN_SYS),
 };
 
-static struct regmap_irq_chip bd9576_irq_chip = {
+static const struct regmap_irq_chip bd9576_irq_chip = {
 	.name = "bd9576_irq",
 	.irqs = &bd9576_irqs[0],
 	.num_irqs = ARRAY_SIZE(bd9576_irqs),

-- 
2.40.1

