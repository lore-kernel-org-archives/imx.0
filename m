Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9042F1E49E
	for <imx@lists.linux.dev>; Fri,  6 Sep 2024 02:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725589165; cv=none; b=rLIxjlve9nPiQOUcmxf7b6Js1/F1bPN9OT2l1cufMP9KUIJdKHuBMiM8mgYGHYOV5inIpyZrPoRwSwxaaWmRzzmwkV2me1izfdRnwLuEh37ydE1eA9mEszZ1E+t++7W0HJatXtsHgHoOdYPsvq/mr3nHX6v1S7Ryyjmvzg2T2tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725589165; c=relaxed/simple;
	bh=JhvGWELi5wvqSTr0Gd910OxL4OoPljviiUYpMFLt5og=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=B9ebE75NmRfTqUueWvlnCACkgscRaiBgJPY0FZwxi5+oSLU39PIRPLWnJmDu+R2L+TpwfKhRc4PScUADuOn4IPzxpRH599vJjP0JfS9JNcWACBsa6nKFcKyET1SKhx9jwwo7b4HLp/EwFQx+U3hd06+TS6zuAoIHdt4Yg+bHnMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGFTtj1p; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGFTtj1p"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2d8b68bddeaso1126157a91.1
        for <imx@lists.linux.dev>; Thu, 05 Sep 2024 19:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725589162; x=1726193962; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dIW9b0DbiNOfgETQSZVCY5M0dVLOvu9t5blHuaZ3mxw=;
        b=HGFTtj1pGDrFIHhO85v7/xeUiUITZBoVuzJMGN4uQHNYem5IXPvqQMoDtFiQ9myxQF
         U2xKpKJ55ozTV5OcOwyZNZEfW7C6bC83qQG/6dtaXi85us7x/T0YlVg3RqsUSNVXTRm4
         ATOjrNXyeKL9cVL+XTnhmuSgwVVVbA3nzj940rxrvJdpCdmjfCQQzQUoaMdq5G2qHeOI
         JwJdLtuiSdMXOIeM/bzcq+QyXwDR5T9tOtz2vARCwJ+599oDxo3oH5eoS9wEocHaNtwP
         mn6hOcKCdtePfFrbvQwpFQRWO1FLaABLY3cFMP2Emc2duU52AyOVObDoGvsWcM1wKnKi
         R6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725589162; x=1726193962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dIW9b0DbiNOfgETQSZVCY5M0dVLOvu9t5blHuaZ3mxw=;
        b=rw2EmWbYqX0ilZN4JIAlfHKt5+8B/lx8Xjz+UOLPn0w56UjUH5qllgnBHPWq24cZjG
         v7TiRlnaXF925m4vxuLdgc7I6ADj0rVNTUK7emuILPkG1Sa2eylk5l/Z/mhjuKMVLUEF
         bS6+SWhmm9AvJXp3YfAqIKWZbN8f9+gzKyix3quRwXrBN2suKQXAeuxacIwCW8gxyCIu
         pdPIQFtxa9kfNNYGkgnxIlL9gxqDQkIGb4rWQpY2/smDEuLTOdD96vMZVvNrGw8wwSVw
         U2ss4e0QuEs3BSL5sDGjLjWRo/Sd6lUGUJiEmhg955DHlh+SLh8slpzT1tOawiJb3bBC
         vtIA==
X-Forwarded-Encrypted: i=1; AJvYcCUTcODKiLGrOW5VJdITQ5447irr+V3ab5kNFOS9GgSjTgtYYK8Qxx5Z7t9wMw9tv+oqWlc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3K+YVwL/0AHyxF/fqpVeFEfMq7Gp24yiDCS9CUe3m+X2XWltD
	IFCz1zvy9gAw4PBVQ85tQ0BvCmlTI2du1ThwGUWFU3CxN5jhMP62
X-Google-Smtp-Source: AGHT+IF11BObZmFZ8H/MLIMIJdM/xn6Tn01KO3MpE/ePD6LblTS2fnwlypbI8IaypHv+HDhos0FGkg==
X-Received: by 2002:a17:90b:394d:b0:2d8:8920:771c with SMTP id 98e67ed59e1d1-2dad50c2cc2mr1490538a91.32.1725589161700;
        Thu, 05 Sep 2024 19:19:21 -0700 (PDT)
