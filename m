Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738B42F0C73
	for <imx@lists.linux.dev>; Thu, 10 Jul 2025 17:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752169405; cv=none; b=hwIHQ/LJRmrJqaZ8HAS2yF/S4OaNm9x3oSwUJiFWakYRiovlnXOhIV9PhRzMlwMh0svFFA3FVJvkLVJ4W1wvARIM7IeLMMiVpQhL85MBrxSE0mWiv6O9qpHCy6JuDRDA6IJmTQZYMQGHpOH9orPs9q4MDAdQktx5HgVz4Ek22iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752169405; c=relaxed/simple;
	bh=JMQuzI07hiKrV1ATnFggAmht1J6rMxSCqpxpi2ExgQM=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=jt/3o2WVzCqAl574wH9jLmWPdJTL7gtRBLjcz2UQcIg3bloRm06Ac/BUk6lSyj4L9QJHzMvMycNZhuPZ2cA1lKl4kAApNqF5TGBiJvLZO1+YhLXxDZCgPIoszDjbBYl7uvyiIyl8+HpA4ekir8AIT5/W7fGSxZ6qtWDyI0cLmfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B+6OjqfQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B+6OjqfQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752169402;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uSQAcfejxg7NhusLP2Sc0sAULtF+i3/IlJefnecYrRg=;
	b=B+6OjqfQc7p8lwXolVXwYI/sb1mmSew49ZKRY/KEFppN5CIQOX2tXqR15/HBHj8Iyhiy/w
	zPjmigVnLuQuNw8K+YqgZwb4FkLf9h76UTuRQVA41ahpiwjgsdo6BcLdBctGGtqYANHUlm
	R6LGc/pNG5eddjJzwH+hFdoOer6ePn8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-SxCNb0HRPmi4YFqYV4qP5Q-1; Thu, 10 Jul 2025 13:43:21 -0400
X-MC-Unique: SxCNb0HRPmi4YFqYV4qP5Q-1
X-Mimecast-MFC-AGG-ID: SxCNb0HRPmi4YFqYV4qP5Q_1752169401
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb3487d422so19527896d6.0
        for <imx@lists.linux.dev>; Thu, 10 Jul 2025 10:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752169401; x=1752774201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uSQAcfejxg7NhusLP2Sc0sAULtF+i3/IlJefnecYrRg=;
        b=leF5HVz22e7dAaTm6Wg8gjzPboNWglIFW3hO2HKw80Fp0XSsTdLkMVXoY71SKA804X
         h77wTMdD+65Fgh5EkxLUhn24sjhZmzfyjSmdULkqnSXDnn0kgIporAsvU8OyZq/38qul
         09vI9DxBR4KmtL9ApVSm97j/6XTVNhQxIMWcZGARil6WvCl/5MlrepQ/53TbtwDARVO6
         T1EbilRmJfU7IzwOvPfk4dg/AQiRaMRlDGMWoU0yVRyLzgMsri1KC5rf481baWToj6hw
         l9L7e1VFGBU/erToL8PZ2TBi/3A4YXW+l3U0unb1+w+6/nkG8kOXXKveUKD26FpQk3IJ
         Ie9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxo5XTKjZOLFQocuD0ZpmDqtClo3rugr2eod/pFFxcF6S9NfhZQktygzNr6sl8Ivard+I=@lists.linux.dev
X-Gm-Message-State: AOJu0YzjAth1qpe0sPeoezHkXYJopTnNNnx4K3k3twAl6eZ7mcwUZ/ue
	jqM2kqrrjm/z7xQrsnmugoouRP2S87yv/6TnzOnsXOBHZ7MKjbGecMNs/flCiEJ9r6vhvNwcZbQ
	NB7p2LzX4WshIRHJQY9syvmBAlh1I66W0b00Iy2pAjITvyZBYIR8qlQ==
X-Gm-Gg: ASbGncvxaNILR3ykdHyE2HdXmiONj0JEi4i8RUt1G5ufgXfolmV2O5deYRieyqVvndQ
	tVOkrDNtVRk4SeMUdk1B0sWTZG43TObYZM/FX059pGwwDrVot7oottkazOekve3xp0n49SJ92RX
	I4T7d9byG3mPvEBmrjUtslHBoH8ijw7tSicyF2NHxu/CXNkVz/bzNU695rY9IZHQRg/F1YXpYTg
	84o6qLWUYND+Ep2fLwmYkzcJpfqX07x2RW8naK6VKZznE1AdO84/R7UVQ90uzR6j8w18gaC0O/+
	/7c1ATOp+Kr+s9d8imoJ/nNugw67S+cNYLODcgx9RYqeMLQMhkBW1MmFFeLC
X-Received: by 2002:ad4:576f:0:b0:702:ca9e:dba6 with SMTP id 6a1803df08f44-704a40f3f86mr2464586d6.16.1752169400833;
        Thu, 10 Jul 2025 10:43:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGneFeZHD+R2IlA/RJ8povEc4F9IjcKH8Fgp0p4dCYgtfr/rKSizrHDLTlvLp9E8FfSRTeZdQ==
X-Received: by 2002:ad4:576f:0:b0:702:ca9e:dba6 with SMTP id 6a1803df08f44-704a40f3f86mr2464046d6.16.1752169400264;
        Thu, 10 Jul 2025 10:43:20 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d71419sm10652876d6.86.2025.07.10.10.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 10:43:19 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 13:43:02 -0400
Subject: [PATCH 1/9] drm/imx/ipuv3/imx-tve: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20250710-drm-clk-round-rate-v1-1-601b9ea384c3@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752169393; l=1689;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=JMQuzI07hiKrV1ATnFggAmht1J6rMxSCqpxpi2ExgQM=;
 b=2cWi9RxWr4DG/uT+Adfe1rLsJLWqf/HsK4V1CHvsD1HqS0tzYLionTpIhnP/uRurPd7gfFmll
 2lm+LwJba1xA78TVoaKVn+hJWZX7dEn9fhckaPz4uGeZs+gsOpWRugK
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EYsCTPPuX1zye5gXsEFfz152rnLsnXEBv4DkLkqCYbo_1752169401
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
2.50.0

