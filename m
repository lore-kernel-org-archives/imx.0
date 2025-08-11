Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C73B28C840
	for <imx@lists.linux.dev>; Mon, 11 Aug 2025 10:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909812; cv=none; b=mXRogqU5BuTdpJkDOnIqCEeNrtUG6Lg/i+SSKgodHfrfV1wC2Swnv0MimZHvWxyED7YhcjffcD++WseRrXywHx11h0I+kltzHCaad8snDr7Y9YMmXEyCDtWaBX8JOoRewt2sY9qS3KugKx+gGnEQXFa/gOwpOK6ZmXJCYEqZJ6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909812; c=relaxed/simple;
	bh=juKzshMtQ4DF/h+L6Akp+woYewfsK6BXt/oa5cMlZgg=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=iQ2fZz3IinpoJlpeDk5W9GC3dLdwu/6fH04GKRaJ2G7cwos1FHOUKThBInW8S7NGVmo6zGJWOVxI5BPa6bMzGgdVKiiglYlzX3NixkJwkkjzhok8s6wrHyCn7p1+6FjEd/Y5H+iW4YlH//DiA08x1kvr0nLtfxI0rtn24Lp8agE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jISHvdsY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jISHvdsY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754909810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JStqtZIS8blwztj2LAAjIqKUEnudWLKj0xcXYk/QJ50=;
	b=jISHvdsYD6jcN7/wvI7KnETLgeVyEt8rq00LMA7opD7JpD2RNXUei2xFUrah4/AXn3PIje
	4Z0tMauhQi5rYOvvK/NJ4HFUmbijTJGASrzoMMYJtMnOy2xOJ7ZSVDfFdznWiJoB6PqGOs
	nDuX7zhdhWOU9VJoz+gIpKRtfCnCIRw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-9b5LKo-OODKJIWvqdrWLUQ-1; Mon, 11 Aug 2025 06:56:49 -0400
X-MC-Unique: 9b5LKo-OODKJIWvqdrWLUQ-1
X-Mimecast-MFC-AGG-ID: 9b5LKo-OODKJIWvqdrWLUQ_1754909808
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5cd0f8961so971949585a.1
        for <imx@lists.linux.dev>; Mon, 11 Aug 2025 03:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909808; x=1755514608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JStqtZIS8blwztj2LAAjIqKUEnudWLKj0xcXYk/QJ50=;
        b=kNO8xZpgmas6BPdjia+m8BGljT0QzL+XlynxhCkxvSK8MIwt2Qfj6beNH8dO86NPa5
         adG6tcpX8OGqOEDW68XjUrbrNc92/b0ifEX64Eftu0meiQTE6eR0mEpqPGJTRVonM1vh
         h6EeFEuy79M6cWVnONyDv1tORnMNR1sYyxHXEFpouW8rb6G4VPKB02G/svK0FKUzNJSM
         ZwW3+GR2pvYqSkda9iMfTv+7zPkCkn0oI3GdtJJa4yYPU0qMLZI88zPjBUBItbp8+xfJ
         le25TERQJV6TlghBz1Wp1/hMQp8yKvcepuWAedP90W+d+TEeKXNVOnJcSA7g7T88HWVO
         dJXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkRIzRobon5ajMC74RZXkR0gNvNy0GdcthThmTwauC4NQ8P2LhNuPtR3FbnIbHK3Yq1Vk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw++Mh41NrBUbqOY7Sqc1trcyCe2X6ZNDbBmGu1sG6VT/Aw1Rm8
	QmD2/VbJnZf0VT9x/7SyP8Zc8PUrCc/jVqv57H8vwPnq/dR3LWp0Hi6PT3jfQV6dqlpbnI3Nd8S
	ztxNnhLIVwp6R5u0qmrcqwevw1XBHwU0MtEoi8eP1itIEjco4wTYnHQ==
