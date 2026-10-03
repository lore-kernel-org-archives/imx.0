Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F61C235BE2
	for <imx@lists.linux.dev>; Sat,  3 Oct 2026 15:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791042634; cv=none; b=ZazdMLF5Id2wTAkIv0dDQb1C56GlUb3Tz5SHW3yfIKdu6x5GbQ9e3LhVnX4pnUp87s0DhBFpv2N7L+vP4qVagJPB7MrOqXEZPSmjLiMzz2HDKLCxBL2WXK2iZK8qqF95KOKiYbMVK49HYix4I5Nik3SQrJ7XNex1DigVxYQiJs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791042634; c=relaxed/simple;
	bh=VCFZL8C7CskzounbxL3E1vIVFsfQTCnNmtrH/w2/R7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rKNkAstFa5zk1Ue24Mdrgp/HFpKCPt3DYxXOTy9qayUoMH52N4V9B31gJVegA0ZZI9yPhIxjmvBxVj5hSbjAQoezuNJMqmuHlh0oJ+eEYduNkFns6+rTSfSCLM/0S5nT3PFFkqAZjGzMKNvoQYqrXEZfjM5KK8dLKsa4cIJRaVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHUE5NQU; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHUE5NQU"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so3848905e9.0
        for <imx@lists.linux.dev>; Sat, 03 Oct 2026 08:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791042630; x=1791647430; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tLpRB5yATHQpX0YPaKzhPzon6/tpk2LiYbV0aGm14kM=;
        b=cHUE5NQUuhkEgLbbJHJvBHikhkjVRRCRdDm4rhQJX1nJzsMUxsONQXFaHpiamVBXVo
         APN0o7NUpi1xG5NNbXYKcy/O753CJnicnz/DRz7Kaf95/F4AGrxeiJAE0w7xh43OUdLG
         Nc9azDQy9l/G6k/TeqklCDNyyfmw9PXXkLGz+ebSBqHzzax6vRY9HgeCDyHHj47fF+Pc
         6B4BLi59U+iRuBmMynsxUMNjJQjQOuN27KcSHkJ81bevb7d5zXPH2V1FCQLuSoL1pRjL
         Sg6AFDwpHFupSYasdJCdZ0rsOsY/lZO077aMecofk3htLDq/ITCocAcYc8j3O4DKn8UT
         Fmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791042630; x=1791647430;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tLpRB5yATHQpX0YPaKzhPzon6/tpk2LiYbV0aGm14kM=;
        b=xPPx/btUZYur6Jv1amKI5qXZC+9uP3wQnlWeeyca0K9n9uTiu4csqhQ91s9adDhjW+
         QtQWWfNt2ipKp+LF4RuNw+L9NzWwmyUeLQ/sw2ZpapVdUqfmNg4dG+d7nBUKY7RyI6T2
         F6OjMQjPbmgnry5N6mVf0OqY+1ncxQ1c/dnvLajuxaObTdRTqUz/9N6wi7UgxkZQhpbj
         cOoYTCml9H6KrxvtwN1wNE3IMcyYvFmJdoIwUhOUqNPJilN4Irj/9F7ZOdsBYm+KehBN
         0lgrEqnjQKdqQFDCOdpnY77Ie6UwsAAjoZaQFpKi2vqrumESLVuBExzxbh3vin+NmqGB
         7HHg==
X-Forwarded-Encrypted: i=1; AKwUvBx60B7hf3d4cX5tdTaM++3U1vJFF0eLvJdumBcDeJBerznk8WOdpFIiWXaTnatgGJI9jxk=@lists.linux.dev
X-Gm-Message-State: AFuF++lhujDBYUdktGOXqVWe6jYS4ydfJmQgn0LkYmrIHELrf1C56m8c
	HjozJgybdAdmlCX9xEF87Tbi160RjnunfZ1pEr6T2QcxmvWNYc0dOdn9
