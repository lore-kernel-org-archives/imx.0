Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CAA353A9E
	for <imx@lists.linux.dev>; Sun,  6 Sep 2026 06:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788675556; cv=none; b=HxiBdKwb8CLL2eccr+8lNLRFq2FM2xyKuSAFoygKE5VPThpieBbTmAQwy5hhZcTPmNWJi1uv5FQFhr1OSrbunXlm13NNeMxcVXmLE92SiOb2E0vTYhhtOrN/agdH7Y6wF8ZpemOE4NsKtNh2Zb/PDNf9TCRej1bQWrbFQkUqB1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788675556; c=relaxed/simple;
	bh=Ss7geLSo4QMEZ4B3x1S5NF2GS/0eMUyia4inV+Q9JpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OTUtrx37RAhCoxsHREZJ6rMBOe8bueyNZo8iHVj6lun0Ii18ZW7tGEmwbaOSWtBisHw7wooj7s0hOhqjPgS+S4f4NFerQA40XJ023V8AB4UfyWNrk9FhkJBxW6Z4n3ZiGq4Wj92GdBKQ9Foa4HrISvO7JlyRVwcLVAQBZ2/7Rfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zjo7kywK; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zjo7kywK"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ce98cb8165so24880245ad.1
        for <imx@lists.linux.dev>; Sat, 05 Sep 2026 23:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788675554; x=1789280354; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSBnT3FwZUixZgWDq520Ci5om1V2mRpux1OuDBHI5/I=;
        b=Zjo7kywKw3LUzKzdbmy7Z2uyd3mXW+gOvf3YoZF1M16Mzs0/0sOITV0s2HWqfvt0GI
         X+N+pX0Z3qNvvEO178K1H14q81M4G7qn7ys0C74qYNr0GIqoQRtfFPdrhC7TAm0JJuHV
         cJJ5/zeDy+DWyUB5oeHVMhNUgMfrVo9+c0xgaN+rbT8pk3wmlY2rxPv/xHh+6AsNPGSl
         /ImauA9WfY7rheG3ZbvU118rDsJQ9je3HqP9fvl9O2KXWEMFyzwzAqFSMpXWN94XdvAy
         EJLmweeBglGdy2+dhAaNEea7FVZGyKuIxH9s1ulKxmUoFemHnax3vaDPYUcX708ECX75
         XmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788675554; x=1789280354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSBnT3FwZUixZgWDq520Ci5om1V2mRpux1OuDBHI5/I=;
        b=lTJULwulqnxfKuTctCeiNBoGYFkyuLy4h0ePlls0cfXZR4K3DH2YReqO5bJgSuafIv
         aJB5RcY1O3HeGf+5ZdwZPzi3wcupvOOGCCtnTJJCcrvx2yTS6AigXvG0Fk2gPHUBoYVQ
         Jla24BJkf2/4y/q9fzvYjpq1zpN3TZamQ5cw3etrl6y9WVwYPbE7BYoOqoiTPeTv6p7x
         e9u4uSMLrmP5p1YADRn1aLEhNm8qFGDvw0W1PeHa7jKOtFNkqjSjO2ZuOJXbjLxZFOMz
         kJpYYnf7ZHVsn114zpUVZFb7Scz0TzcqO2TCj7b853VXigEEuBQ0tws471qwgO1JIoy8
         pSjg==
X-Forwarded-Encrypted: i=1; AKwUvBw9sm1/v/U7/TAaYKI0qEvNPuStxXUwMdDZmFiz7N04KfBRs/aE21nmiSxSfI28JPJsM80=@lists.linux.dev
X-Gm-Message-State: AFuF++nRwcI7sYomVbHjKvtHhzSfohvcgdWUP7zVXmYlUs9TO+/Qfa+5
	0NiryFuMliLglZKd5nXCYjm+VlBHr/KL4HYQLLIrmm4kyDABbR2gOstw
