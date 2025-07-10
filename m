Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9203302067
	for <imx@lists.linux.dev>; Thu, 10 Jul 2025 21:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752181929; cv=none; b=gUgp7ZsEwU9bwR3LUknwFqEl7WCEfjgYCF0kIEoM9eGKF+qVcalTCpbUTsxEfB7ksS3Wetbc13s/ns1MmCcc8Upn8dB6wDHyEJaDyBAx9+K2/C3QbU5UuRJVOEeo38Lez0iKjtYXIV7iFuftWUwhvUP5vbZdCtAoVr1Yg/n/BO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752181929; c=relaxed/simple;
	bh=eYghFW8p4DYIUBCaUWp+/iE+HslCUlPDg0t9I+XyN/I=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=T5kNCvf43DA3ofIFORaD2offAoYjJwqNyHHsFqC2NFbXMkEBsOweq8HwrxE75TWpizAPwgPpHFiOJKLTzkumHGsIeGnRzg52lGtDfzdKMqHsXmzK77Gcb4ZNdReSrX9biPT0qswtYLip7QIK/wARnB5vruMnuL0OViWv5pwyEOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dRefkhYZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dRefkhYZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RMxn3qGVHET6C9gd+BL5oIIz2htkls+w6noefj8NRsw=;
	b=dRefkhYZeD9b8MQ6Wox6ZYPS9fLCUrkgVSVLq6QtbyuJzvCwBtQko7fikVC16iUowfV8HU
	e+b2oqmVqfq44nbA2EzSGtAQ88kwlapi+uIhlq8D7ZXuLBcgPJByOhLNm4BXOGMr/pqbtY
	QraLzEXmIj+MN+Rn2TQKpJzY2m0fZAY=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-RAmy2ywfNIeeCNDhOMRMxQ-1; Thu, 10 Jul 2025 17:12:04 -0400
X-MC-Unique: RAmy2ywfNIeeCNDhOMRMxQ-1
X-Mimecast-MFC-AGG-ID: RAmy2ywfNIeeCNDhOMRMxQ_1752181924
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3141f9ce4e2so2247221a91.1
        for <imx@lists.linux.dev>; Thu, 10 Jul 2025 14:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181924; x=1752786724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMxn3qGVHET6C9gd+BL5oIIz2htkls+w6noefj8NRsw=;
        b=HZqlVbDcs/mh2d+FN73CT8d+BqZvE0RI+d0yxAetSp9rIfhQY90vrs9MhIVDjeM6pS
         rjorFfkIXeGbXTDNGNb7j5L+i7ZthiVlW5sKzseszEkw9QjRPC0jyinkHAN9UL0O4tWA
         OmZfcF2G2U3UKU7VRqfLHwiZAr6wyVqmriD5t6/MuG1kIfs/EN+6c9CseyNBIkQ5/XdO
         7tOw/Aby4ayLnieg8vqe9AFHEJSAWtd8Oe4pVQSVyLvhPT3dv2riPeHVV4tN2iG2ffH7
         8ReEwL59qV3CYBzjA8wDW1YbgtHFH7eIDXydFIae+AVO5W5f+Jaz9qc4gLTCDmnBjCT/
         RHbA==
X-Forwarded-Encrypted: i=1; AJvYcCXsAlRrYareCb+gmbfQ0wpXRfuKgdR4gJRrq3OG/95NXVoZndJpJmUZjLOAPMTPO4/5gMg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKUiUbnfsxLHFSLkm/tvkbqawRCWXvABI18QUJq0knq8yo5G8i
	uI/6/quoJ10eyHVlxijGHXhAouIZvUui0e0I3IoM4m3Y/UJLsQQaUzgB4X4+flFP2KK2HVdrms9
	sKoDBp0/QlNmIar0HBFx6yWReOLJ9+3Ljsdj/uwwgkDio3TC7ad0PwA==
X-Gm-Gg: ASbGncvFAVCh12p7pXfuSZlEaC5SlEhlmIs7/g746IeFgdHMfTqVejO8wWF10KS3ZZD
	PzX/u9+lL5eq+5SN7TMcmzSMnjtv3G2m/ibmmPgvS2MatvpH4YfZIGLXt2VrdKQu4r88mx1gR1+
	kA1Fbh6Ca7y9w3nTPBZdiyEBoD9l/z/8Sf87a50CMA+f8MBvx06sbgFbx8eNts7WKZ2O+NnXxE8
	nShJW1OI1vb/0AhXH5qpqRMhT5bu4347PdH8Xb6kQw/f6WVHIdVBgH0Z7TomBxrdeo2YtQT2GaE
	aA5mg/ACO7uYEep35lsEd7pfMo7S
X-Received: by 2002:a17:90b:4b83:b0:311:e8cc:4248 with SMTP id 98e67ed59e1d1-31c4f5d782fmr180999a91.33.1752181923695;
        Thu, 10 Jul 2025 14:12:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZJwG4kbKUPKJJw9NlPg14COmpPc23m7MFfrg7F5+Wtg/2WFXr5ADA1o8ZCRL9BuYnk5dhrA==
