Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A03227EAA
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 20:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759264348; cv=none; b=kRb+qh6nwIUcQDBUiAUE4xkwdDMECniOKN20asabP7EozgBIpmZFydJ03STEOuy5NU7IUDaIaCaDeZeJiP7xGfXYMr52xvEzThSzYhWGGV7ipLiI03nb7D1f/tDcqV8G71sGRKwkA8eYw0vk2uaHkIEsmUfg+1zYJL7ec5Asgss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759264348; c=relaxed/simple;
	bh=N+B6oZWZlGACcgCKE91/I5EsJwXOd2f0A3VW+CBf6Bs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RLnZ1yO/Z0AZkkGJQZjnJeQuHLE4u2J0B9Hye0aBMnkNDWOsyns/ltmgA6nxCT0U+grYMk7dgB+fezfUXWkdfj1okam1sQUyr+NR+zocRAVnaXQYsEsR/tJo/rFIZoHyp65byKdkFehiLnzHvewTmFUqmk+NUgLqxWGgHl1b0Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cOGafGbM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cOGafGbM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UC1vqW020349
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 20:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aQIv8HbSGU/ItL07DFk6fn1p
	HIrebqBCTmh7KKahI5w=; b=cOGafGbMemrEy2Yp9eUfawzJXf6Q3VhICbNjmOkF
	ZQlv89/gJcQ7aiAnGhnt7WtH9I94mOdfDhXrfWQ7cYlIKq8ZwyhqFIEP7gxNScp+
	HKS1hy/sLSced/c5RpJZFqqrGC/XYZ0lcT6/CYa5dktC2CdtUeLXlnMATvI+iqKG
	7a/vhWiA+zZuxZU/vUq+EP6h2Py0g/SttYNjLwE95YkMubbYblZz3b11AuSF2bdm
	gVPCIpzCK6b9PyUK/v9b0XNC0L8tbhuo81DoZb85/IJVoNsainh6NwDE9gJi6dp6
	/+mr7+cL+r5c6nDDV2XPfMl+/jyVqfLWLlRceevEMNtY/w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5tgy7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 20:32:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d7f90350f3so6000541cf.0
        for <imx@lists.linux.dev>; Tue, 30 Sep 2025 13:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759264344; x=1759869144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQIv8HbSGU/ItL07DFk6fn1pHIrebqBCTmh7KKahI5w=;
        b=rg/Is18naBKDQLG7eRdzagiyDEXmYxOiMiD4bwu5mapIsYhOpvgi24DUbMnmlKGJbY
         Yg8ygFusq/+hy7wwjNgIYjPFAujYHoajsu9kPTD8ANM5nDcXbY5O9r5EGGCoFdiTH2xo
         t+iQ7/CMdnxUR/xBeeBnM3z1llz/vZg/dbDlEdK9y0XGVs9PQXmROOk4sPw4nXK4Gj3G
         2b0iRpePW4GysPoqLpDbiBVjZYHt3S8swwu/7Gcbm/XeyahKgqEfl1W3nQHfmPE7LFSy
         o1GWAFYq+BCb7CLW15Fof54qyaOnPSZRpJ9cPyjMHxunqE4JOhJh1lm5+t4+uGhR5qmC
         K2+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHgoOKp17gqq2VNLggcKzx3fMjDwa3/WcMG/0voEgQdTmW3jn61xXaQeFJqmv8TwHsuSg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4lEeUUwoWQUjHRy77cFhWhij8IXruDT46DJ0cuHDfkC6ae4gs
	Lv4pgNDjfsF8sHN9NgZi1vNVW3n4K14oHptEmbsBD9Tppa7Vtv4RnsL3AYR+hee0ZGFzcpvKmYt
	3PSG8Y7N7pYMRFK2LNZwSUahBC/7B5aupqX9OPInjQdvwQMocCDF1AiQ=
