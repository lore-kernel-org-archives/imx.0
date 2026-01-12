Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4842134888D
	for <imx@lists.linux.dev>; Mon, 12 Jan 2026 16:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768234458; cv=none; b=D7wSw5cJi72ImFCiwG5cGm1gF/hGg6jbqbxYt/2aJJqHV7N9+Iw3kR8HnaZB6Mq6nP9sw29Nx5PwfVmIxeRl7WnjZmcZsDlVPZGfeDx3otitGRGvPNMhwXFKBvm3RUNlj1CAdOoIQFxxIllgYdxTvuZbACAnEgZupubkOAsyPiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768234458; c=relaxed/simple;
	bh=JgPGUs2ClrapeF4Nxdqjsg+HqL0Eaw56uzMx74Kdpvo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lP4uxMx6yluk6C+CK1KmpuM5rIT7q5fSryYzxsj9csz4B7u456TOOpjfMxmRhC/vopXOA69dytwxG01Metyg78Sze5Qtqfzyuq+A6QWqioXm6uJbzRSGK08MVI7ASZzPhct74/CzcVt/VAxaY26xNZGsPplJPafP/oRE/dYElFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0R3aI+1q; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0R3aI+1q"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so3034774f8f.1
        for <imx@lists.linux.dev>; Mon, 12 Jan 2026 08:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768234455; x=1768839255; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lt/EjrD1KFqOXgTLsz92tjRbsWNHSTATnwKQelwH1D0=;
        b=0R3aI+1qcan/ERBZ2Y6trVZR0Ah/iccoFZvXo456pXqIRO9hbgrBM1W5qfTLS8TCih
         Az18EHTBOCgV42EcNIozM1EXrYLyO1jQDOMluD0xAnq2KMfmiIyo1EGda7Vcke5nzxS+
         uDhy2TtM1YfE1iVr4b0b3LN/dnugqJDy5N+pkrZl1ePNBQqsNsUJqyMVqhM7vtukrHTW
         OFvZP3DnXmdsPBEw8PRBh2a4PrMjUup3Lirmh9jaEyZsItAS3WdNNtMQcgcYzk+tCk91
         yD0aGqzc2EuHcWXAWsgVrNc+tJHr9dhBRGuSLB+PdHJK3oX5FjNrUkqVdJG/9j+tz754
         wxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768234455; x=1768839255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lt/EjrD1KFqOXgTLsz92tjRbsWNHSTATnwKQelwH1D0=;
        b=YoWG3WmT+oXyvV1uaTBm9dkAXeXB1SaGsXAU/yZ9qxRG2fDYLAiPnpU2i8hBIRhF/z
         JnWnq+KH04qz26cviuswixqvI2uGCh8uv12xVI9jYjOv5C+13Y/cGABuFXEysSpuRTTa
         KsYSpmwaF5o7QdAOaC7+6yRcpaNxZOInoTsBQTOIu42glkz+H76z1YQVOeRyACxTaJma
         LKhC7BQQRyUcRyQntg6Ug/iuEELt+f+HWI3JtADiprbfkLRGB237upnG6PzbTpjKX+8j
         zRCAPTAqoBdgvFOrs7KLG9JzLz5BxAgDPGRBmd9Fts4Z3UsdzEI45+H7yAJrg/h/aCO7
         bVhg==
X-Forwarded-Encrypted: i=1; AJvYcCXB4L2tGv3/LVf/O2v+e57OsywGxHgh/XHZWoq7g7k6uZ+UW6HNiEhpdlxcUUAxHVU8u/A=@lists.linux.dev
X-Gm-Message-State: AOJu0YyORy+H/RMBEWZbtT5jd7eyLWZu14DOmbKuQAl2oAQWfFISh2Zm
	qAEqVsc+Cb/9roWAhNl4FxfQfG04P3f2/WoDVXanI04+TBPGAEmVdz8qOlrHDadtHPM=
