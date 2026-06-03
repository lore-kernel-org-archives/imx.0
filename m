Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BBE3DE42D
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 02:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780455558; cv=none; b=SaAsMQkfANfbPUzsBUw2jAKHy91x/kwMh1r4toJr2XT2hr6ODRQqjdUCQmr5vjtxZktbkUDu7qs/FX+EMZYm7CZucVOnAUXf85xKyL1fz//BBP79yOtIFD8bvYzqmx3c/y0Ewgs6KOJXNc0rrO1WTlyn9Msd/Dw4Gn68WwVgZG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780455558; c=relaxed/simple;
	bh=Mw6uZCGJXMEV6EuSRORcbRYN77L14z2+GP+f8v7Yems=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KX1jNtmsRkJVzN3XtmEUa4kTjiG0XyUM3xDFqUwQu+YuzRUVbJ06UNDZTTtllLxxY+9gMMSBGrrPtsF/TO0qTelRj1Ytm/Fc2OotV37tjGwi3OxycGN9ZfYaWAUov9SMujAT5zFdE/mzmMZmauxj13pndODhTaYmn4akDo2FH7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2uPgVXN; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2uPgVXN"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2bf1f074a12so51703325ad.0
        for <imx@lists.linux.dev>; Tue, 02 Jun 2026 19:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780455556; x=1781060356; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYa7LbLjk11lrjjaU1fZoPN6rpBXsfSmsjALmXq19N8=;
        b=e2uPgVXNzzB//N4bub+Rdwx3zf4+BMAVcR0ItIUefpn48C7R47jt61f8gj55R2GTZ8
         XfA/H4MftO2EzVaAlOcJAOvdZTLek/4BjjZByyJHavCKafyxDqEa1wEvfvuMbM0+9jhs
         3UW7jx+VeRd0OS2tUWgrDNsed4kXs4TNjnMURWocz7ysck/1Ho4u7T8cdxvl9n//XZKx
         IryAlkdkA7xKshX+ZdEPvAZbuNkCCK8nbOQ3oOZDviAR0gpnarILwRnIW2CBqfWQvDsG
         Lb2JlNtHXFjAXLZdY9x7Zj8BRntqQtIE0WLF2FRQNvQW4Yaa4Prpee94rit43EWG0s0T
         JotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780455556; x=1781060356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gYa7LbLjk11lrjjaU1fZoPN6rpBXsfSmsjALmXq19N8=;
        b=cdVOYv9hPTgsGpzjfmjUEs62dmzcaweDXpfv8OlQxMud5vgQG8HnCHDzVb98U5icxu
         l9G6NIDkI8WW4AreIhnZKgCpY8qCaRrUeGV81SufWn60mtbNV+lfsm4ZvXvJ0ueRs9X8
         EnTVh1mH6lWO+/ZmJVNj2XKcrU/Z5fBm7Sqdd1s3t//am19FUIQYJctBisMav3DO1SLv
         jYeU6qNDXGSdFIxMd8vDmUVKBdtzyzrwrBc6PN0HfVyupxbsebCIlNfQmTt+7wwqbvg+
         Skzu+ATVWcCYYhMF5h1ReaQfT9CtSrub5jzLoLcQ/gq22LydWpEoNYMFa+3eM5U0A2pj
         njrA==
X-Forwarded-Encrypted: i=1; AFNElJ8fZXj571EF8KMOaVl9x6Yb5zRGM4abwPqyi2EqwLCKgGSmVOjZq9CUYdSKFhnU3yAbiec=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/dD/6KTFQwmOGWhZbiOKJH+EG+anvJhKeCehExO9vG3wa80C5
	MpTA/tCjv2WuBxXmtYCTobpSsn0OM9RoTlf8IZPx6scMCdWh+VJovT4l
X-Gm-Gg: Acq92OHDi3QdpBmgZSsx+/5Ny4I20JEN08OQtqgXAPND/NwumW2FxcEi+eJQs9Q5F2l
	PZQe/xV4FC1BLDkjofooveEMEVBqZGBymeu5BXCDfRxKRSrlTXQIkW3HKMtvz3VkqHrB1THewO5
	N4OWYatNgpExWJhencZOIH/HBl8Z+kKxvI85GIRmDVkG2chYJx1ZpGu4R8ErJOLIuJUY8qei15a
	hbqfqOKk1/x5fqlAEMlfogF69nmW59kngZPMGmBKUaaAmvyPEH56DDqaM9SKb717z/udTUuVphU
	0elvGsJF5nNFQlLzmPco+t0+YQosxQRRXy1490eH5t+9SQnCTGH6zTC44kor5QCph2TnHa617EC
	kSvSo/JfIN596RN1EoUuQfHmJtEzuc7TyTKwqvRdoQlYEQ4Piv7YeV+9BJ1OqMtEWtfl7oZhH6v
	KfHAcIxh/MOTXOFvTMz01ePprYbKz6bOS+73UA98Q7uM/CW8rlPE/JH7pP+DGyAUDuyMx9a8J48
	FL5nADjFlDTbQ7Eu+ivT6/WYW+UX/7OOrJVOyF49HYr/mIth67sho0w
