Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A7D13AD03
	for <imx@lists.linux.dev>; Thu,  4 Jul 2024 17:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113825; cv=none; b=UkADPDg9LivaZAKuuOJfkKjvdbJtrfrZbtYrtGkt2w8khHFXOSBzto2ZFrPzO5zVLKlv3n0VSZE4oHf/7+UtJMnDtCTx95Z7kEYvPjM/BiaGHjsRrwQ7CW08bv/kh7Hc4sovv9aK0OPchBgu9KQ+U1A3HUXvDgFO/2kSizeMoTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113825; c=relaxed/simple;
	bh=1QPZacUuOeaij0so0MenKs4sY5xXKtXayfwYDVrHiWI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rq6lXcyuGvatcOMA5DqGkCqLbrZ9S791WEGsJFEf+ovabDB9FKjsJh98sJ1z2BMCm8LjEZ/L//b/XG6eLQdA/mpVXPfv3zaOZdPn1wPwQ4XZbqRNbAKDj8DvaIcFlWUKDAnrMJvaVHyIP4XzLl94xxj4k5qAznGBH+WJfgJQgiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WHnRJrHl; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WHnRJrHl"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-424acfff613so7416025e9.0
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 10:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113821; x=1720718621; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZH0N2IdligxpGGw784EbC3Sbw2mtJNXF8+12BAAhog=;
        b=WHnRJrHlUCSkZ49KH5AgqrMIMoFioWQufvZvXP82wBVRxDCj57OVjBiNafdR4jfMIQ
         62XrNzJx56HdXQlBQnBIpqPIb2RU72UKnlah4PWFaZw6q6b4K4u94OzB3DlZOITmW8u0
         j5Ynl4aKX8sls10Marr2+z9kClk5JKzlvPCWzA2PxzUSKjEWTMP3VQdKM98h/C4y+Bb3
         O67PTT4FG8eReVjyMQHk7O9H/scCV0skUL9wuYSf5NPJ47Qrpyh9minZMz7eNDjuBuFY
         VYQN9K50G4fg55hQzVubuaNB+ndz+gPHxFyouQIt9UXgOaaIPFgHsi4uuMzWN9d0ibBB
         oS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113821; x=1720718621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZH0N2IdligxpGGw784EbC3Sbw2mtJNXF8+12BAAhog=;
        b=kY2r60ssCrXN7A0SkRP5HotirC9IdqZYjfposx9BxYUI88bsbMTFIZ4XKwLuA81qkJ
         JYaUnjSluhDBKo5iv6ojgYfVErc5QR6Z32of06RVpwnDxP0e2BrmpWpNHhYgMtfmeEaZ
         qnkKHkcO4my44U3YpoiMzdEw/ZIuG39yTyY+UnzgjolXHEeMFQ5lcV63Y1ivngpu11MD
         +rU8F72tvIImXjqVEdEe0KbglHokkfZ0FUISQg/kSp79fgzk9S+8sRU4iv8OiEcHjcgl
         IR5/NxKtuAP8eSgObZ/9acxrY9uJJbf09gC9ZHlO90tkmpOD0ywuhJ1BGysl3pHpIMqG
         usMg==
X-Forwarded-Encrypted: i=1; AJvYcCUi2bJ/g0aUd9c39pZ7eXPqKcN7TwKSofr+Ra+Zida2+y7dnc+T8Cesi28St3tGMTUwi8tNbsLqbnIkFziX46SBFQ0m
X-Gm-Message-State: AOJu0YzPai8vJ64UhU6oMNGh8Znhd4E7Tf1XaEjT5MyOL/YpvftMkDd1
	YCxY/ukrc7rwLE53kktkEqZaG6tw8XSha00OthA2k2KzLfc765TC
X-Google-Smtp-Source: AGHT+IHVDvV5ZlABTxLnxGN+P/Oktapr3Dfo/w3DqKV5F+2RPZu1eXQFA/3w8stNEW7xOKHq54yiFg==
X-Received: by 2002:a05:600c:1c0a:b0:425:88cb:1741 with SMTP id 5b1f17b1804b1-4264a41601bmr21035435e9.36.1720113820982;
        Thu, 04 Jul 2024 10:23:40 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:40 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:18 +0200
Subject: [PATCH v2 08/24] mfd: 88pm80x: Constify read-only regmap structs
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-8-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=2233;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=1QPZacUuOeaij0so0MenKs4sY5xXKtXayfwYDVrHiWI=;
 b=7MzL1NssvI7gS5f5E0UMDoYA0lY9TxFldWlNp/BKaAes/ovgxyjcP6ITmOMmnZZoP6kcROg9w
 SXtwvZwXdcvAoBbxd4UY/nYYZ9shNBxeL0Q03q+Re1QIghRS9qh1ith
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`pm800_irq`, `pm805_irq` and `pm805_irq_chip` are not modified and can
be declared as const to move their data to a read-only section.

In order to keep the const modifier for the regmap_irq_chip structures,
the pointer used to reference them must be converted to const as well.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/88pm800.c       | 2 +-
 drivers/mfd/88pm805.c       | 4 ++--
 include/linux/mfd/88pm80x.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
index 384ecf5301d2..e9941da58b18 100644
--- a/drivers/mfd/88pm800.c
+++ b/drivers/mfd/88pm800.c
@@ -391,7 +391,7 @@ static void device_irq_exit_800(struct pm80x_chip *chip)
 	regmap_del_irq_chip(chip->irq, chip->irq_data);
 }
 
-static struct regmap_irq_chip pm800_irq_chip = {
+static const struct regmap_irq_chip pm800_irq_chip = {
 	.name = "88pm800",
 	.irqs = pm800_irqs,
 	.num_irqs = ARRAY_SIZE(pm800_irqs),
diff --git a/drivers/mfd/88pm805.c b/drivers/mfd/88pm805.c
index 205f0762a928..f5d6663172ee 100644
--- a/drivers/mfd/88pm805.c
+++ b/drivers/mfd/88pm805.c
@@ -73,7 +73,7 @@ static const struct mfd_cell codec_devs[] = {
 	 },
 };
 
-static struct regmap_irq pm805_irqs[] = {
+static const struct regmap_irq pm805_irqs[] = {
 	/* INT0 */
 	[PM805_IRQ_LDO_OFF] = {
 		.mask = PM805_INT1_HP1_SHRT,
@@ -163,7 +163,7 @@ static void device_irq_exit_805(struct pm80x_chip *chip)
 	regmap_del_irq_chip(chip->irq, chip->irq_data);
 }
 
-static struct regmap_irq_chip pm805_irq_chip = {
+static const struct regmap_irq_chip pm805_irq_chip = {
 	.name = "88pm805",
 	.irqs = pm805_irqs,
 	.num_irqs = ARRAY_SIZE(pm805_irqs),
diff --git a/include/linux/mfd/88pm80x.h b/include/linux/mfd/88pm80x.h
index def5df6e74bf..551ef1c367d6 100644
--- a/include/linux/mfd/88pm80x.h
+++ b/include/linux/mfd/88pm80x.h
@@ -294,7 +294,7 @@ struct pm80x_chip {
 	struct i2c_client *client;
 	struct i2c_client *companion;
 	struct regmap *regmap;
-	struct regmap_irq_chip *regmap_irq_chip;
+	const struct regmap_irq_chip *regmap_irq_chip;
 	struct regmap_irq_chip_data *irq_data;
 	int type;
 	int irq;

-- 
2.40.1

