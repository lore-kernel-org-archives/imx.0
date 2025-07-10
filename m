Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885C62F0E5D
	for <imx@lists.linux.dev>; Thu, 10 Jul 2025 17:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169408; cv=none; b=TbU3ILeatyuaPXyHluSw3e8xy4ClZgnb5KOt7SQ4FefrCKo4QLWy5INKA0yfqwQoUlbYT/hhGwn3qT24iAL2R7XOVPw83Nxk+G/Ah6F9Wv3KBGdcY/RR1HHLUy7KgfYlC+9AqO3b+kQO7EECa64r6wEXAWjNndsla3LD48QW9RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169408; c=relaxed/simple;
	bh=kl2qeTWYwIcCK1THSOcO56NA9jbysmHw5mNgghcr0SU=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=VYGc1K45SF5HWThDsS8y9rQ/yFubM/jJXdZgOoXLWK2CSIc04OBtNwp3wFJNlH+k76KM2zVjmFCEwnpJUFfdKO5u0DIqDovktvW5wp0dfXXi+PSDBQKMdjUuRoMKa7AaAbP/CzbZvJmJ5+fGiD8S3TIKBoTX1CfxpKGM3lXYWF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UKQObq0C; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UKQObq0C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZPzxLLqVb+btp2J7RVCrJ2ENgQ7+4k/pXM6bF/LohTw=;
	b=UKQObq0C2HDGxQSGASh/VSqQ5FSWIIgK7bU+/Kt2t32vdJoRHB/JOj1v8nNTlMWIbhJWRI
	f3ExChTznVGtIlqlH2ZBHBKNPeS69h9psk1TFWuvNCOv/foJZt9NhbnHc5bPhRvnmYZjxp
	XGoxWDd7E3gj1PzutYpG2q1DZEhvs2s=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-2CMjPyx_OXy6uobGAqmOhw-1; Thu, 10 Jul 2025 13:43:24 -0400
X-MC-Unique: 2CMjPyx_OXy6uobGAqmOhw-1
X-Mimecast-MFC-AGG-ID: 2CMjPyx_OXy6uobGAqmOhw_1752169404
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6faf265c3c5so19384806d6.2
        for <imx@lists.linux.dev>; Thu, 10 Jul 2025 10:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169404; x=1752774204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPzxLLqVb+btp2J7RVCrJ2ENgQ7+4k/pXM6bF/LohTw=;
        b=CO9bROrb46YtUUZtuXPi23tzU0eeTGEvis6ZZ+t9OPdNZY5Vm9zRU2jBvSmO1PglSS
         Nj/Xep/91ZDxE2YyaCg/dVKR4iNj4qVY3MV48h5/YWFZE7V9P1blfzUTr5EFK7RydUSN
         bG6gXm7mfuaEglhQFtYnnX1wh6YGOmapzI1y4IbSvedDUgSvNQFYiOHLtGTtVVViv6xL
         k367QBU1B4zUdPfN/rFzVPwX2pW92g/Vh7cAciBcO6eW/PbBe19p882NWT9yaqAU53SN
         sTfi3H5vT9GqtQWpZ7aozn8SWIg5FxqAz6MfAPcdcF1JZKLVoS2HwBc9aWld5RfFqxXB
         MLsw==
X-Forwarded-Encrypted: i=1; AJvYcCUIT2Nyp1ztCUQunvJ3oTHhr8DRM7i/bz/pHtU8GsgK4d58R+bqugbp+hrkD8lCozQHA+U=@lists.linux.dev
X-Gm-Message-State: AOJu0YwEEph14VESGOI4U2fLLj8Mbmwi6ludbFWvkNTofifY9UZV08+E
	1lTOWNai6Fmz8Q2QSFXBw9xCuv50O+Qjr7AtSFlD9kX7vB89guQt+ny5dKysbqtad81pikQFe5V
	sLXRZCQjHLc3m/AOByRnaMqxbS9mtIFdYsN00KA0oBpNuxqQvCqkWGw==
X-Gm-Gg: ASbGnctl93v72lJJC1q8BO6QutKoYOy0FPWpDEtiqkTSJkL7GBoshApNO1L0wbPmyk2
	B9lFkHA2Vjs/DALQmL/4r7uo+MK9zRmIF50buXFDj3OSUA/6QBGPteH5jUFS+9Mg4HQk3PshcAK
	0Slt10xLoUv/FCYRhKg2B/aASTxccxofrpEXJCAdQLxLZdiTLAEHcQB9YMP3k+5kIu3izLPBoV+
	RbYiI+qz75AYNctD95ZJVs6ZE7tN+3lsQz3pAKOQejQDrBl+xeInvzQHtFB68kuOjFzdI9PIbXi
	GQlTzNzbaWpoOWXNyDu5Rjhg+Yze6MRSFi2jwi9fLnsycNMttai/61q6n102
X-Received: by 2002:a05:6214:4521:b0:6fb:66cb:5112 with SMTP id 6a1803df08f44-704a3b03a02mr2644736d6.43.1752169403795;
        Thu, 10 Jul 2025 10:43:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFibFyJAqH2Tkc8cSfyuj43nonhKwPGrbHTb1n3BZYj/b4JFbj4juY9nmJvfEsNrJfVGljjaQ==
X-Received: by 2002:a05:6214:4521:b0:6fb:66cb:5112 with SMTP id 6a1803df08f44-704a3b03a02mr2644146d6.43.1752169403246;
        Thu, 10 Jul 2025 10:43:23 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:22 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:03 -0400
Subject: [PATCH 2/9] drm/mcde/mcde_clk_div: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-2-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1675;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=kl2qeTWYwIcCK1THSOcO56NA9jbysmHw5mNgghcr0SU=;
 b=dJ/qA0hGF/+fQfe0crsCUgeeRXp3uEEF5tBBbhlI5F6XFBRbvTidAvVYatP+DdWjLDW+J4Np0
 hf2I1m8Rc9fCuxnysHNHHy4FFC3Lx0PLz51pJGMCy+rQ/pwYO2VWCbI
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wi07WQhLEGc3QmWN0e4zQV43qzW8hSH20PtVSTD8ElQ_1752169404
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

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
2.50.0

