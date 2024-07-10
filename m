Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E86A19345A
	for <imx@lists.linux.dev>; Wed, 10 Jul 2024 14:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720622116; cv=none; b=QcYZ8opWg0+Fv31ZsgDsXEq/6DYTqdziKs8xCtmbWyPCFNjrd3drPjZqGyGfbozxIiJWdYzabpmMrdPUyQNsIMY8sfVFf/9NAUCB5Hp1U/2kc/L0fQ9TsnSxKWzS3mKrjiw2yLHBGIXnrIbhKTUR8tBdFTQcUfc47wB1h28B9CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720622116; c=relaxed/simple;
	bh=9jooIyIr/HyUzJS6LzsDZvXen5wuwqO3O1aOewsFVTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OrsGVpbNn2B74Gzu9FR00jiowYbwaJQ1rlltmxjFwkQQyhP62FCmxXggpcgNmzsI2C7Ad5RKKrtQMew1HwNceC1kKheikHHza9Trp12s39MClLycMYbKhNbjRvbxR/JFbLWtN0e5AgWrUJPr0B7YZJX8zm92OFg/cCvSEJlpudA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com; spf=none smtp.mailfrom=toblux.com; dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b=BATQPZN7; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toblux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=toblux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toblux-com.20230601.gappssmtp.com header.i=@toblux-com.20230601.gappssmtp.com header.b="BATQPZN7"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4266eda81c5so21426525e9.0
        for <imx@lists.linux.dev>; Wed, 10 Jul 2024 07:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1720622113; x=1721226913; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+0yIikCD08oMheZij8lHE8qY8gpPceCppKq1cqRcAo=;
        b=BATQPZN7qYvSUtXl7rjlrLJ5jou0/KLY9rS0BdTNjtNpN2PPfqNgy8D+jq0iFVRkxT
         LU25MwTlRDAEaBjz5k/I4dsSf4lslPE/qfRn99uxBJei8o9WOQfd/wwM8arTX2CYbaOB
         DJusOhqHfEmlcva9uOJdkRI3xqeeoyeRIazBdWW8sS+GtQuB8tvyuBOLjqqu7Uj08iwe
         sNkRMutTIKKH3uhPocAGsJxQV/h2p1Smexjak1a6S2n/l+eivA12WMfUAgBMQskU4e0S
         V71T8iM7vgp3oxyDTDp+gw3dmCmUuExDVcovOpXxkSTbYfjHAweEUcFpLQi0qD1m+OAR
         Lv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720622113; x=1721226913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+0yIikCD08oMheZij8lHE8qY8gpPceCppKq1cqRcAo=;
        b=UsGR33hyI6Bo+g2V42YouIIZjncUbsqgrMypf2AYBQKycHA6AxBT/DVuKAU4cFc82P
         531d5fSbThZXcRrPCaB7N0Zpl6+RzTPcnNl/5t8+BUpQbmx62oG+OSZiW4ma8wReVjOF
         yFbIlLfAMDdVEz8AcVfQpU86pdL7Lh2h2YfAkL3J9V/IEuDJ7GYtSsNMu4ZRRAGmGRch
         5rM76wovuJTx5rGAOWuJSbOjhW4X32rMam10x3dCGTw5nl7+yM45ECs6LAQ1cp/nwoE4
         s8WGlvxGzHNBKF1M+vGUWrfHl0ABPY8r5CAVOV6sUzax79VJThZKClARCVzQ1lChro8f
         LEeg==
X-Forwarded-Encrypted: i=1; AJvYcCUF4Up1PyCkngZVdKzYud5YCZ1e0l1ixgRhGljSkRurT/J256jJ31s25wzz+3GlJ+Byz0CyxbYcD3U46xjYkjCQ7P5K
X-Gm-Message-State: AOJu0YxF5ZnyZgkKzu9q8lp2RcnQ/VbCVYXXJ8VR8whlkQ4Uj14E3Vhw
	sg32Ftx6eoiwRGxm093QCdDfkUi6AozGaX6nD8Z0isaosOJ1cZEQGkwlp3XTwbY=
X-Google-Smtp-Source: AGHT+IGGyG6eoSg+EDRDbPNkiAakf/Y71Bv3rcFVrUCzswdv8GYcPnvEmlqukEaNZ6hBPV6Mku68+A==
X-Received: by 2002:a05:600c:4312:b0:426:6857:3156 with SMTP id 5b1f17b1804b1-426707f8580mr44315485e9.27.1720622113357;
        Wed, 10 Jul 2024 07:35:13 -0700 (PDT)
Received: from fedora.fritz.box (aftr-82-135-80-26.dynamic.mnet-online.de. [82.135.80.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6e097bsm85925025e9.6.2024.07.10.07.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 07:35:13 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@toblux.com>
Subject: [PATCH] clk: mxs: Use clamp() in clk_ref_round_rate() and clk_ref_set_rate()
Date: Wed, 10 Jul 2024 16:33:10 +0200
Message-ID: <20240710143309.706135-2-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use clamp() instead of duplicating its implementation.

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 drivers/clk/mxs/clk-ref.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/mxs/clk-ref.c b/drivers/clk/mxs/clk-ref.c
index 3161a0b021ee..2297259da89a 100644
--- a/drivers/clk/mxs/clk-ref.c
+++ b/drivers/clk/mxs/clk-ref.c
@@ -66,12 +66,7 @@ static long clk_ref_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	tmp = tmp * 18 + rate / 2;
 	do_div(tmp, rate);
-	frac = tmp;
-
-	if (frac < 18)
-		frac = 18;
-	else if (frac > 35)
-		frac = 35;
+	frac = clamp(tmp, 18, 35);
 
 	tmp = parent_rate;
 	tmp *= 18;
@@ -91,12 +86,7 @@ static int clk_ref_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	tmp = tmp * 18 + rate / 2;
 	do_div(tmp, rate);
-	frac = tmp;
-
-	if (frac < 18)
-		frac = 18;
-	else if (frac > 35)
-		frac = 35;
+	frac = clamp(tmp, 18, 35);
 
 	spin_lock_irqsave(&mxs_lock, flags);
 
-- 
2.45.2

