Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C438517B514
	for <imx@lists.linux.dev>; Tue, 25 Jun 2024 18:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719340950; cv=none; b=UfTmortRAWvQnUe1ETwVW34+x+j/hpxEeST3gvx9Tv9QQS1o+rNbxl7Z+P8RJ4zpxGI5OtQFeUPZkH5Y/8yScoGLxDC7BgzOgdb5q28Jwe1rckraqpejqhmdpKg1LVP+NJ/V8/1BJWEJXzUtJB9q7vqZjJYKlBjTM+Xp/sHkW/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719340950; c=relaxed/simple;
	bh=bFf47hFEVUuKOmXsiB4H2YqzJawoxVMdG5DGlAtPhD4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m4h1TAKpNmI+rDyfbQYgiA+NeSpXTUtiVV41xOaHtk1qteNHmgFLdMkwSkHVphq8g3/wTaKu3LHMMVSxkSLJlLTUnf1SUoXjTdxZCrWX3FiaGUMByLD5WG4FSS/CjFUjcQ23hOmgkBd+ITODjBkR6j7FqP7kyXJCSup4PZsg2rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=iWb0K8f8; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="iWb0K8f8"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52cd80e55efso7557449e87.0
        for <imx@lists.linux.dev>; Tue, 25 Jun 2024 11:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1719340946; x=1719945746; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fTRHmcetGLaYy17XrKZXgDqE5GMBbK+wOczjMxAfiWo=;
        b=iWb0K8f8DHrwACt6k+CA6j4CdYVMpggkFquCa0SMeBJgMLKvnimcGQ6ZUxGz5niFgz
         5djhrIBEDIEzMUBFzdWwhy4GCfS0M4nkWBKVymC1Odvis8m8nsizYKwkLRTfbBrgGWYK
         zsI2PA2tM0sD/8T+sNTSIqtjl/29T0yWhVHk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719340946; x=1719945746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTRHmcetGLaYy17XrKZXgDqE5GMBbK+wOczjMxAfiWo=;
        b=agoXhf8DOcF8XSV/ZEmTb6I7HjTr4OMbBLAx1YFwuiL7Sdm9Z9z7KET5ze3rZg5fKa
         TK4vFF0t3uxyADMG4g0IgDU+bqpasdWkG+QTsFYu1NKeKiKbjFFDurQnfdG0UzyUsE7p
         LKRJ1KZndbAzQ137qRE5ff6eZPxbtaYD9C6e2/CzFLjw45kWNTKr/ejdT0jQBjOB65Lx
         2kQQZrVVmFwmfwYDHYxIsal81+OFYJIgOwWV9KbJa4D2hy78zEj2R3yuy17L7z1S3uAA
         vnsgTzS5ME4Jfmzq+3FXHxdzOkMeMhAkhMVfy4lyKkxOs9sLL7eud+E/cPgPZokgjkIn
         SREg==
X-Forwarded-Encrypted: i=1; AJvYcCVHPTy4ZXkMLHZeMAzYZXl3x3q1A5Jr8D2966DHVwFQyUPAkGQDsGeLGXt+iCZL9u7ZeCyO1uZuVmtzTQ65ZIQYwH31
X-Gm-Message-State: AOJu0YweKE5lqgAHE4BI3PD0LcY2rDI7Ilbsaet5DBNW28Aau+vGAt1W
	8FO9ftuvfGVkbWdA5P9wdiSaSIxSStAlpjsELslEvfdFvmKhbajvU516Ojpv9Hc=
X-Google-Smtp-Source: AGHT+IHzd9Y3KJ+ekIIDdL14O7HCRFyG0RNRJ50heb9Bv7+zAcEg6cULMA2lGBbpiJbMQj4at+FLzg==
X-Received: by 2002:ac2:4c41:0:b0:52c:e1cd:39bd with SMTP id 2adb3069b0e04-52ce1cd3a79mr8123147e87.13.1719340944752;
        Tue, 25 Jun 2024 11:42:24 -0700 (PDT)
