Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833472;
	b=5UFMqzw89PhVycTMNUcBF0E4zc+ZlDrbAAuHClb/nn+rm01tcPx3JWGYSf3mTuujMeTp
	 alpFzJ47g8h31q41y3mAl9+FP7b1qkjlhJWyAgfRR4ryGLjybE7HtYUoXUGD2owOJuWtg
	 LZpW6nFDZ97nhS6mjjX0UzQunArt0B5yaeX5X5+x6nvQZnsvkzkE+gqtwLVcgtlJ11cHp
	 kpL+vfWTGCFwuaPBpGPQ5Y3f3v5heA41IoYI8Sr2YVzBSmeiCnt+pu2tYJpaBuHpsVHEm
	 a0OHiPCK1pGmmT5uHFUQ2MPRblI8bS2psYOyPv1gCK4Em4GZRrhUV3IlS46rqTJN1Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833472;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tftf03A44iydkYI0lYrITsfjxfNR2F/pHqEC2bTsuUA=;
	b=gpF/fcxgBjeV16O7AzoRMLyLLi9nMezb69/anCxg216ZJjx3F6sQ72gySuxiWdKfbzWI
	 XcQ5QIvxj9SXrKqNBAgR8vXPtmSJ53+Nr7Th5X/6XOm0iIQjS7xkkHuwtZ38OXn77d/SQ
	 khhkY0bGk4kNDG6S+tCVgryAkmtLYY5+ncBH5Rms5pItkSt9rn7yPZ5n3K7M4pEkbG6iF
	 H4Nxz6UvMYj58xG7ueEdoO+RZ9Puk7q6zalatTkKxd2IyZeRQHPAOK2Aw4epGeIpkpRcT
	 o/j1l8YpDxsVK5CXJmGKdJoQOUtpY0j4oiMXRV5RwZxRlhdVkU0vzHpLIFXZoxaFAHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kRPHO7VA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CmILbI51;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC35D606A329
	for <imx@lists.linux.dev>; Wed,  4 Nov 2026 23:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC35D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kRPHO7VA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CmILbI51
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4H5vXk3037672
	for <imx@lists.linux.dev>; Wed, 4 Nov 2026 23:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tftf03A44iydkYI0lYrITsfjxfNR2F/pHqEC2bTsuUA=; b=kRPHO7VAcopwMvqM
	fN0mfVSAzHB5Ty/3A64i/jHQ1SNbytGq+QbeebZ7ODgu4u8YRSAP1bVSHf51cZT8
	ih6vHMagKjXNQDZHzsm3O+K2Dqm1Jgce8gMhr6W2sjpa1CsyXlD+vJHZCT9Vyhxp
	vKjr0tOqyFHbpl1Oab5noPAS7K6fH1b+ockO13+dIaNKnmHuUBPDYk1sYMfYitZP
	naqiajKPlqO+uU4WREwF97ls01X+ELjouKmqp1ExIpj9862HQJ3wPA95mTwyiSgJ
	PDShJlAje5MbtCntcGnwFz+aWzHUcDAfTk2ZadJISv5GwvxyvFlmY0UWvR7wwCQL
	5lBY9Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr8rv1g6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 04 Nov 2026 23:04:30 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cb9d27ddcfso300344137.1
        for <imx@lists.linux.dev>; Wed, 04 Nov 2026 15:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793833470; x=1794438270; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tftf03A44iydkYI0lYrITsfjxfNR2F/pHqEC2bTsuUA=;
        b=CmILbI51sQU+296tNSRPMNAp6DSBwxnv3WP/B9mzWNUT/LPlCd+iB2thlXMs64wrCv
         pMSvgw76luqCdj+TItcjUmaWoukszHRyW9fq2sLfLyB78C8CUShv7m0WzwXwx3csPuJu
         2zgqbmC3l5f2KUMWqyKg9/z8WbhZmyw45RY9DE0ZDRYCMfjGrj23HKl49m5iZGVUTgcV
         G120K7OJHK36VlaGR5Fj5MHNhvibVnAU39al5ra7VUttZlyrQcWDMwkoqXieCkxOqg1/
         c8BC7gIKUSjlOxVKO3iBS2tXPV/MGFMds/T2FSp0C14dzDChIracn/sDgY/KAzL6bCrd
         /M5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833470; x=1794438270;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tftf03A44iydkYI0lYrITsfjxfNR2F/pHqEC2bTsuUA=;
        b=xONqAoqwodQMzpRDWtWHalYelW9xb5vJ1a8R0KFtfTH6J2Z6q5HhND7kzq1oMszwxj
         U3e002dY9NbnbWhOc4U7Mc4npjEF15GC6pE8J4ViQT3Y+BMHrEbmugnye1o9sS6BK5up
         HqfU7RKbFHgvy4Ui+Bw+5x9J6lcboRCshXHSuDm3nn3e16zIiVJc6q870y2+49aewPMo
         SK0bgfazF6ADuOG3ziazQi4wIPxPnEncbvXqr3JgpP/sA9qF99eEoKjg3wX646OSdDIL
         UPyvyrQ7kKHw9Ks4lqK7V/02s28Ucqbz4JrATXpaqVW8S4cDVM8tlFk6gMcZbOyrDszB
         GF1w==
X-Forwarded-Encrypted: i=1; AKwUvBy+ZZZKY3NOudrb6N3HmFZP87ZBWDQvO6ZV6sdQB5ErMqcOT4jhhKMURN0qboUeLFwNgPI=@lists.linux.dev
X-Gm-Message-State: APuU4Z+JD//nRbF8NZ27Ut6anTant3DHgb1BDVIR6u/Xte2OyJPBTD0D
	HrwiFYu7x9vDk6Yw9QT6gwxDyLkEv4Ik4tuANpQBHoWqA8OxgqC7fpavNl9sR/ChjwKrCw6TL77
	l73mkGCsBqOJfRQtPYDPls/POb9qC2PIwFz/sxbEi7wjMw3OvZ2CABHo=
