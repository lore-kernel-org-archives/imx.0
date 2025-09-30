Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB2922CBF1
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 20:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759263524; cv=none; b=UOsYE6b2zf/XwV8Sfl40Lem/sNOrAX2+2HLKAURpqJ92HUpaWFFJrlwKPYMJQhXceoFlMKSGx/pOofpIZd4pdZ8lmkhNICz+gR13+JMUns2I3mNqDdZit8dPosym/t/TVuSePd/qgl7oqXFYq4IhSDq0WxwMTR1p9DDANeL1WZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759263524; c=relaxed/simple;
	bh=cYYH3/yTc9wBXPcA74vYb9yfUr6t5bEcM/coGFu1oMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMOkyWHnxN5lNyasBExnOEzltoxl4z09cqjqcB4Cje6oM74vVhdW4QSOpjM9JK5sz7eY8HDNsH5oTmghNw5xOOWpAURaEIC2BzKPnBO20nUO/cBgw+8WNf1ZX99Te0jqim9QZc+IWjJ6NeGuE6y6xCidCld3+qBwWPL2jmfsWZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=phrIoJPh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="phrIoJPh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBExnU015258
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 20:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1prKZ4v8aUicNJIrRPB93Z2q
	BSZpWbI16ikZz4dczC8=; b=phrIoJPh//YjDsPd6tBBkta/NYufyjsIgztdxLMZ
	AZvqOF5x6Cq7k7hO3vWlIFKi/Q2l3CWCZ11YULAuW0t0OZ2b3pl1O6nmoSAG/bwC
	CtM3r5IUdX/w8EzIqd8MAT3aJxZEMkPVQb1yO63P53KW7/XTuzgjHBdgQP4bqgRg
	cfd7QNe1bDajr5SObgGIQKwRT8CWlory66hqslK3qw9GPJaZUJa7kxlc+Jom+3Lv
	JEt1iGDAxu74RjzeriRN0JIGkq3+4tnjVbc9ygx8n83DhmbX3WOnWKfDb+7IvjPz
	xDLpEU2gkmxtKgNCeVzbUsmQvgS762iIdaQf7uEdPYnU8g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vr2b6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 20:18:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4de801c1446so103409461cf.3
        for <imx@lists.linux.dev>; Tue, 30 Sep 2025 13:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759263521; x=1759868321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1prKZ4v8aUicNJIrRPB93Z2qBSZpWbI16ikZz4dczC8=;
        b=aI5gvW96NskyppQM4zNt9uUpeiFn/UicVwFHJkCYeuvLzOs5TizSIXy0KyB/iTZ4Fv
         crM58bEk9IjwEXfuqi9b0Bkl+teDcqCz+229flmgetlhjaM8FWD+h131CnUZ27/a7FlH
         +Gxw7SGGiMuykwfGhm4K8O3A3wKKjtTtRFJJn33Mu6m0k3zyxpcU1YDX8MchUXJRJWmn
         JLEDSYH/zj/jCs6yYwoGGhrUrivylpNaunNXFYQsqZPbOwvlvZhBskZw2NXU+DvukPgh
         HB2A+jKriwvy9zC6O4iW7kGe1AgJprDKEHNgnHjXhOsrT13vmFagE0JvDjqgMgK+Casv
         v9GA==
X-Forwarded-Encrypted: i=1; AJvYcCXN+JoBEx4vGiVhPWCgPWWL4wbMZ1nMCdq69xbZPIqyE5836wQax9Wm0VQdKa/qkMCxaKc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZ5mADFH5PYvYuitNbPqwskTmMg4V4Tj0lqTKWsOuLqiuSCO+I
	//nKqxoNbzI9l9oQ+xd2gkpmmZXizvIgvTzH778O/gICYMYGIbWtxXMfTmrK/DLCxGeA9xmz1fH
	mC+YTHYqj17P/08KYYa+It3IAqQ39vUQUtCa1ssWcw+UE2RuC5DYMRz8=
