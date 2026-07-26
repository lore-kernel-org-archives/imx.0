Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D67235295C
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785095025; cv=none; b=ZYcOXi66JY1B2H0yeAJ0b4xTGOl5HMW7CrNEnxsPbSe1E8JkY/Dre97KmAibtGt/NefN/0UcFEyGDQ7NfL2E7m5D55jj8hb1W3z4FuV4M6CaITkpWcT0IAPM5RZE9uLzb+6cBIydkkxP7bJtjYrW/ZlZRfD0jlmKysnArwuAPlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785095025; c=relaxed/simple;
	bh=0iliuiHXJ6h0/St/QGB8FSTuTPg/hKE4ZxbThjkpOEk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ly8ZhaKKxLgBU87gDA8tkSm4Sz/dyaQ79Z46ZUTcJPsFDrIMAEr+sGHDctjqK5qjkbRLpyy+0BADAWOHlcMW+m/EN7DZRiQ8kMACgEUsDgKkKAkZkzgCQ7KN8cJnVDD5FFDnyBpL5OGtfVDoc2gDRlF6KqDnKxgqxZq2W68iaP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NPm9kHgZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZGE3deAO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NPm9kHgZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZGE3deAO"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH7rdn1127889
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CNoRgYHBQCH+tsjxR75Szw9VyLMDvEKRkPSqMXEGBh8=; b=NPm9kHgZsDf1LGlX
	jzlVHtMg0YUIG18rO33jutaRk1yFpZdsfUZVRWXI0ghtaU1/yaZpgmvF1zkkIkMO
	Fx/GEM6lleoZ2OcTLU3bCQDNV8OfTPfNjRq65BaBvGXKNXhIMzq0ln7rci/Qk6fr
	bhHa4Hm6Jd1qdtFzl/Ez17lREMOW1lrfDBpw5evnVY9Xoy1I6kuZkcMe/VXEJ+KX
	Pn0yKJyoOgri+0JqUjlVmDNy54VMgGwyHkj89PveR+TywEoAf/HLoQ7s4fPsnpUE
	ysQBHzdtZRRTpsO7e5MMXpwCaF2Eic1vfLqRYDOcebT3rm1E7+C2mEIsQneM6hEz
	vMj/ZQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnweuf2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:43:43 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so2613548a12.1
        for <imx@lists.linux.dev>; Sun, 26 Jul 2026 12:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785095023; x=1785699823; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CNoRgYHBQCH+tsjxR75Szw9VyLMDvEKRkPSqMXEGBh8=;
        b=ZGE3deAO+FCWUUtP5FoNNOUoXhOZ/KhKlh3zpvJONMohs90fCBSBuUedjPIpus5qRS
         BIGLFZp7J5MdaWko0TsJOQ2QUPsqAM9xmQQbE3oxiLcw+EzClsHLY9piGJCUQqRtGBpd
         Pq5rSZHpf0QqwyjBd86kLPxq43DZOzTNFsVkpRdiWmwBhXS0PoIVYNNLnN38qzhc3cz/
         nMArDcLk+sRhpe/Aa5nWGJX4sp+lv3JbnqebyV0f5ipNudv1xU8otNCxov152N1bcIFU
         YJOPjKjPEAo5yySyEB2Me023Cs4Btda6DP0BFoeG+tLvgR12HZOkrwk12PymjUT3vejo
         pdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785095023; x=1785699823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CNoRgYHBQCH+tsjxR75Szw9VyLMDvEKRkPSqMXEGBh8=;
        b=sK5RVcRJraZvLj+P9m/vgUQDgvZLjmNFQtjM60ZzmDIZG3ZpUqofJB+YOR49+YqiTG
         3EJzINZrljEsYpXJv0rX+lvHSYdD1rcgAdVT2xbpQPJ2tnJu2rMz2VLML+sCHezjdMqi
         AkKKq13jvRKCfZJdmktzvQfTG+r6iic1ieFs5ktAdiwYe4MDthkqd94UwjF2t0DixOQj
         T6fRlWxaLO0eNWLysqeIzp1oe3Z1upJto3EinYiUcc6DFKrm09d5CwzWAgGSVzRo3Sk/
         oOTs+qCjjLB+kWn/0mkX9YF0KAv53wTTnV/q+qlm+bDHygt95Vs9BTwIsNkNVHmSIUsV
         XmcA==
X-Forwarded-Encrypted: i=1; AHgh+Rr3rJ4Pz3xKCtD58I60UMJ9qcrNXb3jn1gij3soI2UHrqljpcZhGHUaxEgfflMJMX9xEig=@lists.linux.dev
X-Gm-Message-State: AOJu0YydBCEq2eDAogTMthopbur/AAsjAmVup6v1UidH9ynO71FAa4fe
	BfRl326pw5tYjz0lafQNE+6bhhcIAVD0plTNwugvgXVyiZo6zqw0mzlDNZWG6rnZ5JaWFmN5MDt
	74ZzjR70tHlwSMtnrGmWzTnb/1QzCGlXCK854qkBua4XmPJhrbx/AZis=
