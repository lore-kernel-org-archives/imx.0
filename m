Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1564A142E86
	for <imx@lists.linux.dev>; Thu,  4 Jul 2024 17:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113834; cv=none; b=JdMDXu7STL8naCqIyE+EqWFYgOMrPa6nA+o0KC9XrRkTa9WZRVd0SglCsMUz4QnpNm82TEc49naPvg8Wfp9Aezo0xX2QyklENl3hKrXx1n0TklDToKSkYOtJIuHKNzEK+BNRbCJCS0gLOxWH7d4GtK+IQElaLtxUXQU1WHRlybk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113834; c=relaxed/simple;
	bh=OsP9B5yntvy5o00C9iqf+d4I7ESMIoxwrR+dXi849M8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BRr7I5Swn+ACZNmYvMT7mY0z4XV1JIIQfW24NM3He3XXk2Ni9Ky88Svbzd2NF66gOVjtL3S0WtOjV6uuzuslLdQ41rA8BUOKBBw6RyTc/Rqlws6RBdZpx/6h4auQrn01uTukZPctmbXOP/YPqJEC6Uo4aAtRia6gnmIvzwlqaf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9U/e8zU; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9U/e8zU"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2eaafda3b5cso8132431fa.3
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 10:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113831; x=1720718631; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDX99PHFeeA7rra4ax1diB6wMDKVJk8jhzB3Yt4YbLA=;
        b=Y9U/e8zUeFRf4RVYZVqkuMoW/W6GWKGj7DffZMRZLOfGwKK3zsyrMBNpKYm7MTxQd6
         z51H/JFf0uZRb4HrRkdOItSEs3pciyH606LF6jrdvkoONCLgOjQIIh7aEhuIi/1FBHcc
         xc/UV1R1n/zUAOHt535o6COUCJZWtfNFbcxhMg4FxGN+SLcpzzPgKxSscJndtn55fqWc
         OQ7g8nyRO4TYDZAmN8ro92zV6Ip+kmMOumt50n1at0NueWXW/IayZrXbh9O36cOOftDi
         i0N0fwch6IZtCzuPdveLmZs1mzFG0Dp3JkxIZTWCSEpzEI3qxp1nrQuhSMpUwXpL35r1
         GNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113831; x=1720718631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDX99PHFeeA7rra4ax1diB6wMDKVJk8jhzB3Yt4YbLA=;
        b=NQyTfCtP8AmHaj+emqtfpv15nW428YChb6CrTaveT0z7XuYAx/kdWAZL3elyllMHYK
         dJo8Ts8jdBDS+bb/0tbJwWpjRRe3gUhVaXA0EYrL8L3q97bb3Hq1r4QpwYtpgXwtV3Oa
         oJhU6Z0dBGfmiVpbeIT0QNYJX3FlB3hVa/2gOqS8lzUAXaiM+Zrb5b5o/kKh2Ib9VZY5
         wru5xvlRfkiCyaMxUuUHwESAQ/cWW53w2Ba/8lXCB3LNsMag+kiNG+4YztKfssghHD2W
         3HJJo6tJUlwY0rLEv+TGsiNJWxpaOHjiRNsgpqmI/Ci9pCtKdgGS8VyzApDAr/CiA4QK
         YGAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWURI1N86SfmIYDmro6WcPzLvDUB1Cw+zOLIb8Boev+SjkNZlEHyfyN8qPTujY2XN4hCQ/S0//hR42XK9XMQgGdLz17
X-Gm-Message-State: AOJu0Ywklbu+BNN8pxE0Y0MUJ3iCHVlcgFzM4k4yrI9wq/04FTmCcjxb
	lzUXeqy915/Gn+SaFzC2mPifHbodAoBxRMgAUY9JR9SA6gmFqK0l
X-Google-Smtp-Source: AGHT+IGDGHdH17TOfyl0AHtan3E3NGyjY4qK7qOF10+VJxCWKYz0/N0xnRTryy8auCQrIvDBTXtfNg==
X-Received: by 2002:a2e:8197:0:b0:2ee:8d07:3d51 with SMTP id 38308e7fff4ca-2ee8ee14ebemr13988791fa.49.1720113831148;
        Thu, 04 Jul 2024 10:23:51 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:50 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:24 +0200
Subject: [PATCH v2 14/24] mfd: rohm-bd718x7: Constify struct
 regmap_irq_chip
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-14-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=811;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=OsP9B5yntvy5o00C9iqf+d4I7ESMIoxwrR+dXi849M8=;
 b=mLqu5gnq17+Gs9kyUk2dMV6SUWx1s74/GSw3goKe52OxLCSMhnjCXIIQ5PFkb5Bd7wTcal4Qx
 gh79QNEK8H4DCYsaff4hWqDMWmvsuEIF6+riEhYKIsTEe+50wcbPUVj
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`bd718xx_irq_chip` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/rohm-bd718x7.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/rohm-bd718x7.c b/drivers/mfd/rohm-bd718x7.c
index 7755a4c073bf..25e494a93d48 100644
--- a/drivers/mfd/rohm-bd718x7.c
+++ b/drivers/mfd/rohm-bd718x7.c
@@ -60,7 +60,7 @@ static const struct regmap_irq bd718xx_irqs[] = {
 	REGMAP_IRQ_REG(BD718XX_INT_STBY_REQ, 0, BD718XX_INT_STBY_REQ_MASK),
 };
 
-static struct regmap_irq_chip bd718xx_irq_chip = {
+static const struct regmap_irq_chip bd718xx_irq_chip = {
 	.name = "bd718xx-irq",
 	.irqs = bd718xx_irqs,
 	.num_irqs = ARRAY_SIZE(bd718xx_irqs),

-- 
2.40.1

