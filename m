Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A428379C28
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 02:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782700732; cv=none; b=tPNiMRib2/Ml3OVBfHgBiuZ45s1Js1tsGizLCm2zHD0RFeY3VRcdLCoTALwgqDplMRHnq/5zYPm3R8JOkNNBFF6ndt99mcQfPWzKAt4C9FUhUcPfKr9+RD1Dcd3YjdaDh2NEpV2AsRmXlataABZQg4xxHWMqQYH0qUOXKSpPC3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782700732; c=relaxed/simple;
	bh=2XanIgMQF7FbF77eiEwNF8U6Cy3OAoH2Y2kGqFdSdBs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NjyWO11RUO4vYYbsdWl+WeEnl/OFwoWqp8aFoKFHtos0vjzyfeS//HZr9O2mVmdYowM/eLFKA0K6TefINja/sp7p89y9hXhfy+v9/8y0DgkJFkA+j0FlKvsWQoMVcMFB6n/SEcGEXxGONRFqOAg+ANNN/KEYNSku6XkHOr/jJNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A48bd5jD; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A48bd5jD"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-845c92bc464so1534178b3a.2
        for <imx@lists.linux.dev>; Sun, 28 Jun 2026 19:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782700730; x=1783305530; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tbxicf9cOISRpJE96mgO+H/y2TlKZ0WdbLHi50c/C7k=;
        b=A48bd5jDn5I6EVdEx62t+VRHKKCKdXkr0+5H7c2aQBasNCtpvIPAksHHr/n7vp9qjF
         Ozu2ZcnBmLh8jvKl8pwMO0kY/h8HFustNRlA7VI6Mp38XSOh7FmNyZJ/vX9SyDkF4TKe
         ezjyAyQR5vqU16eSkFmS6OHHQsZZ/rjMUg2y0I9/Ot0QrRXn2lV2Twi4YwZD8Oerk5XN
         gFV2PpBjwjfeojX5bL68IuYGfY7e7zb0k5TmB+ISMriph4TgTocc+5FOifXEjuhPbwzZ
         fZJqqXNUqsZ6oy7LaJzva4k4RmHA9QdVEb+RREWjOTEC0Yk20js9IX833pD8WvU7B4/C
         r77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782700730; x=1783305530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tbxicf9cOISRpJE96mgO+H/y2TlKZ0WdbLHi50c/C7k=;
        b=cQH/Hzjdk2M+cz3xWi7Zp162qzrM42dJfAVTgxreGpqbDujvT5zLa1tqXsvGlSmzm/
         LEHoCCWbJUT0W3ZtsI9475RZIGT3xBIEQZGibQtD8ohxakwVNd80kAHTXMewAlDnnmuw
         Cz8R49GKvzGA9jG+7oRflJo5m/zOVq+RNyurqsM6rBKXx8qHwP+OHuTrPD6UIfqjBPbW
         67YO/JFJljAt0zP4fc1+MEhz3z0ore+OW1hkrav6tyQv86872Qb1TC6Qrks2Musl1kmL
         GZhj+CbJ8vXnvoVEcQBZUjmHAACu3erwehZLYZnhnOSkjKvbEEvYPPvkNS8VisDTn38T
         nF3A==
X-Forwarded-Encrypted: i=1; AFNElJ9+kFIG7Of6nF/v6lLqPT70phKMeWuf8qU4xT4l2E8eI92ifqRvzGKfJeHGvUSxtGnKWlg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmORsTV9F00hTet2TvUVLZwuu2XPM0X7CCvlwAt8kWedczRr/1
	TA8pl8/1PsWjfFhpVsNQABiGLYci6RoOxA4pq8FdD1OKFWc4YMvOBP7F