X-Gm-Gg: ASbGncvYe7NHczteUbD5DmJQOELxteGX+nYmP85uI3W2qHyZOE4A6XZoZoGGzmFFVho
	Rj2iYtSexqdFZQoicpw7FEmp31FKjglSzIx455cn5SWfAEYgTPfTQ0kDJRIZTdmcyc/DmHvm8bM
	SVgMBJh4QShpIaje4V+I4vHjr0YCtZJmQGKLrtJXhppzGtmPgAM1U8tCGTFqkfvJA1pkSlGQdHs
	/dpKBjInYXSAgvW1BhaAsHwGkr0x+LDx44CnLjMmSox0bKcq+nMCUR/04nOb/8RD8eauyF/Fs0i
	OT6AjQQdA0DojGpkAF3aZ198O1W05Vsa18J8VbLh3u8mOKT6V8Ne6W1b5O91Fsls6T34u58Fy3e
	jlPkSsUZv6bvRb6xYBdAYPDBJ9frMvP/znv3ndQVdxVY4kkMJVWWYVDEbZQ==
X-Received: by 2002:a05:622a:4cf:b0:4da:207:f0f8 with SMTP id d75a77b69052e-4e41c54839bmr12914541cf.11.1759263520690;
        Tue, 30 Sep 2025 13:18:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSxICdUQhJwxyOP6ey50e51aF0tOi4+IPIxh6uK7udyhkmudoTzU3ziqUxuPBP2Y+j6k4Wbw==
X-Received: by 2002:a05:622a:4cf:b0:4da:207:f0f8 with SMTP id d75a77b69052e-4e41c54839bmr12913881cf.11.1759263520062;
        Tue, 30 Sep 2025 13:18:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb528259dsm35069431fa.31.2025.09.30.13.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 13:18:37 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:18:35 +0300
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
Subject: Re: [PATCH v6 10/18] drm/bridge: analogix_dp: Remove unused
 &analogix_dp_plat_data.get_modes()
Message-ID: <hh4kn3qmwdbfev27xrs7eng7adfyli5xt7oiy7xgmviz2pzyql@rgggrhqckdjy>
References: <20250930090920.131094-1-damon.ding@rock-chips.com>
 <20250930090920.131094-11-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930090920.131094-11-damon.ding@rock-chips.com>
X-Proofpoint-GUID: Z9nZimoBa59RY_emishHG95efCz6SnWm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfX+NOTbaQ7sVo2
 CCtECZIAX6wRUQGNQb1D+FBnkoFuAEe1pfEewuYRQHLL3tIZcdW8dPxkxRDvkecDYD/mAQLwn03
 4rUFqM3UUlUPUfn5wAgva7NEFUxSui7b2uniA/qt7GW5VMbXnZbbLC0R3e+1jUKDN6JRVibrU+c
 DUQHuMxt8tv/x5q/trljLAnGNkkw66XF+ybChhPTdI/ezR+EJzdO9elz2H21376FpS5xN04wSIi
 z28jE6E6rIdXAC68plZudlG6nOKCovmenEPd0TM9uXcTifmU6Pnd7G/WP4MDTg5jNfSEiklIddj
 C16Bg4L8l2ZBose4U5r8yS22BSozg/Zb2BriwB4Vw7L10giYpupxw9BzCfTfuJIQqf1fIyN5rbe
 uJJeWjdZ3DhxRwIa0fZZwdzGnpqIkQ==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68dc3b22 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8
 a=eBbjTLbptxnSh8XXWekA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: Z9nZimoBa59RY_emishHG95efCz6SnWm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017

On Tue, Sep 30, 2025 at 05:09:12PM +0800, Damon Ding wrote:
> The callback &analogix_dp_plat_data.get_modes() is not implemented
> by either Rockchip side or Exynos side.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 3 ---
>  include/drm/bridge/analogix_dp.h                   | 2 --
>  2 files changed, 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
