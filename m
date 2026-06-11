Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0406533122A
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 03:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781149165; cv=none; b=eXjJKNCeNHIHPu7EsvNvhweW4zh1fvZOz1ava2eihqK/6ZHVDsRfc0fTjJMcvoedH/7fdXTKZ1YM9ZX454mKW/g7cRALaBBtvmd6czmNXXlAHqongKAY+OW18xFz8B0PAyNhVaQSQ04RLMAJK6uuRCWuyDgVIJKrxv+F3Hj8hNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781149165; c=relaxed/simple;
	bh=cmMm1p6O9Mp3axJclA4sAP6G4alWEw5/lSU36Eie7X4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X+X5lt7zb6I7ZQD8Z1J2xFBVjrF8oSUuEj3nnClXtzly6pRr/C3IUPjtDgPIqCRcM220619dY5uxl+EhOx8nafjiRr4U4IqCOqGuv0fspAXm9OYbdDuR5FyEP0sT9oaflmdATC6XhChLb/26C0fRdeAUQ9CE6NerVWty+iOdjo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLbM5JIC; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLbM5JIC"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84237c55ef9so3602568b3a.0
        for <imx@lists.linux.dev>; Wed, 10 Jun 2026 20:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781149160; x=1781753960; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+4cm9QbNYmcZl/MXjwCiNY3TdxompycqRGjEnRpi0s=;
        b=XLbM5JICTVz7SvyaMDN3l0SyTcCka6O9DDLRJWc6PGDGNjZ3sjOflz3jVEK0ZKHuXA
         k7uAZR9+WWFjmGDdB6WCwgTIhD6NsRmCh11KMHjUT5E33TAQzVZN8W/MgNz/kScsgqjN
         pxJ125J13i4VvvY/xNKiG4gxpkR0/MxtEZPkD+d4YOTPYe4BKcQEq3Tm5iZO2CjY1xd0
         lPxk6Gw0UCrxNmiHCHGY4FhtMjvDUb0xcVc2QVT5WCRhkpB9LgW7jXjtqInClvdLpGuj
         cb6eozcrk13VnMSKmgDrE+Pilrx+iAkQDxadQiaye7yrggHFI/KCzNEdxKE3xRtyJi3/
         RJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781149160; x=1781753960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w+4cm9QbNYmcZl/MXjwCiNY3TdxompycqRGjEnRpi0s=;
        b=esYi7s18XNjy+1VNqBNjp/aFsxYVBu1+S5gzNe2rCqBKmk5H2Ct3jy4b3EgxVXC9Z7
         Lrm3u9P2HF6QkAI2Riu64f2mGDQ5jJdugLpqyaDpma+w8tZtg7Gvp/3ucSID8Y/x0DEv
         ynDTtfLbF84But5vJ0ZNTl29pVG2SZWzxmBO1alBKDAdaL4PIvCycMPm/WhE68ZNi51g
         Pnm+z5lFSVvsiqLD7fE53P9NYwdDzOCgBhaOB0Q3BZJGVkQ8KrZON3Yj4uPq4m9HP2ni
         Mfslg8L+KR51RC3/mJSGgwQfbiuQ5TTcwjCY9pvi/VSLzamjLkhIdrEXAYgY3N72l2XF
         uNUw==
X-Forwarded-Encrypted: i=1; AFNElJ/OvZ44WNdRf28LM+QZzJZ6kihxC5e75QhZK/hw1A8pE9I5G6px1jT1wHnfuAZU3uoP6hI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzYpl5sxSCcQshR4N6kjkXoPYS5eylm8+QPWpVnsna+75X3lE2c
	CVULqc+alnY44eWGidN6ZmEBu3OGSpYfGqOreLDpX/7vMnvQotAeAyfl
X-Gm-Gg: Acq92OH7uvwwiSIpF8J0nJZ6HBXk551KVaeZEQ2/dz6kJTwvE4xQt/BCgc0l6CkYHjF
	/Q3GKTwZ1sefcEEpSwV9e3zpEj2U5MhZcz4atPpdCMMZLe3B9cbEkYn8lQlBORJEMyV+GlQrld0
	NhIYjFW+UUv8Ke1s9uzxlf2cq7KMY/5dHSQFIQnmNqiHsufLOVgYo39HU6IyI7qEKTWl1n70LKN
	HomXBiteD1JoEj2fUGLkCjeE5/LToHDr7h1ztB9lpbE4DfE498wnHCbMe8JYGUl87AvfUlwnXjM
	h7KjRaJXnQbuT5gxG0uMswUL2/0vCpVAz885odczBm2CHOldq+3uHl7v5ZP8gEU1jlAOwBaUKd1
	Aur1yfqUHlokxDYReHblFrydFOYRCExHidfJJCjRLwJtbCn0lRs4X8V5Oc0/NZdp4nDP9j9Tkjs
	MDA4sU+g8sS82aKPXYmVdWSGdyI6Fb+nuu7ybs4evmHH9McJAJdBn3CZeuB2/jxDtPA/MQPcJ/R
	+f8KepI3LH80rWnIq+ChkIDHZK3hb5qZF00/NHUil3Ovg==
X-Received: by 2002:a05:6a00:194a:b0:842:5ea5:5ff8 with SMTP id d2e1a72fcca58-84336bc62c8mr967189b3a.42.1781149160353;
        Wed, 10 Jun 2026 20:39:20 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bb47eesm334548b3a.13.2026.06.10.20.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:39:19 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
Subject: [PATCHv3 5/6] serial: mxs-auart: clamp RX DMA count to buffer size
Date: Wed, 10 Jun 2026 20:38:55 -0700
Message-ID: <20260611033856.6476-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611033856.6476-1-rosenp@gmail.com>
References: <20260611033856.6476-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In dma_rx_callback(), the RX count from the hardware status register
(AUART_STAT_RXCOUNT_MASK = 0xffff) is passed directly to
tty_insert_flip_string() without any bounds check. Since rx_dma_buf
is allocated with UART_XMIT_SIZE (4096 bytes), a hardware fault or
compromised peripheral reporting a count larger than 4096 would cause
an out-of-bounds read, potentially leaking kernel memory.

Clamp the count to UART_XMIT_SIZE before use.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/tty/serial/mxs-auart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index e2b656638ab3..fe48a372d022 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -823,7 +823,7 @@ static void dma_rx_callback(void *arg)
 	stat &= ~(AUART_STAT_OERR | AUART_STAT_BERR |
 			AUART_STAT_PERR | AUART_STAT_FERR);
 
-	count = stat & AUART_STAT_RXCOUNT_MASK;
+	count = min_t(u32, stat & AUART_STAT_RXCOUNT_MASK, UART_XMIT_SIZE);
 	tty_insert_flip_string(port, s->rx_dma_buf, count);
 
 	mxs_write(stat, s, REG_STAT);
-- 
2.54.0

