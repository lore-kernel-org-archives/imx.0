Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203473B1B4
	for <imx@lists.linux.dev>; Thu, 21 May 2026 00:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779321678; cv=none; b=bPONVflJtQRCKf3y8vf/2vmXFHOfdNHv5QcOvyH59GhN2eTsCTr0hXTKyMPxdIe4KlubjuII8R/H2ii1LGpb3X+UV05e6Fq79x27MaMosc934QSMZMa6ykAgKS0KcHoJUjU11sLbmMX8intUVkTRNLOuxZsGpG88Ukv6kWaUB84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779321678; c=relaxed/simple;
	bh=3Z1/s8TDKCJg12TEEASVieUkMtbUhhy151++MGS6sgU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j8l7UeMnaYmnpFwpWP7Hav0Ao3v9yTjBjoHwb00YB3noLkgnQIQJPklHIoRnirqNzztCinOTQjdA3/iyN0xqJpe3P9D1fCpQUiRoFPV02NAMC23MZQKhp6c6VO28Vh0qzRVZcpsfHgBYN6TCBrB+PBfOkbspxNFPhryUZ7QmJwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=oqfhmVv2; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="oqfhmVv2"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56f72d27e7eso6826412e0c.0
        for <imx@lists.linux.dev>; Wed, 20 May 2026 17:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779321674; x=1779926474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lg+UFUjX2TWBvKvhX5SvfRqht7iHN6Ihdh9sMBKt2/o=;
        b=oqfhmVv2YtPkOf3d7jQASJgMiSbhGmsVWnIWHeWd9W/iM8ORoL5MckK7I6KpNJqOL5
         I55CHWJdx+AQubImeYt56VozNmhm+7Lv2WizwFr6fR/FIcY3l9OeX411AEwnpqylU2x5
         JqTqI3IiZoi13pOBsvUG9DRv5ctgQGULDQZQyxFUN7aGOO/e5qu5OXQ6JSl3fmcwmYxs
         LPT6ZHTJCBYiN+L115X1hCOGmZBO1ljhupjfQcslx13wglOVyW94cVU4B5bQVvXboQlp
         5+VjivdpQ3S16xGN0HBtbkCegm+8kLYzvb0d/MtCr0em7bcX2caSYOssu/8OnpIjftbX
         5+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779321674; x=1779926474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lg+UFUjX2TWBvKvhX5SvfRqht7iHN6Ihdh9sMBKt2/o=;
        b=Ps1jp0KBlTydL512K7LD67uCC6jcZf2627uZN3j75r12wTOVJpX4/1lkKmltpaUq6g
         gfX5e68uNQARCVdJsn5KJG7ANfJdYQERjcsPH+jt4TTp3EHitFf31OesG7AZKrEbpmN+
         //ztgezRRp7zdtCbPGM/cU+KxDPfxOhJ4tycO8PKP194xXN50afXdnnEorgx+yfQdDCj
         kMz31ac/u3rCFS04ZJpMduJX4JxrIuj7B6dHGtPQvVInrHyQSbw72sPKdzQT3BWrhw0g
         qZpxCF/3HHZJi7r42Eny0Mvxp0FBmL8ONA1eg63YFPYhuZ9qa3qTRSaUMUeXNcnRO2yk
         GI9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/67RYNbT/0dC9WFTplrbg8REXBMT+mBbvR80S56w6Lc5K8htPh6SIV9ZZmXfRI3jQOiYY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDmC8tdv8EdhjssRKIo/08zj2KdkbAFJfRKC/CIDL6GYxZlGlv
	AchHifPSLcY+HPqnoUP/wiOE4YCATva9Ga0umICvD4F8jvpl5wI3qCRRV+exBuVEogM=
