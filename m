Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E38368D70
	for <imx@lists.linux.dev>; Sat, 19 Sep 2026 15:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789830132; cv=none; b=sZDI52dghHWbmdQ95V8HnK3MvLdj3iOjiB1poBnGekapoJiJOD8YT8+Pv+MuZh5Bwcwstd5lg9SRozt02CNuwd3vsAtPWRK0yK0AiPJr4YVzaEmDpmgDQRG+um75pLB+k4jEp66LSsMpeEPn98oN/okKzOTFQBWnpbMpavqM7Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789830132; c=relaxed/simple;
	bh=Iq5wCYI4y0W4CO8EIKI1BJMBBMwBjbLDSVf3wHXjWNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WkQM9Nh9X8kqPJpE6GN+PQw8KjhdH9K+yHsWIZUNNZsnapulqtpct8lWD45O3k9fhq8xfbpiFhB6muHd3v2lhkefKQfAGo3OEQbkCREiGLeTw0o2vOfkjnLD8WpPKj2fiIMCHEGRkCpbH4XwfgGlG8lprQQ0sXIjWSc/4htdYUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7ZY0YhU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kgcmoKKk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7ZY0YhU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kgcmoKKk"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68JDJvu33674439
	for <imx@lists.linux.dev>; Sat, 19 Sep 2026 15:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1hfwXULKbsk4d4JT441CnqKGFUUFVn3mbcsujz6vsww=; b=f7ZY0YhUSOf0HpjX
	ctTCgwiYIP7vPW0r+GlufaGoFYZ+HV/3MvVfAGAdURU77H52IW909HGdolkoRK3q
	K1uXFKJA89mO6aghfcXYO4FkgWwjGTn8ISPsBIOZqrzdgASwLHKECgr/Uh7w1iCv
	d0sUMJWZGpwXPlwaiSoSn6sHKcoKovL8Vr2UeXApyJfryd70gFW4E2tohizGuNd1
	wtAOmPl7tRCSJVvrOBSGy5BlOJ7RXsXPk8tcqbqifVts6/p+tNhjeswj+3U3JYAr
	MTB55XZE0FNwyjj4Iw2e1UqZQH1/Nmun2WUm44HYuQIdcCThNZ3y6DGWcWEYnbDY
	CijVJw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshqfs6uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sat, 19 Sep 2026 15:02:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso2909848a91.3
        for <imx@lists.linux.dev>; Sat, 19 Sep 2026 08:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789830129; x=1790434929; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1hfwXULKbsk4d4JT441CnqKGFUUFVn3mbcsujz6vsww=;
        b=kgcmoKKk2O5+8G7JikthtfW48qeagXxjPEM8fz89J7tdAjtiS/WtqIlyXBEiRVpDwZ
         exrS1t4d8g/GZcBoqp9OAggX+G6zSj55bK3ZrKTZl0c3tGE1oBQyNE8xhe3kHMVaW77p
         xw9lRuHLj3mls6k0KXaiabC/HZB/cBMtI6uLMkpjgLDAlV3EOANj7392vm4PVC993cDI
         GaxRlqJElctVIwFgf4dvhjNd3c47oBZnmCR8xH8qfJw9fLxLQxU/57k+FuG/ht42LOiq
         QYgIfDGWfnnonWxFhJIie9NV/USEjcHS2ClLkdVR2inuyNnqOr9ugRiJbdCtOf3wgBDH
         np4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789830129; x=1790434929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1hfwXULKbsk4d4JT441CnqKGFUUFVn3mbcsujz6vsww=;
        b=wfRc8bNJZkE6gRUcfLIcUHueUgfI9FUhbmYUETt3dXLGguMIi0va8HAd33KR7UChnN
         iFWeCdhm7B2SMdHqIhZPWSIILxbsdDxEPrWBTSV6ykl9pkhyDXWv3gzWUcSPlJJWLnQ6
         6UCv3kOxuxhhnbR8lMdzkpIO1nIfiEZ2nhoPQz8fqCLYn1WqovC8XWHkIY3O9kN3iHUH
         mCN5uUO6mCrVh+RN1KjVzF0+m/yf1tjyNf7hebG2FE+qzXOOasMYeFQw0v694+77Kiaj
         kCvJ/2BLkOWyRBYaFl1oqLwImU0kIROsCRgYxMqOVaVd8oyQQ2qF/8PCwnIJKZOQRz/C
         TqYw==
X-Forwarded-Encrypted: i=1; AKwUvByp/4wVQhlChGY2HqVUfC7HG9a+nwY6fKboe50JMmUF9ZQKCOVgb9HwDKEwaBoxc2XXoAY=@lists.linux.dev
X-Gm-Message-State: AFuF++kfBOyvhgBN2P9I1ilOdbosYtLyfqcfKU39Lmavg6bjsU89HuzI
	ucgWhuUBr8UE/zgMoCmYvOcam3S6KbosMUQPLXKjVKlA00bcgYO1IDUJB+TdGToZxSShW1ipnAK
	ITNPg8EEJO67kGGwTf9I957s9IovKOWQbFcyPY/cBRsMC/5RWpiHJnIo=
X-Gm-Gg: AYBFou0KVDCMY/b2JrJegbRuNCXb+lm2xkcjsBC2KPRUerpq/MyeB8ZSAv+zErh5xAf
	lDD16FPWqPDEM/imJYVde79gzRhs/0499rLo7uaeMxiyjJv6bUixv4cSlfY8UPAQ/NufNK2kM0R
	2rDSdLUezbr5pGErUbiVQVAmPaH8hCIRz+VxRHuGPs72vvcWFDfj1Wz8nE9/SeM3B/Y3cxrF55W
	CIPURiJ4xGbVeJmE+VovrIci8vXdE4ITiXc3UveEUhHBiGX+AZFGnRTkoezjlBCk7H6YNDlBK+c
	DBjBwo3ngvAEC1Q4/Uigrff2HDrSwTsHIMmuctNBnofQP3F7QFTH0MP6a0JhhNydhYKc66B1dMF
	ObVwFcI9uWqVX
