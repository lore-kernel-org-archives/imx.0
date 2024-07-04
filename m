Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCFE4E1CA
	for <imx@lists.linux.dev>; Thu,  4 Jul 2024 17:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113816; cv=none; b=Rt9aQo+Efk4+Vb7EDODnMWddw5SgnSzuqNriv7WBqzw8BuynFqVoIsdmGHYg8GplH0Q3BfB0D0QQbetGn2QXWq1/LITIuGfedqhO6Ss2tAY7jvuN40+6JJOvGqYPtyyRHR/4Eo405gjBfGr7aXTfnTZ3v1bNqWH3mqR/31raMYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113816; c=relaxed/simple;
	bh=enRHrVnnv2v5OSTzZ1elKgS5KbJVuE9GP9SdZn7OqTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CxHcJlgn3fn8ukEwqmF3ePS8el9+rs+iU2iqYvCS5ZEREqnUV270co5PWIFHZaEOANJnpPQGQ/tzfMSucL4evDokSrDpKTGAmVql70luj+kMSgB345ICAZl5nJHHMIv6bAXc5XjxMpZLZxZZTo6+NJtM8H51fCp8iKCVibFZ7Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PB8QPqif; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PB8QPqif"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42561c16ffeso6041985e9.3
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 10:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113814; x=1720718614; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xOF3cIT6fgv4yx2bUJ2liLgQLjKC8cJY9QXkjtPW8ps=;
        b=PB8QPqifMEaW09eHsRyO13z0Il20ESLUnlK2n5ayIRkndEd3G/yB7JiAv7hwNBXr5H
         e1Szc3laRaB8oSx3Eq/cZL+54culFY2J8ox+ZWr57d00k+TnOzkaZGEAJo+LaKbNTtYq
         xpNcUNvVvyuyn+LoCoYY8lB3QjeM5pjHOxnqEwOeC0lYiJAmmYwAxduxofUmwA9VY9BX
         0eV3UW4dY/Gy2wgf4OpPni9lh4jQmOOkYNrFC0KKD/c2F3GrTUhpY2+s9CB/pKygewOA
         4+FGSO5x0e3Q1NLsp07bGhNoPLChU5O2eeJEBp13+Lkoii4gEVxeFqWIiYIL7CV9TgDf
         52FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113814; x=1720718614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xOF3cIT6fgv4yx2bUJ2liLgQLjKC8cJY9QXkjtPW8ps=;
        b=WbDsPjiNqvva6v5ssmfYw9jTTcC7mjR+FTIy9FlI06w64I8SGgke2Jg0U85m1Zzl0Y
         TeBDnNmb+V5l2ArRLzH7zJVmxkqv4rGlhICzoBrkoz7YsSzcy8qHqVDrYR40adoLLOX4
         7h/K5+rMewR760ed/9p8OPjxLQBG/BjqmwSMrgxSPjd2Oy4yJSHRBqX8nxiZbfr8h/z0
         Q4PUkTjU1aD+0XxjAFc4KNW1ligoPNmPi4DA0vDdilUGwlMRuKIcU9/wl/YHvBgqAmgj
         ahiSNkorRdgC+fLMG2nDWb/L58tIJwYIJ1o2e6yWRE6z16h7CZm1fMpbYvBsEdJRbwEv
         FCRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL74K2Tw3Uc4k5eKxQ1JkQDuXr5Wb2kI79sY5F1EhZKSQhHTVuH4q0EO4A886p7gjlXEK2ykfM+eNIdIf+7cQyMTSJ
X-Gm-Message-State: AOJu0YwYjvwGPOosKlA5arsh91J85LzeBgLAdT7ZS2IgncWdkkoLe/DN
	B6H9+uZYo7HdPUhycV2aUCSmdbAEtntkw/exGUkcrf81nRA5eM5W
X-Google-Smtp-Source: AGHT+IEzmw9A3yXumyKWrsaNIzb4agNGIY00q8pnHYSGhbLatIjosLNG1uUTfjJdA7RFzFVtK3VgoQ==
X-Received: by 2002:a05:600c:15cb:b0:424:76db:3583 with SMTP id 5b1f17b1804b1-4264a443effmr17152435e9.30.1720113813556;
        Thu, 04 Jul 2024 10:23:33 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:33 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:14 +0200
Subject: [PATCH v2 04/24] mfd: wcd934x: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-4-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=720;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=enRHrVnnv2v5OSTzZ1elKgS5KbJVuE9GP9SdZn7OqTU=;
 b=XIuP2+gdHvMBFVSbsXzw9ZBaF5PZZ0AWBvuCSWS4O7NfRXJH8MPcNIFnqzOfbfwY7WQzekGMm
 g0dgwbrDJImBvXSMHFQ7UyuIKLxA+ojrdsWiEfNRUJnmSk+DCbit6Bp
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`wcd934x_regmap_config` is not modified and can be declared as const
to move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/wcd934x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/wcd934x.c b/drivers/mfd/wcd934x.c
index 7b9873b72c37..fcd182d51981 100644
--- a/drivers/mfd/wcd934x.c
+++ b/drivers/mfd/wcd934x.c
@@ -109,7 +109,7 @@ static const struct regmap_range_cfg wcd934x_ranges[] = {
 	},
 };
 
-static struct regmap_config wcd934x_regmap_config = {
+static const struct regmap_config wcd934x_regmap_config = {
 	.reg_bits = 16,
 	.val_bits = 8,
 	.cache_type = REGCACHE_MAPLE,

-- 
2.40.1