X-Received: by 2002:a17:90b:4b83:b0:311:e8cc:4248 with SMTP id 98e67ed59e1d1-31c4f5d782fmr180978a91.33.1752181923366;
        Thu, 10 Jul 2025 14:12:03 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:12:02 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:44 -0400
Subject: [PATCH 12/13] clk: imx: pllv4: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250710-clk-imx-round-rate-v1-12-5726f98e6d8d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=3218;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=eYghFW8p4DYIUBCaUWp+/iE+HslCUlPDg0t9I+XyN/I=;
 b=GlygFKUJrkVpwE7GHwRPUG7uDzpRjwh+PDyr1kcDB3zP0XEHH7Gkt8tVur2GVkNuwZ24eg+r7
 k/5dyQToeGkBYWaTeEwsUjiUla04efU+hrImZBsDIo9uilD8+vVwD3U
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -wEEnQx6CNfCrgjg2dqTDyPojM00DpkMx_LVFDUaLUc_1752181924
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/imx/clk-pllv4.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/imx/clk-pllv4.c b/drivers/clk/imx/clk-pllv4.c
index 9b136c951762c23cb7424405e1a66ec70af57d5c..01d05b5d543852c9eb48d1ae2b63e8f32b4f4a89 100644
--- a/drivers/clk/imx/clk-pllv4.c
+++ b/drivers/clk/imx/clk-pllv4.c
@@ -95,11 +95,11 @@ static unsigned long clk_pllv4_recalc_rate(struct clk_hw *hw,
 	return (parent_rate * mult) + (u32)temp64;
 }
 
-static long clk_pllv4_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *prate)
+static int clk_pllv4_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	struct clk_pllv4 *pll = to_clk_pllv4(hw);
-	unsigned long parent_rate = *prate;
+	unsigned long parent_rate = req->best_parent_rate;
 	unsigned long round_rate, i;
 	u32 mfn, mfd = DEFAULT_MFD;
 	bool found = false;
@@ -107,7 +107,7 @@ static long clk_pllv4_round_rate(struct clk_hw *hw, unsigned long rate,
 	u32 mult;
 
 	if (pll->use_mult_range) {
-		temp64 = (u64)rate;
+		temp64 = (u64) req->rate;
 		do_div(temp64, parent_rate);
 		mult = temp64;
 		if (mult >= pllv4_mult_range[1] &&
@@ -118,7 +118,7 @@ static long clk_pllv4_round_rate(struct clk_hw *hw, unsigned long rate,
 	} else {
 		for (i = 0; i < ARRAY_SIZE(pllv4_mult_table); i++) {
 			round_rate = parent_rate * pllv4_mult_table[i];
-			if (rate >= round_rate) {
+			if (req->rate >= round_rate) {
 				found = true;
 				break;
 			}
@@ -127,14 +127,16 @@ static long clk_pllv4_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	if (!found) {
 		pr_warn("%s: unable to round rate %lu, parent rate %lu\n",
-			clk_hw_get_name(hw), rate, parent_rate);
+			clk_hw_get_name(hw), req->rate, parent_rate);
+		req->rate = 0;
+
 		return 0;
 	}
 
 	if (parent_rate <= MAX_MFD)
 		mfd = parent_rate;
 
-	temp64 = (u64)(rate - round_rate);
+	temp64 = (u64)(req->rate - round_rate);
 	temp64 *= mfd;
 	do_div(temp64, parent_rate);
 	mfn = temp64;
@@ -145,14 +147,19 @@ static long clk_pllv4_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * pair of mfn/mfd, we simply return the round_rate without using
 	 * the frac part.
 	 */
-	if (mfn >= mfd)
-		return round_rate;
+	if (mfn >= mfd) {
+		req->rate = round_rate;
+
+		return 0;
+	}
 
 	temp64 = (u64)parent_rate;
 	temp64 *= mfn;
 	do_div(temp64, mfd);
 
-	return round_rate + (u32)temp64;
+	req->rate = round_rate + (u32)temp64;
+
+	return 0;
 }
 
 static bool clk_pllv4_is_valid_mult(struct clk_pllv4 *pll, unsigned int mult)
@@ -229,7 +236,7 @@ static void clk_pllv4_unprepare(struct clk_hw *hw)
 
 static const struct clk_ops clk_pllv4_ops = {
 	.recalc_rate	= clk_pllv4_recalc_rate,
-	.round_rate	= clk_pllv4_round_rate,
+	.determine_rate = clk_pllv4_determine_rate,
 	.set_rate	= clk_pllv4_set_rate,
 	.prepare	= clk_pllv4_prepare,
 	.unprepare	= clk_pllv4_unprepare,

-- 
2.50.0

