Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241862FEE3A
	for <imx@lists.linux.dev>; Thu, 10 Jul 2025 21:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752181906; cv=none; b=oegXKW10I2yD3WRkLSq07NbsiYYM+PVFSSw1Xuf/JoiF6LxwgjQXFfFO9dILvh7y1mhw3Ex1s4zGra22ZOFXgt7r7SJnQEVqB87PlI8oiusayn7MbPzIWtRsdODuOG/7zgHkXsamGwmTJVKZvsLlPmZU9I5zNnUs4pnQaX6LHm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752181906; c=relaxed/simple;
	bh=NGioEqdKfaiC6BdH82T/f7jr0ImhDC6mx8MiIxU4MxA=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=WvNpivV9rdU6cTq12MUV+2Ms2HkZiRm1lSgG9btZFRy4trvMgPYPddZHy4jE9kaM58MJ69EzSM5PVuM21Tp6hUeAEQhjZOFlp+FynBEQBvWtY0lw1oPRbGaPM7djUIXjoL0DCYP/tmgWm/csZ6qnsiPoiKygxxYuRDBqUnjwX30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gnPl4mGO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gnPl4mGO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W339JZdcr7UmhBbOcIPiqXu+Gdd7sYxPv9WXyGXxLMY=;
	b=gnPl4mGO7mfNJtIerlB0w0w+v+0h20wChY6S6Hl2UvppITgmokgFLB8eY/TQHWbGxnz5Rw
	On/DHmfF7EzTSsWfOtdUOah8WK/NCQvDjb6Qfe/v5H/tOU7Gn5HfQNy27aWLwKrKZ35al1
	B7n6dgzyjC2ajMT9uAPWsQ8Gt7X+c3Q=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-jcyvHIGtOxSJZnEkeTraOQ-1; Thu, 10 Jul 2025 17:11:41 -0400
X-MC-Unique: jcyvHIGtOxSJZnEkeTraOQ-1
X-Mimecast-MFC-AGG-ID: jcyvHIGtOxSJZnEkeTraOQ_1752181901
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2356ce55d33so20839185ad.0
        for <imx@lists.linux.dev>; Thu, 10 Jul 2025 14:11:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181901; x=1752786701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W339JZdcr7UmhBbOcIPiqXu+Gdd7sYxPv9WXyGXxLMY=;
        b=F42mq7+FLLuslk3HmyuuDrdCEJu22ItHUxjrNL0u+lC4WeP8YX2592FK+8XjUp9f0g
         OV3Kx34rxIUV3fSgHi2VBuBvjlawBXVLEPjioOcliDKSOpFAMf5gOlbiRWkXc9TF6bYv
         l78rHVhU4gJx18AWwLvPnz0ZD6f3tOieMMY67HhpHgKJeeikPGXaBA2eqOHXiU/2ncZQ
         6zNlIEFLJhEMTpOpwx6tJN9b6spa7MSL8P81D06ir97VRoIR6APvCt5xc/OVSVEfwWhB
         d1qrXr8I/lFRN0JSuLQuNe1q1qyfDal7QCYUj106ka8qCY1zrxFJfif4ouWcycxfGQ1z
         cjSg==
X-Forwarded-Encrypted: i=1; AJvYcCW/qRvtsT9hQXvBO2wfmtc5NombYNWlUrgVehyAVw2gsVjDKmw8SMdUIjTWQmGhN+Pc2AE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzURqvo3Q5VkBXdipCIi/CEFCtHTcpXevDXi5kXOlBPYAcTy/bw
	GyumIgzk8tzndDukjlv70Hc2z1x7ACLqwPsCcLvxhzYdvvBKJCpT+jjmIoeR4Tv1f42be6bP132
	z+LXw/8p33rZu42mloxUSLkhd1+RfvoJ5ZLQlukjmABkr1RUZ+5TSEw==
