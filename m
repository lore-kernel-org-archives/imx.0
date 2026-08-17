Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D82F3B8BB6
	for <imx@lists.linux.dev>; Mon, 17 Aug 2026 07:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786953057; cv=none; b=sSBIO1f2zyvoPVGCPAQr/GmMuo9v4QaQzQl8CkP+ED0UFq6nVJ5zVjXBFbC5s4KaNWqc7nrtOlFsYGAM4Syia6KwUrcchxbr2+24LO2Uzo+mjEhpKcTg8hNWrFZAr9DGs9Jq1Efl50b4xE5lr/PgFVb/pUpXh7Lf3Wux4DKKTUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786953057; c=relaxed/simple;
	bh=iJ9uTyPx21Ma+AiVc9vFSRd2u+j4vmvxOrrrn0JpHZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N11IAgSKw7H2wO9bjVfAL/QO5yrpvqpjJVFI+0+S2FzfGeYqxZ41ZTQGdcYtEBqP0PVb8x3mUEoX+f74KBCtpZ/vFDeFq/VyzIJxe0kjbLumTMXCtG71HuVSvhxW6CUUbmAHfllwROkETPFnT7J61+qycTnwqGDPM5Ho4/6SdhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aPguLK+1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ImLAaDFc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aPguLK+1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ImLAaDFc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H70Hmf663009
	for <imx@lists.linux.dev>; Mon, 17 Aug 2026 07:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lbchPXr6LQ5dkGa6qhJAuWCOPufUJKyI0pw6YyA24A0=; b=aPguLK+1yAiq4H5B
	hx9JtXdyJfi0j6L2bQv1yibOXQ2dZsjPQi37xW0lRFMgdhn/Cw6hrkVbM2o8cV/E
	XmohjoIW8qFZkCLx03Jg7R8Dny6AQKsLtilE6/qdGAFM4Ekj1Fr1H4Jp5SEVbCKu
	KTZWDP2NCYZJ+YqtK1PGaWFOTb1FHeZNhw7YX/rJArSEAeFVypZQPjelv6Z6mJUO
	hNhGJd2Y76Uh2PlrYqpe9ZSuaS2g/G6mWcZfBuiSQ8K8ksdDmocPa9kox43MrV/Z
	RNzUM4rD7DJf2oqGevK8AuQx9tAL02gBpGvr0Rx5bZbOt72xCVrysnUspcxZrOve
	df/npA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghnwwme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 17 Aug 2026 07:50:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51e9d892f0dso9006871cf.2
        for <imx@lists.linux.dev>; Mon, 17 Aug 2026 00:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786953054; x=1787557854; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lbchPXr6LQ5dkGa6qhJAuWCOPufUJKyI0pw6YyA24A0=;
        b=ImLAaDFc+dftHOVPsDHn01+tr/1iZ/63LritPdFcKo09j2VQ4mIQt3RDEhpgcmvXmR
         Q646ppLEJXL3tPDtSWeKBnlDRqnY0B6vYRHTvV/yPdq0WfolTwfLarr6choY4XGEn7n/
         T3B9A5zAPvUGjGHMM09mNYJtvg4MU0Mn62IKN6dYbaS8Z76HdvlaWiKqnxPe6nvJYnM+
         FsurR9zziVG3LtXXDfZCX6FBTy0zWqSo+4TqnjvDPgS9Gh9W9klD6DbeDHERSZ2YRdb4
         3aTb2QmsseIIu7F0DqqVYJoThbSJOBLPWnCvf80H7A70YMQ0FhyRnlJy2eBwZhL2F8qq
         4+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953054; x=1787557854;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lbchPXr6LQ5dkGa6qhJAuWCOPufUJKyI0pw6YyA24A0=;
        b=dVpD4DhXnUjv2KmVtuMdbwkzHHGdvhmm2aeLI8bJCpziRURX/GblXFtnkXRO17Ym9I
         5rIFMnyE3vQwnQspxWWBl/1NW2Cbw0lCT9TRMvGebdKS/SVauCMM231YdhrHiLDyFpc1
         zxJPVdNXAquQplgiguiRYgz2Dq149C9p/8wR7HzwguMnVFOIP2XSdh5SfRocxvFHgtRB
         Iu10lyIL9pubQRfTVKaAo1Lf8tjkZhq04joq3FaduZvBAQwnNKvvuySUnNlr+RPKvtrX
         0ySgYtS/utuTL3VM/THJvFgRqONNybUXgK8NqAT1T4yG7MFKRoQ3IN3wg6cYJIh6D/LG
         5IEw==
