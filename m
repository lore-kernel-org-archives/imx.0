Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F2F2FE31A
	for <imx@lists.linux.dev>; Thu, 10 Jul 2025 21:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752181925; cv=none; b=aNTLocuzo04gBhgr15j/8d1flWbYAE1p/cSvqAaoqrK2sbFITbFNebAI3huf5tOgduapqOjqpqsO2L4duCK6mp9xkDykbH89ytsnBvEfCdr3NHswlI5sfHCeuGtgOkZu4AgTXGsByIbjjuqLdHrxE8rW2+9eKN9u6gLAH/TjZVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752181925; c=relaxed/simple;
	bh=1Mnzs5hamHNwjD4eoe2Nc0Akysaiis/eMWjsRi17QtU=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=MlXxbhqMPUkNi0ethbWmOSFA33uBn0UEkwl9R70K87sz8fGbOfsvFX54CfM5nmCNLjL6E8eAv7BEBKvDTcZEEHMjuOiMwARzlVH7p4HB3sdWgS7YpFxMFYbSXgwGcfh7R70txaiw2W2CcwqmGiAGrQLf/X2z5IEZooJn9NPHOWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gk989lp0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gk989lp0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eec3UsfcgEVhhdwW54XSs3vkceSbxenv80rfbs7M6mU=;
	b=gk989lp0CI9KkIwsI/O584XE/5n7hMWuljQaywnkdoD6QQn0Ssk7HbNlseLKOBEpF0XDNE
	f8p4wNTHGENCYQ9+QB3lkRP1NopEGQSFl/ugYuAUh/pLdrKD1OkbVhC513BGZNm2Qhk/5M
	cgVQYjqbAuETEf+S7JDiQAzENEQ4nEE=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-TCK_41HZOEWrSs7twWtXOw-1; Thu, 10 Jul 2025 17:11:59 -0400
X-MC-Unique: TCK_41HZOEWrSs7twWtXOw-1
X-Mimecast-MFC-AGG-ID: TCK_41HZOEWrSs7twWtXOw_1752181919
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235c897d378so14348925ad.1
        for <imx@lists.linux.dev>; Thu, 10 Jul 2025 14:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181918; x=1752786718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eec3UsfcgEVhhdwW54XSs3vkceSbxenv80rfbs7M6mU=;
        b=NdQF7LEZ9Mlgc1xGtGSDFnm4CYTD00R+n/KvZwfkbAPhZK9EwqZk0XQ3E86A2r4CN0
         9NuMqFmCXZ4doUSWXKTGXFKQTudeus4fYv28393WCTa4zvgedZwhU063XAlnwUcZR8OH
         dhxlrzoIBJfZyZ99VMrJR/p5n/vt4koZGsLdbMrkgwUn1SeMJuw+5B6J9OTkZ+bx0VB0
         9eBX9B3niVPysDB29tWWysY1SwQQAZ21hnr/q4w/iZTJgLqYsE/KGwtd2wvIMx/7fDAi
         mv5ARCVCS1wkKKq/7SmIAc31uQc4KloS6+paQKex0VZ327i8gHhbtOyk0bVRJmeFML9D
         kEwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt3Hva9Fte25Dl635hLLXQ7/d+xddcitu+GJ/2b5GaBTZo7zh988AijTax0qXbjz948l4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwiHzmGlqZUxN2eJTlv6i8YIhbI6KiUlaKPBE5jIIQrDEMILRym
	0TUfhYJRVNZEJ2pQJAPohY0A1etI6xOeuyl868YDIcAHPmHbMoJwwshN8wZbjf2nkRhy78VZnoN
	SYrgtlsWzu/0/bJpSzAmouoUbZuzu0nGBVxDwWFW1dNS/fwLsR465aQ==
X-Gm-Gg: ASbGncuepGUhJpuZXqiidJIGdFSaaFcxfAThE8/1FRs/xohy+so8Do9ePVGevB0gwZ8
	Lh6lPzPsWRD/hQhlmQ0MBtvTF8i9ZB6Svsw7E5lYDlS0BbDwI4xW4GbkS3gbXaiBj4e7/SAVb8k
	tCKaCtpMiUDSmORRmvJhZoeCed/yHx2ffpHW7pqJ2kOwJsfy3zwJXtr2pzYzqLsD0dZ/RD1/a8s
	DrRb+vlvORrhXVFgJIGZOf4nxZat/k9NNcBPAOuEDmtippKMTYTA/Q2ITwqmTu3XoWwq6wtz8hM
	DynXhesrGoagjogXSvEtjvS2LathvB7XyA/wfL55ok+1lw==
