Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3D42F1FF1
	for <imx@lists.linux.dev>; Thu, 10 Jul 2025 17:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169416; cv=none; b=S2zL7mXoZlIDWXLKKISz/Z3PvSAle1s22EwNp02wjumO+5lUjYFIqoaHbGHiFx+N9UsusRNrJ3H5ZqpRERJSyKmBtGVuHRFXw+YNclgnOJjt4MIJz76quPTXWE4lTR1mdmF3pYe4yYmponXxzgi1ohymDvHHSLb8wz9+BndJN4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169416; c=relaxed/simple;
	bh=MIrYQUA+EZpetvGrGMmQ8oMPGqbTBnNzDewrKD2iOsk=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=BDwZQeRVkqivvzQu4hUJsECUxzbrq+mGrJ+dXpR3t0JNQ2TkfZ/IqbTm9MJnQQgv1NyDjSX/PO2/GBwiFMiXP9hzEml4UGXRytERPGl6ibpq8HFl98H6ppQStpt660TOb+Mm0jKPwoe2GBYx1yff9vZPQLwE205eWXqZyvOTu6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RdfcP/nQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RdfcP/nQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ppN1Zg1KkN3TDh8kOcLfldTesCc7Q4yAOrM4kF9OYZg=;
	b=RdfcP/nQ+wwiCUL7TitQjJ5AsimGmI+vbUwbN/txPW8ZsvNmp00oc4wMeJAxggEHn2HxSx
	XUvTqx9TuuXoj6yoA4DkmYgnGeraqyXT99xafPTFEGqJb9asi80SpO6/9B2RZ6EniMej2O
	PXM2bhDWmyvy6+JoG+rtpAd5njgnsxk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-0-2uSHPXPImE_2qqnWyOhA-1; Thu, 10 Jul 2025 13:43:30 -0400
X-MC-Unique: 0-2uSHPXPImE_2qqnWyOhA-1
X-Mimecast-MFC-AGG-ID: 0-2uSHPXPImE_2qqnWyOhA_1752169410
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c790dc38b4so238875385a.0
        for <imx@lists.linux.dev>; Thu, 10 Jul 2025 10:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169410; x=1752774210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppN1Zg1KkN3TDh8kOcLfldTesCc7Q4yAOrM4kF9OYZg=;
        b=Oodi8/WCXqPJk5l/fEsGJxtPEts81VnDYxbISjh9ZxVWZaeppf7cB0X2Jyc5VYeeOq
         iVSaT45ofhPnD+C5l0pZtukQxJsIzD47bn1C1X9ttbkVICVcPUiEyq0wYW3xhdKdLozl
         AAjnSa86n9oIbc5OMi6MUawtG5ngF0gMg0oeF0Uy/68ZtzCgvBBsDja9juaaSoyDe8oS
         eSJ1X+xLDTupUV26gBLvroTsDbgqdtrE8cQdeg3kVXOlerEQixUvSpe4Z4ICKPSvktJc
         uGU0/5gcp1KKU7x5oO2scTNONBYxwx5+ifJkeBW91+MqgaBBgcbp/+OcgpC25WE1pGA+
         jJpA==
X-Forwarded-Encrypted: i=1; AJvYcCUTwUR5HB9YJ237m8HX3CQaiXUn7jlSvd+ewAxNkaTu5LJFqTxp0JodTDfCGuweOxu0ZxE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeSpt+Wjx+zSYg0dGURJFCkI7E8RBHC4mFhkHG54DKeVjBZt4r
	ucYjcYAvhFAve8LJX6MIsqtl5zn55+bRbLjZwK4kmdch9x5bFOffUnC9XsR0DdypBrarOPLRxQG
	cCnb9js/TI/rd5mnKdEmBeP+fINv1JbfgJGRCqN/2vrcgKu72fXkF9A==
X-Gm-Gg: ASbGnctMCrDy5EzzWWNJn4LeOPCCluOsEB1j22WiORUpfRgdDRehzJSL0rkfrH2g2wH
	RvIvEiOqlwhAT6DQ8FgLylMS8mRfXS/ng/kRrQ3uGpy4VWt+/OyIEwJkyRcGYnZ2kApj7WaX1Vb
	pffk6j5uR3X22FNHjGQ88cbBJq9m4ZParX/AwEkt44uG3s+OwHr2voOeBNs5AKd5kZBK+7aBIFH
	okEiFccdAaP9RZVOUYxgOmKAafGpa2s/awd8FBHOaj0gyMGkAYIJAlExo7aVBTL6w5fsMWTi3AD
	hdoW4IHTdcOziTsc791tIwJ6IQRih2XD6zv6X51yGLlzqv7mqcM45BOfzwrT
X-Received: by 2002:a05:620a:269a:b0:7d3:ed4d:812e with SMTP id af79cd13be357-7dc97da02f2mr646712385a.9.1752169409743;
        Thu, 10 Jul 2025 10:43:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtGRA59X5211+zA6+bTuLexmbhranU9s00ouhgxHCHsr1K/Q7uZzJEn/YRVuxvQ5eKEuxqlg==
X-Received: by 2002:a05:620a:269a:b0:7d3:ed4d:812e with SMTP id af79cd13be357-7dc97da02f2mr646704785a.9.1752169409169;
        Thu, 10 Jul 2025 10:43:29 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:28 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:05 -0400
Subject: [PATCH 4/9] drm/msm/hdmi_pll_8960: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-4-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1532;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=MIrYQUA+EZpetvGrGMmQ8oMPGqbTBnNzDewrKD2iOsk=;
 b=xNXPieWXOwE6YijWTJ3taaQPCPf8/+I1K7+s2EiMedGqecECqqLSQTFSwjhrnG/onGaKSV32p
 isG7Au5aNEyCqmbZJtcC9vC7jvxXBrzxoAluzBC1poKDa0ziZwvE41x
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 14A7ZfEfr5w5fDXrO2DtlCYt96WKQKdSewnmbALz6Aw_1752169410
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
index 83c8781fcc3f6e1db99cfec64055ee5f359e49e5..6ba6bbdb7e05304f0a4be269384b7b9a5d6c668a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
@@ -373,12 +373,14 @@ static unsigned long hdmi_pll_recalc_rate(struct clk_hw *hw,
 	return pll->pixclk;
 }
 
-static long hdmi_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *parent_rate)
+static int hdmi_pll_determine_rate(struct clk_hw *hw,
+				   struct clk_rate_request *req)
 {
-	const struct pll_rate *pll_rate = find_rate(rate);
+	const struct pll_rate *pll_rate = find_rate(req->rate);
+
+	req->rate = pll_rate->rate;
 
-	return pll_rate->rate;
+	return 0;
 }
 
 static int hdmi_pll_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -402,7 +404,7 @@ static const struct clk_ops hdmi_pll_ops = {
 	.enable = hdmi_pll_enable,
 	.disable = hdmi_pll_disable,
 	.recalc_rate = hdmi_pll_recalc_rate,
-	.round_rate = hdmi_pll_round_rate,
+	.determine_rate = hdmi_pll_determine_rate,
 	.set_rate = hdmi_pll_set_rate,
 };
 

-- 
2.50.0

