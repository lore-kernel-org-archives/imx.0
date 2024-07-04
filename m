Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A233FBA7
	for <imx@lists.linux.dev>; Thu,  4 Jul 2024 17:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113813; cv=none; b=fNwEctaSm3oSwiv8H9uWqgP5DLvej6bMLoKwyU0qDDgyisC+jhMOwHmSxRl9JtvOwNAWS7wGc67JKaLLqVqKkTtSRnNDM2knuORF0Imn0Y3d8X4GqwVUC7L4U2qL6Hvn2TQBEny2/4vBhOy0o69eYb5q0wjCiBml2lg+fZ29nD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113813; c=relaxed/simple;
	bh=U56saMjIfEuTsQ+HGnNS0wH0SrTxaY1/OZS4zOAPdKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pp1av9SqXwFoUa0kaYPk/emP7KvjdT1WLvPpEKIkGLIJEI13eSgMug9NW4xubSTEKC6n7CdTxwpy3BfKnM/TUP6WBTdGCqx6SWQaOMVTCK0LaQpKo9sst2TKPCN+b4vCFQavktflbSn9cbDl0iYHKjlyPmFBCS2LNKy/uhdDTmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GAVgLafk; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GAVgLafk"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42565697036so12408155e9.1
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 10:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113810; x=1720718610; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lKi2JAqKWrjfu71x3mrudLF5NIxjHTPRhhtNA6MHl8U=;
        b=GAVgLafk41lHMvLQ2phuTgcWqZoM57iW7E7jcT+LkL9Z8nRaacvVD0b3kkaxbbVABO
         bi+utubUDdEgIXZCyucRCpJXLK85Rds0psxBvCLeGi4DSkFsDd1DJGiLi/g/rgZtIYTA
         /KVMk5UBeIrRs0rI3mC2R0hjZaDxU2zemqFPDtw3JEPNrZWMoxOUl5zvjbza5mps3wnB
         kqqRnTRqi+L1i9M8DppYXC3ZmjzgRp3bD3iTGdBdXpQ4ADMyGHxmyjSmr76WTgOgQJy4
         09SbLZc1yJdDIixeEz/kPrdBP2MAgbG391c80d2c6JyI2XHwktyYgGtTZIgngD5foDfA
         aUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113810; x=1720718610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lKi2JAqKWrjfu71x3mrudLF5NIxjHTPRhhtNA6MHl8U=;
        b=Ts51lXDqslSEO9lgdjaoHov7gWzj39kdwzCNfVjD/yro6isPfOGrSQzS7Xy/+9E6PC
         kEk+5p7ZNxwBJf8khV+YmhZALhtYtdgpvjtv/xfuX+w52vme6Dl4z2Qx2+GGqBEBVzCp
         b5CCUVWIzSrmyl+Yh9VpZbdG2n++9QjbLHOomBbI7kF5IT/79ATKYI7V6ZKY2zumPILU
         Z19rR/4uAkVudxnW4EhQO77Dr0BtWEgusxCe8yVO+Aa/+35MGIfdDkuV54zfuKAOC5Dk
         ezln4dJGUgxTuRYvKPTz9+GbHSVT8pEckU4TZUUHtFFVk9WURGal3d2eRexnKo4FqwEA
         MBFw==
X-Forwarded-Encrypted: i=1; AJvYcCVarfbnMdhqgaplBqbmPtwMGJb9qbZvFqpgVrFw0vrgMYgAC2X/A7nx0AqGiI3TAAkxLu8mL+Njqfa5EcyS4asI+Zj7
X-Gm-Message-State: AOJu0YzfhDNLu2coYh3SFql0Ehk1Po4zEpfb4zMk7WeN03qpPVorLgTR
	cPXcseWV9spfznkbjvL5lEctgNEc1dkgm4bohNOTSC+v0luiJp5k
X-Google-Smtp-Source: AGHT+IGNLrdFCeh7xzObKjO851xmp5K6J+smKfZMeNHhP9RTpyPgPRafmRlv+Xb191RAmYV2oYOAZQ==
X-Received: by 2002:a05:600c:33a9:b0:425:61cf:947a with SMTP id 5b1f17b1804b1-4264b132bf3mr19795315e9.12.1720113809846;
        Thu, 04 Jul 2024 10:23:29 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:29 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:12 +0200
Subject: [PATCH v2 02/24] mfd: fsl-imx25-tsadc: Constify struct
 regmap_config
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-2-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=754;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=U56saMjIfEuTsQ+HGnNS0wH0SrTxaY1/OZS4zOAPdKk=;
 b=GICB47pBZbIZXIX8luZ2HJSfqqu1Qr3KPUXldLDV5bqbYrAei350hLaoTAiX3HfY6MN8QZPWz
 ASI5wULmcQfBdd0v5zKGpII4RxfM4cXCZOTKMKOe2UhA+6LMRR2Ik/J
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`mx25_tsadc_regmap_config` is not modified and can be declared as const
to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/fsl-imx25-tsadc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/fsl-imx25-tsadc.c b/drivers/mfd/fsl-imx25-tsadc.c
index 74f38bf3778f..2e4ab2404154 100644
--- a/drivers/mfd/fsl-imx25-tsadc.c
+++ b/drivers/mfd/fsl-imx25-tsadc.c
@@ -16,7 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-static struct regmap_config mx25_tsadc_regmap_config = {
+static const struct regmap_config mx25_tsadc_regmap_config = {
 	.fast_io = true,
 	.max_register = 8,
 	.reg_bits = 32,

-- 
2.40.1

