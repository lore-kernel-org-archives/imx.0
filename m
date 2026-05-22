Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE72385D6F
	for <imx@lists.linux.dev>; Fri, 22 May 2026 07:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779434424; cv=none; b=Z1NiCANahAWhbS0RyHBVVCZJ28tjU9FLHqAvTTHKkLxwlKeUsUF+e44jtT2mpSqb65Y/4ny7d0R6ceMtbq4xvTSDh4DI2FUvZHSwiWZLPVfDMaJQmwEXyHvbKepbTJGBkDs6SSo+7OtNVnFW3eNPNZBApZKiw0VjyIjwS8pQgnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779434424; c=relaxed/simple;
	bh=/tvkinZc6kam6AsYNY4KzQ46LaHAeu6Sx70rjikUnw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ruF+Vo3XreAPFgccBV5Vo+Yud/w8rJoxrWIPPMHUj3nhGrBSu0ICBOw0c2nyeeNcxfwiggX7/rFcn4zuV/LBDLM7RHThhT5bTKh/Dho636bNc6+Y6MExFbq6cBp+CzPh+UsYneCmbw7tu9bictAVZg/3pS+YiGVX+RxdcdFs8pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fj1Gj80Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SUL1st4Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fj1Gj80Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SUL1st4Y"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M41lB93005097
	for <imx@lists.linux.dev>; Fri, 22 May 2026 07:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DeKU9U0zySWMyeUkl9tHBC4BKI1WPZa36dC/DO/ULkE=; b=fj1Gj80Zd3Xzg5Hy
	6VXT9nMwdgI19YGqTzLas9P9tZk1JGBbxWrNJ/3HIfD/2girwPx9+K9lQAT3ZxAT
	+1TELcUT7UuI1pxxwiut3okMvTCTN+Vtcgk1g8iokVtcEw02lB6ETE1Y9SUr6y6K
	Bc8FrTeczZQdIv1duxQO+W4+m/hKVlEbIHJnn6jHzP5BiOo6rIzbCwFW7CQi81P6
	+UP08ZawsbgiOPTQJF2EbBzkUeGQkwvOsyyQ5wrExDDiYcNguf4vpLFacCN7hqxl
	TcNz+vpsqDAPR8CJlLmQdUqChISoXFKKJM9EHViTgQfYSdInlh7pF1LvmNUxaOJJ
	ytDjdw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrt8kxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 22 May 2026 07:20:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8510f91ce8so1150695a12.2
        for <imx@lists.linux.dev>; Fri, 22 May 2026 00:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779434421; x=1780039221; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DeKU9U0zySWMyeUkl9tHBC4BKI1WPZa36dC/DO/ULkE=;
        b=SUL1st4YCTX7j3daoHXHmqFrg4lcGuoDO6uS4W2XjGidJkrMRg7DoedItzxNLoF7qX
         u3SHPy5h2VI3UlhgMhaaInM/tdVBgXaoI1wTIyMHxnUm89vL0G39yxD9vblcrtnIPUdf
         t1ijI3jPz+PvzLAhEdEQk7wADyby+rZjf05jtAjcWq2NGdRPrVhf9NC6e92f71NwyP2X
         K1dhgo9fs9JN/gs9NLtDenVSYMQ68bD2/uaILuNTv4WcxZVUuCE9O45eg/3bXowLnIDV
         mO+FttkJGibCHvue8NYWCEa5GDUH4NmCEjJpNr0DtiTc/xUVP3z1PvZHZtL2CvYhcx6m
         hACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779434421; x=1780039221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DeKU9U0zySWMyeUkl9tHBC4BKI1WPZa36dC/DO/ULkE=;
        b=fpD/U3iuXXik+G0ol6bRAN2GP/xhA+HXIBRNj6o8quCwBVh4zi+nw+5RHJkMy0g70N
         GgZPRAlKGlI/l0eCoxzcqqnAgyvfO664YReZfG//CBwOQFgvvNJFCIvFHVUEY5YPdX3E
         GAWCPNbfA8h5XC/7Oe7j+cfBNUxDlS3UwXb1vOJwQ58ngu/lZjPy2pN7zkmAgJTWSCbg
         r8g1T7YRHHTHxntmYV8P4TT2fXHSkikn6VEC/Bes0jOAQWuksz1qWBF0ThDI+8OHeyEn
         dJHy6L9qEb+XFNPqw0AHilqd0xbeGcYZlBoY3umekpz3moFZo3VkOlxu398PB6+KZHkI
         RgZw==
