Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D73341AB1
	for <imx@lists.linux.dev>; Thu,  9 Apr 2026 21:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775768564; cv=none; b=ER3AT4XPt4PZcBakgBeqGVU4/kmu2yt3aVC8++FxVMeUFcmjv/LMBhoUO/1ig7cB+JxpetCHrcj9UCNM+khrrsvcUape3/OK0CHN5dpRIXRfOISq+e8bGq7tYjbdV/AW/6sbQiZrOvfMmDtigQqAGL1FvCM2xtxxIn0kTsXi5Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775768564; c=relaxed/simple;
	bh=hpaw+eGFVDC1cn6/grl1NqqL/A0F4xCbTiGbFyErEJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZtv49Iafk8Av4nLpqtp9SQS3rgKXJGdef2dNcJX9g7BSE2WaQQYrdtiTUXCWCi0C9irKsY5RO0y3hhGFAB5sFC5XwbfkZI5FCHFJ4ammrpKpE6US1uT2C1U8MxVv8woencBI9GcoORzaYR1R17srBIoJ6mT2rnnWQTbrjAu9Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iwt83TLd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FE1qQFAI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwt83TLd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FE1qQFAI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639KOQxf729215
	for <imx@lists.linux.dev>; Thu, 9 Apr 2026 21:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fy24ThaE7zxCmOTOVBB95xQI
	Swb2qBaf1w/hIxxQ6/A=; b=iwt83TLdksEzI97LSyWc2oo6OTCnetVF+TBZtYiw
	jVvR93rQ0vMOjI9AGB43I1+Z3MGaVKHQYJUcZtCZqTVo/msgQFETyPAZX7TmH5lP
	Er7k8jHnbsNkbtFBIu0Bgw9oaNxRBDsuYIdIpXeBbsrwTQVqSDNe4wmGkL8Osx90
	32VlGgSVpKG0UmeHh5TgbJx0etVjXLB0VhbY7KIvrSqkcHv7uR9Nuvpuxgvc+/6x
	qIpPaf8zT4TNVfSO7dpdO+FYiF3Pa89SwQWrkYQaWb+0/dujQoFTymbuiXbHzp26
	jgNmLP0WYZRPyl6YuD5rT2Ob8d92OA/BnC1ECwM/vs9AYQ==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dek4c83af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 09 Apr 2026 21:02:42 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-67a1e063795so2187238eaf.1
        for <imx@lists.linux.dev>; Thu, 09 Apr 2026 14:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775768562; x=1776373362; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fy24ThaE7zxCmOTOVBB95xQISwb2qBaf1w/hIxxQ6/A=;
        b=FE1qQFAIeeaNdWtHlXUZVOx+HX2SKmOgCznJK0wtavdkjD09qwlNZv6yk0TkpPOdnj
         rktODmebAILgDhDqfZr9jAcrEPlbqgjsrf23WuEg//3RUrIfooCwcZcjlb7rY0ac1X/9
         XPKXXVkexg/zx28JIsFKD7mcNlnPz9dK/KrEBDx1KINyAdIaUIceJa/uP6fP2uIyYRrQ
         JxnSXde+3bbObrW8+QdplFnDQNFpSt5K4/fnZFaxt/JGxUw+Vez38l1Nfq14UkP215Xw
         t2XA8zb+R0a2GKduwaZbqc/P9A4vqrFHPyylRUYK/BEqtgy30Bdh5wdKxfduzCIkqO19
         2Nvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775768562; x=1776373362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fy24ThaE7zxCmOTOVBB95xQISwb2qBaf1w/hIxxQ6/A=;
        b=DfRKGzQnfmVKCvmMrMKI74f3UillbcYi3AKmv+NH8bawMdi4Iaif28nM0HFkOAh9XS
         IigtvV9h+1zEnanIqGlEpR7s8fDmTWPAVzl3W18vxjCtHMc+sq08ewFAbOcAIQxt5SPd
         J46/ewIaTwAhgge8MecfQZojJ38uEXLTzmjsyBDX9hh0RQj3aJhPH7lEAw/pmbEFOaOu
         vO37YbI02tnFnradkthBCwHdu8b/xkKzpGZyMt9I8TbDg76RBJ36kNzvT/FLKK2qgsEz
         R1pWAsgqIlfncKuIcdf4hXiAD4p0LhkbNS0ITB4TVKv3riGu3R6pd4lOBGgB12wDZSSl
         f0yg==
X-Forwarded-Encrypted: i=1; AJvYcCX8rrKSNl5oBMTTRDsmF/DMnqhYgJkBNoLdk4pqXL1LqMVI2KQ7Cm71X5BiLdwTOIafFzk=@lists.linux.dev
X-Gm-Message-State: AOJu0YydJGXV4ffCHdGacGgkwUgctJCXVOCL4ho9TBqF1sjfUftEYutl
	DiMQF/G5/5cE00orz93LGbwDUgnZarnX9g5vAskBoXT+LdRUDS6ZrNZQ3cuM1n0MY1Fktbx/Ze4
	mpTXrxxQUxadEi0k7x0s/y4RmrBTI7jB4o2lR1VMmapqLBxuK9RjjTBE=
