Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D0A285CB9
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 00:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787014684; cv=none; b=JnWw9TFch5fXfshqA4ulFrfefsttmHX8+LziiaZtGHWNeSrKeP4CAtE6MQ6HQK43xnZ6vlCTbdGviAJhnn3dwVFtWrYRf2rcQcO5/r8BBcWWnlVW25a7emcBYAYM5z4L0XUo3SKfoMgzx3LVlZqMKCZW8REuuuDmv2uM3nUOCEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787014684; c=relaxed/simple;
	bh=2nLMfiVENNzVCFHMgkOReMGXDYTJ9KQ/AvPIn9EjX4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AmLdW07lkUiq78iOF8V9XdyRfpGOMcaD7JfNy0aC/LDbpvAXhqOGDZu87qdQiRc3rOg95TfK3pTTANN5d6i+jaxBQZrYSii/gTiqAUN8GvdmvW7eqo8Cc0Wya0BGRN1D9XlnROApSOi618ALqSRkagB2aLQUaDTinyxbqnXM3r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BJ0Dc5zZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SRIsoAOt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BJ0Dc5zZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SRIsoAOt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLkSWd3058790
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 00:58:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Yneab15Pg9YDX4T0nXFdDDHC
	QsOjEAzYeDxUgJqfs80=; b=BJ0Dc5zZGYvqEIsBuRQMD+AkIHMC9NubgbcuMVt/
	wcXt0Xz7QHTsv4xxV0GKLh2qqeQdvii5ihL1K24suG7kbtoeSdKzEIH3SOgW0lH6
	2XwbvQpIRDbyk9P+IvRq+cs2/m5jwAXbFa1Zui/3BbOpYeBRA9l4YKHUK38ZFNwD
	jEBG/rTtdOJugE7bra+l1aTgVQsHnhFfBSgrbfGJA5rGxWuA04ucI9bs5oAZnVCq
	FuaFB6z3YYaJKeqdT3FeD0Pbhk40p7t0IStNrg5pNsbQg1ZQq9DeigKQPgWgWaYX
	csT1BIP7MsO5XpL+cTPO77KCDb2OPD00/pjnUOG5/nalEg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xx7kmen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 00:58:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936a796a23aso352562885a.2
        for <imx@lists.linux.dev>; Mon, 17 Aug 2026 17:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787014681; x=1787619481; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yneab15Pg9YDX4T0nXFdDDHCQsOjEAzYeDxUgJqfs80=;
        b=SRIsoAOthiBFN2RHxYrgZuJlDnbyD8OGTmKfeQKwcaDezb/XZGtUfdMI1hs5JPKVoO
         4d/JeMtlHv6xicb/hRSPVR7dxQtgqQCd4BO8MDHjC/nsg3nn5Sk0dnFwEx6A4BObFbS4
         G6hId1OrGgcYdt3TEFX2XjVAkFGL3t0dv5D3Swe0bgaeWenynwawcEeuogRm9tzwcjd6
         98aseia+foe1+jwZF7aFO3Ak/XWjUV2oXIAL7ujU2/3O5JmmTcV46bvkDAX5TKE9mhTA
         pJeUHJs4330J+6OfoTvGZ7lELjBqHSJoLzCAl9agvDcrGUWca3QelDxZ4a3UnT+ijp0Q
         XN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787014681; x=1787619481;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yneab15Pg9YDX4T0nXFdDDHCQsOjEAzYeDxUgJqfs80=;
        b=Jk0r4M+I3HapO+pSZ06JzyYgQ4c2DJohmgS0Gp+2nlEu4vn3eizbw+FzoSQ+wZIsaP
         x5Cu4ktFns3Qb2NAGuerWAQGxKUH6b9x8KD1gAEBm9ug8/LmPQJXSyGSwQD7qGI8CzWU
         ExPD9sM0wtf+VdyCyX/ErqMGd8RVa4B/48vQSp4Y2v2sXMjxNtUA/EHYoF9H3Q/YYErc
         AD9HyRPqAJHKAbjQPDyHnEf/j6zfUYhg1dLKTlKM91yZw+6kHraPKog+7oc/OYKYeHat
         Cfv9oZmh5CjU8wfeusffSpQqww12L5746gD4qGhJcofee1ioMqV+l3OK8OQT8I3mKeRT
         3aYA==
X-Forwarded-Encrypted: i=1; AHgh+Rqb3XoX08o4xxCZjAFYFzdDR6D27L+QkKbdwAAIk2Q1vZwLHtiEBxrYE7RMFWTTnBXgW+0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyldD3sCGhxWAvBppj39Pnvbz/lN8ec7SNXLssASb47Dz61tcwD
	79GipJZ9p5LTZFXNzEP3sl1aIxi7gfjxh9LE24ME8SUsIb4fk7FIdVA2LTOTwmUtnJXY/JxNTDs
	rHrYMrnCo7qj2y8sMKb+SJc4sfVi+IxJ8xFVbNj1tMHmKlBhzY5CH+78=
