Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5F9175B1
	for <imx@lists.linux.dev>; Sun, 25 Aug 2024 05:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563002; cv=none; b=rsKCAywOs84gYVO34VO/bxaGTIRsrrfPbdBWVe8FajH9RG7ydX+fV7OSO92vrob5DLPYSDM5oB2+tEhLcPSEvu5soZvVQ0KS2ZOWUXlGMfEKDPIQkf/5nGso+PnYetq22eZwxH4vlNTSnC5GHGo4E7bsyhpghHQ39q6VaoWyFX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563002; c=relaxed/simple;
	bh=OSk3cuE+1s6/axlkl5Wvob1pSWEblZgOBnVXoaDU3Z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ksYqVqzOIiOE2dnJpUO+Ob17Xa8pof+blFG7zUZfh2QW3ZReLojXeN1eVQIKNmp0VICNHxL65s9fOga7JJloHxdTzyQkcAn4Ok+WS0zlGMTgXrzmylSmLQIt5LuMnwf5xNM+8PpFSFen8PA5aVZuuhoj9sjva3fTeGB8XjFOAjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DeZ9IRpV; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DeZ9IRpV"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-268eec6c7c1so2367253fac.3
        for <imx@lists.linux.dev>; Sat, 24 Aug 2024 22:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563000; x=1725167800; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShO+HgvM3GmU9GyOB1yPa+S5A01U1lb+gXxQbTtxVpc=;
        b=DeZ9IRpVLu7s/UC+unp+vSeTmCStWxtDbcuzd5apLuCtjJOQETdsXEp1LEz+F7xsJ8
         5j+CqLldU7v5otgMYv1va1ACkR+K0wTQa3qs5h7h2psg4ivXO9gzufTIEmzpnsha7jN7
         N4+G+JNi2dwSQNeopOWjgpGZ3YaJEL1BNZdP6Zi9OgkM5AT0WzElyaQmWUDLSynWbZOd
         OG4cy4cVO1Ld45e9gh7dcpq6zO/yVxXit59oBW3c1IdbRlx3jPJggJo3lYMa5ZEg7zsq
         hPJyWJXGDcHplznTB/SsBHzem6wjlu3NQol7UYSsjkRaQM5A5yHL6oXDJ1Vx9Zkf5MPh
         qQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563000; x=1725167800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShO+HgvM3GmU9GyOB1yPa+S5A01U1lb+gXxQbTtxVpc=;
        b=qCXnGrTQT91pUuyrhKBIu1XcCS7GqlWn+st/gML6m5VoxQVb27WezGe/ROPZC9aa04
         ssJrKOFj2rIMQF5Bx6dgprZY1gBDKR7ndEdEx9gs5m16mqbI/Yb8OiJQF+UMfPW99Xwv
         jkLJTH1fROVP1CqQH0ZqudzFgLAfl1mePonjvIpPUw5JXfK4vOYPztHhef3j4A/nWZPj
         qTOAVb/TENjIXu2B+yNbbLwwuAsqFTcIZEK2HQfOUmmLqi5+rApHM01foA5H2mkuqtcE
         MEBrags4p7UDnHGQGyH+AWM143Y+R8fjfR/WeYai0H7rfit/QGhmxpM1NyTN4kGdlEt/
         JHKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSwQaYvOpDFXBpAaPDFtF4nUQOn5USgQglfpidpTUo3IyOQBG4wjSGp5HZ6r3WT/NW+IM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy66irItp7NPqBz0hbXENKfZKMjL45gbl18viAd0nfu1+kll4Pm
	wEt+XZPMrq0ZckIl5q7xm1TJvxnS7nbrUiBrbAprFvnG7aDCg87P
