Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947D03612D
	for <imx@lists.linux.dev>; Sun, 25 Aug 2024 05:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563009; cv=none; b=gBuyHqQbn8gdWQbw2tkwzV1WWmXzuhFOtj9Ym+K1kym8KFZlMh0ko5AlZ8pr0JTQGMeqyuJ8pQKZ9dTu3Ly2FGOqEvWQzPOqQsfFB+Ltn58k3DJdZez7jBWV2Da256cRGSifsBJbaNkdc4In19XbpQJ3/DQ1QDGrH/6kVU/DUMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563009; c=relaxed/simple;
	bh=wJ0YIbK2Bowe6CEQFFxfyG1unJtNoBYloVGSQaRk9V8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fN9l42fb8IAFUwO8nyg7PynEf3KPrYwOxmdy4lz/UNRwIYnhzN6lUYx+jcELzaLtQnkYHvRVu5D1abt2rxkdeTT+w0z9ymQgNN3rJIQc4nwWBbG+USOUAtmlBnd2iYwRfWjOEjgbx39jfACrGYBNpg4AGpi9EajP+63LBV5CT4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G+L0emBM; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+L0emBM"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-39d311d8091so14036825ab.3
        for <imx@lists.linux.dev>; Sat, 24 Aug 2024 22:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563007; x=1725167807; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MF5E3W/jIicHOW4h7MeNLzhN752Za5ehXWfMuqIr3TQ=;
        b=G+L0emBM5f20bvdqLObyCe837vA4bhlQ1mX5OcAFWOcMP2tM6vyYOsT9+lfRm9Jsgv
         tTYiG7MANtaIlyz1P251WhXv/7Apt+lHFC7Y8Lku0dEHFA/CzY2Z45YW6NKwYTOOefkG
         JNwfAFCh4LvOzbIF73vYik8IwD9bpaijQH0sDfbeoZsAryzXmtcC1MpPSn+uSIUgw29r
         7HzctQ/v1qxWlDfQtAqGsELdcfOPAZl3m584/PPu7IZ+lek52wpb2VCt41joebvbxTcF
         YvbYqc4Eb3+Kx8sWNdAkJ4DGjlcvLfDIalA1GafhRcOV2IOEfACPwqpueGf72QnvtOQy
         IEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563007; x=1725167807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MF5E3W/jIicHOW4h7MeNLzhN752Za5ehXWfMuqIr3TQ=;
        b=xSN6IgxgFet6vr7qvDwTuLUJB7bMYyew+R6zo6rLns9edGeF6nCbn8AURQVfG8Ktkb
         1nE5HG9whvTrucTyLwXOx7XYJmbcRSHAkPeTo59VLm+74RviVQmL0TQzZlG3vTni/BDN
         wH9muzZ/pstgZ1r/Em7vBwkVgq6vWa3wuCdfWtGkASfkTlKd05rUaKNSth0XTcX29Iuk
         XtsM25VUDyeVxZrWEkJt3mpxBIRjoVMZwRIunEOnqgubUfBnyWy14STYOOYmKKRklMz1
         C6jI14a0aySyB8stFDexepRH/z9HntZ1M5UP13uA1FBLbNxRXN0x9K1eex6H1MQBR0TD
         Jw/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXyCvfzbhrFkbmQ4Bha6I6H9FhlgDQY6bJ1Wc3VcKkxYT6fK34YN9rC375KMM6En4h84rM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yws899Nkj7YWmTskSORHFasxOTUm71P1FYEeo4AFuHwPmLS2N+m
	nLRsFdQ1Y0B2q7ac4j8qiTjXWXHy65jHc+JKXS3bnpSIsjnc1dhE
X-Google-Smtp-Source: AGHT+IHXAs6GceADDzLZ7I3Pij++Fm3NQFnIWhk4AJZxUkQIX9t9GW0NO9mJDGotB52VqJS/4yMQyA==
X-Received: by 2002:a05:6e02:5a3:b0:39d:300f:e8ff with SMTP id e9e14a558f8ab-39e3c975b22mr65481975ab.6.1724563006637;
        Sat, 24 Aug 2024 22:16:46 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:46 -0700 (PDT)
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
Subject: [PATCH 06/17] Input: imx_keypad - use guard notation when acquiring mutex
Date: Sat, 24 Aug 2024 22:16:10 -0700
Message-ID: <20240825051627.2848495-7-dmitry.torokhov@gmail.com>
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
 drivers/input/keyboard/imx_keypad.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/input/keyboard/imx_keypad.c b/drivers/input/keyboard/imx_keypad.c
index e15a93619e82..b92268ddfd84 100644
--- a/drivers/input/keyboard/imx_keypad.c
+++ b/drivers/input/keyboard/imx_keypad.c
@@ -521,13 +521,11 @@ static int __maybe_unused imx_kbd_noirq_suspend(struct device *dev)
 	struct input_dev *input_dev = kbd->input_dev;
 	unsigned short reg_val = readw(kbd->mmio_base + KPSR);
 
-	/* imx kbd can wake up system even clock is disabled */
-	mutex_lock(&input_dev->mutex);
-
-	if (input_device_enabled(input_dev))
-		clk_disable_unprepare(kbd->clk);
-
-	mutex_unlock(&input_dev->mutex);
+	scoped_guard(mutex, &input_dev->mutex) {
+		/* imx kbd can wake up system even clock is disabled */
+		if (input_device_enabled(input_dev))
+			clk_disable_unprepare(kbd->clk);
+	}
 
 	if (device_may_wakeup(&pdev->dev)) {
 		if (reg_val & KBD_STAT_KPKD)
@@ -547,23 +545,20 @@ static int __maybe_unused imx_kbd_noirq_resume(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct imx_keypad *kbd = platform_get_drvdata(pdev);
 	struct input_dev *input_dev = kbd->input_dev;
-	int ret = 0;
+	int error;
 
 	if (device_may_wakeup(&pdev->dev))
 		disable_irq_wake(kbd->irq);
 
-	mutex_lock(&input_dev->mutex);
+	guard(mutex)(&input_dev->mutex);
 
 	if (input_device_enabled(input_dev)) {
-		ret = clk_prepare_enable(kbd->clk);
-		if (ret)
-			goto err_clk;
+		error = clk_prepare_enable(kbd->clk);
+		if (error)
+			return error;
 	}
 
-err_clk:
-	mutex_unlock(&input_dev->mutex);
-
-	return ret;
+	return 0;
 }
 
 static const struct dev_pm_ops imx_kbd_pm_ops = {
-- 
2.46.0.295.g3b9ea8a38a-goog

