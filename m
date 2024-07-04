Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE97143899
	for <imx@lists.linux.dev>; Thu,  4 Jul 2024 17:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113836; cv=none; b=C00dqU6aganlaIDUMX5GSLC9r7MixRf/US2DKNXBhKmgX5G9s9jMPQzTxHmMS04z9wrscR/yl/JR/1EHkrjWGBYfg5mAELfJLSbV9U84cDeYIR3XXmdC3p1sWq0h9/FIM9pQXUv0TDhoOHHbNSeh141t9PLq3QAF9aiajbT28HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113836; c=relaxed/simple;
	bh=LwSmNpQz2F+cwYbYyqp+ffrrtmaCiTXzgTUcnJr7s7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HLLjHB1+18gOu/zbMWbmpe15IujsA/4hcDddG6Zu/phNLAqDAo2GnpJyYVV4zSFnYy30QBXw8LFh40eM0iRnyBwbUbxSijNgRJNSvrjaZPS3O/cH2LggMaURspyYjY7BTB/VgkYz2J/SDs3qqUSQNeRkO2ec3jr8Z/AKXxFLLA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YvubvrE+; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YvubvrE+"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-425624255f3so5736795e9.0
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 10:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113833; x=1720718633; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wr02nhq0ruDtDnhEwyMKYxGviJTN4mPbs3lAEzqdbjQ=;
        b=YvubvrE+NXHVpwooZPdjqFM8E5bnoVDxJ4ziy7qn8RFVL3aw6nAaZq/HV35r6oLVHs
         Y/DwVqoSJe4TZMTNii3USvxK6znv4TdG1sWu/rbpf/SHzWmvpEuu34wqSVrO+Gu/24vW
         CJ+GFRTNcUIL4WoMx+qPL6EHlBwpucaP9mDvJfMePtDW4TIJwYbHnACknFMKuzpK+SLy
         r2VKg7uJPM/3F8EHmc4iUhcORJ4NijJOwXdfSQK2w/iibABe32btjypTR21RmnHyd2WV
         1uHtW4tTGzVvQm33AGJI8mT/HqwOrhR0xjuQqk0GS+zX3Ds7fBhxYBT/vVT9c/C8UWQZ
         ybQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113833; x=1720718633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wr02nhq0ruDtDnhEwyMKYxGviJTN4mPbs3lAEzqdbjQ=;
        b=sJEVGbGVuJNzj0IG1lwWNecyTzVOEzZiGdVMiW0GwSDSsYMsOl3L8t0MMy5W9JG9kf
         fWzWISZdRU1OPNsKpi8KNz4NFuBa9SKQkZBE1tJzHV9S5QY0p7BNw77sogLVvyDDyToN
         wtchz9CVSsny3vXtGs5S+zbCzCayW2d6itnmaFuk9xMa4jtJMdPJjXQLoNoLb3lODi8k
         pE3QKdqN8cjPbszIOEZIeo0Cs4Uw97R7SmVN/My+Q4u6or2MF8CYIpBHRn88En6t1dxm
         xR32BuAnMEq2ygzdLYK1/Ueq6/vxqyUnl55HjLZYwCQuePjDNfirwGwHDg3BUVtC20Co
         ZXnA==
X-Forwarded-Encrypted: i=1; AJvYcCXEfPzyH8Z5/Z1rYzZmYCjLJjsAw5OUfzbX4Yz1s2/cam+6362BqK1Z0OyRixIeKDIpdMtmRlWBCj0Oks72YhV5cgP9
X-Gm-Message-State: AOJu0YyxCv7wgIN4b0pHXZ5htPnASBBVq95TkBZm9JRGFuuhB088NJHW
	/TvtSI3n9j7LcIplPEP8AYoRkJ1PVyJyhPh/LBiRBoJwzO6gzYG5
X-Google-Smtp-Source: AGHT+IFaOHK66rTgpsI1mVY32hRGS0C436uv1mOtnFsmLU7vwSfmFKSY7u4YyT4jP3ZsAP4H3kcIsw==
X-Received: by 2002:a05:600c:54e6:b0:424:ac5a:fc38 with SMTP id 5b1f17b1804b1-4264b161646mr22944445e9.13.1720113832924;
        Thu, 04 Jul 2024 10:23:52 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:52 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:25 +0200
Subject: [PATCH v2 15/24] mfd: tps65086: Constify struct regmap_irq_chip
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-15-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=789;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=LwSmNpQz2F+cwYbYyqp+ffrrtmaCiTXzgTUcnJr7s7Y=;
 b=Ga7N1b/SpgEIyEu0aZQV3PU+tllasHbqTeEu2H48IX0j1TQxkzLPgurg30X0upgDQ5eR08P5N
 ndiG9G14SvzCP0egigQTIaPWc+bbDfiV5mbUyq8hTRPcjthD8A/R82J
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`tps65086_irq_chip` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/tps65086.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps65086.c b/drivers/mfd/tps65086.c
index 5ef0a7e0d61d..54832e9321b9 100644
--- a/drivers/mfd/tps65086.c
+++ b/drivers/mfd/tps65086.c
@@ -45,7 +45,7 @@ static const struct regmap_irq tps65086_irqs[] = {
 	REGMAP_IRQ_REG(TPS65086_IRQ_FAULT, 0, TPS65086_IRQ_FAULT_MASK),
 };
 
-static struct regmap_irq_chip tps65086_irq_chip = {
+static const struct regmap_irq_chip tps65086_irq_chip = {
 	.name = "tps65086",
 	.status_base = TPS65086_IRQ,
 	.mask_base = TPS65086_IRQ_MASK,

-- 
2.40.1

