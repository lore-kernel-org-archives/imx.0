Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBD134CFD7
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 06:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773036857; cv=none; b=Z+s745dJGlAuxZmjcWURgOCFrL7Eq9MXSNS+ixrwQFuzZ2oX9FOoR/KZnAmE17eMYcgZopoHYZXvF1f+HpaK2U+1m1bwLautoGnL5WP+1xi8eM1OP3d/Vo4WEDJ3+F4dJz/SFtCZ/F3J66meRJEvOEcoPI68vaMd6Mqn08kb0kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773036857; c=relaxed/simple;
	bh=0wW6ViPP9SX05v/uSI0BCrlX6Rp7w6Pl7ESM3pi2/1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PGsA1qUgJS/93dDJD5HDwOFX+toolVVLIuPkfjczDJcTh4E0f/MFfJQoNBoI7ol4BtO93MyWRlG0UAIqBL/ikQe94+M6CRi0Nl+5ZGac4Hl54Qj26Z6lOBZ3PQfERC2dfajp/akoAJ6/1hfrqhuSh9Uh1+nU3yc4yhT/mJKL8ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eGjPs5sF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GLAZ3VIX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eGjPs5sF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLAZ3VIX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628Mxm7j2660360
	for <imx@lists.linux.dev>; Mon, 9 Mar 2026 06:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6hNZOwQq6HWTjuqn8FSE60/aQbj4nXzSVsV920Knhsw=; b=eGjPs5sFBB0wJ6N9
	Qgb1n6C3mddLAUoAXZrlJV0qXQrnkB+d0SHAagrC6QLxPTAP1jQ/L8fHNo1F25rJ
	vSn1evrEH5SrKxHXmXuZ22JqN9mgfAsTZHxLd+2nbprN9Ifh9NzywkLZ1PultdM9
	iML8k7chYMsEPaGMd6Hnwqq+mRRLGAhzOy/toU7/kwUSoeXVHnZ+gziC5wXNteUs
	2EXhuMEeYa8uuXAGsVbL+ALU6J9utuXXG6N/y963hsHaqmnA0Zm42ggr9z6UHd9r
	txpa4LgTECDzWEI2ngIwsAEbg/XQb2y5JYyYjNXaZsmBBw4dvH4v+iCyYWRC4Hmd
	NSiP/w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9cpmcuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 09 Mar 2026 06:14:14 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2be21c6e2f5so22965088eec.1
        for <imx@lists.linux.dev>; Sun, 08 Mar 2026 23:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773036854; x=1773641654; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6hNZOwQq6HWTjuqn8FSE60/aQbj4nXzSVsV920Knhsw=;
        b=GLAZ3VIXxKfBFfr6A+VZYBXVbzChfmrcp6totsRGLH6o9z+8lwFRJ6ShEuNptbOyoN
         dCU6LcSeHx/W2VM/Ht+LsGtQCYgeydgfLN7heCUxK7ac1F9vez1SBT6M1G/qnwDPHvK5
         AvzOV6U2DTQjcA3CEWZEvdEycL5lxxSecpjAseRA+DKIaAaB8LDQMvEQ28YWqebjpcQq
         L017k4Rg9uryIjkl7wm9qKFVeXp/6odFH3xkbIITqDnJXqmN4e9ArhSXl9jXznioTwXU
         oqHZxtIlZngdS8Iw9wilcFpQZu+vCxbZGJmUnC1GntsKoOXINQK7jZtwFbXMycorXusk
         Po5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773036854; x=1773641654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6hNZOwQq6HWTjuqn8FSE60/aQbj4nXzSVsV920Knhsw=;
        b=dE2ot1I9FkddliKhtJaStxCJPbKKrovrahEeeWLflvcMhYBJ4KeKkLWy284pU9lAaE
         GzKdhpWHrF5LtgdZqWZ/5OU99yMSMPTXef5VvXMR38o5XOP7N1dPXUtL2NtxMsiGGVlC
         hJxsQCfk4G+vAZwEXA0E9sqOevAehM5ATXtNpshHSBg5JVz0OHv7/vSvfNN/rcz0hvCp
         Vr/y5xA3b2T7jjc/xQSPSVLPLmdmJKmGOL892xiZ+vIKxD/jUYtF0Wh23+4wQjjSuqgy
         lJXeKe3qv5pSskcg4Vzyd2RS2b47VXKRHkwJQBKymkreVloGJGofEk072XLL0sjAkTeu
         bOug==
