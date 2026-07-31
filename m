Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0915F3B0AE8
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 18:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785521126; cv=none; b=frRuFVOhJjYbrQhnNB8MOiVEhUiIag5vctLBnBK2o29TS9YOMM/tM4OVSO02ENEvUQkSiG12Zej/HYVOn7rzxx+DfRDrKV8G4mzOLgfhyQ63Xg4TtXsmrWH3ScMT4uD1zijE/jiPqS8T7ZxmPcMU06zzSF4PyZ+NhD+k1AVysAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785521126; c=relaxed/simple;
	bh=PsKOHHQKdkTPVr5CbgWuTRjCZmIzAuWQ/T5zBgCOXzw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fT1vb8+Y+WdsFJ79UCErt68y1Hz4pXI1qrZhvG4M76tKQ9itzuNDYr7hXJDkqYN4B/pcA870WEyClLwLaVALeaqRbE3FPm4fWAIibVg3/M0rEtP7mo5Fb01G8hcZjFpB3cGZxc6VznyUgj8KOrJtN+s9RfAEMDQsHb8HVWsvXOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtRT1e+u; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtRT1e+u"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4720f3bf164so1512990f8f.1
        for <imx@lists.linux.dev>; Fri, 31 Jul 2026 11:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785521123; x=1786125923; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6m+8w0QVgGm8urXe/cU07WfU5xAZ+QJVFPsiFH0egMo=;
        b=mtRT1e+ueQ//fyzqWvEWK9lXuElpQ7MpoexvMSLhNEk+XyILt7fCI7apM7Czhsqgei
         kUqknAC8UHhl+xOrjVp0VgZajDZqh3+mg0eWeuMA5OmnNItzFJ/bgDwLvEKExT77iTXu
         Hqbu2cVd2i+KwHZK1PK9t0wjdIn6BwwWpa8/4Up1kf+jLI+grT1hZ3lOA4llD6cLRd8H
         wTZbI3E9DJAzl9nzZ7ypo+sL1OXZrmCtG2s7AGWkPpVb1iFSq4vOgMgJ6pDLV+2qaKt/
         BYKBsBbcF92WNf6eGRMuGuMyWR0NUVvXnb4Vc8+MglJ4Cf0DhIeNndmofSy04kupMNtk
         fVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785521123; x=1786125923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6m+8w0QVgGm8urXe/cU07WfU5xAZ+QJVFPsiFH0egMo=;
        b=TO7wnOyaHdGnXKMRFcR2NnJ7qne9TKuvIKx+vRVW6Ao372dXA4+Ev10QKmwA0Yu1Pe
         lJtHXOa931aLN0vDqVv7H9M7mWBgx2qK/rvOGC6yZNtUNZexBBlp6HkOvc2JXM2K7Vz1
         Nl0zFR1HFGYnibkmH4qLKx+mdLgVGW96rxICnuZg9VZp7hpGgfoeBE4fZCG92DXKrCZT
         Sp4P8OY87ZNpJ5j9zmiUXnbo/ZIojzV0YmQCbkZvaW/aSoIEGMnrF1jAdFReCCANhpnP
         gEDKEsu8DNZeAI8zdfNZTp5SSLMW2bxPGwOsoJ046GvkpT+YvRqp6G3mNklGroOHdzP1
         YBIw==
X-Forwarded-Encrypted: i=1; AHgh+Ro76lxHGVwI4EL7CCke1HWmaWI16pGvkfhdaE3G1S3mprZuzLHGSkluSo5dohux4aoUjmU=@lists.linux.dev
X-Gm-Message-State: AOJu0YypXfxd56ZgE2xHFLiuvpnPrQl0qlffeEP6zbqQ4pfqNDdbK1aU
	HWvJ+4ihJsWICU3W6FQZX7hOKylX7FkEQz9hEmfbO/yDbmK7in+3VV2U
X-Gm-Gg: AR+sD109N/xqp3xYKF95Fd6OhIbsorTBJHtJqMM8GELFA2njnB6Z8RGHMnraTQ9CVTK
	Jgr2xWY4O8ZMwYRvStwLaqJ9RtrQWnUmvUQXX4s+9np9QQtMDefVWECYo0VOIeJlBD8g8FwwRds
	Uohb0p0n9LPlQdUG4pxgtFdN6kg/Macv0lZEGj8D6YTMIsCT0q38A3lYXkjPQMlXq0f3KxHF5M6
	l6+pM42Y97kcIGNLIXBLLueD2PAI7oGE2UBTl4VxBl0QfOj4ikVIT0L23HH82ksoVZ5xWRrn1VH
	4rwOLu4wYRDws8weiJheN2HcdPIRAAtu0JrA1mgx9taj+1hu391w1lHtaUyGzdc1FVj+8MjlOqh
	esWbuPmw7XvflZYjFr8HpItii96WyKC5cm3R6iPvZR1kvs78HPLZRZ/oPCF8yP43XgfCtRboZ0W
	16RfAsoH0Fl0Z5gWdVGHio1hZ/4y4G8C7nE9TwlqTATYx1qKVUEbtHhePUScEK/eOD1H+0DMehZ
	cZQ2WWqReobBtIKBtaxD+JLDADGEuEys9DukVjGqBpGGy0Q0x2iGg6eVL5S1u1ohg11Q60EL43H
	58gnjE7X0KLcVj4VSPwfl4DW6IsG3GYytTMCUM9vGGf/VlsPfonyOJhWCg0KyB/peNso
