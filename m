Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06ACF3AEB5D
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 04:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783313759; cv=none; b=OozoyuwdE2XGxDfBdEG6gHJBKR5dARtvgIwXBg41mSfbXtANA7KUT3TgZVUQSn0FfiCJtOHg0SNU/3luMbe+ynaQSvhCeB+AfCRgIRWeVaocZTXKH7aKPfZLTIlFNx8dNLK/umkbWqKwMBPp/WQPEYeMPREyJSxr6NvI2OEHU1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783313759; c=relaxed/simple;
	bh=YmgsfoXmP3wicea3p38VOglMuty4QAN7Ko28KEOX1Hc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WRivAHliy9Cg0/gbCbtW/MRmDTtSUahQflY7inYOML7uB247yMd+YEGD/mV6oldMsPjgO3IHtIUM3xJ36SIZBPACKZh4zFkF0Ft0OhxO+HNYoesDckKaJveoRQotyFGiuVmlnJwRv7jGda7EY35h+losnS8C2UruO/F3rpYt0kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BtuYZphI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TkcCFGSC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BtuYZphI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TkcCFGSC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666425Dk3616551
	for <imx@lists.linux.dev>; Mon, 6 Jul 2026 04:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=; b=BtuYZphIK7UnAPPa
	qYGHPuM+VD3C6WvezTLdqIjiYVGHLzNLv6RSapQqEJ2excDEyUkD/0AEcWQjp5ej
	4HI3bMiV8UCRYHw/YXMP72BUtTB2CANb5/xl2wJKaV5lc87Ax6wEFDsEhbUsTXur
	RNx2Hm91I1sPL4Fp17l4JFxQuB37ZPnouzzUHhLqbWpMJkm6xOuGNEQuSB8vkr4v
	iHs+mInjL3lcrCXDe3aaUW3MnfspbyT4APEA3ecMXRsbeK03HAVvm7fbyNR3ckpu
	4lDTqZIfECL8APV6bvyHqU87nPrqklBdw7zS2B0zT/os5ltI50S9QbhC5yDZwUWY
	z7D7UA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3ccrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 06 Jul 2026 04:55:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-380c178acfbso2125499a91.1
        for <imx@lists.linux.dev>; Sun, 05 Jul 2026 21:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783313757; x=1783918557; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=;
        b=TkcCFGSCKgKWI+lDWp3o1cTpPPg+zUkxg6uYyxa1iidLZfQ79nI7nTAGk27sUCJUM9
         r0Wr4Wp72+hfr1NLys/hYJHDZQNWSPWdE1N8l58P/zP0DM5W03/RTApOj6+Te4+teBpt
         ebLzD6f3Z4XVT4Kuwl/AAqEnMxSOsyITJpOFzmAq9uz+wPtWrkLVVMhsje7qOwTmD7tV
         iW68YfQVf6eQDQDqSufigKpnlLsSY09DRQLgG6xo1lBs+1f9JzkSC0oDyi1Vx7+YSnoE
         L0PFgYYxnsfV2PV17y1ed6PPVDfHthFAHtZPQy9PjaYsivb+Lf3B4DhQyn71fCqbOkf6
         BAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783313757; x=1783918557;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=;
        b=b46gCSdW9miD2h82mYtZc0Sq6oK6q1EuV608wOsxWGUIVI7SLRfUoOPfSF/WJHl8IU
         XYL6xDCWHvntKFDeejmYagFKNxTMynwmQoLWzEl0hsKqLceIseOR4pgAdQAtOHQY3R0q
         k/AEyn2d4ZGKaJy04oNKo6nDAV81vk+6driFerjkE+wnen5jCqOEwrW2e9IfTlVJx5ko
         QrlrUASmHJ2xyYhuJDx276hYIlDqQp0sGu7kz38d/Yvo7X6qbMKqyoSNTdIdJK92fVgC
         0O63opZsWZg7GxNQslJxmPIDv6q1Ch3BgmVUMtxoOaMcwn2jdRS2jn7QCLjwEO9Ylu9I
         OY6w==
X-Forwarded-Encrypted: i=1; AHgh+RoewVCyPdg4iEN1hRXWFITw316x+UHIvy0q0xl1j2pL5Gu3CIVwsFszEK4/oZoz78y6XEo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyNaLBmvutBleFpqY61ApTqMJ+BBHhWyH3JdiekVteyKn0cIIAF
	6YUjmBordjptdzu+7rQWGo4TUcVBW00xa5fU17Ej+4D4/zXUXvteRzbHAiZrE5FjSqgYuFlKEl8
	nkmnvYXTg4kFPZhdK5yG3+GWuOyTs7aRx9AeKojMeekOCKzSx0zceLb4=