X-Gm-Gg: ASbGncvW0KPurqsMihNGDFzayJYn/QIcle0cm90atSHnWMn1OkVuJPbEtbPEZtaompm
	f2tHkXt6oWOTIril6hXc1dMfjQxh1txBBFtXOm9lSUOiIL50n9gcad9/c3x8XW42MGAo/XYTG5I
	YaDA0kMcTzA2e9OUGtuj28yVC+ZQda+CRQfPhNtz1tp7F8EcC2loYKplvxwApNznSeOvOxVMRRy
	K0ULUGKwVFrhKXpNcmySndVgxmesCpP7SpnMZT16ITl8Rehe+N115oMr7elgxrllpY8sxhbUdZv
	jR1jYDGK3HFgGrOMmtbr6w/8wHS6ZnyGkACH21MPT7fmEZ7DiHnYCsSloXBPsRkP7vTE9ROHVyX
	ey9HAxxVZfcrgpQR64sluoS9sGas3iQr3A+FFJP1Ya2nFaPY+obnh2MUnmA==
X-Received: by 2002:a05:622a:245:b0:4be:9bf7:74f6 with SMTP id d75a77b69052e-4e27d7c5f55mr67498871cf.4.1759264344540;
        Tue, 30 Sep 2025 13:32:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjMsa1KUO+Xb2y8JXrARVlbLY0nhFqxX54cw9WXubdWIf7Qf3oigc8c9WVQu/MUBv6yKFVYQ==
X-Received: by 2002:a05:622a:245:b0:4be:9bf7:74f6 with SMTP id d75a77b69052e-4e27d7c5f55mr67498601cf.4.1759264344072;
        Tue, 30 Sep 2025 13:32:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139fab10sm5324346e87.45.2025.09.30.13.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 13:32:21 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:32:19 +0300
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
Subject: Re: [PATCH v6 16/18] drm/bridge: analogix_dp: Attach the next bridge
 in analogix_dp_bridge_attach()
Message-ID: <qqomsrix67lmx7rth7tg44bxjltw2d7s4dwojqd26duf45uf32@krpb756s6q6q>
References: <20250930094251.131314-1-damon.ding@rock-chips.com>
 <20250930094251.131314-3-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930094251.131314-3-damon.ding@rock-chips.com>
X-Proofpoint-GUID: _asKMYNcnLRApmKPIWbF2Kof4HfZ9X5-
X-Proofpoint-ORIG-GUID: _asKMYNcnLRApmKPIWbF2Kof4HfZ9X5-
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68dc3e59 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=z1Cm9R5qtz1vL6CzoToA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfXyEbOqdYC/ss5
 HzMSClR5oIyMRkYx5qdamzX7VJoufnTeLY4DxdY56ZajcJy3ZdVaJeU2ePcx+E3CnRujVQaeG/P
 Yv3XKEKBVD2LcE1A/mSuSr7ZkLYGRaPFr1fKkWotgtJNQ3Iaqlrtrb7mrl6NUtCMF/OqnTC/RAy
 JUwYeMlk+0PjgVmUOIcEcEVdscecnLOB8bCSYxBjWeRO3Yk2eEIKp0t6stEHkYjvnO3ugDKfktX
 6USW+fAjiebfwU2tZrLe1d2eKH1BOXSiRH9wQ4Ve/fNHbnB/ojTGMGG35Z68601WQT/2DvhA72n
 Z1WcRYwbvidUBgqSJ80LmJWE/7kpruEpFfnpgai6axCzYqoonnpFdz1bUw0AMLAx2RlwrJ/numS
 JzVSBFXVLzPBLzs+A4Sq94TN+sjaIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

On Tue, Sep 30, 2025 at 05:42:49PM +0800, Damon Ding wrote:
> Uniformly, move the next bridge attachment to the Analogix side
> rather than scattered on Rockchip and Exynos sides. It can also
> help get rid of the callback &analogix_dp_plat_data.attach() and
> make codes more concise.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ------
> 
> Changes in v6:
> - Move the next bridge attachment to the Analogix side rather than
>   scattered on Rockchip and Exynos sides.
> ---
>  .../gpu/drm/bridge/analogix/analogix_dp_core.c |  7 ++++---
>  drivers/gpu/drm/exynos/exynos_dp.c             | 18 ------------------
>  include/drm/bridge/analogix_dp.h               |  1 -
>  3 files changed, 4 insertions(+), 22 deletions(-)
> 

So, here is the rest of the series. In-Reply-To header is different for
some reason.

Anyway,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
