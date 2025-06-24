Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD672C08A5
	for <imx@lists.linux.dev>; Tue, 24 Jun 2025 13:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771669; cv=none; b=JZaoa8Duszin5j3HmQWA+24cvE+vwLvFTF6frd4RPvg+4qAdSB/pOoPkYkvZePrWoiEXmMhXP1jI0joGf35Kl8LJvVFv1Wcqg4pR4smvrrq1VTjpTlmCJIo5bmKktgbBAYTN7vgJiqneBxJTKZNaxsFSB7C9TCevub2HfWvOa+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771669; c=relaxed/simple;
	bh=HmodalnC2cc37/f99i9xU93F6NQ40xsebYW/vO/TJkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NPkJ1QFVd5fGeZYKPx27lnD/R0Upm33de25LR0AV9JwMfBK/2/JM7V/mdQ7iVym+FrH4zPMyA60pyto+kOUFpvyVDZv8i+9t1bhWWQTDk0rCOy9ef7HlP1CFPbFDRu1x306zsLG8T18udhNlIckG8cQHDYUXVgK5EJPf8WgqwAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YwhTB4fm; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YwhTB4fm"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451d3f72391so48824895e9.3
        for <imx@lists.linux.dev>; Tue, 24 Jun 2025 06:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771665; x=1751376465; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DiI79w1IqZcDvQ3MCScJl3XK2y8VhFGw1vt7Lj+7CRE=;
        b=YwhTB4fm1ukvUlhX1QKFLFrCkFhTYzKlKEG/K+UzC919WmVS7m5Mu/f+C/IP+pGbzW
         tRrTI8qeYwlA9ojgUQjd/qAkUEeEQDyNFOOaZRcRg89zQ1WyvTizIW/0NxYPjtRr2oV6
         23NFNxoFcKQK5KkDLI8iQC5v+6LqQfAURdadrjdDeOIt1bjs094H+p25q+MXGFOUwnt6
         W8/rvr/T4F4EnMoP7UNWGkt5D9G22XYBkEua0HTAtYTjccPHuNFlAlxCCLlac77VEa6o
         /WfuPqG10ZrMPwyqdTB6a8cO3fyCjZg9qmtl4xNavKt4FHXQ8UCdUWJdoIGxmDbVSv/h
         erBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771665; x=1751376465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DiI79w1IqZcDvQ3MCScJl3XK2y8VhFGw1vt7Lj+7CRE=;
        b=eE8V5WM1Qp+7za5TAZC2v3CcgTdVhYCNpB7o3LAmFRI95kk0lnXYkqBEAPirlEtgTw
         6d9u7pUMFNsaEfbmhuAZaE163aKz6Q/f99f5JRR5EkVgiEdgPiS1EdzdXnYdqKIK+cRU
         FafziS9bF3s6R6OWF9FxeiTIkolCiJbE7eTYAaR++5tIybODYLfQ668p7vNIzWkXIpTL
         SXMRwqt3gCkw9RKcAZ2DlN9gSnuCBkH45rbbPXQT4WmKpyAu38SQzDnpZvktdn28xYl5
         GBW8vCzf5Yu44iBnS9sShHdYfWN6Sd74fpAs9H4GFhRpDONZLF8h7+rhtQPiBqhC/u0d
         03kA==
X-Forwarded-Encrypted: i=1; AJvYcCULuPcxBsz+eG6B8i4ZmbzuoV7dh3mincHOTw8dm65wYFONVjPIoMAyE7YqSoKqZ/jEi7E=@lists.linux.dev
X-Gm-Message-State: AOJu0YzluPhNZVHz3t8SKaWfAZ7Q6G3ksicJy78hjmh0h9UwVa3JsERY
	8z8bjIFYPvS3aw0jiTu1nLMPHNju29WXycivBm2RKfECBzxGfFhMclVK4JyP9C0m9bauw6D6DBO
	DVzQuQXc=
