Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6509279346
	for <imx@lists.linux.dev>; Mon, 11 Aug 2025 10:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909796; cv=none; b=UOdMnpMlXGbNzVcaXE223FF1QbSylAjyEF9G++lZP9H3oi6SHYykHAI7OaCcWgCzpSkYGuq/B1Ar9FvzEKrhlvLObspFSCMGCM7VofkCCIKy0gej3XYVUdZ5W+IG4GiT66Nb+WpjrC8qf7PXogBsR9o+tf/ZW7z7Kkb7A86KPJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909796; c=relaxed/simple;
	bh=9BXAN9WaQXGACsWVgeakYqAdywyzgmh/IMziqVvQDEg=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=ERnzT47JQk2Lmz4Azr1PH1OXgcKesgLKmEBFSLbN/b4RC+DdHo8g7ioHiMi/IYv3T2mgAsmfZQCI8H0xaRh8bD8/una4UpuQMXoMvi2sMMKjEQZKtsj3pJhvP6eVqWCcluj+p6IwijKkA062ZqzSQ28Ehi+VfNnFBIhXWfiRkDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vlbpd4d1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vlbpd4d1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754909794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tWkAq+ld75LwDG/hGRVHHPxuHrsiy/sV3D7XIB1FZRs=;
	b=Vlbpd4d1GWLigeSUtZRUv6DKjNBdXibb4g9JbYbVitRrPiFoji9hYKRStDLadmK5tBebGE
	O8pfANZy2JB4mvj9zgRNWtcrWGCIF4PAp5CDs9jbUW2m0xzVyPlEO/n0D/CWyW+5FVEsWZ
	+c3yXwS/mQYrfBi/vxjzhSLMtzshwp4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-48-2p3PIAUxOjWEnsa95ZB02A-1; Mon, 11 Aug 2025 06:56:33 -0400
X-MC-Unique: 2p3PIAUxOjWEnsa95ZB02A-1
X-Mimecast-MFC-AGG-ID: 2p3PIAUxOjWEnsa95ZB02A_1754909792
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e69a0a8bcbso983557785a.0
        for <imx@lists.linux.dev>; Mon, 11 Aug 2025 03:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909792; x=1755514592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWkAq+ld75LwDG/hGRVHHPxuHrsiy/sV3D7XIB1FZRs=;
        b=XRABBEW79vJtjhrk+rDckH1snRkK579GIcx47fZL6Zibhq7DYR8giD8fhzI/dOPXMM
         xf+qK90A7j/SPndRlEBIn5lRfo3Lz9uBLvM9J/iGwtY4/RKERvckYy0U92lXdaeZRjGi
         kJ56EkJLZONIKIRnP8/pfmZDK9YXSHOmFOeEPPvXbZhMKaD5QiLBgXOWJKXxe/tNOnIy
         wKUXDUagK8I1ziXupIc2z07uDtXoNsozO4kt418Wu3yfDHNtxkUSiuZGcCIVx8jGAfvA
         ZfMX+g4kZfrpcsm2834efKLHFkjswwrF7VBxkqzI/TUe4MYcbIirD2Y7Yy49keKQ51cS
         4dpA==
X-Forwarded-Encrypted: i=1; AJvYcCUqTr40Df5jOATRbuqcZtp+gPFRbzRHzr04oM32X8ZdUSWbGT/J5rvdQ8gvnQehEiXOeX0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCa4dRVxHUfbIlaI1bsn28zYiDHSaIOLGeuv4+Pssh/MCinQw8
	uVzrapiSvU8fUa/jd+/WDeW96XWVkJqGwvqfw6N3O9L4y7F44BNN7+iCN/XkXEKaGYpOYkgYyER
	FrA1t7bydDPlx9kYndatppLf/Nmbm7LQZmo7dEyYI2nwcO4aodRrNLA==
X-Gm-Gg: ASbGnctnj+JJlFHEMLqWN+vH6IOW9FWy+L8VHeW7plz5zAd/MXki00n1LIUiZjsJlKK
	41n3olf10ktU2Ck4Q7wCwEmjiSNhXd+cxY9FClJokYpxWT8jn7XkPweIN4kc2tBpB676FKQbWIR
	a9BJFzr86U+242p38SKspoEBn//bmS6gwR5MgTo9ZmytHT8GukhNBVPZZWy7vuuKDtlPz2VKFkc
	dmLclHSpQlewUxFRWOlRLPlCCT0cpFhXny7IP8IjEEFFty0As0tj3/3HbRz0QnxcGoDgyawnW1P
	VqKEVWhJgXc94qyoXDU8RoO3RE4n2aevSDXV8Wyy3SLpctgo27dhZd0lMoOr4x1Lp+1Y7osvfaT
	A2os=
X-Received: by 2002:a05:620a:45a3:b0:7e6:9a4f:a299 with SMTP id af79cd13be357-7e82c646f33mr1843252485a.16.1754909792404;
        Mon, 11 Aug 2025 03:56:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgW8gZJYQbVSn9A8dMelBcES9raZpoqJep5i7D+EdYN7YXUJOpmuR1qZ1AM51jM57roxoq8Q==
X-Received: by 2002:a05:620a:45a3:b0:7e6:9a4f:a299 with SMTP id af79cd13be357-7e82c646f33mr1843249285a.16.1754909791988;
        Mon, 11 Aug 2025 03:56:31 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:56:31 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:06 -0400
Subject: [PATCH v2 2/9] drm/mcde/mcde_clk_div: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-2-4a91ccf239cf@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=1730;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=9BXAN9WaQXGACsWVgeakYqAdywyzgmh/IMziqVvQDEg=;
 b=ylupjg1fmCNBXXxO3X3BdCWItZxz3hbcUzYzU1GUNiNNWUiYrAb17RJCYD00k/EMPQMfWhWKC
 RXc0CDE9VnwCgzocNA8sHN+o4QXxCM6UpLGynPKDC6JbO0dbhiFFntj
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1Gy_O60xoCP989jdQ624_QRLvaexXSRPZN0VAjHYYyg_1754909792
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/mcde/mcde_clk_div.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_clk_div.c b/drivers/gpu/drm/mcde/mcde_clk_div.c
index 3056ac566473487817b40f8b9b3146dbba2ae81c..8c5af2677357fcd6587279d58077d38ff836f0c0 100644
--- a/drivers/gpu/drm/mcde/mcde_clk_div.c
+++ b/drivers/gpu/drm/mcde/mcde_clk_div.c
@@ -71,12 +71,15 @@ static int mcde_clk_div_choose_div(struct clk_hw *hw, unsigned long rate,
 	return best_div;
 }
 
-static long mcde_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int mcde_clk_div_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
-	int div = mcde_clk_div_choose_div(hw, rate, prate, true);
+	int div = mcde_clk_div_choose_div(hw, req->rate,
+					  &req->best_parent_rate, true);
 
-	return DIV_ROUND_UP_ULL(*prate, div);
+	req->rate = DIV_ROUND_UP_ULL(req->best_parent_rate, div);
+
+	return 0;
 }
 
 static unsigned long mcde_clk_div_recalc_rate(struct clk_hw *hw,
@@ -132,7 +135,7 @@ static int mcde_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
 static const struct clk_ops mcde_clk_div_ops = {
 	.enable = mcde_clk_div_enable,
 	.recalc_rate = mcde_clk_div_recalc_rate,
-	.round_rate = mcde_clk_div_round_rate,
+	.determine_rate = mcde_clk_div_determine_rate,
 	.set_rate = mcde_clk_div_set_rate,
 };
 

-- 
2.50.1

