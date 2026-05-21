Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159FF3B27D0
	for <imx@lists.linux.dev>; Thu, 21 May 2026 11:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779362084; cv=none; b=e7ccOZByA1uTVLaWqupssy9zoT2zdesanPRhFSZOgvGWiscLfFxqBtFwUPU+W08vXa9I/SFFsGxmEhV9ywUDwv5Q3DrblROpLml0iV4h0VhPNWiGfuaCamIgaKJIsfL/gFaOqj9YAV7qjHTW+V7VG+ri0jP7OcGzYsRjpcxJtX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779362084; c=relaxed/simple;
	bh=C1+cFaPFiKE4mgAzSG1N6mY7diKK/o7fD03Nl3zE8aE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gd/CnLnaGRLXbPICeLHS0Ra5aD5vd+eGPlEMTvvCvE3IZefhv16UCohdaPabjUMW1JQUeItuJEsGTn3G3Lfca2lJZahhj8jYrL7MSN9ttNozxU67mAASxXwNgMmQYgNOQ5ObrHO3l/bVqvhxOrPSM9HQcdyfBCE1TYUYlu2s+yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hTwfCwhl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qo1avVnF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hTwfCwhl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qo1avVnF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99xwu517985
	for <imx@lists.linux.dev>; Thu, 21 May 2026 11:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tgpvgnbwwr5UBe0lC1Mf4Vi2XM398nJ8kTHxTpFW4hU=; b=hTwfCwhl2SgL0Wi+
	/3yR49gIx/qT/qSo6EoxcIIlIv57BYlUishzWRZF2eeSUFTQ9ednQUI2SNub7Rip
	T8y3d+dzx811r0WU9fctsd+AMTU6lzMGur06QgZqwn9tqzM5iyx5FqAdg0nsSZSP
	MhCdyhaFj70KCut7YTkKuPahd09yU2wfkVBOhvyu6bqRja7ONA+/xoNqjFOSEtfJ
	K4ouj469BhQnYqSu2rmV298PfAp1TjXDDgrCvGvDQKq0V0NspZk0NE9hHm/tXDUh
	xSRLSb4NyGz6lwHIruHnMlxeHLptvtK3vsC3JUuUJl9uGvlqRQmCbVet4hTmMUD3
	FvhBPA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa1xky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 21 May 2026 11:14:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3662668b825so12015874a91.3
        for <imx@lists.linux.dev>; Thu, 21 May 2026 04:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779362082; x=1779966882; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tgpvgnbwwr5UBe0lC1Mf4Vi2XM398nJ8kTHxTpFW4hU=;
        b=Qo1avVnFYc/peFEJzyNeeNpAXATjSToP6j4hXKRnUQ8jpZtII2oNzpDMzm4X7zcZNP
         nVHJ0bmmmUsduYt6YHSJwckwrairCuxzsvT61dzEUB04+BZHCDohV1AusT5LQurK+1zW
         HDmCsJ5PJ0qbzLAR29+sHxI7qZ8qvUgUC+3ZTgN/vPrm9RqSAIddotIMsMhZEWXcl4Ka
         wYDc15JJQbpWv8YIiX8PCItfqVoe0DdAjFAGElhEIJz0EWZEqg5KFN1zFA1nt1F6t/VF
         fx9P8duCu8gOy+6uUgkZre6MKIxeJh90amQ0PF3FT16cVpahu2uaGq4xiYpo6fmDzTlf
         qtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779362082; x=1779966882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tgpvgnbwwr5UBe0lC1Mf4Vi2XM398nJ8kTHxTpFW4hU=;
        b=rkrznIwG4sDUO8QJz7la3iICHgXPiiHunQlZ+rtiqh3Yw8taztNg4LTTkTTE59Mwat
         DWWznOpY8be+YuBAe4YZP6W+3DKTXEAjK+DiTEyVrVoIN+/ngiXEdOfuntR+YjB2Iugq
         xK/AZsXnoG+PYlvJ+5Y4hnuhtSzX0Nl/s1w/V001urj4NeWlnuVbCIPLp1YJRJITE2aK
         LrKKop2819efFuYnA/OqtoiBNoZ13AW9lcAzQyjzal0LGgWtbpbBVZrSnkPWXZVR1LzL
         +0E8s/bOycDrU/osrTg96EonSca0my8Xtda61NrJ2CAYNo5h5HnijsLOCfrxU0J5j2Ti
         5kmQ==
