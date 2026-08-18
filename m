Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF4A24A047
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 01:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787014983; cv=none; b=eDI/hoRsiy5jpZFyZR/EBI/8dw0dFifVFIU4DMSR1VlOvkLA6IqolaXRPdFd1w5CAN/cXr2Cg7RVpIqwY7RJ+wPYlWPoh6mvxr8zWMXf5HVLELu+b0wuv/WCGIaas+b8/a7iqlYftuUBOk/TeusP5rBW1BJr00RkCXhzyPM6Mz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787014983; c=relaxed/simple;
	bh=mfyD1rtsfWwWtpBpzq6/KqrwDENReA0Q9JY7YjYd6lY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h3ChU8M4KCfAJ+ZWKQv06B9b0xrWzt6bSxi2Aq4G+leH/ku+d7270I3bLn8ca3BkqAw4JfklXKHMgc2B6Pl+sliKg7HMLhRbWfAGevGMhHWlF4D6HhQUvbf8h/CU8+ndtn5vfEHLpPOoCU593xIuUuecn6U8hMz9yBROKVDwxdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fU4p4VXM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8alc4r0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fU4p4VXM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L8alc4r0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLkf1W3145125
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 01:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BRdYqDpXtU3ICy18QUcE/Vec
	i8R0rHUVNRiP/8/gXeY=; b=fU4p4VXMTSHntnmxTUSrPuD0JapwYq7iYCC1pHhM
	gCK4e5+Q9YDsF59ZIySjQ2km+RH0aQr7JAUNaBAzBbXTq0S0z4HzWt/XeiEGP/4Z
	4j8pjuWLap+LBV0/J9KGtfJxdXsyTV65l4TF3e+nH7j9X0EmoNjzSodqKl5mLc/g
	3IGo/9cDbulmoMIfxnA7YU6bIJdCW6YnJEWohVzQ0fB+B5a2XsQC6DCkkC5poYF6
	v3PIVAiJ/I3Qum+dCO+UBIgsL222dPx6ZfpFXoDhfegnsCAkjfKLG4MvxyBQSSCh
	FF6y8sKLJg4CLjG/l7B2pXbji8TmnNsOJqkdzF/cIdCw3w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xw8ksuq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 01:02:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so668523285a.2
        for <imx@lists.linux.dev>; Mon, 17 Aug 2026 18:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787014979; x=1787619779; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BRdYqDpXtU3ICy18QUcE/Veci8R0rHUVNRiP/8/gXeY=;
        b=L8alc4r0C4OILsO88zgxN8XcbfzQOiTZXyGawvI/E6V0TzBAhOSj6uK69zG8fxx4ee
         TaXDRa8C4IGhF7jthRg+w65GkQY3JqUtRz5vxIOZwY96vZcZ7SAB+FOelCdfyWoXOqTK
         +jYAfPx9Nc9Ch2V1dcCz4YzkeODoEX+4oZ91PZIWQFdFgxPPfdO6nOnDsOquAdNcBt9F
         cucE7vq5tFyZAMSe+0fNO927dqrNzQS7vTWTRPTJO7iYqEoXEJQ5y+eysg/VmsFp/mBg
         OxRBFNaerX/pwZen9Su676ttjNH3kDaf134IUxs/UzYHWREgtC3qyR4JFugkWl+44rAR
         JYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787014979; x=1787619779;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BRdYqDpXtU3ICy18QUcE/Veci8R0rHUVNRiP/8/gXeY=;
        b=P+eQIkaZXxcnZ4AQ16SNlS2ufsJHQ6pfBbmN/AQf+7p6vPNCpALRFE6yab/MfWl+ct
         DxJJEPrdKLlWG/6bojXMVtiDWfw73N0qYz0+QZkhBMNvBLVIm6BIvqKc7Mlfq8Ag0eRg
         9vX5vPSfyuY/lgLHMxPn/XCda+9KEnI1fYveSXyHiG1Qx4JJSSRj8xoZIdoyiW7D/O5p
         kcLFTcjnc8kDCqPRqOy6i7UHsRNeU8NrrYvzCmZPdAFC3AId2WNTvpJow1YDjFkje0vY
         aFz0TtvDnGwIoaJd0ZvTrylqfzBD1yjqIMu1sbWb0aBo/B1T4RobRwrX/eWCF/FR/rRl
         yiOA==
X-Forwarded-Encrypted: i=1; AHgh+RpYztz49jqgquNB5yeJRsYedmc3+C6xCogOY45r1I8rO01+LGE/3aRXmU4cP1WnKOjml98=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqQXnUY8SF+8XtUTaKG4rFb+MIy4UHmmAMwIZkvwI6G+VumdcW
	IC72eHQK8ARY/6je4KdqwqG4nu1T+BI6BVsuaNgk1IqiXxukkOR93i5ia6OSYh7U1tv06d/P/Yo
	CU0OEJX0Cjt6l7VckHIJZ8KoUYa84ktagB2wJvRzJOjGXAdR6CmJWNLk=
