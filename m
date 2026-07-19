Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EE53ACA7C
	for <imx@lists.linux.dev>; Sun, 19 Jul 2026 16:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784477319; cv=none; b=InFVHtFvnmADGodYxbo5sSL3tgG3iz11QHFBkK24xCIsQTCwzPNenwHnXn9EMHMUAatmaZS6ZrL/kNvDsnL19AMJ2MK4+bgLWcOIFnf4KQPbcVozYwArw3gr87hsYi36pw0BEoFQYqcf6GQf2iakBp5YRBADBAfKj/lcDe0AUFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784477319; c=relaxed/simple;
	bh=8sdnQwIMdO7CwPShC74pX/gtmmBu9zvdCtaHEui32XA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EVIcZECa3yvEZ31GbIZ9V7rT3j2u4wC3S1YOdWIj7GvWI5hHwx3TYNLN9mLHIobU3Z+nhV8IDnekRdRPP2p4lJFWnwXmaVXbbLi4DmsFhX4Xm4BZepZgoTB5coW6pb8aerGa/XMYb4Vl+qSinyyhRkNSxKBX8KaLflcMSVnBtII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pPaUfy16; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pPaUfy16"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49553515a8bso10585645e9.1
        for <imx@lists.linux.dev>; Sun, 19 Jul 2026 09:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784477316; x=1785082116; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/SUAt/6zWUy8VxjfuD7LmHF2gwOSZYdtNqcx/e+ByoY=;
        b=pPaUfy16+JjS3AebPj//PiR0ttJ3L6X2FNmI6FdZcB+WHHHm9Lx3sMIzB7SUez8TI0
         I3pfu8JPJ3Nsb7Qtb60zlYrnefTXraeo7eoi/J8u41Y6O1UexPAJsbjkx7CFu3ky3bbb
         EJuQVPtf5bFzs1/zGeaPiGWQhompnrhIxZQCcaXG7IawSaNBZEsNCFsyDST3WL89M4NV
         KDrj8KrRODOKRX5whwWVRYj2uuvkG/MTmRSWg9wfkpXxgPIjw1pLIqwUIp/qf6W1HahW
         i+VDpyrKuJ7ME/Dlh/mXWCEAE6t3XxmMcGLSqmfkBPB9tpytT7eRWLAzaHWJGSPh0zI5
         T4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784477316; x=1785082116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/SUAt/6zWUy8VxjfuD7LmHF2gwOSZYdtNqcx/e+ByoY=;
        b=rCPPRHWO2onIWTX8hZtb1bfFYXM+kHt5A0fMotVlPy5hQ33iyyKos0L6ZnCVgqmRYw
         MffSSAArcmADX+FN2JOfslGXkdsxdB11d8eD22X+0eNskchJlCw5qEKpJrv0fbZnosti
         +zYYWJaqQixWuw28ZKU3Vv2oQIo4WYveB1H9atJR2f9PIjVs6fEe8fSq6BPSATNUdpDC
         s4LHSY7RWdpBse0gy4bwSw/SHAs58yqVv8M2i3Zxv3qSYplcz8S7CeJfrxdD5v+nwikE
         OzSXnfAHAd517ttoxQg1YzQkILcYVAF1a2okj7+FkkMW9UlmqD2/hhdVgTtnaVLJ2Wpj
         YRhg==
X-Forwarded-Encrypted: i=1; AHgh+RqTbLdJ+2smfTem1zMnqmDJYJaLRPZszLC5FUe4ZyAAtWyWSX2kEHyjoXEw/nzYiyyPelc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyBwOzXvjhXeNbIsYVsQTPd4DFgzRCnYp5ZfefDPbyUfy00F0Yn
	anwK5wB6OYsjxsKlPRLI19YtDBrJySIxhicSG8ctzsNw9KYQkV22DV40