X-Forwarded-Encrypted: i=1; AJvYcCUZ5zjji8ZcoHeaFo2D0rW5V6TMu08QNEnonpwZb0biWqHqgfL4DKf1KuuIJOjjs/vdVF8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwB370zkTxKsRGfwyxEQ535kLQmotD6wD4s1LxTAIEB/U43xnGq
	i2zhmcdvGMx0l2BTsRtKIQrfqv/1FvueZMld2F7PkG1BjwB0MtYXLOH2xxnvF2dbueX2uYM2Vxd
	md9Dj9ovNIHMeKRB29mvhQSNQfMs0QJBJQ/CMHweEsHz09MVZBBkNf48=
X-Gm-Gg: ATEYQzxLHyqOYSC2lgki70DDkQHMf9PcvmxuX30/PQuSwVn5Q7+MikITkrJJO9FEQuj
	tqpthuns3emC09sTeqkReua8LmCjZ4lhlP5ogUlt9OTBp/yRL2i8B0vrkg+GFvORV7RKof98x86
	h3DLjCSXfF+E91nZgytvdmQ+Gc93dJCqbcZif1feY3l4ucclwlnHnzKOKwrC1nDWxumolvWcvrZ
	nItlkem/1SlkHjnXhld+Wur+Bdadul5T8r3zgKWXxge9vBBLlf9dLlQcs49teLU0zKpQYWavbD2
	YOtyaMjMEOKkavcAses6w+5oPeHCtwjhgfRk3pYY0mEm1LnBYIfwMF5zoaYUXLXn3XufaLnyCFx
	8/cQMEieQKFLUQpAK8HKisWjsm4NHbJVTg04XujZ89EpAkS5F+I/y+hQ=
X-Received: by 2002:a05:7300:aca6:b0:2bd:d3f3:b0be with SMTP id 5a478bee46e88-2be4e03ed55mr4097400eec.20.1773036853729;
        Sun, 08 Mar 2026 23:14:13 -0700 (PDT)
X-Received: by 2002:a05:7300:aca6:b0:2bd:d3f3:b0be with SMTP id 5a478bee46e88-2be4e03ed55mr4097377eec.20.1773036853215;
        Sun, 08 Mar 2026 23:14:13 -0700 (PDT)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f807a30sm7572370eec.6.2026.03.08.23.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 23:14:12 -0700 (PDT)
Message-ID: <f801cbc0-880f-4c36-ac71-a102d3a7ad73@oss.qualcomm.com>
Date: Sun, 8 Mar 2026 23:14:10 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v4 3/4] clocksource/drivers/timer-mediatek:
 Convert timer-mediatek to a loadable module
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
        "tglx@kernel.org" <tglx@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
        "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
        "walter.chang@mediatek.com" <walter.chang@mediatek.com>,
        "jstultz@google.com" <jstultz@google.com>,
        "amergnat@baylibre.com" <amergnat@baylibre.com>,
        Aisheng Dong <aisheng.dong@nxp.com>, Jindong Yue <jindong.yue@nxp.com>,
        Xuegang Liu <xuegang.liu@nxp.com>,
        Greg Kroah-Hartman <gregkh@google.com>
References: <20260304081207.4030882-1-zhipeng.wang_1@nxp.com>
 <20260304081207.4030882-4-zhipeng.wang_1@nxp.com>
 <aaiByowtXrTxPsd7@mai.linaro.org>
 <AS8PR04MB84206CF559371D3966653F8EEB7AA@AS8PR04MB8420.eurprd04.prod.outlook.com>
 <6255aa0f-529c-41cb-be32-e5d54a839125@oss.qualcomm.com>
 <AS8PR04MB84209F4103D8D4FD495F5B26EB79A@AS8PR04MB8420.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <AS8PR04MB84209F4103D8D4FD495F5B26EB79A@AS8PR04MB8420.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA1NSBTYWx0ZWRfXyGLPePRfukm6
 +60wOltPqR44WUJTJ0ksgNVF+pPsEDfxRYirYecXRlZGIarLD2KIv7l0SaZDXrgeuQFzeLnqcoU
 jXwa5AV+VrS2iER7xyvHdzxhScngjEwZIOZIkCSg3gvmoYWvnOvEVTok9u9jvmS6IjGGeuXNLpm
 EYvyslYwEkSTqliSTVK5uyweDm3w/PWKvqBm1h5zEzGUsL7pc5QgNp9/OeBXc6Tht+2UO7HkSVl
 X0oXhu6lwBgB5zfmIagTOvcj49jG2GKZc6sPlKYRL1sQRnz33H3+SiHMYGo/2i3mKTCuLVfUPQQ
 E0LdhppSobHMHQhd8oFFldMi8A7eTHjbEY7dBjjXG+9bepBrn1OoPSsHQgR8Opsabgfqu5xKzmS
 9VRIucB4efzN58kNNehr1uKPzYfgi+3VT/q2yLaWN0o64/XygJC4d/oA2cBioNBX27sCU00TrYd
 Y6l5MWCbENWSFydqqHw==
