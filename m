Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD77E391E65
	for <imx@lists.linux.dev>; Thu, 16 Apr 2026 08:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776328385; cv=none; b=te3+MtYDMiO32KhTzZYYPTOybaVFwowfLRRw3YnGUWKyZRfkWbbRFJfjCYuE2EHTVxnh4dFSGo5qahrvQ8+kQJWQlBaY4TOjcpDPxrOR7Y4rwzltX42BhkSesGMRqZrQbIcfaHI5KlOlJXozm+3TzTxuWXkJVPOqZlT+xzR45Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776328385; c=relaxed/simple;
	bh=A1fxQVZSsEx64SGWOmsIpHCEl3H8zC+buug9pDZnkOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xs3p76B9/p6GUumjHBvzqQ3wKI92IShWRMiaFsY9KWAFTHKoAbF3CfcZxKq8AGM9poaA8hn0h86t/zvVYBb4x71ZWCjgMwd9t29ISpUhlIDvsYD8cHTWoQ1S7DnRAl8KyqwUw8gWMjrwD/fAmLLfQxk1fywsLo//Lm2t9g1xOSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JSNxQwRA; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSNxQwRA"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b8efed61so4026415e9.1
        for <imx@lists.linux.dev>; Thu, 16 Apr 2026 01:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776328382; x=1776933182; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A8KwIRBAxcL/Nko4wwgY9WARhqxl2Sh933ZVC+mUoA4=;
        b=JSNxQwRAx/l/fAgcoN7HzZentpAcFODvwOpqwlTAFhtbcLN1ra90XWjiML/J27W6xG
         NgnlrlnXgSExyZSEkSeJ0TrprcdjWauiuRtapYchcolShmC/9pURBlUShymRKf++u/E3
         VF9vXcrfx/gYafVXDx5zmCOsqDbH1aRSlYztWoE4AJ6W7Gz2s0lUIfY2wPQpcRddHxC/
         19FOooayKVKZAk1tZkTPylUwZA6jiCxpco4IuDqDyyeUHKGTQ55LxTnTNd8gbScINdSm
         2dOHYekGJlxDFr63NrOgJV72weGkL8WJN2AGK4fKbBEpBgrIgIVxqv/kmnNhJcTnKPXr
         oVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776328382; x=1776933182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8KwIRBAxcL/Nko4wwgY9WARhqxl2Sh933ZVC+mUoA4=;
        b=cYZ6cBJ9ouaGzGzH4WYLhn4zhM4ZtNbHpwEVJOVQHRy9xxv3bloAE/XMO7WAyf21lw
         jNDVO48MY6EAXp6B80fSfSH6xhrp6mdPq9wzfSxFncZPqDXY36Jd4TBAacDuqW/eUoWu
         zgfamMGhQPnNdejAS/uSj2wPIvpNSwbwvnxrPeMI16KypJYIaj5wq08rMspHruGZq9sj
         s7uinCIol/lSgJlJpN2AxsY7vEojX77MXYJwHAW5+5FcKcFcGLdzN5sNlcOlmI78p7kH
         UOWxl7y31WTBlVXVXMdxpWxtglEcr7xcs3SOwRpPt5nBE6eGmwqdvAaax+PjpX7FKiOZ
         BMKw==
X-Forwarded-Encrypted: i=1; AFNElJ+SyJ720EO5vrPb5DRZT4U9EIVLSAzsn2vhGOgeelaRiqKsT9Zl7GH5qNR5rvOvb3N5MOs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzweYW2eeedqYRor11coMTwpZYyjCzoGp5Jd29dVmluVaju0+fj
	0oStBQgFrKXjeoU9f1cqHRYBFV9d8kabuUzgIusUfYP6ovaZvE7qATlD
X-Gm-Gg: AeBDievR/6VHjx78J25karK0uXzLj9maUjkPtJQCA5KGZZ+yTCoRJTXDXMnvX/LDLY0
	mlYhUXRQUjFd+WUD59taY0lLK1Bh9w5glkTSvlimGvYQp60q/rYmKTrnP/W5UjbFPDWrjt358qw
	CB1pJwQ4xBteLXQsa8vMpOmo75F0yQzYSjkE/49WndaNgErGceh0dIPj6tEzYmn1BFCDh4EYlJd
	aLM6RHevlXHS1XBR+AHJxBbHGA+Fd5pmy0EK7Z2u47YYMG2nQTsnVxBcr7ioQ3Yt5OEerv7VsZ+
	YqxqeZGCOUQk3YKQOi9SP0jX5a/EFgowgNT/hm5zS3I0S8AYZXDFaYAqHEhVAeE86jnJAbt9gFO
	XJQKkP/PTzR/kZOP5y5pgVVOSl6ZVhBgCIELrLi1JU87fXCe+KxOc0o1cfQqmJ0HwT0ceISKoZa
	oZjZZ3aKz7/S8fZk+uThJlxuZ4MNuzNA==
X-Received: by 2002:a05:600c:1549:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-488f4823c3dmr34362705e9.13.1776328382058;
        Thu, 16 Apr 2026 01:33:02 -0700 (PDT)
Received: from fedora-dev ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f5854097sm41107735e9.12.2026.04.16.01.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 01:33:01 -0700 (PDT)
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
Subject: [PATCH] serial: mxs-auart: Compare the return value of gpiod_get_direction against GPIO_LINE_DIRECTION_IN
Date: Thu, 16 Apr 2026 11:32:54 +0300
Message-ID: <20260416083254.1798-1-zlatistiv@gmail.com>
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
 drivers/tty/serial/mxs-auart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index cc65c9fb6446..6c6df4d5c21f 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -1519,7 +1519,7 @@ static int mxs_auart_init_gpios(struct mxs_auart_port *s, struct device *dev)
 
 	for (i = 0; i < UART_GPIO_MAX; i++) {
 		gpiod = mctrl_gpio_to_gpiod(s->gpios, i);
-		if (gpiod && (gpiod_get_direction(gpiod) == 1))
+		if (gpiod && (gpiod_get_direction(gpiod) == GPIO_LINE_DIRECTION_IN))
 			s->gpio_irq[i] = gpiod_to_irq(gpiod);
 		else
 			s->gpio_irq[i] = -EINVAL;
-- 
2.53.0

