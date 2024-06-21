Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7B779B96
	for <imx@lists.linux.dev>; Fri, 21 Jun 2024 15:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718984329; cv=none; b=As9vrCoEqjpioipVipqNjHmW0kD30O2CGhW35LTsw7TpNyS5FY+Uc04o++fUAO2qyku9wbAeh15U9/cByqcIfXgtusHydwfit136KFMGS6tEiz52P9wHSwznXlC/FYbuuKF5vhQMQdbosWaLbwu7ZbUsHetTEE7UNbCR4ABfC4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718984329; c=relaxed/simple;
	bh=kCl/MMZVsBt2uE6AgyIV3XMIFogLKH0WHMvLYmRV4mA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PCFZUqNL/g4aK0iI1hhjcr1R01e9T/W5xEdkqAxPY1UctuH9oB/1wEQkC28eJK2oXg0zlH3DCtcSw+eQt7Vb+mWRsbGK3/1x7sb0xUKej/qieXWQk/PMtEUEqBMxkGqP6PM1gAegxERhmxTEGzu3n65M5SweAxeXiNMhXj27OAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lYyGukFC; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lYyGukFC"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-421757d217aso24079715e9.3
        for <imx@lists.linux.dev>; Fri, 21 Jun 2024 08:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718984326; x=1719589126; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oOPm3vCa0hebn5PQU85PCCbT9jGBNVDgsMo+2JVto90=;
        b=lYyGukFCYCCTkgR9P35hacVFWTUo1NK5QElR2J4PBWdNGD5/nPcaBJ+wrIg9ThBEwJ
         tsmDrw3H602JahbmcqOj+gtoH3stCvFuo5bNEiorH0278Qi3lfOpeh0HjyT8Q3zNIdNg
         2ciPdYhqCiqLpb+VZOenWdzA8Kg6cElkuzgpmbkjsJOaG/diYM7/D9AzQktGCnzTSNAw
         NzdEwcSD5b8dnmiNZPBmvSs6fQvfOM0lPltEMaeK6lQ+FkizSEwUsLA6wYS30WjWSQRv
         pAmPo16IeuPItYprbQF13Q+cldhNi8kq/QzWNqbxZoWV1m0vNZAMyFGQLqFfe/8Tt0ZM
         0P1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718984326; x=1719589126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOPm3vCa0hebn5PQU85PCCbT9jGBNVDgsMo+2JVto90=;
        b=GRNgFLZIwBZN3uBv1QM2wlTu+RTuBVB/mcnj0ryr+8IwrXa7swHZk0w2Z2Y4Z5plNm
         cGCiq1hqHB0PwYssQWGc5h/SJ6h+1k63/WpoUhiHwS5QxuMRb7DT/WYD/LiY5lmtDfqP
         Z8JAmRcu5nV8aRJhXJMPDaV+zWpEim4lMCUxydpafnBNxNhnT2xEbqrlvV++vR1hjaUR
         DAi5Dg/WMnATZr7zqipYA9L5HLu6WIo6zkj0792KAROO3g2l23vGl6lhVoixKo0l1KlO
         DAD+x3F5GfLmnDMplqJt6rP30be2Jw9sy3QnhK0Y8AeVO+iOfd7b4nrUDVpx8poZCBtP
         ylZA==
X-Forwarded-Encrypted: i=1; AJvYcCW+aI6tXZEZAFWzF/p/sNwiBsjUJP9zHgVxmwMO6HPEQ13vUrBmc0vPr+5NjOrXv82nMDR57sipVlHtAW0TYPd5DeUz
X-Gm-Message-State: AOJu0YyEfCGbonVs+/znSQdN3tr3cMe2xgRWnQJ9ozab4cpIX5cetqMW
	ZMVBTn+F025VbYGnZQByoFzkD0pnZFwKfAfvoyc8nuVBdQAHkQga
X-Google-Smtp-Source: AGHT+IHuPmxHPN0gA69T7fWEolN/fR1P/BeIEUc2ajvI/YlolQuTbQvkvhMs5isoyekjPRiuDRSXow==
X-Received: by 2002:a05:600c:314a:b0:424:82eb:7270 with SMTP id 5b1f17b1804b1-42482eb739dmr22422585e9.32.1718984325542;
        Fri, 21 Jun 2024 08:38:45 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:b162:502a:9bd1:4c8b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d21226asm69793115e9.47.2024.06.21.08.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 08:38:45 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	l.sanfilippo@kunbus.com,
	cniedermaier@dh-electronics.com,
	john.ogness@linutronix.de,
	esben@geanix.com,
	rickaran@axis.com,
	tglx@linutronix.de,
	stefan@agner.ch,
	francesco.dolcini@toradex.com
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v1] serial: imx: set receiver level before starting uart
Date: Fri, 21 Jun 2024 17:37:49 +0200
Message-ID: <20240621153829.183780-1-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Set the receiver level to something > 0 before calling imx_uart_start_rx
in rs485_config. This is necessary to avoid an interrupt storm that
might prevent the system from booting. This was seen on an i.MX7 device
when the rs485-rts-active-low property was active in the device tree.

Fixes: 6d215f83e5fc ("serial: imx: warn user when using unsupported configuration")
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/tty/serial/imx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 2eb22594960f3..f4f40c9373c2f 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -1952,8 +1952,10 @@ static int imx_uart_rs485_config(struct uart_port *port, struct ktermios *termio
 
 	/* Make sure Rx is enabled in case Tx is active with Rx disabled */
 	if (!(rs485conf->flags & SER_RS485_ENABLED) ||
-	    rs485conf->flags & SER_RS485_RX_DURING_TX)
+	    rs485conf->flags & SER_RS485_RX_DURING_TX) {
+		imx_uart_setup_ufcr(sport, TXTL_DEFAULT, RXTL_DEFAULT);
 		imx_uart_start_rx(port);
+	}
 
 	return 0;
 }
-- 
2.43.0

