Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C817B1DE2DC
	for <imx@lists.linux.dev>; Thu, 24 Jul 2025 03:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753327541; cv=none; b=FDPmx9dVUgj/kvASH5QKTsotXexBFx/Sdwl5Irk4ks2bmS4fjzIKaj6unpfIRnSrBz4ZubveO26azW3aya3iSkhfAuNEMXYNEkQ/9WGBIIYvyKJQI2BW7OIgzg/ZSPCi6zS0jG4W3kYY1+J7x2dPLP8vqZEpYcGjPhZEYSc7h7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753327541; c=relaxed/simple;
	bh=efbE91mXDP2/1Bi3Ip6H72JhYzu0xOb9xHFk5TOQ2ro=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=EmkTG0DXwgEPXfX5N3GdkagOssdJHNIHujJt8LOUqrLylW52NaOi0hVJSCBB6UQ9BnuqksvqqQFAIR53l/7uX6ITkqupYZqjE/GcfNyaeB5l9AJlE8XTyoD0V2LVyfO6/G1qDrDo/Ddu6HcXmYvH/gT7/8PQHRDfe0bbBuJMU2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CtGBGSD4; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CtGBGSD4"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7e62aeb0f5cso2035885a.0
        for <imx@lists.linux.dev>; Wed, 23 Jul 2025 20:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753327538; x=1753932338; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6wVDs/1wpqhDY4HcSZTV4ZWp0eLuVHcvYN7ua0ivt9Y=;
        b=CtGBGSD490dqIxqWtSvQZtI0vYpPODBeWOysSkz5LWrLZBzsqH8DiLPiYz3ocpV+g7
         t+BnvyeseQTEw0PEo+sUFp+1ICn+h5fW2QPBDEWGi6uWedsYp0SYjS3ndugn736vSMeX
         9JvhOb7bWqQKdqwcgnstTY7693QYimBdo3khVXxqtkZQAuo4dP4ptbZn7ciD1tLhernd
         mcD8XmiM/74L7TrjxmnylLpkdAfymwEx9WKtfvmYMneo5Yh5//6919HFaOddj7Bsz2Uq
         pHFypWeOiwLrNYz/6m8AT1dhlNuZR6po7ArpYA1+woOQlylHsaX5kSg3nEl+9YooTUz7
         g1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753327538; x=1753932338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6wVDs/1wpqhDY4HcSZTV4ZWp0eLuVHcvYN7ua0ivt9Y=;
        b=t0Bcw2lHAZFA6mC45TYwL1lU2YOQBSgrujd7Icp3+4z72/84ck1B0qBTf1PGfm1dhL
         ragOI6ECafyHq3mCkqdFH/JLTXiQhWs8YZQ3KjZW5PNA83I6WgLi0ZUs1K6jl4dsWF0I
         Emw+CiVvEiGFFI9VveXgrbN48CsKPvvySXUuS/wt966yka58uUQWA7nex3NcE6h4ARBo
         DGioHOu9aiPoloRHV7Q+RUehfGTqMNGodqe50/WTtjWcNhUGwKmxnvA0nQOSKDiiPUog
         3bSEGqre0jcGL7BkmxT7Ehc6HwtW604W3OGTgsIGKjv+dmTGW8v3xH1m/MNGdHy8OcUz
         MsGA==
X-Forwarded-Encrypted: i=1; AJvYcCX+f6IaIBrX4RSQuruqehaZKqjk/NewnXlKxdTMiZ7mF+z3f4N9bFSnwDKAddaqXPlnPkU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyhyz4ZilAH0DaGrkRPPdPfMAABYydt0rPMwF/CmpJY51F3heNN
	vyhX9DMh3lP0Dk2XEv+lH0AVN2V6p17X6624JW6ZjaMrpQ0mK6s9Ep5La/st
X-Gm-Gg: ASbGnctNX1zTMtpoHz4AsV4Otl1FB0fHgIMUbr4HSE2vNubqimtVzGuum3xz1Nuxfjf
	VVtavkhW2aTcwvaViWm23NIpzHBof3URDx0Y5k4sC8IOtPZ4GLznB7dfnwoIqPWbuPm5YTkZT6Q
	rsc7LoTljvmm0j1BfAyRQ1xPx4jX1OsemnbfmWXYlRmV8OuC1pOfzVRh0ROe6MMOWu89NX8n641
	mvY0+o9dVV7mtaPHQJ362lsjkCe4MFw4ZKpFaUoCrrleicxPDnqaVi/tXbfKuDg6JvEqclxRtZR
	fW4NTa11SW5au5mkU+7u0ThHUrShR4kkrtVoyMCsenOHxuykkT5kN201tfUXAp6hgx9zrjUuJf0
	yUUHXOB6IMsdAzUsPXkA=
X-Google-Smtp-Source: AGHT+IHGnu+YAjFvpNlXoLdms3urmPpO5CFALkcBe0mKnj1jUfEF3394xo2fVnScG0OOVxyFL1h9pw==
X-Received: by 2002:a05:620a:4687:b0:7e3:328f:61fa with SMTP id af79cd13be357-7e62a1410a7mr262258185a.5.1753327537421;
        Wed, 23 Jul 2025 20:25:37 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e632d4d48fsm54145685a.2.2025.07.23.20.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 20:25:37 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: s.hauer@pengutronix.de,
	deller@gmx.de
Cc: kernel@pengutronix.de,
	shawnguo@kernel.org,
	festevam@gmail.com,
	msp@baylibre.com,
	plagnioj@jcrosoft.com,
	linux-fbdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] fbdev: Check fb_add_videomode to prevent null-ptr-deref
Date: Wed, 23 Jul 2025 22:25:34 -0500
Message-Id: <20250724032534.1638187-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fb_add_videomode() can fail with -ENOMEM when its internal kmalloc()
cannot allocate a struct fb_modelist.
If that happens, the modelist stays empty but the driver continues to
register.
Add a check for its return value to prevent poteintial null-ptr-deref,
which is similar to the commit 17186f1f90d3
("fbdev: Fix do_register_framebuffer to prevent null-ptr-deref in fb_videomode_to_var").

Fixes: 1b6c79361ba5 ("video: imxfb: Add DT support")
Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
---
 drivers/video/fbdev/imxfb.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/imxfb.c b/drivers/video/fbdev/imxfb.c
index f30da32cdaed..a077bf346bdf 100644
--- a/drivers/video/fbdev/imxfb.c
+++ b/drivers/video/fbdev/imxfb.c
@@ -996,8 +996,13 @@ static int imxfb_probe(struct platform_device *pdev)
 	info->fix.smem_start = fbi->map_dma;
 
 	INIT_LIST_HEAD(&info->modelist);
-	for (i = 0; i < fbi->num_modes; i++)
-		fb_add_videomode(&fbi->mode[i].mode, &info->modelist);
+	for (i = 0; i < fbi->num_modes; i++) {
+		ret = fb_add_videomode(&fbi->mode[i].mode, &info->modelist);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to add videomode\n");
+			goto failed_cmap;
+		}
+	}
 
 	/*
 	 * This makes sure that our colour bitfield
-- 
2.34.1

