Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3920E215F69
	for <imx@lists.linux.dev>; Mon, 14 Jul 2025 12:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752496695; cv=none; b=VlvXJTBNwDKJZwgVx08IyoXkaKY34B7KMZgCPQFCVwPpx4Die2nQHAZJXkx3DnwTPozDPSvx6UeLCHMslNAjwiCQJV9wJG92CWUg+HkIsly9LM84XHQhWRgOIX4mPa8bUwS1xYYOpULgQZZDADp+/iAL8sDTnjUlw3L0cIWXecU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752496695; c=relaxed/simple;
	bh=ZXxvfm5ACdHaOgBMK2E/ks9Mq0FoiGqE0kZ5+r0itYQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Qba+zawZz81RvPFnf/t3we8U5m/pAzEK1M4UJFtp74IWu/i1fTlxjP0d0Nf+/64+8sw1q3XfSUiXGddNIWzo5iFJbD+Dc/xtq6jdDOS42mCdIvQw418M0RLlqvBKdM6hNRtiBvZiW2KcXZQUOaYjph57GFTPFhJHFn+ha6SPHz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DN2upFgh; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DN2upFgh"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60dffae17f3so6439072a12.1
        for <imx@lists.linux.dev>; Mon, 14 Jul 2025 05:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752496691; x=1753101491; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EY/NG2nHnV92BHijz9klsk+toPjE4xsvjwjRWHy7y+0=;
        b=DN2upFghQ2gavVheCRq8QPwy4UfwjKWG6yLDNKCr5yQjNPGqHF+B79s07sgcC4ro5U
         0Bb5pXJPgdjdyS8MFgaaeIzordL0+bk6Rh2KS0SzUDyhtVMkL54xU/2yJscRVfvG7KV9
         nlpZPvfhsZIqz5A9kmJYE6Aca0wC5hR94ce4nkJBEpyr/vrR+1d3qM5Pq+QuCQKwMkHE
         oz4QT6ZZQoQqfe8XsmkQcgpGhlI0eXIWLPwV7ixkL+GwTw7DibaITDRSDgXyXdoOcLUi
         swg4tlFm3/9rbu+wNcijMdjWpjfRe5uE7osivkBGEftHDzN4WaMiSwLfSgmaNOv87dvr
         eyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752496691; x=1753101491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EY/NG2nHnV92BHijz9klsk+toPjE4xsvjwjRWHy7y+0=;
        b=s6rZTGNUKZIuo5nHJQEgmQpmey+catvXpgHtwQvzzEk86jObV+njLHsNzodfHklq6j
         +I3QpsQXu2LvAHJ5TUh15ayHlIP0v7JcSMXl2LnNy9+b4NGSyppDh9ELQuGKvMTZH1Zc
         vc4MYpCO97GX4nZYYiuboEzMW0O8Yr1zFBPuzFlTUapv2QE/8AEMIkgfc/1AuMQ57lqF
         0AddXBF6vGLGoevxdl6kI5uUoGCpax8gEBjRpOjffkEU/gXfMvXCVTAjAxMAbXgfp+Gp
         coLFuxwtA6f4vpiBIs5ZkC+D7iyQQ8EOwXs03Ok9rdSksNm/5sOvh6V05EzMaYcYH/cR
         7PPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpdMP8L2HbGioU00OtEzOcEBqdECsesJ+nCZCOIM8D9+C224kXgrHk63cBGyroGK3qzvc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwxzVu9ZCEOGtQl7CGxi+lZ1ZVow/pFNsmhDZO4EUM+7xHV3+on
	N9F6o/L+9VENc5o1WMAyN/mCKJbIjNRFoOEJVNT6p+I7tvIjXNizJKh2
