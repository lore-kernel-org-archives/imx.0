Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500E43F20EB
	for <imx@lists.linux.dev>; Wed, 27 May 2026 10:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779878889; cv=none; b=WR9qlzvyS8u7TLxNoqcRUJ4dXQ1hk6lpJbBQBker/WPzP/HLh26NuJSwdYh2IRs8z71Nrg4JL0RxzLxbFn/jqE+T/YBL0toZ74tDB6qeAdelhO2QCFyrFLV2l9nS3HLYyNlI5fqwluU+85qwkzy+Kc68pMKHnhmaZ2RTVd7zons=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779878889; c=relaxed/simple;
	bh=9Xdnbrncq7VH0BmQ/6t4XS63l5XFKqkc1TeJjnWKNtI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W8XCi4zDHoOLDqcBKFFYLQPvLD7S+q0GpZ1/w0AEt1HmIjoYl7OArnX/NDnYGunfUIOoUP+q8rpKtXlx8yGYwPAA4BUJt31REL7MlT27fQa1lTIULm/GkMORdDaTUjFm24eK37hPAnIre8fCBpbYpE69TxeU7sQoLNJa6bnpFlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HBVEB1ra; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HBVEB1ra"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490426d72f7so48975055e9.3
        for <imx@lists.linux.dev>; Wed, 27 May 2026 03:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779878883; x=1780483683; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yohZLbN4T246kBQJdIC/qXF5efV1Yafvx3na1eLrUw0=;
        b=HBVEB1rahoogS1v9uL391JSfwrp4WADn7l0ncXckH8QCCWkMW2DIN+YapLnI2QlMQ7
         wJ5b2uBlTkJZEHMBqtmjwoENrkTI8XKQBFdQPT847jMYvmBa3wdJ4TyEfWsAH6xRvsPu
         sUFWooS2GoQMoxKDm42PdiQ8iJGFspJ+CNdhWdhD+WBSU922Vu3XalflNpPK0KQvyEFH
         /munetexqt8feGaS8b25WQXs0XrUy6RqEEk6nforSIpK6TdgvSiPU7EMunporOGvnk57
         SPYTAn0qzQvLxUvcvO0WeW+pFByRAbu0GvvL5MLeuDYSuuDcRGIAOSxMLZJf5EVsRoMZ
         f6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779878883; x=1780483683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yohZLbN4T246kBQJdIC/qXF5efV1Yafvx3na1eLrUw0=;
        b=k55Fn6Qqh3RMe8AZWVl2OYDaw38+BynuFkuarKDPLZCrg77TChyfFInAdS2m6ShShZ
         xQo/1j3sBhIjr+t+WF+jyURDqmSDJmXRs8q1tq0lGi2rifvKjd+WTUL1CUs1NQMdzCex
         618YXR0RlnfSYdjyG8Zl4KaNrxy4JjIBJVVULFvS4on/Oz0/f7hCy5vJWi0/ezw3hng7
         DXF8KdZuCScVqspIej4xj5ISe1e3B8CHTED6dOXmYjamVyPP+ol7wHwDVt0Gv4Odk3gR
         XDSmOPGK7Q31BH71VToTnNqhWjIMLZ6b3Wl5TvrEg7+MKCgAi+keIik5RyyIVNqC3GeN
         BVXg==
X-Forwarded-Encrypted: i=1; AFNElJ9tYEuFjbN2RT3oF/krc9H3ZPkjEXU/6X5JekhSoQ3IbYi7gQjzOHKjsDd14GGH0Bo5w14=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywm5SrMsNBRku4AkTqiEi7BKxKTdI1uij8MkjdmGdu0RHozN3Ah
	L8sGTbhyNYj9dmIZBalAUqVVKkgVOTFQ5KPtg66NuGdZ2T31ZfNU0T3lVJIjD0giYcE=