X-Gm-Gg: AR+sD10lBbRzRrFUg5ARDNpU0+ImFQe6VXDp6twFbfQmQeW/HkxXiPqgQkURz6Rr+sf
	KeJo1hhgBsTgU0RmyrpVCDf111LaTXKJytCW11eEPD9GhcYwGMvJIBvxj76hc8FKNrJjmL7YDsU
	IEv73LV7Iv9/wH8DxKNrAbOfOXUmLEfGplQCBB30iYyzoGdHj0YONLkLbW1CWaSxAwlOQQpXvKd
	FdKLPHs0453JfHhsxFb6wtwiwwqWVjjiN21vp2xPX2hUBmKMvdP7mU4cNDHUvzqFYgAoWD1O/Dl
	OtDTGHTadszDqw00VhvFFGiEjQYPbmOQP+WRqBqIFb29dPvRx/PyibA7EsBNmic1ZRCVjUC35ls
	cUtj7UxhW5DgnQ/mEZ/2j
X-Received: by 2002:a05:6a21:918c:b0:3bf:6c08:fb85 with SMTP id adf61e73a8af0-3c67e0e92fdmr5593395637.53.1785095022540;
        Sun, 26 Jul 2026 12:43:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:918c:b0:3bf:6c08:fb85 with SMTP id adf61e73a8af0-3c67e0e92fdmr5593377637.53.1785095022117;
        Sun, 26 Jul 2026 12:43:42 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66dcd38sm2312070a12.29.2026.07.26.12.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 12:43:41 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 03:42:32 +0800
Subject: [PATCH v3 1/2] drm/imx/lcdc: avoid duplicate clk_per enable
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-drm-simple-kms-removal-v3-1-de36e534f7a1@oss.qualcomm.com>
References: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com>
In-Reply-To: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com>
To: Alexey Brodkin <abrodkin@synopsys.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        Alex Lanzano <lanzano.alex@gmail.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Marian Cichy <m.cichy@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, xen-devel@lists.xenproject.org,
        Ze Huang <ze.huang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785095005; l=1575;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=0iliuiHXJ6h0/St/QGB8FSTuTPg/hKE4ZxbThjkpOEk=;
 b=nuCUHzR6KH+1G4beZzHutnnOVPquBUhtAMv7nYpAmPcJwkzLDxQbdplnG0zdIkeIj2bMf6cbt
 akZOj/szyIRD7rXgAh5kCjmvJ221hnITo+m6kuUDxyG75FWxOXTdMnr
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfXx324qzIjhm8+
 mbNCHHyZ7ikIPCy6QshpxsIeQfBY9FePQpL4D6i+VtTci7DhyYav0O0DfvbRyHX0/peW1T3AGhU
 oFrQnMmYTr1V5TUY0JAww3FVON+ykv+VFO4BHweCxpiCLiQAogRh90KQ2Xe31wfLceTU4di9QVY
 MVJdVDZEhyylp26k/FuYkVBya2ZJa4d+sAYCcVVZZGBfRjrRebwMb6iBLJtI+Iq5PXYtqmFDURd
 VnRONnZ5za4rEWfo7driCr58oWUfCbDPxRAN+8EWf5hwu6VszxuDzfmV3pFNkhc4nxIpw2HAgUQ
 0vY7vm5s2qyeH+dO5mhH01LmYs8mxe2tN08cyw7E2WGfP3CxVhXXkQ7hfkDk3m9D53gj7OCWEpp
 MTaNrmJwuZWc2v4BmaCNV3AiYcx6ksRjouGuj+Nq2ADqLxd2qB//XleQypgp8y+QRJlhzFwP16H
 22u394BmH+Crj9yQJiw==
X-Proofpoint-GUID: 0jDZiPHBfw4_jhK43AL1bQWkRDQ-tv45
X-Authority-Analysis: v=2.4 cv=S77pBosP c=1 sm=1 tr=0 ts=6a66636f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=xnl2VaEmiNnR3tlLptkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 0jDZiPHBfw4_jhK43AL1bQWkRDQ-tv45
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfXzQgC88Gi4e6d
 zwzFAm9Ta35tpLiKt7502aNhwlc9/oOgf+qzthm6wl+yO/daFk5MQRoK7bbXNWOQLojH83pGa9u
 OCbOjBmY01JF87WwqoRimVIrLji2wxs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260200

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
Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
index f52832b43aca..81024f7d9e96 100644
--- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
+++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
@@ -311,7 +311,8 @@ static void imx_lcdc_pipe_update(struct drm_simple_display_pipe *pipe,
 	else if (old_crtc != crtc)
 		mode_changed = true;
 
-	imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
+	if (!drm_atomic_crtc_needs_modeset(crtc->state))
+		imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
 
 	if (event) {
 		crtc->state->event = NULL;

-- 
2.43.0