X-Gm-Gg: AfdE7clSwiO6LvUi39Pagbvy9xzefIpnwU7kjP1uEWrIkMe8nkWps57st59xoalghAi
	piLDcGXjuczofgz/B2tldww4+DusIa/u6Uxv9SFOwr/qWejHEjA34c6Nh9kf7mQIqdzGHkn5UcJ
	GoYIHZoIHMsa27z1tvCLO4bhEPSRy8ONk0tLxhfQeRBftA2FeKHbejeqPPVqZOgTEKJ5tP3cO4C
	mGIVTZK5GSVJ/zhupfCDZI8IbvFGqYX1Yh84Bqes4MRDt1XirDT9Alur7bT5uCZ3FhJpaGkmo+5
	Bg/BCD9AA5jSzt57xKDcFtuLTwxL3tbcrCItcXQlDfnpAETDP4YGQTH2aPuQBFe/VG/6foTtm0n
	s6Ea80cgtPPD3NznE4JI+nNWPEr8aKiSRNoqP/pwH
X-Received: by 2002:a17:90b:35cf:b0:381:9b7b:35e5 with SMTP id 98e67ed59e1d1-382800d1a6emr8328727a91.4.1783313756499;
        Sun, 05 Jul 2026 21:55:56 -0700 (PDT)
X-Received: by 2002:a17:90b:35cf:b0:381:9b7b:35e5 with SMTP id 98e67ed59e1d1-382800d1a6emr8328696a91.4.1783313755987;
        Sun, 05 Jul 2026 21:55:55 -0700 (PDT)
Received: from [10.204.78.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3114fe08b1bsm12946548eec.26.2026.07.05.21.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 21:55:55 -0700 (PDT)
Message-ID: <95e8281c-91e9-4444-8b83-ea87243122c9@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:25:47 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 40/42] misc: fastrpc: Use
 devm_of_reserved_mem_device_init()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        sound-open-firmware@alsa-project.org,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <20260705194019.2565498-8-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260705194019.2565498-8-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA0NSBTYWx0ZWRfX1p3QrCNEgtK2
 stHIh+OXUGq6ho2QFnXSXNzP5nPxZ+HSATa+iZibmfXimFhRk+x8hHI5k2SC2rsxEhBk0PmZBLm
 rQ03bW+iC46iPAs4Ttt2T+nJ5bIySik=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA0NSBTYWx0ZWRfX0WtwAP6lExQV
 FHXuRUBcxmoKDut6FzZkrF1mAMX9yAwZ4u3I58UjK+2gMIplnA/0WX0T0MilLv/ywhB+6xr8WiL
 oGJm8x+ZH9tdtPDIvyYttdeTZLOGc/B9aCqQIS6X/3XNLPLmVfhJYteTxHwtRpoHryO6F0pYB3S
 kikxXLiypRyt6glrs77arcS5Jj3BShoDiAw0vy0zOF1uzC4eOyi/YLTZ3oTuOVnhB1f6wQPeMze
 q5YG5I1CwnYlxiLfKPYsWD2MyF1rvnbgcMTJOZ3jLPWZL/fKzLWyHyzbTnTKq+8HmauoYiGXmdd
 OM23+UeiZ/JJ2FD5ha9iszPJR0bGRROW5SHQ4th28Ls3S8PUSS/c1rPusrCyc+lQBOcaAhTtySr
 /g3txabGQqBULGuLoI51Q3v7sJILj2Fbj6xiyXC5cUH7JfgqWaljXtKR3DIeJ3Qvp24b2RTN5Rs
 7hos2i+EgFxsfNafU/w==
X-Proofpoint-GUID: Z-ieFspspvatHzECPrO_CdPaMxiYRmYX
X-Proofpoint-ORIG-GUID: Z-ieFspspvatHzECPrO_CdPaMxiYRmYX
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4b355d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ee02QKOXNWxg8IJ2rEsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1011
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060045

On 06-07-2026 01:10, Mukesh Ojha wrote:
> Use the devres-managed devm_of_reserved_mem_device_init() to ensure
> the reserved memory region is released on device removal, fixing a
> missing of_reserved_mem_device_release() in fastrpc_rpmsg_remove().
nit: I see this change is also fixing fastrpc_rpmsg_probe() early
failure leaks as well as -EPROBE_DEFER retry paths which could be added
to the commit message.

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index d86e79134c68..c4e05b0db527 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2396,7 +2396,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		return -EINVAL;
>  	}
>  
> -	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
> +	if (devm_of_reserved_mem_device_init(rdev))
>  		dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
>  
>  	vmcount = of_property_read_variable_u32_array(rdev->of_node,

