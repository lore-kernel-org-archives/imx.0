Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C178D225797
	for <imx@lists.linux.dev>; Fri, 21 Mar 2025 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742560882; cv=none; b=fQGhXzcxIJYndPXE/eq1QuYge3JzWncC+88d5hGt7LULcyx/hAVpX3cd7/QfSCAHZ5eMLn69j8Vy68guC0scZzxctVAzuhxLP/rtsZ9+absoCzHfg3PjHZLOuGCHs9mwjB/9jFWwbRqKgUCBlSz4EBTvm5hJ1xk7x/oEwYAJIOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742560882; c=relaxed/simple;
	bh=QGBMCqw+5BdhL+voht3B+7pdNey58iclUXO+oz6ej8U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DmLY7IL/dZ9VSKZaANVMqzdHqcC+k3PhpKTZqxoojNP7XdEMLXofdfASC3QyLgjIPDbWC/jFryiA6mlzlpsl5yrOJ65Izdft2d2jCjKJ13FUXnpXHABovuyZJwvTgeW1jsdUoHayjQ4/J15zghl4roFR4+Hwt6Sd9VgFZdp5H8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDt9xYme; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDt9xYme"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-300fefb8e06so3624329a91.0
        for <imx@lists.linux.dev>; Fri, 21 Mar 2025 05:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742560880; x=1743165680; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=diANNUeYaMPdVTg7XPTc4czQqkwfrVpFES5HMSIw3o0=;
        b=kDt9xYmeraNlRdG/C+O3bbgdbwIYO9LafqOuNUGNYj8jGKI1Zt6SDp+rLXD4NHRf4g
         up4SsLVA0hXTS4kRzLUlxMZ9uv3/6L05/wOhTQW9yCbQVKhg+p+ucQPxUAN/9oTUMrJd
         R5Poj+gaadVrtE6kfNj3YHMMs2eu66xRrYxYLO6JzHAAnMy9pDiCnSRsRw0+KChCJw/w
         HH2kZ22N5z5nU1N+s5j6yS0uB3G8NvPq/Ro5A9KO49rNI8pLsalOjmiMsc24dY5QujOO
         2Ujz7jS7OyrWxAI0yb0JqgQi3Mh63eYc4ADIZE37P5WOg4a6BtXq4pWe9sFV5yBFy32a
         xlVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742560880; x=1743165680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=diANNUeYaMPdVTg7XPTc4czQqkwfrVpFES5HMSIw3o0=;
        b=deNHPIq4TMlmMnXpJ2g3T5vTkvQivfyu7nJ1eG2k+ocmHWOuQwYAWA8Q9gR61yF5AK
         8i/yFTf7z6tSxwM+f5i3GSIQYlpq3g3R/NuexCpPY1rV55kaCAHQFS6AlOGPlGvihuPV
         eBGZsvgx4p7GC/l3Gq30PgZmlXFyWwtkiXGyi/osTQCGcsqfIdWK5pAc0cgcmNisUFgs
         doacxPaN2dcHGSYTwc/9j1FR21xyoa2FDyQ+V84Ml/XKDMT27odNik1CBhW0tR0H26r1
         jq6L8108YWIVC1lBWpF10m6wA494CK9ZsegnxEagLitUXOTgaHTT+rIFfstPxB1Z+LBo
         R2MA==
X-Forwarded-Encrypted: i=1; AJvYcCWfLCSA7m5BSn++NRJS3hkDcBTTtWK32/q0rfs35k1PMrEja4U9tlTeYTvj+TRm+aAxj8U=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHSjJOEAGTeg110XU1BVNa+OU9DJXe34ZMPZbgJ2R1QooN/AG+
	kNt7ZTl5KQmBYiwPT0EGxyfSRHrvk/a6VaSgxbBsQr5Ko1I5kYPzJa8yQUw5
X-Gm-Gg: ASbGncsvrFhI0Bs/IXMNPSK6gUF0FBjJ9a81tnbzurxHEa4jVWlO6mMQYo5GZGE5vAe
	NLToLSZS1zZLlmjRPGHQZqFbm1UaBsEYrmKg3ZL+mPJN/bwKyerfR08smm/0cysKhnPZDiESYx9
	KZv0P1siZiyzLHo6VyacgV6TYDNBN27rBQmYK6bpTQlZKRbQO7Ab+6innJ6781r1Ofm5bx+wQnX
	0LZFbiGfcn5OTjDuFcu8vky3nW3ME2Hvo7YWBG1ODoWYjvln04W9PGKMFGrFuJDTddyflZlvfmQ
	BghvjOSmv51keMQq0VWsd33nXMh5sqwzKat5yYGHMH0/hYVBzE3ottKg