X-Proofpoint-ORIG-GUID: oLT_LzVWezw12A_da5R1A2Tnx34bVJw3
X-Proofpoint-GUID: oLT_LzVWezw12A_da5R1A2Tnx34bVJw3
X-Authority-Analysis: v=2.4 cv=e7sLiKp/ c=1 sm=1 tr=0 ts=69ae6536 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=_EeEMxcBAAAA:8 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QX4gbG5DAAAA:8 a=JfrnYn6hAAAA:8
 a=mpaa-ttXAAAA:8 a=1XWaLZrsAAAA:8 a=IpJZQVW2AAAA:8 a=rNfcLUUj_lrWDsM3rXQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=czjwGCTIUPoA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=ST-jHhOKWsTCqRlWije3:22 a=cvBusfyB2V15izCimMoJ:22
 a=AbAUZ8qAyYyZVLSsDulk:22 a=1CNFftbPRP8L7MoqJWF3:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090055

On 3/8/2026 10:31 PM, Zhipeng Wang wrote:
> Hello Daniel,
> 
> I'd be very happy to collaborate on this!
> 
> My availability: I can dedicate time to work on this over the next few weeks. I'm happy to help with:
>    - Testing the new macros with IMX timer drivers
>    - Converting existing drivers as examples
>    - Reviewing and testing patches
>    - Documentation
> 
> My understanding is that, based on your RFC, we should use two macros — TIMER_OF_DECLARE_PDEV and TIMER_OF_DECLARE_PLATFORM_DRIVER.
> 
> BRs,
> Zhipeng

Please don't top post and something is wrong w/ your email fonts. Please fix. 

>> -----Original Message-----
>> From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> Sent: 2026年3月9日 3:51
>> To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>> Cc: daniel.lezcano@linaro.org; tglx@kernel.org; shawnguo@kernel.org;
>> s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com;
>> matthias.bgg@gmail.com; angelogioacchino.delregno@collabora.com;
>> linux-kernel@vger.kernel.org; imx@lists.linux.dev;
>> linux-arm-kernel@lists.infradead.org; linux-mediatek@lists.infradead.org;
>> chun-hung.wu@mediatek.com; walter.chang@mediatek.com;
>> jstultz@google.com; amergnat@baylibre.com; Aisheng Dong
>> <aisheng.dong@nxp.com>; Jindong Yue <jindong.yue@nxp.com>; Xuegang Liu
>> <xuegang.liu@nxp.com>; Greg Kroah-Hartman <gregkh@google.com>
>> Subject: Re: [EXT] Re: [PATCH v4 3/4] clocksource/drivers/timer-mediatek:
>> Convert timer-mediatek to a loadable module
>>
>> [You don't often get email from daniel.lezcano@oss.qualcomm.com. Learn
>> why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Caution: This is an external email. Please take care when clicking links or
>> opening attachments. When in doubt, report the message using the 'Report
>> this email' button
>>
>>
>> On 3/6/26 06:46, Zhipeng Wang wrote:
>>> Hi Daniel,
>>>
>>> Thank you for sharing your RFC patch. I think the approach is very
>>> interesting and addresses a real problem in the timer subsystem.
>>>
>>> For the MediaTek and IMX timer driver, I see a few considerations:
>>>
>>> 1. Current approach: My current patch uses the existing pattern
>>>     (similar to renesas-ostm.c) with #ifdef MODULE. It's simple and
>>>     works, but I agree it's not ideal.
>>> 2. Your approach: Your TIMER_OF_DECLARE_PDEV approach would be
>>>     cleaner and allow us to use devm_ functions, which would be a
>>>     nice improvement.
>>> 3. MediaTek and IMX timer specifics: The IMX timer doesn't require
>>>     early initialization on modern platforms (we have arch timers on
>>>     ARM64), so it would fit well with your
>> TIMER_OF_DECLARE_PLATFORM_DRIVER
>>>     macro (if you go with the two-macro approach).
>>>
>>> I'm very interested in your approach. May I ask what timeline you're
>>> considering for your patch series?
>>> The reason I ask is that we're working towards GKI support and I want
>>> to make sure I choose the right approach.
>>
>> Well, if you are willing to collaborate, we can start right now to think about it
>> and propose an unified solution
>>
>>
>>
>>
>>
> 

