Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9666E23C8A1
	for <imx@lists.linux.dev>; Sun,  2 Nov 2025 16:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762101572; cv=none; b=Bv2P2lmhk7tddieMzFK16uq3+TGCWpMRUAU4p8t5aAvEC+O/73swlRPEdemJ+emF+qSrjJTwVGWgL0YMklRfCWzaRERJbL5XkgYiMD9B7oxlNtdNpM/wvs5aC3tGsx45jm3W59zAyJOe/2gwtwNiC6zNeQ6aCEcapcTEXbnqGhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762101572; c=relaxed/simple;
	bh=/wk0r2WF7kQ5J/280jubxtFtMyKSbwHx02KsbYzueY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHElUUSd12Us5i171oyFT9AgvjEp40ffHA8O9mfpaVcTdJlpYQhRrGkoucCnui1t7/MYHwmBNKQFtLj7i65iy+E0xJuU1O9KCSq4Dr9iGhejkb2eibWcQqZ5EqxP2vUEnQMXzzxEfIGvrNYRxAXoPWFJlFgBzkbtCenP/N0N/Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MofBD+Fv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KnAiAV88; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MofBD+Fv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KnAiAV88"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A2F1q4C434597
	for <imx@lists.linux.dev>; Sun, 2 Nov 2025 16:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Vsudp5PRE81p+UL97II9GrFo
	Q82PxOzVdfpShaNANXY=; b=MofBD+FvgCKPFuq3/UZeyNcPO7m4lbnHivOxOn7h
	/9eQpsVBicILU9Wyi7oVMysvN7k7Mw9FwfT4cK38MU7Xn9j/1v/0p6/Jf6+/PVhO
	gWjMNLjyOeisd7CIbEtHAh3y7coy+AFabvbvPQNy5jnA6RaGEUMgR++iZmAmLSpe
	FcF9U8T7xzAOGwsxol6eOhhJkNqSmZlDbcZrzrZiAZn9Ez/KyqbMLuBybNFobZGt
	AKrAXmbeaQ/JJrjNAqJO71reaAmJEanyzsfP6lFJkKGi84AHIyY/ZHYgjIvjNIlD
	VzG8fDkGWx/j74iJT8C/kUi3FZfSjsTjW7BgeK1e/d4lMA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a57weaht4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 02 Nov 2025 16:39:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ecf8faf8bdso80528671cf.1
        for <imx@lists.linux.dev>; Sun, 02 Nov 2025 08:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762101569; x=1762706369; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vsudp5PRE81p+UL97II9GrFoQ82PxOzVdfpShaNANXY=;
        b=KnAiAV888Z9+b6BYxlC3S4mGyf18EGWTNNXgYc1z5xMTwswE1Sn7H86icxcoLt3gou
         Y/p+ABmYz7gvlKPyADS2dIlb7l/qZ3qB2+EqQjFVAjNcyGMnY9GGbr4tQJsmjwwyiYML
         ByFkIkAHHb79u8pGIT0KEETBH9lxDzJo2vS2YjgzZz7+2d0IObiwPUmftRSmCVR3Whz7
         j+fVKv5DJxho/LR/bOhCXhIt7GF9SeI8ALp7vgHFzZZ8DDYOtb3oK1J5r7cvqzNBgPbK
         faFSqKRIbcnh9RD3m6gDAHSe+7OH13tAehl97Y/QFO7vMiV5VIJgp0EqtwC6NChxwTMM
         ydRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762101569; x=1762706369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vsudp5PRE81p+UL97II9GrFoQ82PxOzVdfpShaNANXY=;
        b=LR9cckSmtiuiXc203nVePxBa8fSTM39vulxKj4sVCZ93qWntdxR9UI97qRBE1Z6N0a
         9a0zgLsvUMxsQyyDVWg3yBmtlBStdU833we1Mv7YuGnuZTD6Ql9G0cXbJ+7laoKCRaxm
         teZ4DwoW1sYpBM5BrOVDyh1QOWmg/T5AAdajuIQAyqaaFMeF1HHjfWYCXOya1YPec42X
         0NTmzr/svbIn0sxXeuwS2fkUyPuU6v9rGXj8Y899CgQLUlPtSUjlLoVPn6FcYsL9f+Ab
         DywgA6+KHICgjyc39W/+40+dGDKcYOB8S1llh17rpaeYrQWBibhZDp+Z0wgTNETJJQL1
         wwdQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9LuYYhf5b8zaCR9bjOKjyZupDJ9rGKwX/p9Ite2mzervOMIQAPF7lnrcBwgxPg1DceaU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyL6BXNNnV3FjMHFpNQlLriss3oLxlHwAAykeFnneb0eWWnhIL+
	YGyW+7QfTuDDwB4/Jzu8ZDk7+t+KoVcx4IJWtMRaP/s/PKIco7A5Wjo+rFOKzbfYqNkIFIcPadv
	Lt7SOR2lSMwCiNlO7iuivZOUJ03pGJcXRtOlCSBFnxx56WOHjYbUaQKU=
