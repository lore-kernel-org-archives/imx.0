Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E253B5E01
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 22:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781044661; cv=none; b=W3mDTa/x0kjmwuJRfI2KrVcfJJXFCCGLhQ4tjjf/m0cQdHBo3kb6rJIb68t9P+aiOWWHcuJmaLd0lNe57YVKS4NRhM3VBbfKb+YuY1UjGEkS2khqV2d8xAjU5rKjDPji0yi0qWH3JXj9Rg+VBUe84FjKs9lqxMyZa9sUmJk4Txs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781044661; c=relaxed/simple;
	bh=KHFBKElH1lggN2sZB5oI+hYuA6tBhm4+ZNyZCHF4qaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gaoWmtAQjhwK5yN5MU7fmnHWxqGpFirW6wqK/afLwM8V1DpScaAkQG0QXtfUqyVCMC/rhdENoXUucvwn+keJNL3gtnNxiABgkaLNyXtCW9JBYlVJTwSdkD5qdb+9sXZT6Xqv1Z753wH/y/V45iQfUPNYllpoA/8K1laT6LDnbSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZtWZBgtr; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtWZBgtr"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2bf18c30bb2so44092795ad.0
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 15:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781044660; x=1781649460; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Enn6naQw+wLmV0GhfZ0seolUzIj1ObU+9VW8J0DyP44=;
        b=ZtWZBgtrVEsyxUNRZn9UxLDWN4CeND12lRBqeUEF2htfVgzCCUYDcfwWVl9UJXF4Xk
         kfAYsZJ0qHAJl/qLn2MwB7OYIVSyNV6AxHQAvzISbwlC2NxwnLXajBL1jApExaXDi2xX
         zTscUguPlaF7Wf5QopCqU0KBTuh6ED+p1NwRrqFdFosqx5J8tpxudWAIvSqAnUfRT4NA
         cUHJTGYl0eV9MUjb9ADn8nRGTxWIx+tVM7/ZmX1i3ky9AFFlBwrPVpXbbOIHUTsPYENI
         n7l63fcEBPIu/ANSzwv3/Zuqj0JyQhQIudPojIowChyZ4iaqBocVc6RMw1QAVpMR2Tjn
         JMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781044660; x=1781649460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Enn6naQw+wLmV0GhfZ0seolUzIj1ObU+9VW8J0DyP44=;
        b=AWbxiJyjOcpxWDzeUB7kxXJxDB77PySyev2ylYh0z6kBGKAvn1udRrVf+VF2Kn8UFP
         R+U5XgTH+VjT5p+OeMEJ+7K1QqyVrG+d/P+f2fwcjszv+cxWmsVMAoLgB1Sd8J47q3BS
         /gHyUVcZb2Kg2V6vCTrqdEKZMF9fzVa8SwYl00QrcESukufFGMgOhIsx09+oisHAv357
         lGGQpKTqAdIQWADzBIe0hpgs0dSN+5ITiDxQUv7Ki44rNTwLpz+mNp9vMQwEu4VINRcY
         KRJPrt/PlDvCzK4bjXxyTGh9o6186mqTJ4fsgvZteaaTj2v/ESLmAcSWsDl2UXFbD3n7
         wNBg==
X-Forwarded-Encrypted: i=1; AFNElJ9rHH/54Ya1tdHeJ3smidohVICYptPa50Jx7MUonm79Fh1CZ5pW2fQ4oa727HXSbmaiKyg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7sfZeC17GoPZ4jLAysuqRXvOgD0XWN3vKOWrHAOX5gIXR6dOV
	Sgzu69YWXWQ8lbeHcG2IGJ01GV5VYHaRm5CbD0B2RQfUZbjTPGiGHPW3
X-Gm-Gg: Acq92OG48AURroxTX5a9nnww6+/CzuAJp1SoJSFRqbnW/ZU8Hji/GlT640t3F0v4e0r
	2UUIKhpfS2wTCg3PU/7Iej/nbDHzlbEs8OVRk1Norg4JBDCStLcJAcqC6xe2Sie8bDhLo+WEST0
	iyulFvx0RYoXZwYe2HM+Z+md3IrQmF8oZk8w8gtGsoRgusUfWXuCTwshjFY/y4H175mvxldF5ol
	rpQAzj424uzdDK3k7HpZzSbh5k6GxYW+IpesGmguUq89OlOpGPW7Yaa8F/44rQg7Klx6JJYJmmK
	qA/a39rHO0GtNsfvi7t19l4uoF7XJO0o2sBskZXakOqA2ICB6kifc3Lugh0kAKL21c/drVEQBMB
	oAZxFk+Euy89r56hXv9WtglMY3udXJGPy/lv6YQDu68y54r8Vt2EYNDxKLJL2fPKN1E58PgCNFR
	L7nnnDNLXTxfkU3px5EUfJk+BVx6iREPTzX5Ix+lQ0v8m6qERF9Mujfb0hrJL1aIKZcDsZBcZPS
	uuFVsB7ET5i8nuHzFpdQ0sEFd8ankMnhVuNTsDAztF9dQ==