X-Gm-Gg: AYBFou2X+DJcL7BJMsiWJaTetwGb3ZkWURTF8r6JPoiPvazkBrEN/XAFEwDnAr6sulT
	L/5FrdCadxcIPBMXw/e50LQEz8TsJwxshkSDrgyMQ4t/d4+q5pXtBToUuYZ3g9wYAfXnyavVFXh
	EfWfCW+v3ZXSL17iALMAucLSoRZIvOz2WNs4ZiiSI1YO6m656ZadUbw3/vysq7Moo//Ggcxxdo1
	03DbN7UBiuCDaeB/lzqwfNd/Fjz5jIwflt+WoodIqLx+lGY+ePiTE8fBwwhp5eOHyQ7K18w8+aM
	itu/m17iKsmW7ujs9WGjEnPvVrXy8NNlf1KyeyGi5BE3OtbzmoN3Tmhs3dCjUXu3EvkxuZkxwk7
	nmXYQNoDbnWIsQ0m3Ul9q4AyJxpNV/Ddm72TWlKcpeObKUh/LXLTYe3sk9hfn3vPjOgGBNd+2qR
	5KCMmG9gwrKqZqJ0Q6hpfxwQV5KQBrRE6oksT4DHpGzJvqElf/EsUf3liQI2rrct4gqzjxLRZ30
	hXE2tAWP79dn9EQxunFJtyI24dSYDTEWYZP056jtPjOoHAFsRigzd1ben5r8n4I1E5aNMLGdXY/
	Wsq3
X-Received: by 2002:a05:600c:3110:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4a168069b91mr46835855e9.0.1791042630024;
        Sat, 03 Oct 2026 08:50:30 -0700 (PDT)
