Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF50242FCB5
	for <imx@lists.linux.dev>; Tue, 11 Aug 2026 13:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786456444; cv=none; b=Y12MXpLlXsKf4lnSCIifXSJhNAD1KGG2I5yrdsIQfbsV6n9iPtHz+F/zDu0YtYZxY14D0fLN4MDSpnhMk2uipZCWWqYblM8dAxCAs+M9KHSGGIopQF9gdjwicEchrJc6F2vVSvhlFyEWua0Ym+xM0FrZ8EJlzQPk9TDKXmdhfSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786456444; c=relaxed/simple;
	bh=676IVXliOvaEX37YxVVXapQ+jjR6Wzh1/t+OCRfaVyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ns9aUD8Gkrjs+n18ItlDfIWseAyKkdhJWH1EyDgAvPyUgTOg04xsZ/UGijljcbYRcSMPlQiwrhl3DOOtihMcclXZj0HjEOpzPGdumjRzvcmvJmZN2sUyeWMjYwt0OZsqZpN6Zs2kPnUdW+Q5AY3xiq2eZzeCC3lD8oZmQpNJ2z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ypjtv5zE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DipnG8G0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ypjtv5zE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DipnG8G0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWm0P410142
	for <imx@lists.linux.dev>; Tue, 11 Aug 2026 13:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4vRQOl6NGy39XYmQ/g1XtMf4
	DH9304CfsV/0Kmhh5vA=; b=Ypjtv5zEWwHVdMGbjiURUKV2/WquaBOzP/lTOO47
	XuGhCH4N1SC/W2JUud58rQzUx6d2wv2n7tlL+dcoFsTZodnA4q8wxF4DFlbgWdPj
	1V85nn+r2voNr2k3j5W+Q6aqT9rWBLOWl/xzS0D8IMMZcS2L15Kmge7EydwCuXHm
	o/qPcDtim8Nricoai97E8Q4il9GBr9Emh/WQVezjJYRErAvAaB108c554WrmtO2f
	VbAH+YrqIiUfjeQd5ASUd2m0vx+EAFRT1x0jrKB22+DLgDT4f9La8tA72LzS8ZTJ
	PcAKSVH02tui3bv47n4X2dqonGasxdnne3GISu7a0KZ4AA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyvcra41e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 11 Aug 2026 13:53:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bf321d786so38931401cf.1
        for <imx@lists.linux.dev>; Tue, 11 Aug 2026 06:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786456439; x=1787061239; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4vRQOl6NGy39XYmQ/g1XtMf4DH9304CfsV/0Kmhh5vA=;
        b=DipnG8G0y7LfjrDmryeINaE94tPONMESGKmrKhF98yh8aaVVTbTOjTIBJete8lTDvz
         dcysyfI0mgs5wbQZ85amnOI+UGpyNxI0AkW4rQQmAOBF2/gcg4WLcuK3zvPayutadJ2I
         jpw05zU/y9np2oYsyeIOBU28bsvuHFfFj9yoa+9TBNCNsiWrA/2JzNnefEHsW1Qz+Spi
         7t0+wCeemAPT7VeoHET/fuK7237lPMywjpyZs5ARYv304B5gxaywzuIIUvdUHX99BOTP
         UOE0OcVkBm1JfxgfNgf3kFHfma3CsEcsxTTGyRjkv8RsuTyPuOgLf5HowbJe+01V+E8D
         sHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786456439; x=1787061239;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4vRQOl6NGy39XYmQ/g1XtMf4DH9304CfsV/0Kmhh5vA=;
        b=bGOZtMq3O0qLkSjvGzEErLTstcavJDr5WTRyLI6j8fGtqcSWmHYafIxjxSTEFN5qlt
         GY9ruFf9qT2NZVDdgn2lqw+PZSLzDzpfsIcT1y+ZZagL7a5UFhHYJvX6UNws978o9Smf
         q/vwpwe9YaH2YM6kz22df0lv0/c9y51eSU7IHQBzUk8YAHFRqCqvQe2g9Zqw9Vbxw5Gk
         BaH4LhXkrWXtfZumUZngEHMTUpEpPkBvySngDlwJWctXbx0BrHGKXXh1hUlS2xym0fy4
         wWLO9fI84SCFHaMJvzCFYFNulEpswUKZW3X/4+LoSmEGVT3M9vm1by57ClsorFnMYIak
         yTJw==
X-Forwarded-Encrypted: i=1; AHgh+RoO8QTPraO+nFoKpo069o+GLyUU6BLQ7hDvF1Bcm1dqPi1kmoptI42oEDF0Enpne+YWX+Y=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWwRIEsDOqK2ZKAves6WYuYGIYsDZvpmxQ7YPdgCxquNznAsi7
	mxbPkao+Itg97dixdWmyRJxegl76WRKBqo0kpDYUMGvb6P73dhZuP7NKu8XcwSOzC5OZY9x91vX
	fTQWxtTq3E2vIJdfIWLqn/59bcQVr9I54EIEW2utDv9IO7gSvBv2eLCrxhCOF8kk=