X-Gm-Gg: AYBFou2ENyLCI/GSBBARayP+4APog4XBNbYWwF/Md3zOoy5epLeBnA7KGefkD7e6e19
	KfcdySIDR5MqF7P7c/LLRRoeQ9J4NvmBg5+xxYL1gR4652USDW0Pyrr2EPeHY1T4d4Yd69BgQYN
	rh1dRe+wxHV2Wwa84bHPCpM8s2t1bT6jNlWQ35gUSscE0F49EWIUajiYS0BVq9PmqthJtPANeDp
	kCzHfpw2X5UZ5dhi3XYnj0CltD69/JiauLnk/oAo4eSz/M1VZ3vtipQ3wauWGIJ/93XR7efWl9D
	epjeQ4h0gFVCI5anTu49cppMRoWFGA5WmbQtNvadDu3he4+qDaWz/wBxvPbYlXKXuWV9+t0JT7B
	SSKfI9BvgUPown9ECQjQMpSbMg0IyNklwlcAYH0HKE69BtpiNyQaeZMfNSH0oBoMxpeX8F2+Fkf
	NQOgT6RwsEirDKbSeMGUZCLQkIdTcYFCBobyDAWR7aZ8AzOyLHVsgpaOZ6uk8=
X-Received: by 2002:a17:902:da85:b0:2bd:2c3a:2a36 with SMTP id d9443c01a7336-2dafad14a8fmr205668835ad.0.1788675553947;
        Sat, 05 Sep 2026 23:19:13 -0700 (PDT)
Received: from gmail.com ([58.84.62.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm18280405eec.12.2026.09.05.23.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 23:19:13 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	krzk@kernel.org,
	peter.griffin@linaro.org,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sven@kernel.org,
	j@jannau.net,
	marcan@marcan.st,
	casey.connolly@linaro.org,
	sre@kernel.org,
	wens@kernel.org,
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH 5/5] power: Use %pe to print error pointers symbolically
Date: Sun,  6 Sep 2026 11:47:54 +0530
Message-ID: <20260906061755.5103-6-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260906061755.5103-1-sumeet4linux@gmail.com>
References: <20260906061755.5103-1-sumeet4linux@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace PTR_ERR() and %ld/%li with %pe and pass the original pointer
directly to dev_info(), dev_warn(), dev_err() and dev_dbg(). The %pe
format specifier prints a symbolic error name (e.g. -ENOMEM) when
CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it falls back gracefully
and prints the raw integer value. This makes messages more readable
without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/power/reset/macsmc-reboot.c        | 4 ++--
 drivers/power/supply/axp20x_battery.c      | 4 ++--
 drivers/power/supply/cpcap-charger.c       | 4 ++--
 drivers/power/supply/cw2015_battery.c      | 4 ++--
 drivers/power/supply/intel_dc_ti_battery.c | 2 +-
 drivers/power/supply/qcom_smbx.c           | 2 +-
 6 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/power/reset/macsmc-reboot.c b/drivers/power/reset/macsmc-reboot.c
index 9fc36fa68676..7b8460a55e9d 100644
--- a/drivers/power/reset/macsmc-reboot.c
+++ b/drivers/power/reset/macsmc-reboot.c
@@ -221,8 +221,8 @@ static int macsmc_reboot_probe(struct platform_device *pdev)
 		if (IS_ERR(cell)) {
 			if (PTR_ERR(cell) == -EPROBE_DEFER)
 				return -EPROBE_DEFER;
-			dev_warn(&pdev->dev, "Missing NVMEM cell %s (%ld)\n",
-				 nvmem_names[i], PTR_ERR(cell));
+			dev_warn(&pdev->dev, "Missing NVMEM cell %s (%pe)\n",
+				 nvmem_names[i], cell);
 			/* Non fatal, we'll deal with it */
 			cell = NULL;
 		}
diff --git a/drivers/power/supply/axp20x_battery.c b/drivers/power/supply/axp20x_battery.c
index ee8701a6e907..915b6f6881db 100644
--- a/drivers/power/supply/axp20x_battery.c
+++ b/drivers/power/supply/axp20x_battery.c
@@ -1123,8 +1123,8 @@ static int axp20x_power_probe(struct platform_device *pdev)
 						       axp20x_batt->data->bat_ps_desc,
 						       &psy_cfg);
 	if (IS_ERR(axp20x_batt->batt)) {
-		dev_err(&pdev->dev, "failed to register power supply: %ld\n",
-			PTR_ERR(axp20x_batt->batt));
+		dev_err(&pdev->dev, "failed to register power supply: %pe\n",
+			axp20x_batt->batt);
 		return PTR_ERR(axp20x_batt->batt);
 	}
 
