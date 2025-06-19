Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2441221264
	for <imx@lists.linux.dev>; Thu, 19 Jun 2025 11:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750333591; cv=none; b=foIIGtGn2QSwLnfwTNyo2yxkvBWM8c0RcsUG/D8kbKDFNm0dPNJRE2nsSCG7SKG0dml7BqikVXk9J+KeaKaXtvoBBUZyRRG2FSvy5Qp9D/jKEgUYSPpFcUt7schfNm0yd0jZ3W6Ml6JN5mKmHjcvA4stv9a5744tn4Kg5Yww9PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750333591; c=relaxed/simple;
	bh=HScA7GRkDDV0SgvnPg2WLMl5mlEDg3ku+n1tWxwiFSI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KHNcCqWDz19683ylWXrfqIY5MJLdz1enll37uxZgdL9MBi35P0tcYyLsQ5+U7ZcTtOfhd+9squOPhI6lGYL+pnFjBP0UJsbTyMjRXGVtowkW4vCW7TfcPGvrCyiXiObrdB35RJGyQP52H3SlDgPthcHHhB73sZ3qByVVhvWDdZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PqG1YwiG; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PqG1YwiG"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-234c5b57557so7350395ad.3
        for <imx@lists.linux.dev>; Thu, 19 Jun 2025 04:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750333589; x=1750938389; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8zY5F3UU/0eu+ezWkplimwRrPs6tfR7OLj+CFgWxLMM=;
        b=PqG1YwiGdNSAwA5tHYMDlgcXWVGJilqmiXUuZ2KLarxs6GmDR3uM3invFfnVqS7stn
         nttEJaG3H+cbgK3vqEdvVAvxXlVZg2QZPoq42rkWVRK2hWmV2kk4HEnY8BH1t99A57f5
         M3bB+eS/dE8FWpuURUvgRwQOxo2kTXIPWQ34kBMrt7CQVSIHgnzFAlVxrGMXbS5tTkYh
         5XHCVC6hbquTycEjw4wJBCwjreMh83tPqEvfkRSiJy3B+g4pgdshvwaCZ05eJW0YA6Yq
         29ZhjCC+lKSE/SzcL3/k8EMIPS957U9+sBzOdrhsPd4TZk2WvLQzpdAT4M/fn27GVXKV
         eiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750333589; x=1750938389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8zY5F3UU/0eu+ezWkplimwRrPs6tfR7OLj+CFgWxLMM=;
        b=mpu1906d//uk96SqbfEbTpgdwwE295Iij75SEW+X1syqntm8PnS6BrGkxXUNvpdw8N
         dTsR/NQimtQAbbsmw6dvCDtTlJd61qqQs0T20DOQZS003Npc+pEMHOPKTjbbhrY+pprx
         JD2rd0TB7jGL2/Rnwr5MEWX3eDoEqTRQ57YmXxOxfZVOjLowNlO1cU9bieNiFEUePA3X
         XO6esePuRarJGZz0d1fha9KKJYxTHSXTE+XuRPAhY1Ik9l/A30f3kjSNJa2n1Lkt9v0P
         FHYGZWVp4pAnbwACS9kK4gI8uIKWkfyjkgW1a9txJchZVEDVWvdgQTF6LjN8OKpn1t6f
         Q+OA==
X-Forwarded-Encrypted: i=1; AJvYcCUnDjnehjLspkYtQMkgZGs+U9ed5ftZSP4pOsRmdc8GeN3S2S30PLZVehfmTmqS/zguhFU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzp4V+dFJutatQRcz6+FySDYRAm8+uYHXb95wsEi3qQa+fExA90
	gp9aczrkV6RQ/Mvrh2pPo7XqWeQlQZNBoDQTIQkRzRFSg4LC7sm1DveZ
X-Gm-Gg: ASbGncsw3KRzxsT5Fy5kd9cJaqQ5GYYJKDZFn8X1hP5fUlRhyuDfI1+xX9P9hNrZ2lU
	Ia/ykQwRawcXJaHakShs+cx5fQrIdJ4zn9UBN31xp81gTaJbMXh/Q+nNnBYus0+rAHRTZsGCG8I
	d16NFh6cl8gzE36SO226MRmW3QX9iZTiKNDO5WNpVxcbKzbA20IdiIPzMsPj4IX9bqOXAqf9I2t
	cYPKYqjQHhPmptJF71J7T/qzNKMf/HBYpIOCtm/S+bxu6+HvEP3vb/tV9wAdc7UM89mtvfpGkl6
	F7QByV8jRwoZ69fzD1ypbfHTV+yD7dtxtMwXxXMsvpa1AaMcvVza/d/vkpUM9A45WFP+Vt7kLgO
	2