X-Gm-Gg: Acq92OFA8N0fKX2MZkij5mCjk6vG1KUO1yjovdihy2are8DBcaL+7Nwr5qBlzqgKa1o
	TzrlSm1T2zuijvXlFrOVwxxAoV2r/5KD4NjbE9Bq51MS0xotr4fbrIEbTVCEOknNUscO7KAkGn8
	c3FnbGnW0CrUz7eQFH2u+LmRUBaK3qoY3PTIRUK+JM6nbEZ66+ZHKmdp79YpnJM2wrnEyRQjOdG
	j5HOo27hktDfjmU33s/Fzvz5z5CGgtMrJD1EhP6QtfizNE+FSzcstduG31FvxzYwJvOAmbZ5/43
	Yw3q3dpWmMgd5MwbfgNFNXxVfcS9pYHSMOCkKY0FboOa+9zK0GyUM4NUnPmgiYc2UIeNYx2DvXf
	xi1W49F6SpfMjyC54ob94gsolA0GLN73QAEPjqLTU9EwbQHbeFpchmrYsRCNzSaCd2I5QlPFJAi
	HWxBfZEVoExrtFZ6CLu7UzMJrbGgBKixZv4Y8kBd49OQ==
X-Received: by 2002:a05:6122:235:b0:575:fa0b:bc23 with SMTP id 71dfb90a1353d-5841b77d3bemr288066e0c.2.1779321673711;
        Wed, 20 May 2026 17:01:13 -0700 (PDT)
Received: from acer-e1.tail6c460f.ts.net ([2804:7f0:7542:7b16:2880:ed6d:f5c:8b9e])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95fc2d278a8sm10206321241.6.2026.05.20.17.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 17:01:12 -0700 (PDT)
From: Ronaldo Nunez <rnunez@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ronaldo Nunez <rnunez@baylibre.com>
Subject: [PATCH] pwm: imx27: Fix variable truncation in .apply()
Date: Wed, 20 May 2026 21:00:54 -0300
Message-ID: <20260521000054.4790-1-rnunez@baylibre.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes a variable truncation when calculating period in
microseconds as part of the solution for the ERR051198 in .apply()
callback.

The problem was identified when reducing the duty cycle through sysfs,
with enable set to 1. The condition to fix errata ERR051198 for period
smaller than 2us is always being met, due to a truncation on tmp,
variable from .apply() callback, caused by the multiplication of
NSEC_PER_SEC, PWMPR (period register) and the prescaler which can easily
overflow u32. Declaring tmp as u64 makes it large enough to accommodate
larger multiplication results.

Testing:
- Hardware: Udoo Neo Extended with iMX6SoloX SoC
- Tools: Verified with a logic analyzer

Signed-off-by: Ronaldo Nunez <rnunez@baylibre.com>
---
 drivers/pwm/pwm-imx27.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-imx27.c b/drivers/pwm/pwm-imx27.c
index 3d34cdc4a3a5..c8b801fcb525 100644
--- a/drivers/pwm/pwm-imx27.c
+++ b/drivers/pwm/pwm-imx27.c
@@ -200,7 +200,7 @@ static void pwm_imx27_wait_fifo_slot(struct pwm_chip *chip,
 static int pwm_imx27_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 			   const struct pwm_state *state)
 {
-	unsigned long period_cycles, duty_cycles, prescale, period_us, tmp;
+	unsigned long period_cycles, duty_cycles, prescale, period_us;
 	struct pwm_imx27_chip *imx = to_pwm_imx27_chip(chip);
 	unsigned long long c;
 	unsigned long long clkrate;
@@ -208,6 +208,7 @@ static int pwm_imx27_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	int val;
 	int ret;
 	u32 cr;
+	u64 tmp;
 
 	clkrate = clk_get_rate(imx->clks[PWM_IMX27_PER].clk);
 	c = clkrate * state->period;
@@ -249,6 +250,11 @@ static int pwm_imx27_apply(struct pwm_chip *chip, struct pwm_device *pwm,
 	val = readl(imx->mmio_base + MX3_PWMPR);
 	val = val >= MX3_PWMPR_MAX ? MX3_PWMPR_MAX : val;
 	cr = readl(imx->mmio_base + MX3_PWMCR);
+
+	/*
+	 * tmp stores period in nanoseconds. Result fits in u64 since
+	 * val <= 0xfffe and prescaler in [1, 0x1000].
+	 */
 	tmp = NSEC_PER_SEC * (u64)(val + 2) * MX3_PWMCR_PRESCALER_GET(cr);
 	tmp = DIV_ROUND_UP_ULL(tmp, clkrate);
 	period_us = DIV_ROUND_UP_ULL(tmp, 1000);
-- 
2.53.0