X-Gm-Gg: AeBDietR/KsR3UbDzDRCXOqkchLCMR4/+RkooyzAwZdVAeo4W7USkkkEpJiJFdWq4Vf
	xdXDDeUaQNgIDdofcHDviMWP3UI87Sb/HcU6AYrOkXSaTTi1BKRpGqk1eFcDlLtZVH3TvMSbyhn
	/MWzrwc5nlrAyL2uzTeeFrQP1lThKt77LjEIHe5Gtq4c3nltXUPQUWHqoWyTufJRnPYe1088clD
	s1K3jqcJokJkVD+Yu3vqyQScTKadV9nCNBEY/hriDK4k8qFSNJQ1ubf/9borRH/GM3IMGfxf9Dy
	st3K5+LviX2sujU4w1YAS5C/jrwD88LgrjHoeUsxBDS2KC69yF8BVLfldWYbtFigsVoj2+JDCD/
	NlAPnNRz/7ehRuEUMrsgBE51Nzgz6PXOrVYyVxp6duZ3hzkwsiL9E70RDAbK3baPBD8Jl2yc5wP
	rnGDiFwWnmaO/go07vQ9SoDGkqnWXUsNSWcmI=
X-Received: by 2002:a05:6820:678d:b0:68a:3b31:1bfa with SMTP id 006d021491bc7-68a68d5fb3bmr2094627eaf.13.1775768561819;
        Thu, 09 Apr 2026 14:02:41 -0700 (PDT)
X-Received: by 2002:a05:6820:678d:b0:68a:3b31:1bfa with SMTP id 006d021491bc7-68a68d5fb3bmr2094597eaf.13.1775768561356;
        Thu, 09 Apr 2026 14:02:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee93264sm160532e87.29.2026.04.09.14.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:02:40 -0700 (PDT)
Date: Fri, 10 Apr 2026 00:02:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        victor.liu@nxp.com, Frank.Li@nxp.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, inki.dae@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, krzk@kernel.org, jingoohan1@gmail.com,
        p.zabel@pengutronix.de, hjc@rock-chips.com, heiko@sntech.de,
        andy.yan@rock-chips.com, Laurent.pinchart@ideasonboard.com,
        jonas@kwiboo.se, jernej.skrabec@gmail.com, kernel@pengutronix.de,
        festevam@gmail.com, alim.akhtar@samsung.com, luca.ceresoli@bootlin.com,
        nicolas.frattaroli@collabora.com, dianders@chromium.org,
        m.szyprowski@samsung.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v13 10/17] drm/bridge: analogix_dp: Pass struct
 drm_atomic_state* for analogix_dp_bridge_mode_set()
Message-ID: <cvm3mvyh5ggs2fsjmikzn6z4kf7vsgxcxl3qusyxnv6jmtt3sa@fof7vydwsvff>
References: <20260409065301.446670-1-damon.ding@rock-chips.com>
 <20260409065301.446670-11-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409065301.446670-11-damon.ding@rock-chips.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5NCBTYWx0ZWRfX0qGrWjoERS3u
 HIeEU4VX0U5wFj11pWG+i4cW52E9ZWUNY+KtcfEBmEO6vgT55oG825fDp87qSdivNxLGex6PzgN
 7NLOE5bqIMa9jeBKvk7ccQtJ4wkG7989J2c6iK9uTOnLzH8ciMd79UUvv9a2aM0vcwKjWzDzAhL
 W/o0rU1Rdu4M4KKKWDSjPwJyAKjTIz+/IPTzKrjBHIz8Vdf3BCFk8A3w2l3ysQda2USzvxb9RBS
 CpHZBsQ2Kb0i+TrWVMyoPb7F0w87S0sj8lGUXK1bCaoi8mOGgznw3B1ERiEhP2jqQFX2jyRU8sJ
 WKYjvKrwSXypqfPMQYiP8U212yoJldjL+duqxEeBli4On2qs53fQ0NA22D3oS4RVle7g0L7/Ua9
 SOsVq2MNin8LnWTL2t8zZkuyFhKfs5huCJ08zjPHlqoYWRIFmhkfXe9HAPJrNBLaC1MaikJB5bn
 jKWvAvCTfMwNfn4GaaQ==
X-Proofpoint-ORIG-GUID: TfExrM-Zg-rDrtpGpiCNT53KWRY4efbN
X-Authority-Analysis: v=2.4 cv=fZmdDUQF c=1 sm=1 tr=0 ts=69d813f2 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=s8YR1HE3AAAA:8
 a=EUspDBNiAAAA:8 a=pclm5J9ib1Ufy00r_ZoA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=rBiNkAWo9uy_4UTK5NWh:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: TfExrM-Zg-rDrtpGpiCNT53KWRY4efbN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090194

On Thu, Apr 09, 2026 at 02:52:54PM +0800, Damon Ding wrote:
> To avoid using &analogix_dp_device.connector for compatibility
> with the bridge connector framework, get &drm_connector from
> &drm_atomic_state instead.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
