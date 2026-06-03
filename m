Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCEB3DEFF7
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 02:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780455563; cv=none; b=jPcsUKZxt7PqNnFmXi33S5oqHEPyt9Q3wgXGnFPQNq7zdOu2etksYL+/jv2yDwU6VSiLGLdHLirXqv9OzK6l4s410icLMQTC4Ncmj6f+RsCIR7VDSKyUKGLm6VNtMwNVaMUHaF5rKgGj0XClYAAd9uYkOGyxVde4g9TSM1XgFgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780455563; c=relaxed/simple;
	bh=FvzXCTxllUlReWFN1nSFe7p5Rlpa73XzrCT7b2L5aBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ivhk4+1VNhGMqoiQMav+Cqkb4crM5/eScL2BoNa2K453fxP3flaVtzdofQmznDq3PXS1PwaxFw+PleHFuCawBeOSj6AMJeLq0UaivWEdhzO/DMCeIXvAF8N34mRQ00TU8SoyvUSmVWh/F6nTSBmhn3eA+BpOOsmhOtI/IOfwKSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eymbsYDV; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eymbsYDV"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c0c20f0c0aso22458635ad.0
        for <imx@lists.linux.dev>; Tue, 02 Jun 2026 19:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780455559; x=1781060359; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQM8/bXLwnHI0Nwp6B/mbCtcMHwqmZBefz4Rf3Ov6Bg=;
        b=eymbsYDVJ9BVKxH6wWBFG+AbQel9vL10l/koICQg6kAJH85NQcFo0ymf626YR6Or/k
         +kR1y9Y+DMpbElx4FUQTMxgBGj0XmxKjKvmM0LYvcXko7CAx36QFNGrFvgybKsp4dZtu
         eGua5VwJ5qRV/bxAQc6DyohKZFpAGzFqdPiBourwVWE7h//pZXzOgV7pS6ehkMTPpMj+
         zvAldfY6PDdrfr/rLzcWCWjNbkFxQ2/jm/2T5TdGKpygf0kbk3/iF4AiVpn7lNpoj2yW
         29+CqthykRF9gJ+gDo4/DaqGPevCr1mP1FIe0fbuAHLrD3chF7ocSTA3pbIBoXol8CNt
         gUfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780455559; x=1781060359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CQM8/bXLwnHI0Nwp6B/mbCtcMHwqmZBefz4Rf3Ov6Bg=;
        b=ctbFY2lHgey6TFgEl47yc30Cwj642/dy5DOZNVJ6d3yVaxTVyvPlDu2MnDyPU4iL33
         wkb8Uf0k5/EWDIlxHM9YWP59FxoXX9oT/BSvmeM+drS2TnHfgSa5AHrMzHIFN0V4tI7w
         NLGJMr8R2e+cC+X4DO8YMeNVPMHEDGbiOmv6mmfMhCGi+D4wYbItIFJ22mILl3eoi9mX
         7JLtOT5mS+tdLJcpHmacWKXgeqxyY8VkaYUMhPvOlNw7mcBpFEMrZzqJfVgpJ9fLmBrc
         o52DQ7WVSPGHd6Xzh7zjbdNqF2YpYeNfLVQZ5rAZl7p1rbBYrcPGRFgvbBYhKLmusdon
         QPKw==
X-Forwarded-Encrypted: i=1; AFNElJ/B1UslGwBlH54zr7VUWwqd561rsrag7tnUFfGdCFEVZR/X0qg68l4uTN1xp4hf4kLcfdY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSG9qtDkyqc7YRSKugicBEHRa43ceKD6JyWUSr9/1RokNAGytq
	pbr+CjoeOZKVj4Vq+YeAsd2lXJe58mjEmK/n1Tq0gEMi2O/gDlDhVQIb
