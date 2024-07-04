Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F79313CFA4
	for <imx@lists.linux.dev>; Thu,  4 Jul 2024 17:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113829; cv=none; b=SvBUCPu9MLSxHiFdxXj2OKBTBkEcExit9QNfaiw0oZj/mCmzB+0kDMs4BC+cpMdD0vAQBf6PEz6b5h87MJk6XDrljYwNeKO0y01o51Zl/+Vam5jf7LsiQpW3Fn89BT3v5IxlSzTjDzmRUTGuwsjZQmm/1vKpfXZotzWNxYHEejE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113829; c=relaxed/simple;
	bh=VLbF0cs+b50WD1PMCCnaStlvX5NqfEYC0Y8mR5Nbzew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C2AyklZ0M3rvcldTU5gvyOpkxwUQ5QpRNsldlvt6af5P+lgSVPBv0ljm2rgOU5yYUucabqyRI+8zbUTQ1NRST1k5c7vrbq01ThsXxcCjNyZDkpyEZxQb1hy/0deEmB6dHQ2J1O3ld5mmm55ZzknGmbcWnLVjo/vqGc6wpW21sa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLIUqbL+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLIUqbL+"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4256788e13bso5609435e9.2
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 10:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113826; x=1720718626; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b4mMiO+CTevlgVBjjoTGMuQ+zAFqZChWEM5kxdNs97Y=;
        b=YLIUqbL+0+vKXGFD4217wyx6K+/SdeLJ6vpbVi0U0mSRCJyGlR0OrR7kI4libHvvo5
         bNfYQY4TomvzOB3WJGiBw9QrZFDc7iuPS1sYWlsTDcHSsikHA9AmmCJ0QkJwExd746li
         1IlL75xjFGY+XIQ5LNDagFmRYgTlBLZ+q6vg2zdOa+tqgKedGAPFE4QM2ztSpuULTZXZ
         kZJbAp7lkedGnuO7MbHV7fS96q9nvOyeKW464wt8XYGQo4VpBhFrSuIwWtpZmPN+ucYB
         Qbr0BlvyoCsSD5+ChnxygHBGAwF1PxPOYsE9L71GP6hlIUjPW6mma3yF8IlCwM6nhecS
         zgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113826; x=1720718626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4mMiO+CTevlgVBjjoTGMuQ+zAFqZChWEM5kxdNs97Y=;
        b=qMWj5edXAkKD+2LkzHSpjTgNDFVpetY+u0WR8b29fpBLTHyxva6PgQcx+9kIiWSR2S
         qSjJ3wavtgwhvYdYcZxRi6TUMUrleA/mkmLHgF5s+H2N3u75KI22ZXaLuThp6gWCd4S+
         fyqDuHkG/M79m0FvdZPWHzZpzmZPZUCS7VvQ5a6/sxTi1SRkL6ZqJ6wywvhN3HIgtz61
         uIMb/rslphmfLfAuYBRiqhrwJp9Zsz8rCjBSrHxeGanPBoQsxyhGVsSzbfglNfAdM7eT
         JKnWwgOEvsB4KS2iQnoDfFF+anDA1EKi+aabJEVeMGMKzPB08I0iUN9YuAhMQYB1SYRM
         Pi4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU73mtAWTEKG3kQTckFiIk3/WReLUF+XXv+4WxgxN+qoyJxn9indf38X/gUSuRX5EZOA9+9tQTPbsyundjQebpgp6MR
X-Gm-Message-State: AOJu0YwRo5ZPilhQnsa4Fovwsa75pX9lb1X5nOrUKQunS6pzFfaXSwpN
	losLcbBILKemw0mVwvet1afBApuas8AFcQNPrM2Tg1bM0ny/38/a
X-Google-Smtp-Source: AGHT+IG+cqs4occmJ/idkODH5ar2IMIGeXECboiCn1BxQYFI+1HeiOtHKpCW5d66Q1v653jEdpTeEw==
X-Received: by 2002:a05:600c:15cb:b0:425:3084:c99 with SMTP id 5b1f17b1804b1-4264a468bd1mr18777265e9.31.1720113825995;
        Thu, 04 Jul 2024 10:23:45 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:45 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:21 +0200
Subject: [PATCH v2 11/24] mfd: retu: Constify read-only regmap structs
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-11-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=2105;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=VLbF0cs+b50WD1PMCCnaStlvX5NqfEYC0Y8mR5Nbzew=;
 b=lEYzo144SCeLvUe2TpSR6MJTOJpaXbHir4xaxMjVppyFNZ2yNraSxjZ0DXvrzKA6EASiSC+LK
 Ezp0B4QZlQiBVOv4iHWqGGzjexJ3JVp1nuNXg8pwuTJdfuVaaHH1Hcj
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

The regmap_bus, regmap_irq and regmap_irq_chip structs are not modified
and can be declared as const to move their data to a read-only section.

The pointer to reference the regmap_irq_chip structs has been converted
to const.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/retu-mfd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/retu-mfd.c b/drivers/mfd/retu-mfd.c
index 9184e553fafd..1d43458b4938 100644
--- a/drivers/mfd/retu-mfd.c
+++ b/drivers/mfd/retu-mfd.c
@@ -65,13 +65,13 @@ static const struct mfd_cell retu_devs[] = {
 	}
 };
 
-static struct regmap_irq retu_irqs[] = {
+static const struct regmap_irq retu_irqs[] = {
 	[RETU_INT_PWR] = {
 		.mask = 1 << RETU_INT_PWR,
 	}
 };
 
-static struct regmap_irq_chip retu_irq_chip = {
+static const struct regmap_irq_chip retu_irq_chip = {
 	.name		= "RETU",
 	.irqs		= retu_irqs,
 	.num_irqs	= ARRAY_SIZE(retu_irqs),
@@ -101,13 +101,13 @@ static const struct mfd_cell tahvo_devs[] = {
 	},
 };
 
-static struct regmap_irq tahvo_irqs[] = {
+static const struct regmap_irq tahvo_irqs[] = {
 	[TAHVO_INT_VBUS] = {
 		.mask = 1 << TAHVO_INT_VBUS,
 	}
 };
 
-static struct regmap_irq_chip tahvo_irq_chip = {
+static const struct regmap_irq_chip tahvo_irq_chip = {
 	.name		= "TAHVO",
 	.irqs		= tahvo_irqs,
 	.num_irqs	= ARRAY_SIZE(tahvo_irqs),
@@ -120,7 +120,7 @@ static struct regmap_irq_chip tahvo_irq_chip = {
 static const struct retu_data {
 	char			*chip_name;
 	char			*companion_name;
-	struct regmap_irq_chip	*irq_chip;
+	const struct regmap_irq_chip	*irq_chip;
 	const struct mfd_cell	*children;
 	int			nchildren;
 } retu_data[] = {
@@ -216,7 +216,7 @@ static int retu_regmap_write(void *context, const void *data, size_t count)
 	return i2c_smbus_write_word_data(i2c, reg, val);
 }
 
-static struct regmap_bus retu_bus = {
+static const struct regmap_bus retu_bus = {
 	.read = retu_regmap_read,
 	.write = retu_regmap_write,
 	.val_format_endian_default = REGMAP_ENDIAN_NATIVE,

-- 
2.40.1

