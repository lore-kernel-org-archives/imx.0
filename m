Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED153115B8
	for <imx@lists.linux.dev>; Sun, 19 Jul 2026 22:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784499054; cv=none; b=nqK6P2MT8myHO1G7M+tX95GV/BgumPKUDCYhGO9tlGU1nWnw8SuT5eaUsXfLi98WSCzDohGY6adAbZxMG/S6Iw7tVOYWEZ8wVYB6QOUcLYonT9d5v703bpPdNT4LqHWwMOelJVjX4+2nrVpMZe1vF+3S62gNaPnbTdjenYj6jOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784499054; c=relaxed/simple;
	bh=e/TsC2jyQghy+fHjzGFRoV6KHp39YYSJL7Ig0TqCdS4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QfhI+ALLrJcWPI/BCME7mVsZ9HDe2QmU5ibX7ChKb/+xMfKs5lZzLXmGBv1wwhBf9WoVYgp3sx0xz8mrRBUgX0qD3pbchTCG4N6VvH+DYyYrLKDY8rljGPmyM+VljfOvpnWpGxN6JW/qFjraCOc4Js8JJY+PoeOgGz4lh3Mt5os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEcQ7Jqz; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEcQ7Jqz"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so14655745e9.3
        for <imx@lists.linux.dev>; Sun, 19 Jul 2026 15:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784499051; x=1785103851; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3PWe1Y8pYuAa7B+GagSYE8D0P3UeZCJcEkhdzL5G7fY=;
        b=UEcQ7JqzIxUqSPUGA9/wr6BkcP762tVjdeWiv/R35erPZt1Xlk8ZeLlqnH2GnU5BBZ
         jwsNsCymXvkZy+bfFwazbgAdZyT+QotuBvsAvbv6B1/yudofnq2jkYM0TmVTo0VSyy3c
         eV5CKQPlO84exnsxGJsNDpcaCLxwyxisi8N8GoAO/nyYrwQ2qJzy5bJ7qTc66k6NMHtJ
         voMM0JsEzWySAPlcDSD7/P+8RChkDccwc/1cyY9AgcN2OXHIRpEJc4pWZhgCT2tOUJ8U
         kwS7LnUE0XLTn7wDhSuqw1MwtL3yZFwtoGQxmVLpbmYknz/6dl8eYGuhkfmQEhX0SH0i
         B/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784499051; x=1785103851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3PWe1Y8pYuAa7B+GagSYE8D0P3UeZCJcEkhdzL5G7fY=;
        b=YlPnBX8TnB2Wyoq2/vgFTxA/6/Zs4IaKdm67FpbApGc6PNPldBAXlDgV7X4znEg9MQ
         XFarhO/AV0qvQ5EhNeDd7v8VvTN9zHUj6PQxGsnqIJ/DapMC9UMb1wuW6RzeTYnH1iSX
         kB00Vzem1PAgw1LG1K7gCSZZMpr+669yP62/YKa1PdonD/aAu4S5fJo0blLMec84drr3
         eJ8Fids8bThHealX+n/CgDLQ1iobCD6noYlDfbJ3UHaeeuiWIDoXVNB7o3gwOWtgr8pf
         5zvt/j7czv0bhjolId1Dy27K7EMjJgOZMn1/hMMy19snwD+/ijDF7CECs1FVi7u+bGVm
         Eprw==
X-Forwarded-Encrypted: i=1; AHgh+RoVN51PVY9fajYoneF8NLHxEDVnZQUNCp83VhQ+2B4U2NtJCj3TUp2vH/qgnXDUxphaYMA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfSNqQSDPw/OdkgPk/lo1q3rOzxTPKlrH8lovDhCHdpRPDE0qd
	0YktnJL7APbhU1P78+3aJ3CxHt00Gl4cwD8V0xSi9nwu5LW9M0MZ1fqL
X-Gm-Gg: AfdE7cltKunHoP7pN9D2wBIGpDC3IKmNXqNJ/MAazsEAU1MFrMlYszMOs+NrL2UvH2M
	S9wZh0i6djJohBpwJ5ebjjWexqpdb1AsJEZdBgyCbxKOmXHxYFVbqsQxwBvsuapXZJFQ39lqgwY
	JOkjqjFiIeqoyaxy2X3KYsiQP9yBBt9XYA5ZuSXQF3myAlF7bNLbSyJf62APQjMbAn3SNXXEzlF
	4jNXP139EJK9xKtwpDVGce0f2KPVWhEvxckSOds32yVRicFpYQQrQMh+jNzlPJ91l/ZnZnDnJKj
	yAUJiolCnpoZSbPEwqdIWigbG+2HiAyI+0w4LnMDQ7EraRHaWBP+0ScJVMnKQUkkabidOrHRU7a
	T7GFBMcZv3tPbawuEMiUieVInPB1uvPllVUfCdDkGR3bx2HGor0nM23SP6iWX9/+RLkPfkVEUI3
	19ZbTlnqJ+u2hnwwrA2ierpEtTLu97riALZ6tSPegoZQy2HcX/jqPiuJZf+jbaZwL3MITGkoCl6
	NhE7GGr+zJS50epRQmW4GwLPP3eaBY7IQufE8h/PgiY7ByRAhv/PbbrbLUgofImvNeqn3aaMi8o
	NWsfAmEa8bT6StPNomutHb/N/6in7HtnTQo=
