Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E6D2FE313
	for <imx@lists.linux.dev>; Thu, 10 Jul 2025 21:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752181910; cv=none; b=UmVYgg75mZBWKxRcDdkoBA6MnXr559dEJhwpDplDgHCZ6gWaqDbsTlwhY5p6gJL+PlIoDZ0V4Lc1+v9aaMWv29L95U/Gdw+X5DZxJIq3ATZNVLmwVltTl9GcDsxT8v1wvly7AIJM5zOYfsuL759CLcA9luy/Hhi4ibdBWpgDI3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752181910; c=relaxed/simple;
	bh=Z9Uj9Ryz7NpcBIB9QkaT0/fa95nPsbwVCXock5kE31I=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=l+kUw3FG3ABMjxZl9T4uP1RyAx0/bVw7b8aa+RoBsFKoYaB++aoD90PSs8vZ0J0tIhofyuyrqkyJKyo/Xh8phWZO9TwzAQIxCnuNo0L86BzNfMErtyR04lDzNMH6y9Io9vpgV8K+z8UFOahDakteTaQ4VSvGLUJ3j7mMZ8kLOYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gNAejZ9U; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gNAejZ9U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6wMxlB9MZ68orKi/UWzRs6IFytl0SMGxxkXzUhmjEdQ=;
	b=gNAejZ9UUuzjE3rgz1vNpD9bTNOtORr9nLDoDzn/WDs84tACaL+TZN9do1eilMIMGx7d5r
	176XK//N2fFEIU4qJ6dWAJGWUVlUyJfJoe50Jb2sxYSDF3qWY79RNaFiHSHq+AlPYx9ApI
	nOUXs1rUD+EHzm8/Nh1knIi/Cfm6cAs=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-I4HEKcpBPMaFyftS7zqTRQ-1; Thu, 10 Jul 2025 17:11:47 -0400
X-MC-Unique: I4HEKcpBPMaFyftS7zqTRQ-1
X-Mimecast-MFC-AGG-ID: I4HEKcpBPMaFyftS7zqTRQ_1752181906
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-235196dfc50so13646645ad.1
        for <imx@lists.linux.dev>; Thu, 10 Jul 2025 14:11:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181905; x=1752786705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wMxlB9MZ68orKi/UWzRs6IFytl0SMGxxkXzUhmjEdQ=;
        b=IV4Z7NTMwAQGIFY3PWexAEpCiOZQ2QfEr2Xct+NfW0KA/6tAPXvzMdddpFtTKvsYie
         ru6iAtuwP+GYlzThB9uEXU3J4rQNnbGCLREww3VgYwIrrt8+8b4XlLRDB5cqxYv3kF5x
         ojUGfGRJnoDdLIe+24gvKxPSGIMcK2iHz+gsdIKh4cC5ofNYqtsqh+DYxiq0JCOrA5yY
         hr8jY44D2vQDGpzjCIZRBNlcaJRGFeUkVaAG4S1R78fx+IELz04ftnSTcTMADaT7xba5
         zo0aoxfQab3EMZ1jHBTvfuXqCOy1LAiqZHESAMMXUnr0LtwN1rt5IFLMZaAbdbnQi4T1
         TGvA==
X-Forwarded-Encrypted: i=1; AJvYcCXLpiHB4XpNmEOS8pZunKHn5diBa4lRW4NXwDzp3nzLTLXlrOkugNu9mNXU2PpFk8S4lAo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6fGVvUOlUYS4K62RB3ZF44MzuX8Q9YOKIQE/p9KLt9xVZIPVI
	8KHRc1Jax/Cf80dAvSWMKWnLYUMUDZ9hAdzLuypafNjDQKiUopvpR4mwanNn7b5qTLaUvNz4syJ
	K/bHU4uHCRJi9i0PXGQrAtB9DKziFHxtaSjeIHGelhfsK3RDlMw2uZJdhrThi4aaX
