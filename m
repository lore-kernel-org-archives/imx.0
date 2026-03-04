Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C234A1B6D08
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 12:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772628460; cv=none; b=HIWBBf9m3W6T1yc+RLVQRCKqNB4QjEW/bg4uWdIG0u8SWk1BxkYGzwtUXkMkwiV82Jxnl7WiNvvYg2FCiXbZYaCg47mZr84Bh6mUnW9dbRRMSxbsPCKFIeZg5TG1neee8n0c6H22zb7uaGblANLUwrv1IkLsewd07q67PzJBU/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772628460; c=relaxed/simple;
	bh=bhwo7r9j37LyAs4Cos8ri5eXa2weRve1tYt/Mk3XGVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a7lY78Z2AUwM+UQdMLtENmLrG23X6pWakOvQAD01pPttvNWkaZ8ncTMX8tekHDaxdEpw8eLZuiPG04QvD/fVJnwuY/dO3XGeXRXQUcsj5PN2owB+9FU0gQQBV5Y6SM8lh62HGHXdRnMZgNSQHtFz2pqwvqo+B7yeNOiBPPFfrlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xq+dHAXJ; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xq+dHAXJ"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3598b95ad7dso2480284a91.2
        for <imx@lists.linux.dev>; Wed, 04 Mar 2026 04:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772628459; x=1773233259; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gqJ5CYeF/S+wuXTqSQYoaQnBXp96lA01eWpg1TT40+g=;
        b=Xq+dHAXJx950tcjoWrpcdcJF/95Tm/BeJsCQx3BK8XI4WA8ZyUkNehie5PKw5exBjS
         EjScEdVgdMukzB8F1Lut6jXUgbjgIHWwhPuy9oRr4zM5nmRgIMkYJUu8cEs7IWp8+Gyv
         fJmaQPIlttVSHLnZO2NQIN5zWmzsYo8KJDaJgyuwWFUX88gRckqAFzM8Nz/tg6ZQZXMU
         2U5g9rz+FBfsnlTUfiKHbt6rnK6uH0qVn1xiuRZPKnHpIoVi+1foR2CA40xoOfTqsjnN
         Z7RL/txfzlHAQIsJQ9AGYkk1I/X9e6HThEgMkZ9qLsNjbGKeLYe6LlmPadnA7v7yoeLT
         BZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772628459; x=1773233259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gqJ5CYeF/S+wuXTqSQYoaQnBXp96lA01eWpg1TT40+g=;
        b=PwMPpggXlTlXGzWjzVMuNIVcxiUEUb6IgpK/rH+CwQlPGL2BSuJ/1xow/YdykLrA4O
         zoN6uhrzSeBg1S/9zTPtjLqEcNJrNOypbM2hBReC4KBFlxuxP3H51SlOuqp9AuM1iXt6
         iKjGXkvehX4/oI3oU/TnLr09b3UcJ0AOOs64NfWoCSnzz2+9bbEVFg9tS4RXetnVnlyd
         q9V4pygEeJ/YseIVfupQXEbJhH5DtzU1XhkqrmSOo/ZAPT0J9ZEuTyvgjZUPpzRfmxc3
         9+wSwHYKNtZPrFDG4l1gyqmkrCrEO0k7qpnJV4wFumQdRwwaZSXdH53Lq20YZWTiiXf9
         9hEw==
X-Forwarded-Encrypted: i=1; AJvYcCV23jWi8wD594154BjFWHzUcaq783e5jqcbRPenusKBVaFbS7eKHE+6zEE0ljaOkOSkqHM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwHgbhnR02L3bP4dvv7b6uok0nsyX1Iky5UdQEojFWs/maT/Ssa
	vNKbWYmJDfkIzCx64ECxHcE37ypZRHG7MUrIHZ84OAvJTDlVwxVrNEyA
