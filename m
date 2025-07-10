Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7A02F3647
	for <imx@lists.linux.dev>; Thu, 10 Jul 2025 17:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169429; cv=none; b=KO6P1x42ltWzq+Dcyssi8ilMSGMCh3WuGHh49ZN/DjSQPYJ3WB5j9Jj4AMtb/EfjOlNxxe+K75XWy+KOQlWYGW6+kh91HvUQZPP50bwKvH9gCcTduOxSCYMmOTe/mdxlpCny0/sP1TJ+8H/smnYmsokK9qaDFsMIP3qYc1WXf94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169429; c=relaxed/simple;
	bh=xPkagiW22ryYRgcFeUxKsYb4R3sx64zzzkaF7TIS6rk=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=EDT7revl4PPULnDz5OD1ij/69Ju0uqsgQhv4MSlFxnski5nclEgNg16QoQGdLZ5Gw9U9dKdMYbB44HBiyJ4lRzY8vWlX97OT/eofqj9SWmnZE8Ic62J7IuFZJZM6LBLxAIAGuZJ4dF45cZnCfWb5khkW2h/QnLx/G7hWjMfo5D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C1NKOcA9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C1NKOcA9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/OrtVi+H4smani+Wxuj7rrrlvdLEKHZeWuJz/QAEtZ0=;
	b=C1NKOcA9WOjno+qVJncqzTsNd6tK1OAbQ/UwBy4EBdMnt4Xsye00ti/gS9SWSzC72f3Qme
	7/4nj1LECVyixuEcNUN0nPDlCSFLDGPZNcQ9nKJJXF3v7bGm4gP1VEyNxbQNKMyEYFUU2b
	VY73g0YPuvBXipL1Hqt2qlcEP3OjR1U=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-Y8XhjD5eMtyIkWusfMyoLQ-1; Thu, 10 Jul 2025 13:43:46 -0400
X-MC-Unique: Y8XhjD5eMtyIkWusfMyoLQ-1
X-Mimecast-MFC-AGG-ID: Y8XhjD5eMtyIkWusfMyoLQ_1752169426
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6face45b58dso19844316d6.3
        for <imx@lists.linux.dev>; Thu, 10 Jul 2025 10:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169426; x=1752774226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/OrtVi+H4smani+Wxuj7rrrlvdLEKHZeWuJz/QAEtZ0=;
        b=UQvNbuzo7bRy01A2rpluqmRq4B6mz6fQRW730Kq1lBdcBsDtGkjgBz8wux7irWpGUV
         gOfLqihTyhLrHzYlEdLH4SUaeWd3bl34MGdgAn+MsswxyaiQIRMsDCKWCv8kzprrrHFK
         HhRVVENag7jLTjFrMr+CzYWcvct+4QQ2nj9la13m+TzLErRs+lRkoqNzGrrq6nNEvcOX
         m4bbhnCcUmo6LijgXvm9iMAtYE2JPu8mkmAca27/QPvYbTfSMQtMHfYuRaJ4wvB/tw+6
         G3gwwdL23w5ESxB/A9uhXxlE5Dc0U1MdOuW121bgyqaAdJ9WVn12yJun5XVnqbUJLqIz
         9FdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUk+cRf5LxU5GIvgjk1bReQzbPjKwNr3xTPCtXjK2vATzUNur41NsesESPzl840WJ6dLc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7glXJcEKG+VoYgOCylZvo7k3DfMQZGb0/1o1fxTZ84fMKR9A+
	5pm5o5hhfL95r+eD0bbuyLh1bpBRpvlKVjqFQnmbCtXOnhnPGpOZ4CRIF8WN26nZasK6b8LviyE
	qeeaKVGNg46+LPg03bUTnb3X2uYwrOG4zMN566VhXMGnBSKP8YubR6w==
X-Gm-Gg: ASbGnctGJ5ZnWnUknS1OaveEXr8XVACu7LinJVoR8DM69YQKqQhFD5QGMpfYgWv9Xbw
	uem9vbqELe1UetcFRuKJoNf2/owaiv+evcmPCgQG8GkY2seTAXToIsyRhJLudG5OJPLRfekzRBS
	SCHjWbGHZD2nR9SktFyBm8sIHCNfR8E0osFGuOWbNfG8mDrTH+iZvQNChJM270Ns+YB8x95a3Hd
	iKaoU5LhmhTn6hkrhijzo14Ab0nMAissrZbncxvOdH/68E22/5+I5bxaZhufmlhlCudNwNNXIHM
	KkWUP2/RyE4pi76QTwMpmYmtmEKeW2kV3CLJU5R5S7N8nUL6YCcij/BqMCI1
X-Received: by 2002:a05:6214:5d0a:b0:704:9bc2:be36 with SMTP id 6a1803df08f44-704a4083bcemr2613726d6.7.1752169425788;
        Thu, 10 Jul 2025 10:43:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxO+/+2HUAUPTiUYztt/lC4Yi0Q22OZoIfFBMZk64H2H2sqirYgZh1L3qOGgIkQVmmCaX6kA==
X-Received: by 2002:a05:6214:5d0a:b0:704:9bc2:be36 with SMTP id 6a1803df08f44-704a4083bcemr2613296d6.7.1752169425386;
        Thu, 10 Jul 2025 10:43:45 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:44 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:10 -0400
Subject: [PATCH 9/9] drm/sun4i/sun4i_tcon_dclk: convert from round_rate()
 to determine_rate()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-9-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=2262;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=xPkagiW22ryYRgcFeUxKsYb4R3sx64zzzkaF7TIS6rk=;
 b=l1P9iwEOFZ7iseMUGqrDwyTv1j/GS/74kLm+7ZgYbXOn1R2j8JwTxirCensojfrRCiquhbnNY
 RQW74FdbQM8B7MkeQZA7rAthmyuLBvNMin91wee7+2bXtn9fga4VsSS
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tMhzWz4I5zeAaE-q1nFXjocVWh0nPFcRN4Wj8UtdF-c_1752169426
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
index 03d7de1911cd654f395ea85ad914588c4351f391..9b85bf512d4c81d0a12e8cf726d5d5440343519c 100644
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
+		u64 ideal = (u64) req->rate * i;
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
2.50.0