X-Gm-Gg: ASbGncvRYDGMib97yNlrvRDXVGhuiSglMbB2XDzTPaeWhYaWoD85vfKg81tcMw4+qdf
	YZStb5GTbHuZJNA3npoz+2fCnwZq9PPy7fUXJnB6b/Bp53jYKZ1SwzfNRmW//gfzFGzQvbKmga/
	XbBDZtdGjqcH4PkBN0lZGGMSwIAzDXCKA2SzZ/3hcevNnKomlUvKPQCy829S1ICZatG9yX7XD0w
	c/qEspxQR9t7/7GTIWDEIyvL0o2YO3YYzaJy98wGXX7XnNntyi1URgbk8pV/Se9102P45qRYi4V
	fd3I+gUTYhWHDj2PTy4Am/8259Bm05U60xdCIsiagNL9Tg==
X-Received: by 2002:a17:903:11c8:b0:234:cb4a:bc48 with SMTP id d9443c01a7336-23dede81d32mr8954735ad.31.1752181900877;
        Thu, 10 Jul 2025 14:11:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVxsG4cF9e07o0fMM8SypmofzmmXFkufyYymThzTUMbMJcOt8FiqD1GLXyQH26eIqaxdUn2Q==
X-Received: by 2002:a17:903:11c8:b0:234:cb4a:bc48 with SMTP id d9443c01a7336-23dede81d32mr8954465ad.31.1752181900538;
        Thu, 10 Jul 2025 14:11:40 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:39 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:39 -0400
Subject: [PATCH 07/13] clk: imx: frac-pll: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250710-clk-imx-round-rate-v1-7-5726f98e6d8d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=1965;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=NGioEqdKfaiC6BdH82T/f7jr0ImhDC6mx8MiIxU4MxA=;
 b=vLaVKR/Gomur36zH3CqP5lEgRbRlTdzb1/EbzNsI0+mDIrE5MvniljGNo8RYbLE5lZaLSopai
 jwWqi5WbNQ1DJdufnQA1SGqyhwTLz/HV1JEu8Gcj2ppy3By4Yvi6s/v
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rq-pSSYH9ef_Hh5twNaH5MgXls4pFdnlkfOuwP_9Xe0_1752181901
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/imx/clk-frac-pll.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/imx/clk-frac-pll.c b/drivers/clk/imx/clk-frac-pll.c
index c703056fae85cca492b2edcfaadab58fd13c6b5a..eb668faaa38fd085f90bd1c01811e0deba5d0102 100644
--- a/drivers/clk/imx/clk-frac-pll.c
+++ b/drivers/clk/imx/clk-frac-pll.c
@@ -119,19 +119,19 @@ static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
 	return rate;
 }
 
-static long clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *prate)
+static int clk_pll_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
-	u64 parent_rate = *prate;
+	u64 parent_rate = req->best_parent_rate;
 	u32 divff, divfi;
 	u64 temp64;
 
 	parent_rate *= 8;
-	rate *= 2;
-	temp64 = rate;
+	req->rate *= 2;
+	temp64 = req->rate;
 	do_div(temp64, parent_rate);
 	divfi = temp64;
-	temp64 = rate - divfi * parent_rate;
+	temp64 = req->rate - divfi * parent_rate;
 	temp64 *= PLL_FRAC_DENOM;
 	do_div(temp64, parent_rate);
 	divff = temp64;
@@ -140,9 +140,11 @@ static long clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	temp64 *= divff;
 	do_div(temp64, PLL_FRAC_DENOM);
 
-	rate = parent_rate * divfi + temp64;
+	req->rate = parent_rate * divfi + temp64;
+
+	req->rate = req->rate / 2;
 
-	return rate / 2;
+	return 0;
 }
 
 /*
@@ -198,7 +200,7 @@ static const struct clk_ops clk_frac_pll_ops = {
 	.unprepare	= clk_pll_unprepare,
 	.is_prepared	= clk_pll_is_prepared,
 	.recalc_rate	= clk_pll_recalc_rate,
-	.round_rate	= clk_pll_round_rate,
+	.determine_rate = clk_pll_determine_rate,
 	.set_rate	= clk_pll_set_rate,
 };
 

-- 
2.50.0

