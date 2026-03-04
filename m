Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9798E18FDBD
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 12:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772628474; cv=none; b=I0E5VbgzxYSlw2CRyuUnbhoaAqfU5ANCElvdYBrnlnadgJJTulxdJxMt2WUIdINQwiVvowLZVu+ZTPEQveO18oYUnwUUE1gsoy3TV3ehY9LqPy+BRspFtUhinZynP2T4FsucR15yhKXhSJYpZ9Cvq0he+tyZDh11/jBReQZjK4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772628474; c=relaxed/simple;
	bh=I4G5BmiSRVnXsdaiwq2zZZ8p2iMKTYQ+oZxjqJ+xHa8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YUv8w16LZGmbe1F3NWOQYuW8foU7jPNSJH+aIYNC7wcS6JPF04mHZjle5tUrm4K9ld+PWsURUKYxXl2MqV8EtqOfEADByYOLplcCffxbGeur+kjqPRtoCtSu9q5rXwBTWkBKV9EO+Zy89oRB+iaulIlzE1u3RPBn2JjQawmUcDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yg1NSvop; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yg1NSvop"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso3144435a91.3
        for <imx@lists.linux.dev>; Wed, 04 Mar 2026 04:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772628473; x=1773233273; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXrbV0EXDox64nj0mJqXgXN5XJkcx97TQuO0RxgmpN8=;
        b=Yg1NSvopI2WkSZ3azOzBfwWrg4qf+lnn0CvolRVol4F199h5HUFJcPN6B2wTbC5E+0
         ii65mT4G8LYlLypimYKSb10k1x/9OLvR9uceDx90mjiewrf8BZLAj60iqP0QHR8xbX18
         MIOk0k1S/lflhk015XoolI5lajRjUkH/iOQAz10B+/3NJKVUsDU0huABJgHTi2h2tqF9
         RNL8oq7+IE/JcSf9H7pxutBB9Y0UUexdCOahUIrs+JK9tbIfg1A9CPG7PyErkm6ayGAl
         IwHrRI2CusJzbjbMoYqHY2CIYWLvn2aPoCTRhMXXxxr51QudgG/K5mlAJaDe/e5M8XE2
         XKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772628473; x=1773233273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pXrbV0EXDox64nj0mJqXgXN5XJkcx97TQuO0RxgmpN8=;
        b=oufdH3T/gp8UFBQgE7mALS+hUBPf2KlX/D6M+TMoMNNu1ZJ+9DNTOrdpjfCJnMHZ6w
         DMlU+RM471efCMLx+849CZ8e3Nm2hTJuPGaMjDQbeX37ylP5zujybSpw5M/xbvA2W+wY
         M7UPRI2roPk+mvCZPFFZ5pJyNOkwnxXOVuwkM5I97RViW3IIQs5DSMeQUxegUw3YPHPd
         Z+6GbLvv0WzU/MRqx2DHQAARiNHToddHr3o3epzT5130oXmvz1TjEfp4AmvPVae7+PEk
         J1O18oIs8oSGYW22SIkJbITcfFRR6xE28nQuwRar7923RrhAjs2vzVFT53zRhDebp46D
         R+Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUqke/jGG/bu8W0/SN7XztTPXGBdpsR5zsRJgb1ZGq+zfgOAUIoGvAdCJ+1HbMbaMZAZDc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxpbzxMW0N31eAepaIuaPe1IIlaFLSjP7W5T//JOlgwcamDsSxS
	F4fyqC3KPgD6Q7pt2mC5S0OwkyVLwbN4IUh+ZUMYOHrgGHJcWmF8KW/N
X-Gm-Gg: ATEYQzy9XvEb1EKvy4EBT0dXhT7CQVNCdi+6xxESt/+1NQVF1KtrTjT5KEcssN7a+eh
	Z0Iw1XWSAk4gpNc8x5oPTAjkhxL2GTHUu0jx03SPH4WtWNvmS7i96izKv3Ide6DUC7jB17OCOJ3
	drySEhd9CmIA9yrlVXOBUZTMXTRcVeRNv25GDuxXpEaiLJbOt1hXvI8ChGDDNedasONjqEM0ECL
	yNXl8g6vDd5C01ZJ1YOxpcSluMD5lxTY5CfDz627yxMPZVXQagO55Nh7OCBnX4iIi3M1XD5xgyT
	GAy3mQYMsF+IvNPkN+/OrA8SBKr8VMJlXioAgz3uL02brsuY8FI+C9pwpYbCB0Gsd4U/YDVJ1oM
	AK3djwKJQAaPNz8mY6yuxsSanK/lSLvq6rvzHocEQp3VEsh81Q7EnjhNAwuHGT5NF8Usiq7vmWT
	NS4+lTbiQkXeXr2TRrS3BMGYJxjfQWm3DSEPyi
X-Received: by 2002:a17:90b:5630:b0:34c:fe7e:84fe with SMTP id 98e67ed59e1d1-359a6a6433fmr1633791a91.28.1772628472939;
        Wed, 04 Mar 2026 04:47:52 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9009:3f2:c48d:9c04:d04e:c13a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0625sm5000450a91.13.2026.03.04.04.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 04:47:52 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 04 Mar 2026 20:47:21 +0800
Subject: [PATCH v2 3/3] spi: fsl-qspi: Use reinit_completion() for repeated
 operations
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-spi-nxp-v2-3-cd7d7726a27e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772628443; l=1465;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=I4G5BmiSRVnXsdaiwq2zZZ8p2iMKTYQ+oZxjqJ+xHa8=;
 b=cJacyzDOyUDA2/PYdVXT/xwkdqZtYGL92jgOWdz/UHbRz0p1Vee9zlUm0eB+D2wf9urWa55bX
 Dl/LD5HOTwmDNyfe1VujlN6zBz8uoMBAbxcOfG4c99bRs7+xjA+zsa2
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

The driver currently calls init_completion() during every spi_mem_op.
Tchnically it may work, but it's not the recommended pattern.

According to the kernel documentation: Calling init_completion() on
the same completion object twice is most likely a bug as it
re-initializes the queue to an empty queue and enqueued tasks could
get "lost" - use reinit_completion() in that case, but be aware of
other races.

So moves the initial initialization to probe function and uses
reinit_completion() for subsequent operations.

Fixes: 84d043185dbe ("spi: Add a driver for the Freescale/NXP QuadSPI controller")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-fsl-qspi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index a223b4bc6e63..57358851029b 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -633,7 +633,7 @@ static int fsl_qspi_do_op(struct fsl_qspi *q, const struct spi_mem_op *op)
 	void __iomem *base = q->iobase;
 	int err = 0;
 
-	init_completion(&q->c);
+	reinit_completion(&q->c);
 
 	/*
 	 * Always start the sequence at the same index since we update
@@ -965,6 +965,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	init_completion(&q->c);
 	ret = devm_request_irq(dev, ret,
 			fsl_qspi_irq_handler, 0, pdev->name, q);
 	if (ret) {

-- 
2.43.0

