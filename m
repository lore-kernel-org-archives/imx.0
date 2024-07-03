Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B969517B40C
	for <imx@lists.linux.dev>; Wed,  3 Jul 2024 11:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720005979; cv=none; b=JviicyyWYS87Arb151RYPWMY+u4Dkd7Jsk+/azkZ9RA6OEi5gQKrgTdY47JhDe/pGKA/ap/IRfM90Mr7YAjRM1CqDrUj/rKbYmpvfnz4aDqQXYzdnvE3Jn79/YLDsE2I7r8Wz8Xkactol91kvvlbv8cGzXD1SjgskqO2TqTzkM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720005979; c=relaxed/simple;
	bh=8JndRnspM5RDjpsWE9ZsbTjXeCN5YcBE71YC4B5qx14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rKBNM5ZmLUfjlOaOHy1AuuB0v/D36OA9GcjHv2+9NBO77nWzDRPSzpLhuc6E2rwrHiqCoLanHwFg/E06TR5AfdRWBqriW7tSOq8pmoQwlFlBAUgB3L2SezuGTSMrA9krnzC3yzQvmRdg3BP+RbBKhhzowkne5oaEOrl7JBaLeA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O7r4A2SJ; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7r4A2SJ"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ebeefb9a7fso58722011fa.0
        for <imx@lists.linux.dev>; Wed, 03 Jul 2024 04:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720005975; x=1720610775; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A+2MqGa7e9k/H+mBR0AcQlM4kYrNvHVCP7g1hxy4Qxw=;
        b=O7r4A2SJEvNWMt+x1FfeUF/MuzdMf0vCqoqV8Mhg0iKd/aL+v4mCtmpQreSylaXm0+
         o86Gfl8qsyTZoWyLcljGWGgeK/xlNWM0BFAiQfcjaJsaw+uI/4a9+xWZDq8mccZRa5RW
         RsadaKxFoOctVllDEHow/q8gV93ZfAlpNJClU/SPpz/vX8+1HqKd7BsWbFlqh7cCvDSf
         5fOHKZCnpWupl0vn6kedI3L2vvThnYP2C00AyQaDiZdgiogDyWJbDyJC++nu3+spPBsW
         IS2562R/4uPlKesjVwjRN5KN7rsPiYEE1od3RZiKhlgNumRlDxL+Kga2h0rCEWnRQ4te
         t19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720005975; x=1720610775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+2MqGa7e9k/H+mBR0AcQlM4kYrNvHVCP7g1hxy4Qxw=;
        b=U697CZLyeg3NVqrPOnmsmJwyj+C59+Ejl/BVnqYgPDY5pqcjT/QxXnyljHaHO3oQFS
         3REEr4Ivl13arPW0CJ5TwFSQJxwBzJB6+zp+AKjleYcOC75in4wE0NFJsBM61jlXuxqe
         9Za181SaAexquXKNsTW+2zSKEL9q0kM9B4G8ltnRLacjlvIPSHvTyyxeb36NWE8h5q05
         bKBX9oz68h0uhoseiIo0mBj20IHdyb65Qd/k8sjfH4VZlS3sqiqibkH0D9IaLxFHl88y
         K4QqbxZ3/GvRLHtEi9fRKxGdyDpgyEHChlosf9dmL1E73Ank62E94trPBO+VvuM2Hvre
         lXJw==
X-Forwarded-Encrypted: i=1; AJvYcCUZb8G+g/eYXY3L/R77BMq8rBD3WKNGYWBgp6nEwCnUzIuOLfJ7tri1lBwQ8TbyuM88BD5FTTN+TS5fHumOhIbKZpxw
X-Gm-Message-State: AOJu0YzZYm3Mo0fDyoHr64eSlIkxYc/G3pe/CiJZ1Gl54nhvINL3La2b
	h2sKEhUZ3KI4vz6PipauaG0LDQvrhwR4jTBsyIDO/BzB2nJ5K3Zg
X-Google-Smtp-Source: AGHT+IEJXFekNY3fsB5tfjE9fQZRtx+cCV4tRGUY0n2mFuccdc2QjvzsFIB813RbvbxYXhi1K/b+xw==
X-Received: by 2002:a2e:2409:0:b0:2ee:4d91:3d88 with SMTP id 38308e7fff4ca-2ee5e39e5e2mr64257721fa.16.1720005974635;
        Wed, 03 Jul 2024 04:26:14 -0700 (PDT)
Received: from eichest-laptop.corp.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af37828sm242351875e9.9.2024.07.03.04.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 04:26:14 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	cniedermaier@dh-electronics.com,
	stefan.eichenberger@toradex.com,
	l.sanfilippo@kunbus.com,
	tglx@linutronix.de,
	rickaran@axis.com,
	francesco.dolcini@toradex.com
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1] serial: imx: only set receiver level if it is zero
Date: Wed,  3 Jul 2024 13:25:40 +0200
Message-ID: <20240703112543.148304-1-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

With commit a81dbd0463ec ("serial: imx: set receiver level before
starting uart") we set the receiver level to its default value. This
caused a regression when using SDMA, where the receiver level is 9
instead of 8 (default). This change will first check if the receiver
level is zero and only then set it to the default. This still avoids the
interrupt storm when the receiver level is zero.

Fixes: a81dbd0463ec ("serial: imx: set receiver level before starting uart")
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/tty/serial/imx.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index f4f40c9373c2f..e22be8f45c93e 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -120,6 +120,7 @@
 #define UCR4_OREN	(1<<1)	/* Receiver overrun interrupt enable */
 #define UCR4_DREN	(1<<0)	/* Recv data ready interrupt enable */
 #define UFCR_RXTL_SHF	0	/* Receiver trigger level shift */
+#define UFCR_RXTL_MASK	0x3F	/* Receiver trigger 6 bits wide */
 #define UFCR_DCEDTE	(1<<6)	/* DCE/DTE mode select */
 #define UFCR_RFDIV	(7<<7)	/* Reference freq divider mask */
 #define UFCR_RFDIV_REG(x)	(((x) < 7 ? 6 - (x) : 6) << 7)
@@ -1933,7 +1934,7 @@ static int imx_uart_rs485_config(struct uart_port *port, struct ktermios *termio
 				 struct serial_rs485 *rs485conf)
 {
 	struct imx_port *sport = (struct imx_port *)port;
-	u32 ucr2;
+	u32 ucr2, ufcr;
 
 	if (rs485conf->flags & SER_RS485_ENABLED) {
 		/* Enable receiver if low-active RTS signal is requested */
@@ -1953,7 +1954,10 @@ static int imx_uart_rs485_config(struct uart_port *port, struct ktermios *termio
 	/* Make sure Rx is enabled in case Tx is active with Rx disabled */
 	if (!(rs485conf->flags & SER_RS485_ENABLED) ||
 	    rs485conf->flags & SER_RS485_RX_DURING_TX) {
-		imx_uart_setup_ufcr(sport, TXTL_DEFAULT, RXTL_DEFAULT);
+		/* If the receiver trigger is 0, set it to a default value */
+		ufcr = imx_uart_readl(sport, UFCR);
+		if ((ufcr & UFCR_RXTL_MASK) == 0)
+			imx_uart_setup_ufcr(sport, TXTL_DEFAULT, RXTL_DEFAULT);
 		imx_uart_start_rx(port);
 	}
 
-- 
2.43.0

