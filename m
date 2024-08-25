Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093798286A
	for <imx@lists.linux.dev>; Sun, 25 Aug 2024 05:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563015; cv=none; b=dJvzV9lkmxtvso+qJYHibHzWXnPKHXHF8+udUT6hls7QAHPC/wTb8A0t/Ish0t7mRMNz3t8KdbwhBfmtbs5Qx4Kg3O5Xc+mAX4SaMLtsZiO1/lO/fKyIdc9QXOgt8uXpTQmJsF0pNeSKSvUyZnQ/T8jIJ3iMYRmMLWKdz9bIFSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563015; c=relaxed/simple;
	bh=t69M2XHLck0t1pHwwBsDi+zgTTfrFl42KdqvyDwMG1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hpjsb4qk9vK/TvMilJf+fPAD3ILrzI7wO4aKGew8RxYpq5h3p9VcCavz6wYW4R6A3ZF5cJdUByUSq2PJLk0vTZ+eEWwNQi6Qk1qw43SaRQ4QSLHTJL/INejJ7M/aakpmqyafq7wZpWVXdUkGCaBrTxHUJNZhEO4n2NL/NZd/Et4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QituT2Qi; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QituT2Qi"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7143165f23fso2467550b3a.1
        for <imx@lists.linux.dev>; Sat, 24 Aug 2024 22:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563013; x=1725167813; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j9zYR0W/Xjhx97slmPTim4xkiDUhOUV5BM1jCImN77U=;
        b=QituT2Qie9PSLS3iJdN34uq8MmFlvL18ommsdMDNfSrkfm2V3GcNp6Zg8xetVBvrBl
         bbZvi3ktRRaenqotmu5OiAyJS0NDyEisFHZELibBm2e4+EYHTmDheKZu18P4RbKdrsOl
         CpBVGBusRN2mTsWoWEG85GvnOja8uT94kSgl4qM2CukDNdE2J1iyEgGdt0xPrYwxu/fa
         eGPKN2iKFRxIxhfA3z/PWNSN9sLDAa+tLn+/7WIsqWf6TNNA4SM7OHQZQd//6MueRZPi
         tRiPotTzgCwDsqt9kTltBaCUCS8fPf5i2hxNKUeKG5ZaEj4XP5VYrRvEW/QT6dmlx6iW
         NjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563013; x=1725167813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j9zYR0W/Xjhx97slmPTim4xkiDUhOUV5BM1jCImN77U=;
        b=QVVkt0u4hq++QxbLf9NjCvLdyQaAjLKkJCMdftRGFEt2jjWaLVrwQjCZB126dH+4v1
         Dy7Ggy1rOLJqcy2Co4/C0EVL9bYEFykCAQFQdTf08YJodNAZXZzVYySx0mka1kI7ICrs
         4yC/wbdtc5FiZtqVqYQbZLCaCKYwhrZLLppClChnY5ghc73E9ogQtXbJXTRbQwOREDJt
         gXq38NtrtWnJMKUPZmsgaFX4WZP4CVFtO15pOS5mVNiC6J5c4Vq0lFVFeI2G+eXgG8GM
         ZQaMTbzxdqadrpdiRpM2LnRgFqep14ULq5DAlaJhy/1dv+5hjXgrPFRzr0lyrnwDbV4S
         9pfQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3avV+WOJ2dKMZe9K4139vDhLuiw2eyGMWAwMEMPM5LopfsoL25tSi6EdBeNR6P0emUAU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWOiLa3xHK7yoEGor0b7qJZAI2rnMsznbThsw9kAJwNAHN8NFQ
	BpwLwuAwwzVt2Vo9Y1BEIFfhnPRAdvIy5lN5qoEHXVgb88+UR3yG
X-Google-Smtp-Source: AGHT+IHcuT4NA41j3BiOlgdyA7A3m2CkwtxDOGLO51Pqdelg8y5qs9HsGoezNmvzuRmb2+38RG5t8A==
X-Received: by 2002:a05:6a00:18a1:b0:70e:8e3a:10ee with SMTP id d2e1a72fcca58-7144587e2dbmr7640487b3a.21.1724563013105;
        Sat, 24 Aug 2024 22:16:53 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:52 -0700 (PDT)
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
Subject: [PATCH 11/17] Input: matrix_keypad - use guard notation when acquiring spinlock
Date: Sat, 24 Aug 2024 22:16:15 -0700
Message-ID: <20240825051627.2848495-12-dmitry.torokhov@gmail.com>
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
by ensuring that locks are released in all code paths when control
leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/matrix_keypad.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index 7a56f3d3aacd..bd763d704306 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -158,18 +158,17 @@ static void matrix_keypad_scan(struct work_struct *work)
 	activate_all_cols(pdata, true);
 
 	/* Enable IRQs again */
-	spin_lock_irq(&keypad->lock);
-	keypad->scan_pending = false;
-	enable_row_irqs(keypad);
-	spin_unlock_irq(&keypad->lock);
+	scoped_guard(spinlock_irq, &keypad->lock) {
+		keypad->scan_pending = false;
+		enable_row_irqs(keypad);
+	}
 }
 
 static irqreturn_t matrix_keypad_interrupt(int irq, void *id)
 {
 	struct matrix_keypad *keypad = id;
-	unsigned long flags;
 
-	spin_lock_irqsave(&keypad->lock, flags);
+	guard(spinlock_irqsave)(&keypad->lock);
 
 	/*
 	 * See if another IRQ beaten us to it and scheduled the
@@ -185,7 +184,6 @@ static irqreturn_t matrix_keypad_interrupt(int irq, void *id)
 		msecs_to_jiffies(keypad->pdata->debounce_ms));
 
 out:
-	spin_unlock_irqrestore(&keypad->lock, flags);
 	return IRQ_HANDLED;
 }
 
@@ -209,9 +207,9 @@ static void matrix_keypad_stop(struct input_dev *dev)
 {
 	struct matrix_keypad *keypad = input_get_drvdata(dev);
 
-	spin_lock_irq(&keypad->lock);
-	keypad->stopped = true;
-	spin_unlock_irq(&keypad->lock);
+	scoped_guard(spinlock_irq, &keypad->lock) {
+		keypad->stopped = true;
+	}
 
 	flush_delayed_work(&keypad->work);
 	/*
-- 
2.46.0.295.g3b9ea8a38a-goog