X-Gm-Gg: AR+sD13g0P9URh+i66mMO0eHjPCxZ4rlB9JUnyvySxZ/kwalefXk6EyILSHyUCW7YlE
	efpLhXIuCRaw3BeBx5a/kvT1jtq7DKUZknHF4EtWFuGML02SeR1SvFYqrVjaXMaSDK0K1jxUISk
	jvIk2HVlB3Bbd8W8JIA+C3K9ZB0govbVSrCm1AbvNin8iuNWnmNFSE5lEP0WTb2ESqr0PepjZZa
	uTFCUmvySDlmCLCXt9RenTlWl5JGw8j4MwIX1sMJdBpWfjXTJuV/+Szq8ZaEwJ4ACA4kFSVkyPP
	xt+S72IFmLuh/NPOKwfZbSkSdIRKm+lF+oJsghoEl1cqEzmcXV549P5SHBBsE234phY2WIuCt1f
	FuAjLMCoXpaOpUAXUnVIch1woQUA35XDYNAVsRBMAVVJn0C1V6ddSoaJe5FiBlpGb73DOhjBism
	d7s/g9Y1hDy9gF
X-Received: by 2002:a05:620a:4405:b0:934:851b:f3a2 with SMTP id af79cd13be357-93707cb7866mr217554285a.8.1787014681061;
        Mon, 17 Aug 2026 17:58:01 -0700 (PDT)
X-Received: by 2002:a05:620a:4405:b0:934:851b:f3a2 with SMTP id af79cd13be357-93707cb7866mr217551185a.8.1787014680659;
        Mon, 17 Aug 2026 17:58:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cfa12ccsm771793e87.27.2026.08.17.17.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 17:57:58 -0700 (PDT)
Date: Tue, 18 Aug 2026 03:57:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, nathan@kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/4] media: iris: Guard the QCOM_UBWC_CONFIG select
 with QCOM_SMEM
Message-ID: <oasutuax5ghsyg4zbkjl5cekg7iitiiqxsb2fztsqgpc6ie34e@niub62b5mwmr>
References: <20260817123542.48475-1-daniel.baluta@nxp.com>
 <20260817123542.48475-3-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817123542.48475-3-daniel.baluta@nxp.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAwNCBTYWx0ZWRfXyeLmsHInIuvt
 ccLfi3RHUHENZCvZtYNuCXCH2zcYZp6uLpaXgFkIRRZ/xgrrOaiTfLJqagwbK5CpUvpv13yduA/
 soxdEVb/6ozpAtC7BQbS3ANrbi/vZts=
X-Authority-Analysis: v=2.4 cv=TK91jVla c=1 sm=1 tr=0 ts=6a83ae1a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=8AirrxEcAAAA:8 a=L1AqNCugDRGGcWq5ZiEA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: YHvQ5rK4E0jlK4pLItTt1pCN69tEEvQt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAwNCBTYWx0ZWRfX18Yd7amL70Z8
 4dPn+ykLmU/aJ+CT+FmLbrhJ3QHGswlMKMSF+kffwvcvg14snjsKVhym2j4F3uStLLbIcAwV5TM
 E/+DeJnXecWfimSIXZ4G73IQs9KBcDXzpezynkTItJwkpIbZg4Ku8eTpcjx2aDphDWLtMV1HdzJ
 ds9lRhtf4sqArKBPKtPS0m4fQLALgLfO4etLKceKvA3uFDqhGK17LyQXOQc7Z+NI6MbGWD4ilPI
 eVpsFLZ4RkUx1ZWDm9OmiwuoY1QMiYORP0VfQmqb+mojENL7gwVgHCTLzXIz1hr0oJvH6WHc0i4
 otiSse40nNsacWtPqP6E7eV0eUJVvm3a45DOt1yFGfCyzVsIJotnHz0bRDMIE4iEpn2q8FEnIG9
 6crlV0pCNisW086thWS2HKmM7lK2J62PxRrtBx74oo47RgSWFnB7WIBmOUc0jmCx0djDIS8H6qn
 SjY9cv5JdZfMxYeAGYw==
X-Proofpoint-ORIG-GUID: YHvQ5rK4E0jlK4pLItTt1pCN69tEEvQt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180004

On Mon, Aug 17, 2026 at 03:35:39PM +0300, Daniel Baluta wrote:
> QCOM_UBWC_CONFIG is about to depend on QCOM_SMEM. Guard the
> VIDEO_QCOM_IRIS select with 'if ARCH_QCOM && QCOM_SMEM', and add
> 'depends on QCOM_SMEM || QCOM_SMEM=n' so a built-in driver is never
> selected against a missing or modular SMEM.
> 
> Fixes: c43207553867 ("media: iris: retrieve UBWC platform configuration")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  drivers/media/platform/qcom/iris/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
