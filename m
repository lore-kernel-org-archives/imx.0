Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52FB334C0D
	for <imx@lists.linux.dev>; Fri, 29 May 2026 10:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049923; cv=none; b=i391YH6QHHHINMM0+ifZ1Mw/qdNb6opgCqR5KHab/iTXQ+xcxArvGYpc5XuYEg0UugGludsROBWetSG9SfYCBJ2NYKltZsBCoRXIYdaXeSql2mechEseON8Bz+zPJuIqVN/xKMSFGGRdgg8V2QdXaVEgF2ajD52IHe8IF4JbT84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049923; c=relaxed/simple;
	bh=HR0BG2x5gStI8qVvDgUBsjfK17M95+4vrnDaD2QTsYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aqXYybN2EWaAwTkKk7Ol3S31X/YeiH/a2smW5TmIAmVzb9DYfJ9/lCMLK9RE32fz87LrwbVdI0tKNecFanss8zO0Qe5DsBIuVXunRrPuuaFuN0ATbj0SZF/CGtwS8Mh83KvHKbdHpncIpX8FXuCc5Wa9cLsfKUDcC9HSySiEZcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=anZB5nmx; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="anZB5nmx"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-44e1860558fso8569469f8f.0
        for <imx@lists.linux.dev>; Fri, 29 May 2026 03:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780049919; x=1780654719; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gRuenZrko78jZddy0UFWO+BRki0zaXyQrkNHtJpBvQk=;
        b=anZB5nmxohmHhx0MeKzlf0ac3ussNCFyihbkn5KFtVLLH8Ey4M/boSc9Bu572OZZyb
         JvqRVyaS0MRAsmVRGufFBDTnHE/uYbM72TMvNmR5K6suNuaUzw74XuCqP0Phe1uc2bet
         T3SiEXVDVXpvMnn0RdvQq8SspDNioKN3ze3Q++KOaVvv1krXoMnTaxcvTD5mEMlt1ast
         aidnNTVNX6gulYdmYn1+Z8ODQ/4fVnYNQuTyPvHF7/CWKT39MLKSWQL8zRgxXZwmkT+t
         +vdBE+Q9aIamzqQbzYZ89ZfvkairAkU1NSN3WkFM9yjAmGE0yz1ErZZLN7g4SrzvJk71
         A22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049919; x=1780654719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRuenZrko78jZddy0UFWO+BRki0zaXyQrkNHtJpBvQk=;
        b=CtQeBRej6orgnXiA33bH5EGWuRwTCQsPOXoAhok6Tu3ZoWTC2iwqKqoGg199rs1TRI
         cb3WtAWfd8mKXc5Y8X3xqM+13q6y0yLBuHxhhtC+B7F2UsvVfJZTQiZhk6oP+pw+vdkD
         VDf9aV4EbI6oJLqoaOp5Mi+Buw6YMASQj5cMdf9adws+yaQtwJHMpR4ee7+b7y9xArNd
         gP6o9bNzl6s0PQkD6E+Ey5QP8V2Fd28e2PwzDkujOwgKDrUrM0whFPR5hQVeXGRIowyv
         Kn+pv/cFHxbacUrdLkgs9p2jtu9D2BA3bl0dVufH5+fTMgLTG9/KMksvCQJDfytnBgIr
         mQQg==
X-Forwarded-Encrypted: i=1; AFNElJ/RJ089RFSlZrW24Nqy+wE2FaF8HwTtEtzPvtYac0CXpPEyXivg8891A+/AybFNfwjLYhM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzLQ+tgyA7UVNqvodks1QiCzhm8+tc+HQbfu6LHKRZfKo/eIpAd
	qps1rt6DT55xCbQpsTtdoyoOK7wHoYT2bMKXS8xqdY5iClDtmswpTGEY9gTwRvn7guE=
X-Gm-Gg: Acq92OEAkI5N13qJMxebhv+APG1b7tdvJIQINxQpu96R9vatdrkQtAHjC4DoBBj3a/7
	l8bzPNyJWO/i6W49klt5wTJLrkIVv8nNUyDlxDCe/xiIwBd067Ok2S7Qn4P+8KeY9mo4+Qt6zgO
	MgN9Zc8Lm6MmIs0vewWAN5MYHtYX+ggMUyv5G3mwY5QJ36JgALM740XOJVWjndruTrSiNgr32sH
	tVv2urFG0u/zP+awGEzhZbdZYK8ctd2AhjhiEpBxSt2VSDzTjbTezM1h5rg1ylrbZEBV5Ze1gu9
	uCNoNXuUNtSZXexjEDKcT4hLS5EL75qGsPaweSvGRSfhgWFIaZpl6GrZCtLkeTPfGHUnxuBQrcO
	Rq2omJL0w/8yrG6hmaWEmjD25Wi7Hv7MyBM9erxjYqm4BJxmUhtKG6S5zNLTwLTqErjiiob8klJ
	H3EReulEOIBWFmhlPR8hDIWvurz/5zip+9HFyjhWF65+U/864HEuKR+6KlHQ3XIRu4dXz6eDl6d
	GZwf51NlYb0zxBJEPl5nVt7wQ==
