Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3372F19B9
	for <imx@lists.linux.dev>; Thu, 10 Jul 2025 17:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169410; cv=none; b=qh3Z1v9+yuV+QfCivvM725xidKEsERaOztA1ynwrgRohwDl7Tnl2oa0HthBL6JmDDx1rdhdREFaF2yiqsFMWfcbSE3SwrBb5hElqkh/lU28Nhgqeawy6FH2MBuoC5ruajwQCtDzXr0v1Iq7gjE9F/HfhguTQIEUxXiAks64geDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169410; c=relaxed/simple;
	bh=0XNjSSy+sJ0lfEyL4cE3BgJoCrdQCRO7x73pTQQcP6I=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=H/MOOhwf2QzdzD934jm+fAvL62enw/OScAcEcAbK2VtCXreVAy/Tri1LSHd7rCag/p8i52vPlInTv1CoOq5WAPz+iU8IZoQV8LVynUQrKk9O4BzJaKxRY5flcAIMgbPLu+iYkcUXp7Gd3oJlFu7P83n2iMSbG41e19UVyI8esP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z6C6+DUg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z6C6+DUg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KBPGyYPlG02EWMpLoXBzNUmSiSLVytWyHaO2lqHRcZA=;
	b=Z6C6+DUg4w1ugVrWNW9WD7XPladdxlXW0J91egWhoYSpM9Q4ezFhvOUX6fcnXk00TKHtDd
	6as/n6Q2VPb8Qk+eMAqJnuc+p1QNa1nZfytaHXEqQBCQ2SfOY00LSvzY0hFPAldqbNWGzC
	URwibWZiy3br+cSDhFQbudAzUvI23pQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-_IyBeMRUOVyblXMFgzvs5g-1; Thu, 10 Jul 2025 13:43:27 -0400
X-MC-Unique: _IyBeMRUOVyblXMFgzvs5g-1
X-Mimecast-MFC-AGG-ID: _IyBeMRUOVyblXMFgzvs5g_1752169407
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fb3466271fso23953996d6.0
        for <imx@lists.linux.dev>; Thu, 10 Jul 2025 10:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169407; x=1752774207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBPGyYPlG02EWMpLoXBzNUmSiSLVytWyHaO2lqHRcZA=;
        b=f2Ad/eVjFh/JHpPXuYIaNyTeTHSLgB4KzV/U7S7Fsd3xqYDnLoeW1659wIttjryKIQ
         jzFYg9GjnvPgVjBPAeQPZ3jpNhyxyr2NYQgt4wp2mrc2KS409An6ifXAryGYze+MkIUX
         2B8/BEDxqA7gw/ymEW8B/VQBwo6qVu1UPZlabCne1gCsp1zVy2qurJ4jqBrA97rIJfC0
         2u2ad6yoBRjIvwj9stPoulICac7RcRt/+pNzYh74v5crqtkNt16W4us9deT7piE0KWJy
         76TQkRpoLyQMlhcXuEBZLh+5Ai5pESPWiyUz15ngptMmfwp2S8ESz/HHyDwL/GqIUwhT
         IaPw==
X-Forwarded-Encrypted: i=1; AJvYcCUy8K01xc0mKw+Lijo1nTT6dKg7icD58YG8rOmW4ea6As79Yo2r7W2fSOJSaB+D64YF82E=@lists.linux.dev
X-Gm-Message-State: AOJu0YyhoTKIOE/3eGNrCseTYy2br+aHCa4RU0duBbmPO2MDQizGbUcG
	Ahfc70jxNt20UYnRCHKyqjXbQFWkBD8EcZzHZ4NrFfoh4ZpzWzlwrBujdePlr1VCcYDnPucxmEf
	L+CbtdVpm2PnsMtsKDH3NKnNVdfoAM8fG40kUOw0UxMgHzuhv91KoOQ==
X-Gm-Gg: ASbGncs0oZLORl5AWS/ik0OhgZf36tUrRq/5c3XzleDQkb46D21m+SbMqhrp8JHkUMW
	fif+l+EooHmjYHfT+FuAckJ/xrpeR3J+m+5fkiVV7veI4NVCrTxSsmjgT2NefWpXeLlu1siZyxM
	MeBUG9rS3rc4Yf1gfm1BYUEucVnFr9SVlRbdZjkIwf6yg94m+6lLlMxnaOPKBD613DnkCWhJoET
	3hqxiuodZRjTQuQj+DMS+XM80bzSHVmSBd1UX9D2D7a3sMDZ/2yTYeNqqpw8kZFj4LRWpc1G40B
	sgpxgyT2fqRhCvKolap9uS2Y6CvWx5ncCAywwC6Fu7wv19n9cCM94Nrp2bry
X-Received: by 2002:a05:6214:3f85:b0:6fa:c22c:f78e with SMTP id 6a1803df08f44-704a3f6fd62mr2495786d6.14.1752169406555;
        Thu, 10 Jul 2025 10:43:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEttkcpvpmW8n4QYixl0+KFt8qbGPFK3Af/cnV1daIlslvCn8CNttD2d7VeOQXKfYZa2Tsq5w==
X-Received: by 2002:a05:6214:3f85:b0:6fa:c22c:f78e with SMTP id 6a1803df08f44-704a3f6fd62mr2495446d6.14.1752169406197;
        Thu, 10 Jul 2025 10:43:26 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:25 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:04 -0400
Subject: [PATCH 3/9] drm/msm/disp/mdp4/mdp4_lvds_pll: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1612;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=0XNjSSy+sJ0lfEyL4cE3BgJoCrdQCRO7x73pTQQcP6I=;
 b=96LRUEONivujwIpqQbr8tblgDkupptPSSepp1EfUIk95IM619emUTpzW+J+hude/MQ3kCg+HA
 3yXQuBUEDwkAc7M+xiKSzQ6eV9m9VE+WhiAmImR5xyYrk63QkNrzyzs
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UbYkZxj-dLLeZ8_fwhhQmlwXp3foBuwNz1REm5-lHiI_1752169407
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
index fa2c294705105f5facbf7087a9d646f710c4a7fe..82e6225c8d491d44e30631cd5a442fb7c2de3f75 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_pll.c
@@ -98,11 +98,14 @@ static unsigned long mpd4_lvds_pll_recalc_rate(struct clk_hw *hw,
 	return lvds_pll->pixclk;
 }
 
-static long mpd4_lvds_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-		unsigned long *parent_rate)
+static int mpd4_lvds_pll_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
-	const struct pll_rate *pll_rate = find_rate(rate);
-	return pll_rate->rate;
+	const struct pll_rate *pll_rate = find_rate(req->rate);
+
+	req->rate = pll_rate->rate;
+
+	return 0;
 }
 
 static int mpd4_lvds_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -118,7 +121,7 @@ static const struct clk_ops mpd4_lvds_pll_ops = {
 	.enable = mpd4_lvds_pll_enable,
 	.disable = mpd4_lvds_pll_disable,
 	.recalc_rate = mpd4_lvds_pll_recalc_rate,
-	.round_rate = mpd4_lvds_pll_round_rate,
+	.determine_rate = mpd4_lvds_pll_determine_rate,
 	.set_rate = mpd4_lvds_pll_set_rate,
 };
 

-- 
2.50.0

