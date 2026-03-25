Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532B33E3D93
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 14:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774449783; cv=none; b=pekoFmHQ2hoSuXSRwv1+RP+ORE3gYG0/k1IUaJSZWF8ZjZHTNoP3+MAQ+cwDZEsl3xjvsLNhbX9p0mzgqH267GP69Cvd3gNV81LwalY6D1baDRccsNR+hK92c61OxCjxppEVJZFkivPjwqtq1pc9UBmXzhCB8LshbJKqDrtRe5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774449783; c=relaxed/simple;
	bh=PO6T0qi91hB7YX3hTkv4I4vRIbfh3ABFhwMLy1i/fjg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DBXQlOlJ0LxoDWqI6STdNBrKQjxCmjcRTMFvCDphRsxNqHj5x8onI65naMXTADAFMmqMUxHwuxbR1POiWQEIFUO/LXylxoi8OEuZtj2/2QUYcpVGEekpqXz5+zBJTdJz2VHq/Wlvv6Zd1RXTNa3sgOt1R6mfteaRAx190oPnh7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSPYceDk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hJcI4XZ/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSPYceDk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hJcI4XZ/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBG21s3090924
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 14:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6CO42NrH0o8ZBBIP0NTPmzhTbucDiEvU/OBKheKuW6g=; b=ZSPYceDku93G02pJ
	38QmIYgjKMgLaWUr3wX6Mz9p/n5QhC0PobotkuTYjzgXZYk8QzhPmHE2YxmTsVcb
	E6yAw+qWfP5JtYXEQMV2qB5xzpJ6W9fU/Pt4vHK4u19gpdBBfUjzICi1DGpKJ3R1
	blBWd9FElOnkYA38TLgS3HzW95BEc5wOEexbfLpoLkvJJq+4iFRQpalWeGOwc0Og
	yeq1xJQ5IttxY5cfcRyoLeneokkAexuWxpttfQKbQ7js04S1m8u2GNcwMt9ThWiL
	NLaTCaVOnMMTdv+krTySvxWQq/sGGe4YNuV6q9Cehh2zEHz+dlMSE/9s+GWA6Qzn
	94HnJg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dmps05y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 14:43:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so106003281cf.3
        for <imx@lists.linux.dev>; Wed, 25 Mar 2026 07:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774449780; x=1775054580; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6CO42NrH0o8ZBBIP0NTPmzhTbucDiEvU/OBKheKuW6g=;
        b=hJcI4XZ/epW2xw9v1rnRgyH925zwLZ6DiZeABawx/ZJ8UX3FK3bvIkCy5jAA5XqbxC
         avdun2bpQo7D56TRy7kC5rU9kaW1keRyzA9FchVRhpbyYnCY5hIGcf5oSq6xyy6IH2Z8
         MeteJuQA3vDhqychKlPcvmvI4bruuRdc9Jho2ZsWXygROJwQIKivfPZyMhePg8HzEYHL
         4QEA6oqY4fLmpVftoUI8HuNzPj6WP8f5d37l0aR5UW0hq8L/8XfmBV5poy6DcEvIwRAj
         DRJpI/gGDPoEuLe74nwTRs4kJID2zrmq0/CDU1Uj8CuQUhOSxzTrNpaIC2LGe2gLPCVt
         nmog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774449780; x=1775054580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CO42NrH0o8ZBBIP0NTPmzhTbucDiEvU/OBKheKuW6g=;
        b=Q/w7M7EF8+MwfYE+5cPkZs46ri1iIIazLKJOTMbJeLiBYnxXfZBr0JlSSaVYtg6VLU
         Z31+H6lgQ4f0tP7dMr8i+rYxbV0z3gurGxP3sNGfBteE95Q2dposTDokmQtd1XoQk3I+
         gNOzHU2chzp3sjWYpbkiRPaNcSwBpLnncDmZDt7jhmXgQetKdBG5GNxyZSmcL8+fnyU3
         YsXhsMBqx6XysmUXgHOF/EG0vIwJs2uRUZ77jPOCwJRWDbIc7cfLB5wd7mERR9e1MTYf
         3LTu0A3e0hl+GFWbCHkv5WPqA+UbwFHQUqLHUhNVzJyYYJqwd9RBM3Xg2U0NFKQyZnUX
         J/iw==
X-Forwarded-Encrypted: i=1; AJvYcCVUtnjtSCcHaIBD4rr2BW+4FUWl7zHOO4plkZYRkrB+pfs1L6xOhNl2P1au2R/ajF20TVs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6YObcqneGckaVz/db8mN1W7psQZzaVIRZoqJuvQJTXpmjSpIW
	3oDtlaaVmQJdvB5XEHvuBrZmE3cmy1jQd7iTrT5rasa7/EUx9rSVICJoZvCIzQTaNj/B8fuSK3+
	S5qt7Y8FuBSGQhNi6VeNJJBZH/Hh5R2O0G8MqwAv8PLnHFxDqm+q4vmA=
X-Gm-Gg: ATEYQzyPlAjZeaSlVK9E1llNILsAG4fMmZOXyIUuNTPyGaP1veLW5G8R+/jQ0f2X+6C
	Y3aUlQi5C4dfSZFkd477jJD47i/lqFeahIOFfDbTbw3rm6wsnfqwib4EEJANA2/GqGwDj4hRa9S
	bymfJcObfuLvNBgfTuyfFQfmM1ZTFv7sVy6seKFr1GfUBxlhUOZ/92BgmioRLi8pMOCt2rJeuRZ
	f1fCZ4+a0344U0djvRSAbvkmhCGCeqj+xJHljhPigBQnYHCmbvM86U2tX0uhnrSrciDFz3kVKLc
	NpaWe/cfHEqTXcy64QuZzGCuGo+Mru/8VcC1Tax70Tt06JT0pU9Fg1I+GPbvHGYqL6xttNyJaKB
	LxPCYHNBVCJSrqcWfnZqjHfohdX/WFujwgQb7LfU3TUCrIX4o9hAVOHkHZZ2Gp3Shp+HN3QELQn
	9InYdQM3H+
