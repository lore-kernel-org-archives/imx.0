Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6877725A655
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 20:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759264578; cv=none; b=njEzQWHdtAV+9zhnIOPjvRdCrYNdudfgDGcP1hdvujgh7jn5iTxPb/S1g+anF+rpKEFJrbfzwC5LowKavHGZuqXTGQrxN9Pi73aYFtG6SGPqiBRc7nfXN8cNPUM0VPhLH/O2ozKtPXBPjEkchwYT6n3CC9ULHIl/tGyB5XNPooE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759264578; c=relaxed/simple;
	bh=pYzmZMeM0haV1I7kxC+a5XtONgUKhG80+mi59Gbz8bU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZfrKm6KJcyX5FeZNzgca6+EcZwKktsGBwU9sMOWFWTT8uta+ZJw/M3lmrVNa4EkVHjakdKlcBP1vPJkUTJUrWnEhQC+evOw/EtQuESPiSqxinV4HJWelstuN+IkvJmmwyPwJmNTZa6CtaiBkeaUXU6IVvDHtwGHdAYIAyn2kezE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aYaUOS+V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aYaUOS+V"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UCAD0M024448
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 20:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yRYR8mKHUZFaYtXuWtiKtjrk
	y868kXbSvHpGdSOUABY=; b=aYaUOS+VDv+kxGuS0EJOBn3jZsRvgFGBxtozbsMR
	Ac9vrucmrZxwlJT/bwVES0C71Pifkfd7jEhfBwDX8PcD1l+BQYW94SrM/q2VQYFW
	DSfhw+ZrjsVgjnjN/gMX7X9pHlZBAnLC3pmHy6IGvzJ7/kW1NQ3nkMSWJJZNaB5Y
	fqwcbk6Vrrulg2sTCgxyVF1pVKVHnRxqEWiY6/V6mgv48P3LGjUP3xBoVnS0bCFE
	J/FQSPRuSa+6FvqfGXqEGpQVYAki1/LYqW1e3mKgBLGbDe3SGHhm9zt334YhoCu6
	nz5g1QtR41tllKQaQNXpN4HQjHYEMTJQgrL4TMs19jbcUA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e59n2rkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 30 Sep 2025 20:36:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4de23c3b40aso128124571cf.2
        for <imx@lists.linux.dev>; Tue, 30 Sep 2025 13:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759264575; x=1759869375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRYR8mKHUZFaYtXuWtiKtjrky868kXbSvHpGdSOUABY=;
        b=o5uOrYNCSkLSLPTmlQnURP+LeGKZt331PPYNg/9DNEqAt8pYA1c9/XiJjMQPvFRlE4
         SMYLqIXzwwaEFGXv6RnuIwM2WOR4gLAOj8+2I9g62+WepDz2FSp6wLAYYZ9Mj1TzA2qt
         tuPfZTZGVuaKYV/UcmmUx209kN/pEQpi5uV0Fmh+RbBWOoO9FupBFvPUoxaOtNthuAcz
         9p1rxciuXNNbQwAFps5pUnCVA9T4JITqDg+ayg2tay8cc0lX4opGOATSp9NU7vwUw+9q
         I0aJt/a/4T2KWbBcQAqKKRmwnT7OFIna2eSCc2xu64t0OfAscZmVjpFud+Dh4j4NeTYh
         Po7A==
X-Forwarded-Encrypted: i=1; AJvYcCUwFx5NBDPxdReONiK+SCuNdMhe5Dao1GsgayKKmkFe8smV74QTY/Jh89TwQvijFIdHCOY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxXcJOWWZfvS7dZfDuhlVqTyJIWOh8IeHjQWC1eGQNDePtyO2c
	o8IMJLMLELBf2adBLgNh4N0JvaOcDmjKjRh2rUFr34v0XPBLUhmaGk3aAW45giAf8i0PKHn4obf
	6Tuqkns7/udB4UAHIBV8bxKA876rvdfmZifykmolj/Z0fwClouvu2TvM=
