Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9CF3BED31
	for <imx@lists.linux.dev>; Fri, 29 May 2026 10:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049927; cv=none; b=LPtCdZX6j6DTVkCBybY+3QZRDMDHWbOUlZP0zaPkiby2WpT+EoYDWUOlO8Q+kJEDHenc8ineXmYhWqbzFTSsajLB9R9lwPD2LmTpNJemF3o7Y7gk0TvEe1BjWXIKB5c+gqOuf4/msf6+M0LXmW+A5PZ1VHIlhV0cAAV/lWj9OqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049927; c=relaxed/simple;
	bh=W9xT+mzvNTBez1lAU3xkbd8dVtQp/hVdeRLR+vfLdCE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fh3l/w4eF5WKbT/5yal1FYnoEMkOs5mnQ325hCOU0CAvy2yip25sWolht7+OCH/iPBVjFVBmavVyeWF8rSVQluxwzW+1fisqXtR8syqqbJ9043Q+T/5Qo6etSsOFpugVBN42xO5/wc41CyixQywD7FEJkzuZNqpnksOFRfPuUAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=B8eolCL6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="B8eolCL6"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49039a8851fso81461085e9.2
        for <imx@lists.linux.dev>; Fri, 29 May 2026 03:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780049924; x=1780654724; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4zSRLTrRKREVH9IqS8el7yHWyFDWA9l51ZOzDmK9sI=;
        b=B8eolCL6rTEslpd5Msup4C/q9o3d4FtP3vL5vEfbEY66lT8q0FSEiUl4tAQVVZh/gf
         dUHOeFtdrSq0m80kQo1ZhgIQ4l4wYawrX2LeZBsemgo2zURJLgtRu7US+a8wMo/SjeAf
         mJV9Z32z7ti5papPjxarwi9uQj6ZNLItxn6vnTz61HcIJrbJOQM98sMm/MW5cGshMms4
         hb+UZGn1siOpvRAn4wLl/oVhMQgSjsrXlnmO00NGCsmODxuJNapzLTEsh4vdtBUHcaFJ
         rf3djA65Tfc/sMV7dBG6OwMZ2a4RgxEdEU3Ga6YR2zywPzi4+wD+KYs0e3NEca3wsrYm
         B86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049924; x=1780654724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P4zSRLTrRKREVH9IqS8el7yHWyFDWA9l51ZOzDmK9sI=;
        b=f5OMB2nPGAPUbYK0JBmLnWLPRyPRGmwL3mIbzm4mrjfZdtP0kR7GxEbdBHsbQl3lLV
         oeG9BXM8/A6IQF698qQYvwp3IhXCgN9MCj5svSd4v+i60mkkzZWFUy6w+2PO1SBmtuX+
         I2vTJc0HfggBNwwKB7o22oi4XkKj7NlTXOK8/LX7aNUSZKsFym4uOGYTh16xYmexTjZw
         OfWPrVYbCETtj7Twx1xR9XMQYrgRZMbfzqTocoz4DJSsFS+K+UnZ9VdoVWavmhtkiIez
         PcrjZpVGLKcyEv4sC843wPU4eJjtgsJ+F0JCTikhp9hRzqZy8/s0YcqBbWd5z3zPopn3
         z2Uw==
X-Forwarded-Encrypted: i=1; AFNElJ8pRkQsbhoXXCLobEfzTSzarldoguKPlkYevbujbxEuTfm84v81CSw1kjdi9fi6Ckyhf38=@lists.linux.dev
X-Gm-Message-State: AOJu0YwgopktPG/MhHw8uSCmEsHJnqKotgyThx4eQvbqSVfkwhCChuR1
	XrV34Qg5aIwwOaqa+fAGRqwapaz1I/qSdvY6ENykeu/qecgV0/tc0xaaEBSClhf8UC0=
