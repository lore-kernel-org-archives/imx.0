Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0044E14534C
	for <imx@lists.linux.dev>; Thu,  4 Jul 2024 17:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113846; cv=none; b=Q1TJ1qwuCSXSjBS/PK6QAlkhQKeMCRnUEAxeN7VUlqIOUNr+1K2Rg/BOVZe9DKU0AM6tSm1ZztFyMpte7P57735wmO7UoO5Ttr0F4NtlkbeKTFPHkJLUvkWe3LGsGlV+brO7nYtIFrqdiP0x4B/3HLhQUpA6mvtfzrwR2JyltQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113846; c=relaxed/simple;
	bh=I1B1ilDX59ObzFXRiLamzLxGbqf5Ec/FSPD99VWZz6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YVGExzvMJcp8kvhYRe8uq1elx41gNqYK49lxsVwaoZ1aHxK1aVsViB+A8DJ3rCMafBMmcbNFhzwfU3l6C2ouSSaeyBk2NaGU+aARKIn7tAkW0IOjaK9gkmUWeHPwDsoe43hCTkSEEEbIHLqc3NADSpq9PuKCs0aEZILxRxlde1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EC30ovG1; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EC30ovG1"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4256788e13bso5610845e9.2
        for <imx@lists.linux.dev>; Thu, 04 Jul 2024 10:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113843; x=1720718643; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gn3WijEYYGde2qMFgclnizlvC5BdhQ9moOhVny9AY2s=;
        b=EC30ovG1PaEVWlBtn+AulgWY6CegGRT39BjBCed7N6xgOpkHphbacQBK6gPOdwQqC6
         EeslHAeyeJGRC+q7lRJ2wQDdI1Hk/NfQ89lZ0ODywOcs7AN5QY7LRe9XV2Kb9ACzAmJj
         hny13RN6P3+p7akpX9YKu6zvhmGMuA/xO2WKx+/5UphqKglHk9ZzlsTI5gSAqpOMpW4W
         o3rPGfe20jKNyaB8Hkl4M6r8hXhMbbYEVvYBE8MTFGcL78LyLS9+m0uONQq5oCh5VvGT
         vKgXO6JHoMdRgbTA7IQ8BWF31MNwcphLRth1AgCjKkD4mLNSwmxgk7BCO5HsQ8Okmp32
         7GHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113843; x=1720718643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gn3WijEYYGde2qMFgclnizlvC5BdhQ9moOhVny9AY2s=;
        b=Zf/kMBLe5qbp+JoxSz/8ofdCOXormrckysmF3pw++APS1TFCdybB46YooUUxYJ2dcl
         DXn5/K8mrjZrcOC8IzmXGyHCEicYUL0HZFXY5fi1BisQQyrF4NLy81MzU8iRZ3OYNEmq
         58vyb3UeKPKKi6qsT/v1iIle2zjMPGzDTKHppec3NRzSuI0eEnCm1Vk/3Heb+Dv5NC8S
         zoFgocADwon07gFkhg0M2pfYgmZXjlRXaGgTGv1v8CTJwQlqC05okLalU56kZvddhau7
         8PJqnIXZv8kqcLZJLTDBd4QpWrvrmn7DQ8Hv9SYAODPx+qdf8xx53rhL1ZrtF15IFvo5
         Ajyg==
X-Forwarded-Encrypted: i=1; AJvYcCWHVdilzLb8UFC8i2Jk1xWBLrMWJbLz9+HM2k06PkNmAoTtNxpjmgFglsR3iKY5+SPjlailJIbII2dpQT+Rd1p/5bvI
X-Gm-Message-State: AOJu0YzaV3gYEsjlGBCBval7zy1F25fRmicCw2jsYb0tCThp4oVr2cK0
	yl8DEZBjC3pCQ5TKVzmnDmNIi6tZfb6V1yamRjcLhNg84U9MbxT1
X-Google-Smtp-Source: AGHT+IG8fvyaCf2xyaf4M0QD3gyhQ5so/8RLHuVFkZijuO6tcEmwm6nfnnrw7he/U7Ta9U4kzKBZew==
X-Received: by 2002:a05:600c:1790:b0:424:9c01:a0d3 with SMTP id 5b1f17b1804b1-4264a3e1ed0mr16677795e9.12.1720113843415;
        Thu, 04 Jul 2024 10:24:03 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:24:03 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:31 +0200
Subject: [PATCH v2 21/24] mfd: twl6040: Constify struct regmap_irq_chip
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-21-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=764;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=I1B1ilDX59ObzFXRiLamzLxGbqf5Ec/FSPD99VWZz6k=;
 b=DPFTUWQEWuGtIwm/j9T6GPVHIPN77LuC5ioFZw9oHtvtRTePW/hpN/Pt/2X0ooGTAt+cutNl9
 YaWp2rV/4cFDw0I5jfzOYVelqe9Z2XCztXhQKax4HDng0YcrKonQ2Su
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`twl6040_irq_chip` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/twl6040.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/twl6040.c b/drivers/mfd/twl6040.c
index c184e8bfab7c..218d6195fad2 100644
--- a/drivers/mfd/twl6040.c
+++ b/drivers/mfd/twl6040.c
@@ -620,7 +620,7 @@ static const struct regmap_irq twl6040_irqs[] = {
 	{ .reg_offset = 0, .mask = TWL6040_READYINT, },
 };
 
-static struct regmap_irq_chip twl6040_irq_chip = {
+static const struct regmap_irq_chip twl6040_irq_chip = {
 	.name = "twl6040",
 	.irqs = twl6040_irqs,
 	.num_irqs = ARRAY_SIZE(twl6040_irqs),

-- 
2.40.1