X-Gm-Gg: ASbGncuODUWwJJYErPwQr0yhUmUofaTMHuIq6+YJLzt0826Goc6SvITtGF4gszR91yx
	Y4w7H4z82KGzyZsivBRTHiOw9SqU3GN07LO1hSgA7LQLu5ALXepEv3jRYABQkyyQ0V1FOFSZx46
	4/An3owbEm0LIne2/2OxaOJSGlhaO432E98t6voNJzSwOw+p3YRpLJBff3WqGcl8DMrS7QrzUJ2
	ZceAiRDg2uQA8PFxqiPGyU4oJwzlW3z1CWWsggk/dD0+F5J6ud4ujgoEKajvjDzqgVbyxd2Y9wR
	AB/lFkaP8ScwtO+daDTPARGTtNjZdRbv67CDUfuok1cqYjW6hC62H/1rayweTO33Qx79q7uw76f
	FpIgyPzYxozKLZeMnzt4rZE9qgVxvN+U1I3mcfhVIOoFBug3cODBwi9BuYw==
X-Received: by 2002:a05:622a:1f09:b0:4ce:dcd9:20e5 with SMTP id d75a77b69052e-4e41e2553a4mr14266841cf.61.1759264575283;
        Tue, 30 Sep 2025 13:36:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFuPPlCXIV5zyuzMgVAJcVfckSn/45lViJoli6ItFTToo3aAOYLqDps3QFpjsl6dnCqLcS/g==
X-Received: by 2002:a05:622a:1f09:b0:4ce:dcd9:20e5 with SMTP id d75a77b69052e-4e41e2553a4mr14266301cf.61.1759264574813;
        Tue, 30 Sep 2025 13:36:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb7710474sm34821171fa.33.2025.09.30.13.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 13:36:13 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:36:11 +0300
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
Subject: Re: [PATCH v6 18/18] drm/bridge: analogix_dp: Apply panel_bridge
 helper
Message-ID: <aeby4ds46ehzkrvc32pjcrxz2aalpc7icuis4y4zxfm5kvgcg4@ie7m7s6rcnqu>
References: <20250930094251.131314-1-damon.ding@rock-chips.com>
 <20250930094251.131314-5-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250930094251.131314-5-damon.ding@rock-chips.com>
X-Proofpoint-GUID: n55LQ4jJtB9PWrieTi24Bst-O6Dgs4-x
X-Authority-Analysis: v=2.4 cv=O4g0fR9W c=1 sm=1 tr=0 ts=68dc3f40 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8
 a=rSdC-L6FqKhTve90478A:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: n55LQ4jJtB9PWrieTi24Bst-O6Dgs4-x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAwMSBTYWx0ZWRfX0sOcZFRwg728
 4vug4vQ4Ws3QfDuBIlH9a8HwoS54iCAREo8+vXWLDpMFZzuMtOE4XuutzDL8xs7VNCXHMegdGln
 8IYam1nlxD47UCz+jJ5lguaycU+TW76+zF1bDWRsnj0GZWG8cAvYExfrJ5WgDVdSrXNOyZWuOlE
 5E3gBKqbi5K2fTu+5S+gboZI0RexDMYLMewsBrhxIHGIS5Z6JmdmIejfT2lHx+Dyiv7Yq02xNo+
 ifbpfjw6VLrXmEGxwKy1Sk6Ygv7oWI6eASKMebKAtmZknJ/ba6geGTHTjItMEPdTkkiKlH2zNzh
 iiqxdx6meAxM2mSWhybgRlf0zkzPU2eFqkgSTesdhTjrihzcyyPyygh+U1U0+lmfcmVo0cSjFbc
 VYqK/Lr7RqiJspiVgF1n706p95cYvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270001

On Tue, Sep 30, 2025 at 05:42:51PM +0800, Damon Ding wrote:
> In order to unify the handling of the panel and bridge, apply
> panel_bridge helpers for Analogix DP driver. With this patch, the
> bridge support will also become available.
> 
> The following changes have ben made:
> - Apply plane_bridge helper to wrap the panel as the bridge.
> - Remove the explicit panel APIs calls, which can be replaced with
>   the automic bridge APIs calls wrapped by the panel.
> - Remove the unnecessary analogix_dp_bridge_get_modes().
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
