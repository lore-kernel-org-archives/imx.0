Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984678615C
	for <imx@lists.linux.dev>; Fri, 24 May 2024 12:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716552773; cv=none; b=eywkjoDTRLbbkOwKE5Ld5b2zdlCvq8QNlM1K303GRebo/mdtL22JgVTmve8S9L/r+9jG+FtTRpvlcUFZzGHxPp3KQBVn2M57t4qCjUIUHgbYGS0XPw4QPSwi+iLZDZ4y7xpRzo/KnTNYq8VVMMthqVQebV6q3EPbDJIuuWEBgN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716552773; c=relaxed/simple;
	bh=NLkcXVJfxaNj+x/ym/nlC1R/VqgX2dj3Yj+vQmBzw2Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FFccVYKaskusKnwnPmv8xtsAeaeIy5Fm4BsCRp+oQgH4JMfOSDZCMt3Tid+wj3d5nzuysJjkozCesCXQHGcRxxjMRYcX/+C+qZLek8lp6a3T2/S3Mh0Swnx2nWqikP9XhbRhPGYEZjNhu9FEKzZW1LqryLVEKd8INsNexgKSo7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=QZ4Pn3eH; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="QZ4Pn3eH"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52232d0e5ceso9187547e87.0
        for <imx@lists.linux.dev>; Fri, 24 May 2024 05:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1716552770; x=1717157570; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z/kQluXbrS5/xKa378gCLMmIP4qg7U9JjmWwPqCAy5U=;
        b=QZ4Pn3eHXUrghWYKsGDAMi4ld8OWjr55oi9vEEeOmss13E+FaPf65rudMw+dQWuMNk
         vYp8wpQT0rWTjGbSkqzpUlOYileNoI05YvUyePJJGYZD4DaOEkBVPn+w/tb3hONnvptT
         tIEB29oBnrOvGr84GF5wRCW+FUV5sDuDC9zV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716552770; x=1717157570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z/kQluXbrS5/xKa378gCLMmIP4qg7U9JjmWwPqCAy5U=;
        b=DMzLxMM4ipy8+BvBmgi6Ju1xSOrx3hSjUweywxoYUKOGzUDak9f9i8wd80FuuWUPZQ
         15G0rRUmIQDH/+7iRvwWBLvLlefIU3VFijScqcaLN7tGGq44LGArBwQCpamipD7BfLRI
         MaZfG2+K0Tu/7CVsgx0BUeD0+yrXSXMBWwRAZxFvCztiE0uPsxJHnnepvbs1LbHfllAm
         CdDgAT8hDm1JEnHveYJm/64CCUtA/IHQzOMCFMgLeGeEidw98tcoU9GYj1HqGFq59R67
         mCjC9hVNoHrEGmjTZyo7whvIJsnW0/nesOwqEHslmz9behDEwkd8wWF3BUxj+bf4jIu8
         a5Bg==
X-Forwarded-Encrypted: i=1; AJvYcCV+/CCMuxlyZsApSkFFGW6WCnFDfHp4y9G1RIml/bPZY66UV56KlbtnLMsHzyg30W0Hlo60CCrQUHCztcMbcO2y6+Rq
X-Gm-Message-State: AOJu0YxuaW1IRWE5a1aGeuh0CtpKE2RvNJWFAOCfmDtfvfHIRrj59v/Z
	LRTWrPmhgO3itIBoSdarNkTM+01dzbSL0u/XYNlS1CJ/fb/Dp0t/R0wigqGlX1Q=
X-Google-Smtp-Source: AGHT+IFDzskSYUTxKkoP6SCgQgAYltT2X4VJOr36ZAkA0ExwWVFTGCSdWPvOlsTH+ENT8Hvd6LU7KA==
X-Received: by 2002:a05:6512:10ca:b0:51c:b73f:950 with SMTP id 2adb3069b0e04-529661f315emr1807735e87.43.1716552769459;
        Fri, 24 May 2024 05:12:49 -0700 (PDT)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52970c3313fsm164559e87.200.2024.05.24.05.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 05:12:49 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] serial: imx: ensure RTS signal is not left active after shutdown
Date: Fri, 24 May 2024 14:12:45 +0200
Message-Id: <20240524121246.1896651-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.40.1.1.g1c60b9335d
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


 drivers/tty/serial/imx.c | 50 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 2eb22594960f..35a47f4ab6ed 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -1551,6 +1551,7 @@ static void imx_uart_shutdown(struct uart_port *port)
 	struct imx_port *sport = (struct imx_port *)port;
 	unsigned long flags;
 	u32 ucr1, ucr2, ucr4, uts;
+	int loops;
 
 	if (sport->dma_is_enabled) {
 		dmaengine_terminate_sync(sport->dma_chan_tx);
@@ -1613,6 +1614,55 @@ static void imx_uart_shutdown(struct uart_port *port)
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
+	if (dev_WARN_ONCE(sport->port.dev, sport->tx_state != OFF,
+			  "unexpected tx_state %d\n", sport->tx_state)) {
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
2.40.1.1.g1c60b9335d