Received: from lcwang-Precision-3630-Tower.. (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dadc0e3141sm265184a91.54.2024.09.05.19.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 19:19:21 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
To: shawnguo@kernel.org
Cc: s.hauer@pengutronix.de,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	u.kleine-koenig@pengutronix.de,
	cniedermaier@dh-electronics.com,
	l.sanfilippo@kunbus.com,
	linux@rasmusvillemoes.dk,
	stefan.eichenberger@toradex.com,
	tglx@linutronix.de,
	rickaran@axis.com,
	zaq14760@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/1] drivers: tty: imx: fix flags of rs485 not work properly
Date: Fri,  6 Sep 2024 10:19:05 +0800
Message-Id: <20240906021905.197891-1-zaq14760@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rs485.flags are lost in functions such as imx_uart_stop_tx(),
causing the function of RS485 to be invalid when using the
serial port as the RS485 port. Use a variable to store the state to
avoid this issue.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
 drivers/tty/serial/imx.c | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 67d4a72eda77..346bbd21536b 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -209,7 +209,7 @@ struct imx_port {
 	const struct imx_uart_data *devdata;
 
 	struct mctrl_gpios *gpios;
-
+	int flags;
 	/* counter to stop 0xff flood */
 	int idle_counter;
 
@@ -434,7 +434,7 @@ static void imx_uart_stop_tx(struct uart_port *port)
 	imx_uart_writel(sport, ucr4, UCR4);
 
 	/* in rs485 mode disable transmitter */
-	if (port->rs485.flags & SER_RS485_ENABLED) {
+	if (sport->flags & SER_RS485_ENABLED) {
 		if (sport->tx_state == SEND) {
 			sport->tx_state = WAIT_AFTER_SEND;
 
@@ -454,7 +454,7 @@ static void imx_uart_stop_tx(struct uart_port *port)
 			hrtimer_try_to_cancel(&sport->trigger_start_tx);
 
 			ucr2 = imx_uart_readl(sport, UCR2);
-			if (port->rs485.flags & SER_RS485_RTS_AFTER_SEND)
+			if (sport->flags & SER_RS485_RTS_AFTER_SEND)
 				imx_uart_rts_active(sport, &ucr2);
 			else
 				imx_uart_rts_inactive(sport, &ucr2);
@@ -490,8 +490,8 @@ static void imx_uart_stop_rx_with_loopback_ctrl(struct uart_port *port, bool loo
 	imx_uart_writel(sport, ucr4, UCR4);
 
 	/* See SER_RS485_ENABLED/UTS_LOOP comment in imx_uart_probe() */
-	if (port->rs485.flags & SER_RS485_ENABLED &&
-	    port->rs485.flags & SER_RS485_RTS_ON_SEND &&
+	if (sport->flags & SER_RS485_ENABLED &&
+	    sport->flags & SER_RS485_RTS_ON_SEND &&
 	    sport->have_rtscts && !sport->have_rtsgpio && loopback) {
 		uts = imx_uart_readl(sport, imx_uart_uts_reg(sport));
 		uts |= UTS_LOOP;
@@ -604,7 +604,7 @@ static void imx_uart_dma_tx_callback(void *data)
 	if (!kfifo_is_empty(&tport->xmit_fifo) &&
 			!uart_tx_stopped(&sport->port))
 		imx_uart_dma_tx(sport);
-	else if (sport->port.rs485.flags & SER_RS485_ENABLED) {
+	else if (sport->flags & SER_RS485_ENABLED) {
 		u32 ucr4 = imx_uart_readl(sport, UCR4);
 		ucr4 |= UCR4_TCEN;
 		imx_uart_writel(sport, ucr4, UCR4);
@@ -681,10 +681,10 @@ static void imx_uart_start_tx(struct uart_port *port)
 	 * imx_uart_stop_tx(), but tx_state is still SEND.
 	 */
 
-	if (port->rs485.flags & SER_RS485_ENABLED) {
+	if (sport->flags & SER_RS485_ENABLED) {
 		if (sport->tx_state == OFF) {
 			u32 ucr2 = imx_uart_readl(sport, UCR2);
-			if (port->rs485.flags & SER_RS485_RTS_ON_SEND)
+			if (sport->flags & SER_RS485_RTS_ON_SEND)
 				imx_uart_rts_active(sport, &ucr2);
 			else
 				imx_uart_rts_inactive(sport, &ucr2);
@@ -695,7 +695,7 @@ static void imx_uart_start_tx(struct uart_port *port)
 			 * with loopback enabled because that will make our
 			 * transmitted data being just looped to RX.
 			 */
-			if (!(port->rs485.flags & SER_RS485_RX_DURING_TX) &&
+			if (!(sport->flags & SER_RS485_RX_DURING_TX) &&
 			    !port->rs485_rx_during_tx_gpio)
 				imx_uart_stop_rx_with_loopback_ctrl(port, false);
 
@@ -1078,7 +1078,7 @@ static void imx_uart_set_mctrl(struct uart_port *port, unsigned int mctrl)
 	struct imx_port *sport = to_imx_port(port);
 	u32 ucr3, uts;
 
-	if (!(port->rs485.flags & SER_RS485_ENABLED)) {
+	if (!(sport->flags & SER_RS485_ENABLED)) {
 		u32 ucr2;
 
 		/*
@@ -1604,8 +1604,8 @@ static void imx_uart_shutdown(struct uart_port *port)
 	ucr1 &= ~(UCR1_TRDYEN | UCR1_RRDYEN | UCR1_RTSDEN | UCR1_RXDMAEN |
 		  UCR1_ATDMAEN | UCR1_SNDBRK);
 	/* See SER_RS485_ENABLED/UTS_LOOP comment in imx_uart_probe() */
-	if (port->rs485.flags & SER_RS485_ENABLED &&
-	    port->rs485.flags & SER_RS485_RTS_ON_SEND &&
+	if (sport->flags & SER_RS485_ENABLED &&
+	    sport->flags & SER_RS485_RTS_ON_SEND &&
 	    sport->have_rtscts && !sport->have_rtsgpio) {
 		uts = imx_uart_readl(sport, imx_uart_uts_reg(sport));
 		uts |= UTS_LOOP;
@@ -1643,7 +1643,7 @@ static void imx_uart_shutdown(struct uart_port *port)
 	 * those cases, we have to wait for the hrtimer to fire and
 	 * complete the transition to OFF.
 	 */
-	loops = port->rs485.flags & SER_RS485_ENABLED ?
+	loops = sport->flags & SER_RS485_ENABLED ?
 		port->rs485.delay_rts_after_send : 0;
 	while (sport->tx_state != OFF && loops--) {
 		uart_port_unlock_irqrestore(&sport->port, flags);
@@ -1659,9 +1659,9 @@ static void imx_uart_shutdown(struct uart_port *port)
 		 * signal is inactive in order not to block other
 		 * devices.
 		 */
-		if (port->rs485.flags & SER_RS485_ENABLED) {
+		if (sport->flags & SER_RS485_ENABLED) {
 			ucr2 = imx_uart_readl(sport, UCR2);
-			if (port->rs485.flags & SER_RS485_RTS_AFTER_SEND)
+			if (sport->flags & SER_RS485_RTS_AFTER_SEND)
 				imx_uart_rts_active(sport, &ucr2);
 			else
 				imx_uart_rts_inactive(sport, &ucr2);
@@ -1749,13 +1749,13 @@ imx_uart_set_termios(struct uart_port *port, struct ktermios *termios,
 	if (!sport->have_rtscts)
 		termios->c_cflag &= ~CRTSCTS;
 
-	if (port->rs485.flags & SER_RS485_ENABLED) {
+	if (sport->flags & SER_RS485_ENABLED) {
 		/*
 		 * RTS is mandatory for rs485 operation, so keep
 		 * it under manual control and keep transmitter
 		 * disabled.
 		 */
-		if (port->rs485.flags & SER_RS485_RTS_AFTER_SEND)
+		if (sport->flags & SER_RS485_RTS_AFTER_SEND)
 			imx_uart_rts_active(sport, &ucr2);
 		else
 			imx_uart_rts_inactive(sport, &ucr2);
@@ -2394,6 +2394,7 @@ static int imx_uart_probe(struct platform_device *pdev)
 	}
 
 	ret = uart_get_rs485_mode(&sport->port);
+	sport->flags = sport->port.rs485.flags;
 	if (ret)
 		goto err_clk;
 
-- 
2.34.1

