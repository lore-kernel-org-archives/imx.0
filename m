Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29F97711B
	for <imx@lists.linux.dev>; Sun, 25 Aug 2024 05:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563013; cv=none; b=qbwhcQW/l2s8EME7uI4RXQw8siydVbI9DdKVdUnO8HcEfmgGbb0O8CHOmqixQlEe8ltScRuUEqTTPchVCMsUucPakz5G+s8vos1VUWNsEQ+bnwu3Gzlbi/wwrZ2t9MKWXM7gY9D6fW0sh7rSn5yU8PIN36CXGM23lMA6gRezYF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563013; c=relaxed/simple;
	bh=9QH0Z2k1Exe8nRbW09wHzcRQf5tH/6RKlkLk5/+ZLDM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F1Hk4bIMYjkTunbXxSdFxRWQyurfxMVJ7J3RK348i170ckg6dORpPoKYCNOmBYf/KPohuuqQl/luWhH3mJtkJ0p3flosDeIi8fYtjHV8CAs1I6KL7jkPMxXVzpzrUlQd3kgr6I0k/zU31MVAVCPGkt8vznlNAqZqjLaSyQztOd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=myl38mUx; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="myl38mUx"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7ae3d7222d4so2505764a12.3
        for <imx@lists.linux.dev>; Sat, 24 Aug 2024 22:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563011; x=1725167811; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1sIje/HnXzt33wD+dka8sJAuwV3C7GUd6Fvewfxm9o=;
        b=myl38mUxJSIVdt7r/oLc46JaEKWNyjpV822M4hEmHzHSJod1nZeKILah+blPt2AdlY
         I+6MfgUK2aXZVwBrpAkb9QybI3Fz1FXQrtgqIm16poQHZJ2TC43cGS1orP7icHZ8eS0s
         H8h5Ot1SAfDw+Ms1THxEIIMZKxYhOfANz3COW9BelzEOQOjFtpmIR0ndast8GSfLd4wb
         nO8DlDZ5GJLvnmnfttqa8J99RRthqyW6wP6tWyoyWIYBzVW+PTA4gIhkQs+o3WhPDulP
         jzErc0Aao4LrjoA/duB9On68aFg09HXLhx+lcQW0QyivywIlmQSthwo0cYbDpmg34us0
         LXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563011; x=1725167811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1sIje/HnXzt33wD+dka8sJAuwV3C7GUd6Fvewfxm9o=;
        b=BJUoIlnmAI1WxmWdyOme0S583mt6MTms5AaKr5tEP1j/g0CMnJAgmSxBu7yyvxlZnD
         TN1yiY7yJ9WGeSrGuBQ5ldUjx5rsa1r2idWlg8o6aPY52PdXpJuTIujRvBKSfUfzUKHg
         ggHM35mxs9wiy/9ScZBNU+PYuHmbc9pNfiEacjoXL7PX6lGsi4ALhjUv/nJZKlLh1gd8
         Eell/MHKcm3SaouLbw7qmz4kKkf52yZI+wzUUxSnK9S/DdqbIDu2xva7w3GI+086TNXt
         ez4Ckvz0UtgH30mrqYusktFcOG61XV27LQfM8hj/6nKYCS3pfmM8s9sxZHhrNb+YG+Ss
         6SBg==
X-Forwarded-Encrypted: i=1; AJvYcCUkDw6rpoOoypYyNrVOmMkHU0Q9EQ0PtYCH6tpy3ScGWOrBo0WSh/U1tT5YoF7kRhJPG7U=@lists.linux.dev
X-Gm-Message-State: AOJu0YzMduRj3lpd+VWCL5Zv1GYULOWTALr1CvNQwFHHsEKqZ+CeFjtE
	i9QHWPLBc3AF0E0Bsyp0ZYCAtoGtrwv56C2ovedKjSZcoW1rcqA3
X-Google-Smtp-Source: AGHT+IH6nl7Gp6typ8jXOMj8WE/a55ZrJJqfoIbSsLMBPPh/0P9kxt4yqzLE6RUgOHHWRfDQqSZM3Q==
X-Received: by 2002:a05:6a21:3a87:b0:1be:c4bb:6f31 with SMTP id adf61e73a8af0-1cc89d4d900mr8040665637.18.1724563010571;
        Sat, 24 Aug 2024 22:16:50 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:50 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Tony Lindgren <tony@atomide.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 09/17] Input: lm8323 - use guard notation when acquiring mutexes
Date: Sat, 24 Aug 2024 22:16:13 -0700
Message-ID: <20240825051627.2848495-10-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
References: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the code more compact and error handling more robust
by ensuring that mutexes are released in all code paths when control
leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/lm8323.c | 49 +++++++++++++++------------------
 1 file changed, 22 insertions(+), 27 deletions(-)