X-Gm-Gg: AfdE7ckx480KMWaHeUXN7ExMsz4OF9Umjx/aPSQEfqwstwjOnYDUhp0Ti/k6EYzfxqA
	AsVr6Q+GPAZVVaQ+8r+BaKTkLI1yyEVdNTR0XpWzLWe+DQ/42lKRfCCW06ynm7AWnN/nW4CfvZl
	ErVZvSTe61LY3W6fkXyjF/9oOGmybIaEOFYhGp1GgSnuJ1znBLhf6sALI3BbLtJEFWGtCnLAjg8
	e/TCv6WE219bXohvao6b+dztHHTYJVceEcDKphosJrExK29ixPakKyos5sC5j7Cjlz2gv3vLgDZ
	Ciu3L0ag7+ythGaHl3KndkkyG6nZz+Xy0PyxkXzLthSOO9vDxLRRhGFJQ+ObXKo42vLED3BXmY+
	udPNoMKdDQIqgP1DTpWzGffI7UIBGhvTECT0MVK83Vx2lNknqkM7RU64Udlyd8Fx6M10/jV2i5M
	h9FIrRykagO6TsoFhgac7D29NuSFRT5OyBQIZ7EwCfaIT3gIgFKcuNkw1ZJgC7dM4SKBrg8jQwq
	BnjoDhCqNdcPG4Cl0FDvSpPxKLlKAa7e+2wc0A9yDQLh48uPMCu00LYKxdIuvWpx5sEzl75MZE3
	+hOv3WdLfA==
X-Received: by 2002:a05:600c:4504:b0:493:eb71:5cc6 with SMTP id 5b1f17b1804b1-4954a40bbc8mr113521195e9.27.1784477315903;
        Sun, 19 Jul 2026 09:08:35 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-aeaf-bd01-78a0-2a2d-507f-c97c.310.pool.telefonica.de. [2a02:3100:aeaf:bd01:78a0:2a2d:507f:c97c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2edbe4sm223826745e9.12.2026.07.19.09.08.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Jul 2026 09:08:35 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 4/4] serial: imx: clear imx_uart_ports[] entry on probe failure and removal
Date: Sun, 19 Jul 2026 18:08:12 +0200
Message-Id: <20260719160812.35407-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260719160812.35407-1-kmehltretter@gmail.com>
References: <20260719160812.35407-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_uart_probe() stores the port in imx_uart_ports[] before calling
uart_add_one_port() because console setup during that call uses the
table. The entry remains set if uart_add_one_port() fails.
imx_uart_remove() also leaves it set after uart_remove_one_port().

sport is devm-allocated, so a failed probe or unbind frees it while
imx_uart_ports[] still points to it. A later sibling probe can register
the shared console with the old preferred index and dereference the
stale entry in imx_uart_console_setup().

Reproduced on qemu's mcimx6ul-evk by unbinding a sibling UART, unbinding
the console UART and rebinding the sibling:

  BUG: KASAN: slab-use-after-free in imx_uart_console_setup+0xd0/0x3d8
  Read of size 4 at addr c49ad9d4 by task init/1
  Call trace:
   ...
   imx_uart_console_setup from try_enable_preferred_console+0x158/0x1f8
   try_enable_preferred_console from register_console+0x1cc/0x80c
   register_console from serial_core_register_port+0xe58/0xeb0
   ...
  Freed by task 1:
   ...
   devres_release_all+0x100/0x18c
   device_unbind_cleanup+0x38/0xdc
   device_release_driver_internal+0x230/0x288
   unbind_store+0x64/0xa8
   ...

The entry must remain visible while uart_add_one_port() and
uart_remove_one_port() run. Clear it when adding the port fails and
after removing the port. Save the line index before removal because the
uart_port is no longer valid afterward.

The probe-failure cleanup relies on the preceding serial-core change
"serial: core: do fallible allocations before the console can be
registered", which ensures that uart_add_one_port() cannot fail after
registering the console. For complete coverage, both changes should be
backported together.

Fixes: dbff4e9ea2e8 ("IMX UART: remove statically initialized tables")
Fixes: 9f322ad064f9 ("imx: serial: handle initialisation failure correctly")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/tty/serial/imx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 251a50c8aa38..617c35772056 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -2637,6 +2637,8 @@ static int imx_uart_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, sport);
 
 	ret = uart_add_one_port(&imx_uart_uart_driver, &sport->port);
+	if (ret)
+		imx_uart_ports[sport->port.line] = NULL;
 
 err_clk:
 	clk_disable_unprepare(sport->clk_ipg);
@@ -2647,8 +2649,10 @@ static int imx_uart_probe(struct platform_device *pdev)
 static void imx_uart_remove(struct platform_device *pdev)
 {
 	struct imx_port *sport = platform_get_drvdata(pdev);
+	unsigned int line = sport->port.line;
 
 	uart_remove_one_port(&imx_uart_uart_driver, &sport->port);
+	imx_uart_ports[line] = NULL;
 }
 
 static void imx_uart_restore_context(struct imx_port *sport)
-- 
2.53.0