X-Gm-Gg: Acq92OFfM40PU00uiZ9rmAH5jiV8fcLxgEWkqReyLmMIZrHzcVO8QQ20lemqYaUSrjj
	ri5yhiNN4OQVkmk0PH1s8a/7m1OWA9Lz3Is3LWtrNZX1dq9RnI+VgZXjS4wr8+O4GuuqOq5RwUb
	/N/Y13JvXXZIgdfqQEMylOUPSoztyPdxUqgobUCGeq8oQ2VzEKDQaMKbkAcupC/qnmkrtifJk4M
	32ELgIrrNBq93Y88/tczjr3oCQWGqQuJ2FY8tY3uJRk1XJMlq9Bp4K/qCvG5S6WQkzU4l3Dyluu
	jOh7JQHz8zNjpVc0UyBM06JCVQrGqTaVs36O4XoP7xd7Phs+++BZyx3zEDwDre/xYrCAT57+8zM
	s4EremmjWBB09t16SkXi8KkS99TYyhdA//JW0xK795PB40Ej35zVvqori+hz5mONJn1+zxoMYHV
	4T0G4HZ9MjTl+U9zbumH+HimeQNEwjEVAmNY9TXwwk3V090fSx3kf/ucWdUC2LrZftfiFa8ZxQl
	VJFNchcGb7Hob/Dt7AKWMgvbA==
X-Received: by 2002:a05:600c:58ce:b0:490:44eb:c1ea with SMTP id 5b1f17b1804b1-4909c0b546cmr30191565e9.24.1780049924381;
        Fri, 29 May 2026 03:18:44 -0700 (PDT)
Received: from localhost (p200300f65f47db043f932d8b97293bf6.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3f93:2d8b:9729:3bf6])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4909c0ad269sm11855695e9.11.2026.05.29.03.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:18:43 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Amit Sunil Dhamne <amitsd@google.com>,
	Samuel Kayode <samkay014@gmail.com>,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: [PATCH v1 4/6] power: Use named initializers for platform_device_id arrays
Date: Fri, 29 May 2026 12:18:19 +0200
Message-ID:  <1ceacf4f9c3f827bcad85b378aa04cdca1c04635.1780048925.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
References: <cover.1780048925.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5348; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=W9xT+mzvNTBez1lAU3xkbd8dVtQp/hVdeRLR+vfLdCE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqGWfy0bX/m5kq8Arlyt5XE8Z+Ge+pZiRLveebn 4cklmt0zVmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahln8gAKCRCPgPtYfRL+ Tgj4CACZl/QxMesCrrIl4aNkVxWwxHLc2F2zJNbXP7mUNUZy6iSAQRmCPv/wrBPSa2TyyvCYd7T zCUw3L9LezGtcTAcu4AT6betYFrT3vdx2aMXWqk/lunJew9bTfAOihdCMJcA3jLt0SHECHUBYCt 8ibifSKnMpS9cmgT1+nXA/3x0Zp26IE6mNdFJai3hgNrNtpW+8MKMX2tBk/3VT6uv4nv3bzs5JR DZ9/1h8ng6iT+z6mSE3NjM83dSCzN+fkhK6EXTAZ8k0GaxqyY4TdqZSyZdPCeFum1xeDSRiVunl YedBpxql0w3n64ysMOen1PE+PCNSTxrCd0ATCblCqdxOqrhO
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Named initializers are better readable and more robust to changes of the
struct definition. This robustness is relevant for a planned change to
struct platform_device_id replacing .driver_data by an anonymous union.

While touching these arrays unify spacing and usage of commas.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/power/reset/spacemit-p1-reboot.c | 4 ++--
 drivers/power/reset/tps65086-restart.c   | 2 +-
 drivers/power/supply/bd71828-power.c     | 8 ++++----
 drivers/power/supply/macsmc-power.c      | 2 +-
 drivers/power/supply/max77759_charger.c  | 2 +-
 drivers/power/supply/max8998_charger.c   | 2 +-
 drivers/power/supply/pf1550-charger.c    | 2 +-
 drivers/power/supply/rt5033_charger.c    | 2 +-
 8 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/power/reset/spacemit-p1-reboot.c b/drivers/power/reset/spacemit-p1-reboot.c
index 9ec3d1fff8f3..84026b042ea2 100644
--- a/drivers/power/reset/spacemit-p1-reboot.c
+++ b/drivers/power/reset/spacemit-p1-reboot.c
@@ -70,8 +70,8 @@ static int spacemit_p1_reboot_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id spacemit_p1_reboot_id_table[] = {
-	{ "spacemit-p1-reboot", },
-	{ /* sentinel */ },
+	{ .name = "spacemit-p1-reboot" },
+	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, spacemit_p1_reboot_id_table);
 