X-Forwarded-Encrypted: i=1; AFNElJ/VlV1UP34/5+AeTUPqOyQt9ihiEbzddZvFqsvRw1X9o5LzaTzGxXOYzLK6rxb1mFVV6vQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy49NWDci7n9WyTWIo4Ax8ZQi76QPqGTpTIMy70pa1oobuLlGPO
	gjISQQT8J72de6QX/Y6UBVcDxsZ4hWQn7Blb4huNXKO2lfhwLfdTUBweiopFoYwF6fwSA09ff3A
	Wu1xoSegxJttPQMTg5SjAovsGe9N+qatcOWuVvJAc+FRpKniCTXXntfA=
X-Gm-Gg: Acq92OFkKu/eRaHB19TyDKE48Bs+J023BHrGL8dxZHoQb5UCAAvvT2GXdLCD8D7MCzg
	npPPWoh9oHKW2bKRgOMeLwY9vOwA+Xldu+fY6d0a7MZ5YPGi3vdIxEowKzH6SvOuf9ud+LQK6zv
	B3rDAZYLZ+8JGQjnih4dCbIVzTy0lkNe8aTELWE+gdqCsg9PhtypDjA6mXWVT8Tvc/Yp5JXW0fI
	+PrIPkSACt1UusAmJBLJXyzXu+DM5QgDQnIMCPaTcZL43eUPfcc+9XtNizjUV8r1tTriHivC4xN
	aQ73Sif0Qs5CBsedVOTcyv8m7CHgNZy+nEC9HZI0VHTmQ1SHAS2mfj/NnjyI1pzhV2hwweLTaHw
	slWeFyn3UWdFGqycXMohfDiNmbcZnBiTJhWFRxWCjB9XV9msBbc/5B5pV
X-Received: by 2002:a17:90b:514b:b0:369:d22:4788 with SMTP id 98e67ed59e1d1-36a4575d7bemr2644420a91.25.1779362081603;
        Thu, 21 May 2026 04:14:41 -0700 (PDT)
X-Received: by 2002:a17:90b:514b:b0:369:d22:4788 with SMTP id 98e67ed59e1d1-36a4575d7bemr2644391a91.25.1779362081192;
        Thu, 21 May 2026 04:14:41 -0700 (PDT)
Received: from [10.217.219.207] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a5ae97051sm536922a91.0.2026.05.21.04.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 04:14:40 -0700 (PDT)
Message-ID: <ab96c900-9c77-455a-88f1-b6d8d8e4ff78@oss.qualcomm.com>
Date: Thu, 21 May 2026 16:44:27 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] i2c: imx: mark I2C adapter when hardware is powered
 down
To: "Carlos Song (OSS)" <carlos.song@oss.nxp.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
        Frank Li
 <frank.li@nxp.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        Carlos Song
 <carlos.song@nxp.com>, Bough Chen <haibo.chen@nxp.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20260520101504.2885873-1-carlos.song@oss.nxp.com>
 <4979e748-ce4e-4244-8906-e22a1e6472e7@oss.qualcomm.com>
 <AM0PR04MB68027798D1B07FD63AEC5F23E80E2@AM0PR04MB6802.eurprd04.prod.outlook.com>
 <22af0378-a3c9-4403-a0ee-da794847f41d@oss.qualcomm.com>
 <AM0PR04MB6802FE8B0E0BEF8CDA6DAD5EE80E2@AM0PR04MB6802.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <AM0PR04MB6802FE8B0E0BEF8CDA6DAD5EE80E2@AM0PR04MB6802.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDExMiBTYWx0ZWRfXwWafSAVAXqtp
 +OoJvuARpBpl3R1cyykEsb0aJ18m7xc9KCDyzzXjl162Fd4ppEw9j/g7Y4QLLoEobSLpbRjeTk+
 9+PCuguoYLFWsmqAEfph/ttqHRgMIBuurfOkPw8ni0aGO0vghWjsSzIOfOLw2g7Yu/diIfbHOcO
 L0EWwa7A8IW/YabvkQ/LQ0RVCsW0klWYyuSeHt4BtYERPac335h0pSRUq55maarh4iy1JmsfSCy
 iEA6mJkps4dAQ6kD7HKUyW6vgK5AtdinwKh/dPNeCVvdafvuzhG7Fku6GauOqac1xG36PKyr7lZ
 ofhZe+LWK/P+TMUikUvgU8b7gwQvZixUeQvwH7zksCFY5I+B79istVf2zv0TTTk6YWf7xt3ehqx
 CXGgCPRsbbnjxEufLNhhN8HrDm0wIIOdxbOkVVVN8SHbHaDsE94HlFfFwV8lyN5SGJeD8NPFSqM
 8RpuzeukHru6+9+kn4A==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0ee922 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=JfrnYn6hAAAA:8 a=5_mVXZLGvQfHWcJsArQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=ST-jHhOKWsTCqRlWije3:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: 57NhfdORm1UK-I32jGwUEjldURI_qxWO