X-Received: by 2002:a05:6000:310f:b0:47f:775b:f5dc with SMTP id ffacd0b85a97d-47fd32e1c76mr5907524f8f.19.1785521123140;
        Fri, 31 Jul 2026 11:05:23 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8d0-bc01-6d31-3d12-3a11-d2d0.310.pool.telefonica.de. [2a02:3100:a8d0:bc01:6d31:3d12:3a11:d2d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6besm7094559f8f.22.2026.07.31.11.05.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 31 Jul 2026 11:05:22 -0700 (PDT)
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
Subject: [PATCH v3 5/5] serial: imx: serialize imx_uart_ports[] lifetime
Date: Fri, 31 Jul 2026 20:05:19 +0200
Message-Id: <20260731180519.10988-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_uart_probe() publishes its devm-allocated port in imx_uart_ports[]
before uart_add_one_port() because console setup uses the table. The entry
is not cleared when adding the port fails or after removal, leaving a
dangling pointer.

A sibling probe can register the shared console through that stale entry.
This was reproduced under KASAN on QEMU mcimx6ul-evk by unbinding a
sibling UART, unbinding the console UART and rebinding the sibling.

Keep the entry valid through uart_remove_one_port(), then clear it. Protect
port addition and removal together with their table updates so sibling
operations cannot interleave. Reject an occupied slot rather than
clobbering an active port during a duplicate-line probe.

Fixes: dbff4e9ea2e8 ("IMX UART: remove statically initialized tables")
Fixes: 9f322ad064f9 ("imx: serial: handle initialisation failure correctly")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260719162850.043B41F000E9@smtp.kernel.org
Link: https://lore.kernel.org/all/20260719222501.CB4CB1F000E9@smtp.kernel.org
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Backport note: the removal fix is self-contained. Complete probe-failure
coverage also requires patch 1. With patch 1, all fallible allocations
precede console registration, so rollback can safely clear the table.
Without it, a late allocation failure (only reachable with fault
injection) can leave the console registered after imx_uart_ports[] is
cleared, turning the pre-existing use-after-free into a NULL
dereference.

 drivers/tty/serial/imx.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 251a50c8aa38..b0f34a6e7d4f 100644
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
@@ -2080,6 +2081,9 @@ static const struct uart_ops imx_uart_pops = {
 
 static struct imx_port *imx_uart_ports[UART_NR];
 
+/* Held across uart_add/remove_one_port(); console callbacks must not take it. */
+static DEFINE_MUTEX(imx_uart_ports_lock);
+
 #if IS_ENABLED(CONFIG_SERIAL_IMX_CONSOLE)
 static void imx_uart_console_putchar(struct uart_port *port, unsigned char ch)
 {
@@ -2632,11 +2636,19 @@ static int imx_uart_probe(struct platform_device *pdev)
 		}
 	}
 
-	imx_uart_ports[sport->port.line] = sport;
-
 	platform_set_drvdata(pdev, sport);
 
-	ret = uart_add_one_port(&imx_uart_uart_driver, &sport->port);
+	scoped_guard(mutex, &imx_uart_ports_lock) {
+		if (imx_uart_ports[sport->port.line]) {
+			ret = -EBUSY;
+		} else {
+			imx_uart_ports[sport->port.line] = sport;
+			ret = uart_add_one_port(&imx_uart_uart_driver,
+						&sport->port);
+			if (ret)
+				imx_uart_ports[sport->port.line] = NULL;
+		}
+	}
 
 err_clk:
 	clk_disable_unprepare(sport->clk_ipg);
@@ -2648,7 +2660,9 @@ static void imx_uart_remove(struct platform_device *pdev)
 {
 	struct imx_port *sport = platform_get_drvdata(pdev);
 
+	guard(mutex)(&imx_uart_ports_lock);
 	uart_remove_one_port(&imx_uart_uart_driver, &sport->port);
+	imx_uart_ports[sport->port.line] = NULL;
 }
 
 static void imx_uart_restore_context(struct imx_port *sport)
-- 
2.53.0