X-Gm-Gg: ASbGncsRQ3GF0st0JQ02LdfPS5R1Iu0GUOdg1HCQpLeTF/UjVUtvrRBURY6ICxdLpl/
	PT4ALLRezBQM98Yd0NSTgCZT28S73xBZ80iV8jc6wJMehhBWfXIKs+kN8iNSpPZTwLcmFGa76K+
	yhJ904dsKoCNVX9UO8z+V92cGvUBNHGnDIcjelMn8806qumkAZO27PM4p7IQfkzVsanzCtwP8n+
	l0GxORJru1SyARAgFLche8WhVbTyBPUgaBDxt+J/agCx/I1WGWC8erW87s2krvhGi6ACt8j+Knr
	PJwIhZnVExNXXngq1YOaXos/Fuw98MmdlSnEgKNglOt+Vg==
X-Received: by 2002:a17:903:2286:b0:231:9817:6ec1 with SMTP id d9443c01a7336-23dede5b1camr9198085ad.17.1752181905395;
        Thu, 10 Jul 2025 14:11:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGroYVRzkeih8y5j6Ie9SEEmZ3kfxnIjBvUsUsEOP6IfwHOfSj6KsTc2VE9xDkcqDujs4HIQ==
X-Received: by 2002:a17:903:2286:b0:231:9817:6ec1 with SMTP id d9443c01a7336-23dede5b1camr9197865ad.17.1752181904996;
        Thu, 10 Jul 2025 14:11:44 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:44 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 17:10:40 -0400
Subject: [PATCH 08/13] clk: imx: pfd: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250710-clk-imx-round-rate-v1-8-5726f98e6d8d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=1703;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=Z9Uj9Ryz7NpcBIB9QkaT0/fa95nPsbwVCXock5kE31I=;
 b=+e2l99hJrkomUi1x/QO1jHP0TlIqBGTOsAEf4gqKRSSSU7Bv5oOTumLrGf/XmrQ4c+hLQ7k7v
 OvjZou/OgaEDDrvA/1mdGibI94pnaOY+YblxFxdbczcHsxklPFhyqzb
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JHem6zz_lwP61-MKk6BaE0wRpav2kBxt9gEF6HnnApA_1752181906
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/imx/clk-pfd.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/imx/clk-pfd.c b/drivers/clk/imx/clk-pfd.c
index 5cf0149dfa15aab8b4cee47c8120753e3df45dac..31220fa7882b601f3535ad125114dba1eec95a9f 100644
--- a/drivers/clk/imx/clk-pfd.c
+++ b/drivers/clk/imx/clk-pfd.c
@@ -62,24 +62,26 @@ static unsigned long clk_pfd_recalc_rate(struct clk_hw *hw,
 	return tmp;
 }
 
-static long clk_pfd_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *prate)
+static int clk_pfd_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
-	u64 tmp = *prate;
+	u64 tmp = req->best_parent_rate;
 	u8 frac;
 
-	tmp = tmp * 18 + rate / 2;
-	do_div(tmp, rate);
+	tmp = tmp * 18 + req->rate / 2;
+	do_div(tmp, req->rate);
 	frac = tmp;
 	if (frac < 12)
 		frac = 12;
 	else if (frac > 35)
 		frac = 35;
-	tmp = *prate;
+	tmp = req->best_parent_rate;
 	tmp *= 18;
 	do_div(tmp, frac);
 
-	return tmp;
+	req->rate = tmp;
+
+	return 0;
 }
 
 static int clk_pfd_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -117,7 +119,7 @@ static const struct clk_ops clk_pfd_ops = {
 	.enable		= clk_pfd_enable,
 	.disable	= clk_pfd_disable,
 	.recalc_rate	= clk_pfd_recalc_rate,
-	.round_rate	= clk_pfd_round_rate,
+	.determine_rate = clk_pfd_determine_rate,
 	.set_rate	= clk_pfd_set_rate,
 	.is_enabled     = clk_pfd_is_enabled,
 };

-- 
2.50.0