X-Gm-Gg: ASbGncu28aPEclH/U+0rA3IgGXQkIHctNrsDa9K7kttk3eA1ss0nlfYw8y5DSueXJdX
	1Y8MUSepBQra6pqGwwVlCnu0x7aoNCw2E/Gom3dVXXGhYPFvT9GDJQpBFTvHa+K+l1vW0w/+fwj
	fFLC1eVyTU/5WWZG4OzxTpXCMltJYwRz6hYmVjBGoCr738Om5m1EHifJzb+DoYJ+ygPVPQgtx1a
	jwA4MoLMDrEqhd6TLbFU2fK0ANq82G4Azxwzmmt3+Gq4X2dVnD9rsLXKWxjxU9cRdHQrF5vD6M0
	9LP0Ee2VGwQQIb4MkI6vCE8/Spj25seEAF2a2gTH5NtjZ0S+Ye0c4sy+eyvfh8ZvJQYbD/2ML11
	ZYbQ=
X-Received: by 2002:a05:620a:a00e:b0:7e3:60cf:c037 with SMTP id af79cd13be357-7e82c75b89cmr1125685985a.34.1754909808547;
        Mon, 11 Aug 2025 03:56:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhnLELhezGJADLmdApayEoevKdtEKOKSDSvgPhqkzq4hJSUIbUnZL0k2iE8nto9nf3DAncrQ==
X-Received: by 2002:a05:620a:a00e:b0:7e3:60cf:c037 with SMTP id af79cd13be357-7e82c75b89cmr1125683685a.34.1754909808062;
        Mon, 11 Aug 2025 03:56:48 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:56:47 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:11 -0400
Subject: [PATCH v2 7/9] drm/stm/lvds: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-7-4a91ccf239cf@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=2162;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=juKzshMtQ4DF/h+L6Akp+woYewfsK6BXt/oa5cMlZgg=;
 b=srQL2Syf3qoqHVxtrhYtzT2hxKDJiG2H0/4WtgjDA8OLuly+icCFFE04ANS8bywbgRo5Semzj
 RZvKazBg3coDcnWyiIki4FOxz5OPAdab1K8jRW40iEHpLbopisMgRC3
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _F2HOPMVF_KGd-H7eb4hfeRE9b3ukLs8h0fphDuXmTA_1754909808
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Acked-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/stm/lvds.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/stm/lvds.c b/drivers/gpu/drm/stm/lvds.c
index 07788e8d3d8302a3951e97d64736b721033998d3..fe38c0984b2b552e1ccaef4d1e589b9d86a40ee3 100644
--- a/drivers/gpu/drm/stm/lvds.c
+++ b/drivers/gpu/drm/stm/lvds.c
@@ -682,8 +682,8 @@ static unsigned long lvds_pixel_clk_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)lvds->pixel_clock_rate;
 }
 
-static long lvds_pixel_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-				      unsigned long *parent_rate)
+static int lvds_pixel_clk_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
 {
 	struct stm_lvds *lvds = container_of(hw, struct stm_lvds, lvds_ck_px);
 	unsigned int pll_in_khz, bdiv = 0, mdiv = 0, ndiv = 0;
@@ -703,7 +703,7 @@ static long lvds_pixel_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	mode = list_first_entry(&connector->modes,
 				struct drm_display_mode, head);
 
-	pll_in_khz = (unsigned int)(*parent_rate / 1000);
+	pll_in_khz = (unsigned int)(req->best_parent_rate / 1000);
 
 	if (lvds_is_dual_link(lvds->link_type))
 		multiplier = 2;
@@ -719,14 +719,16 @@ static long lvds_pixel_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	lvds->pixel_clock_rate = (unsigned long)pll_get_clkout_khz(pll_in_khz, bdiv, mdiv, ndiv)
 					 * 1000 * multiplier / 7;
 
-	return lvds->pixel_clock_rate;
+	req->rate = lvds->pixel_clock_rate;
+
+	return 0;
 }
 
 static const struct clk_ops lvds_pixel_clk_ops = {
 	.enable = lvds_pixel_clk_enable,
 	.disable = lvds_pixel_clk_disable,
 	.recalc_rate = lvds_pixel_clk_recalc_rate,
-	.round_rate = lvds_pixel_clk_round_rate,
+	.determine_rate = lvds_pixel_clk_determine_rate,
 };
 
 static const struct clk_init_data clk_data = {

-- 
2.50.1

