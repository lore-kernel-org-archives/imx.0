Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8BA4D9FE
	for <imx@lists.linux.dev>; Sun, 25 Aug 2024 05:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563006; cv=none; b=dqbjcW7wYwSnPP+2tQsvloykCyCowfrmESIRfqMvuCMuV8+GFPhqloN/TI4+rHfhuAuouThQrGNX1V9eC0yidqsSAUVvXEZ2seDazkqiX1rtlmj/E4LiZgMPDo6EDGfnhyF8u3jyXDQd6TF+2VLG/L4w/24RaAXwW1HJk39yv0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563006; c=relaxed/simple;
	bh=QuTUzvL0NRGEdr7cl4+DB5x/Lu/7uSJ/TteYcsbBaMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kvvdeo2AVs9GK+ivVkRq7BxJ2La6zkKDuxwiLNklhkSYrZamXLwEIbLdORibH1X+QuphN6bNORptdwkpvETVkpbYyvwf0Ucg8JF2GnVdVvDPUkwD7PkcCdmcyPKCBl9wfe2aLaSUgMbjGR1cUmqAI3fJUzrB8fqdx/yfsGdVhIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/afoLWb; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/afoLWb"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7094468d392so2671527a34.0
        for <imx@lists.linux.dev>; Sat, 24 Aug 2024 22:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563004; x=1725167804; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7WxrWJ62hQ2vKyvroZvAzkaBumF7Y0KoLKrYpStuCE=;
        b=l/afoLWbujTFmGuGEDmROCb0gc/jJGntn9gUS7WQQMIq2tBuoT8ovWk249h0grKC2L
         XL3yBcMmpvDXn7Gs40Fmiwn7gO8JpX1/G1JS7ivsS3fUQAsPhri15cWqTRrbx0obEjOb
         mNJ3m2Zr/bkZ8AkE0Im+CGZKa7mytJg9URFtv0H2SO9SnI+8hFrNKUWO9D+RaBD9bgGO
         QKMQ6BVHrdWypPlcr5ZvlzfkmO4RVRJGMlYEg9/pjxpo6aQzyl6gjuT6nrgeIQSPCmrN
         CzITvpHb/dHgiKPdhInS8sFl2bJs5JSNmwAjWe0DFE9PslmPcqJWxxR30OcQ2y+JEYr9
         8dtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563004; x=1725167804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7WxrWJ62hQ2vKyvroZvAzkaBumF7Y0KoLKrYpStuCE=;
        b=Pq9xXIgQ8syLmQHpRxRd9fzw9rEklgFyHmggsDXut489oAH53vw1tNSRTRKHiPlaWz
         vwkvfvbjzp8P4or9Cgz0l4qY/Uqht/Dk2hxv8A+V8qUL8+PKyE6lhl8o2zGfH7yJXxk2
         RVnsr6ICLOMypXLA2GEIW1PwZGvSFm7IUtUdgIi8jb6uaqj99jaQ8R1am4R4tr3whJal
         MbDYFVUrBvtE7YSrkk/JuJASo21hFVjdwx6xFRLvUXDSFWvH9A2bg8P5cvQRe7jZfRcX
         7tEO6KqIXl0kT/wYY405iJhWh/VudfKKl00PvWAJ6qFUgpJIl1SQOIu/ItE3yTvfDI03
         n8dg==
X-Forwarded-Encrypted: i=1; AJvYcCVuFnG6zdXV2VcjcAMFMQamjDSlg23o5yNZcNtmiP2GzwfVIGw3gSUYGJOBFUL/v9PqQq8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTJqoovoEyUtT4uSkYEkjGQJJwRS5a/SS4+wsU6U+tXTRUSoNw
	EDXk2KLLzaC4flDpsbr27Qg+RQeS7x0aibqu0zbM0fAVyAvl0ueVCmQ7Jw==
X-Google-Smtp-Source: AGHT+IH+QpbfxDnkPKJFQfMCjn2cIc8LsR3+E1IY+zf3Sg3+FogfeIFria8bka1eODj7ExYmhpbLgw==
X-Received: by 2002:a05:6830:2808:b0:703:6ab8:1fe3 with SMTP id 46e09a7af769-70e0eb31f1amr8578138a34.15.1724563004054;
        Sat, 24 Aug 2024 22:16:44 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:43 -0700 (PDT)
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
Subject: [PATCH 04/17] Input: ep93xx_keypad - use guard notation when acquiring mutex
Date: Sat, 24 Aug 2024 22:16:08 -0700
Message-ID: <20240825051627.2848495-5-dmitry.torokhov@gmail.com>
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
 drivers/input/keyboard/ep93xx_keypad.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/ep93xx_keypad.c b/drivers/input/keyboard/ep93xx_keypad.c
index 6b811d6bf625..a8df957ef261 100644
--- a/drivers/input/keyboard/ep93xx_keypad.c
+++ b/drivers/input/keyboard/ep93xx_keypad.c
@@ -184,15 +184,13 @@ static int ep93xx_keypad_suspend(struct device *dev)
 	struct ep93xx_keypad *keypad = platform_get_drvdata(pdev);
 	struct input_dev *input_dev = keypad->input_dev;
 
-	mutex_lock(&input_dev->mutex);
+	guard(mutex)(&input_dev->mutex);
 
 	if (keypad->enabled) {
 		clk_disable(keypad->clk);
 		keypad->enabled = false;
 	}
 
-	mutex_unlock(&input_dev->mutex);
-
 	return 0;
 }
 
@@ -202,7 +200,7 @@ static int ep93xx_keypad_resume(struct device *dev)
 	struct ep93xx_keypad *keypad = platform_get_drvdata(pdev);
 	struct input_dev *input_dev = keypad->input_dev;
 
-	mutex_lock(&input_dev->mutex);
+	guard(mutex)(&input_dev->mutex);
 
 	if (input_device_enabled(input_dev)) {
 		if (!keypad->enabled) {
@@ -212,8 +210,6 @@ static int ep93xx_keypad_resume(struct device *dev)
 		}
 	}
 
-	mutex_unlock(&input_dev->mutex);
-
 	return 0;
 }
 
-- 
2.46.0.295.g3b9ea8a38a-goog