X-Gm-Gg: AR+sD13vCp3InIeZrdRM4PuaMpZemH91FoGaxMQOc88zFiTvfxKmXdOOFBBjg6T5TSc
	VYMpolYFvqFrTxlMhLCgwd0KXPPWAHdHDxLJfDrNwd24DYaO6fRRMUO/a0VoIMdcrGlXbeh5KPy
	VvTRpy0xIXiUJlB1cb72SjO3sSDblGtm/2/NP04zhfktFfPxdUP+zePcKUaTuGi5B8aO+dTqQoZ
	FBrmBgXlth7GdOpMmKcsF2HchHTD6YhG474sLcS09i2NsTqgpFRvGKkv5YFyy1LLk+i8IaBTRtp
	NNqxjIOVvZU2X00uB529LFfPhBcyxutX/zaPjnH4fnCihcrxkH2gSiSu8eiSegshaVJyrQPcG8L
	37fihbKRw9S3Pteepn+mxKXSWBDbLaePIL7iSRFy4dPxXtSKv6ADNq4bvTQctB+RT/jwinOkmEX
	XwbwoC9nLcOZx9rg==
X-Received: by 2002:ac8:5e52:0:b0:51c:f3e:7819 with SMTP id d75a77b69052e-52d586be418mr25920761cf.39.1786456438647;
        Tue, 11 Aug 2026 06:53:58 -0700 (PDT)
X-Received: by 2002:ac8:5e52:0:b0:51c:f3e:7819 with SMTP id d75a77b69052e-52d586be418mr25920301cf.39.1786456438168;
        Tue, 11 Aug 2026 06:53:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b44872d972sm320824e87.61.2026.08.11.06.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:53:57 -0700 (PDT)
Date: Tue, 11 Aug 2026 16:53:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev
Subject: Re: [PATCH] soc: qcom: smem: Add stubs for CONFIG_QCOM_SMEM=n
Message-ID: <sy2ulk536ryakhy6fdnqr4asvzvufqk3dlo2awdrfomulyf4n4@qtp4qoazqmhj>
References: <20260811123103.210571-1-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811123103.210571-1-daniel.baluta@nxp.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNiBTYWx0ZWRfX+gVLtNMiOW0q
 O4Okj7/WP9kgtnyLBJwSCPxOfZ9cn9245l0EveB9yaQ0ngpHRqI6pwHgOG/KzQt2Pi9fbDNvljD
 BNdl6mnOqLRkbpL5puY7eoG6DmTL1cXL4oVLRg9jsQEyY1cvC6kVq6605tCoDIPE6d0DW9le4Ub
 w9QTrVhR34QEbACnYU3jlO7TsJJ1FtezSRidZmeTmvgjKDPhqZCtOAQGtN+FeCY9Yx7YyhBCTxF
 zEFRxSfe7H41UGkjclMuVzam4ChfeGdDLHP2qgcj/pRfCG2ctsQljkHikAIMRmH1pwcfBNq25pF
 myDoon+wyHEUElJh9w5v0GgU3AWCst803+28EcDGr4HE2xV+UKzTgdJpJkVWI9/1JO5hPJRqvXd
 +6qi58BjvImZ8tOD4x8bVzDJb8yj3jVLrweqi9M+4soMR5al9JZ+jNEh5c3f9BGK6q4E6ENhR4Q
 xrE8u7R4cjx8dOlynKQ==
X-Authority-Analysis: v=2.4 cv=e/A2j6p/ c=1 sm=1 tr=0 ts=6a7b2977 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=8AirrxEcAAAA:8
 a=_EDmfq6qDiitiB09QuEA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: adChf6bSDWqREDCIp7Eg6318zF2M3Pes
X-Proofpoint-ORIG-GUID: adChf6bSDWqREDCIp7Eg6318zF2M3Pes
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNiBTYWx0ZWRfX+hj6ULQkxDJK
 ZzFC24wH1LDKngtLdwJw6GxLMmJCJ0yNByidJeZlLhNtVrzJ8m+5YLB3gU8DNM1wvthVUn1r762
 QhuBuKz+F0W6BDfyUJPv784dq450/S4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110116

On Tue, Aug 11, 2026 at 03:31:03PM +0300, Daniel Baluta wrote:
> drivers/soc/qcom/ubwc_config.c calls qcom_smem_is_available() and
> qcom_smem_dram_get_hbb() unconditionally. These symbols are provided
> by the QCOM_SMEM module, but QCOM_UBWC_CONFIG can be selected by
> DRM_MSM even on non-Qcom platforms (e.g. with SOC_IMX5) thus resulting
> in the following link error:
> 
>   arm-linux-gnueabihf-ld: ubwc_config.c:(.text+0x2c): undefined
>       reference to 'qcom_smem_is_available'
>   arm-linux-gnueabihf-ld: ubwc_config.c:(.text+0x4c): undefined
>       reference to 'qcom_smem_dram_get_hbb'
> 
> Add static inline stub definitions for the !CONFIG_QCOM_SMEM case for
> all `qcom_smem_` functions in order to fix the issue above.
> 
> Fixes: 1b445022d1d0 ("soc: qcom: ubwc: Get HBB from SMEM")
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  include/linux/soc/qcom/smem.h | 51 +++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)

I think a proper fix would be to relax drm/msm dependency on UBWC_CONFIG
(limiting it to ARM64 && ARCH_QCOM) and letting UBWC_CONFIG have strict
dependency on QCOM_SMEM. WDYT?

-- 
With best wishes
Dmitry
