Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA961F5842
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 18:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785521035; cv=none; b=bYA85I+Q9aIcCtPm14TK4iZ50LUrUkLVnN6lIfb2YXVQYgRtwHge3K+9UZ7AVpWN2j95l5Bk29rqyzm0baQtDS61qSvUQweSvbg01q+nMrh/x4+1cRa1E82XLKLpdUL9gmaDt4L0hB26Zvlg49gTPneUbZVhoXmMdWitT3TfMq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785521035; c=relaxed/simple;
	bh=UnIwtfXNjLpC1Ihz9kKhZCxir32MMPCFCV40pupJOyw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=e88SGOHVpbIsJyb3o74vTGGudXNdAoBZutnxDHc4yoj78NFI9uSrpVJLJl45Ykd9JTw5EqjnLtIYwUAyPBLbXvtu3aN3eIcX5fIwvRA7p0EZkabZGwm58oc865MMvxaASl70vwy0KXaoitsiMARlwKBlL1s1/5pzdrbMMmTG8/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mf6vSxaH; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mf6vSxaH"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f633e6058so1335533f8f.0
        for <imx@lists.linux.dev>; Fri, 31 Jul 2026 11:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785521031; x=1786125831; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z3rxXlGHbXQONq0nbuDOk1X0SJF+agPubKPIOuTmpB4=;
        b=Mf6vSxaH4R+BG7enx77zpEzI4PevwpcSmzGaqUixetVr915pf9rLyKo5pA0zdePszR
         yGWLnKKWMY6/NKMeikZwxlapQTP3OA+TbyswpZEycXIO0x8cav2nngQoElJbziRuNi3z
         l7DEe7wxTDqPV/+ZaXk9HRRI063clgxz42a7mRxarEP5ctUqALkdOVeXdbFt0/v58+2C
         m4mCNJteghkxKp1FnJ86I0ipoC6StfDaeAbfXeAXIjdsGPYhLsg0RaPT/pdY+QCn1I/I
         dZOvrsComdbNxf96u/VZ/x3Y4Ex02KYuThafnuEiXIxbBrIUMFQRpIp1QhPFiBNaNFmC
         xHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785521031; x=1786125831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z3rxXlGHbXQONq0nbuDOk1X0SJF+agPubKPIOuTmpB4=;
        b=Fs7ILkW3Cqe9Gqhdpay39CsuZc9yFV6qxKr1Ur3WZukRvMAiYCBnCbw5Nr/I62r2FV
         ghuZo3vjnNL6T4v1aJhux7Qh+8onzOws3e5BDvdBKjfPaQbRowhBglqggsOmudf5Qt5z
         mhStShFd4xxaFNY9S0dq4+uvS2TZgyiATnyOnIuAwxfkOzUb6NirZH0ZmgZ6dWWwtMlD
         rJFlB1gO25pYEmlMe/vU4vFgdNiUfjTpttyV2UCiTYJI+DbYeMpfgzglrTiXlrQI08Sx
         ESal9/izzFi0TPVUWk2Zxv1HvpIFr7X9ahXhHWzGGIqim59HTYBKt9FbkXju1pfAZQLz
         BiRw==
X-Forwarded-Encrypted: i=1; AHgh+RoGrDf8FTQzxXXmFUsSz+ZC62BUhPBafR1r029Z4EoXTC0wzIrEgqgdLW0l9C8nurV4kRM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4G1egYGyKN/BlSnPXvmIaZlZZ83nO4gdEO8bdHPeQiiofObnd
	jKwhqqgEwP8V8MCZHLj6ax6xMpLanjl+qi13bKA1gLKkHhkzbnqLnR1Y
