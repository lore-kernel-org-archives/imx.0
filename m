Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826911D5CD4
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 20:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759263018; cv=none; b=Ckbtney9N64xnFOErm9emafO7WRaPVJHQPUxIDa62xQVzsHBwVh0dtz2ZdLOs0+pkpmY8tYSQm3dhpGXmOcfcb9JNHX2VFJ/uXH5bWovL2xYU8zoRaGUpcY3Qotgp07jcwveWzyuhfSXinEI5XjDPTRD4DT2DY4eSoWxDiKQO0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759263018; c=relaxed/simple;
	bh=B13kSDZYJQFkU0t1zC9c3G3HWldP0y99UADm4IFZCpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q53exqFhxLQT9qSSca2qj9QGvldcQJWYAlj1KY9T8zCw4HbzV2OKUwk9k/AK8O62I6knibvsbFGmcoSfc/z+LT13TmMIMUbyxqE48GwjWNKFTa2podj/B5wi7/67Bn3UIy4hBPKhqWBy7ralpRfI9hd6ldVtxHvH5bDqZA6i5K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ffJrJ0PS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ffJrJ0PS"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UCm3p2024901
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 20:10:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HUh15XTlHhQ6Q1q/DhGrQFrr
	yiPIaucH02PqHMC1azU=; b=ffJrJ0PSTxvIAskznd1HN89PYvrtK1jPtX4SKcyO
	n9M360aQdp97l/HD2LB0hM7I3AIBClvyVjFNX4Pe/4gDkw4p9PlD04eunPSwsfaU
	bBZ2YMmmJnJdJ/GcYahlQn8cIUTUvbx1ueAUfOYhx8IYeK88/xQZh9o48wuAIdXR
	ijxVM3znvZbccrA6V9xUPuFJsIrCrN59afxk7F0fEZttLODdeHJQTFWQBJf6Bxa5
	gtEUZJv9MH7ZwXBQq/ay7K9XBo1P0u8OSz4pSDBjqaBB/TGe9u3vSOB94F4KoOj+
	jyc8+qidoq5LZ/0oKAzmhM9or2F0L1OrF6O3XA/5b+R9VA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n2ps7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 20:10:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4bf1e8c996eso129930291cf.1
        for <imx@lists.linux.dev>; Tue, 30 Sep 2025 13:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759263014; x=1759867814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUh15XTlHhQ6Q1q/DhGrQFrryiPIaucH02PqHMC1azU=;
        b=lTU5r5mb8/1IUAGDQXMmHnHmZWjsDYSCL80dYgTe94a2qcmev66Yx1//XC+UtwVX7k
         kpCIYQKe4070i3G3OzbMa72r4c5LLMk37dTQxU6+80id3mL4Dv10jLeWIeYrTCE+96xq
         BkkzbE0SeLd+t6A0rmQ4jSjrdEhJ71Ghnx5XNd43cDO1gqMLs31jOH1NzMqkpDzr6aUf
         UK5xaM81Kij/eFtFyhDWE3Qh+QC4QxKOBtharEt914x8Hqsab2W1YkDZrdTuP+PqNh+U
         DekPOS5SSgqT7QlPBGebUakHF4VBlp8WvXsYPgZbMpUMA+ASsWWWF1EnE3r9qMTOQYE3
         q24w==
X-Forwarded-Encrypted: i=1; AJvYcCUCpHCCCGBRn0JNSOiAegm0BSYSLo/HNtCjmkLExWShs44aZlpu/HPhXxNtn9dWAwlON7g=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlyqFayC+fVQYplfCsCysoxrdGs9ufPW+7CgLiCdzYrbB7lKAs
	oyH4C6jiM7bq1hbS1xrJ3TgEWjcD2PgGpAXo5mOIOE1IERihsPDCjKKCIQLcYkNQnj2krmnO1KI
	NULcRW7IN6GblqznbA6dpLcyq0OFFROVCQaV7B6W40iZtpmwn05dd3wM=
X-Gm-Gg: ASbGncuPl93t9FPGdzpAHF2AeOuo6qb5lOADIHMWvW+GrzeZUhpI506h7kTL6bLaLJ5
	EDbG9972QXaFJkHf6KDcLYw2gR6b3gXnkjfqqXpiOe31ls7PO75bLkksYhOtGTxjvoZ4wApsyVa
	ARNpBTljkOPWWvi9gdpvq/Iv3noVP36DefZoObK7ZAM4XtZpH5vhV0Yp3HudkeevRJTQOd+Dx2e
	Sf+TMZrlwUkzMEa0emDAJRSGhqF+uVPH/cNFF6vNojC8gmEqbZwnh2YpwQtLHJoQmvKHMhkf/lS
	7vXJ1eswvins2uUO/nwFtyzLkdqPj+UN5Mt+edLxWsOar4t3KC0GIEAZ4tBPCGJSrSQHJGJo6W9
	VT0tSIHR3/qhF65JUNhf8SKiInlrU8HHhaAETj1YCTSPcOQh6r+V+VrU1uQ==