X-Received: by 2002:a17:902:d48d:b0:2bf:2015:5b93 with SMTP id d9443c01a7336-2c163a2311amr14365355ad.11.1780455556485;
        Tue, 02 Jun 2026 19:59:16 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d395sm8093805ad.17.2026.06.02.19.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 19:59:15 -0700 (PDT)
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
Subject: [PATCH 1/3] serial: mxs-auart: rework clock handling in mxs_get_clks and probe
Date: Tue,  2 Jun 2026 19:58:55 -0700
Message-ID: <20260603025857.287148-2-rosenp@gmail.com>
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

Use devm_clk_get_enabled for the AHB clock so its enable/disable
lifetime is managed by the driver model. Move the mod clock
(clk) prepare_enable out of mxs_get_clks and into probe so that
clk_set_rate is called while the clock is still disabled, avoiding
CLK_SET_RATE_GATE failures. Clean up the error labels accordingly.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/tty/serial/mxs-auart.c | 47 ++++++++++++----------------------
 1 file changed, 17 insertions(+), 30 deletions(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index 697318dbb146..1390fa000a5b 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -1470,34 +1470,22 @@ static int mxs_get_clks(struct mxs_auart_port *s,
 		return PTR_ERR(s->clk);
 	}
 
-	s->clk_ahb = devm_clk_get(s->dev, "ahb");
+	s->clk_ahb = devm_clk_get_enabled(s->dev, "ahb");
 	if (IS_ERR(s->clk_ahb)) {
 		dev_err(s->dev, "Failed to get \"ahb\" clk\n");
 		return PTR_ERR(s->clk_ahb);
 	}
 
-	err = clk_prepare_enable(s->clk_ahb);
-	if (err) {
-		dev_err(s->dev, "Failed to enable ahb_clk!\n");
-		return err;
-	}
-
+	/*
+	 * Set mod clock rate while it is still disabled so
+	 * CLK_SET_RATE_GATE does not cause clk_set_rate to fail.
+	 * The mod clock will be enabled in mxs_auart_startup()
+	 * and in probe after mxs_get_clks returns.
+	 */
 	err = clk_set_rate(s->clk, clk_get_rate(s->clk_ahb));
-	if (err) {
+	if (err)
 		dev_err(s->dev, "Failed to set rate!\n");
-		goto disable_clk_ahb;
-	}
 
-	err = clk_prepare_enable(s->clk);
-	if (err) {
-		dev_err(s->dev, "Failed to enable clk!\n");
-		goto disable_clk_ahb;
-	}
-
-	return 0;
-
-disable_clk_ahb:
-	clk_disable_unprepare(s->clk_ahb);
 	return err;
 }
 
@@ -1604,17 +1592,21 @@ static int mxs_auart_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = clk_prepare_enable(s->clk);
+	if (ret)
+		return ret;
+
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r) {
 		ret = -ENXIO;
-		goto out_disable_clks;
+		goto out_disable_clk;
 	}
 
 	s->port.mapbase = r->start;
 	s->port.membase = ioremap(r->start, resource_size(r));
 	if (!s->port.membase) {
 		ret = -ENOMEM;
-		goto out_disable_clks;
+		goto out_disable_clk;
 	}
 	s->port.ops = &mxs_auart_ops;
 	s->port.iotype = UPIO_MEM;
@@ -1681,11 +1673,8 @@ static int mxs_auart_probe(struct platform_device *pdev)
 out_iounmap:
 	iounmap(s->port.membase);
 
-out_disable_clks:
-	if (is_asm9260_auart(s)) {
-		clk_disable_unprepare(s->clk);
-		clk_disable_unprepare(s->clk_ahb);
-	}
+out_disable_clk:
+	clk_disable_unprepare(s->clk);
 	return ret;
 }
 
@@ -1697,10 +1686,8 @@ static void mxs_auart_remove(struct platform_device *pdev)
 	auart_port[pdev->id] = NULL;
 	mxs_auart_free_gpio_irq(s);
 	iounmap(s->port.membase);
-	if (is_asm9260_auart(s)) {
+	if (is_asm9260_auart(s))
 		clk_disable_unprepare(s->clk);
-		clk_disable_unprepare(s->clk_ahb);
-	}
 }
 
 static struct platform_driver mxs_auart_driver = {
-- 
2.54.0