X-Received: by 2002:a5d:6f03:0:b0:45e:ef4a:8192 with SMTP id ffacd0b85a97d-45ef14aeca6mr4456766f8f.38.1780049919017;
        Fri, 29 May 2026 03:18:39 -0700 (PDT)
Received: from localhost (p200300f65f47db043f932d8b97293bf6.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3f93:2d8b:9729:3bf6])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45ef354cd7csm2359192f8f.18.2026.05.29.03.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:18:38 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	=?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Hans de Goede <hansg@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Purism Kernel Team <kernel@puri.sm>,
	Yixun Lan <dlan@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Samuel Kayode <samkay014@gmail.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	asahi@lists.linux.dev,
	imx@lists.linux.dev,
	Chen-Yu Tsai <wens@kernel.org>
Subject: [PATCH v1 0/6] power: Use named initializers for platform_device_id arrays
Date: Fri, 29 May 2026 12:18:15 +0200
Message-ID: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5698; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=HR0BG2x5gStI8qVvDgUBsjfK17M95+4vrnDaD2QTsYk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqGWfoDIuZ0g/W2ypE62dFHULfUWoyzPSByuJOy zumyQmeqqeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahln6AAKCRCPgPtYfRL+ TsKPB/9mAyfp+pLZiIDxZa/Gq+SSHanqJrTQwpZ9rQFWh6BTlVwAzfy9/iK3DTaEC0m73vbGFfQ SrrV9RH9jd6SuuSNJEy+P030qdvrNgwnqe9+Kw6h9Ox1Xf/WbmVgbFqiAvBlC9bWaxNYlaSXA6b k6D0JHKSjZPpHgGWSl8de58GW9wTOhD4G7APcHqvig2ElcuxKXGEJMbDiI5C+wM6c/uNZYGDKQH Gyln8usdt6LIe+L24f+S0WZZOkN5b75oBqE1U4SirbgWSV0oQR/VgR5R3MVvLMMrmyqPiFaaawD fWqFsf8PmmOgcfZvBQ4ZGzTElp/ezMarN1H6m653QUtXR1kb
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

this series targets to use named initializers for platform_device_id
arrays. In general these are better readable for humans and more robust
to changes in the respective struct definition.

