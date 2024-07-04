Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D032E3E4
	for <imx@lists.linux.dev>; Thu,  4 Jul 2024 17:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113811; cv=none; b=gR8ESp6kCJsVGUwiIeGzulW0thnZ+VVg3sNxmCP0BN29XGfCunxZf1ESzrKGKLlnXUcT2NZPCjMopktl7OmDb/C4wR0fvHx+RoQMk17myr/WIl5OolThWfWiZPX15nNFxFoS3El+wxumR0yvPBJL8SgCpW+0hC+bIEi8bTjz/ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113811; c=relaxed/simple;
	bh=1FFSzWZVDSBD2A+D27kWrIyvC4pn+kvq0HYdU/k3PyI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r0qTY6uivJmljxjTS6T90f0nuOV0ThD62Jw6lrEs5yojVnQ+1fypNsV85NtShjjvfzwjJjgXWcmUyf4Sm5ZobexV0OngGEMP2+qVn4jw4jtlAI9EinZquFdsjjOhBBYLz9jUDWv+WzfkxzpV3dzD2y48Xk7c/nBT4gU3/7EMIYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lgsn0Nou; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lgsn0Nou"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-424adaa6ceeso5229085e9.1
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 10:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113808; x=1720718608; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v/FvmgWoqRW+fG/g6TS9f9J9g4zOorBTS1e8w27Zmhc=;
        b=Lgsn0NouKoMs2ikbC6a1DDOXs3GoFhekeQBxNLmGZWCP0kGcWaAhEdiXiHmqWNOrXV
         GKXo1z+BjznoSYlRpcip2F9svn0HFg5A3XGJ/yF6U+I+1VkAQy39TupHTek52ATUzz9x
         huWH63xcJR5ZyNLank47LdxfJIx3RbgfCiC5cMKTUPMxseahQLJtySKkq2xLAl0WSxEJ
         9gpIz1xxDf0gaAZeV0JBmUo+PKgecZNvS9M1wljtIlOoRLvpNK6Id0rXBijqFWXY7j/M
         1Djy7CscfpnmZCPLmci8Gky2K02A+dkNBs2DVn+qmdALP9U+bi1kgWAdkeWwI5RFCN5q
         CzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113808; x=1720718608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v/FvmgWoqRW+fG/g6TS9f9J9g4zOorBTS1e8w27Zmhc=;
        b=eJL/xbeJ58WLqNLwis7plRXbQenlRwv1q7Ck1FFlD5PemJCemyTAX4ChsmUGBhC4QC
         Nvsz/AlvZWPQtjczcvk+sHIrkUNVuB4lJgrB9WoUhQrA4carwt1o3vbvTJ92xoO8vz0/
         aVD3fVWwlwrjiUtni0S8pqT5dShYmX5R3OJM2/L2YtB9g9RdFC5xXIXgR5czB5tT5elh
         lHM8jTd5+Y9xMic4d/G8+gkXM9shw0XkhBD5IY8tu7trT1QMxtVou/MmH7AHMMNJIgys
         OPLu/VRRBz54bq+0rQ3oIuTXpS2jmgNe500p0ji2vR9LXvScUtUo9nEMb0xuf6xb0Br3
         JFUA==
X-Forwarded-Encrypted: i=1; AJvYcCWArnTAx8c2zM1j7MXBEMuA8+XkW9l5esT1GCSYiBgJIu1ndhOzQ3GUMHlKenqxyQBJ8Ozgm46ai/7tapo7cu5sfvFF
X-Gm-Message-State: AOJu0YwvCpFf0y9zcK3CA78u29N9sYlu6Oad3kOnhbkSBl2siCOSyhTV
	nNNNg6ezqnIG/XTAbmqknVDND4e1kD+6CsO9/7pyTBPhD510PlpL
X-Google-Smtp-Source: AGHT+IGkuS7h4KLnK+AZjYqP9kYe4MKb98PWAAeZkMdpo/UBy/dWlRc+ua+cpRXuqFWbFBjt3F1A1A==
X-Received: by 2002:a05:600c:1649:b0:425:8d90:4ade with SMTP id 5b1f17b1804b1-4264a3dbd3emr16710395e9.22.1720113807982;
        Thu, 04 Jul 2024 10:23:27 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:27 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:11 +0200
Subject: [PATCH v2 01/24] mfd: da9062-core: Constify read-only regmap
 structs
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-1-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=2168;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=1FFSzWZVDSBD2A+D27kWrIyvC4pn+kvq0HYdU/k3PyI=;
 b=5rNOZMDQYllm8BI7xY2p55OAn8pxJw8n/xKGFCzdcLCf6J79Nxe1j0fpwJNj0a0Q3xhKHR6vv
 OMGrake9gahAbU0hMHYfukQGRoiNKk8U71xJAuZoJ2hia+czDry55YJ
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`da9061_regmap_{config,irq,irq_chip}` and `da9062_{config,irq,irq_chip}`
are not modified and can be declared as const to move their data to a
read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/da9062-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/da9062-core.c b/drivers/mfd/da9062-core.c
index dbbc4779170a..637c5f47a4b0 100644
--- a/drivers/mfd/da9062-core.c
+++ b/drivers/mfd/da9062-core.c
@@ -25,7 +25,7 @@
 #define	DA9062_IRQ_LOW	0
 #define	DA9062_IRQ_HIGH	1
 
-static struct regmap_irq da9061_irqs[] = {
+static const struct regmap_irq da9061_irqs[] = {
 	/* EVENT A */
 	[DA9061_IRQ_ONKEY] = {
 		.reg_offset = DA9062_REG_EVENT_A_OFFSET,
@@ -79,7 +79,7 @@ static struct regmap_irq da9061_irqs[] = {
 	},
 };
 
-static struct regmap_irq_chip da9061_irq_chip = {
+static const struct regmap_irq_chip da9061_irq_chip = {
 	.name = "da9061-irq",
 	.irqs = da9061_irqs,
 	.num_irqs = DA9061_NUM_IRQ,
@@ -89,7 +89,7 @@ static struct regmap_irq_chip da9061_irq_chip = {
 	.ack_base = DA9062AA_EVENT_A,
 };
 
-static struct regmap_irq da9062_irqs[] = {
+static const struct regmap_irq da9062_irqs[] = {
 	/* EVENT A */
 	[DA9062_IRQ_ONKEY] = {
 		.reg_offset = DA9062_REG_EVENT_A_OFFSET,
@@ -151,7 +151,7 @@ static struct regmap_irq da9062_irqs[] = {
 	},
 };
 
-static struct regmap_irq_chip da9062_irq_chip = {
+static const struct regmap_irq_chip da9062_irq_chip = {
 	.name = "da9062-irq",
 	.irqs = da9062_irqs,
 	.num_irqs = DA9062_NUM_IRQ,
@@ -470,7 +470,7 @@ static const struct regmap_range_cfg da9061_range_cfg[] = {
 	}
 };
 
-static struct regmap_config da9061_regmap_config = {
+static const struct regmap_config da9061_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.ranges = da9061_range_cfg,
@@ -576,7 +576,7 @@ static const struct regmap_range_cfg da9062_range_cfg[] = {
 	}
 };
 
-static struct regmap_config da9062_regmap_config = {
+static const struct regmap_config da9062_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.ranges = da9062_range_cfg,

-- 
2.40.1

