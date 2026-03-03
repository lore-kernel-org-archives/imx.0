Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D69521773F
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 13:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772544094; cv=none; b=HqYEx81N+kpCyOHi+PxPiSGkXnsjuNGBwsl/QQ7OkFdzkiZTGgrgm2VjPXWi5i4HPZzsWs9+Em9xlZe4oPyk2TQgWBEroqh4LWvO4U0C3lTVEcXisAJovv/6LApby9xvu4W3hwV2Moik23u1yoEBUze38kK6EbKtHkOktuAfpKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772544094; c=relaxed/simple;
	bh=qQ8cVIgoJLxTfOYZEyEm9nD6RyTJa6yvfBv32MH0W6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Azec1GSstPVGL2eB8WjdGxM7km3X3akpPBgZucVOR1DcUFbPS/aKQ1SUad2aXzg30JWN6lukYprOCAAv/puS9cu7P+XDpngDv1Sp/BkDO23UioSAdzn/MbEGnuxkQ5pQyIWUVJiKLqAuasYL0JuQXekLLsAknbMG7PZp50xi4ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UkVpxOq2; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UkVpxOq2"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ae50a33ff8so17509365ad.3
        for <imx@lists.linux.dev>; Tue, 03 Mar 2026 05:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772544093; x=1773148893; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rSgIttgxow4KdsVl0fAW0hH1qFQjzwhPA8Ucjoz0JJk=;
        b=UkVpxOq2bUz8o+m/f5V43Mbt52X1guGkcSal/1Iladat2CTh/G32D/veI8PXtEZy6L
         uJkaZSnj73ozNhmTrLGCMUCFSKuwOhpOv6T5ScaNw1mf5sv+Pgy9sTF8LZ0Tw7TIn0fm
         QGWJrvp8tMcMId5CWnRJbnBEtXd6N8duOp018GEWwK2U0B9zrmdY5PFL46jZwFZh/B26
         frtYAuYrtGh1PCrvk8r/kAhFiBCiAxmQbuCFoKntyEwRNtjhlSnVx8bzxTKCXp7sFofy
         WYROA8PzvJ0dh33V3ZyckhaqmZPKURQzX+NPW9RehbwTJIsNvh00V3GUx9d9O/oXXchE
         3yOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544093; x=1773148893;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSgIttgxow4KdsVl0fAW0hH1qFQjzwhPA8Ucjoz0JJk=;
        b=sTUVvmQKJeaSP0jwFTId8LMsYnEdOYgaAHtlpMgx3iuesCyfGZRS7KVLClfqvRuH4w
         3xbjTvtlx9wVfUHzvyNk7MaDKZqpXU3rPJx8251es2li7ZnYpN/V7ynOLkyBD0ZRpkxl
         x3rl8Bh+pLSgbDg1tKvh1vF1Q9TFjJIFYdb8RYOl/+SyOq6hF+MaGO65YCbLcpeW6RxD
         +B2QTnWKKfsMWGO80yCk5ZMEpYmvt/Yv1EQs09phDHiMHpZ6Wp0eIWwkA/QRy7NDayd/
         UX6IGwy6eNgJ7CJPaz+IN0VAKwZI6BMRpVHfLvg6H4W7TTNUwtt107PWkZSV+wNTcXN4
         d/Iw==
X-Forwarded-Encrypted: i=1; AJvYcCWeTjGK2QfUTFeWg5tn2p3mZUShaaTQN14fqsI5oUhpR88GW7oTcdjEUeGNbrPdj+S1MG0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKXxRzceR3HD9aqi07PMBEXgj5NQy5sUUWS0NdMwZWlEeF352m
	ec8TiIR5XNcWbkcBnPtuDhM5kPtq3S+XqID6rvY+JGhbAJ31PmBRBYrCqoFRW2Ged+g=