X-Received: by 2002:a17:90b:380b:b0:39e:4fec:d6e5 with SMTP id 98e67ed59e1d1-39e550707e6mr12911315a91.16.1789830128705;
        Sat, 19 Sep 2026 08:02:08 -0700 (PDT)
X-Received: by 2002:a17:90b:380b:b0:39e:4fec:d6e5 with SMTP id 98e67ed59e1d1-39e550707e6mr12911270a91.16.1789830127971;
        Sat, 19 Sep 2026 08:02:07 -0700 (PDT)
Received: from [192.168.19.100] ([155.117.96.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb400c3sm5045206a91.17.2026.09.19.08.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 08:02:07 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Sat, 19 Sep 2026 22:59:35 +0800
Subject: [PATCH v4 1/2] drm/imx/lcdc: avoid duplicate clk_per enable
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-b4-imx-simple-kms-v4-v4-1-53b1fdf4589e@oss.qualcomm.com>
References: <20260919-b4-imx-simple-kms-v4-v4-0-53b1fdf4589e@oss.qualcomm.com>
In-Reply-To: <20260919-b4-imx-simple-kms-v4-v4-0-53b1fdf4589e@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Marian Cichy <m.cichy@pengutronix.de>
Cc: Ze Huang <ze.huang@oss.qualcomm.com>, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789830097; l=1626;
 i=ze.huang@oss.qualcomm.com; s=20260704; h=from:subject:message-id;
 bh=Iq5wCYI4y0W4CO8EIKI1BJMBBMwBjbLDSVf3wHXjWNQ=;
 b=tmqa4fZQfIDCN/GOTkNIfTyEWA8UTbv055ypJ64BGtdU8/5Urz4AvTiLV2g1hJeags1QTwq3Q
 58mlELqcocmBR6MCKokP5AWbZEcfz6PmdURks+gKVIxWlxkwIohtakU
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=pSsISLZF2ubEjJRmslsa6Ps4W3yAuPY7yaircQTlQQU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDIxOCBTYWx0ZWRfX7VPGtgF3NIjf
 MRrC/J/0rg4+4804cPOPyQmSeCne6KmBaT1oNbGGjB4TZmFlO4Klqxe9V3jrix4FjYv09qzwC7c
 BqbOVjhLMkZ72tc6qqptXfNkIWDrpsZ6euZCd7WONhcGEt+KcJizbmGURjBJi8XSVgdqVATRYdC
 KsW7qvNu9lHM+IM/iyi4vIZzBlmNZCCWYwQdUiNqt3STUGqLFR8NSUfgU+DZw5yLK38mF2Jyay2
 4lO/aMWA/0P7l7vnxavRLiT0nEM/ByV9FZx+NZhNBSlz6beloZ64jnQ32Kf1dB0Ag6ek0fDiyfg
 cqkbq7UwbiJb/GTh/tu/MeVexIXVnaNAXXltu3FioLq6KftPouzevOwCFbaCU9nzGY7vyzAq/ay
 hjECsPIgsjg2Sd215YZSOevDuyh3qYye0pD2/s5V6SkL+q8kycVu560s7lbv/wt7E9plc4uabPQ
 fiJfcjmGFIQk7AxZ35g==
X-Proofpoint-GUID: 2eHr0iq5iDwYcdikenNwl1zWAiSfIzeY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDIxOCBTYWx0ZWRfXyfz849cegkF2
 UB1ir4z/chr9c0/ndkjhNEYtk8zeHAWspsm8kma63JOymYQfvmdMdAtbqB9/jAwKmZzlXHTZXPD
 Uvwu+bchtYWCDf11/a6ulbQ52fkvTPM=
X-Proofpoint-ORIG-GUID: 2eHr0iq5iDwYcdikenNwl1zWAiSfIzeY
X-Authority-Analysis: v=2.4 cv=XegcX455 c=1 sm=1 tr=0 ts=6aaea3f1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ilsi1XWDFcrB9FjxRIUvHg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=xnl2VaEmiNnR3tlLptkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-19_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609190218

The simple-KMS helper calls the pipe update after enabling the CRTC.
On an enable commit, imx_lcdc_pipe_enable() already programs the
mode and enables clk_per. The following pipe update sees the plane move
from no CRTC to the active CRTC, treats it as a mode update, and calls
imx_lcdc_update_hw_registers() again.

That second call has no old CRTC state to disable clk_per first, but it
enables clk_per again at the end. The disable path only drops one
reference, leaving clk_per enabled after each on/off cycle.

Skip the register update from the pipe update path when the CRTC already
needs a modeset. The enable path has already programmed the hardware for
that commit; keep the event handling in pipe update unchanged.

Fixes: c87e859cdeb5 ("drm/imx/lcdc: Implement DRM driver for imx25")
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
index c67fe80b8115..e00e52c1c46e 100644
--- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
+++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
@@ -310,7 +310,8 @@ static void imx_lcdc_pipe_update(struct drm_simple_display_pipe *pipe,
 	else if (old_crtc != crtc)
 		mode_changed = true;
 
-	imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
+	if (!drm_atomic_crtc_needs_modeset(crtc->state))
+		imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
 
 	if (event) {
 		crtc->state->event = NULL;

-- 
2.55.0

