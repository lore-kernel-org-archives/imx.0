Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9610301147
	for <imx@lists.linux.dev>; Thu, 10 Jul 2025 21:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752181920; cv=none; b=fKdmaSPhZ8u4JyT7GXDX58zz7mzUTfIWLs/7EVh5IQtUoD0DzdjmzqM7sy8pCYwIjl8hFSrSnyBmJkDT3FXegH5mmuXtmAC4uuooe+J2cOyckxr3kD64J8OzFqRN2ZV/vtnd2GVlh4eg4h3ESBL/OuUgsFpgb9ksHBpKKQrLXvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752181920; c=relaxed/simple;
	bh=aywQz3CZ88oGIjl+zurv8EjAlYsjmJHyCtCGc5sgpww=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=kHppWrhjTo7MQM5hQaDTmQYvgmySXUA+stl/QPPEzHLLD+Ovp/mMP+RctK1aFKVOMmKgJVAAFVntRViaRZTdk02DGFTf8NxtPHNCSaVfF2R/P6KzgEMe7AZQOnCq01Fb6QehVWnuAHe1tL8+4xT+ZzuBzQBWtBsfsQSCEb/Hc8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hBlV25yY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hBlV25yY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kjELThxpzzAvI7EJgV2b+8qPZQoyQvdgHTrpH+0vcqA=;
	b=hBlV25yYibh+zG4lyxbaCHo3u+KgqfddzQGhUQ6gfSgvILF15ws7hg++i5mllliIq0V6E6
	5LIrnR2WYPnDbrb2JXGuIvme9W09JSa8A5PKxd9VGtLTDkg7TVUvQkRdZ1azRlK9lg4iNH
	/5IOy6nk4R8o6tnKC+toKtst2oo4sCA=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-82-Mxe51W71Myu_r6g3gAEQhQ-1; Thu, 10 Jul 2025 17:11:51 -0400
X-MC-Unique: Mxe51W71Myu_r6g3gAEQhQ-1
X-Mimecast-MFC-AGG-ID: Mxe51W71Myu_r6g3gAEQhQ_1752181909
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-237f8d64263so12469065ad.1
        for <imx@lists.linux.dev>; Thu, 10 Jul 2025 14:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181909; x=1752786709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kjELThxpzzAvI7EJgV2b+8qPZQoyQvdgHTrpH+0vcqA=;
        b=HKssiexC43EsF3WRHSaWyiUf7ZcX0aWOBzJUtAiLOdNE7K2WC/Btjb2Xn84ySRe5Fj
         yqMkgMmU/IQPsG5f6ll73EWZViip3OOB8A8vmyjYanAUegDzoGW/bvQqs0kKTqbrprjN
         O79auNmRNPRIKczEaqFH3PllI6sTkhwmiHYg4ng0VngcMA63m7vkY/fAm2B82+xtIdjU
         ia/+Z+XJ7TiUbxMV3I8J/crIhzuwCuep9Q6ER+fhZa2mSvCyoRVTGIcU7fMqcxZbxIpW
         2x0lstGR+YPCPqH4Pp5iPzKKYqmFY+JUQu/1CcgSi5qRX4kYv8DddkWj4cuwX9iHJjeR
         xBRg==
X-Forwarded-Encrypted: i=1; AJvYcCV7XV44McwrScUVJPxaMGxE3U/ux0IcCgk2pzoNNFK/l2AFAlKFTTZVcGTDPoYuQaSaLww=@lists.linux.dev
X-Gm-Message-State: AOJu0YzVspNeLGTniiNSWT/tsv3jm8X607o2qBHLD2d3zIijrv1RWftT
	J61BO6iZS7hq82zXYTC9OIJsOERdVG+jqVXcN/RTcgxWusVbWrPvhmvFuqNZ6qPrl0emHuzr3vM
	MV7Y5ifPITWAX9+q9khsjs7FTt/nfcaZw301IaSNUrEZfe/MMaVZ7jQ==
X-Gm-Gg: ASbGnctGiT16NORChI3CVXghZF5FDsgsqcWBq5p4nBvxmjB8o9fJB7png+tZl5YjoHS
	6Vsm3NssmnjobOyR5RolYmY1Ol9hDQV+bDBEP5A79TkSM9KDV29D7vCcj2fsKdiSvk7K/PLY/Jz
	CTvd8RfhU0FHUexo/XllNes/y/6pZSWhbgfdCLa2ryvy8/TBG/EJGNC/ROp3QK2ctQIEILFXPKt
	6NyrqFZEurX0Go5jrR7ihrImNZsmsdDx6noNXwG58G+tq7QhtwwTrWrbd9ca6AEDPedM32cf5Is
	XNIFyGSre/F+JzdaGYwJa/4fbnlF6EGbPTKMCmNrrRqoew==
