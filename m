Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32ACE1CF9B
	for <imx@lists.linux.dev>; Fri, 31 May 2024 14:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717165488; cv=none; b=bqAQEBkHPHOppEcsreBsG9aZyrxACHE2nPrkkq5MKAky9BGxTVoXz0nlGtJXhy3gTy8pALi5/CMnRF2JKRCjTMvrOEBJ0/VGi+BtsNXCR5RLnHmfHoxMd00tWdSYBKpFZqHZjLh6ccKHtYY9pB2zoahy+/DfKa0tE7vZtczioPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717165488; c=relaxed/simple;
	bh=Kyls1XarLL3j7W8QAWP8PzjJaN3EmNERJNTYyvB59V4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NmcDPUjz6Gvw7cq0ozLXGmvNkm/vqZbb96lvx4yzjv401juhPnpgAFsed9hPfQImXYQyRa77/85QtTuIwVpXn2Bw+Dtki+08RnQX09eQ40cAY/fP1Zk0er9TXQDyOUN0HWA6GRu9zcstrANEKs2MJuO4zMOgw5pEM81s6ViQiMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIwnC+SH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIwnC+SH"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4202ca70318so19857885e9.1
        for <imx@lists.linux.dev>; Fri, 31 May 2024 07:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717165484; x=1717770284; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tvugHJuLmQUc6cOC5U1VQIb36XNwdMjbA+t0EJil/IA=;
        b=mIwnC+SHLhbhS2tnd8aV4Vh4QIu6jszNoCge/dTmHbbokur5LTnkQf9LZlxrPyxNHR
         MEfA8GmsEWyYzUxvGsnQXY4XlDWabN73tqQeG7CXRFMy6/M0xHu7xUNxXbTAVdMnsnGh
         W2H9o2KKFIuDVWXOkP6mT/tCCm5wYn2l7oAIhQtnlF5XYCzyx5Tb0h+6WTFIE8HHO3uU
         fN6tKzFCPukzkiDxXXq30PB/kt6RWP5Td2fYs8doOrI67raJ2xJNlUjyKTWM5AsaudjP
         bOEbnB6dWNBbs9Ad+pr+6QoSljUQPiGrG91zNCL+6RfvqErbYvTsmdXvXHBCOz2mhFIG
         B0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717165484; x=1717770284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tvugHJuLmQUc6cOC5U1VQIb36XNwdMjbA+t0EJil/IA=;
        b=bAnb35MkI5L0C/NJaiQmMTXAWzhd8Mx6A66t1+jdhtQQgBZUFfu4foXwAkPZIf1SpO
         sXC2tx7/gebKajJ6eQ/4jaKFwaDUHiSf3bCu6CoYqz4B6FXNRWtd6jRQYwG1AcckEfGP
         x3ntnKbUJc7bgadA50HutUpsLr/riMkja166iYmMUbu0aSZWydqXaTa47kW+bjzmjGIl
         W/o4yttTZNqpKbCwO0W1+sWWmPFMXVYkOhWdKBqo+V8Oq+PGGfvShBYy2rHt00IqbaER
         qgkv5y8PcvwLahsfwDziOt2eGhzk5MpFd3rjd5ai8qhJW92hlXCwn6oyIIeo48RDD7yn
         fCSw==
X-Forwarded-Encrypted: i=1; AJvYcCXnAOFWz2Jw79/DgxTSQliIna4Vv8k7myQUf2dIjzSldBHbA9Bb8QoXHbiMXk8HNIRgksR/AID5bXaf62anJ2WI0lDu
X-Gm-Message-State: AOJu0YwLlqYlbTEKYHhA6rEnPVUEhNuIsxRc+lZ2K2lcsX6oFXaxMrgr
	Kp8Y5xMDHdEZm4bHIb3Wv8hQIC3myWj6Rl3YTOCW2wCoJXzyifbG
X-Google-Smtp-Source: AGHT+IGTYpztiA7U0O7D+ZJjrvnzu789lGae56lcoOL7cIRtDV3rFkXO1yh0FXSOa6ct61AKz8rl5w==
X-Received: by 2002:a05:600c:45cb:b0:41f:fca0:8c04 with SMTP id 5b1f17b1804b1-4212e04998fmr16361265e9.11.1717165484201;
        Fri, 31 May 2024 07:24:44 -0700 (PDT)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:d7a5:3a0c:813f:54e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421292205ccsm48136685e9.4.2024.05.31.07.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 07:24:43 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	jic23@kernel.org,
	lars@metafoo.de,
	nuno.sa@analog.com,
	andriy.shevchenko@linux.intel.com,
	u.kleine-koenig@pengutronix.de,
	marcelo.schmitt@analog.com,
	gnstark@salutedevices.com,
	francesco.dolcini@toradex.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	eichest@gmail.com,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [RFC PATCH] i2c: imx: avoid rescheduling when waiting for bus not busy
Date: Fri, 31 May 2024 16:24:37 +0200
Message-Id: <20240531142437.74831-1-eichest@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

On our i.MX8M Mini based module we have an ADS1015 I2C ADC connected to
the I2C bus. The ADS1015 I2C ADC will timeout after 25ms when the I2C
bus is idle. The imx i2c driver will call schedule when waiting for the
bus to become idle after switching to master mode. When the i2c
controller switches to master mode it pulls SCL and SDA low, if the
ADS1015 I2C ADC sees this for more than 25 ms without seeing SCL
clocking, it will timeout and ignore all signals until the next start
condition occurs (SCL and SDA low). This can occur when the system load
is high and schedule returns after more than 25 ms.

This rfc tries to solve the problem by using a udelay for the first 10
ms before calling schedule. This reduces the chance that we will
reschedule. However, it is still theoretically possible for the problem
to occur. To properly solve the problem, we would also need to disable
interrupts during the transfer.

After some internal discussion, we see three possible solutions:
1. Use udelay as shown in this rfc and also disable the interrupts
   during the transfer. This would solve the problem but disable the
   interrupts. Also, we would have to re-enable the interrupts if the
   timeout is longer than 1ms (TBD).
2. We use a retry mechanism in the ti-ads1015 driver. When we see a
   timeout, we try again.
3. We use the suggested solution and accept that there is an edge case
   where the timeout can happen.

There may be a better way to do this, which is why this is an RFC.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/i2c/busses/i2c-imx.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 3842e527116b7..179f8367490a5 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -503,10 +503,18 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy, bool a
 				"<%s> I2C bus is busy\n", __func__);
 			return -ETIMEDOUT;
 		}
-		if (atomic)
+		if (atomic) {
 			udelay(100);
-		else
-			schedule();
+		} else {
+			/*
+			 * Avoid rescheduling in the first 10 ms to avoid
+			 * timeouts for SMBus like devices
+			 */
+			if (time_before(jiffies, orig_jiffies + msecs_to_jiffies(10)))
+				udelay(10);
+			else
+				schedule();
+		}
 	}
 
 	return 0;
-- 
2.40.1

