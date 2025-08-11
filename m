Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AB628D83E
	for <imx@lists.linux.dev>; Mon, 11 Aug 2025 10:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909819; cv=none; b=SiAGD/Wuh3rX6VjrfPKbBo7SRgGv7DLMorJuMwgJ++G/tN0gDyxOf1ZqQ/TYGrx+Rb58XqNsomU32RGWf7xjU+EePg9BSvZf5OEY69UGIxvBALGSRMNVuEhKGON5ATXr2i4D85W6MrcdJW2m6VRvLFzxQvXfCoyjJf+46q6E4m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909819; c=relaxed/simple;
	bh=y0KLkFzoWiBCsjyKHVyFf5yBXdH+nrgv9bMtrhIbLXo=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=Ubdu3Q2BJ1eDH7USijbPc7nTi5uz+/zB7rjtiHu9875pTE9fHDf1gByoOigkcaF3/gJpHA8ZYbdrV3BjnJpivo63BZvkAKC8/2vBJf4Wf3VeTpROkg3o/Y/WMb8jMJ6zg+NtYU6B8PfBJUZg16vne9W/OrgA4OA4VS6u5iXlY7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eUMN4dSQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eUMN4dSQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754909817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CR+LHOxQNJH4mrdkRrblEPU2A6Ou6dlR4qZMmeyZ4e8=;
	b=eUMN4dSQ3le9FS/Y+6Y244khcoOhLYX3ErDME7G3+JqrItrM3btxiZa4VxtdirKP6n+uVz
	bKdOfahB50Z39mmUTDcCmij99rrkoz/YQHYs97rsBTh7lYgC0fX7KFzWbQTg/8Dqn5Y990
	K+ndaUng1xI4r+jRbtzKOn34Udo47z8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-1rLbW9jZMVq9qD-8JihuEw-1; Mon, 11 Aug 2025 06:56:56 -0400
X-MC-Unique: 1rLbW9jZMVq9qD-8JihuEw-1
X-Mimecast-MFC-AGG-ID: 1rLbW9jZMVq9qD-8JihuEw_1754909815
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e7f74baf26so993006585a.1
        for <imx@lists.linux.dev>; Mon, 11 Aug 2025 03:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909815; x=1755514615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CR+LHOxQNJH4mrdkRrblEPU2A6Ou6dlR4qZMmeyZ4e8=;
        b=xQYG56TKIIXbKkquM4spemPUzuRRdYxddbfpyj0eQIDebMXMU5TqGFfVb4zIZDhXI8
         LOuIglp+j40dPYg/SZMeebjTParjLOCcj7DqlQDjxRK72Kl79UQVo+5FuT26oAPwk0oD
         i9GsyAmB+T7OnjKM3F7DZ8PTXN9xqkDbRj69d7IjQsk1pRZPKW1kkxTsaviw1l/BbXWQ
         uWEIQoxTajPMnQwX0N2lwWNHVnP7D+4NHpsWSGZ0fS5iHCNiMaKP/qEb34W3ADyE0D4m
         /nhS7tM8Et5S+Oq6x4wNy9MoKGIukiZlwFLZqdG82DvH+wRYsWm4NrxdEocEuZsh/2aS
         QI+A==
X-Forwarded-Encrypted: i=1; AJvYcCVb2NWf77CEZlwfp23rsjf+1ahvGtblkLib2/HDLSYpIFQATWJKhRq3ki4Mg5+Hiq1NvaI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzr81yueZUfXG6gozol1izjGv4h/9YPL3dNNdbaX8aAprX1QRd1
	Qbw2egOopGlV6LZ0hgi7JIkb8QJ6ET8hMLseCJklC2xf/ZGiciMhMhu/0ytNqjD1oOeUhDSPib2
	kLfKRzBVjfURIty84MtlW2ae40/XHStbgQ+mYpcmpVxmeJ44/WLtQ4w==
