Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4165A189BB4
	for <imx@lists.linux.dev>; Thu,  5 Sep 2024 06:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725517258; cv=none; b=BgeUXFfA1ZjYvhnCyUCkkbEIK2IsIXJfgujq5TcV0n8DYGqdOPpEboKI0y8TvhnkQZU/osK9B0lpOgoBK32bo0uJ26KlYHJpw9oa/eLYynXYDjXXPddnZFlLyNPmTBr+/P2uch5GHWGVU16d2L17sJJLSgIWPGG8ZTb9VCDQ7Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725517258; c=relaxed/simple;
	bh=JhvGWELi5wvqSTr0Gd910OxL4OoPljviiUYpMFLt5og=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UqT5kfzBcMVU+U0EtNctbPOQfwpFztePp25i7I1OUmuAK66WVapllaANwrRfVabBUkx3fcfJq8WJQTfwJBHSHrAUqHT0wEmYg3StOYfqeDThvAP6DTPh1hBkfN8jqxVcfmTSxWDRxkL+1oZoBwOjp4OF+xhCUh9MSTufvq2cnXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lhuPxRxN; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhuPxRxN"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2055f630934so3358165ad.1
        for <imx@lists.linux.dev>; Wed, 04 Sep 2024 23:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725517256; x=1726122056; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dIW9b0DbiNOfgETQSZVCY5M0dVLOvu9t5blHuaZ3mxw=;
        b=lhuPxRxN4d6LUGauvPI4INX+WXnABVnws3xQsTre6Byz41Aec4/M/VC3fDtwBOnsC3
         ZCySFn5o7rKCvX5k6mpv/WDdX0NJXTkLL1nPL22vsgJgO5yao0xGrOwd00QsLGrIyJBj
         nIdL6JlX+dYPnHCvf1WZ7EFbRH63ZoKYaLneaEeiDnBsbYKqU70iOIhCuFBcNs2NOMEe
         rBg9CwMzg12gRhrFPVJ9V2GZgdufygZ3fhzMI7fQBJPPzqA6cijdngt7Wj6OBJYTMiPW
         0bYYyJKdt+cdtcy7wqLDzhu32/xP/qqUqpi3OxKVBVA4WaU3r9L1DVvdRjzg220bDqiK
         e+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725517256; x=1726122056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dIW9b0DbiNOfgETQSZVCY5M0dVLOvu9t5blHuaZ3mxw=;
        b=qvrxJ3h21b4RO5sLaa/+6jStzejSm2SNJIxpvmCpdGVaHeGVvdVR447zASBrPLnXn5
         B57GOfDuAGWdYVCko5uvRHsbTB1xUT24pSsb58ZIjcK2hIYhslcRGsyNXzedQc8j7s6C
         vTbiYclpCSLTfcwKUYWjPObuQB3EX/FAmtZkSOUks9qJ+qo8Hf8m/S1t93lub79EjjAZ
         GMo1vBBs6VCyf5lM6FtgQEcJOjLC+m014vc6DVdmvkSAwO3IKJpCD//2VLHqXO+jkIqQ
         KbRtQ+chCgSy25K8HOEAoWfFGna+keWxb4Om2Bj/kZq+smbRv7kZ9zb4k3mUFQIfbqlO
         nkRg==
X-Forwarded-Encrypted: i=1; AJvYcCUgIwm5zCKXrRawaHZQikgKYENelzDfkJ9IlHeYFMJXeYd2J39I8XpNEClMiDKZSCxKvVw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzD2LTjDhl7dsk9WgKlqjw5k7fEQ+rZDOUJnenJjLckuNc5yXAe
	7JRzLVBscXQpgY2/OhOaoqxWkNRJpsbvZtXi7eTPXtWHQcUtOMJ4
X-Google-Smtp-Source: AGHT+IGdcopTHyYDrtdYj4e9YxhjQ+HLbes+8KdG1xtmG7IQeOs2SgVV5isXHGanimxLTgPHc70gOA==
X-Received: by 2002:a17:903:41ca:b0:206:dc2a:232c with SMTP id d9443c01a7336-206dc2a24c7mr2967445ad.15.1725517256331;
        Wed, 04 Sep 2024 23:20:56 -0700 (PDT)
Received: from lcwang-Precision-3630-Tower.. (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea53161sm22135735ad.212.2024.09.04.23.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 23:20:55 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
To: shawnguo@kernel.org
Cc: festevam@gmail.com,
	imx@lists.linux.dev,
	LiangCheng Wang <zaq14760@gmail.com>
Subject: [PATCH 1/1] drivers: tty: imx: fix flags of rs485 not work properly
Date: Thu,  5 Sep 2024 14:20:43 +0800
Message-Id: <20240905062043.190604-1-zaq14760@gmail.com>
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