diff --git a/drivers/power/reset/tps65086-restart.c b/drivers/power/reset/tps65086-restart.c
index 6976dbcac74f..37d248a9df17 100644
--- a/drivers/power/reset/tps65086-restart.c
+++ b/drivers/power/reset/tps65086-restart.c
@@ -41,7 +41,7 @@ static int tps65086_restart_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id tps65086_restart_id_table[] = {
-	{ "tps65086-reset", },
+	{ .name = "tps65086-reset" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, tps65086_restart_id_table);
diff --git a/drivers/power/supply/bd71828-power.c b/drivers/power/supply/bd71828-power.c
index 5e78faa0a4aa..5ab514ff5c65 100644
--- a/drivers/power/supply/bd71828-power.c
+++ b/drivers/power/supply/bd71828-power.c
@@ -1184,10 +1184,10 @@ static int bd71828_power_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd71828_charger_id[] = {
-	{ "bd71815-power", ROHM_CHIP_TYPE_BD71815 },
-	{ "bd71828-power", ROHM_CHIP_TYPE_BD71828 },
-	{ "bd72720-power", ROHM_CHIP_TYPE_BD72720 },
-	{ },
+	{ .name = "bd71815-power", .driver_data = ROHM_CHIP_TYPE_BD71815 },
+	{ .name = "bd71828-power", .driver_data = ROHM_CHIP_TYPE_BD71828 },
+	{ .name = "bd72720-power", .driver_data = ROHM_CHIP_TYPE_BD72720 },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, bd71828_charger_id);
 
diff --git a/drivers/power/supply/macsmc-power.c b/drivers/power/supply/macsmc-power.c
index 33ca07460f3a..ced07f71e0a8 100644
--- a/drivers/power/supply/macsmc-power.c
+++ b/drivers/power/supply/macsmc-power.c
@@ -834,7 +834,7 @@ static void macsmc_power_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id macsmc_power_id[] = {
-	{ "macsmc-power" },
+	{ .name = "macsmc-power" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, macsmc_power_id);
diff --git a/drivers/power/supply/max77759_charger.c b/drivers/power/supply/max77759_charger.c
index 9bb414599f16..c606d7bafcb8 100644
--- a/drivers/power/supply/max77759_charger.c
+++ b/drivers/power/supply/max77759_charger.c
@@ -754,7 +754,7 @@ static int max77759_charger_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max77759_charger_id[] = {
-	{ .name = "max77759-charger", },
+	{ .name = "max77759-charger" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, max77759_charger_id);
diff --git a/drivers/power/supply/max8998_charger.c b/drivers/power/supply/max8998_charger.c
index 418b882b163d..b0eda2b51e7f 100644
--- a/drivers/power/supply/max8998_charger.c
+++ b/drivers/power/supply/max8998_charger.c
@@ -188,7 +188,7 @@ static int max8998_battery_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id max8998_battery_id[] = {
-	{ "max8998-battery", TYPE_MAX8998 },
+	{ .name = "max8998-battery" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, max8998_battery_id);
diff --git a/drivers/power/supply/pf1550-charger.c b/drivers/power/supply/pf1550-charger.c
index a457862ef461..41036f4cb64a 100644
--- a/drivers/power/supply/pf1550-charger.c
+++ b/drivers/power/supply/pf1550-charger.c
@@ -622,7 +622,7 @@ static int pf1550_charger_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id pf1550_charger_id[] = {
-	{ "pf1550-charger", },
+	{ .name = "pf1550-charger" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, pf1550_charger_id);
diff --git a/drivers/power/supply/rt5033_charger.c b/drivers/power/supply/rt5033_charger.c
index de724f23e453..536ab29b657d 100644
--- a/drivers/power/supply/rt5033_charger.c
+++ b/drivers/power/supply/rt5033_charger.c
@@ -727,7 +727,7 @@ static int rt5033_charger_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id rt5033_charger_id[] = {
-	{ "rt5033-charger", },
+	{ .name = "rt5033-charger" },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, rt5033_charger_id);
-- 
2.47.3