X-Gm-Gg: ASbGncu7/idVnchGw0fswqf6rmaHdih+ZeL8B0X9Bmp8/8NNgf1YBgLmNr5udUt5H5V
	HTRnyFFKVafKMHrtRb7gtI0FWGmE8WQ634+3U9jOau1yAgECM6As9Nx4KfoajPHLMhdj67DnOHR
	zS4PYHSyF05BBTsqnGwKZmOjh/h4ZSShXE6vlmCgkBr5fGHiWiOnWqvrbwfcSGJyq8RSF2xGdEW
	kf9iYGZowGXWdAj9MGvnbN+0mnOCAO65bEaMy5nQQoBiA15VJ/+sFg2hnJWiNJJFvxogDUKD8N5
	C0nhCIFYlR4j32wAkrYHblAvpQklSPnRzeQ9jG+DCrHoDbdgJsd4Mo0=
X-Google-Smtp-Source: AGHT+IG5KWF0KCkThs6nJ6gal57FkJx7NIEiZyyWqT8Kac/vBWN9gXYyILceeK2lSrSaeIISymjmOg==
X-Received: by 2002:a05:6000:2709:b0:3a4:dc32:6cbb with SMTP id ffacd0b85a97d-3a6d130710emr9619060f8f.31.1750771665372;
        Tue, 24 Jun 2025 06:27:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm152588485e9.1.2025.06.24.06.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:27:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:27:34 +0200
Subject: [PATCH 2/8] gpio: mxc: use lock guards for the generic GPIO chip
 lock
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-rework-v1-2-aea12209d258@linaro.org>
References: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
In-Reply-To: <20250624-gpio-mmio-rework-v1-0-aea12209d258@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3369;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=L9QElStGogw0fz3XtB/b3BDhicIIjajUB8CqB/jaGV4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqfMkiIjVTe0tH1WLgnWonfVy8AhQhRKYcJ31
 wTEBATW7SCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFqnzAAKCRARpy6gFHHX
 cldLD/40hHr9EmEoxhdje0Mr2R2lm8PEsqdf2M4DnyDRT6tAwlnsdqL9jxCd9LnltXjUv8YaQVZ
 XIrsv3kkjxA4P3TYFdyjv+So7dj53stDO4C5FpFtRRdZ3JObzEBRw8oROkRXVpWhupxOgEp3AiZ
 cEf2ROA83kJYU92OvfD6hVf0XmbiHxj8BBKBT6ad/d3S2PFKeR04f3Tafzx78NlSjT4nnpfQGCV
 cqMA/sOeaghF3Y6O0rgEk2gBZxicTADRpyAVp1kaWdFt+w91EcKCFgdREm8N2hAqKoEbuTlgaiN
 1TVhOv9ZDQoF1sssO0rRuAtXymrdk946TUI6VxZ/YKub3fyB3Ve24n927i/pMf6ON3HOXPElNUg
 QdKP8i9nZce8YeDffxblqGqU13hpLoxrBl9JT+XqzYJ5cFUx8ykf0eDd5UHHCmrNbJS6nBgswZG
 PQAdXxTFkOUkda25LTKJpq5zT+u34gTyBUGG+CyxGiy/nwF0H/ZfVnlisyJvfA+GhNe7zpYOlrU
 ptM+8UVlNhzz4mNdJK3vUAVa2Bfg2P5I3Y2HYKOyNgVrMtwoBm5Z/xrkkbOCUWl1VmjYp8AtnAB
 IBck4wL8fYgyCFaqfuhau5035FFG0WZ9xSwqAZQHFZV65uPj/pUKu1wWuklwJcboLvAsMUKMJ3B
 Cdq+ee1OlBEp3nA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Simplify the code by using lock guards for the bgpio_lock.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mxc.c | 50 ++++++++++++++++++++++---------------------------
 1 file changed, 22 insertions(+), 28 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 4af5a2972d12f68909dd87d9396921c80445f87c..1c37168c8d0a657d7f93067d9ac95cfbd821f757 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -7,6 +7,7 @@
 // Authors: Daniel Mack, Juergen Beisert.
 // Copyright (C) 2004-2010 Freescale Semiconductor, Inc. All Rights Reserved.
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/init.h>
@@ -161,7 +162,6 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 {
 	struct irq_chip_generic *gc = irq_data_get_irq_chip_data(d);
 	struct mxc_gpio_port *port = gc->private;
-	unsigned long flags;
 	u32 bit, val;
 	u32 gpio_idx = d->hwirq;
 	int edge;
@@ -200,41 +200,38 @@ static int gpio_set_irq_type(struct irq_data *d, u32 type)
 		return -EINVAL;
 	}
 
