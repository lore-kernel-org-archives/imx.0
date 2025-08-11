Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECD52777FC
	for <imx@lists.linux.dev>; Mon, 11 Aug 2025 10:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909795; cv=none; b=DY4PjV3yq960v/6eIoPsdym4SPk9JWxJmA/13CCk2J/caYm82C7Szdo3ToM24j4TacNP9/LRtm7RlPkshrBuDo3WT+WcqsUVI1nqAcqA27M9BVIaWEuKZZG0s3spzUmaXbmIkOW16lFSeBlR6VA1vdpyDHQNDPZiNBfa14rWwbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909795; c=relaxed/simple;
	bh=cxbqZ4pGz5eouMzBVW3NyN413s0i735X+YyBDIP1KBA=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=YUquKblqQq08HxB/KUvgiVjDrqpmTc65jiuuWHcWewmVKBgT4FKvypdLZZuDbfaQjkI5n+3Hg2EE4aUDcX9r5PnveLGoWhiMvp98anuRwPq5IeW2aWptiOU/mdGt/4mlIAW5Lo0xYVvBnul9UloUBZUjbP0Ak3gRvBELpXzIWkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vl6pynA8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vl6pynA8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754909792;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oItVFGO2Yky7AW4ur1CICLCJs15wxQxwvYfZhdFHqm0=;
	b=Vl6pynA85CwJSNQrWYGlHyLWFuXQ0YfZB/Nb2VCjo2o12ox+EpsuhohRKeZNajztbC2f2o
	SWYrIgUzKykdxG1spaR9cS7ZGy2axfIbh9EaaNXIL/T+GYMQM+8i2fwe2EqBEEIDBejVq7
	uA/Vi6EaIKowaN7JYCytx45ezbLld7I=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-71K4xnZZMTa-dH9MHxZSuQ-1; Mon, 11 Aug 2025 06:56:29 -0400
X-MC-Unique: 71K4xnZZMTa-dH9MHxZSuQ-1
X-Mimecast-MFC-AGG-ID: 71K4xnZZMTa-dH9MHxZSuQ_1754909789
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e6c4ae500bso440562085a.2
        for <imx@lists.linux.dev>; Mon, 11 Aug 2025 03:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909789; x=1755514589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oItVFGO2Yky7AW4ur1CICLCJs15wxQxwvYfZhdFHqm0=;
        b=aymFrdNXBS/G/x9DzkBqzad3OIHsj8L59a/gMhf3PAzPTc86f4ES8tlgspqBvPpBdD
         gyT1sMz/UT1iPRgilUyocYZcyoAT9NCUA7PKxapxGuyPTke3AX3jxErk0rb97rhMK15F
         zyz7u6zreHCtf8+Fy+pe0QkdfH4OWwADOYeSjMT9NbxAk8ECu98MfS/pbeIVd/bFPUhL
         cTEEB8rz+RS7ryNHvu92VijpZ2OdZQx34yzKDmi06lAxjeFPvSvWSAAGN1UYhYZeqRAQ
         4TJqhykPe8QHPBt3UtRjiGLmrx6RYYUM+BECG8HTi4kr4knvLj9BWUih/LBIjtvHwRAj
         c5Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXqxGs3+MyEP8W8bz4vrgq84Ohrd23bX+535uxD9tgJllBXn89sHGclxec3MnR5j/XAWP8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxxltLU1fXjffA2fefk+hLReOndM+2WEx+D8TDA3QF4woZX2nnS
	bca7DX5bDsXMZiOMF0M9UyqfUVMQECAemhkryypk02U3XJL0XPzJbf+gy04vvLkhC0IlIBKzWuZ
	WPBd9cxZIK3Te233PUJkaqWSHN7xtjZAd+tcpYFVXnPuvrvbuaqHcsg==
X-Gm-Gg: ASbGnctc1I+VHNIWKo9h4j+a021stxIsFilFJU1TYU/KHNYnO1ZbU1uRDwkfi4DM41x
	LUsthUIQqvcr9+lm2TyVdFaHEndLRcEpjtX/s57nyBN57WfBDHRe5lH++z6/f+kFSrnvp6VZ4nO
	Qpbszmm24hHjU1YFcCxUWoMYZSyQDEEzIrWIfxr41bLN0L888tPHBMIUFDLizRxDmBU2zoKzzmz
	Pm4RNAmKS6MBl89al2aEq4rkMYZhmisEIswQkEUhp+wLVfyrXj7dY94/Cpb3umhQsQIBQwExmDw
	dTCVSe0kBOD+pZ7bWyFUuwBDVLACUomCs50kdLlkZn458nmvRF7Ez43mckw1WVLElS1QHYHxAUa
	3ATc=
X-Received: by 2002:a05:620a:4482:b0:7e8:4fef:bfdf with SMTP id af79cd13be357-7e84fefc2camr275376985a.45.1754909788891;
        Mon, 11 Aug 2025 03:56:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGc+TLWI2xokcRtB+yecJngyy21noRPTcC3sO0sgVUYXnKnFuXDagMBjiVXOuloOtpZxIcGpQ==
X-Received: by 2002:a05:620a:4482:b0:7e8:4fef:bfdf with SMTP id af79cd13be357-7e84fefc2camr275371485a.45.1754909788147;
        Mon, 11 Aug 2025 03:56:28 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:56:27 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:05 -0400
Subject: [PATCH v2 1/9] drm/imx/ipuv3/imx-tve: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-1-4a91ccf239cf@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=1689;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=cxbqZ4pGz5eouMzBVW3NyN413s0i735X+YyBDIP1KBA=;
 b=6DBm6LwfY0nfMA421HhZNkFETdBD0OvYJlukZJUarU0DQPM5TzD76GN5AVvolZqrFAvmrp1nP
 jvbNFGe7dHWC4XgQV+dlyA/bvSpVN7ZZvyR5/1pWXfn+rHkgHaXmtum
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ldb4kJygROQF3g_v3NVE3AkkFfKVsma5oQ5wXguySO0_1754909789
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/imx/ipuv3/imx-tve.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
index c5629e155d25aef5b43445bc18c6c90039c99974..63f23b821b0be66a8e8a379e1375ffd98552e72f 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
@@ -368,17 +368,20 @@ static unsigned long clk_tve_di_recalc_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static long clk_tve_di_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *prate)
+static int clk_tve_di_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	unsigned long div;
 
-	div = *prate / rate;
+	div = req->best_parent_rate / req->rate;
 	if (div >= 4)
-		return *prate / 4;
+		req->rate = req->best_parent_rate / 4;
 	else if (div >= 2)
-		return *prate / 2;
-	return *prate;
+		req->rate = req->best_parent_rate / 2;
+	else
+		req->rate = req->best_parent_rate;
+
+	return 0;
 }
 
 static int clk_tve_di_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -409,7 +412,7 @@ static int clk_tve_di_set_rate(struct clk_hw *hw, unsigned long rate,
 }
 
 static const struct clk_ops clk_tve_di_ops = {
-	.round_rate = clk_tve_di_round_rate,
+	.determine_rate = clk_tve_di_determine_rate,
 	.set_rate = clk_tve_di_set_rate,
 	.recalc_rate = clk_tve_di_recalc_rate,
 };

-- 
2.50.1

