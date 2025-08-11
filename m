Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E498289375
	for <imx@lists.linux.dev>; Mon, 11 Aug 2025 10:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909805; cv=none; b=RmXaVWnfxI0UvRoYvmBEEuCWtGN54gHfDSYObUvXp9E3J+cqjOxGNWzN/RQk4V2LaVMLp/beJK6sd71drYrke4ihEK1gnrRzVdWoy/b7ZOm0wB9cuEqzdd9NQv0Tk7bajD0fcUmgvYDwVV6mPeizJUtBJ7hyisBcnClDIuuZ/Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909805; c=relaxed/simple;
	bh=W4oHtDUPRGuCLmVSKKz7teYp4yrHno03QAMcLtqmgJ4=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=tlT0utiwhol2W7aTrwOy+u2uaX0S9vYD0/S/+GONSHeBpcVPHf47LDrXVyk+CM4n6+wgf5mrDRW3C1yyI8KshlZhvQ11KIspI8TvjcKvQi6o02hJ7niWv//ry3+MrltTJJYaGkOXNYZdCxoWwy1cryMenkp23XTjj50dycRfsKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ht6jnCD+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ht6jnCD+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754909802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2v4P79PdNIaS18Wb0ZUemgbjQrcADYOCCdsS00/Mio0=;
	b=ht6jnCD+UK5qPTQV/qqcpXaGFsnAE2AFuOhFgf7pd0ec2o0Z1moLBKwx0VVsrWpfcdM5lF
	hqYBTzlgWOtoXghqPWs8pvczHzL1mvRt5GewWyyJW2aOyTFNqA886AiB2NF5k+ju1MD6fG
	cJNjhRP2XeTLJQSxMekYKOznr7CKv4U=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-Uqg-8cHsOX-9kU4i3HMcXA-1; Mon, 11 Aug 2025 06:56:39 -0400
X-MC-Unique: Uqg-8cHsOX-9kU4i3HMcXA-1
X-Mimecast-MFC-AGG-ID: Uqg-8cHsOX-9kU4i3HMcXA_1754909799
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4af2237e4beso96989311cf.0
        for <imx@lists.linux.dev>; Mon, 11 Aug 2025 03:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909799; x=1755514599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2v4P79PdNIaS18Wb0ZUemgbjQrcADYOCCdsS00/Mio0=;
        b=Os/rTC6vJJOT7HNVX2ZHu7mSrVBsULaqGmVzDdvIZyzcLg4QBSw41XIiNS7zdCtJlW
         gUOSp81SJuFZzKek6Cvar68ep3SCUw59juSWbEgHO2sUq1h4aW+egsC5ccikv64obcJF
         /IlqN3god5Nnf3odBKuvedFj2EYu3iw2cOJRc3ucH9Zsx276xydENR7Jph2CYkNiqsgS
         7KeREbdIuch7LxTF73Oj6wDPMqbcQWff21nAFskFPlMPPqcIMC6345xmd1soF3Ya/zc7
         473Fa7CV7PDlCriUWb++H/q/RJwqrTBsLDhbj0mu4DJKLoToh2AKJe2S3ZgkJmb/Kbdy
         8hGw==
X-Forwarded-Encrypted: i=1; AJvYcCUoC98pfJHbUwiEPkVAAZdN08vGF1J6OCHpYu0BVFuVKGnJ5bAwW9sXJQyz7reDlgrw7oM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqIkYoMM/jBty2aAEdO20DyXZ/xo9HhU0/Uc55n1v5qqMdPDbA
	4e5HiGlvXs67r1ubFdr7I1ES7w2yoHDzIV4U2XCswon5egxk3I1PJIhy0jlgTP1sCCyc7OS7V66
	+f748RmOShpky0KO3fKDx408QbrTjp+A91G1ADcNHE2NbOQOuH/xUKA==
X-Gm-Gg: ASbGnculKR+sOs51BUwBxAPAW1fRclVndIlEloxu8Wk4kDGKF+LIHk/ohmO6/V0+BLb
	0BnTA12hOX7QAHE7W1jRYu11Wj9wVSkfTDLU2P7kVbWYtxbunaadZ82Yg7xgsWgyk19Wv4oB4xq
	hxaXiVKo3ejJoyWRD/1Fy05sJ6XfviLMtdqGCbEUpV2zPCOT86+L8AUsWdcy5BPzt3wjz9JepNK
	J+t3NE1ym+lHn6njGGVEv5YYsqB9DzD4h8Mc31l6aFCLPDzv6e3IjTvMwOWigghkO1m0PO31W5h
	1ExRvqRJNdnQtfgHIGAMBcb1M9EJ3qNy1vQlcwjGP87WATpNwmY00q47uJtzJN3npbXyskK9jjv
	j30Q=
X-Received: by 2002:a05:622a:1aa0:b0:4ab:640d:414e with SMTP id d75a77b69052e-4b0a06eedfdmr247966731cf.3.1754909798792;
        Mon, 11 Aug 2025 03:56:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETXQEWlFC7Wcyu/io2faEikISODgBHD0p2mDq0e7vALuwZuamzM4hp/NBzXMpTjJQ+LZFp/g==
X-Received: by 2002:a05:622a:1aa0:b0:4ab:640d:414e with SMTP id d75a77b69052e-4b0a06eedfdmr247966191cf.3.1754909798373;
        Mon, 11 Aug 2025 03:56:38 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:56:37 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:08 -0400
Subject: [PATCH v2 4/9] drm/msm/hdmi_pll_8960: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-4-4a91ccf239cf@redhat.com>
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
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=1657;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=W4oHtDUPRGuCLmVSKKz7teYp4yrHno03QAMcLtqmgJ4=;
 b=zHi78rLvdAYaZdTIMhwgqH/js0hiXWDnYr4X0BvUbuN6hprJjEDc2ZwgX+szZViPz4W8X1kk2
 ngDBdMEkWVsAVo6sQ7hWvsQkjGQtaqeiQEeV2wywPAakq8QLF6bboSJ
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nnuxNar0BjG0V6208ZV7wCzQHsRl7nmQ-OmUEY2u3ck_1754909799
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
2.50.1