X-Proofpoint-GUID: 57NhfdORm1UK-I32jGwUEjldURI_qxWO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210112


On 5/21/2026 4:21 PM, Carlos Song (OSS) wrote:

[...]

>>>> -----Original Message-----
>>>> From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
>>>> Sent: Thursday, May 21, 2026 3:40 PM
>>>> To: Carlos Song (OSS) <carlos.song@oss.nxp.com>;
>>>> o.rempel@pengutronix.de; kernel@pengutronix.de;
>>>> andi.shyti@kernel.org; Frank Li <frank.li@nxp.com>;
>>>> s.hauer@pengutronix.de; festevam@gmail.com; Carlos Song
>>>> <carlos.song@nxp.com>; Bough Chen <haibo.chen@nxp.com>
>>>> Cc: linux-i2c@vger.kernel.org; imx@lists.linux.dev;
>>>> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
>>>> stable@vger.kernel.org
>>>> Subject: Re: [PATCH v3] i2c: imx: mark I2C adapter when hardware is
>>>> powered down
>>>>
>>>> Hi Carlos,
>>>>
>>>> On 5/20/2026 3:45 PM, Carlos Song (OSS) wrote:
>>>>> From: Carlos Song <carlos.song@nxp.com>
>>>>>
>>>>> Mark the I2C adapter as suspended during system suspend to block
>>>>> further transfers, and resume it on system resume. This prevents
>>>>> potential hangs when the hardware is powered down but clients still
>>>>> attempt
>>>> I2C transfers.
>>>>>
>> what was the reason of this hang ? I was thinking you don't have interrupts
>> working when client requested transfer but adapter was suspended. Please
>> correct me if wrong.
>>
>> And it would be good to mention the actual problem and why/how it occurred.
>>>> Code changes looks fine to me but have comment on commit log.
>>>>
>>>> It seems, you are adding support of _noirq() callbacks to allow
>>>> transfers during suspend/resume noirq phase of PM.
>>>>
>>>> Would it make sense if you can write "Replace system PM callbacks
>>>> with noirq PM callbacks" OR "Allow transfers during _noirq phase of
>>>> the PM ops" instead of "mark I2C adapter when hardware is powered
>> down" ?
>>>>
>>>
>>> Hi,
>>>
>>> Thank you for your comments!
>>>
>>> But this patch is added is not for support noirq PM callback or transfer in noirq
>> phase.
>>>
>> Okay, may be actual problem description can help me.
>>> In fact, this fix is to mark the I2C adapter as suspended during
>>> system noirq suspend to block further transfers, and resume it on
>>> system noirq resume. This is to prohibit I2C device calling the I2C
>>> controller after the system noirq suspend and before noirq resume, because at
>> this time the I2C instance is powered off or the clock is disabled ... So I want to
>> keep current commit. How do you think?
>> completely Makes sense. Please help add how this problem occurred and why ?
>> So the change/fix will be good to understand against it.
> 
> Hi,
> 
> In some I.MX platform, some I2C devices will keep a work queue all time, the work queue will
> trigger I2C xfer every once in a while, but the work queue shouldn't be free in system suspend.
> 

work queue has transfers queued even if system is suspended ? IMO, the 
client i2c devices should not let system go to suspend.

> Within a very short time window, possibly from noirq_suspend to the system actually being suspended,
> or possibly from the system starting to resume to before noirq_resume, this work queue will trigger an
> I2C transfer, and at this time the I2C controller's clk and pinctrl have not yet been restored, reading and

Right, this kind of explains the problem to me. I think you are trying 
to serve i2c transfers when your resources(clk, pinctrl) are not turned 
ON and also interrupt remains disabled. And that's why you need to add 
_noir() PM callbacks supports along with IRQF_NO_SUSPEND | 
IRQF_EARLY_RESUME flags.

> writing I2C registers causes the system to hang. This patch make all I2C operations are performed in a safe
> hardware state.
> 
> Is it better if I add these comment to patch commit log?
>>>
if my latest comments makes sense against the issue, you may write 
accordingly. if i am wrong, then your explanation makes sense. Cause of 
the hang needs to be clearly mention int the commit log in your next patch.

>>> Carlos Song
>>
> 

