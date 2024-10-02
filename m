Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1601E7656
	for <imx@lists.linux.dev>; Wed,  2 Oct 2024 11:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727868025; cv=none; b=PMGrPyOw3PicXHUQIVNp2LeLULtzBn3NX7/9Nof0g8iLdSvCpRI8bXQK4Hs25iVwAk1NuhKeR8ABZipSXIfM4Tp/eZFGJTkdYuWwdSCU/kmxTS/t9GGSt/E5/DRiP5C0ZiGB+YT+QGtS+BaIcdYqWQLENHaH58YjiXWOMnSLJu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727868025; c=relaxed/simple;
	bh=PaCoDRTAmUihExuD6FtY8QmrsRVYjIS7AWfLLY7wlYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MuhPq/WSaMWA1DfqkeqChWAdOqUmIaeNQtB95v+88M5ZDPTDT2oDH0vvtu5EZBZfuwImnVYxFPMmcJjf5kvLiF0G8dt8pX1ZIXMXodxo8lkNB8b4kPRbZybEfQ8m0lBxEdLu4RZJ37nlBZXuOzQVnCP6w7VxaCrteQKE174o/10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=izwwknCa; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izwwknCa"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42e748f78d6so54169725e9.0
        for <imx@lists.linux.dev>; Wed, 02 Oct 2024 04:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727868022; x=1728472822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yQ6x4zObDyJ43omHbKWsYVs2kFPS4sw0rkU3gO4im2g=;
        b=izwwknCaAF2xEMueifbqQrNa9dZXVegwTE0dpqysDoCOcGk/tbOOG13oG1KnvIY8C0
         tTMIuztp6acJSEtoO9+2BZYpgbppOjVW88B78qhQJTlrXVDwN15PoSJ19rlXWhEfctlG
         T2VQghQ4Jdmtg7fF7G8rcMXps3V5P8S/UysXE8qTri6UFUQunH9Rnos7K/7MtVm46MV7
         mnIkUjduxXauI0r6yDNfcOdWuW6mVk0jszn4ZwbeYiLEpaucxIg2d4GXiwx33igT1nUA
         jFsnC+B0JpqNgf70Sdw173wK1kHQVZwedFwA21fg2RVYWb0C9wqTsA12A8cVIAQ+1/3p
         zp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727868022; x=1728472822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yQ6x4zObDyJ43omHbKWsYVs2kFPS4sw0rkU3gO4im2g=;
        b=ELye4MjE+YvOnXQ2GeVJTpqaDov4qbhcj6L5CJZdcsSQ6iiNCcqTXyadD1jgL1EoUh
         KZCkRbhE7ldtPk8fSZPAZzF16X6qjZLLEUMlXjE39YSebJ7FrFuQiKLxfrceeKQQTKZo
         fNsC7IGolQWySTr1bASpmsa8PVhJFAHKgLJfWHkK5eduBBw3r5nVsK3N616mHnWoBj/j
         hi1w7kW0cPsMcARU+SGAXY4oVYQgoWuJymCeNsCVxvnc3j0g+thNAAmxQsFRNK4ubt8+
         HBC5dDICGq+v4HWv+b0Xu4VzpnO1SXHxF+BOHdD8ZL2COdT5ZccP/F0Q81uhc2cRfHD9
         RMHw==
X-Forwarded-Encrypted: i=1; AJvYcCXI7YopMA2Bg0HDtASo+qaE8Hzr0ziHYQyi6BWIrXNsprmW2ZE93Vj3l5axNh/N8hc1Ig0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh8Qsu5kEzhDhoROLxMhfR2aENZ80eujxybBv6Lkpu6vsNClQN
	jX/tSWCCQgOj5KMAh4g2XfwKr4uhFiDAVzygc+jD04dLBVWpEPuF
X-Google-Smtp-Source: AGHT+IFr/46f/cbDZz1FoAo51AuLN5PJHXEunpu05Lqv3Z5yVZrxyifxONPvmsJa38GK+xLCRjfi4w==
X-Received: by 2002:a05:600c:511d:b0:42c:a72a:e8f4 with SMTP id 5b1f17b1804b1-42f777b798bmr21423495e9.14.1727868021592;
        Wed, 02 Oct 2024 04:20:21 -0700 (PDT)
Received: from eichest-laptop.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f771a1209sm23530685e9.0.2024.10.02.04.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 04:20:21 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	Frank.Li@nxp.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	francesco.dolcini@toradex.com
Subject: [PATCH v4 0/4] i2c: imx: prevent rescheduling in non-dma mode
Date: Wed,  2 Oct 2024 13:19:38 +0200
Message-ID: <20241002112020.23913-1-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While running tests on an i.MX8M Mini connected to a TI ADS1015 ADC, we
found that the ADC would stop responding to i2c requests because it
would timeout after the bus was idle for 25ms. This timeout could be
traced back to the rescheduling events in the i2c-imx driver. The
problem is that if the system is under heavy load, the schedule call and
the wait_event_timeout may be rescheduled too late to reach the 25ms
timeout. The same problem may occur with other SMBus devices. Therefore,
this patchset removes the scheduling calls for non-DMA mode by handling
the interrupt events directly in the ISR instead of scheduling a task to
handle the events.

This patch will introduce some bigger changes because the logic for
handling events in the ISR had to be rewritten. Therefore we have tested
the following combinations:
- i.MX8M Mini with dma
- i.MX8M Mini without dma
- i.MX8M Plus with dma
- i.MX8M Plus without dma
- i.MX7D with dma
- i.MX7D without dma
- i.MX7D atomic mode

Because we do not have any devices that use the SMBus block transfer
mode, we were not able to test it. 

The ideas are based on the RFC:
https://lore.kernel.org/all/20240531142437.74831-1-eichest@gmail.com/
However, the handling of events in the ISR is new, because further
testing showed that it was not enough to simply remove the schedule
call.

Changes since v3:
- Fixed style issues with checkpatch.pl --strict (Andi)
- Add comments to explain the code (Andi)

Changes since v2:
- Add Acked-by tags from Oleksij
- Renamed i2c_imx_start_read to i2c_imx_prepare_read
- I did not add a Fixes tag because the issues from Flavio have a
  different root cause and are not fixed by this patchset

Changes since v1:
- Add Reviewed-by tags from Frank
- Add new patch to use readb_relaxed and writeb_relaxed (Frank)
- Update commit message for patch 1 with some clarifications (Frank)

Stefan Eichenberger (4):
  i2c: imx: only poll for bus busy in multi master mode
  i2c: imx: separate atomic, dma and non-dma use case
  i2c: imx: use readb_relaxed and writeb_relaxed
  i2c: imx: prevent rescheduling in non dma mode

 drivers/i2c/busses/i2c-imx.c | 369 ++++++++++++++++++++++++++++++-----
 1 file changed, 317 insertions(+), 52 deletions(-)

-- 
2.43.0

