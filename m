Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043502F2619
	for <imx@lists.linux.dev>; Sun, 26 Apr 2026 21:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777239785; cv=none; b=Wm1bu54EhKBAY2XE/KVVXN+6GXun3GviIv8T1HCebKYHECPmIdh9WkKTedv4oFgXxkFzTRQcggbQGh174Zqu0FqvJcr+xwllOMsgpAljLjJ2kpHP8IwOq9MnQMpgfnMZkMelIHTlALkGDmTTlSCf70jwFJMpfHropZBVpJHez2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777239785; c=relaxed/simple;
	bh=+NDDl6FC/lFcy4ZJCUql720fhof7233AtLZRb2lm4Lk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gjNxrHOCbEYT07UHK3RoGINhLYAUzzc6sYUxXLWOzDM7JJMdlFGq6HGCSzc8Ep2el3kJaOvUgL8JuCnt0i4oV4jJ19ipB0xqzcxyqgBFSwEq5PlknGfrY5R0pUrDBcwM3jTjMg+cfgEJozz0pWaxCPQJnYuYKKN6/E5MzNnsxsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AS3NeuJR; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AS3NeuJR"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso79490415e9.3
        for <imx@lists.linux.dev>; Sun, 26 Apr 2026 14:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777239781; x=1777844581; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pyO/fIf9mlptgfmwEFv0+iVbuqCap8jpTzF1uKuXdKk=;
        b=AS3NeuJRWSS5dQtRtNTyskFjUeUx7Fr6SV3Q/DmLA0lRpG48u8uDrz/6Sb8pl2SmUX
         XjHBlFSpN2n/H4zmq/jCENEoUVMDpz5+XEFnHS+pFnLvPgnMRDc5NV4iaIGeSp+qBW12
         BGXLE1u34XmZJRj5DRPqlQgDJrb9xcvZT6xX37DS1lJgekA8SgYjHMBuw/iRY4d8/O/W
         u/K75t43IrKM1UUhkZ2KDe2ry8qP55eiliyTXgAVLfS+ZzFl3n611tfjWr8MMQKXOCgN
         jrBSfg7PADgvr8IPcYs64L4kLdP+mWdzgzvrGJLnwZvyXuPP4or783duOC7bre7MbsjQ
         yhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777239781; x=1777844581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pyO/fIf9mlptgfmwEFv0+iVbuqCap8jpTzF1uKuXdKk=;
        b=sHC19l78nN4a9/Nl3uy485TzouZ5rX1EciB3pr49Y0x9KGXMtZfr47eTmWfU/Faj12
         z14DLawbK91fBPolxL7ZeA2PKQzEj4ws+LIg16Ta8oJN2cuYQh464LSTPqaFHl+Qs3OH
         3d1a+wmiKvInTcVwtDpBj3tf/c3g2EghPjtiV/1T5FHRt6r98msYWPG6L+96e2hhblTk
         iS7s1XknXeUnTtnd4IivoEcRVx5pZw2yhx5aQO+P3VGw55zRqE9S6bZxgsP90Mo2QrcF
         nx7oGvnV3+O+TfHHgUo0FAHIz+bPfrog2wIBcTCC60AlApzE+4UGmDfzNTo/5Pq0mHlP
         g+vA==
X-Forwarded-Encrypted: i=1; AFNElJ+QNkf2HIBLe5zn98D0SE0LN9JVkQOq/9VhfzJfchnbGq9Yt7SuR6NfKf6trDBqueawsCg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzbcS2KAu7GXxxLLxyACEiuvk37s6hq7G1pHow91V1f4w05k1nq
	z8ii2PNGo+/cl2G21ResC+9HQnedaTHeabvOsakzEHZMco9tE+eUFxRx
X-Gm-Gg: AeBDievsZ79sb2cuGb6DoTgk2jnBcE3GQUNyVhjNx1TzOsqAAtHkow3uAX30cPNIOJE
	qM1RCnsdNcTTPY/bn99BKASh7axbIh1grF+ovBPv9ztslE4uh/ZzeP13UUB/N8yoIGnQM4xB0Fg
	YeTEJnf+pVkSHaROMJVgRbJeAze6t6dyoWzYqvnkr+Qw5y51lZ2eHSkEZf3rwSF+K6rB/UXj0PN
	kRJH9Cz8dD2yqa/q7MMFqLOucvadvduex64dOHqzCfk7aIQH9qhyO5mcdqbW5fHQDGhV7UN+wQA
	G8fmtBeXmr7kNW9ZqkVC4A70bEDIbhpBA8YUBLdprunCPN8GijQpECz6m1oI0cVFPFut+aCJUpn
	1jO/YlYwO5OX1VzWsrQPuON+YejeTIIF4UFiz1zngHo7mPLWkBk7FZHDWQeGt4qZDPma/KnXDC+
	0BPiN3m9/ybc+MdIxykyvarSLMb4kK2A==
X-Received: by 2002:a05:600c:a31a:b0:488:b241:2c5f with SMTP id 5b1f17b1804b1-488fb785b7emr432470225e9.26.1777239781269;
        Sun, 26 Apr 2026 14:43:01 -0700 (PDT)
Received: from fedora-dev ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1cfbf2sm782831725e9.15.2026.04.26.14.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 14:43:00 -0700 (PDT)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>
Subject: [PATCH v2] serial: mxs-auart: replace hardcoded 1 with predefined macro GPIO_LINE_DIRECTION_IN
Date: Mon, 27 Apr 2026 00:42:50 +0300
Message-ID: <20260426214250.781151-1-zlatistiv@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIO_LINE_DIRECTION_* definitions have just recently been exposed to
gpio consumers.h by breaking them out in a separate defs.h file.

Use this to validate the gpio direction instead of the hard-coded literal.

Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
---
Changes since v1:
  - Commit title change
  https://lore.kernel.org/all/26cd0656-ca76-4cb7-9f1e-b8c042a7e2cb@gmail.com/

 drivers/tty/serial/mxs-auart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index 693b491f1e75..697318dbb146 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -1520,7 +1520,7 @@ static int mxs_auart_init_gpios(struct mxs_auart_port *s, struct device *dev)
 
 	for (i = 0; i < UART_GPIO_MAX; i++) {
 		gpiod = mctrl_gpio_to_gpiod(s->gpios, i);
-		if (gpiod && (gpiod_get_direction(gpiod) == 1))
+		if (gpiod && (gpiod_get_direction(gpiod) == GPIO_LINE_DIRECTION_IN))
 			s->gpio_irq[i] = gpiod_to_irq(gpiod);
 		else
 			s->gpio_irq[i] = -EINVAL;
-- 
2.53.0