Received: from localhost (77.33.185.10.dhcp.fibianet.dk. [77.33.185.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7261795c58sm154993866b.118.2024.06.25.11.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 11:42:23 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] serial: imx: ensure RTS signal is not left active after shutdown
Date: Tue, 25 Jun 2024 20:42:05 +0200
Message-ID: <20240625184206.508837-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a process is killed while writing to a /dev/ttymxc* device in RS485
mode, we observe that the RTS signal is left high, thus making it
impossible for other devices to transmit anything.

Moreover, the ->tx_state variable is left in state SEND, which means
that when one next opens the device and configures baud rate etc., the
initialization code in imx_uart_set_termios dutifully ensures the RTS
pin is pulled down, but since ->tx_state is already SEND, the logic in
imx_uart_start_tx() does not in fact pull the pin high before
transmitting, so nothing actually gets on the wire on the other side
of the transceiver. Only when that transmission is allowed to complete
is the state machine then back in a consistent state.

This is completely reproducible by doing something as simple as

  seq 10000 > /dev/ttymxc0

and hitting ctrl-C, and watching with a logic analyzer.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
v2: Use dev_warn() instead of dev_WARN_ONCE().

v1: https://lore.kernel.org/lkml/20240524121246.1896651-1-linux@rasmusvillemoes.dk/

A screen dump from a logic analyzer can be seen at:

  https://ibb.co/xCcP7Jy

This is on an imx8mp board, with /dev/ttymxc0 and /dev/ttymxc2 both
configured for rs485 and connected to each other. I'm writing to
/dev/ttymxc2. This demonstrates both bugs; that RTS is left high when
a write is interrupted, and that a subsequent write actually fails to
have RTS high while TX'ing.

I'm not sure what commit to name as a Fixes:. This certainly happens
on 6.6 and onwards, but I assume the problem exists since the tx_state
machine was introduced in cb1a60923609 (serial: imx: implement rts
delaying for rs485), and possibly even before that.


 drivers/tty/serial/imx.c | 51 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 2eb22594960f..85c240e8c24e 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -1551,6 +1551,7 @@ static void imx_uart_shutdown(struct uart_port *port)
 	struct imx_port *sport = (struct imx_port *)port;
 	unsigned long flags;
 	u32 ucr1, ucr2, ucr4, uts;
+	int loops;
 
 	if (sport->dma_is_enabled) {
 		dmaengine_terminate_sync(sport->dma_chan_tx);
@@ -1613,6 +1614,56 @@ static void imx_uart_shutdown(struct uart_port *port)
 	ucr4 &= ~UCR4_TCEN;
 	imx_uart_writel(sport, ucr4, UCR4);
 
+	/*
+	 * We have to ensure the tx state machine ends up in OFF. This
+	 * is especially important for rs485 where we must not leave
+	 * the RTS signal high, blocking the bus indefinitely.
+	 *
+	 * All interrupts are now disabled, so imx_uart_stop_tx() will
+	 * no longer be called from imx_uart_transmit_buffer(). It may
+	 * still be called via the hrtimers, and if those are in play,
+	 * we have to honour the delays.
+	 */
+	if (sport->tx_state == WAIT_AFTER_RTS || sport->tx_state == SEND)
+		imx_uart_stop_tx(port);
+
+	/*
+	 * In many cases (rs232 mode, or if tx_state was
+	 * WAIT_AFTER_RTS, or if tx_state was SEND and there is no
+	 * delay_rts_after_send), this will have moved directly to
+	 * OFF. In rs485 mode, tx_state might already have been
+	 * WAIT_AFTER_SEND and the hrtimer thus already started, or
+	 * the above imx_uart_stop_tx() call could have started it. In
+	 * those cases, we have to wait for the hrtimer to fire and
+	 * complete the transition to OFF.
+	 */
+	loops = port->rs485.flags & SER_RS485_ENABLED ?
+		port->rs485.delay_rts_after_send : 0;
+	while (sport->tx_state != OFF && loops--) {
+		uart_port_unlock_irqrestore(&sport->port, flags);
+		msleep(1);
+		uart_port_lock_irqsave(&sport->port, &flags);
+	}
+
+	if (sport->tx_state != OFF) {
+		dev_warn(sport->port.dev, "unexpected tx_state %d\n",
+			 sport->tx_state);
+		/*
+		 * This machine may be busted, but ensure the RTS
+		 * signal is inactive in order not to block other
+		 * devices.
+		 */
+		if (port->rs485.flags & SER_RS485_ENABLED) {
+			ucr2 = imx_uart_readl(sport, UCR2);
+			if (port->rs485.flags & SER_RS485_RTS_AFTER_SEND)
+				imx_uart_rts_active(sport, &ucr2);
+			else
+				imx_uart_rts_inactive(sport, &ucr2);
+			imx_uart_writel(sport, ucr2, UCR2);
+		}
+		sport->tx_state = OFF;
+	}
+
 	uart_port_unlock_irqrestore(&sport->port, flags);
 
 	clk_disable_unprepare(sport->clk_per);
-- 
2.45.2