X-Received: by 2002:a17:903:7d0:b0:23d:dd63:2cdb with SMTP id d9443c01a7336-23dede396f6mr7862435ad.16.1752181918568;
        Thu, 10 Jul 2025 14:11:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmMHFgZSFsF17fGhsct290lecnQH0glpDdFs3C6QEydqtsPPL9osBYSLMIUTdMcaqaL2jdsQ==
X-Received: by 2002:a17:903:7d0:b0:23d:dd63:2cdb with SMTP id d9443c01a7336-23dede396f6mr7862235ad.16.1752181918207;
        Thu, 10 Jul 2025 14:11:58 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:57 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:43 -0400
Subject: [PATCH 11/13] clk: imx: pllv3: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250710-clk-imx-round-rate-v1-11-5726f98e6d8d@redhat.com>
References: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com>
In-Reply-To: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=6011;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=1Mnzs5hamHNwjD4eoe2Nc0Akysaiis/eMWjsRi17QtU=;
 b=Bn0rholCUM/KYZ+bos9FZIULcmCDJf69FbJGhUfMqhda6v7HWW4+01F8FLLh7G1zCTp5fW4s+
 Pa/glVq7xHrAcqK/CA6g1MuafscKjAGR6zdGyQGptxfaNl1bj9mMzlm
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: saxKuyjIODhfm8BBN5Fh7B5MMj_fPdfTThGj1b1L-Mo_1752181919
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/imx/clk-pllv3.c | 72 +++++++++++++++++++++++++--------------------
 1 file changed, 40 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/imx/clk-pllv3.c b/drivers/clk/imx/clk-pllv3.c
index 11fb238ee8f0ece8116d3d7cebbbb7deaa4aee68..b99508367bcb4d7f3ef12cdbb5f5d5dcbf526c31 100644
--- a/drivers/clk/imx/clk-pllv3.c
+++ b/drivers/clk/imx/clk-pllv3.c
@@ -117,13 +117,14 @@ static unsigned long clk_pllv3_recalc_rate(struct clk_hw *hw,
 	return (div == 1) ? parent_rate * 22 : parent_rate * 20;
 }
 
-static long clk_pllv3_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *prate)
+static int clk_pllv3_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
-	unsigned long parent_rate = *prate;
+	unsigned long parent_rate = req->best_parent_rate;
 
-	return (rate >= parent_rate * 22) ? parent_rate * 22 :
-					    parent_rate * 20;
+	req->rate = (req->rate >= parent_rate * 22) ? parent_rate * 22 : parent_rate * 20;
+
+	return 0;
 }
 
 static int clk_pllv3_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -152,7 +153,7 @@ static const struct clk_ops clk_pllv3_ops = {
 	.unprepare	= clk_pllv3_unprepare,
 	.is_prepared	= clk_pllv3_is_prepared,
 	.recalc_rate	= clk_pllv3_recalc_rate,
-	.round_rate	= clk_pllv3_round_rate,
+	.determine_rate = clk_pllv3_determine_rate,
 	.set_rate	= clk_pllv3_set_rate,
 };
 
@@ -165,21 +166,23 @@ static unsigned long clk_pllv3_sys_recalc_rate(struct clk_hw *hw,
 	return parent_rate * div / 2;
 }
 
-static long clk_pllv3_sys_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int clk_pllv3_sys_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
-	unsigned long parent_rate = *prate;
+	unsigned long parent_rate = req->best_parent_rate;
 	unsigned long min_rate = parent_rate * 54 / 2;
 	unsigned long max_rate = parent_rate * 108 / 2;
 	u32 div;
 
-	if (rate > max_rate)
-		rate = max_rate;
-	else if (rate < min_rate)
-		rate = min_rate;
-	div = rate * 2 / parent_rate;
+	if (req->rate > max_rate)
+		req->rate = max_rate;
+	else if (req->rate < min_rate)
+		req->rate = min_rate;
+	div = req->rate * 2 / parent_rate;
 