X-Gm-Gg: AfdE7cnvp3KonTuVVOHwdzyeATw2rUKz+ePDnQlBb7PRWgU2gfftFAwIqVsxevqIpKR
	idY1QohNeYkVzpZT8UFz0Te1ydC3uNxW+4typAJncb+nbr9VT9D3t4JeArzKmSSUZJE37JN+jsi
	c9bu2xImQsqP2d/MI4LFAtFBl67+LknQsDq2cHAKX7EcnHsE0/ape42+GBZgrI5VoUYHJCcQz9O
	eIvdRuAx6cnBu+u6RYuNsqM5uH0CplC032QDdCy1uHXQrXNRtY0ZQ8wmYx4oiqxA6KGSonotZaq
	4bP+J/6f7rUNPUHJtDBDWqKsiP3DH9oQSSEuHbvSPwKgBaYaM8rCgsnovAcpa1PItn8OVQQiGi9
	THxUIPhlrJ8qY6Vz5nRYqVlhHk6emrR3HPiAxkS127Z0p3GLNoOM2SOVjYkwRKAdNkByQKTb/SH
	UdB0RRqbBIhlx7BnxKiDtFsQ==
X-Received: by 2002:a05:6a00:9493:b0:845:e4d6:bd2b with SMTP id d2e1a72fcca58-845e4d6bfaamr3829675b3a.48.1782700730418;
        Sun, 28 Jun 2026 19:38:50 -0700 (PDT)
Received: from archermind.. ([182.150.55.91])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92b9dc216csm6914869a12.9.2026.06.28.19.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 19:38:49 -0700 (PDT)
From: Liem <liem16213@gmail.com>
To: carlos.song@oss.nxp.com
Cc: andi.shyti@kernel.org,
	biwen.li@nxp.com,
	festevam@gmail.com,
	frank.li@nxp.com,
	frank.li@oss.nxp.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	liem16213@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	o.rempel@pengutronix.de,
	s.hauer@pengutronix.de,
	stable@vger.kernel.org,
	wsa@kernel.org
Subject: [PATCH v4 1/2] i2c: imx: Fix slave registration race and error handling
Date: Mon, 29 Jun 2026 10:38:28 +0800
Message-Id: <20260629023829.152651-2-liem16213@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260629023829.152651-1-liem16213@gmail.com>
References: <AM0PR04MB6802B863CD9B9AE1609C1785E8EB2@AM0PR04MB6802.eurprd04.prod.outlook.com>
 <20260629023829.152651-1-liem16213@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In i2c_imx_reg_slave(), the slave pointer was assigned before
pm_runtime_resume_and_get().  If pm_runtime_resume_and_get() failed,
the error path returned without clearing i2c_imx->slave, leaving it
non-NULL and causing all subsequent registration attempts to fail
with -EBUSY.

Additionally, because this driver uses a shared IRQ, the interrupt
handler i2c_imx_isr() can execute concurrently and, after acquiring
slave_lock, dereference i2c_imx->slave.  The previous fix attempt
added a lockless i2c_imx->slave = NULL on the error path, but that
could race with the ISR under the lock and still cause a NULL pointer
dereference.

Fix both issues by deferring the assignment of i2c_imx->slave and
i2c_imx->last_slave_event to after a successful resume, and by
performing the assignment inside the slave_lock critical section.
This guarantees that the slave pointer is never left stale on the
error path and is always valid when observed by the interrupt handler.

Fixes: f7414cd6923f ("i2c: imx: support slave mode for imx I2C driver")
Cc: stable@vger.kernel.org
Signed-off-by: Liem <liem16213@gmail.com>
---
v3 -> v4:
  - Instead of clearing the slave pointer on error, defer the
    assignment until after pm_runtime_resume_and_get() succeeds,
    and take slave_lock to avoid racing with the shared IRQ handler.
    Suggested by Sashiko and Carlos Song
---
 drivers/i2c/busses/i2c-imx.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 28313d0fad37..2398c406e913 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -930,9 +930,6 @@ static int i2c_imx_reg_slave(struct i2c_client *client)
 	if (i2c_imx->slave)
 		return -EBUSY;
 
-	i2c_imx->slave = client;
-	i2c_imx->last_slave_event = I2C_SLAVE_STOP;
-
 	/* Resume */
 	ret = pm_runtime_resume_and_get(i2c_imx->adapter.dev.parent);
 	if (ret < 0) {
@@ -940,6 +937,11 @@ static int i2c_imx_reg_slave(struct i2c_client *client)
 		return ret;
 	}
 
+	scoped_guard(spinlock_irqsave, &i2c_imx->slave_lock) {
+		i2c_imx->slave = client;
+		i2c_imx->last_slave_event = I2C_SLAVE_STOP;
+	}
+
 	i2c_imx_slave_init(i2c_imx);
 
 	return 0;
-- 
2.34.1