-	raw_spin_lock_irqsave(&port->gc.bgpio_lock, flags);
+	scoped_guard(raw_spinlock_irqsave, &port->gc.bgpio_lock) {
+		if (GPIO_EDGE_SEL >= 0) {
+			val = readl(port->base + GPIO_EDGE_SEL);
+			if (edge == GPIO_INT_BOTH_EDGES)
+				writel(val | (1 << gpio_idx),
+				       port->base + GPIO_EDGE_SEL);
+			else
+				writel(val & ~(1 << gpio_idx),
+				       port->base + GPIO_EDGE_SEL);
+		}
 
-	if (GPIO_EDGE_SEL >= 0) {
-		val = readl(port->base + GPIO_EDGE_SEL);
-		if (edge == GPIO_INT_BOTH_EDGES)
-			writel(val | (1 << gpio_idx),
-				port->base + GPIO_EDGE_SEL);
-		else
-			writel(val & ~(1 << gpio_idx),
-				port->base + GPIO_EDGE_SEL);
+		if (edge != GPIO_INT_BOTH_EDGES) {
+			reg += GPIO_ICR1 + ((gpio_idx & 0x10) >> 2); /* lower or upper register */
+			bit = gpio_idx & 0xf;
+			val = readl(reg) & ~(0x3 << (bit << 1));
+			writel(val | (edge << (bit << 1)), reg);
+		}
+
+		writel(1 << gpio_idx, port->base + GPIO_ISR);
+		port->pad_type[gpio_idx] = type;
 	}
 
-	if (edge != GPIO_INT_BOTH_EDGES) {
-		reg += GPIO_ICR1 + ((gpio_idx & 0x10) >> 2); /* lower or upper register */
-		bit = gpio_idx & 0xf;
-		val = readl(reg) & ~(0x3 << (bit << 1));
-		writel(val | (edge << (bit << 1)), reg);
-	}
-
-	writel(1 << gpio_idx, port->base + GPIO_ISR);
-	port->pad_type[gpio_idx] = type;
-
-	raw_spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
-
 	return port->gc.direction_input(&port->gc, gpio_idx);
 }
 
 static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 {
 	void __iomem *reg = port->base;
-	unsigned long flags;
 	u32 bit, val;
 	int edge;
 
-	raw_spin_lock_irqsave(&port->gc.bgpio_lock, flags);
+	guard(raw_spinlock_irqsave)(&port->gc.bgpio_lock);
 
 	reg += GPIO_ICR1 + ((gpio & 0x10) >> 2); /* lower or upper register */
 	bit = gpio & 0xf;
@@ -250,12 +247,9 @@ static void mxc_flip_edge(struct mxc_gpio_port *port, u32 gpio)
 	} else {
 		pr_err("mxc: invalid configuration for GPIO %d: %x\n",
 		       gpio, edge);
-		goto unlock;
+		return;
 	}
 	writel(val | (edge << (bit << 1)), reg);
-
-unlock:
-	raw_spin_unlock_irqrestore(&port->gc.bgpio_lock, flags);
 }
 
 /* handle 32 interrupts in one status register */

-- 
2.48.1