X-Forwarded-Encrypted: i=1; AHgh+RoHKoy4IKcEAERnQdymyO3QyPybFVBNj8ZKAotpvekRRDlnWyVAo4vCJl24ypFIjZ2LVOk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxzRA0U1c2Hsoq8pcHMIvfV59WaaO96fLk9+t/J7lFnVPYA98rB
	EXsk8BMd9gXDfRp/wvdQKcOAOpx/m4z6znr3TFPh+vtT+VqVLbQqRdIT6d2H8tTZdQ5iORT85XH
	/0SIP6T58AWcOWMnwY+XGdvK+j21IxBLlFk2BYahCLoQRUjPwMh06ukE=
X-Gm-Gg: AR+sD11b58zZjGDwus1IBvq/iZSaduegHpPo4HhVGSmkqr5EEMvk8P+N1qAa6fBIBXY
	8US2ma82off51w89RfpuKlv3SGgeMgWectAYttjFTdOp6IHEvwurRcKAWhnyrYrtPYbzAYZLjps
	T9TIj1klGOtmjpxxV0BGrRTok7t9lJ0xagLYz8cI5wVGu8KQ5Fox0NzCtn8QgWxue6x6QonXWZB
	mFn/ugBXzszwH/KeiKVNgQ9v3EoyAOrVrww1kd6R++hRxHTiROAtnqjRQQmau2+1NkMxQsL7QDA
	PKSBKxYdFATKFhKmWjkmfZZhavZw0JOGgMmHuyfcWkIh2oQtyK95bYkBa9+lTcLzOMb36hkAEXA
	3iXQe3mxjgc8TNfWAbxB9AHyn
X-Received: by 2002:a05:622a:11c5:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52d85333bf8mr183797101cf.2.1786953054552;
        Mon, 17 Aug 2026 00:50:54 -0700 (PDT)
X-Received: by 2002:a05:622a:11c5:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-52d85333bf8mr183796931cf.2.1786953054122;
        Mon, 17 Aug 2026 00:50:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d85173dcsm314100a12.3.2026.08.17.00.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 00:50:53 -0700 (PDT)
Message-ID: <e5cfb9fb-d4fd-4563-acc6-9b62e9c95ae0@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 09:50:52 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] soc: qcom: ubwc: Fix link error when QCOM_SMEM=n
To: Daniel Baluta <daniel.baluta@nxp.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, nathan@kernel.org, imx@lists.linux.dev
References: <20260814141724.1006382-1-daniel.baluta@nxp.com>
 <20260814141724.1006382-4-daniel.baluta@nxp.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814141724.1006382-4-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA1NyBTYWx0ZWRfXwiSsDtTDbYVP
 yFanqoufqW85JCofPdvx0tpaDHG7dAD98SCgK5lyDKEYjIFMO/SvRcLVdjCzph1qHYnxyEJUhIZ
 qiN6pFhgmDWMI8ThH5y6i5ES/rgLwoToN0VUM6IScsPlzfSu0B+hBoM7E2eTI2RBOdM3Hg4I+fC
 tYeHp6t12XM/RSl6q/dokxlVndy2A0tgxllyl2sy8vryb+pFEPWK+/cXIDQZ2rGP6BMAm3DP4Dq
 sAv3AA6OjrIVI87IuyDbIrczlWXhJVSba9eiuzJwa6gtj16OMtl6fQRJs3ChOTMNd6L1cU/xhCK
 vAWWqaO0kKSqm0gcwDLPaRTWxsvTYiS0EGmYXTYyf8OAOyHDcSbwjIhb4aCwUGtv1tSYwP8B86o
 KvgP7DiA3ISHFgPSixUenhc7IDfTSqWTukHqoHmk/Nxwa30kuQbnzk/J/3bKcptDBhAup97r1ce
 3Eqba2bkPpb8clu8IkQ==
X-Proofpoint-ORIG-GUID: 7aZo7GxnxVEZcTEztivsrN7E32-qMQ7Q
X-Authority-Analysis: v=2.4 cv=QN5YgALL c=1 sm=1 tr=0 ts=6a82bd5f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=czfsfouh4VKptltzzNsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA1NyBTYWx0ZWRfX7Fgm5BwDZ1Ol
 niXHwIctDGJWkYW8LTCPfMBXYb4usYCvtURHN4fHpiuTZL8qZLJzqMVxTMk0KdaJkM2MChME26M
 L5X/UfxwalaL/L0/TR1P98AtWwXf3XM=
X-Proofpoint-GUID: 7aZo7GxnxVEZcTEztivsrN7E32-qMQ7Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170057

On 8/14/26 4:17 PM, Daniel Baluta wrote:
> ubwc_config.c calls qcom_smem_is_available() and qcom_smem_dram_get_hbb()
> unconditionally, so QCOM_UBWC_CONFIG=y with QCOM_SMEM=n fails to link:
> 
>   arm-linux-gnueabihf-ld: ubwc_config.c:(.text+0x2c): undefined
>       reference to 'qcom_smem_is_available'
> 
> Add the missing 'depends on QCOM_SMEM'.
> 
> Fixes: 1b445022d1d0 ("soc: qcom: ubwc: Get HBB from SMEM")
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