X-Forwarded-Encrypted: i=1; AFNElJ961NzC5xdEPTIevHlen5OSQiezMNnVgV43VAj23ex1oXx39i1E/+6i6adteuY3VSZcPlg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJaCcoUti6uwI7PE5pJMwlTTDn9sN771KKYqEm6XWCJFX1BxTs
	ojSSlKk4s0tSRHqeHiJHJGHvk1swXHKOJbI2d8rzH62YE5pOKpoGbK3iz/r5qd9OK9QjJEyfTqS
	WY8t1mwBmNQnbEhiBqwtoq7sqVNI0zRhLEplPrjrkgPBLV+m7k/TNxCM=
X-Gm-Gg: Acq92OEdTq4szQoWssO9636mrNoGMbuJI+WT71X+KAiacWeT4J/Z8wa8jyqzgkSFLfu
	OGX8v/3a/S9/Lxg0i93i75qsav99fE4QoeyiMgiMQnqaGGX4pQc7LxFE7MdZiJiIgMgltY2ljkk
	EJ3GVvNsqnI8VBOEggB2BcsEaTp7UuJNW64Omn0pRg97Ot1baCNaWTlrYo5w/W670ukKSoTlKxB
	nJPk/0hP9hJb+MLzbGly9ECeYhONYzHc0s298ygpW+ls8MlbOGDRawgtX+DMDYONPGiyByfza90
	abOJFcgo3j7ZLcC/NQh1VqpZU4skwmGxoFMLLs7kSRAKWweKm4ZIjHck2RNy/hVfEEoFBcYxxKh
	kP1vKa5sLt5XmH1DcSiPKQpPotaROHXnZVHp8STGBLuRzeQ8jtM+ur/rT
X-Received: by 2002:a05:6a21:4d8d:b0:3a2:d68d:9e83 with SMTP id adf61e73a8af0-3b328c0f502mr2643986637.5.1779434420633;
        Fri, 22 May 2026 00:20:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:4d8d:b0:3a2:d68d:9e83 with SMTP id adf61e73a8af0-3b328c0f502mr2643961637.5.1779434420115;
        Fri, 22 May 2026 00:20:20 -0700 (PDT)
Received: from [10.217.219.207] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85205616bdsm707529a12.23.2026.05.22.00.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 00:20:19 -0700 (PDT)
Message-ID: <a0941899-bf27-4551-b23d-37d7f99a3519@oss.qualcomm.com>
Date: Fri, 22 May 2026 12:50:14 +0530
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
 <ab96c900-9c77-455a-88f1-b6d8d8e4ff78@oss.qualcomm.com>
 <AM0PR04MB68024A0FAF0637726C08B87BE80E2@AM0PR04MB6802.eurprd04.prod.outlook.com>
 <315029cc-f04c-4dad-a746-f5d3e7245cdc@oss.qualcomm.com>
 <AM0PR04MB68026A6412B8F844D1324B92E80E2@AM0PR04MB6802.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <AM0PR04MB68026A6412B8F844D1324B92E80E2@AM0PR04MB6802.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a1003b5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=JfrnYn6hAAAA:8 a=2UpP72-WgONIwjLJxC0A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=ST-jHhOKWsTCqRlWije3:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA3MSBTYWx0ZWRfXwqcDzswrkG61
 PHUsw0VI+4jqWIdn/SM3dIXkB3EjIb991h3tvNOmLVn2oSehIuk8X8/yVAOUm+2GuRprIS98ctJ
 Fm33GXdW1FfJyKVe1mV9nB7UJiLqdjDSN3cA0mSPiXrd+WMN+3eQw7vm9YHIV9R6sjd2P2lsw1u
 oblkA5AGx0WSHzIjnjf7fX8CefJZSezHKFelfXiY/vgI9oJ8bu0f158f3oYDC16YVBMEPl3KVc8
 rCWPcm/FbfUho7W9xfUL2Rju3LW7EnkvsPIFRPN+YKrbnFzA+mUtmxkdjqe+Kn6ecnHkfXDpljg
 /xq/uK/MW9eK5KvcoSrpBdqWVKQ02FWKfaa0aJvHzc+Ai3dSsIbrq0WSm1ZmGVgI4yrsFRx9xMi
 A7jvQB4tAsjRxnFQ0wTloS/tesg6vn5la+QcZ/cZl/GB77ya4TkF7OpDoV74lpKvJsDfndK6KoM
 DwPgb9Frx9U5o/fvhsA==
X-Proofpoint-GUID: OsyWr6vR8bdYT714B4Xq6r3gWqgbj-oK
X-Proofpoint-ORIG-GUID: OsyWr6vR8bdYT714B4Xq6r3gWqgbj-oK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220071

