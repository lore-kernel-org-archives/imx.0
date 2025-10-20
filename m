Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF16330314
	for <imx@lists.linux.dev>; Mon, 20 Oct 2025 16:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760979123; cv=none; b=E1EEclouDP8M2qzIYg5zBFXIRknQ8dF8ajZxqYWrsZLOKhux3J0r5Vl2ZouMoDE4uhAr0WfmYqqxWX/grSO2SS0HFmDd0Ma7MjpvhyWNX2JKJqaS0UMwUCqGRDZpNorC3xLiv7A1cRZDKZ+Xmxm06CR5tyl81eKhkLeYmlCsAYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760979123; c=relaxed/simple;
	bh=NVCZabHEL1WTH8+GxShWLpaijc+G+GBkOY3veIVd+BY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R7hIAhs6gcpTOo01zIjOTqbTyJpF1f6RYqnVq8ZHJu8zxfRATx/Yw7QZ6V1dwSj0vJ3TiFG4FFcxo8hPJlVd0vKFStzfBmLKbuEImM8ioPvnS966uunNXjup9+TD5NSBBpZMwcShkqI2jB9FJu/sqgS2B4zYxg7hfmbrlwe4G+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=0+eqNWxU; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="0+eqNWxU"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-930cfdfabb3so281258939f.1
        for <imx@lists.linux.dev>; Mon, 20 Oct 2025 09:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760979121; x=1761583921; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AztIAt2eykX0RjbkZdmQk0KjjmCuZftCSORZ8HPCkE=;
        b=0+eqNWxUEQbiHGbgGy5ZuKOxmRtYc7qI6yRjSzaHmDXU+XdXGQuVXXBi+WWazpeGfY
         P4zIoLfKJJ3yhCy4lm8Dxre6NIKQGH7FHyu7TTrH3sd6rJBTTm+9oRzcM2mwIttxloY3
         RRmrr3I9XlvPEaCp5T86lHAEV4zfmQmdEcKiW20RZmj3KfDtX/ImQvF6Fai/K66CAw25
         lwNCDNI3hHPhG8LdHo+vpfqV/4h9iN+JieYdBcFictAalsej48HZxGtgOyN1uDXJ70Va
         0SCa2cnFYIZOxO071zBt5eNkdvDrp/g16N4HRvwlrqlom0ACZzpjaQtg+UV0n7twyf8s
         GDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979121; x=1761583921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2AztIAt2eykX0RjbkZdmQk0KjjmCuZftCSORZ8HPCkE=;
        b=IMstKQT73SkyK3Vc/0R84Y5XVzeQMeYjdcFVyuKLDLSoakX8ydULR9Zohes3Y3fnuG
         ELo+dGgurpSOcRJP1QWpv0gFD4YBTvjZY9/Wf1gciKxsVn4drQnmCdnJVTyNXSgYM3fF
         ahfIvQ48Yf+L13FsBqchRGLqqoArvjn9/7DfUaxP3dVOPjDftDiTgObSM5nqFFY2d/Dt
         dMzTTrNnlU6JN0Jeo5ytJBHioYU8nzHXnwC4Be4dU+TmpsDtjeEYBU1ur4qXDZnq99B9
         iVC20FzwE0ZvZul9oW1cK345BFU6ZhkSv6U0uVDamWWFOAJ9wPirTZX9g8iF2T1T2IMd
         23iA==
X-Forwarded-Encrypted: i=1; AJvYcCUk+U/jOPi91LNAdCclrLwZpvw/8gRXtj+AnW47YGQ553NzRRaqV9qv1qkYQdyL01DvP38=@lists.linux.dev
X-Gm-Message-State: AOJu0Yydv45StUQNI2sUM02rTrKjZloAWgD2tFhDKS9BVh8GCW3Y/Aor
	5SSnHwF09fUCrhgqtVcriq1W43Nuv6MuvI4XMopSmLgPspLLBvK5vsESiwcbabZ6JA0=
X-Gm-Gg: ASbGnct5Z+pub1MpAXG3zTocevbuvzljKnnM0koPoe/D7aDGaAcLkCBR5vPRiiCanQw
	J6m+sD+1M3T4uG8vZf+z1tLq8/jhgNOjHBQZS7c30JtAcEN4g2jpawi48QFD5i4ibNqH7IuZxpy
	IADfdoGhmZh9rWXyvPv7v4lNe4bHxE46Xuz6vWTDWhWvIgC74ORa3O7D2KBV6x9kJDhAoI8QW0Z
	u19l6jeBh3EOS6tSrgmn3xSYtNjRsTWWcVknrKt9fMsSrYAubkAahpsTNykrJdGJjepx6YtZuQw
	wQAdh4TLUOjolc7f4yenCVFFAvLGVLYMG7n1jFszCSUPGD9v5RAj0yKJRxDwoT+sJtEFz9jGNjs
	NqhOpsIS32pTFAGOH+fJ3WuySyyj92cdMGbSsmWbrIO3qq8XnwQaH4soJComzNjmI6Ywos1ug1Y
	MigdPToYNpMb5hvFP5jO1ymt5pR0KvUcTUACEckTNkVIO1rDxIzuBNuA==
X-Google-Smtp-Source: AGHT+IFtVH7UjM/87oCHJ6DUbsAetp8PBWDPda8ZOgIZ6EU4bkSIEhABKs7/sgWo14aF9mEKEUu9sg==
X-Received: by 2002:a05:6e02:1745:b0:430:e5a4:6f26 with SMTP id e9e14a558f8ab-430e5a4724emr31688155ab.6.1760979121057;
        Mon, 20 Oct 2025 09:52:01 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9799428sm3116783173.63.2025.10.20.09.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:52:00 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: han.xu@nxp.com,
	broonie@kernel.org,
	p.zabel@pengutronix.de
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] spi: fsl-qspi: add optional reset support
Date: Mon, 20 Oct 2025 11:51:46 -0500
Message-ID: <20251020165152.666221-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251020165152.666221-1-elder@riscstar.com>
References: <20251020165152.666221-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for one or more optional exclusive resets.  These
simply need to be deasserted at probe time, and can remain that
way for the life of the device.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/spi/spi-fsl-qspi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index c887abb028d77..1e27647dd2a09 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -36,6 +36,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_qos.h>
+#include <linux/reset.h>
 #include <linux/sizes.h>
 
 #include <linux/spi/spi.h>
@@ -267,6 +268,7 @@ struct fsl_qspi {
 	const struct fsl_qspi_devtype_data *devtype_data;
 	struct mutex lock;
 	struct completion c;
+	struct reset_control *resets;
 	struct clk *clk, *clk_en;
 	struct pm_qos_request pm_qos_req;
 	struct device *dev;
@@ -857,6 +859,8 @@ static void fsl_qspi_cleanup(void *data)
 {
 	struct fsl_qspi *q = data;
 
+	reset_control_assert(q->resets);
+
 	fsl_qspi_clk_disable_unprep(q);
 
 	mutex_destroy(&q->lock);
@@ -902,6 +906,10 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	if (!q->ahb_addr)
 		return -ENOMEM;
 
+	q->resets = devm_reset_control_array_get_optional_exclusive(dev);
+	if (IS_ERR(q->resets))
+		return PTR_ERR(q->resets);
+
 	/* find the clocks */
 	q->clk_en = devm_clk_get(dev, "qspi_en");
 	if (IS_ERR(q->clk_en))
@@ -923,6 +931,10 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = reset_control_deassert(q->resets);
+	if (ret)
+		return ret;
+
 	/* find the irq */
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-- 
2.48.1