X-Gm-Gg: ASbGnctlEwabvnL+znADW6BEQSNp9AaDTTU/FQOc1dP9EI/hNJHoTPMoXaabDvSJhca
	1izwr/3R6C1bX5dF/Xa2+dLmNokXxgG7VNROPfrlx0Kr2OEHJjS8YYPwygdoVYF+66Eyxfb42oW
	9Pio1/9GA/qoMz9lQjjwa07B3TgfNo9rugnv6ePWzi1rF4lQ/1RvtiTi6OHVeF5/+YHN520GPt7
	hCzhypZfJjfOyJ2l2IByIwI0LeV67SJ2/FMVew9SUPcdMhLefbOsv57xs46m3hQBPKTf8GXLvOb
	oXxldtVApHgRp5g84ZgAMyrxIqzm/NGSqQgS2O25YflXiicEIeDextWZOzTqZPaNQd/ByUDnL1p
	Jy8a3ZR8P0CW0p56ns8DbgugcQE5bkosQD0JRNLatBze+/xSKjelDSwwY
X-Google-Smtp-Source: AGHT+IFJP4cB80pxWE0x40njp9Ls1ssVpAFwjW00zYJz8lfNZnZohc3hO+AUezRssWB3NbpYRZaVBQ==
X-Received: by 2002:a17:907:930c:b0:ae6:a8c1:c633 with SMTP id a640c23a62f3a-ae6fc1fae79mr1276473766b.34.1752496691220;
        Mon, 14 Jul 2025 05:38:11 -0700 (PDT)
Received: from playground.localdomain ([92.120.5.7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e829402asm805005266b.121.2025.07.14.05.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 05:38:10 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-pwm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] pwm: imx-tpm: reset counter if CMOD is 0
Date: Mon, 14 Jul 2025 08:36:34 -0400
Message-Id: <20250714123634.6442-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

As per the i.MX93 TRM, section 67.3.2.1 "MOD register update", the value
of the TPM counter does NOT get updated when writing MOD.MOD unless
SC.CMOD != 0. Therefore, with the current code, assuming the following
sequence:

	1) pwm_disable()
	2) pwm_apply_might_sleep() /* period is changed here */
	3) pwm_enable()

and assuming only one channel is active, if CNT.COUNT is higher than the
MOD.MOD value written during the pwm_apply_might_sleep() call then, when
re-enabling the PWM during pwm_enable(), the counter will end up resetting
after UINT32_MAX - CNT.COUNT + MOD.MOD cycles instead of MOD.MOD cycles as
normally expected.

Fix this problem by forcing a reset of the TPM counter before MOD.MOD is
written.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
Changes in v2:
  - dropped the "VERY IMPORTANT" bit as per Uwe's suggestion.
  - Link to v1: https://lore.kernel.org/lkml/20250701220147.1007786-1-laurentiumihalcea111@gmail.com/

 drivers/pwm/pwm-imx-tpm.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/pwm/pwm-imx-tpm.c b/drivers/pwm/pwm-imx-tpm.c
index 7ee7b65b9b90..b15c22796ba9 100644
--- a/drivers/pwm/pwm-imx-tpm.c
+++ b/drivers/pwm/pwm-imx-tpm.c
@@ -204,6 +204,19 @@ static int pwm_imx_tpm_apply_hw(struct pwm_chip *chip,
 		val |= FIELD_PREP(PWM_IMX_TPM_SC_PS, p->prescale);
 		writel(val, tpm->base + PWM_IMX_TPM_SC);
 
+		/*
+		 * if CMOD is set to 0 then writing MOD will NOT reset the
+		 * value of the TPM counter.
+		 *
+		 * Therefore, if CNT.COUNT > MOD.MOD, the counter will reset
+		 * after UINT32_MAX - CNT.COUNT + MOD.MOD cycles, which is
+		 * incorrect.
+		 *
+		 * To avoid this, we need to force a reset of the
+		 * counter before writing the new MOD value.
+		 */
+		if (!cmod)
+			writel(0x0, tpm->base + PWM_IMX_TPM_CNT);
 		/*
 		 * set period count:
 		 * if the PWM is disabled (CMOD[1:0] = 2b00), then MOD register
-- 
2.34.1