X-Gm-Gg: ASbGncsftv7so1RwGodXX2He2Z+m73erEB7jABu3QmYv+MGlTrsBRt4HB7KR6fYaHsq
	D+NLnxovSjdOBz2eleyjB4NkXDb98g9WprpirbQerDMIJU0iNhk8TWLnDUWyJfsgog2ZYNlUIo/
	L3F7uhgRuCX+Odzbi7jl35GmG/qYRCpMbW09IjoaDZcm73bfLpwm8WIbpilKcc0dBJjKAjInJca
	pvbiS6ONIXhZlkmdGw0RfAIvPi6L1CIKD87j3es8LPL/TukBSP51kIq5jh7FQywRc7XSLvQoa+o
	QbepS1JavNF2vcRTGbmeUVnjzp6HdQuy2WibRWYEyVYdz61WAD76AN5k34WX9S8FwIcApY7KUzm
	Si0w=
X-Received: by 2002:a05:620a:1996:b0:7e8:54f7:67cd with SMTP id af79cd13be357-7e854f76862mr91487785a.50.1754909815370;
        Mon, 11 Aug 2025 03:56:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSii5P15b+af3L4E7F/cQGCM1Xz8KwmyfhCdGkZGKODW+eFh6Bky1dDzTK+GfwnJZiiMZJQQ==
X-Received: by 2002:a05:620a:1996:b0:7e8:54f7:67cd with SMTP id af79cd13be357-7e854f76862mr91484185a.50.1754909814934;
        Mon, 11 Aug 2025 03:56:54 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:56:53 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:13 -0400
Subject: [PATCH v2 9/9] drm/sun4i/sun4i_tcon_dclk: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-9-4a91ccf239cf@redhat.com>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
In-Reply-To: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
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
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=2307;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=y0KLkFzoWiBCsjyKHVyFf5yBXdH+nrgv9bMtrhIbLXo=;
 b=j1ZnE8gcsk3YjO3zCEvUNiC5B3rrw/rsR6rCeLo5Q9BxZp8jvK69xEFMszvH1iDCwux2pSDHd
 eRkR0peMpaDCxDNa8Bi3chrL3Nda3ZZTmewCk0Eb5cefUz9pD7/Qw2Q
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LOSkYEnFv8WVKVaOt6e-LUq-PdUYLUKj1IUBAvw4cRY_1754909815
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
index 03d7de1911cd654f395ea85ad914588c4351f391..4afb12bd5281f0d1720cfe2c8f79b80d97244ef2 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
@@ -67,8 +67,8 @@ static unsigned long sun4i_dclk_recalc_rate(struct clk_hw *hw,
 	return parent_rate / val;
 }
 
-static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *parent_rate)
+static int sun4i_dclk_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	struct sun4i_dclk *dclk = hw_to_dclk(hw);
 	struct sun4i_tcon *tcon = dclk->tcon;
@@ -77,7 +77,7 @@ static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	int i;
 
 	for (i = tcon->dclk_min_div; i <= tcon->dclk_max_div; i++) {
-		u64 ideal = (u64)rate * i;
+		u64 ideal = (u64)req->rate * i;
 		unsigned long rounded;
 
 		/*
@@ -99,17 +99,19 @@ static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
 			goto out;
 		}
 
-		if (abs(rate - rounded / i) <
-		    abs(rate - best_parent / best_div)) {
+		if (abs(req->rate - rounded / i) <
+		    abs(req->rate - best_parent / best_div)) {
 			best_parent = rounded;
 			best_div = i;
 		}
 	}
 
 out:
-	*parent_rate = best_parent;
+	req->best_parent_rate = best_parent;
 
-	return best_parent / best_div;
+	req->rate = best_parent / best_div;
+
+	return 0;
 }
 
 static int sun4i_dclk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -155,7 +157,7 @@ static const struct clk_ops sun4i_dclk_ops = {
 	.is_enabled	= sun4i_dclk_is_enabled,
 
 	.recalc_rate	= sun4i_dclk_recalc_rate,
-	.round_rate	= sun4i_dclk_round_rate,
+	.determine_rate = sun4i_dclk_determine_rate,
 	.set_rate	= sun4i_dclk_set_rate,
 
 	.get_phase	= sun4i_dclk_get_phase,

-- 
2.50.1