Received: from lap.lan (xdsl-31-165-251-31.adslplus.ch. [31.165.251.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380fa61csm13483899f8f.17.2026.10.03.08.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 08:50:29 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Loureiro?= <joaofl@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Sherry Sun <sherry.sun@nxp.com>,
	Frank Li <frank.li@nxp.com>,
	Alexander Dahl <ada@thorsis.com>,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Jo=C3=A3o=20Loureiro?= <joaofl@gmail.com>
Subject: [PATCH v2] serial: fsl_lpuart: add support for GPIO-controlled modem lines
Date: Sat,  3 Oct 2026 17:50:22 +0200
Message-ID: <20261003155022.466971-1-joaofl@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

LPUART has no register bit to drive RTS to a chosen level: UARTMODIR only
offers receiver-driven auto-RTS (RXRTSE) and RTS-during-transmit (TXRTSE).
Consequently lpuart_set_mctrl() and lpuart32_set_mctrl() ignore TIOCM_RTS,
and their get_mctrl() counterparts report a hardcoded
TIOCM_CAR | TIOCM_DSR | TIOCM_CTS.

That makes it impossible to talk to a peripheral which is driven by a
software controlled RTS strobe and answers on CTS.  TIOCMBIS/TIOCMBIC
silently do nothing, and because CTS always reads back as asserted, a
userspace handshake that waits for CTS to follow RTS can never complete:
de-asserting RTS and waiting for CTS to drop times out every time.  Boards
that route the two pins to plain GPIOs cannot work around it either, since
the driver never looks at rts-gpios/cts-gpios.

Wire the driver up to the serial_mctrl_gpio helpers, as imx.c and
atmel_serial.c already do.  set_mctrl() forwards the state to
mctrl_gpio_set(), and get_mctrl() runs the flags through mctrl_gpio_get()
so that a described cts-gpios overrides the assumed-asserted default.
Boards without such a description keep the previous behaviour.  Modem
status interrupts are enabled from startup() and disabled from shutdown(),
with a .enable_ms callback for the serial core.

The same limitation was reported for an i.MX 8XLite board that needs RS-485
with a GPIO RTS [1].  This change was developed and tested on an i.MX95
board whose barcode scanner is driven over LPUART with a manual RTS strobe;
with it, RTS toggles as requested and CTS is reported from the real pin.

[1] https://lore.kernel.org/all/20260210-rearview-hungrily-536a95fc3385@thorsis.com/

Signed-off-by: João Loureiro <joaofl@gmail.com>
---

Notes:
    Changes in v2:
    - Resend: v1 (Message-ID <20260819144458.253967-1-joaofl@gmail.com>)
      never reached the mailing lists, so it could not go through CI.
    - Rebased onto tty-next; no functional changes.

 drivers/tty/serial/Kconfig      |  1 +
 drivers/tty/serial/fsl_lpuart.c | 35 +++++++++++++++++++++++++++++++--
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index bf680d22199b..cbf6b44d8a3e 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -1316,6 +1316,7 @@ config SERIAL_FSL_LPUART
 	tristate "Freescale lpuart serial port support"
 	depends on HAS_DMA
 	select SERIAL_CORE
+	select SERIAL_MCTRL_GPIO if GPIOLIB
 	help
 	  Support for the on-chip lpuart on some Freescale SOCs.
 
diff --git a/drivers/tty/serial/fsl_lpuart.c b/drivers/tty/serial/fsl_lpuart.c
index c8575c965203..909253aab212 100644
--- a/drivers/tty/serial/fsl_lpuart.c
+++ b/drivers/tty/serial/fsl_lpuart.c
@@ -27,6 +27,8 @@
 #include <linux/slab.h>
 #include <linux/tty_flip.h>
 
+#include "serial_mctrl_gpio.h"
+
 /* All registers are 8-bit width */
 #define UARTBDH			0x00
 #define UARTBDL			0x01
@@ -291,6 +293,7 @@ struct lpuart_port {
 	bool			is_cs7; /* Set to true when character size is 7 */
 					/* and the parity is enabled		*/
 	bool			dma_idle_int;
+	struct mctrl_gpios	*gpios;
 };
 
 struct lpuart_soc_data {
@@ -1528,6 +1531,7 @@ static int lpuart32_config_rs485(struct uart_port *port, struct ktermios *termio
 
 static unsigned int lpuart_get_mctrl(struct uart_port *port)
 {
+	struct lpuart_port *sport = container_of(port, struct lpuart_port, port);
 	unsigned int mctrl = 0;
 	u8 cr1;
 
@@ -1535,11 +1539,12 @@ static unsigned int lpuart_get_mctrl(struct uart_port *port)
 	if (cr1 & UARTCR1_LOOPS)
 		mctrl |= TIOCM_LOOP;
 
-	return mctrl;
+	return mctrl_gpio_get(sport->gpios, &mctrl);
 }
 
 static unsigned int lpuart32_get_mctrl(struct uart_port *port)
 {
+	struct lpuart_port *sport = container_of(port, struct lpuart_port, port);
 	unsigned int mctrl = TIOCM_CAR | TIOCM_DSR | TIOCM_CTS;
 	u32 ctrl;
 
@@ -1547,11 +1552,13 @@ static unsigned int lpuart32_get_mctrl(struct uart_port *port)
 	if (ctrl & UARTCTRL_LOOPS)
 		mctrl |= TIOCM_LOOP;
 
-	return mctrl;
+	/* A cts-gpio, when present, overrides the assumed-asserted CTS above. */
+	return mctrl_gpio_get(sport->gpios, &mctrl);
 }
 
 static void lpuart_set_mctrl(struct uart_port *port, unsigned int mctrl)
 {
+	struct lpuart_port *sport = container_of(port, struct lpuart_port, port);
 	u8 cr1;
 
 	cr1 = readb(port->membase + UARTCR1);
@@ -1562,10 +1569,13 @@ static void lpuart_set_mctrl(struct uart_port *port, unsigned int mctrl)
 		cr1 |= UARTCR1_LOOPS;
 
 	writeb(cr1, port->membase + UARTCR1);
+
+	mctrl_gpio_set(sport->gpios, mctrl);
 }
 
 static void lpuart32_set_mctrl(struct uart_port *port, unsigned int mctrl)
 {
+	struct lpuart_port *sport = container_of(port, struct lpuart_port, port);
 	u32 ctrl;
 
 	ctrl = lpuart32_read(port, UARTCTRL);
@@ -1576,6 +1586,15 @@ static void lpuart32_set_mctrl(struct uart_port *port, unsigned int mctrl)
 		ctrl |= UARTCTRL_LOOPS;
 
 	lpuart32_write(port, ctrl, UARTCTRL);
+
+	mctrl_gpio_set(sport->gpios, mctrl);
+}
+
+static void lpuart_enable_ms(struct uart_port *port)
+{
+	struct lpuart_port *sport = container_of(port, struct lpuart_port, port);
+
+	mctrl_gpio_enable_ms(sport->gpios);
 }
 
 static void lpuart_break_ctl(struct uart_port *port, int break_state)
@@ -1844,6 +1863,8 @@ static int lpuart_startup(struct uart_port *port)
 	lpuart_request_dma(sport);
 	lpuart_hw_setup(sport);
 
+	mctrl_gpio_enable_ms(sport->gpios);
+
 	return 0;
 }
 
@@ -1915,6 +1936,8 @@ static int lpuart32_startup(struct uart_port *port)
 	lpuart_request_dma(sport);
 	lpuart32_hw_setup(sport);
 
+	mctrl_gpio_enable_ms(sport->gpios);
+
 	return 0;
 }
 
@@ -1956,6 +1979,7 @@ static void lpuart_shutdown(struct uart_port *port)
 
 	uart_port_unlock_irqrestore(port, flags);
 
+	mctrl_gpio_disable_ms_sync(sport->gpios);
 	lpuart_dma_shutdown(sport);
 }
 
@@ -1990,6 +2014,7 @@ static void lpuart32_shutdown(struct uart_port *port)
 
 	uart_port_unlock_irqrestore(port, flags);
 
+	mctrl_gpio_disable_ms_sync(sport->gpios);
 	lpuart_dma_shutdown(sport);
 }
 
