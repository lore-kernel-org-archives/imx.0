Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10C434B697
	for <imx@lists.linux.dev>; Sun, 19 Jul 2026 16:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784477308; cv=none; b=UMOAyVBrjfBmhodKeE0wsZvfV8OylN7cZbYNqtTgJmC8G5zeRmq5bFPhpgLnKP5pe3MkfwmR6q7HutTv0dF6hqyBZeJ/JjXn/7x0a13Kq4f+WIKD7EkSOpHL9k7Q3MSmNZrFFUIHioo65cn4LiPCqUYZVi9A1Ea1dGC7eR9w75g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784477308; c=relaxed/simple;
	bh=mziCgHHnU/wl0EtRGbMHh07Co7AfovVZx/sOCmyHV8w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=INW0MXRLJ9tFTA3npf7tPtRZEVRXuNG8kojtO5h68+bWyCBg6hesFYbhNa2U7g0UtKXXBNiwHZygnHKar2azOqqw/THSxqh1EE/t93mKEHPCIXXOESXS0cCAd+syR86qHXr95RuFVh7Mp61BjnbbsK3KYmEIwe97Obfkvh205EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tt0707+o; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tt0707+o"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4955484387cso4585035e9.1
        for <imx@lists.linux.dev>; Sun, 19 Jul 2026 09:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784477304; x=1785082104; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IN4Hj7JaG8b++jqQRlTsZ8ObY56xxPIUhNKD/QRpNuQ=;
        b=Tt0707+oMNO6JjZptqvEqM70sRwprdFT9NAU8qy1ePouna5fSzNS3RooZp4XkZExV/
         /c6TR88u0VXIIFZvHBkHhC/H2QBaBsCUlfPxsrwQMbjeAU6ypE7r9BYutz4pnPWZM+WU
         2nH6OehXW+PB4t6/5c2MNyF7KHJFi6BGo61sEeuJzFEfp1Ed/pYp8j14zXPriMPAvKVO
         jT/Dq6QM+TagWypn9aa1+9Dvuy5OPi1bDOMlbx8pfxeke2fKTEkxi25udrub+lWO0ter
         kMxgh5lcxbMJ5Rxg474Q/RySkE7fvL4WjCP0oklW2u2m4CKMqEJPd/LnsPt5jH3ttyOP
         pThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784477304; x=1785082104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IN4Hj7JaG8b++jqQRlTsZ8ObY56xxPIUhNKD/QRpNuQ=;
        b=ky0Gg0ijmwGWqS51XRWsCs+u9k2+nF/Oq9KFB83K79WM0Q1VJLTwckJr6w7qzlT4VV
         y34FBaNnUJ6L4uwHI6DQtvemvukUfAsUcXVwhcHV/Hy0xT/EGrSvR8YznRCUTFLOv+wW
         LpTnOF9K1v4FujmGcBKigiMBMOPuG3ksQ82rq8Go74zspuxmClslsehRXGHcYRTNbk7P
         oAV695UAEMsm8Q2R2uMXZc4JT050/lswZ7XRBXKfMfXZYbFH5JnMiAD3u6+ryuj1JUnx
         9koREaGL3ojWHK9C4mAYA3RHcfgq4ARKjnyfReo/gQ5pwQ7TSqyAbaCkDcUX0W0EUWPB
         UGyA==
X-Forwarded-Encrypted: i=1; AHgh+RoSr5kzGnQKnmFEwWi2bFxeVsMu/3XOXXq5HeJzo42lbgeKSNhEhqykbFc9Zyig+U7zPQU=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywag3JmnzfwVsyHMYFIHHnpuD2X4dJlJedd1RVt4PDAuQ+Zabt9
	sCmjTGdm4Zbis1pqZb4xN6bxiylcDgazlKLRKyBdQ7e5RWJpYJTtIgtx
X-Gm-Gg: AfdE7ckb1Kb3gz/yqls+WKWZmHEQaCevB+38FMhQ/48wHoTCnqbKxsqfh6Lx8985/tc
	/8KLx09s/B+UbolAh3wWODGtddGvuSS3pDhBpRfiJw5/9xxYqoAO5GbD7K+aOvuaupQZ0sxSEQi
	vdumVtGiwyULJbYQVy+/FMcNO5u7a0SelORXSs0MkYUx4Vj9bwTUwvArds5gpv2D8FWi6KiX+zG
	0a4OqZBeCXvT2aiaFUTwgEhVqO67T1Ly59L0TuJLVDWNqZPn0v97jqWX342qu+vvMxqsQ8i79xS
	i33m6i7JoOcXxX0IbwcTKSfz+bFu3aEyeRUm/ncfrumVJhNvhmJG/lhD8NekvfHdqn0DNL6S4yP
	v5+8qCqIXYVPWiub0jfWgRMErytarPnPKb1kRiGdAoNbYpivW7STqCYqkeAd0lXouFBdLUJJiZ4
	PFzV9dVWgOgcA/SWz2sQYbUn2T5L3UAa7SH0C+nviumpFLeZqW5c+iQLC3gBFjl2PI8yep12XQ4
	TkuFoYIpcAC+SFYQcnZukHX+0kPZWL8GNSQ/3Y574YFOt5WLYHP8n7Bk/lzO9Sz2/plS1NWn0LX
	CAc/NccbRgkt7P0n0moP
X-Received: by 2002:a05:600c:c097:b0:495:5a91:8027 with SMTP id 5b1f17b1804b1-4955a9182a8mr26079975e9.5.1784477303312;
        Sun, 19 Jul 2026 09:08:23 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-aeaf-bd01-78a0-2a2d-507f-c97c.310.pool.telefonica.de. [2a02:3100:aeaf:bd01:78a0:2a2d:507f:c97c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2edbe4sm223826745e9.12.2026.07.19.09.08.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Jul 2026 09:08:22 -0700 (PDT)
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
Subject: [PATCH 0/4] serial: fix console lifetime bugs on failed bind and removal
Date: Sun, 19 Jul 2026 18:08:08 +0200
Message-Id: <20260719160812.35407-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes serial/tty lifetime bugs found while injecting
allocation failures into the UART bind path. The failures were
reproduced on QEMU's raspi1ap (amba-pl011) and mcimx6ul-evk (imx)
machines.

The first three patches fix shared serial/tty error paths: move
fallible port allocations before console registration, clear state
after failed uart_driver registration, and track whether a live cdev
is registered. The final patch fixes the lifetime of the i.MX driver's
private console-port table on probe failure and removal.

The i.MX probe-failure fix spans patches 1 and 4. Serial core must not
return an error while leaving the console registered, and the i.MX
driver must clear its table entry before the failed probe frees the
port.

With all four patches applied, fail-nth sweeps of the console UART bind
path completed on both machines without a KASAN report or oops. Every
failed bind left the console unregistered, and the i.MX unbind/rebind
reproducer also ran cleanly.

This follows up on the discussion here:
https://lore.kernel.org/r/alyjOGyTd19Obemi@MacBook-Pro-von-Karl

Karl Mehltretter (4):
  serial: core: do fallible allocations before the console can be
    registered
  serial: core: clear freed pointers on uart_register_driver() failure
  tty: don't oops in tty_unregister_device() when no cdev is registered
  serial: imx: clear imx_uart_ports[] entry on probe failure and removal

 drivers/tty/serial/imx.c         |  4 ++++
 drivers/tty/serial/serial_core.c | 33 ++++++++++++++++++-------------
 drivers/tty/tty_io.c             |  6 ++++--
 3 files changed, 27 insertions(+), 16 deletions(-)

-- 
2.53.0