X-Gm-Gg: AY/fxX7wxquaYj0ijxL3LQrGYkDG6BGNi86NrIVV+M/Me1iTxX4GggaUuU2f7oXvail
	/Twuwjp9Phst5IXmVbG+PR3QpKhzcFCKvaEHhHpqcXJWyC5d+HYdzALDJ9CrsMaOMNXFX2QOwe6
	khkT71x/TS2FCufd+cSnlVZ8qbSQ4ZbyXthYPxDZ6ne+I5+9Fiejirmh63PO0Crfv0aIPGjmG72
	OhcjtfhirIsJ+NUvWVGUY4dBYnOQyWn0gVAezaohwfb4PaNPCJNoqwd9qy8E1mCDolYsUY5zVEM
	aSXOV954V86L3o9JhGyUsSEAO6UkqNWm1kBX+cBQr4T0bjBeRNpINNsybHCOkTi5T+e1/LO0LUj
	Yy2WJmlOeJiOH3lkTGQhWw0YWl804fpfqqzDKhB4qLmwrbOIKNRYjUqh1f2epEdNOEkN2ayZSPy
	c4y/hSz6NS72yXHQviPqsbc5eXnA62SCiiIV0BqS+qYVrBOvurXHcDHi8Gf2cF/OfuxyZiEGxNG
	33xzcW6tS0=
X-Google-Smtp-Source: AGHT+IF6PHiO9nsU8BRKbqPH151Up8vtTo+xip3LVKygILBasPhnI43PRY5l4yoYD5gxonWMYSA35Q==
X-Received: by 2002:a05:6000:2311:b0:430:8583:d189 with SMTP id ffacd0b85a97d-432c374ff9fmr22868067f8f.39.1768234453677;
        Mon, 12 Jan 2026 08:14:13 -0800 (PST)
Received: from localhost (p200300f65f20eb047d7efe6100b35af4.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:7d7e:fe61:b3:5af4])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-432bd0e16d2sm40758108f8f.13.2026.01.12.08.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 08:14:13 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Samuel Kayode <samkay014@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sean Nyekjaer <sean@geanix.com>,
	imx@lists.linux.dev,
	linux-input@vger.kernel.org
Subject: [PATCH] Input: pf1550 - cope for CONFIG_PM=n
Date: Mon, 12 Jan 2026 17:13:59 +0100
Message-ID: <20260112161401.3751275-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1456; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=JgPGUs2ClrapeF4Nxdqjsg+HqL0Eaw56uzMx74Kdpvo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpZR3JG1tRfxfhYX6WbciOFKzU0FgncyvEKv1Sq Dscvdzp4MGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaWUdyQAKCRCPgPtYfRL+ TmchB/44VFtexresg8hgP66UocHD5WoPy75nbK4j0R6Mw0p3uQenYFqVjv0IANlrLEbDxIM2/tJ MsUZi6c2o4Xnxux0Lvb30Y6UeP0vsz7iIacrEKQZ1cG6npx9N9fX2LRmiSkE6UhtCumjEd6zs+a saAcEH3z6fb0mKj7ntNyX6R/95boZ5foiJMV+aEIH/V1NyYccICE1s9yhyImMH5+cnCzjjnLJ5E 1jclIKKWWHaH09FZLcfAs8Ti9iIxm9QonweRKTOXBe8v6P13kB3CEZ3dH+ENzWOdZBAemixjYVJ KcHcpOrEa/HfP/HbuYwe5sUZ0RjoqSxJYX++HtvRD90FEZSX
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

This fixes the following build failure with CONFIG_PM disabled:

	drivers/input/misc/pf1550-onkey.c:154:12: error: ‘pf1550_onkey_resume’ defined but not used [-Werror=unused-function]
	  154 | static int pf1550_onkey_resume(struct device *dev)
	      |            ^~~~~~~~~~~~~~~~~~~
	drivers/input/misc/pf1550-onkey.c:133:12: error: ‘pf1550_onkey_suspend’ defined but not used [-Werror=unused-function]
	  133 | static int pf1550_onkey_suspend(struct device *dev)
	      |            ^~~~~~~~~~~~~~~~~~~~
	cc1: all warnings being treated as errors

Fixes: 9acb215cbebd ("Input: pf1550 - add onkey support")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/input/misc/pf1550-onkey.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/pf1550-onkey.c b/drivers/input/misc/pf1550-onkey.c
index 9be6377151cb..a636ceedfc04 100644
--- a/drivers/input/misc/pf1550-onkey.c
+++ b/drivers/input/misc/pf1550-onkey.c
@@ -173,8 +173,8 @@ static int pf1550_onkey_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(pf1550_onkey_pm_ops, pf1550_onkey_suspend,
-			 pf1550_onkey_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(pf1550_onkey_pm_ops, pf1550_onkey_suspend,
+				pf1550_onkey_resume);
 
 static const struct platform_device_id pf1550_onkey_id[] = {
 	{ "pf1550-onkey", },

base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.47.3