X-Google-Smtp-Source: AGHT+IEqXJC4DnaLV0/S7qFrQlXQuofYwv0L6qzubFHg7yn/7ZdwZoXIcPaXqkUudCmoUPKjE0YIWA==
X-Received: by 2002:a17:902:dad2:b0:234:9670:cc73 with SMTP id d9443c01a7336-2366b32e583mr333965975ad.5.1750333588935;
        Thu, 19 Jun 2025 04:46:28 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:c1e2:f516:9efb:a31c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a1919sm118782665ad.66.2025.06.19.04.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 04:46:28 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: gregkh@linuxfoundation.org
Cc: shawnguo@kernel.org,
	kernel@pengutronix.de,
	tomasz.mon@camlingroup.com,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] serial: imx: Restore original RXTL for console to fix data loss
Date: Thu, 19 Jun 2025 08:46:17 -0300
Message-Id: <20250619114617.2791939-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 7a637784d517 ("serial: imx: reduce RX interrupt frequency")
introduced a regression on the i.MX6UL EVK board. The issue can be
reproduced with the following steps:

- Open vi on the board.
- Paste a text file (~150 characters).
- Save the file, then repeat the process.
- Compare the sha256sum of the saved files.

The checksums do not match due to missing characters or entire lines.

Fix this by restoring the RXTL value to 1 when the UART is used as a
console.

This ensures timely RX interrupts and reliable data reception in console
mode.

With this change, pasted content is saved correctly, and checksums are
always consistent.

Cc: stable@vger.kernel.org
Fixes: 7a637784d517 ("serial: imx: reduce RX interrupt frequency")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/tty/serial/imx.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index bd02ee898f5d..500dfc009d03 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -235,6 +235,7 @@ struct imx_port {
 	enum imx_tx_state	tx_state;
 	struct hrtimer		trigger_start_tx;
 	struct hrtimer		trigger_stop_tx;
+	unsigned int		rxtl;
 };
 
 struct imx_port_ucrs {
@@ -1339,6 +1340,7 @@ static void imx_uart_clear_rx_errors(struct imx_port *sport)
 
 #define TXTL_DEFAULT 8
 #define RXTL_DEFAULT 8 /* 8 characters or aging timer */
+#define RXTL_CONSOLE_DEFAULT 1
 #define TXTL_DMA 8 /* DMA burst setting */
 #define RXTL_DMA 9 /* DMA burst setting */
 
@@ -1457,7 +1459,7 @@ static void imx_uart_disable_dma(struct imx_port *sport)
 	ucr1 &= ~(UCR1_RXDMAEN | UCR1_TXDMAEN | UCR1_ATDMAEN);
 	imx_uart_writel(sport, ucr1, UCR1);
 
-	imx_uart_setup_ufcr(sport, TXTL_DEFAULT, RXTL_DEFAULT);
+	imx_uart_setup_ufcr(sport, TXTL_DEFAULT, sport->rxtl);
 
 	sport->dma_is_enabled = 0;
 }
@@ -1482,7 +1484,12 @@ static int imx_uart_startup(struct uart_port *port)
 		return retval;
 	}
 
-	imx_uart_setup_ufcr(sport, TXTL_DEFAULT, RXTL_DEFAULT);
+	if (uart_console(&sport->port))
+		sport->rxtl = RXTL_CONSOLE_DEFAULT;
+	else
+		sport->rxtl = RXTL_DEFAULT;
+
+	imx_uart_setup_ufcr(sport, TXTL_DEFAULT, sport->rxtl);
 
 	/* disable the DREN bit (Data Ready interrupt enable) before
 	 * requesting IRQs
@@ -1948,7 +1955,7 @@ static int imx_uart_poll_init(struct uart_port *port)
 	if (retval)
 		clk_disable_unprepare(sport->clk_ipg);
 
-	imx_uart_setup_ufcr(sport, TXTL_DEFAULT, RXTL_DEFAULT);
+	imx_uart_setup_ufcr(sport, TXTL_DEFAULT, sport->rxtl);
 
 	uart_port_lock_irqsave(&sport->port, &flags);
 
@@ -2040,7 +2047,7 @@ static int imx_uart_rs485_config(struct uart_port *port, struct ktermios *termio
 		/* If the receiver trigger is 0, set it to a default value */
 		ufcr = imx_uart_readl(sport, UFCR);
 		if ((ufcr & UFCR_RXTL_MASK) == 0)
-			imx_uart_setup_ufcr(sport, TXTL_DEFAULT, RXTL_DEFAULT);
+			imx_uart_setup_ufcr(sport, TXTL_DEFAULT, sport->rxtl);
 		imx_uart_start_rx(port);
 	}
 
@@ -2302,7 +2309,7 @@ imx_uart_console_setup(struct console *co, char *options)
 	else
 		imx_uart_console_get_options(sport, &baud, &parity, &bits);
 
-	imx_uart_setup_ufcr(sport, TXTL_DEFAULT, RXTL_DEFAULT);
+	imx_uart_setup_ufcr(sport, TXTL_DEFAULT, sport->rxtl);
 
 	retval = uart_set_options(&sport->port, co, baud, parity, bits, flow);
 
-- 
2.34.1