X-Gm-Gg: Acq92OHbdX0Fl0k4lWxntM0nX9P9cVsD7brYrRuEJjIEv/guadpZs7DFYAJbeVqe3VN
	ETDRsiwUVnGR5tmbCpCcFWsPGsTkczeeb70OMc/rUd/LZLccnwtCcqZhiKJuQ0TcYIrpeLfDhya
	ZXmdN/RWGkV5sfxGv6r2xoN4ECAu0Qd9sew1dcOQviGwm1ZufDgaoVDf8EkUEw45pnbVkE5ZbqR
	6vFfg/D7KhpuDWxqNCqIFler+YIrEe/oeQ1Qi7bUscwlI53CxJqtZz9uXDQN1SfyctnfMdk2CZo
	uiAgrS0qopL4KDoegUziSlpzOjnaafekTHMnIF+RQHkudFilH8aizHhjTGd0QLwbz7ozZRiUFb+
	u/AYLuJwS1S1DedXL3gSGZTmwFWk31VPL/mcE6xc/R2G/huSpr7eVHA3ChlNqxL6qEBSdSdSuJf
	OYVZcGKV7zcXzQRj5TkiInlrElADWxA6oD/QPW0B31tm6kUuHMGYR7i0YTnOc6aGOGASbmCppQT
	Wt0oJmib655wkJUggcRcJkYUF1Wy0Yhi2Jj6kvQjqmzPA==
X-Received: by 2002:a17:903:948:b0:2bf:23ad:8595 with SMTP id d9443c01a7336-2c1639ec888mr14025245ad.4.1780455559275;
        Tue, 02 Jun 2026 19:59:19 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d395sm8093805ad.17.2026.06.02.19.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 19:59:18 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
Subject: [PATCH 3/3] serial: mxs-auart: fix IRQ registration ordering and manage console clock
Date: Tue,  2 Jun 2026 19:58:57 -0700
Message-ID: <20260603025857.287148-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603025857.287148-1-rosenp@gmail.com>
References: <20260603025857.287148-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the main UART IRQ registration after uart_add_one_port so that
s->port.state and s->port.lock are initialized before the interrupt
handler can run. Mask all UART interrupts before adding the port to
prevent spurious IRQs left by the bootloader.

After probe succeeds, disable the module clock for non-console ports
since startup will re-enable it on port open. For console ports, keep
the clock prepared so auart_console_write() can safely call
clk_enable() from atomic context.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/tty/serial/mxs-auart.c | 39 ++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index 4499e3206e85..d40d82f112c0 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -1603,10 +1603,6 @@ static int mxs_auart_probe(struct platform_device *pdev)
 	}

 	s->port.irq = irq;
-	ret = devm_request_irq(&pdev->dev, irq, mxs_auart_irq_handle, 0,
-			       dev_name(&pdev->dev), s);
-	if (ret)
-		goto out_disable_clk;

 	platform_set_drvdata(pdev, s);

@@ -1627,9 +1623,28 @@ static int mxs_auart_probe(struct platform_device *pdev)

 	mxs_auart_reset_deassert(s);

+	/* Mask all UART interrupts to prevent spurious IRQs from bootloader */
+	mxs_write(0, s, REG_INTR);
+
 	ret = uart_add_one_port(&auart_driver, &s->port);
-	if (ret)
-		goto out_free_qpio_irq;
+	if (ret) {
+		auart_port[s->port.line] = NULL;
+		goto out_disable_clk;
+	}
+
+	/*
+	 * Request the main IRQ after uart_add_one_port so that
+	 * s->port.state and s->port.lock are initialized before
+	 * the handler can run in response to a bootloader-left
+	 * interrupt.
+	 */
+	ret = devm_request_irq(&pdev->dev, irq, mxs_auart_irq_handle, 0,
+			       dev_name(&pdev->dev), s);
+	if (ret) {
+		uart_remove_one_port(&auart_driver, &s->port);
+		auart_port[s->port.line] = NULL;
+		goto out_disable_clk;
+	}

 	/* ASM9260 don't have version reg */
 	if (is_asm9260_auart(s)) {
@@ -1641,10 +1656,16 @@ static int mxs_auart_probe(struct platform_device *pdev)
 			 (version >> 16) & 0xff, version & 0xffff);
 	}

-	return 0;
+	/*
+	 * Disable clock - startup will re-enable when the port is opened.
+	 * For the console port the clock must stay prepared so that
+	 * auart_console_write() can safely call clk_enable() from
+	 * atomic context.
+	 */
+	if (!uart_console(&s->port))
+		clk_disable_unprepare(s->clk);

-out_free_qpio_irq:
-	auart_port[s->port.line] = NULL;
+	return 0;

 out_disable_clk:
 	clk_disable_unprepare(s->clk);
--
2.54.0