X-Gm-Gg: AR+sD13WBjeMJ9+MCIFNfVC4bjcUfnrFk95IJ2PXDS3Clkgo9hrbEbb7Ap2fDI8ObXK
	+rmF9DkE/XtcFQh4PXszlZcBPQ//MkiVhxM/9dfWRDluNzdj5g+OHlxpZ1W3/C36vbeNP2pRmQC
	+tBO/9NZR95EFWdDFHxN0ew6x5I04fHNv8qQQ9cmmq9IjJkEzr9y5IA95D8hJxAqJh/dFVAJq0Q
	IoZb+WQVrA+S47Xm8dz4+9sVUC6WC7iB5TkU6XN1VPSDyKObCoqRVrCh/Q5VlfBXjNZEiWXdJxr
	47qC3g9lf6fExTtFWysT3C8aKFyJ7fUa0n2NZI+9iyShfhpbRwQYrHnVIgvt9jwdG771XdMGSOX
	joVe+Eh6LF8rWR3isYAoPiiqscZk9ayzOYffpOPbQic24PbydFv99U1MXmfIw64wPK4Ms4Fbpei
	qGg7JTuMAOyUqbD7LPyQ6UitO+Qbbrf12YsX10s3Ktd1S8/eGButKsoDcJJlGk9npXvbx4bXWZE
	9HnkQpgBF8zYkrJHq7ADEQxDyIBXMoLgk2XP4vUkmTUroQd1kvRP0Mcgb2XEsAdBiUX1PW8Qyxe
	AjsP1ikzp+IsQjFFEZCbBYKX47YB6SqVItdeR3SCqyGJkU6xLRszicCyqECFXLosxlER
X-Received: by 2002:a05:6000:4693:b0:470:2fb1:3dbc with SMTP id ffacd0b85a97d-47fd72e0638mr836970f8f.35.1785521030885;
        Fri, 31 Jul 2026 11:03:50 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8d0-bc01-6d31-3d12-3a11-d2d0.310.pool.telefonica.de. [2a02:3100:a8d0:bc01:6d31:3d12:3a11:d2d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91bfsm7878295f8f.15.2026.07.31.11.03.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 31 Jul 2026 11:03:49 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/5] serial: fix console lifetime bugs on failed bind and removal
Date: Fri, 31 Jul 2026 20:03:43 +0200
Message-Id: <20260731180343.10818-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes four serial/tty error-path bugs and an i.MX console
port-table lifetime bug. The fixes were found with failslab fail-nth sweeps
and sysfs bind/unbind sequences under KASAN on QEMU's raspi1ap and
mcimx6ul-evk machines.

Patches 1-4 fix shared serial/tty core code. They move fallible allocations
before console registration, clear pointers after uart_driver registration
fails, and make a non-NULL tty cdev slot mean that the cdev is live.

Patch 5 clears i.MX's devm-allocated port-table entry after failed probe and
removal. It keeps the entry valid through console unregistration, rejects
duplicate lines and serializes table updates against other port probes.

Validation includes fail-nth sweeps on both boards. The i.MX tests also
cover the sibling-probe race, sequential unbind/rebind and
CONFIG_PROVE_LOCKING=y.

Changes in v3:
- Drop Cc: stable from patches 1-4.
- Patch 1: remove redundant uport->name clearing and credit Sashiko's report
  with Reported-by and Closes trailers.
- Split v2 patch 3 into two patches with corresponding Fixes tags.
- Shorten the changelogs.
- Patch 5: use scoped guards, reject occupied slots, remove the unnecessary
  line variable, document the console-callback locking constraint and add a
  backport note.

Changes in v2:
- Patch 4: serialize port registration and removal with imx_uart_ports[]
  updates to close the reported sibling-probe race.
- Patches 1-3 are unchanged.

v2: https://lore.kernel.org/r/20260719221014.44354-1-kmehltretter@gmail.com
v1: https://lore.kernel.org/r/20260719160812.35407-1-kmehltretter@gmail.com

Karl Mehltretter (5):
  serial: core: do fallible allocations before the console can be
    registered
  serial: core: clear freed pointers on uart_register_driver() failure
  tty: skip cdev_del() when no cdev is registered
  tty: clear cdev pointer after cdev_add() failure
  serial: imx: serialize imx_uart_ports[] lifetime

 drivers/tty/serial/imx.c         | 20 +++++++++++++++++---
 drivers/tty/serial/serial_core.c | 32 ++++++++++++++++++--------------
 drivers/tty/tty_io.c             |  6 ++++--
 3 files changed, 39 insertions(+), 19 deletions(-)

-- 
2.53.0