X-Received: by 2002:a05:622a:3c6:b0:4b2:f4e5:8eb1 with SMTP id d75a77b69052e-4e41eb14998mr12847951cf.55.1759263014288;
        Tue, 30 Sep 2025 13:10:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkOHi3Cw4K9bHAEsEdXynVuyKt+2OCerw8APvAAWKM2bNTs+Ga5p28b3x5snKdH664Kuc9Vw==
X-Received: by 2002:a05:622a:3c6:b0:4b2:f4e5:8eb1 with SMTP id d75a77b69052e-4e41eb14998mr12847201cf.55.1759263013780;
        Tue, 30 Sep 2025 13:10:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-586b0c1f9d4sm2610582e87.49.2025.09.30.13.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 13:10:12 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:10:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com, krzk@kernel.org,
        alim.akhtar@samsung.com, jingoohan1@gmail.com, p.zabel@pengutronix.de,
        hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
        dianders@chromium.org, m.szyprowski@samsung.com,
        luca.ceresoli@bootlin.com, jani.nikula@intel.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 04/18] drm/bridge: Move legacy bridge driver out of
 imx directory for multi-platform use
Message-ID: <x2fpm4rb7ermb2tyjefdwwbvwvzt6uosd45ad7ku3tp3yqkmqc@bayzgz3jsqkp>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
 <20250930090920.131094-5-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930090920.131094-5-damon.ding@rock-chips.com>
X-Proofpoint-GUID: pv3SvsoODTcaD9GVJ5IhpKoF3N4oRx4d
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68dc3927 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=_9FxbLpkiinsEApfcMMA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: pv3SvsoODTcaD9GVJ5IhpKoF3N4oRx4d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX9lwReOnNQhfU
 ls/KnB8Dci4DZrk/gllbXfH7lWYKzWMOVjEx39ULwj1jkDOypeHKDe2jJmJMyvDESAWkK4kRQt2
 zX/fMWx+5WtFoUkKNfm89Sq81XIGIl/wEA3dpxpQJiYQml9q4AkynkDglcwKy7NZHqlzAVkjaUY
 p/pOisBhVV2JpGOimu970UkE2p4Cr1YFNI8nb7y/U2fu5lDavCcLxdc2MTWwAqD+exPdhB53LtA
 xFA6FQaUdNvsVzaJepdMZyfY6AAL3m+ZNuzgCgPhhTtu1YRMRaMPjYYEs1NQShShVbOArurj9xD
 9GfxRienWd8XRU70ags48x6mcrY/w0+k23Gn24FLx7tvkcHshgwl/xCtG/5bp0/G79uAYKsJ9Vd
 ioqNLf/rZMJy1f2X/Jvp0di1Zk0Hpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

On Tue, Sep 30, 2025 at 05:09:06PM +0800, Damon Ding wrote:
> As suggested by Dmitry, the DRM legacy bridge driver can be pulled
> out of imx/ subdir for multi-platform use. The driver is also renamed
> to make it more generic and suitable for platforms other than i.MX.
> 
> Additionally, a new API drm_bridge_is_legacy() is added to identify
> the legacy bridge, allowing specialized handling for such cases.

Why do you need special handling for it?

> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig                | 10 ++
>  drivers/gpu/drm/bridge/Makefile               |  1 +
>  drivers/gpu/drm/bridge/imx/Kconfig            | 10 --
>  drivers/gpu/drm/bridge/imx/Makefile           |  1 -
>  .../gpu/drm/bridge/imx/imx-legacy-bridge.c    | 91 -----------------
>  drivers/gpu/drm/bridge/legacy-bridge.c        | 99 +++++++++++++++++++
>  drivers/gpu/drm/imx/ipuv3/Kconfig             |  4 +-
>  drivers/gpu/drm/imx/ipuv3/imx-ldb.c           |  6 +-
>  drivers/gpu/drm/imx/ipuv3/parallel-display.c  |  4 +-
>  include/drm/bridge/imx.h                      | 17 ----
>  include/drm/bridge/legacy-bridge.h            | 18 ++++
>  11 files changed, 135 insertions(+), 126 deletions(-)
>  delete mode 100644 drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
>  create mode 100644 drivers/gpu/drm/bridge/legacy-bridge.c
>  delete mode 100644 include/drm/bridge/imx.h
>  create mode 100644 include/drm/bridge/legacy-bridge.h

I'm slightly concerned with the name of 'legacy drm bridge', It was fine
for 'i.MX legacy', but now it might be a bit of overkill. Maybe
something like drm_display_mode or drm_of_display_mode bridge?

-- 
With best wishes
Dmitry