X-Gm-Gg: Acq92OHe6I5ohOSR5Vej/ZV7hCtHJLzkXFfHt1fkyQ3Fg3EaGd2vYKvzC0II19jUaEe
	V9/j9uPQIyYaUGrECPOHBWjdZRGt3VnzLf4sDOhO8P5EunlmJ5Dc5gl8E4vuTiFx0LApGLtTnwU
	m6owSQ+EWqITOMkMio1K+4CPhhtLJfSJmzHnnmqxDHy9z6W76puslf1zBmihhpAgDiRAG8CWU1L
	Xp1/cwabt0pPM4e8/y8F+/x4AqlcurGSySnRISO6qDjOHyQsaT0QhA2rxPVyKIIOExxkRkwdZ58
	OhN3hxZ9QhFRS8IUYzEqXGIRvWkxbJTxyx9crJvQOkmgjd0pUmLeUG0/9udJfDaLCxvafnHIyFy
	Sc/1K5XnmDCHPrXEoLGDtwlk1al2ydELMZcFXeqrycl8CHdDp1DwXy1qz5slmEfzJm7K7Ygt3Iu
	/RYZdkgAfM1P2eo907KYwUEAJO6z3bQ6t2gQx/XII4lZXfihl4gYOTzX4aYJfMWFPeTmTXaCNgk
	AtruO/mTP99UnKSpRIq5uyVEw==
X-Received: by 2002:a05:600c:1f87:b0:48a:8905:a500 with SMTP id 5b1f17b1804b1-490424ad9abmr362404855e9.12.1779878883413;
        Wed, 27 May 2026 03:48:03 -0700 (PDT)