X-Received: by 2002:a05:600c:1f93:b0:493:c8c6:4989 with SMTP id 5b1f17b1804b1-4954a3d64d4mr124694595e9.6.1784499050684;
        Sun, 19 Jul 2026 15:10:50 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-aeaf-bd01-78a0-2a2d-507f-c97c.310.pool.telefonica.de. [2a02:3100:aeaf:bd01:78a0:2a2d:507f:c97c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955370d78csm114492445e9.12.2026.07.19.15.10.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Jul 2026 15:10:49 -0700 (PDT)
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
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 4/4] serial: imx: serialize imx_uart_ports[] lifetime
Date: Mon, 20 Jul 2026 00:10:14 +0200
Message-Id: <20260719221014.44354-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260719221014.44354-1-kmehltretter@gmail.com>
References: <20260719221014.44354-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_uart_probe() publishes the port in imx_uart_ports[] before
uart_add_one_port(), because console setup during that call uses the
table. The entry is not cleared if adding the port fails or after
imx_uart_remove() removes it.

The port is devm-allocated, so a failed probe or unbind leaves the table
pointing at freed memory. A later registration of the shared console can
then dereference the stale entry. Reproduced on QEMU's mcimx6ul-evk by
unbinding a sibling UART, unbinding the console UART and rebinding the
sibling:

  BUG: KASAN: slab-use-after-free in imx_uart_console_setup+0xd0/0x3d8

The entry must remain valid until uart_remove_one_port() unregisters the
console. Clearing it afterward without serialization still races a
sibling probe: the sibling can register the shared console using the
dying entry before it is cleared. The next console write then
dereferences NULL.

Use a driver-wide mutex to serialize table publication, port addition
and rollback with port removal and table clearing. Console callbacks
remain lockless because uart_add_one_port() may invoke setup while
probe holds the mutex.

The probe-failure path also relies on "serial: core: do fallible
allocations before the console can be registered", which moves the
uport->name and uport->tty_groups allocations before console
registration. Both changes should be backported together.

Fixes: dbff4e9ea2e8 ("IMX UART: remove statically initialized tables")
Fixes: 9f322ad064f9 ("imx: serial: handle initialisation failure correctly")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260719162850.043B41F000E9@smtp.kernel.org
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/tty/serial/imx.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 251a50c8aa38..def874f9cd00 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -22,6 +22,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/ktime.h>
+#include <linux/mutex.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/rational.h>
 #include <linux/slab.h>
@@ -2080,6 +2081,15 @@ static const struct uart_ops imx_uart_pops = {
 
 static struct imx_port *imx_uart_ports[UART_NR];
 
+/*
+ * Store the port in imx_uart_ports[] before uart_add_one_port() and clear
+ * it only after uart_remove_one_port() returns. Console callbacks in both
+ * calls use the table, so this mutex serializes these sequences between
+ * sibling ports. Callbacks must not take it because uart_add_one_port()
+ * may invoke setup while it is held.
+ */
+static DEFINE_MUTEX(imx_uart_ports_lock);
+
 #if IS_ENABLED(CONFIG_SERIAL_IMX_CONSOLE)
 static void imx_uart_console_putchar(struct uart_port *port, unsigned char ch)
 {
@@ -2632,11 +2642,14 @@ static int imx_uart_probe(struct platform_device *pdev)
 		}
 	}
 
-	imx_uart_ports[sport->port.line] = sport;
-
 	platform_set_drvdata(pdev, sport);
 
+	mutex_lock(&imx_uart_ports_lock);
+	imx_uart_ports[sport->port.line] = sport;
 	ret = uart_add_one_port(&imx_uart_uart_driver, &sport->port);
+	if (ret)
+		imx_uart_ports[sport->port.line] = NULL;
+	mutex_unlock(&imx_uart_ports_lock);
 
 err_clk:
 	clk_disable_unprepare(sport->clk_ipg);
@@ -2647,8 +2660,12 @@ static int imx_uart_probe(struct platform_device *pdev)
 static void imx_uart_remove(struct platform_device *pdev)
 {
 	struct imx_port *sport = platform_get_drvdata(pdev);
+	unsigned int line = sport->port.line;
 
+	mutex_lock(&imx_uart_ports_lock);
 	uart_remove_one_port(&imx_uart_uart_driver, &sport->port);
+	imx_uart_ports[line] = NULL;
+	mutex_unlock(&imx_uart_ports_lock);
 }
 
 static void imx_uart_restore_context(struct imx_port *sport)
-- 
2.53.0
