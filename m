Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CBB12C544
	for <imx@lists.linux.dev>; Sun, 25 Aug 2024 05:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563019; cv=none; b=ofdR5EVeaCQLTaqtgt5XMD+7qm8gETeQEfy4qqCSPbH32xLQHB7vCoflN03zxp+C8GSbROoc8J4Ft8BzDcbi3Ho0kyJZY7YZFWB7Q5ZPL5ff0iQcpZbjOxO2nWeTkwibwTy4otw1FOAqB500Up+f0jFTV6/hJi0G7xKm4SUhyu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563019; c=relaxed/simple;
	bh=Pv/v6XA5FLvxkcuQkdC8NGA83UZemTXDDXhaA5ziTec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bngRzu/yEnJ9I/qqnmpCiMSlHrBPKdpRbBiNP2aA2dV+wTS7ySdrrOzIxix6R04cOp/gzwxeaLIr7TI/Q2a+6mT/spB2LtNLtSb632yk0bfmB/dvdp21+vD4r+EQmC/pvRHMqrjSQ+Hfibst7KzsGUK0OOH2CtiSAML84yYSonA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Khp+1NEk; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Khp+1NEk"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7142a30e3bdso3103837b3a.0
        for <imx@lists.linux.dev>; Sat, 24 Aug 2024 22:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563017; x=1725167817; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6On2/1bDkxm+R+4fGzTtvwf3YjBZiAkFwRYzWZ0YLaw=;
        b=Khp+1NEkm9+omVfjSxvYcUMV7UwLG6wzX1oL83nl85AtIQrNTUM/TE3TdmMYxG2WTj
         sQssRFzoo2WP1iSx/Wdb3RDN8BvafWe68HGM9zuLHBnTRseg4fRh+O67Uqf2aIu/XaXH
         h9qE4eeGse64nWEB1pjcBLqBWRNUtM0zHy5ZDnWiHyV10mN5hTSXQoeXYOzDt2c0RI6+
         ymoGQdzolmkFgZC6sGhh3i/wQF3C6UD4VRPPNyR7NCC/KNwZ3XoIBCB+9ufpf80RyCAj
         wHTQetFp0YNtfAJml9G3LWsmUl3JrLwvKIO4VhPkLjP8zvu6s2eacqyc3OdeOunNQvJl
         yPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563017; x=1725167817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6On2/1bDkxm+R+4fGzTtvwf3YjBZiAkFwRYzWZ0YLaw=;
        b=JAc243KBRG+hSwBgUnX0zC/Zm68DI1rpGx2xsmpOpz8gyrAq7unq4uuPhaOwyAMR+7
         qZ54lGJ5uAN2DCtjFtiBfjLT80304Hc1siFP/l4A4Mp378paHkMuZPI08DpZ/y7ZahIn
         IK54FNbtGvAPf2140cHABBmWsNjnV9z6PvQO4Ym5TkzAqrO5HwJUXRAEiMs36Y1gHlix
         wBYpNJ8CKqU1NVF6mqy69E9sYjswMqD1NTmMLND9qO7tEf68xQzbBzXkiiUyaIFy6akr
         4KeRjrIvCVZQDXWWpzldYb0oNbBiCeMrMgAIUtr33TDOdh8bGZjTfeEVsXJOi7+MBJMi
         hPwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdC+pnvQtPDbMBD7npYfrPiY6OjxVgDzdnEJAGKGhtA386HigAsOyFXUV90SKN4U/Z3kQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YyyFiAAsQouE9OSgu6UW8QBZvX1U4OKNq6e65ivy6Gz1aYgvh7g
	9id7y1fqA4FOcrhOOE/6AR6TwVNPwQkBYFnROP6dqWokvHz6xKjp
X-Google-Smtp-Source: AGHT+IGTPS2b+A1C17aqp6MUwEwi5FNiFSaX+X5FwBh4QbkvAkE9nJITwi8u1xgUd3TXRjDwffCIyQ==
X-Received: by 2002:a17:902:f9c8:b0:1fa:1be4:1e48 with SMTP id d9443c01a7336-2037ee28d69mr115710795ad.11.1724563016984;
        Sat, 24 Aug 2024 22:16:56 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:56 -0700 (PDT)
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
Subject: [PATCH 14/17] Input: pxa27x_keypad - use guard notation when acquiring mutex
Date: Sat, 24 Aug 2024 22:16:18 -0700
Message-ID: <20240825051627.2848495-15-dmitry.torokhov@gmail.com>
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
 drivers/input/keyboard/pxa27x_keypad.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/input/keyboard/pxa27x_keypad.c b/drivers/input/keyboard/pxa27x_keypad.c
index 3724363d140e..38ec619aa359 100644
--- a/drivers/input/keyboard/pxa27x_keypad.c
+++ b/drivers/input/keyboard/pxa27x_keypad.c
@@ -682,7 +682,7 @@ static int pxa27x_keypad_resume(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct pxa27x_keypad *keypad = platform_get_drvdata(pdev);
 	struct input_dev *input_dev = keypad->input_dev;
-	int ret = 0;
+	int error;
 
 	/*
 	 * If the keypad is used as wake up source, the clock is not turned
@@ -691,19 +691,19 @@ static int pxa27x_keypad_resume(struct device *dev)
 	if (device_may_wakeup(&pdev->dev)) {
 		disable_irq_wake(keypad->irq);
 	} else {
-		mutex_lock(&input_dev->mutex);
+		guard(mutex)(&input_dev->mutex);
 
 		if (input_device_enabled(input_dev)) {
 			/* Enable unit clock */
-			ret = clk_prepare_enable(keypad->clk);
-			if (!ret)
-				pxa27x_keypad_config(keypad);
-		}
+			error = clk_prepare_enable(keypad->clk);
+			if (error)
+				return error;
 
-		mutex_unlock(&input_dev->mutex);
+			pxa27x_keypad_config(keypad);
+		}
 	}
 
-	return ret;
+	return 0;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(pxa27x_keypad_pm_ops,
-- 
2.46.0.295.g3b9ea8a38a-goog