Received: from localhost (p200300f65f47db041edccd9970843bb8.dip0.t-ipconnect.de. [2003:f6:5f47:db04:1edc:cd99:7084:3bb8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4904527526dsm428217795e9.4.2026.05.27.03.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 03:48:02 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Javier Martinez Canillas <javier@dowhile0.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Karel Balej <balejk@matfyz.cz>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Samuel Kayode <samkay014@gmail.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-renesas-soc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v1 0/3] regulator: Use named initializers for platform_device_id arrays
Date: Wed, 27 May 2026 12:47:43 +0200
Message-ID: <cover.1779878004.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5669; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=9Xdnbrncq7VH0BmQ/6t4XS63l5XFKqkc1TeJjnWKNtI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqFsvQ+3pUGvYbTzMBf1U7HpUNs0YqKV82qCwBE o++WwMTehGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahbL0AAKCRCPgPtYfRL+ Tr6TB/9tVIDirqaIFIr+cLHvFRjr/N+HTQz/62BiICc2JJZjFIxmMz6KGMb9PGbAjW0SSau/dN4 zcLMGrCLoC48OmtmlVPfz+h8PG49qdmzJoQkLg4kgndLfg39qqbcPsy5OhkrlgPPzheAU6T3zrm 0WxKp6Wr3LT/anxmAVOQ5FtwjfhMonlFOEOipHYnM2hSfShJ2Bh1eE6IBZytU+c7SY+/nNNsB/D ZC0jCfekfiHdSj1sMmpvYw/JsTRuvgZI4wfY2r4DqR7oE0TrKI5jZLonpB9QKDQyLjLXmkS+xzK bbDtl9bNcjm0Hwz5BysWpXOKEc9oARJLfgXY+NBO7kgQGcRc
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

this series targets to use named initializers for platform_device_id
arrays. In general these are better readable for humans and more robust
to changes in the respective struct definition.

This robustness is needed as I want to do

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 3b0c9a251a2e..b84881f32444 100644
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

diff --git a/drivers/regulator/bd96801-regulator.c b/drivers/regulator/bd96801-regulator.c
index 308279b31fd3..6bbad1f1ddd1 100644
--- a/drivers/regulator/bd96801-regulator.c
+++ b/drivers/regulator/bd96801-regulator.c
@@ -1211,7 +1211,7 @@ static int bd96801_probe(struct platform_device *pdev)
 {
 	struct regulator_dev *ldo_errs_rdev_arr[BD96801_NUM_LDOS];
 	struct regulator_dev *all_rdevs[BD96801_NUM_REGULATORS];
-	struct bd96801_pmic_data *pdata_template;
+	const struct bd96801_pmic_data *pdata_template;
 	struct bd96801_regulator_data *rdesc;
 	struct regulator_config config = {};
 	int ldo_errs_arr[BD96801_NUM_LDOS];
@@ -1224,7 +1224,7 @@ static int bd96801_probe(struct platform_device *pdev)
 
 	parent = pdev->dev.parent;
 
-	pdata_template = (struct bd96801_pmic_data *)platform_get_device_id(pdev)->driver_data;
+	pdata_template = platform_get_device_id(pdev)->driver_data_ptr;
 	if (!pdata_template)
 		return -ENODEV;
 
@@ -1329,10 +1329,10 @@ static int bd96801_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd96801_pmic_id[] = {
-	{ .name = "bd96801-regulator", .driver_data = (kernel_ulong_t)&bd96801_data },
-	{ .name = "bd96802-regulator", .driver_data = (kernel_ulong_t)&bd96802_data },
-	{ .name = "bd96805-regulator", .driver_data = (kernel_ulong_t)&bd96805_data },
-	{ .name = "bd96806-regulator", .driver_data = (kernel_ulong_t)&bd96806_data },
+	{ .name = "bd96801-regulator", .driver_data_ptr = &bd96801_data },
+	{ .name = "bd96802-regulator", .driver_data_ptr = &bd96802_data },
+	{ .name = "bd96805-regulator", .driver_data_ptr = &bd96805_data },
+	{ .name = "bd96806-regulator", .driver_data_ptr = &bd96806_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, bd96801_pmic_id);

which allows the compiler to notice that driver_data is supposed to
be const and thus requires the first hunk.

If you consider the last patch mostly churn, just drop it.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (3):
  regulator: Drop unused assignment of platform_device_id driver data
  regulator: Use named initializers for platform_device_id arrays
  regulator: Unify usage of space and comma in platform_device_id arrays

 drivers/regulator/88pm8607.c              |  4 +---
 drivers/regulator/88pm886-regulator.c     |  2 +-
 drivers/regulator/bd71815-regulator.c     |  4 ++--
 drivers/regulator/bd71828-regulator.c     |  6 +++---
 drivers/regulator/bd718x7-regulator.c     |  6 +++---
 drivers/regulator/bd9571mwv-regulator.c   |  4 ++--
 drivers/regulator/bd9576-regulator.c      |  6 +++---
 drivers/regulator/bd96801-regulator.c     | 10 +++++-----
 drivers/regulator/hi6421-regulator.c      |  2 +-
 drivers/regulator/hi6421v530-regulator.c  |  2 +-
 drivers/regulator/hi6421v600-regulator.c  |  2 +-
 drivers/regulator/hi655x-regulator.c      |  2 +-
 drivers/regulator/lp873x-regulator.c      |  2 +-
 drivers/regulator/lp87565-regulator.c     |  4 ++--
 drivers/regulator/max14577-regulator.c    |  4 ++--
 drivers/regulator/max77541-regulator.c    |  4 ++--
 drivers/regulator/max77620-regulator.c    |  8 ++++----
 drivers/regulator/max77686-regulator.c    |  4 ++--
 drivers/regulator/max77693-regulator.c    |  6 +++---
 drivers/regulator/max77802-regulator.c    |  4 ++--
 drivers/regulator/max8997-regulator.c     |  4 ++--
 drivers/regulator/max8998.c               |  4 ++--
 drivers/regulator/mt6323-regulator.c      |  4 ++--
 drivers/regulator/mt6331-regulator.c      |  4 ++--
 drivers/regulator/mt6332-regulator.c      |  4 ++--
 drivers/regulator/mt6357-regulator.c      |  4 ++--
 drivers/regulator/mt6358-regulator.c      |  4 ++--
 drivers/regulator/mt6359-regulator.c      |  4 ++--
 drivers/regulator/mt6360-regulator.c      |  4 ++--
 drivers/regulator/mt6370-regulator.c      |  4 ++--
 drivers/regulator/mt6380-regulator.c      |  4 ++--
 drivers/regulator/mt6397-regulator.c      |  4 ++--
 drivers/regulator/pf1550-regulator.c      |  2 +-
 drivers/regulator/qcom-pm8008-regulator.c |  2 +-
 drivers/regulator/rt4831-regulator.c      |  4 ++--
 drivers/regulator/rt5033-regulator.c      |  2 +-
 drivers/regulator/rt5120-regulator.c      |  4 ++--
 drivers/regulator/s2dos05-regulator.c     |  4 ++--
 drivers/regulator/s2mpa01.c               |  4 ++--
 drivers/regulator/s2mps11.c               | 18 +++++++++---------
 drivers/regulator/s5m8767.c               |  4 ++--
 drivers/regulator/sy7636a-regulator.c     |  2 +-
 drivers/regulator/tps65086-regulator.c    |  2 +-
 drivers/regulator/tps65218-regulator.c    |  2 +-
 drivers/regulator/tps65219-regulator.c    |  6 +++---
 drivers/regulator/tps65912-regulator.c    |  2 +-
 46 files changed, 95 insertions(+), 97 deletions(-)


base-commit: e7e28506af98ce4e1059e5ec59334b335c00a246
-- 
2.47.3

