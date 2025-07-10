Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435202F2C6B
	for <imx@lists.linux.dev>; Thu, 10 Jul 2025 17:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169425; cv=none; b=X4uUDS5AG4OAjVRWvNO5WNh/3Mt2PLhbGcUp7KsCFJis0Xx7eNwW8BRwMjrRf1ptF58bRPm/wqxT70EAI+dZDZyz+6ppGfNVE11dDzmNfdmfiIKqLWIDPQs2kA3QRK4nHQb7Piwlt4iHnb+UloNJhoLKLoFRbGLYQN7ghbZ1DOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169425; c=relaxed/simple;
	bh=QsQxnV5P1fb5ziwiaykq6XlQnnjBowQ0Qm5g74Jm8ZQ=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=E2So++0bAEvbRRf63r22rge4TDRVBN17kNAAY8KRKwYBLO32KKOMHy2kVc75Bt/cehbOTYGUQeTqwprNsGReUoPlAWNOp5yX+Wt3B7NgJ00ni5fFhK9ePGl96G/TrdP9m+AtK+qXrCeRMMydxz27qv7KgrFONOIhL7WgyueB688=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vo4cF2/d; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vo4cF2/d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YCUkHqw4OIJFHYNlmvSZg7Gb7N9mp6WEkDCfyaw9PXU=;
	b=Vo4cF2/dCmTm3jn0ccUrDBExBStJPAr4jR197hGpNwDTE/Qyzw3qK7fbc/vTc19TgiaVbS
	0Kghu8YqPxPMlGHXhGAA6PuOuO9dxprAGhKV4saUkhljbGJ2F7rkB7TsKduffAqt8nAxFb
	I/nihzQdLFBFGJDW6KhgWZ6CQAsWoQc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-Y6h41EMLP9-knBQt6rL_AA-1; Thu, 10 Jul 2025 13:43:39 -0400
X-MC-Unique: Y6h41EMLP9-knBQt6rL_AA-1
X-Mimecast-MFC-AGG-ID: Y6h41EMLP9-knBQt6rL_AA_1752169419
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fabd295d12so21688706d6.1
        for <imx@lists.linux.dev>; Thu, 10 Jul 2025 10:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169419; x=1752774219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YCUkHqw4OIJFHYNlmvSZg7Gb7N9mp6WEkDCfyaw9PXU=;
        b=J6g5hYSaDQmucJOhTUp7Yr7moPMa5MUWiGuelZuKPOKP5ixP80HVhZronAT7LxGV/e
         FBloADmQPHWyzGgpXndl/nBVgNk/NBI/l6tjcx17/0pwCQOuBjQrl7UyxzrQEI7dJbwM
         oTFgsRYnlxaQQiDMKD+m5YNWrIXFa0xFrW9GFXvhXf5U14yYkACJwUfzITNRCPuYTFL9
         3b+xUpvF3auNVmzIW6q786I2m88Fv0QNCWneSRtlob9P7b1LSrijErywg4T/E/vP5E+E
         eyRYt9erZyx0T29sMwq05bQwvQWYimqj4xnYNd1ymdP+ezAUNVG/ws5PaKCniMR9fLcL
         dcvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXr1N7x51KiUPB7Sc9l6fOJbTOgA2k7MY+e7/oGgn2zEnv68mke0/YDA3Poj1i7Ed3MGPQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6nwLLz4iV9MxI8JTa3JJGUOgwt/QjXmfVGUc+pf6qldqBI0VZ
	8kG+x7VUJP5bPJEq0qcuhpZQYnolfDbVDlNQxwjeLnjmCMC0db8I2MFkS5rNq5YIhxmvG1Xf8uu
	6+r+5lYYFH2BsLTB7Y9Nu8VoiTtCgfv7cnzcalbRBaRE9Zt5o+tSNUw==
X-Gm-Gg: ASbGnctcSR/oMX8faT5V+udEYV5+5bevxpIdGndOdQVCHCRroP8OYvvZMF8MkMprLX9
	I6WLcXvwYVXMKxCvMHzBZBsDEjK5yKROC2gb96j4LCOMBi2HtupRa/aApgHHMh3NsPcgBRVyDni
	e7FpbRDJ/t6TBCx7IxkCruzRilVDPsT3gMyQtaG5SHPfP26eK5pSk05cUZ6si5Xy76G1Nh+oZsv
	sPtKNiWK2yLDD7QwjA3pmV2cS1AOTa8FMXhlgVcsNB1bAVL6hLX0tRbsswRL6z68xvWZ96YnhFz
	RPyQnSfldNUDde3nOcQ6ndzGls5ZX2qZMEzEbCFz54eImOrhIMOS8wQCr1pY
X-Received: by 2002:a05:6214:5883:b0:6f2:c88a:50b2 with SMTP id 6a1803df08f44-704a354cf6bmr4070056d6.3.1752169419285;
        Thu, 10 Jul 2025 10:43:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHT9fVCmhXOEcnhqu3VFHhqJP8lRdJ7DzuHPSbjh7k32ODCAsPCUcL2Z7QyeRoPgckrF6a+A==
X-Received: by 2002:a05:6214:5883:b0:6f2:c88a:50b2 with SMTP id 6a1803df08f44-704a354cf6bmr4069566d6.3.1752169418934;
        Thu, 10 Jul 2025 10:43:38 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:38 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:08 -0400
Subject: [PATCH 7/9] drm/stm/lvds: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-7-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=2097;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=QsQxnV5P1fb5ziwiaykq6XlQnnjBowQ0Qm5g74Jm8ZQ=;
 b=Ksw8mIL+2RRN/KI5dE4mx3sGUsPAEzJtg6FBiWBslMJaF5i+drzv8/2cRkcR9a0IBfQcYS2SG
 tVJ/WPvWyYACv81xH4ZsEZ5zwtnc4MB29saRvfEdAfzM+LmC3xps5M8
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gdDXhpw0mRoz5umxRY-zOT_Bh0JVebIurDGMiUmRJZU_1752169419
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

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
2.50.0