Thanks Carlos !

On 5/21/2026 8:19 PM, Carlos Song (OSS) wrote:
> 
> 
>> -----Original Message-----
>> From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
>> Sent: Thursday, May 21, 2026 8:40 PM
>> To: Carlos Song (OSS) <carlos.song@oss.nxp.com>; Mukesh Savaliya
>> <mukesh.savaliya@oss.qualcomm.com>; o.rempel@pengutronix.de;
>> kernel@pengutronix.de; andi.shyti@kernel.org; Frank Li <frank.li@nxp.com>;
>> s.hauer@pengutronix.de; festevam@gmail.com; Carlos Song
>> <carlos.song@nxp.com>; Bough Chen <haibo.chen@nxp.com>
>> Cc: linux-i2c@vger.kernel.org; imx@lists.linux.dev;
>> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
>> stable@vger.kernel.org
>> Subject: Re: [PATCH v3] i2c: imx: mark I2C adapter when hardware is powered
>> down
>>
>>
>>
>> On 5/21/2026 5:32 PM, Carlos Song (OSS) wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
>>>> Sent: Thursday, May 21, 2026 7:14 PM
>>>> To: Carlos Song (OSS) <carlos.song@oss.nxp.com>; Mukesh Savaliya
>>>> <mukesh.savaliya@oss.qualcomm.com>; o.rempel@pengutronix.de;
>>>> kernel@pengutronix.de; andi.shyti@kernel.org; Frank Li
>>>> <frank.li@nxp.com>; s.hauer@pengutronix.de; festevam@gmail.com;
>>>> Carlos Song <carlos.song@nxp.com>; Bough Chen <haibo.chen@nxp.com>
>>>> Cc: linux-i2c@vger.kernel.org; imx@lists.linux.dev;
>>>> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
>>>> stable@vger.kernel.org
>>>> Subject: Re: [PATCH v3] i2c: imx: mark I2C adapter when hardware is
>>>> powered down
>>>>
>>>>
>>>> On 5/21/2026 4:21 PM, Carlos Song (OSS) wrote:
>>>>
>>>> [...]
>>>>
>>>>>>>> -----Original Message-----
>>>>>>>> From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
>>>>>>>> Sent: Thursday, May 21, 2026 3:40 PM
>>>>>>>> To: Carlos Song (OSS) <carlos.song@oss.nxp.com>;
>>>>>>>> o.rempel@pengutronix.de; kernel@pengutronix.de;
>>>>>>>> andi.shyti@kernel.org; Frank Li <frank.li@nxp.com>;
>>>>>>>> s.hauer@pengutronix.de; festevam@gmail.com; Carlos Song
>>>>>>>> <carlos.song@nxp.com>; Bough Chen <haibo.chen@nxp.com>
>>>>>>>> Cc: linux-i2c@vger.kernel.org; imx@lists.linux.dev;
>>>>>>>> linux-arm-kernel@lists.infradead.org;
>>>>>>>> linux-kernel@vger.kernel.org; stable@vger.kernel.org
>>>>>>>> Subject: Re: [PATCH v3] i2c: imx: mark I2C adapter when hardware
>>>>>>>> is powered down
>>>>>>>>
>>>>>>>> Hi Carlos,
>>>>>>>>
>>>>>>>> On 5/20/2026 3:45 PM, Carlos Song (OSS) wrote:
>>>>>>>>> From: Carlos Song <carlos.song@nxp.com>
>>>>>>>>>
>>>>>>>>> Mark the I2C adapter as suspended during system suspend to block
>>>>>>>>> further transfers, and resume it on system resume. This prevents
>>>>>>>>> potential hangs when the hardware is powered down but clients
>>>>>>>>> still attempt
>>>>>>>> I2C transfers.
>>>>>>>>>
>>>>>> what was the reason of this hang ? I was thinking you don't have
>>>>>> interrupts working when client requested transfer but adapter was
>>>>>> suspended. Please correct me if wrong.
>>>>>>
>>>>>> And it would be good to mention the actual problem and why/how it
>>>> occurred.
>>>>>>>> Code changes looks fine to me but have comment on commit log.
>>>>>>>>
>>>>>>>> It seems, you are adding support of _noirq() callbacks to allow
>>>>>>>> transfers during suspend/resume noirq phase of PM.
>>>>>>>>
>>>>>>>> Would it make sense if you can write "Replace system PM callbacks
>>>>>>>> with noirq PM callbacks" OR "Allow transfers during _noirq phase
>>>>>>>> of the PM ops" instead of "mark I2C adapter when hardware is
>>>>>>>> powered
>>>>>> down" ?
>>>>>>>>
>>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> Thank you for your comments!
>>>>>>>
>>>>>>> But this patch is added is not for support noirq PM callback or
>>>>>>> transfer in noirq
>>>>>> phase.
>>>>>>>
>>>>>> Okay, may be actual problem description can help me.
>>>>>>> In fact, this fix is to mark the I2C adapter as suspended during
>>>>>>> system noirq suspend to block further transfers, and resume it on
>>>>>>> system noirq resume. This is to prohibit I2C device calling the
>>>>>>> I2C controller after the system noirq suspend and before noirq
>>>>>>> resume, because at
>>>>>> this time the I2C instance is powered off or the clock is disabled
>>>>>> ... So I want to keep current commit. How do you think?
>>>>>> completely Makes sense. Please help add how this problem occurred
>>>>>> and
>>>> why ?
>>>>>> So the change/fix will be good to understand against it.
>>>>>
>>>>> Hi,
>>>>>
>>>>> In some I.MX platform, some I2C devices will keep a work queue all
>>>>> time, the work queue will trigger I2C xfer every once in a while,
>>>>> but the work
>>>> queue shouldn't be free in system suspend.
>>>>>
>>>>
>>>> work queue has transfers queued even if system is suspended ? IMO,
>>>> the client i2c devices should not let system go to suspend.
>>>>
>>>
>>> Hi Mukesh,
>>>
>>> Thank you for the detailed discussion.
>>>
>>> Yes, I totally agree that I2C client drivers should ideally stop
>>> issuing transfers when the system is suspending.
>>>
>>> However, in practice there are many different I2C clients, and not all
>>> of them strictly adhere to this requirement. Some clients may still
>>> trigger transfers through workqueues or deferred contexts during the
>>> suspend/resume window.
>>>
>>> Therefore, adding this protection at the I2C controller side helps to
>>> avoid unexpected accesses when the hardware resources are unavailable,
>>> making the system more robust.
>>>
>>
>> Agreed !
>>
>>>>> Within a very short time window, possibly from noirq_suspend to the
>>>>> system actually being suspended, or possibly from the system
>>>>> starting to resume to before noirq_resume, this work queue will
>>>>> trigger an I2C transfer, and at this time the I2C controller's clk
>>>>> and pinctrl have not yet been restored, reading and
>>>>
>>>> Right, this kind of explains the problem to me. I think you are
>>>> trying to serve i2c transfers when your resources(clk, pinctrl) are
>>>> not turned ON and also interrupt remains disabled. And that's why you
>>>> need to add
>>>> _noir() PM callbacks supports along with IRQF_NO_SUSPEND |
>>>> IRQF_EARLY_RESUME flags.
>>>>
>>>>> writing I2C registers causes the system to hang. This patch make all
>>>>> I2C operations are performed in a safe hardware state.
>>>>>
>>>>> Is it better if I add these comment to patch commit log?
>>>>>>>
>>>> if my latest comments makes sense against the issue, you may write
>>>> accordingly. if i am wrong, then your explanation makes sense. Cause
>>>> of the hang needs to be clearly mention int the commit log in your next
>> patch.
>>>>
>>>
>>> Based on our discussion, I have updated the commit log as below:
>>>
>>> On some i.MX platforms, certain I2C client drivers keep a periodic
>>> workqueue which continues to trigger I2C transfers.
>>>
>>> During system suspend/resume, there exists a time window between:
>>>     - noirq_suspend and full suspend
>>>     - resume start and noirq_resume
>>
>> - noirq_resume and resume start [Just opposite ?]
>>
> 
> Sorry, the expression is ambiguous.
> 
> I will update the commit log to:
> 
> During system suspend/resume, there exists a time window between:
>    - suspend_noirq and the system entering suspend
>    - the system starting to resume and resume_noirq
> 
> Does this look good to you?
Yes, looks good.
> 
>>>
>>> In this window, the I2C controller resources such as clock and pinctrl
>>> may already be disabled or not yet restored.
>>>
>>> If a workqueue triggers an I2C transfer in this period, the driver
>>> attempts to access I2C registers while the hardware resources are
>>> unavailable, which may lead to system hang.
>>>
>>> Mark the I2C adapter as suspended during noirq suspend and block new
>>> transfers until resume, ensuring that I2C transfers are only issued
>>> when hardware resources are available.
>>>
>>> Does this look good to you?
>>>
>> Looks good, Thanks !
>>
>>>>>>
>>>>>
>>>
> 