X-Google-Smtp-Source: AGHT+IGZilBpVbmHwXqE1RayB8VznKS8a5ZcQyaITGTBbOO5RAWktzmx/m01r2dAzCV2xhRFLinUDQ==
X-Received: by 2002:a17:90b:5826:b0:2f6:d266:f462 with SMTP id 98e67ed59e1d1-3030ff0df9dmr4523968a91.35.1742560879930;
        Fri, 21 Mar 2025 05:41:19 -0700 (PDT)
Received: from localhost.localdomain ([147.11.105.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf635929sm6424975a91.40.2025.03.21.05.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 05:41:19 -0700 (PDT)
From: Kevin Hao <haokexin@gmail.com>
Date: Fri, 21 Mar 2025 20:40:21 +0800
Subject: [PATCH 1/2] spi: fsl-qsi: Optimize fsl_qspi struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-spi-v1-1-b9939baa64b6@gmail.com>
References: <20250321-spi-v1-0-b9939baa64b6@gmail.com>
In-Reply-To: <20250321-spi-v1-0-b9939baa64b6@gmail.com>
To: linux-spi@vger.kernel.org
Cc: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Volker Haspel <volker.haspel@linutronix.de>, 
 John Ogness <john.ogness@linutronix.de>, imx@lists.linux.dev, 
 Kevin Hao <haokexin@gmail.com>
X-Mailer: b4 0.14.2

Reorgize the members of the fsl_qspi struct to:
  - Reduce a hole in the struct.
  - Group members required by each op (e.g., iobase, ahb_addr,
    devtype_data and lock) into the same cacheline.

Before:
struct fsl_qspi {
	[...]

	/* size: 176, cachelines: 3, members: 11 */
	/* sum members: 168, holes: 1, sum holes: 4 */
	/* padding: 4 */
	/* member types with holes: 1, total: 1 */
	/* last cacheline: 48 bytes */
};

after:
struct fsl_qspi {
	void *                     iobase;               /*     0     8 */
	void *                     ahb_addr;             /*     8     8 */
	const struct fsl_qspi_devtype_data  * devtype_data; /*    16     8 */
	struct mutex               lock;                 /*    24    32 */
	struct completion          c;                    /*    56    32 */

	/* XXX last struct has 1 hole */

	/* --- cacheline 1 boundary (64 bytes) was 24 bytes ago --- */
	struct clk *               clk;                  /*    88     8 */
	struct clk *               clk_en;               /*    96     8 */
	struct pm_qos_request      pm_qos_req;           /*   104    48 */
	/* --- cacheline 2 boundary (128 bytes) was 24 bytes ago --- */
	struct device *            dev;                  /*   152     8 */
	int                        selected;             /*   160     4 */
	u32                        memmap_phy;           /*   164     4 */

	/* size: 168, cachelines: 3, members: 11 */
	/* member types with holes: 1, total: 1 */
	/* last cacheline: 40 bytes */
};

Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 drivers/spi/spi-fsl-qspi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index 355e6a39fb41896f460e2474a90b8f0b42068ff3..efd87f44c63a5b12b76538aa459ca8eb203b9dcd 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -264,14 +264,14 @@ static const struct fsl_qspi_devtype_data ls2080a_data = {
 struct fsl_qspi {
 	void __iomem *iobase;
 	void __iomem *ahb_addr;
-	u32 memmap_phy;
-	struct clk *clk, *clk_en;
-	struct device *dev;
-	struct completion c;
 	const struct fsl_qspi_devtype_data *devtype_data;
 	struct mutex lock;
+	struct completion c;
+	struct clk *clk, *clk_en;
 	struct pm_qos_request pm_qos_req;
+	struct device *dev;
 	int selected;
+	u32 memmap_phy;
 };
 
 static inline int needs_swap_endian(struct fsl_qspi *q)

-- 
2.48.1