X-Received: by 2002:a05:622a:1ba3:b0:50b:8c01:2100 with SMTP id d75a77b69052e-50b8c0126e5mr20402331cf.62.1774449780375;
        Wed, 25 Mar 2026 07:43:00 -0700 (PDT)
X-Received: by 2002:a05:622a:1ba3:b0:50b:8c01:2100 with SMTP id d75a77b69052e-50b8c0126e5mr20401581cf.62.1774449779680;
        Wed, 25 Mar 2026 07:42:59 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:a7db:2283:19fe:fa8a? ([2a05:6e02:1041:c10:a7db:2283:19fe:fa8a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116ee514sm163278995e9.13.2026.03.25.07.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 07:42:58 -0700 (PDT)
Message-ID: <28a09389-9fdf-49d8-84a6-4e68c40b5224@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 15:42:57 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v4 3/4] clocksource/drivers/timer-mediatek:
 Convert timer-mediatek to a loadable module
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
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
 <019942a0-e9f2-45f1-8e04-26ecc9822705@oss.qualcomm.com>
 <AS8PR04MB84206959C00CFDC4C85B8BC2EB46A@AS8PR04MB8420.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <AS8PR04MB84206959C00CFDC4C85B8BC2EB46A@AS8PR04MB8420.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEwNSBTYWx0ZWRfX0JqgLA2MjCaG
 beT1yCv39VLWbfsqAPMbj4A9mAsTppZc1ZIIXiaSzacQs1mde3A0QcP1ToQU+Z8t/L0V8QcisJy
 LFRCzqRasV+FjnpTH64nfuhFHXCzc0g9T+bbg0UxM7psACerdzQ5zfo/gsHwyu+8pG8kwN0+gtt
 YFmOaCCzYibFiFsEpUZcYRam5UwYAjZ7S7AteCtyC0AY34hdrdKqrTbw3z+v/woFA2NlnYNLJSz
 qA5hVQFLbx1yo+XTrLcKraf5faVsd1gejE+ZWetSAnQyXWtdWGA0ib6QTk6GU/EzTEuTe6NN5j4
 CtvbgWfXpuM5sCr8L+EPtg+3FyYCDnKFoQtiSad3P7h5x5LZly0fK+1yUg2WRevL2HUsTaomnl7
 EDeKrHqALRr7Yy5OV1qgKSBlwO7kqzIZnJ29GLcq+sDqJuQUcms/2CqcMmKmJuo8D0dqu/ou713
 60L1SIIjl6MVoJXzu1Q==
X-Proofpoint-GUID: 3qJwgwUBP4-_JR5mQkdnoJrNTQmiKnWB
X-Proofpoint-ORIG-GUID: 3qJwgwUBP4-_JR5mQkdnoJrNTQmiKnWB
X-Authority-Analysis: v=2.4 cv=O7w0fR9W c=1 sm=1 tr=0 ts=69c3f475 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=Zs_j8f1EyT6rY914oN0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250105


Hi Zhipeng,

On 3/10/26 09:41, Zhipeng Wang wrote:
>>
>>
>> Hi Zhipeng,
>>
>> On 3/9/26 06:31, Zhipeng Wang wrote:
>>> Hello Daniel,
>>>
>>> I'd be very happy to collaborate on this!
>>
>> Great, let me see if I can cook a patch in the next days
>>
>>> My availability: I can dedicate time to work on this over the next few weeks.
>> I'm happy to help with:
>>>      - Testing the new macros with IMX timer drivers
>>>      - Converting existing drivers as examples
>>>      - Reviewing and testing patches
>>>      - Documentation
>>
>> That's awesome, thanks
>>
>>> My understanding is that, based on your RFC, we should use two macros —
>> TIMER_OF_DECLARE_PDEV and TIMER_OF_DECLARE_PLATFORM_DRIVER.
>>
>> Yes, but also sort out the existing TIMER_OF_DECLARE macro vs MODULE in
>> order to prevent #ifdef MODULE in the drivers
>>
> Hi Daniel,
> 
> Yes, that's our goal.
> 
> I'll test the new macros (TIMER_OF_DECLARE_PLATFORM_DRIVER and
> TIMER_OF_DECLARE_EARLY_PLATFORM_DRIVER) with the IMX timer drivers
> once the patches are available.

I think I have an idea on how to achieve that. That will result in the 
removal of TIMER_OF_DECLARE() when all drivers will be changed to use 
the new macro.

The #ifdef MODULE macro is set when the driver is compiled as a module.

So we can do something like:

#ifdef MODULE

#define TIMER_OF_DECLARE_PDEV(name, compat, data, fn) \
         OF_DECLARE_1_RET(timer_pdev, name, compat, data, fn)


#else

#define TIMER_OF_DECLARE_PDEV(__name, compat, data, fn) \
         OF_DECLARE_1_RET(of_pdev_timer_match_table,
			__name, compat, data, fn)

static struct platform_driver __##__name##_timer_driver = {
         .probe = __##__name##_timer_probe,
         .driver = {
                 .name = name,
                 .of_match_table = of_pdev_timer_match_table,
         },
};
module_platform_driver(__##__name##_timer_driver);

#endif

So we deal with two tables, one for platform device non module and one 
module for modules.

The first one is called by the timer-of init routine. The other one is 
called by the probe function.

The drawback will be the match table will be common to all timer 
drivers. So probe will be a bit slower. May be there is an area of 
optimization here.

