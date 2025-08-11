Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A5B28CF6F
	for <imx@lists.linux.dev>; Mon, 11 Aug 2025 10:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909817; cv=none; b=TvZ4mPiuZKx1DrSff/yWoSCGqnbxxRIr/Ggk8Sx84wTgay54B2D6s50FMdN885yreIF/62Ougur4cmnIc08n/L9i9cRoeQkpo+vRWEengYsvlG1NK5BEYPKz3qnqF1+NxbarxfjOoJVBnu4GfC+DyjyNyXSEWObcPU3N6JkYRvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909817; c=relaxed/simple;
	bh=4SmOn45QQwwyMezbBb5tx+ffOCKNsfDDe6H8Sa9QRwg=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=Ic3wUeXB4cEhf+6/E4CXV0KHou2Vc7+M0W04AIRId1SludhfRfyGYkCC/mSknD/3VAqRdAucW2/hJ9ItWad27EB2mb+SzpO4j0avE/W74riirWDpgLH0tOSMJZ2CscpZU0n7Uu8y9t2Ggr+cMXjuVXvNnmJjHQu02B5HvFV/hug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZmKz3ngK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZmKz3ngK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754909815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+Rztee25JuVOb3qnfGrbYzil++DqREMLNxo1mFDVeU=;
	b=ZmKz3ngKEg085dC3N9H8JghM1nP36OE5KfMbtmfqSgrdaaB5LpYJk5odYroEKPl3tQoNWc
	M9PeWGFglU7zJE6QqV/8rRo2jpsOHWxBPSLEIpStNCLAb6tu5U+b8Uja+ls4hzYjgDLHm6
	4H6nFHaVG0mJKNCaUFW6Z8niikKdrAw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-RdLdxSLeMfKd4KY3NACBHA-1; Mon, 11 Aug 2025 06:56:52 -0400
X-MC-Unique: RdLdxSLeMfKd4KY3NACBHA-1
X-Mimecast-MFC-AGG-ID: RdLdxSLeMfKd4KY3NACBHA_1754909812
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e7ffe84278so885973185a.2
        for <imx@lists.linux.dev>; Mon, 11 Aug 2025 03:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909812; x=1755514612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+Rztee25JuVOb3qnfGrbYzil++DqREMLNxo1mFDVeU=;
        b=fm32w25XnMs4F3OvT/nChT3wsz2dWMXTE/EoKNA04DGrzNtt2PXFkZq+Ewprh/knnn
         oyNS6zrD1lcsArVCYpf8A/v4ygMQ7gll9zoO31mopQKx5Bmnvxa0Cwi8ddMP40FFexZk
         bUTGUw3tnydd+El+pIGZmWK036IIfTxyhWvvHY3XGANHc6yBa2sIHZXW8OUghYvgxkrA
         /1usasuwiowndykhAioVCOSrAxKugEjju9DfzPL1VxKXeeyc0ojttRuNMZ8h+EycbS1X
         POPTpkfB9Xfdl84oh2pCP0eZE9GWe+n9CutxHTSma1ykluaDTbStQly2Uf5kko32pLkz
         zFKg==
X-Forwarded-Encrypted: i=1; AJvYcCVFKIYsHwSJtKkuCT6EfwGNTQ45qvltfEwc3XIpUtcoWPUx24DH/A0hyiSr7+VvkOX0Wwo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxmA+ajswx2thRlV24p2LoMlK+jLW0vNztFOcFOhUwsdbjJokv6
	D46dlHgyWSq9ajvln/xAS59Ox9H3f6otLqWovRaF1xFYS1Ig4wJ4KHzGPyiiTRew+SlEh76cM9U
	kq56O3E9UhiGJFhNK0OmP9NCwM5f7wenXA96DFbp6kRaCf5dSu/ii/g==
X-Gm-Gg: ASbGnctQB0UYJuzVIjm+09OqqN5rQYG4e0DRU4WpDx58ITE+Xp8jW+Elld5g9Hak6vF
	JV2Rms1V+fEcfjk3BpxsfqA6CKsDKuafBB48WAbA0iQ0XlGDJGm7zuJ5rXwijiaE0rkM/AdwhzH
	rvQ7Cu/vpR+8gjvmZAATmgXQzNrQyOLormgF/M7I64FPjU3IecnuTlWSwC4dK2B7IzWcvmCJML1
	8mJjvJWTfeaCdTQV6naDbol1RkgSRz5HwEKJRvcLTU0S5fCU2tN59qyh9jEq3IwBSv4iIjRRfFL
	z71P9kX40GdR8KNy8wfkbY91EOiDtU2hP699bzHwSalFpZ2LulmdqEmZhLFfD+X8LWBFfHdqeyI
	8Hvc=
X-Received: by 2002:a05:620a:c50:b0:7e8:1b64:2187 with SMTP id af79cd13be357-7e82c75f958mr1792739385a.33.1754909811722;
        Mon, 11 Aug 2025 03:56:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK2Etk94d7jqWBuBTsPUBpC0ORVIn7oE21Xh8O9EOQgSk7vq5RIMLYWuxIl1Nwz+nt1Y38MA==
X-Received: by 2002:a05:620a:c50:b0:7e8:1b64:2187 with SMTP id af79cd13be357-7e82c75f958mr1792735585a.33.1754909811152;
        Mon, 11 Aug 2025 03:56:51 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:56:50 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:12 -0400
Subject: [PATCH v2 8/9] drm/sun4i/sun4i_hdmi_ddc_clk: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250811-drm-clk-round-rate-v2-8-4a91ccf239cf@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=1693;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=4SmOn45QQwwyMezbBb5tx+ffOCKNsfDDe6H8Sa9QRwg=;
 b=D6lQv4uU9BbCtmlsDXvXPLa8dR0h0DlOWWckbVaEkFndxlEt+IyMNkfDuSVR8NgDYOThGx2MA
 72BwKh/6cLNDsrNiAlNie395a35C4+/kjwVpt/wftlDiaqzAFDkxkOV
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: otjak0aEi1rKnUItCa8BZicp4jDwlQN6Tm2uk774umU_1754909812
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
index 12430b9d4e930f7e7b0536a5cabdf788ba182176..b1beadb9bb59f8fffd23fd5f1a175d7385cd5e06 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
@@ -59,13 +59,15 @@ static unsigned long sun4i_ddc_calc_divider(unsigned long rate,
 	return best_rate;
 }
 
-static long sun4i_ddc_round_rate(struct clk_hw *hw, unsigned long rate,
-				 unsigned long *prate)
+static int sun4i_ddc_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
 {
 	struct sun4i_ddc *ddc = hw_to_ddc(hw);
 
-	return sun4i_ddc_calc_divider(rate, *prate, ddc->pre_div,
-				      ddc->m_offset, NULL, NULL);
+	req->rate = sun4i_ddc_calc_divider(req->rate, req->best_parent_rate,
+					   ddc->pre_div, ddc->m_offset, NULL, NULL);
+
+	return 0;
 }
 
 static unsigned long sun4i_ddc_recalc_rate(struct clk_hw *hw,
@@ -101,7 +103,7 @@ static int sun4i_ddc_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops sun4i_ddc_ops = {
 	.recalc_rate	= sun4i_ddc_recalc_rate,
-	.round_rate	= sun4i_ddc_round_rate,
+	.determine_rate = sun4i_ddc_determine_rate,
 	.set_rate	= sun4i_ddc_set_rate,
 };
 

-- 
2.50.1