X-Gm-Gg: ASbGncuYyk7qxeYfdvqepRskuWTykb0400M/B3hiOmKbqQ348RGpLAR02lSvPAfim4X
	mcCPvUfg0xcWwu/WahnC93NkZfErC1v7xpO8lEx5du59WfCMsEN9rNneWtQitzIWhaNF35/ybxy
	SZI84iJpZTjaR79FwND7LYvbbTKVvePm9vxNNAu21TtA/OZGM2ZQpeSiMvVSMzBO+7Zn2abZQ4z
	xm6p4OYQOdQo1tfAFOJQ9AQO54cc+xb1YTh6PQMmCpg3byHe1n1wZh8U802dgeEXMHQ1DY5GEEn
	NdYfJKg3BpVNPvEn2+ITVXETGysJ2ISUtDLlZoylSMOgxuSVHPj4ptEciHvfxZvvSZqpvbWn1WN
	6U6ytR3Jb9E3ohEdt4KljKZt2u+ZulEsOTB57ap3AH2qiQcfX3evGAzKZGDNvpXIhjQEVeB6x8g
	DtX0pfZpXJs1q6
X-Received: by 2002:a05:622a:834f:b0:4ed:423d:48d4 with SMTP id d75a77b69052e-4ed423d4eccmr57411111cf.54.1762101568692;
        Sun, 02 Nov 2025 08:39:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBDCWJDKPzqxu7f2En5m/zHiJp5IOVrgHqGPH6qz1rOivQAZXaoWbSK0Fgiw9Mg8qUeB+6cA==
X-Received: by 2002:a05:622a:834f:b0:4ed:423d:48d4 with SMTP id d75a77b69052e-4ed423d4eccmr57410861cf.54.1762101568242;
        Sun, 02 Nov 2025 08:39:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-594282be8adsm789469e87.51.2025.11.02.08.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 08:39:27 -0800 (PST)
Date: Sun, 2 Nov 2025 18:39:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com, geert@linux-m68k.org,
        tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
        linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
        virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org,
        xen-devel@lists.xenproject.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v6 13/25] drm/msm: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <vptw5tquup34e3jen62znnw26qe76f3pys4lpsal5g3czwev6y@2q724ibos7by>
References: <20250821081918.79786-1-tzimmermann@suse.de>
 <20250821081918.79786-14-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821081918.79786-14-tzimmermann@suse.de>
X-Authority-Analysis: v=2.4 cv=M85A6iws c=1 sm=1 tr=0 ts=69078941 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=tVI0ZWmoAAAA:8
 a=4vBwfh3hQKJL6CJddaEA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-ORIG-GUID: jjOHshp6HXUAfykXfPH2bIviT5jzCelc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDE1NCBTYWx0ZWRfX5ZqjDPhBDwph
 bBXwH1sT4AWvmzKG8GoTDpoTJ0A2YvLwdUBfyB7/v/imTOqML5LeECkNBiRGW69syFWYargIzU4
 CGzkLLvmRJtgVWQc5pDIcftvbeZuzISV9UMJ0S2BnoTTBBEiQda/EBUs/LL/ObXvWv2fKBDspzI
 VNsLIMQFtfOJQdC9CNMF2qhyzlG0UgssU90STSIA4RrtCrR1AZ+OB2cu74sENC2IKf16TtIA68b
 hf9YTFUanJPvSjkcWBJt6LieTxFETENEW/3IjtGrbBQc/lVP1wmyYkRTjMIH4oxFwjZd1ZlX9N8
 JsBwlpjBYpRS93x5SAij4uEXyKSkbXmWTAsbqqG2/LCYaIPMPCVMELCK0fSIUybRwzj/elqkjy7
 557hvdHHRL/n/qgD7wy5Pxw2+zrgfw==
X-Proofpoint-GUID: jjOHshp6HXUAfykXfPH2bIviT5jzCelc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511020154

On Thu, Aug 21, 2025 at 10:17:20AM +0200, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch
> and buffer size. Alignment is specified in bytes, but the hardware
> requires the scanline pitch to be a multiple of 32 pixels. Therefore
> compute the byte size of 32 pixels in the given color mode and align
> the pitch accordingly. This replaces the existing code in the driver's
> align_pitch() helper.
> 
> v3:
> - clarify pitch alignment in commit message (Dmitry)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 

This broke kms_getfb@getfb-reject-nv12 and kms_getfb@getfb2-accept-nv12
IGT tests. I'll submit a fix separately.

-- 
With best wishes
Dmitry