-	return parent_rate * div / 2;
+	req->rate = parent_rate * div / 2;
+
+	return 0;
 }
 
 static int clk_pllv3_sys_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -207,7 +210,7 @@ static const struct clk_ops clk_pllv3_sys_ops = {
 	.unprepare	= clk_pllv3_unprepare,
 	.is_prepared	= clk_pllv3_is_prepared,
 	.recalc_rate	= clk_pllv3_sys_recalc_rate,
-	.round_rate	= clk_pllv3_sys_round_rate,
+	.determine_rate = clk_pllv3_sys_determine_rate,
 	.set_rate	= clk_pllv3_sys_set_rate,
 };
 
@@ -226,10 +229,10 @@ static unsigned long clk_pllv3_av_recalc_rate(struct clk_hw *hw,
 	return parent_rate * div + (unsigned long)temp64;
 }
 
-static long clk_pllv3_av_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *prate)
+static int clk_pllv3_av_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
-	unsigned long parent_rate = *prate;
+	unsigned long parent_rate = req->best_parent_rate;
 	unsigned long min_rate = parent_rate * 27;
 	unsigned long max_rate = parent_rate * 54;
 	u32 div;
@@ -237,16 +240,16 @@ static long clk_pllv3_av_round_rate(struct clk_hw *hw, unsigned long rate,
 	u32 max_mfd = 0x3FFFFFFF;
 	u64 temp64;
 
-	if (rate > max_rate)
-		rate = max_rate;
-	else if (rate < min_rate)
-		rate = min_rate;
+	if (req->rate > max_rate)
+		req->rate = max_rate;
+	else if (req->rate < min_rate)
+		req->rate = min_rate;
 
 	if (parent_rate <= max_mfd)
 		mfd = parent_rate;
 
-	div = rate / parent_rate;
-	temp64 = (u64) (rate - div * parent_rate);
+	div = req->rate / parent_rate;
+	temp64 = (u64) (req->rate - div * parent_rate);
 	temp64 *= mfd;
 	temp64 = div64_ul(temp64, parent_rate);
 	mfn = temp64;
@@ -255,7 +258,9 @@ static long clk_pllv3_av_round_rate(struct clk_hw *hw, unsigned long rate,
 	temp64 *= mfn;
 	do_div(temp64, mfd);
 
-	return parent_rate * div + (unsigned long)temp64;
+	req->rate = parent_rate * div + (unsigned long)temp64;
+
+	return 0;
 }
 
 static int clk_pllv3_av_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -296,7 +301,7 @@ static const struct clk_ops clk_pllv3_av_ops = {
 	.unprepare	= clk_pllv3_unprepare,
 	.is_prepared	= clk_pllv3_is_prepared,
 	.recalc_rate	= clk_pllv3_av_recalc_rate,
-	.round_rate	= clk_pllv3_av_round_rate,
+	.determine_rate = clk_pllv3_av_determine_rate,
 	.set_rate	= clk_pllv3_av_set_rate,
 };
 
@@ -355,12 +360,15 @@ static unsigned long clk_pllv3_vf610_recalc_rate(struct clk_hw *hw,
 	return clk_pllv3_vf610_mf_to_rate(parent_rate, mf);
 }
 
-static long clk_pllv3_vf610_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *prate)
+static int clk_pllv3_vf610_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
-	struct clk_pllv3_vf610_mf mf = clk_pllv3_vf610_rate_to_mf(*prate, rate);
+	struct clk_pllv3_vf610_mf mf = clk_pllv3_vf610_rate_to_mf(req->best_parent_rate,
+								  req->rate);
+
+	req->rate = clk_pllv3_vf610_mf_to_rate(req->best_parent_rate, mf);
 
-	return clk_pllv3_vf610_mf_to_rate(*prate, mf);
+	return 0;
 }
 
 static int clk_pllv3_vf610_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -389,7 +397,7 @@ static const struct clk_ops clk_pllv3_vf610_ops = {
 	.unprepare	= clk_pllv3_unprepare,
 	.is_prepared	= clk_pllv3_is_prepared,
 	.recalc_rate	= clk_pllv3_vf610_recalc_rate,
-	.round_rate	= clk_pllv3_vf610_round_rate,
+	.determine_rate = clk_pllv3_vf610_determine_rate,
 	.set_rate	= clk_pllv3_vf610_set_rate,
 };
 

-- 
2.50.0