X-Gm-Gg: ATEYQzyC8C2/sbgB3pKaMuCIgIsmDnSOEKBX+sH/5+wsAm2+uT43UkCsyXSpu8Spcws
	QJln+E8XK7bF1AeO6ZosL2dToEMA6WZWFlyCifHxhCdnBpmmIK2op9O5kpDa2/YnX1G/3Lrb0kt
	OK5ZYn3FOtkW8v1PvHTkCNr4IJ8WD/q6U6VHv3hO5l15/yzGyTNUCirSFJnVfOOgfCui9JKKU77
	MOZl71ahOqcZRCXxGyhSbdr5q7VnTYU8XhmNR2RdcfqcCvoUnfrvkbKk6ZUpEwcRB83h0w6xeXo
	M2ljCswjIDkd4oDwr62NHNxUFswjaPdJPJKrRpBr/xl7ftffncUkiAjdYa3qcKvCYf930FNRheX
	YJfCcYal4zTUgQH3MuR02Uww52+wcoXwJRnrQNSzNw7dV5K68LVXPPbu1tvLpxaaBFCnaoRkvbk
	0EfXmxNQ5MmLin+jq2Sxm546vheD3gZbrx5RT3rMSwiL9ET7Y=
X-Received: by 2002:a17:902:cece:b0:2ae:3bb2:a8c0 with SMTP id d9443c01a7336-2ae3bb2ac50mr116402345ad.44.1772544092428;
        Tue, 03 Mar 2026 05:21:32 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9009:3f2:f9d2:c148:3305:e3bf])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b48f4sm168764255ad.13.2026.03.03.05.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:21:32 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 03 Mar 2026 21:21:27 +0800
Subject: [PATCH] spi: nxp-xspi: Use reinit_completion() for repeated
 operations
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-spi-nxp-v1-1-b78570db28ce@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFbgpmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwNj3eKCTN28igLdFHODJEvzRIuUNAMLJaDqgqLUtMwKsEnRsbW1APj
 jibRZAAAA
X-Change-ID: 20260303-spi-nxp-d70b97a8df08
To: Han Xu <han.xu@nxp.com>, Haibo Chen <haibo.chen@nxp.com>, 
 Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772544089; l=1628;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=qQ8cVIgoJLxTfOYZEyEm9nD6RyTJa6yvfBv32MH0W6k=;
 b=oGyL50RMeoOF6bnHxpZE3ErdeVNP2WcZc4Cs6okMYfM68WGQBmcJ5N9XO49DbR7IiA5uDhble
 q8S7hIWbPYDBP4jHV+uyQVjOJ0oA+8nZvG8rzmuJu+Zjme9oOvBtyNN
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
reinit_completion() for subsequent perations.

Fixes: 29c8c00d9f9d ("spi: add driver for NXP XSPI controller")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-nxp-xspi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-nxp-xspi.c b/drivers/spi/spi-nxp-xspi.c
index 06fcdf22990b..7b2de5612964 100644
--- a/drivers/spi/spi-nxp-xspi.c
+++ b/drivers/spi/spi-nxp-xspi.c
@@ -958,7 +958,7 @@ static int nxp_xspi_do_op(struct nxp_xspi *xspi, const struct spi_mem_op *op)
 		writel(reg, base + XSPI_RBCT);
 	}
 
-	init_completion(&xspi->c);
+	reinit_completion(&xspi->c);
 
 	/* Config the data address */
 	writel(op->addr.val + xspi->memmap_phy, base + XSPI_SFP_TG_SFAR);
@@ -1273,6 +1273,8 @@ static int nxp_xspi_probe(struct platform_device *pdev)
 
 	nxp_xspi_default_setup(xspi);
 
+	init_completion(&xspi->c);
+
 	ret = devm_request_irq(dev, irq,
 			nxp_xspi_irq_handler, 0, pdev->name, xspi);
 	if (ret)

---
base-commit: d517cb8cea012f43b069617fc8179b45404f8018
change-id: 20260303-spi-nxp-d70b97a8df08

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