X-Received: by 2002:a17:903:1aef:b0:2c2:7e17:39f6 with SMTP id d9443c01a7336-2c27e173ecfmr119389525ad.36.1781044659986;
        Tue, 09 Jun 2026 15:37:39 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d37esm293750655ad.9.2026.06.09.15.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:37:39 -0700 (PDT)
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
Subject: [PATCHv2 4/4] serial: mxs-auart: fix IRQ registration ordering and manage console clock
Date: Tue,  9 Jun 2026 15:37:17 -0700
Message-ID: <20260609223717.41670-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609223717.41670-1-rosenp@gmail.com>
References: <20260609223717.41670-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the main UART IRQ registration after uart_add_one_port so that
s->port.state and s->port.lock are initialized before the interrupt
handler can run. Mask all UART interrupts before adding the port to
prevent spurious IRQs left by the bootloader.

After probe succeeds, disable the module clock for non-console ports
since startup will re-enable it on port open. For console ports, keep
the clock prepared so auart_console_write() can safely call
clk_enable() from atomic context.

Guard the IRQ handler and get_mctrl with clk_enable/clk_disable since
GPIO IRQs and serial-core status queries can fire while the clock is
disabled for non-console ports.

In remove, disable the clock for console ports to balance the enable
done in probe, preventing a clock leak on unbind.

Assisted-by: opencode:big-pickle
---
 drivers/tty/serial/mxs-auart.c | 49 +++++++++++++++++++++++++++-------
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index 4499e3206e85..e2b656638ab3 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -738,9 +738,13 @@ static u32 mxs_auart_modem_status(struct mxs_auart_port *s, u32 mctrl)
 static u32 mxs_auart_get_mctrl(struct uart_port *u)
 {
 	struct mxs_auart_port *s = to_auart_port(u);
-	u32 stat = mxs_read(s, REG_STAT);
+	u32 stat;
 	u32 mctrl = 0;
 
+	clk_enable(s->clk);
+	stat = mxs_read(s, REG_STAT);
+	clk_disable(s->clk);
+
 	if (stat & AUART_STAT_CTS)
 		mctrl |= TIOCM_CTS;
 
@@ -1079,6 +1083,7 @@ static irqreturn_t mxs_auart_irq_handle(int irq, void *context)
 	struct mxs_auart_port *s = context;
 	u32 mctrl_temp = s->mctrl_prev;
 
+	clk_enable(s->clk);
 	uart_port_lock(&s->port);
 
 	stat = mxs_read(s, REG_STAT);
@@ -1118,6 +1123,7 @@ static irqreturn_t mxs_auart_irq_handle(int irq, void *context)
 	}
 
 	uart_port_unlock(&s->port);
+	clk_disable(s->clk);
 
 	return IRQ_HANDLED;
 }
@@ -1603,10 +1609,6 @@ static int mxs_auart_probe(struct platform_device *pdev)
 	}
 
 	s->port.irq = irq;
-	ret = devm_request_irq(&pdev->dev, irq, mxs_auart_irq_handle, 0,
-			       dev_name(&pdev->dev), s);
-	if (ret)
-		goto out_disable_clk;
 
 	platform_set_drvdata(pdev, s);
 
@@ -1627,9 +1629,28 @@ static int mxs_auart_probe(struct platform_device *pdev)
 
 	mxs_auart_reset_deassert(s);
 
+	/* Mask all UART interrupts to prevent spurious IRQs from bootloader */
+	mxs_write(0, s, REG_INTR);
+
 	ret = uart_add_one_port(&auart_driver, &s->port);
-	if (ret)
-		goto out_free_qpio_irq;
+	if (ret) {
+		auart_port[s->port.line] = NULL;
+		goto out_disable_clk;
+	}
+
+	/*
+	 * Request the main IRQ after uart_add_one_port so that
+	 * s->port.state and s->port.lock are initialized before
+	 * the handler can run in response to a bootloader-left
+	 * interrupt.
+	 */
+	ret = devm_request_irq(&pdev->dev, irq, mxs_auart_irq_handle, 0,
+			       dev_name(&pdev->dev), s);
+	if (ret) {
+		uart_remove_one_port(&auart_driver, &s->port);
+		auart_port[s->port.line] = NULL;
+		goto out_disable_clk;
+	}
 
 	/* ASM9260 don't have version reg */
 	if (is_asm9260_auart(s)) {
@@ -1641,10 +1662,16 @@ static int mxs_auart_probe(struct platform_device *pdev)
 			 (version >> 16) & 0xff, version & 0xffff);
 	}
 
-	return 0;
+	/*
+	 * Disable clock -- startup will re-enable when the port is opened.
+	 * For the console port the clock must stay prepared so that
+	 * auart_console_write() can safely call clk_enable() from
+	 * atomic context.
+	 */
+	if (!uart_console(&s->port))
+		clk_disable_unprepare(s->clk);
 
-out_free_qpio_irq:
-	auart_port[s->port.line] = NULL;
+	return 0;
 
 out_disable_clk:
 	clk_disable_unprepare(s->clk);
@@ -1657,6 +1684,8 @@ static void mxs_auart_remove(struct platform_device *pdev)
 
 	uart_remove_one_port(&auart_driver, &s->port);
 	auart_port[s->port.line] = NULL;
+	if (uart_console(&s->port))
+		clk_disable_unprepare(s->clk);
 }
 
 static struct platform_driver mxs_auart_driver = {
-- 
2.54.0