diff --git a/drivers/input/keyboard/lm8323.c b/drivers/input/keyboard/lm8323.c
index cf67ba13477a..e26bf2956344 100644
--- a/drivers/input/keyboard/lm8323.c
+++ b/drivers/input/keyboard/lm8323.c
@@ -350,11 +350,11 @@ static int lm8323_configure(struct lm8323_chip *lm)
 
 static void pwm_done(struct lm8323_pwm *pwm)
 {
-	mutex_lock(&pwm->lock);
+	guard(mutex)(&pwm->lock);
+
 	pwm->running = false;
 	if (pwm->desired_brightness != pwm->brightness)
 		schedule_work(&pwm->work);
-	mutex_unlock(&pwm->lock);
 }
 
 /*
@@ -367,7 +367,7 @@ static irqreturn_t lm8323_irq(int irq, void *_lm)
 	u8 ints;
 	int i;
 
-	mutex_lock(&lm->lock);
+	guard(mutex)(&lm->lock);
 
 	while ((lm8323_read(lm, LM8323_CMD_READ_INT, &ints, 1) == 1) && ints) {
 		if (likely(ints & INT_KEYPAD))
@@ -394,8 +394,6 @@ static irqreturn_t lm8323_irq(int irq, void *_lm)
 		}
 	}
 
-	mutex_unlock(&lm->lock);
-
 	return IRQ_HANDLED;
 }
 
@@ -445,7 +443,7 @@ static void lm8323_pwm_work(struct work_struct *work)
 	u16 pwm_cmds[3];
 	int num_cmds = 0;
 
-	mutex_lock(&pwm->lock);
+	guard(mutex)(&pwm->lock);
 
 	/*
 	 * Do nothing if we're already at the requested level,
@@ -454,7 +452,7 @@ static void lm8323_pwm_work(struct work_struct *work)
 	 * finishes.
 	 */
 	if (pwm->running || pwm->desired_brightness == pwm->brightness)
-		goto out;
+		return;
 
 	kill = (pwm->desired_brightness == 0);
 	up = (pwm->desired_brightness > pwm->brightness);
@@ -489,9 +487,6 @@ static void lm8323_pwm_work(struct work_struct *work)
 
 	lm8323_write_pwm(pwm, kill, num_cmds, pwm_cmds);
 	pwm->brightness = pwm->desired_brightness;
-
- out:
-	mutex_unlock(&pwm->lock);
 }
 
 static void lm8323_pwm_set_brightness(struct led_classdev *led_cdev,
@@ -500,9 +495,9 @@ static void lm8323_pwm_set_brightness(struct led_classdev *led_cdev,
 	struct lm8323_pwm *pwm = cdev_to_pwm(led_cdev);
 	struct lm8323_chip *lm = pwm->chip;
 
-	mutex_lock(&pwm->lock);
-	pwm->desired_brightness = brightness;
-	mutex_unlock(&pwm->lock);
+	scoped_guard(mutex, &pwm->lock) {
+		pwm->desired_brightness = brightness;
+	}
 
 	if (in_interrupt()) {
 		schedule_work(&pwm->work);
@@ -510,12 +505,12 @@ static void lm8323_pwm_set_brightness(struct led_classdev *led_cdev,
 		/*
 		 * Schedule PWM work as usual unless we are going into suspend
 		 */
-		mutex_lock(&lm->lock);
-		if (likely(!lm->pm_suspend))
-			schedule_work(&pwm->work);
-		else
-			lm8323_pwm_work(&pwm->work);
-		mutex_unlock(&lm->lock);
+		scoped_guard(mutex, &lm->lock) {
+			if (likely(!lm->pm_suspend))
+				schedule_work(&pwm->work);
+			else
+				lm8323_pwm_work(&pwm->work);
+		}
 	}
 }
 
@@ -608,9 +603,9 @@ static ssize_t lm8323_set_disable(struct device *dev,
 	if (ret)
 		return ret;
 
-	mutex_lock(&lm->lock);
+	guard(mutex)(&lm->lock);
+
 	lm->kp_enabled = !i;
-	mutex_unlock(&lm->lock);
 
 	return count;
 }
@@ -758,9 +753,9 @@ static int lm8323_suspend(struct device *dev)
 	irq_set_irq_wake(client->irq, 0);
 	disable_irq(client->irq);
 
-	mutex_lock(&lm->lock);
-	lm->pm_suspend = true;
-	mutex_unlock(&lm->lock);
+	scoped_guard(mutex, &lm->lock) {
+		lm->pm_suspend = true;
+	}
 
 	for (i = 0; i < 3; i++)
 		if (lm->pwm[i].enabled)
@@ -775,9 +770,9 @@ static int lm8323_resume(struct device *dev)
 	struct lm8323_chip *lm = i2c_get_clientdata(client);
 	int i;
 
-	mutex_lock(&lm->lock);
-	lm->pm_suspend = false;
-	mutex_unlock(&lm->lock);
+	scoped_guard(mutex, &lm->lock) {
+		lm->pm_suspend = false;
+	}
 
 	for (i = 0; i < 3; i++)
 		if (lm->pwm[i].enabled)
-- 
2.46.0.295.g3b9ea8a38a-goog