diff --git a/drivers/power/supply/cpcap-charger.c b/drivers/power/supply/cpcap-charger.c
index 34a57dd5c3cf..d423a8bdc0c2 100644
--- a/drivers/power/supply/cpcap-charger.c
+++ b/drivers/power/supply/cpcap-charger.c
@@ -808,8 +808,8 @@ static void cpcap_charger_init_optional_gpios(struct cpcap_charger_ddata *ddata)
 		ddata->gpio[i] = devm_gpiod_get_index(ddata->dev, "mode",
 						      i, GPIOD_OUT_HIGH);
 		if (IS_ERR(ddata->gpio[i])) {
-			dev_info(ddata->dev, "no mode change GPIO%i: %li\n",
-				 i, PTR_ERR(ddata->gpio[i]));
+			dev_info(ddata->dev, "no mode change GPIO%i: %pe\n",
+				 i, ddata->gpio[i]);
 			ddata->gpio[i] = NULL;
 		}
 	}
diff --git a/drivers/power/supply/cw2015_battery.c b/drivers/power/supply/cw2015_battery.c
index 1bcb60cf763d..48643f7bf503 100644
--- a/drivers/power/supply/cw2015_battery.c
+++ b/drivers/power/supply/cw2015_battery.c
@@ -658,8 +658,8 @@ static int cw_bat_probe(struct i2c_client *client)
 
 	cw_bat->regmap = devm_regmap_init_i2c(client, &cw2015_regmap_config);
 	if (IS_ERR(cw_bat->regmap)) {
-		dev_err(cw_bat->dev, "Failed to allocate regmap: %ld\n",
-			PTR_ERR(cw_bat->regmap));
+		dev_err(cw_bat->dev, "Failed to allocate regmap: %pe\n",
+			cw_bat->regmap);
 		return PTR_ERR(cw_bat->regmap);
 	}
 
diff --git a/drivers/power/supply/intel_dc_ti_battery.c b/drivers/power/supply/intel_dc_ti_battery.c
index cb6fa8d88b43..5819df23a543 100644
--- a/drivers/power/supply/intel_dc_ti_battery.c
+++ b/drivers/power/supply/intel_dc_ti_battery.c
@@ -349,7 +349,7 @@ static int dc_ti_battery_probe(struct platform_device *pdev)
 
 	chip->vbat_channel = devm_iio_channel_get(dev, "VBAT");
 	if (IS_ERR(chip->vbat_channel)) {
-		dev_dbg(dev, "devm_iio_channel_get() ret %ld\n", PTR_ERR(chip->vbat_channel));
+		dev_dbg(dev, "devm_iio_channel_get() ret %pe\n", chip->vbat_channel);
 		return dev_err_probe(dev, -EPROBE_DEFER, "Waiting for VBAT IIO channel\n");
 	}
 
diff --git a/drivers/power/supply/qcom_smbx.c b/drivers/power/supply/qcom_smbx.c
index 67fdb4335338..c8e242341d04 100644
--- a/drivers/power/supply/qcom_smbx.c
+++ b/drivers/power/supply/qcom_smbx.c
@@ -613,7 +613,7 @@ static int smb_get_iio_chan(struct smb_chip *chip, struct iio_channel *chan,
 	}
 
 	if (IS_ERR(chan)) {
-		dev_err(chip->dev, "Failed to chan, err = %li", PTR_ERR(chan));
+		dev_err(chip->dev, "Failed to chan, err = %pe", chan);
 		return PTR_ERR(chan);
 	}
 
-- 
2.43.0