This robustness is needed as I want to do

	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
	--- a/include/linux/mod_devicetable.h
	+++ b/include/linux/mod_devicetable.h
	@@ -610,4 +610,7 @@ struct dmi_system_id {
	 struct platform_device_id {
		char name[PLATFORM_NAME_SIZE];
	-	kernel_ulong_t driver_data;
	+	union {
	+		kernel_ulong_t driver_data;
	+		const void *driver_data_ptr;
	+	};
	 };

which allows dropping several casts and eases porting CHERI to mainline
linux. A possible follow-up change is the following example:

	diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
	index 5d61053e0596..03bc8e859d73 100644
	--- a/drivers/gpio/gpio-pxa.c
	+++ b/drivers/gpio/gpio-pxa.c
	@@ -534,7 +534,7 @@ static struct irq_chip pxa_muxed_gpio_chip = {
	 static int pxa_gpio_nums(struct platform_device *pdev)
	 {
		const struct platform_device_id *id = platform_get_device_id(pdev);
	-	struct pxa_gpio_id *pxa_id = (struct pxa_gpio_id *)id->driver_data;
	+	struct pxa_gpio_id *pxa_id = id->driver_data_ptr;
		int count = 0;
	 
		switch (pxa_id->type) {
	@@ -708,14 +708,14 @@ static int pxa_gpio_probe(struct platform_device *pdev)
	 }
	 
	 static const struct platform_device_id gpio_id_table[] = {
	-	{ .name = "pxa25x-gpio",	.driver_data = (unsigned long)&pxa25x_id },
	-	{ .name = "pxa26x-gpio",	.driver_data = (unsigned long)&pxa26x_id },
	-	{ .name = "pxa27x-gpio",	.driver_data = (unsigned long)&pxa27x_id },
	-	{ .name = "pxa3xx-gpio",	.driver_data = (unsigned long)&pxa3xx_id },
	-	{ .name = "pxa93x-gpio",	.driver_data = (unsigned long)&pxa93x_id },
	-	{ .name = "mmp-gpio",		.driver_data = (unsigned long)&mmp_id },
	-	{ .name = "mmp2-gpio",		.driver_data = (unsigned long)&mmp2_id },
	-	{ .name = "pxa1928-gpio",	.driver_data = (unsigned long)&pxa1928_id },
	+	{ .name = "pxa25x-gpio",	.driver_data_ptr = &pxa25x_id },
	+	{ .name = "pxa26x-gpio",	.driver_data_ptr = &pxa26x_id },
	+	{ .name = "pxa27x-gpio",	.driver_data_ptr = &pxa27x_id },
	+	{ .name = "pxa3xx-gpio",	.driver_data_ptr = &pxa3xx_id },
	+	{ .name = "pxa93x-gpio",	.driver_data_ptr = &pxa93x_id },
	+	{ .name = "mmp-gpio",		.driver_data_ptr = &mmp_id },
	+	{ .name = "mmp2-gpio",		.driver_data_ptr = &mmp2_id },
	+	{ .name = "pxa1928-gpio",	.driver_data_ptr = &pxa1928_id },
		{ }
	 };
 
increasing readability due to less casting. Also this results in the
compiler warning:

	drivers/gpio/gpio-pxa.c: In function ‘pxa_gpio_nums’:
	drivers/gpio/gpio-pxa.c:537:38: error: initialization discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
	  537 |         struct pxa_gpio_id *pxa_id = id->driver_data_ptr;
	      |                                      ^~

which is a good thing as adding the needed const to fix this warning
improves type safety. (Sorry, no driver below drivers/power benefits
here, so the example is from a different subsystem.)

Patch #5 is just an unrelated change where I spotted the patch
opportunity while preparing this series. It's included here just for my
convenience and could be applied independently.

If you consider the last patch mostly churn, just drop it.

There are no dependencies between the patches, the only file that is
touched in more than one patch is drivers/power/supply/mt6360_charger.c
and even if these (i.e. patches #1 and #5) are reordered, git should be
able to cope with that without conflicts.

Note that this series is only build tested, and there is the possibility
that I failed to spot driver data usage that render patches #2 and/or #3
wrong. So a deeper look on at least those two won't hurt.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (6):
  power: Drop unused assignment of platform_device_id driver data
  power: supply: max14577: Drop driver data in of and platform device id
    arrays
  power: supply: max17042: Drop driver data in of and platform device id
    arrays
  power: Use named initializers for platform_device_id arrays
  power: supply: mt6360_charger: Use of match table unconditionally
  power: Unify code style for platform_device_id arrays

 drivers/power/reset/qemu-virt-ctrl.c           |  2 +-
 drivers/power/reset/spacemit-p1-reboot.c       |  4 ++--
 drivers/power/reset/tps65086-restart.c         |  2 +-
 drivers/power/supply/axp288_charger.c          |  2 +-
 drivers/power/supply/axp288_fuel_gauge.c       |  2 +-
 drivers/power/supply/bd71828-power.c           |  8 ++++----
 drivers/power/supply/charger-manager.c         |  4 ++--
 drivers/power/supply/cros_charge-control.c     |  4 ++--
 drivers/power/supply/cros_peripheral_charger.c |  4 ++--
 drivers/power/supply/cros_usbpd-charger.c      |  4 ++--
 drivers/power/supply/macsmc-power.c            |  2 +-
 drivers/power/supply/max14577_charger.c        | 12 +++++-------
 drivers/power/supply/max17042_battery.c        | 14 +++++++-------
 drivers/power/supply/max77693_charger.c        |  2 +-
 drivers/power/supply/max77759_charger.c        |  2 +-
 drivers/power/supply/max8997_charger.c         |  2 +-
 drivers/power/supply/max8998_charger.c         |  2 +-
 drivers/power/supply/mt6360_charger.c          |  6 +++---
 drivers/power/supply/pf1550-charger.c          |  2 +-
 drivers/power/supply/rt5033_charger.c          |  2 +-
 20 files changed, 40 insertions(+), 42 deletions(-)


base-commit: f7af91adc230aa99e23330ecf85bc9badd9780ad
-- 
2.47.3