X-Received: by 2002:a17:903:1ae3:b0:22c:3609:97ed with SMTP id d9443c01a7336-23dede890e9mr8285945ad.30.1752181909511;
        Thu, 10 Jul 2025 14:11:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECK3Rh9qQPkxPSM0R/QYf7bGscsWItQHb+tVdgkQkXMbgAQUKK5B8ZCSq9eX+Hd7XEABkBBA==
X-Received: by 2002:a17:903:1ae3:b0:22c:3609:97ed with SMTP id d9443c01a7336-23dede890e9mr8285715ad.30.1752181909173;
        Thu, 10 Jul 2025 14:11:49 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:48 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:41 -0400
Subject: [PATCH 09/13] clk: imx: pll14xx: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250710-clk-imx-round-rate-v1-9-5726f98e6d8d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=2836;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=aywQz3CZ88oGIjl+zurv8EjAlYsjmJHyCtCGc5sgpww=;
 b=t0asgbTbAH8KoNuVVM39DzXSGvl//TC0qYGt737gsaK5wItf91xeznIgnO8ZL9Jjocs20L418
 bxN9ze5HEUKDU6gnMLUSNH3r8xYrx3TkODx4d9fg01mSEbjxDTrtl65
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nNXrjdXWRkGW8jxrp_sefc-Pq4Wk0-J-qHDZybz7TrU_1752181909
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/imx/clk-pll14xx.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index f290981ea13bdba3602af7aa44aaadfe0b78dcf9..36d0e80b55b80385a065808916187d6d4c30137c 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -216,8 +216,8 @@ static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rat
 		 t->mdiv, t->kdiv);
 }
 
-static long clk_pll1416x_round_rate(struct clk_hw *hw, unsigned long rate,
-			unsigned long *prate)
+static int clk_pll1416x_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
 	const struct imx_pll14xx_rate_table *rate_table = pll->rate_table;
@@ -225,22 +225,29 @@ static long clk_pll1416x_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	/* Assuming rate_table is in descending order */
 	for (i = 0; i < pll->rate_count; i++)
-		if (rate >= rate_table[i].rate)
-			return rate_table[i].rate;
+		if (req->rate >= rate_table[i].rate) {
+			req->rate = rate_table[i].rate;
+
+			return 0;
+		}
 
 	/* return minimum supported value */
-	return rate_table[pll->rate_count - 1].rate;
+	req->rate = rate_table[pll->rate_count - 1].rate;
+
+	return 0;
 }
 
-static long clk_pll1443x_round_rate(struct clk_hw *hw, unsigned long rate,
-			unsigned long *prate)
+static int clk_pll1443x_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
 	struct imx_pll14xx_rate_table t;
 
-	imx_pll14xx_calc_settings(pll, rate, *prate, &t);
+	imx_pll14xx_calc_settings(pll, req->rate, req->best_parent_rate, &t);
+
+	req->rate = t.rate;
 
-	return t.rate;
+	return 0;
 }
 
 static unsigned long clk_pll14xx_recalc_rate(struct clk_hw *hw,
@@ -470,7 +477,7 @@ static const struct clk_ops clk_pll1416x_ops = {
 	.unprepare	= clk_pll14xx_unprepare,
 	.is_prepared	= clk_pll14xx_is_prepared,
 	.recalc_rate	= clk_pll14xx_recalc_rate,
-	.round_rate	= clk_pll1416x_round_rate,
+	.determine_rate = clk_pll1416x_determine_rate,
 	.set_rate	= clk_pll1416x_set_rate,
 };
 
@@ -483,7 +490,7 @@ static const struct clk_ops clk_pll1443x_ops = {
 	.unprepare	= clk_pll14xx_unprepare,
 	.is_prepared	= clk_pll14xx_is_prepared,
 	.recalc_rate	= clk_pll14xx_recalc_rate,
-	.round_rate	= clk_pll1443x_round_rate,
+	.determine_rate = clk_pll1443x_determine_rate,
 	.set_rate	= clk_pll1443x_set_rate,
 };
 

-- 
2.50.0

