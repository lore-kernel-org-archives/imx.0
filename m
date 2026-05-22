Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0552F2BF3F4
	for <imx@lists.linux.dev>; Fri, 22 May 2026 19:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779477262; cv=none; b=XWDVqb0hy7hnOMubYYo3hBRgymDaXecu4CFWzdabGXPC/xkPdSw78q/1g6pqtKkLNBc3SE1l9iLorgxTFcWU3PE9xuL7zQSY1jDVJstjv7Itp9t21T/cRax9HnpFqOTIfbPmXRnxuwVT3i5ax50yj6Y5+ZXFecUoJE5zIgd00fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779477262; c=relaxed/simple;
	bh=W95e8kqy+EUnTLn7yhNEZxHMkbNjEJlRwwDjiQMwjXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T4QblnLKDK3DuZEtwkgKR8WLBOxEOauZZuxDuW3TdpxAs+9OoJvXuVBbv+kg4Q2zeTSuQBacD8H2Fqo2wm3JUJvc1JR9rNo7gHWvqT+T5VJOJw0UOBx9N5bdd3K1sPMCAs904x5UE572shvefVrw23uTyYHdzyhP35P/MhNAmNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TAcePJIa; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TAcePJIa"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-57533363201so2535111e0c.0
        for <imx@lists.linux.dev>; Fri, 22 May 2026 12:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779477259; x=1780082059; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bcQfxlYT0WdkNlclpO13skLK1pFgoPq0lf6iXLyTJ4A=;
        b=TAcePJIanrDST6vfcVef4eme8wnJ0YGHznX+60FUSeIs77wCtpHBOCAepO6Yxz95CT
         ZdT5bw1g+zaB6jbsrgEGyq7h1UXDch1Yr0IDwtI0c5jJ1X5O2K3GtI60C+GQ9KedJrKl
         kRotWZ+rTPsZ32OsVhGqrQhUZeDuUYbzKl7qrfY3cSvfbG0KxAEK/3DIJAhLJp7ziTY7
         7ZFnqB5MXvzS/Qm3WZj36YJaX7ZjJ+pKzepY8f6ngSMNVTFuxY5SDX3vW4U9zfE32bHB
         n7rhuUnDb1Do1mbFAuxGcBrpBRmvmjPSEpf5NdQIujJQ0oPJs4wPdLgJ/mlR1FBpKTBG
         vJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779477259; x=1780082059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcQfxlYT0WdkNlclpO13skLK1pFgoPq0lf6iXLyTJ4A=;
        b=A0azlHRhVXpWr6HqsrmYD/0sAT3VLrVeNGzgMSxdE94tODrygzF3l0+/FyDnmRiEwg
         xDno1JeB4dSM6W6Jt19/OUQ8zZkJJ3QX1+vfqBlP5vQs7QSHkCPvhDam4WfLtyhiWCxr
         bnIzonDjWxh0v4DHaBejdIgWDccMdjgeKE3JPkWiPzHLlSQSTbEll69QE8Yo8DFvQBoS
         UdpOfXSM+EHOBDsRi4ScR3CammOBVxBnKVX9RI1ketSkBE0UNaa2JZzGffBROQt04Z2k
         7xXsnIBoghX9K9HgeCYbE+2w1CP4cfeRRXNZeJxa2HYN1XADR8kVQMAtp6vpw7mmx1+6
         NSxg==
X-Forwarded-Encrypted: i=1; AFNElJ/HW16H8T9fVZmZ3K57SIr0vlSk0kPC9IFNP5bOpzjR+5BLt01ptbew0pf3KY0YrjAP8tc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzklpENVxAnQU0SBLuBy4y5yE+hxBBVVAivJyWaA7EIyFw8sW1V
	RNjDy54mFKDCqCti05QpFyq8HWkuWXUl3K5KdZmALB4uAx4r4yvoNaapa3EcpRMGo4E=
X-Gm-Gg: Acq92OGAdGG1bKLmN6TzJPvBIQVwWXA7WwDuEx4Znxsq+46n67MITtTu4x5B4JLJOOA
	6tsGDz5UmFxvsmiLlB58WbpDYanAaJh7uRBhtvqVCujArJUNm73QIIskgb3sPwgRyqXQYkpHaUd
	vQ+xtv9uG3Hw7o4cNwWY8swzZdewgPeHYglfSzowH4T+URGTx7tGJvZCKUzeKqQibUw6i37aV3b
	l8vPpLHcpimjDTpgoIbAl9NqHYdo7z6xFbu1vUx3tz1fEE32iprIhzhnviZOzBHlvFaZUZn9Jm3
	gvaoRe5MJbAD/uEKDlaanKx1wT1LjQlCw0x/+NiyiJjfLyCb83uUZ1VjtmZvOA7eqO3ZlWJDd2d
	mv8PyM7D2faEEyGbN4RB2LQziBsuqvc6KEk6gB1wv0Om6NvQweVte5ROWGrI2eiOaxCELdIpmNK
	7C5XqXz5O4wRdT244WOm+Vh0ZssLxMtaoPHtbQu/rFIQ==
X-Received: by 2002:a05:6122:330a:b0:56f:adb8:7c54 with SMTP id 71dfb90a1353d-5865e3aff5emr3335785e0c.3.1779477259066;
        Fri, 22 May 2026 12:14:19 -0700 (PDT)
Received: from acer-e1.tail6c460f.ts.net ([2804:7f0:7542:7b16:2880:ed6d:f5c:8b9e])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96173af3e82sm2741013241.10.2026.05.22.12.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:14:18 -0700 (PDT)
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
Subject: [PATCH v2] pwm: imx27: Fix variable truncation in .apply()
Date: Fri, 22 May 2026 16:13:48 -0300
Message-ID: <20260522191348.6227-1-rnunez@baylibre.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a variable truncation when calculating period in microseconds as
part of the solution for the ERR051198 in .apply() callback.

Example scenario:
 - Period of 3us (PWMPR = 196 and prescaler = 1)
 - Expected value in tmp: 198000000000 (NSEC_PER_SEC * (196 + 2) * 1)
 - Actual value is 431504384 (truncation to u32)

Signed-off-by: Ronaldo Nunez <rnunez@baylibre.com>
---
Changes in v2:
- Added example with actual PWMPR/prescaler values per Frank Li's feedback
- Dropped testing section
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

