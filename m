Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7D52F2C4A
	for <imx@lists.linux.dev>; Thu, 10 Jul 2025 17:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169426; cv=none; b=iTT/0KsXYCZTSH5eZVvGjIUQlgsP6v2351yGdAUd9r4cIIPcyN5f45i7sIuSuoRMjEVlbrF44UJ1ThQetITVG5Dof3H61Cp/ZVWZ0a+2hVrNEHWj9s6Gg9lHm5sqi0pZ/bbMp6jpKOY/byFXclQwNF0OmAf18BOaDP+KCLog6eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169426; c=relaxed/simple;
	bh=OHsRnwsdtf93oenlkpM8OGpjPNCqkqTYz1ncE/Hukgk=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=Sg+vpxoa7fSDbTHrs6jTqRkkQhJohbkKg7zCoKa4SZ8fGuB7rFYtaBPawiIQW9QrI9IVf/+AS+VVRJriwV7i2GoQXXemiiuQ6aZ+JXW3vcW2Rzk2NyX8mZm6D7sJVgKFtazfL5DnMQGpOmEbWHNfOKQ6f5zev+Hbu1P1ePCN/nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FNh7qlXD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FNh7qlXD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=exSjMafszsHf+hPI+jA3EKbDPNjmXxeN/VchItvqKMU=;
	b=FNh7qlXD6m2QLcZ3QRT4K5kIxg92JTM+rUjeJk25DvzaNoB/evf4izVsHdYE8cqlmUJqOq
	yiRnOq67x67x4T2EwgevrqcJJHL56py6c0HPE9dmZBN21DAgRpOBHaW2qTO/4ta4i+gN4K
	dlNe6TpPpmEbjjMS2z/n9CJsbSfV2lU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-eIn5lTn0P3qYLC6TOX9txA-1; Thu, 10 Jul 2025 13:43:43 -0400
X-MC-Unique: eIn5lTn0P3qYLC6TOX9txA-1
X-Mimecast-MFC-AGG-ID: eIn5lTn0P3qYLC6TOX9txA_1752169423
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb5f71b363so20704316d6.2
        for <imx@lists.linux.dev>; Thu, 10 Jul 2025 10:43:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169423; x=1752774223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=exSjMafszsHf+hPI+jA3EKbDPNjmXxeN/VchItvqKMU=;
        b=rNamRKr9JF7FkhukQFEWdDadeEx/JGQ6q6Fmb4U47a2HIk5q0l5Z8BLZ94JG9zbSdw
         djkKY3xfVSIVsNnQsZsVgRYrGxv2VRajIMfdxcWn+SCB6Pe6RDYXzW9uUwiByQtvcgjN
         qEYZx9VEk0w84H+S/U/euNn9XoXk6nzKnbDbuVj85kb1r8WwqdVrn31n8xXH3uTpMxq3
         bAd/vwnzKUlQ16Z/PRUY7vkPLjRrR1M2t8jLdin0/b81zKvGi/gmWokTDrfYflcgtwWt
         QrMW9vyedcHUufTRwhT7l/H+ckhovi5y8D16HfK0fje9TlWPkHLaTehtsasLJYagtPts
         PMFA==
X-Forwarded-Encrypted: i=1; AJvYcCWniqVmOLL1Yi5m361kJzfk6TX7DqghyHjDr+c3k2QHPfPmGQXkWIluQj6VVxnbVzf4O3E=@lists.linux.dev
X-Gm-Message-State: AOJu0YzElpGGfSID6uLR7IcxVRT2DZS/rxzAoUnXwHRFCDf5a+FAVejZ
	7DixFUOcnjSEX04tNA9RsTO8L0puoeV0qjp+Bhcx4mfdN5NtB0UQZX5sVJ0Syts5WWfAn/b4gB5
	actOQ6E0vEzsqtKmsJ3UrInl6SLm/dhqjPj0wnlob3ONK2En+zOvGIg==
X-Gm-Gg: ASbGncu4KBSO2CwBi44jMkom8SvrUx3jH0fI0AR/ENHehQv3y+z4kyZIlI9nqJ5l/+c
	4raUR2vqa6IWfKFvRQMr+wquTiWpI8APRL2x297HS/Lp3J9qocpmaeyBZuyYdI0n59GH4msdVUG
	Nz8sGhCw7TzWqyr7nLhDHL0OvTutYY7P4eIJgzYMVRvA+dwZNC+BBTJk6RoNlEOUCGdlapSXnRO
	fj6y/ztNHbR3X5LGDrIl8Eh1m/67WisrOc9Y3FSTToEf+zjZOLTaV9wHFpkV+NGO8CxnpJSulGb
	FjZUgLwGmacBp21hT34QFwq168bWnCuAWS5gKuizB+0sOPEpujyZCzQ+5POs
X-Received: by 2002:ad4:4eab:0:b0:702:d7e1:9a61 with SMTP id 6a1803df08f44-704a4325359mr1692736d6.32.1752169422755;
        Thu, 10 Jul 2025 10:43:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE946PzHD0RXk4GY5dDiYIFHgj5udxSitTpswAFFe0EalaGRnpP5sdgmvG0/oOdFa+px1bfeQ==
X-Received: by 2002:ad4:4eab:0:b0:702:d7e1:9a61 with SMTP id 6a1803df08f44-704a4325359mr1692226d6.32.1752169422349;
        Thu, 10 Jul 2025 10:43:42 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:41 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:09 -0400
Subject: [PATCH 8/9] drm/sun4i/sun4i_hdmi_ddc_clk: convert from
 round_rate() to determine_rate()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-8-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1647;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=OHsRnwsdtf93oenlkpM8OGpjPNCqkqTYz1ncE/Hukgk=;
 b=ho7GtAWEeFJp5Ux6aTEtHmHkJKzsUOAKpGEfNDI+F7l5XbF1qK2v1eRvTIse1y82RTcxYpTS9
 vSPNZAJFAqpDDKhg/zIW7SbizIxqSMy8J+QnCYzoa0xmplhJw/HPvrO
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uhFNEwH2yJo3kHcrEoQEz0uI9VKPI764ceWasCNPAtI_1752169423
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

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
2.50.0

