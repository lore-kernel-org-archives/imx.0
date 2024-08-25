Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837B9135A79
	for <imx@lists.linux.dev>; Sun, 25 Aug 2024 05:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563020; cv=none; b=dCCMLpkuffrvqmwgTUxDLnDQCPy44qdNZqpN+iBPm3H2LFC6X/FNX9TOn1blX0IuXZLWox+L6j3UjyRnF+gBJTKaH9bkLixczYqwZLqj25pVpnSsK34HrDueXIEt731CORihteN+t2ytj9C0sEk2b3oBwIcH9DItQC+1ffEwOn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563020; c=relaxed/simple;
	bh=jwVJzglfziH/nV1kcY0Uo3ZHM0I6kZU1L/m/bOzcWFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=njbxJePsVTTr3rfLgFOoB8MdUlFFLJtQ6h4YGcFAKf1qmKAEBhR4ic4X3h5wCeX+v22kdTb8fihZWXkVjvkknAcCAQ/rPRS+IfxpxTVrAtHgBiHapsDFuCdQ5lsiem7HnT7OIGkdZqcXKShQDPNwWzSi15ArAH3AbAx0qpYcmhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VI9qNzXn; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VI9qNzXn"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2689e7a941fso2810030fac.3
        for <imx@lists.linux.dev>; Sat, 24 Aug 2024 22:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563018; x=1725167818; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIA6h/0y/Yz1gsinooJtctLwNKMffY0VfmYdSxulMqA=;
        b=VI9qNzXn6E//2+ksyhDNu/S0jgyZfyR4i21kbX784ewg6tkeG3DXc0LzaRRvbaTE6S
         N9ddqKoNRfx9ZLQDCDJwUSfxTws5k7/ry0N6tFot3VL4BavMVDujauVM6PolV4+jEsk0
         D9T7j5O6nHjBhUmnP/9Z9zrEHSfTi63oPmluJlBTTf54KJ8OJWjXCFcGyPpupIQgYjDY
         J8DrwecfLOy89gHc00NOVYj6Sb9GxPzItfQFe0xA33Dv2ZF2WWge11jL0wesh0kQ8MgJ
         4Z+7lifNbZF5Z2vRc0K5MaI6i63vawt6H/nZAh+EE+ywWEQDpFupnVHNMQNmC/jXsz4I
         SCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563018; x=1725167818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TIA6h/0y/Yz1gsinooJtctLwNKMffY0VfmYdSxulMqA=;
        b=c7RxzVPsO0KP8gLPY2RW7I78V1LLtvytY53SmGuzCoaoiMpeRgLYOyLk4xqslcXQPf
         7nelDYvbYJV64296aLArq+gKmTYKoYlrgBc2BfR9s+0WSqCZGxZhataqVrxbZYEPTAxe
         yhdVqfh4y9djIPczJEYmlLWWSrM3HO7Jr6a8Di+v4bJovqWIKfefLQr0S88O5WbM96Fk
         xfTt63oCTw+1wwNMsXXkmML5KxTyowBrNZ6ttizoDVg7Fr1my6qHcFFK1WcOhO3cyfq6
         AljjpZRh24l+flPZ9ewSK4hb+T9dgI8FieSZqmGaRv0dQ5strVs6z2o/DHQoXnv7//nG
         8voA==
X-Forwarded-Encrypted: i=1; AJvYcCUiDSwkGnSU6RUJP7+lmUrib5KUoOUXOznB3rnvyDNwAvmSSYpYTRqWBDsUwxxISXY8QPE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOjpaY6eT1NbDl7XnCAXU6/04pG2bkqKX1E3SH4TkcuL+QPRxB
	WbJ91Lkn7ALW8A29DoODvGHvJJW2nqogIbfEi8zWkuo3XG9rgA6X
X-Google-Smtp-Source: AGHT+IGpby1l5kr49d3Ag7IqPDJ5s1jsbrR0tYx5ZtWy5I5Dnd9r2dAg+L7acAO7bMwntLfgmcpiOw==
X-Received: by 2002:a05:6870:548a:b0:26f:e09f:6090 with SMTP id 586e51a60fabf-273e6620ee7mr7487035fac.37.1724563018382;
        Sat, 24 Aug 2024 22:16:58 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:57 -0700 (PDT)
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
Subject: [PATCH 15/17] Input: spear-keyboard - use guard notation when acquiring mutex
Date: Sat, 24 Aug 2024 22:16:19 -0700
Message-ID: <20240825051627.2848495-16-dmitry.torokhov@gmail.com>
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
 drivers/input/keyboard/spear-keyboard.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/spear-keyboard.c b/drivers/input/keyboard/spear-keyboard.c
index 1df4feb8ba01..2d3f656e59dc 100644
--- a/drivers/input/keyboard/spear-keyboard.c
+++ b/drivers/input/keyboard/spear-keyboard.c
@@ -274,7 +274,7 @@ static int spear_kbd_suspend(struct device *dev)
 	struct input_dev *input_dev = kbd->input;
 	unsigned int rate = 0, mode_ctl_reg, val;
 
-	mutex_lock(&input_dev->mutex);
+	guard(mutex)(&input_dev->mutex);
 
 	/* explicitly enable clock as we may program device */
 	clk_enable(kbd->clk);
@@ -315,8 +315,6 @@ static int spear_kbd_suspend(struct device *dev)
 	/* restore previous clk state */
 	clk_disable(kbd->clk);
 
-	mutex_unlock(&input_dev->mutex);
-
 	return 0;
 }
 
@@ -326,7 +324,7 @@ static int spear_kbd_resume(struct device *dev)
 	struct spear_kbd *kbd = platform_get_drvdata(pdev);
 	struct input_dev *input_dev = kbd->input;
 
-	mutex_lock(&input_dev->mutex);
+	guard(mutex)(&input_dev->mutex);
 
 	if (device_may_wakeup(&pdev->dev)) {
 		if (kbd->irq_wake_enabled) {
@@ -342,8 +340,6 @@ static int spear_kbd_resume(struct device *dev)
 	if (input_device_enabled(input_dev))
 		writel_relaxed(kbd->mode_ctl_reg, kbd->io_base + MODE_CTL_REG);
 
-	mutex_unlock(&input_dev->mutex);
-
 	return 0;
 }
 
-- 
2.46.0.295.g3b9ea8a38a-goog

