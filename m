Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF74319E98D
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 12:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772628469; cv=none; b=eLWPJAY2Xpu+s2+FP2J9nfJ5tlPq6Pr/+7rfevpqDVqkSbopjlOTf3ZPOYiXcsTmj6bXWZ0hWovgpCM9sYUWrmmPZ8Zoh3CT8yeH7NGmOKn3M7CUnojkmDpwViCSRzWHBaCS7/RvUt2QWdnhFpf9a7j91zSEDvrYs/lOFWBZKMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772628469; c=relaxed/simple;
	bh=I4vOzBPfyRSgU37i3aopPtXd8O/uvXcLF9y6LnFAAr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q+e/H6X8ie06Qm9xVSuP+bAeyKnsXUL5lXdbQFQ/LQ2iIo1plo69mGB5X+dmo4W3ogGwJ8/sbs5ugSx+aS5DRZiKSGbM998oT6Az374y4vICVf5AlaZLi5JZluBDcbShidGngCo7QVx3nF9sItNW41W0xzJtnwEmE+9hO+EDpxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3vj3dKH; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3vj3dKH"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3598a09fcb3so1465899a91.0
        for <imx@lists.linux.dev>; Wed, 04 Mar 2026 04:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772628467; x=1773233267; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tH0w/azYrKeQPVCZ1zt90CBX6B2rnF1FZuHhCMgUyjQ=;
        b=L3vj3dKHC+/O2hBeiPeVPM0vpwSo+dwuHHREMx3FO9AlmqbpsKyRjSAsYJN05iczDh
         TmfUbRXO1bxByq6OCj1ZlBKIwj6/NUBqgcAGQxp8MMWrYTHU7e4LnSwfC4SqG/T+AF6i
         ccztNNAWQB0cxl65NiS6aiiNWl66Ou9RVleTMZK7go5GNqmcpLMkGsjBh8iD606aAcFj
         PIHtPxBrn7Y9J8kCXUT64SsKA+fgYo9IkyKRY3U/OnyqYukWFuTeIxdBsqXmH1HtnLmx
         NdYm5lNrygMjUNs+9abB4CZyPMVqLyI6kX+uPJW9zF4FEzNwQAWlfjjmJXSiGdpulyoz
         lTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772628467; x=1773233267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tH0w/azYrKeQPVCZ1zt90CBX6B2rnF1FZuHhCMgUyjQ=;
        b=M3ZlycsGQzGg8xBF7e1I0eu4N2g5cwQXtpsf7PQGfiispvv+qF/b41v1h+2K/TTJsl
         MVHyltDltLQOz+ZkqM2aUDTyVGcUpSWW3vPexTPvJamkKOuZNwp8ptbb3AUmhBJ9rTXF
         nORuSMYg8AXXgqP7OCapatHGiPU8yf+fK4mjFIhN+VL6A2Uek9PLyENl4b+bqvoaRN/B
         4lQTRaoyrvxJAOWwdAWuSYq2cjEalnljCPrrKF8srvQfa10w+ecECbD0Gt7oqQJEHCFX
         Fl+nNu2o6o1ntljhgoojbN4HdtHi6MIxZ5RXcZF3AL3KAoi2jxBiL2xOizsH/IFkCxBW
         ZWsw==
X-Forwarded-Encrypted: i=1; AJvYcCWxflIipx31Z+jUM3xYENwEdxPFqVI3MqqEW57LEvv1RiRPFyC2xexR7fkc8iV87zNkWEE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwS3QZ5W1gmSFuP5UXcT0ZK5senXLfYHIl+j3oTot+AiVdfR9Sb
	0/JO7mQ1yhKfVyLc/CstF7dgZ1GiWhL/lR1U9LZq3pSdemN+YdLByhc5
X-Gm-Gg: ATEYQzwlMRveR9kREja7fblm0VynpEYuLSmdUwaK24d8pLhF0dhAiLv+7KcrPqujSK1
	FTbp+GUF1iTSFAHkcDXv9oMdI1YK6k7fk2nsqnZYkRAU4KL/TTm18THb+BcFwoM11rNTEGnGR2E
	si4X+IvRsgTIjqsM4pjkJ9/EXzjvsFzjqzla/hsXH2aMr6I/8fdMuEx+X0ABd98nkFzx6tvaCZD
	oUVAHsGUFzKvWuLmhqt+yBumiT2fUSNdTBsn4ZPH6EmOrvS3R1VMShAuO0e+4gNheJ0YYhpz0mf
	DtaSHS2nro6OtgewIe28f672nHoQFlkzIqWnFfoeiYlYaAcTPAXJ/Y2RaelEAFFCV2oGzRUbRqj
	x9NHrvdrGIUf01ikNxbhBW6HFbQCktL421zWfjMeaX1TrSJQrOPk3QlTsvWlh/czQ4azZ+CLmzA
	TkpFFYGkCOuGKqRTq2omWZPrbTBS+0GGyEJNCz
X-Received: by 2002:a17:90b:4b0b:b0:341:6164:c27d with SMTP id 98e67ed59e1d1-359a69a9621mr1926831a91.3.1772628466940;
        Wed, 04 Mar 2026 04:47:46 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9009:3f2:c48d:9c04:d04e:c13a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0625sm5000450a91.13.2026.03.04.04.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 04:47:46 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 04 Mar 2026 20:47:20 +0800
Subject: [PATCH v2 2/3] spi: nxp-fspi: Use reinit_completion() for repeated
 operations
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-spi-nxp-v2-2-cd7d7726a27e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772628443; l=1518;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=I4vOzBPfyRSgU37i3aopPtXd8O/uvXcLF9y6LnFAAr8=;
 b=+d38z2mcF5Zfsco/fBNqzjJQTm1HzU5pjmt2nyVbqbt58+MfVPZ6k2e7b+nSvIsSE44r17bZb
 Ff7Z2kvb1uZDFhgUbIYroXvqGEJXEHeLroYd5j1pY8Eco6ed7Inrp1l
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

Fixes: a5356aef6a90 ("spi: spi-mem: Add driver for NXP FlexSPI controller")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-nxp-fspi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
index 320b3d93df57..1e36ae084dd8 100644
--- a/drivers/spi/spi-nxp-fspi.c
+++ b/drivers/spi/spi-nxp-fspi.c
@@ -996,7 +996,7 @@ static int nxp_fspi_do_op(struct nxp_fspi *f, const struct spi_mem_op *op)
 	reg = reg | FSPI_IPRXFCR_CLR;
 	fspi_writel(f, reg, base + FSPI_IPRXFCR);
 
-	init_completion(&f->c);
+	reinit_completion(&f->c);
 
 	fspi_writel(f, op->addr.val, base + FSPI_IPCR0);
 	/*
@@ -1365,6 +1365,7 @@ static int nxp_fspi_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to disable clock");
 
+	init_completion(&f->c);
 	ret = devm_request_irq(dev, irq,
 			nxp_fspi_irq_handler, 0, pdev->name, f);
 	if (ret)

-- 
2.43.0