X-Gm-Gg: ATEYQzxHFYmmxV4+nwQcekGri5h6x/HxArLqjZ0vsIA++BuZStKl3DaViSnI/s0dpGP
	qmybW1xH5c3KldqrsVzgArEa8cdmWDLm7m4AK1nl1rMwAykR/IiSspr6OhCay8GNrTY4HLJzQ3M
	j97pgnCnzFqbE6kE82NPj12zCDRRrKROGuPCY13AIqleSNrGhGFnwJMYtYgH+kKMC87OTWoMHDj
	bnrxaG8RPXeYScqsCvImM6FjLg8xCQWnxfKe8u3HB2g5pPFdplD/e38f4MjJUJ3fYIQhEe9yFYT
	7ZgkTn90c97jozjo49qltuDzbMpmAnNsxkQCnP4MobV9+n+YaSwn+V2oeQY2ruHVCrHr3jA6jEd
	InboxWQ2Unzj7g+rUI17wYDj+UF577CJDqcjZ6fy5bEJIjmQzf0wALH70kpix3S5GJEiCvAl1KA
	9JvKgiR6+W6MzZHJfQ2I5V0DX456zd3mEWSgAm7zODoDZtOyQ=
X-Received: by 2002:a17:90b:4e8c:b0:354:a662:47ff with SMTP id 98e67ed59e1d1-359a6a851a9mr1665118a91.35.1772628459128;
        Wed, 04 Mar 2026 04:47:39 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9009:3f2:c48d:9c04:d04e:c13a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0625sm5000450a91.13.2026.03.04.04.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 04:47:38 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 04 Mar 2026 20:47:19 +0800
Subject: [PATCH v2 1/3] spi: nxp-xspi: Use reinit_completion() for repeated
 operations
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-spi-nxp-v2-1-cd7d7726a27e@gmail.com>
References: <20260304-spi-nxp-v2-0-cd7d7726a27e@gmail.com>
In-Reply-To: <20260304-spi-nxp-v2-0-cd7d7726a27e@gmail.com>
To: Han Xu <han.xu@nxp.com>, Haibo Chen <haibo.chen@nxp.com>, 
 Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Yogesh Gaur <yogeshgaur.83@gmail.com>, 
 Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772628443; l=1530;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=bhwo7r9j37LyAs4Cos8ri5eXa2weRve1tYt/Mk3XGVE=;
 b=UXeHZ7i8c5JkwX6pvPTKD0/+H4rZvNXPd4odiwy7izmbwaQIhobe5vN0odSCPtB2GwkiVvVdT
 yd7yQZUlfIzCwmRpJyL7jb47up+yXAW3H/ST92CfQtRicN7Lo3jKNp1
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

The driver currently calls init_completion() during every spi_mem_op.
Tchnically it may work, but it's not the recommended pattern.

According to the kernel documentation: Calling init_completion() on
the same completion object twice is most likely a bug as it
re-initializes the queue to an empty queue and enqueued tasks
could get "lost" - use reinit_completion() in that case, but be
aware of other races.

So moves the initial initialization to probe function and uses
reinit_completion() for subsequent operations.

Fixes: 29c8c00d9f9d ("spi: add driver for NXP XSPI controller")
Reviewed-by: Haibo Chen <haibo.chen@nxp.com>
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-nxp-xspi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-nxp-xspi.c b/drivers/spi/spi-nxp-xspi.c
index 06fcdf22990b..385302a6e62f 100644
--- a/drivers/spi/spi-nxp-xspi.c
+++ b/drivers/spi/spi-nxp-xspi.c
@@ -958,7 +958,7 @@ static int nxp_xspi_do_op(struct nxp_xspi *xspi, const struct spi_mem_op *op)
 		writel(reg, base + XSPI_RBCT);
 	}
 
-	init_completion(&xspi->c);
+	reinit_completion(&xspi->c);
 
 	/* Config the data address */
 	writel(op->addr.val + xspi->memmap_phy, base + XSPI_SFP_TG_SFAR);
@@ -1273,6 +1273,7 @@ static int nxp_xspi_probe(struct platform_device *pdev)
 
 	nxp_xspi_default_setup(xspi);
 
+	init_completion(&xspi->c);
 	ret = devm_request_irq(dev, irq,
 			nxp_xspi_irq_handler, 0, pdev->name, xspi);
 	if (ret)

-- 
2.43.0