X-Gm-Gg: AR+sD12vMxTfItyjJxoZGEHg9zG0+DRP9dP5GkDWtdADKx5ANb5Tvxe8QC1FJndQKMz
	ooysRyqSiCi+wx4BDVX6GsRG91Hk7dYrGwABwnBAbX82brdwNwBCycgzhOvJjf0vfy/TxofJN74
	jeRDTVL3UNA/+wMIA1VCepW8dBm7pK7H4Fv0nlTytRXfC27lEfwRAMWDSa3lutPR9skYR86VaVZ
	wD7iM9FRor0cWxuamhEkGdKeRNv0lY4cag3pgII7AvQQ4VFErI3IaoO4Otyw1sPqmNsbLQJU6hA
	Af3JmOw6WuRWPOP/JkAAb5IJAt7pm0Pg6o3fPy1PBkWrZTnKxTftNju3rv09YvUGulSB3e5coFn
	/JhqkwJDIbIKlHz1QvGeEyqoVm9CQ2nEdEJLxeZ6YhRNcz/fdAMo+DVCN3ZfTCEpOvETSH1pRTn
	QTepmf/QNq204q
X-Received: by 2002:a05:620a:28d4:b0:922:d336:1990 with SMTP id af79cd13be357-936d2284f21mr2770801685a.18.1787014978724;
        Mon, 17 Aug 2026 18:02:58 -0700 (PDT)
X-Received: by 2002:a05:620a:28d4:b0:922:d336:1990 with SMTP id af79cd13be357-936d2284f21mr2770796485a.18.1787014978281;
        Mon, 17 Aug 2026 18:02:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cf95803sm772558e87.1.2026.08.17.18.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 18:02:57 -0700 (PDT)
Date: Tue, 18 Aug 2026 04:02:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, nathan@kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/4] soc: qcom: ubwc: Fix link error when QCOM_SMEM=n
Message-ID: <fk4na2wxwpgqdpy4atzswkovvf6zzthylhvndrc2qqkegfi272@hnydvrjvms57>
References: <20260817123542.48475-1-daniel.baluta@nxp.com>
 <20260817123542.48475-4-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817123542.48475-4-daniel.baluta@nxp.com>
X-Proofpoint-GUID: IGrK2tWwmK9A2O0bQb1vOZ0EUeezNVkk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAwNCBTYWx0ZWRfXwp0R0ecYM349
 v/Ym/OzkUuDHIx8S3WxwxvS3rlriyKU1kicBtMlrGTPs8KzmpMBcVFoJF3gA0qFf+F0Y6pxVABA
 u/6yCdpm1dCxtXLUmO6ciPLLB7dKmbg=
X-Authority-Analysis: v=2.4 cv=SuCgLvO0 c=1 sm=1 tr=0 ts=6a83af43 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=8AirrxEcAAAA:8 a=czfsfouh4VKptltzzNsA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: IGrK2tWwmK9A2O0bQb1vOZ0EUeezNVkk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAwNCBTYWx0ZWRfX98v+ZXb3546O
 v0YYrkGqiFq64Cg76i/KpES5XgzvZFuCDRF1Z/XllvIo/GlmWWVoVDYtXUcoZfaKI759bVPAUfE
 XeFvrGEZv6fxBYV2XXCfsqEMKiWbPiYv3dEqoNpEVrlMVi5qsrnA776quHwHCe2WOQYOXpFzfDh
 jq6mr2YOPC+at9IWvHFDBTBtMGdDGLLnQMUSQTa91YU0X3QW2nVV3c/aeQtyKJbYgKBFxkf9VH2
 pKVYG5SXXbANMFyAblvWYei+fcNPe+TdxWQc2dGPJK/S5gtnQzYvUgziF4i93dgEs00dHajXJ7u
 ICE7Qe3Pk51rpv+lBkJgBCuOTkuq3f8OlVUa7vS0nwopuOYQrwMfDiIziBKOI8EADthejI5LHM2
 zIAMjUdxhHaJip1YsmCsAyXf52YHaXA2Et4T7lSSyMx7RAchukupQdD8BOffwT/XX2mSR3d4rMy
 HHzMcw5H1ms0guv4ekg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180004

On Mon, Aug 17, 2026 at 03:35:40PM +0300, Daniel Baluta wrote:
> ubwc_config.c calls qcom_smem_is_available() and qcom_smem_dram_get_hbb()
> unconditionally, so QCOM_UBWC_CONFIG=y with QCOM_SMEM=n fails to link:
> 
>   arm-linux-gnueabihf-ld: ubwc_config.c:(.text+0x2c): undefined
>       reference to 'qcom_smem_is_available'
> 
> Add the missing 'depends on QCOM_SMEM'.
> 
> Fixes: 1b445022d1d0 ("soc: qcom: ubwc: Get HBB from SMEM")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  drivers/soc/qcom/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
