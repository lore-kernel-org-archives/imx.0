Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FFC22156F
	for <imx@lists.linux.dev>; Sat, 30 Aug 2025 13:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756560410; cv=none; b=Vder41/YvN1/he+PBFEPHdplimmBavnYnsDQEyxa1QChiNgD4rEsPuvX/AeKkwUXAqWB+A0y4DbujFzABhpoWBA3oWnUZ7DO55lm/Neuha9AuF0iyPNom4xYT636/CVy5DouzJ/tVFmwg0MZzjI7/MO5eQPbCI+SXcixSdkPDfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756560410; c=relaxed/simple;
	bh=2izd0kceAmlc4wGTcooA5uDIAJkg31ZnD/ThRwr30Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ge2U4oLtCfGyaIhBTyqnPY6qR/Fab6ocfCrMIT41KvhnpWp72z4v/pocw9O++2KYxSsMd4Lany5jUw1s7oPU5NsruqzKKITVsJP23FHJ343cNvReLZd40TQVUhQco8B8jQOPzPPNhKRAPnRrurgZpfAqBSmKJDc/ZNsJzd/Ymcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgoJG1Hu; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgoJG1Hu"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4b32384e586so1927671cf.0
        for <imx@lists.linux.dev>; Sat, 30 Aug 2025 06:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756560408; x=1757165208; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QS8izAcIpePONpdRiDr0Q2OS2iBDSnSdZTmJA4AydsM=;
        b=DgoJG1HuW578lF17v7k3pfqGETOSgF02/HPAlLYQi5aAZIy3b6u7Gf40aWKRXv+tNt
         xzMANFV5ewF1K+OK+XXStyHXunIflVXZiI5j1l+vxwgRmt2CZbtCfYxY9qxABiBF2n/T
         pwmV5aTHmHYytIGeH3wqWG7E54Xt9sQ+MWUyv7Dhmkh8OJ0uR9nM9TzT3SjAPtYnHeIR
         nn4+xYq9iyR3RbT/3I/aHdZfF6rV8X0M8KSGuXap3+Xi6UvpnWbxHQ8hPWAA8Vp0AlKW
         mnzS1HJzoG/Bvilm9z4cF1TDg3H0JTWhXtFVcHrlSoccM/WKEIBmGluP8JqCFrrbGRrN
         BVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756560408; x=1757165208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QS8izAcIpePONpdRiDr0Q2OS2iBDSnSdZTmJA4AydsM=;
        b=Iphe6hUFcfLriFCA6MjJGPwmjH+f5aIJF8x2Cqv4BJDHNr7PtY09ObkIalCGxMVKKP
         CyWdRYAA5qumwwxBirGOBvJJnEbH/yENHBHlVjoe+XpZ8ArVjjtwV583YhWQGISoxkEC
         A8zHXPZMmNyoLzSZbBmVsVe85Ses5KEarBnpvmMK4tXS655a+9g3eVLboH9Fs+6qqWaa
         YxHh8MH8adRjLoLUoKQJclTqIiDIyT8uWjxWDqVGwCxJmwsc5UPu6kLDwIXUBn+lLvbn
         dreWUPK5dn3iDXGOK7G6XDzKAbgc5fXPiAzZCYYFtvfoGZniK6Y89xKjFW7Kv8gvByj4
         hYAw==
X-Forwarded-Encrypted: i=1; AJvYcCWDLCFvON7i99UxzwNj78BAVC2uCSDi9gRoQNUTIFiBnY/DRG7Wirldxr6I7tizWDLd/MU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyp5cJF5iZ0kfzT6EtwQ5i4ZMLd5KF5ztmmp9eHNnUOiyllYwzr
	KhZ88DwwCHYav9axfz5eieQuFGN2Bb3fV5ub774xsg0FIQSjb9/pajhY
X-Gm-Gg: ASbGncugJN+0W0y2emCqPiXrwSKIck4uNK9Ju9fOsDqfGIU8TRuR9j1Ig+8wZ2ea/oT
	VS9dQmwOHLWTrAFqFL9dZ1FsnVqDWtL/8RpkOyoy8bZ1V1cxM8GlHymTCOx2G9S1134MnV51lTI
	tziyBs4inPuPvLSfyCZ03uqIDhJwnMk63GwoW0PTDnbUGri0zoLqyxOHiobPJ5MerE9pMa4tby6
	shv7Ary1s2QC+KQ/ZzGCDPcCSQeQNQfM+onPFVcgNkg77mlDJ/3RIvT0JP+BVZBJjR2kqwbdx2a
	/Em71If/TS74E1OCjsh9xw3z139D+hziXiWxc7/tWEN8aHB3TD/dgrujqNcmlBZOXUXUFTyMnIG
	ReVjVpvFphNOUatRNEfvBpxalGDlhZJnljO//z22dcNIwEaqkN+ckRHk+aAbMp14OYfaF
X-Google-Smtp-Source: AGHT+IE6zrU6iyUqcFmJvQ9qSLszP/NdRcQFyUgfus/aUtp96mxi5yjEyOyOpURIPS+atAgLgNl/HQ==
X-Received: by 2002:a05:622a:1812:b0:4b2:94e5:9847 with SMTP id d75a77b69052e-4b31dcac538mr27405641cf.74.1756560408196;
        Sat, 30 Aug 2025 06:26:48 -0700 (PDT)
Received: from cr-x-redhat96-nsd-2.fyre.ibm.com ([129.41.87.0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b30b6b9683sm30936871cf.39.2025.08.30.06.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 06:26:47 -0700 (PDT)
From: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
To: vkoul@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Subject: [PATCH] dma: Replace zero-length array with flexible-array
Date: Sat, 30 Aug 2025 06:26:33 -0700
Message-ID: <20250830132633.1803300-1-chelsyratnawat2001@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/process/deprecated.rst suggests that zero-length
and one-element arrays are deprecated, flexible-array members
should be used instead.

Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
---
 drivers/dma/imx-sdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 02a85d6f1bea..ed9e56de5a9b 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -256,7 +256,7 @@ struct sdma_script_start_addrs {
 	/* End of v3 array */
 	union { s32 v3_end; s32 mcu_2_zqspi_addr; };
 	/* End of v4 array */
-	s32 v4_end[0];
+	s32 v4_end[];
 };
 
 /*
-- 
2.47.3