@@ -2441,6 +2466,7 @@ static const struct uart_ops lpuart_pops = {
 	.tx_empty	= lpuart_tx_empty,
 	.set_mctrl	= lpuart_set_mctrl,
 	.get_mctrl	= lpuart_get_mctrl,
+	.enable_ms	= lpuart_enable_ms,
 	.stop_tx	= lpuart_stop_tx,
 	.start_tx	= lpuart_start_tx,
 	.stop_rx	= lpuart_stop_rx,
@@ -2466,6 +2492,7 @@ static const struct uart_ops lpuart32_pops = {
 	.tx_empty	= lpuart32_tx_empty,
 	.set_mctrl	= lpuart32_set_mctrl,
 	.get_mctrl	= lpuart32_get_mctrl,
+	.enable_ms	= lpuart_enable_ms,
 	.stop_tx	= lpuart32_stop_tx,
 	.start_tx	= lpuart32_start_tx,
 	.stop_rx	= lpuart32_stop_rx,
@@ -2912,6 +2939,10 @@ static int lpuart_probe(struct platform_device *pdev)
 		sport->port.rs485_config = lpuart_config_rs485;
 	sport->port.rs485_supported = lpuart_rs485_supported;
 
+	sport->gpios = mctrl_gpio_init(&sport->port, 0);
+	if (IS_ERR(sport->gpios))
+		return PTR_ERR(sport->gpios);
+
 	sport->ipg_clk = devm_clk_get(&pdev->dev, "ipg");
 	if (IS_ERR(sport->ipg_clk)) {
 		ret = PTR_ERR(sport->ipg_clk);

base-commit: c44a4925cdac02af781ebfae96df68a7bf3580b0
-- 
2.55.0