X-Gm-Gg: AYBFou1QKUsd85+3bZYiJP4p1tf690LgxqE8eILQcl+sCUV1W2NE6s6Im96OJURWWMs
	YGoxKHyoWfT451fSb6Xf2UYKMCdvK1aleyY8rZrYhCGJQu/IMLHXcnJN7LgKTGyHHKrhmS92YjI
	kYKEyI8yakkNGscbUdnBCjeaho0fYyCKrNMXSZI1WWm1yXNHgONrOnaCPVfibldKaWCPtYgZKW7
	qpX+ACryeSlYqnScIOW+Ar3zWTU9a6Ds30lCoMYFYe+ttqCdIdmSYSPBIW79sxKtqP6cMziw2fZ
	vvUPjVKKaXS09AezD1dDrczBcvitqT5y/5529WNBwqzw6c/+gyNsmMxo7nvF4f3zeVvmE1nH9zU
	c9zYBWYrdKf1CDnbHEZNNYMyhsVENSjSsoXfJi0qv0gYudxtcYhxycBJTWuBn8Aic34o1dZjGTQ
	==
X-Received: by 2002:a05:6102:3706:b0:7c3:9b0c:a75 with SMTP id ada2fe7eead31-7d0725ceb28mr6081014137.12.1793833469981;
        Wed, 04 Nov 2026 15:04:29 -0800 (PST)
X-Received: by 2002:a05:6102:3706:b0:7c3:9b0c:a75 with SMTP id ada2fe7eead31-7d0725ceb28mr6080979137.12.1793833469448;
        Wed, 04 Nov 2026 15:04:29 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed552afcsm6267878f8f.41.2026.11.04.15.04.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:04:27 -0800 (PST)
Message-ID: <3b390b39-c27b-4b62-aa49-5b1bb56c3cfb@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 00:04:25 +0100
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] tty: serial: pch_uart: replace chan->device->dev
 with dmaengine_get_provider_device()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Frank.Li@oss.nxp.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        John Ogness <john.ogness@linutronix.de>,
        "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
        Zhaoyang Yu <2426767509@qq.com>, Haoxiang Li <haoxiang_li2024@163.com>,
        "open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>,
        "open list:TTY LAYER AND SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        imx@lists.linux.dev
References: <20261104145211.3209669-1-Frank.Li@oss.nxp.com>
 <auuaYxoZm2T25cU5@ashevche-desk.local>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <auuaYxoZm2T25cU5@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Vtm2kO2n c=1 sm=1 tr=0 ts=6aebb9fe cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=8AirrxEcAAAA:8 a=09QxJ2vAxbTnJTa0ltsA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=crWF4MFLhNY0qMRaF8an:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA5MCBTYWx0ZWRfX9X6cLOazsy8Q
 QaDm+ysRdIOU2z/vs4gkILZCOA0Bv2dbh4guUcJFsKAaRSpcQSG3/uUuGidP5ZRHliBfsAHo+IE
 IUT/5Qxqhosg9JaQ6r7nBOC72pGNZ2s=
X-Proofpoint-ORIG-GUID: mUB-rAM-OHo6Kluo8yi3WeYv6805C5fY
X-Proofpoint-GUID: mUB-rAM-OHo6Kluo8yi3WeYv6805C5fY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA5MCBTYWx0ZWRfX1DVNXQoJM2Sy
 QvEfdflY6tUQ8/z7C54EgjW25KW5VwnMnuydCXJpgAdLo1ZDMLMMLanlWtCAvXb0VO+4YOok5Wo
 yYfk0uGkLDjaX70j/PoE2uPhzvHeMObYfd6CUYwF9b8bDyyc4KLXZija9FTvz8PIdjjRS6EGqJ8
 L4XMbJqHVIHVFPE8wF/17dEyvPkfxNVWxPgYMsxVarDB3YWzXP3Qbh8QQPz5qveo/ZYUCeqoADY
 aL7n86y9fWczm+bcIXKS/S7kL6vV2kHqCwnAaHPhYBfoYbycOvecCDeDvwIrhXnzULNyt8Hkf6m
 4lNOuU77QwlmhthRnZ5CB9LFMapB3R1QijagGwo0wgXClsNQeT4OPktt1zHBHdxRQvRZdIzFgPR
 zyAVoz3JauxzdInwnQzthm8tXs4f2u3PsWYRS9TrmON2V1+wq0QnXou5vKwnOlU7o73YWuKGqCs
 tx0+MwxbNG9ULMxxd1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040090

On 04/11/2026 21:49, Andy Shevchenko wrote:
> On Wed, Nov 04, 2026 at 09:52:06AM -0500, Frank.Li@oss.nxp.com wrote:
>>
>> Use the dmaengine_get_provider_device() API instead of directly
>> accessing chan->device->dev to get the DMA provider device.
>>
>> No functional change. Prepare make to struct dma_device private to the DMA
>> engine.
> 
> Krzysztof, this patch was a split from the bundle by a reviewer request (not me
> FWIW), and author obeyed. So, you can do the same in cases when you got something
> you want to review independently on other content which most likely is a noise
> (to you).

Do you propose that I read all patches and complain that partial reviews
should be split? How does this proposal solve my complain that:
1. Incomplete/partial reviews will be marked as full review of the commit.
2. People get same credit even if they intentionally did not read 95% of
the patch as the people who read 100% of the patch.

Best regards,
Krzysztof
