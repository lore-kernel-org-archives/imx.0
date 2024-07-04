Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDB9145320
	for <imx@lists.linux.dev>; Thu,  4 Jul 2024 17:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113845; cv=none; b=fnUlaFnY15bC8/KEOUSE6PHTrciJ4fXyIMcdrKyJTR3kJMzO1zyBp1CgP0l/sHavc13AzWqXo7WejdAkwx2tF309uQWkr3FTeizrdDq0JOot35AVwyKvp+ClK6Tg+QRoeANqFRsEduTgWgntiaOm6//kf1NJK33hjhpGp+310P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113845; c=relaxed/simple;
	bh=jMfkDgSxDotzG1jwrOsREhe4lpTvN394dyQECPi9cEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LGBzSJbtKpsPlrmv9zFkwb2RQlaK6/bCdKkuM57s8Gl+aUBbdcL+4w+OHu4Bs5D5VOMU3mHnGvSK8AxUTnZFgKj5e+B/3T91HFoQfeTZGIGIM4dtK1mMOcGGnV4EyKr7WJ1a2seFB0W0OYt9hMTDKuMDPw9vxlPIa1/ElsJcFA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePNSk9e9; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePNSk9e9"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ee88c4443eso9536031fa.3
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 10:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113842; x=1720718642; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vy+A3rCs2GjwPUdBUvfrvVaJ4gXWSXpMp/c9DgZBcps=;
        b=ePNSk9e9fYpYIdc6yeeXo6MkggrFmXXfzlYyrQs+Wm55Y0bRD4fpFJlFpjmkWDjlKz
         bKihxFeP1mScPmoig6FXuiP6iwfq0iBoXqT09Ga9xrA+T+surFgdxw4GnbRVFl8F82pI
         TBYW7NXJONMWfoecnViVfuh13Jw7lhj6CZyzVA7MDGR1Iz3ZGAgL4qsmS7Ot05Bs6ADK
         AzTE3ibkxyV2Aq51kTuo/AFmNCXgL4Fsnt0N2CGzoslfLR7AOlqyjrJaovGNXOEjM+kk
         L5V3vN9D/9xiTSKUDj5B7YQ/R2VOu7pP8uwjubHZWBrthafn1fDRclOIbVi/9eM5srAy
         wi3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113842; x=1720718642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vy+A3rCs2GjwPUdBUvfrvVaJ4gXWSXpMp/c9DgZBcps=;
        b=DS/2EsR8Roo0g/z5KElOUqvc3B/6Xw8yt0ZWb+V3WEBY9v8tC4sfb7XoN6jmAyoK9D
         sGxqlswmIKJspCV14mzlk+y/t6bo/NiZMDOercwbk+zjqG2VCG7KNN1BOVrAEpMgassf
         FMalpDer/xu/jKZM+/ZC1HHwfUmf89lQke9iO8y9l66cpVBOfRMfNWZctjBymbAsT/+n
         55LfiFmooSjuQfxcgtp3zXVXEdUDl175Hv3SjrnwYakpJkclbz3PqIqRHaCHGy+ooYea
         ntrHbt4i3Of6lRw1K4WWWBeuLGtYrq1Sy2dg+rU9VCjwZXoOsCVv4COhcaY6eXAlh+rB
         6JwA==
X-Forwarded-Encrypted: i=1; AJvYcCX0OdN/085cAmgj31uaHrrUzu+QtCrCf4Rasvv7bqROl5SsAT91RmkeCgVcrZPyPMs1qhaJikuv98NzdgeH6Am8nt7S
X-Gm-Message-State: AOJu0Yz0n30qb2KvCHDgImalTvIkVENFlCbkWanFNUcFsukUfaYKI4KR
	f9++9HEPcNgZUhkMfAAZJ3o6w/Kd7Zvy+aTZJ3Ruopr+BhjYp7JJ
X-Google-Smtp-Source: AGHT+IEUnfJ9RXgbg6QBZTXm3lVcTtwHsksi3AlggvCusmiUTsvrHbKYeKsVnlhZlRYaPOLgLQnBNA==
X-Received: by 2002:a2e:a604:0:b0:2ec:507f:7319 with SMTP id 38308e7fff4ca-2ee8ee1373fmr17653611fa.43.1720113841636;
        Thu, 04 Jul 2024 10:24:01 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:24:01 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:30 +0200
Subject: [PATCH v2 20/24] mfd: tps65912: Constify struct regmap_irq_chip
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-20-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=827;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=jMfkDgSxDotzG1jwrOsREhe4lpTvN394dyQECPi9cEE=;
 b=aEkb4C6NIcwRYWelpberMBzrQJRrhogvHC0YfXWJWnMf/s2kQwvbx2Ew/+zOyBnHX4Wd3WTkX
 ffcyE5PyiPyAEB22f7q4nnDn82LjurOxzt1HcHZnroD2VU1cUlFvZOr
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`tps65912_irq_chip` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/tps65912-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps65912-core.c b/drivers/mfd/tps65912-core.c
index 87ee6aac3763..a9dcd7f0d9e3 100644
--- a/drivers/mfd/tps65912-core.c
+++ b/drivers/mfd/tps65912-core.c
@@ -57,7 +57,7 @@ static const struct regmap_irq tps65912_irqs[] = {
 	REGMAP_IRQ_REG(TPS65912_IRQ_PGOOD_LDO10, 3, TPS65912_INT_STS4_PGOOD_LDO10),
 };
 
-static struct regmap_irq_chip tps65912_irq_chip = {
+static const struct regmap_irq_chip tps65912_irq_chip = {
 	.name = "tps65912",
 	.irqs = tps65912_irqs,
 	.num_irqs = ARRAY_SIZE(tps65912_irqs),

-- 
2.40.1