X-Google-Smtp-Source: AGHT+IEZFPpCzZoomgKLJTyaudR7j9NCS6uaxVcYk6aQIQGxzRythkb2raMKaNsay8DSDOaUBbZJmA==
X-Received: by 2002:a05:6870:1608:b0:270:440a:a40e with SMTP id 586e51a60fabf-273e67260d0mr8083459fac.46.1724563000175;
        Sat, 24 Aug 2024 22:16:40 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:39 -0700 (PDT)
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
Subject: [PATCH 01/17] Input: adp5589-keys - use guard notation when acquiring mutex
Date: Sat, 24 Aug 2024 22:16:05 -0700
Message-ID: <20240825051627.2848495-2-dmitry.torokhov@gmail.com>
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
 drivers/input/keyboard/adp5589-keys.c | 39 +++++++++++++--------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 8996e00cd63a..735d96b056d4 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -404,7 +404,7 @@ static void adp5589_gpio_set_value(struct gpio_chip *chip,
 	unsigned int bank = kpad->var->bank(kpad->gpiomap[off]);
 	unsigned int bit = kpad->var->bit(kpad->gpiomap[off]);
 
-	mutex_lock(&kpad->gpio_lock);
+	guard(mutex)(&kpad->gpio_lock);
 
 	if (val)
 		kpad->dat_out[bank] |= bit;
@@ -413,8 +413,6 @@ static void adp5589_gpio_set_value(struct gpio_chip *chip,
 
 	adp5589_write(kpad->client, kpad->var->reg(ADP5589_GPO_DATA_OUT_A) +
 		      bank, kpad->dat_out[bank]);
-
-	mutex_unlock(&kpad->gpio_lock);
 }
 
 static int adp5589_gpio_direction_input(struct gpio_chip *chip, unsigned off)
@@ -422,18 +420,13 @@ static int adp5589_gpio_direction_input(struct gpio_chip *chip, unsigned off)
 	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = kpad->var->bank(kpad->gpiomap[off]);
 	unsigned int bit = kpad->var->bit(kpad->gpiomap[off]);
-	int ret;
 
-	mutex_lock(&kpad->gpio_lock);
+	guard(mutex)(&kpad->gpio_lock);
 
 	kpad->dir[bank] &= ~bit;
-	ret = adp5589_write(kpad->client,
-			    kpad->var->reg(ADP5589_GPIO_DIRECTION_A) + bank,
-			    kpad->dir[bank]);
-
-	mutex_unlock(&kpad->gpio_lock);
-
-	return ret;
+	return adp5589_write(kpad->client,
+			     kpad->var->reg(ADP5589_GPIO_DIRECTION_A) + bank,
+			     kpad->dir[bank]);
 }
 
 static int adp5589_gpio_direction_output(struct gpio_chip *chip,
@@ -442,9 +435,9 @@ static int adp5589_gpio_direction_output(struct gpio_chip *chip,
 	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = kpad->var->bank(kpad->gpiomap[off]);
 	unsigned int bit = kpad->var->bit(kpad->gpiomap[off]);
-	int ret;
+	int error;
 
-	mutex_lock(&kpad->gpio_lock);
+	guard(mutex)(&kpad->gpio_lock);
 
 	kpad->dir[bank] |= bit;
 
@@ -453,15 +446,19 @@ static int adp5589_gpio_direction_output(struct gpio_chip *chip,
 	else
 		kpad->dat_out[bank] &= ~bit;
 
-	ret = adp5589_write(kpad->client, kpad->var->reg(ADP5589_GPO_DATA_OUT_A)
-			    + bank, kpad->dat_out[bank]);
-	ret |= adp5589_write(kpad->client,
-			     kpad->var->reg(ADP5589_GPIO_DIRECTION_A) + bank,
-			     kpad->dir[bank]);
+	error = adp5589_write(kpad->client,
+			      kpad->var->reg(ADP5589_GPO_DATA_OUT_A) + bank,
+			      kpad->dat_out[bank]);
+	if (error)
+		return error;
 
-	mutex_unlock(&kpad->gpio_lock);
+	error = adp5589_write(kpad->client,
+			      kpad->var->reg(ADP5589_GPIO_DIRECTION_A) + bank,
+			      kpad->dir[bank]);
+	if (error)
+		return error;
 
-	return ret;
+	return 0;
 }
 
 static int adp5589_build_gpiomap(struct adp5589_kpad *kpad,
-- 
2.46.0.295.g3b9ea8a38a-goog

