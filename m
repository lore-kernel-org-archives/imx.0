Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18C0372EF5
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 06:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781072778; cv=none; b=tRjldsx5T+AaPYhfyMALsy9fVEiRg/2nF/bTzLLpUUoo4PZUiBfjIcgN3O6BV+WyPHyL1z1pJqek7svI3j3vGMK4CgOo6Nx9Zr2yNgAhVLbZRTDoSS/7QLWBjto46J4G7igc6bwBULJY5fBLZQm49fxN8bKan5NJwXh3lIBm9fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781072778; c=relaxed/simple;
	bh=RLZVxrVN7CKZiEdl7Jj91AlfMTWtoKqBvG/TrXcAOYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tn1k4VCWSvLkalzA2JY/ScV/GR4NY4dVXssp0K9m+iNQ0gdQ9hhvqCT+7XtU1GQpc5rGyvCObPLjyXhtLX19u78CV60b6E/wzsvF/1AnplzCe6w2kamFtLHVKPaxn3uZycFOhJG3cHHfBEb7OInRDH1uDLFQPHt9bgT3Cb/Ovpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GzV6ndoM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P5PUql0g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GzV6ndoM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P5PUql0g"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2emD34061188
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 06:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Pk4bUqgKs1LDEGTz6b1TtBX5K7vWUA+YaexjSASAjI=; b=GzV6ndoMD6BQO1Ts
	U4mkIcBqvWsJRK+HvGKEoMuWaE9btvcZ3GYWTn87F/KshM15Tnm6hOp/f4XomGXn
	/jSDHK2D742qNUWA8N6jsy1K17t9hHS6WRQN5RaL0uZbsIgpwzG+ngl3XRCz8oCr
	h8uFtfHYw7ysw1NVvKJnwHKUuGn6F/SRIJwqcXStgW8+JjG5dghn4VY42QxoF2qC
	U4IhG0p3Csx1uT+a527akHzmNEyeI8teEMvWX8Kcu9Skh0n/jhTdf8CLejpw+HvI
	xlA37+8DjEaqeugrBGqg8BCCSLEcBQFJkw+GREhLXrmy8jIW9LhqySDLa0hEwk+o
	l+GzjQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh12qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 06:26:16 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517afbeda8eso11186271cf.3
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 23:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781072775; x=1781677575; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Pk4bUqgKs1LDEGTz6b1TtBX5K7vWUA+YaexjSASAjI=;
        b=P5PUql0gyuoP53POQDUX2v8novJyMZZ8lL9Tk6/URIQBaJWeBVIoQlIrkhmhXJSfz9
         IpmlgCAXnyLrkfpmsG7vnMHpmvjYdCYoL36HIqJUqaavqWDBuQF9/l7hfco1YFRKtjPW
         QfftL2YIl7e9h507+u+c7aQDu3lTebLIFwaIVs4hhhzx4v0bpsghcypW6LUbI59ErBJO
         S93duZH9cnrX8RhY3bdcUpiPjN3eAitID2TZSLSgUlWrN50pn/ZRNwmrozFouY3Unkwx
         wZOWzU3621CIfP+TNfxkvTCG1Td+94waJfTd8NiTU31TdCItJqBEUUKDiC1NhHQoPfUU
         5jkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781072775; x=1781677575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Pk4bUqgKs1LDEGTz6b1TtBX5K7vWUA+YaexjSASAjI=;
        b=qpafbRBcbvNDC1le2zhnXwtZIPTMEhP1Kr4c7Wl6bLs5Vrde5GJJwsQP6splDrxWfZ
         XAqS62LYKjSAwX8bebd+gbdy8AXzi4o84JFMHpdOl4e/YqVHXpkqlj7lOK6CF49E8+z3
         3vKB8/e85RlAVipQ56Zwv5rI609eSOnLTJGNbjNO7yi6boLZ32vRcfE9R8YEsGhW2ztw
         0Ze8RyA3BXcyAIxPGCxixYl/Q33UzIYCBcgByTVORcaLSbPiOJW8gIY5oe8I567qa7LD
         IutD7i8ErzX+T2LGEkccv+rp1kcKUM0UxHvU1ooP1iGkbYIp8Z09Ycw8Wns4y0SpuLDn
         xg/A==
X-Forwarded-Encrypted: i=1; AFNElJ9ejAFghGkW0Wr56wW+yVL6nAOSJnpAK1RrFlyfQmxxTC8mJ9VcTwXs2/C7njmIAm2P12U=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPVkK3bza0hxQVMJXok3bHjlDs1jKpri+tIvQd0COUBzGycRfG
	NfrxmQ4LhHGEWofK0MeotS1qvMDYZ13XEv9H09GgwoR52sUYu7ym3B7hB6XgqvTCEfO3kERmPgC
	gHWf36OXrB3VxeFVhTgbQXwYyoXJ4c+o+E8lxj4pYIOHX/Fp/yLILCfU=
X-Gm-Gg: Acq92OHwdE77MGz9GFzY5S7kUkTRRNrAOswcC/cqsnw8Jg6zgPxbsDa/yBmSfmpm+6l
	Sm7KS6trf09w2TxQchp35RgHvTCKVGTOSEnUobE3B5lSYahjdE+KGNsw90MaTZ/eexL/le5nKSQ
	PAr84IVWN3FFhhyla56DbmzuNGzBgddjqFUexsa3bhmdieobqV/emdb0Rf+j8tITUgLfGLC9ADc
	dZVkVYvWnHtRQMwVd1dD+wRwXmpn2odlguOw0CbzF654Gtb95VZa1AngGF5CNKV5YKEmVp+EIZJ
	UXjuN59IHvV742COR6ch6m6Pf7rmt2fIoLgGWbhYvRTbm47GxqltuGwS9Uu2pEc5w4M8XXLx7/h
	JybGWqhSbQnODYtzmk84W95JcHKymJhWQmSh4+7Fx3VVCcV3hxKQa8s0p6OS01ab+AKjbr4cd++
	5bD3JeTdmSQIJQPhKmReI=
X-Received: by 2002:a05:622a:5814:b0:50e:635b:5579 with SMTP id d75a77b69052e-51795b9dda1mr365592511cf.19.1781072775214;
        Tue, 09 Jun 2026 23:26:15 -0700 (PDT)
X-Received: by 2002:a05:622a:5814:b0:50e:635b:5579 with SMTP id d75a77b69052e-51795b9dda1mr365592081cf.19.1781072774760;
        Tue, 09 Jun 2026 23:26:14 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7f50:81e3:bfef:b418? ([2a05:6e02:1041:c10:7f50:81e3:bfef:b418])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490dcaa924bsm62959045e9.1.2026.06.09.23.26.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 23:26:14 -0700 (PDT)
Message-ID: <b5e225af-c082-46c0-912a-cb7a6c39a308@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 08:26:12 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clocksource: move NXP timer selection to
 drivers/clocksource
To: Frank Li <Frank.li@oss.nxp.com>,
        Enric Balletbo i Serra <eballetb@redhat.com>,
        Thomas Gleixner <tglx@kernel.org>
Cc: Enric Balletbo i Serra <eballetbo@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20260514-fix-nxp-timer-v3-1-a3e68fdb505e@redhat.com>
 <CALE0LRtJemHQj7o8iV1GaWJLVfTse6fp-TFvodC=AeWov6s39w@mail.gmail.com>
 <aignHiLu4wbh86Ut@SMW015318>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <aignHiLu4wbh86Ut@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1OCBTYWx0ZWRfXzrRx5SmSzFKY
 DrFqIpxocq41P0F5YhUo8i4vuO5Ej45Fi1YFsQWVJMbca2S5EFAnqUkV3pru+E/EBQQ1HJHvq9Y
 Us093X472M626/zd7LOMRAafgoWWv4QoYPKLB3Bl8V5ICL7Pul5Ek8fkXztoyVbU5mVbLtSgsXD
 oLwQLcKwdqBLZNG8LN+lg9y6fpJITfXyKikHWtO7AjT79hwXpcyWZRao7T40pycAphsQXx2rDUh
 QlzNq1ficynMFHcTBLEB92CrVFu7BwmRquXBVPxmSyHaqyqlyYkq5tkHekhIJP6vIBkDVgs6kJI
 YPpA1hQt8iofFOWTP/zY+tCC1NLFyQpCbdbV8wsDAN8uXgQx17ivfnTX/IdfQczRITcjo30XDih
 IHsceNjA1k0dvz8LiQm+jEUQ1T/atPuRZfraQUB8yNYHAzoCKBevtBhkJCnPrE1U+4xfLgZ6Nen
 FLm2oJ6/wSmGcbMINCA==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a290388 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=20KFwNOVAAAA:8 a=8AirrxEcAAAA:8 a=9N1ALIpxdcsQ5w2WyocA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: sjOMT2_wL21wannjQGAuByVVdzsBDmhS
X-Proofpoint-GUID: sjOMT2_wL21wannjQGAuByVVdzsBDmhS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100058

On 6/9/26 16:45, Frank Li wrote:
> On Tue, Jun 09, 2026 at 08:57:59AM +0200, Enric Balletbo i Serra wrote:
>> Hi all,
>>
>> On Thu, May 14, 2026 at 1:14 PM Enric Balletbo i Serra
>> <eballetbo@kernel.org> wrote:
>>>
>>> From: Enric Balletbo i Serra <eballetb@redhat.com>
>>>
>>> The Kconfig logic for selecting the scheduler clocksource on
>>> NXP Vybrid (VF610) uses a `choice` block restricted to 32-bit ARM. This
>>> prevents 64-bit architectures, such as the NXP S32 family, from enabling
>>> the NXP Periodic Interrupt Timer (PIT) driver (CONFIG_NXP_PIT_TIMER).
>>>
>>> Relocate the NXP clocksource selection from arch/arm/mach-imx/Kconfig to
>>> drivers/clocksource/Kconfig. This allows the configuration to be shared
>>> across different architectures.
>>>
>>> Update the selection to include support for ARCH_S32 and add a "None"
>>> option restricted to ARCH_S32, since Vybrid lacks the ARM Architected
>>> Timer. The Vybrid Global Timer option is restricted to ARCH_MULTI_V7
>>> SOC_VF610 platforms to prevent it from being visible on Cortex-M4 builds,
>>> which lack the ARM Global Timer hardware.
>>>
>>> Fixes: bee33f22d7c3 ("clocksource/drivers/nxp-pit: Add NXP Automotive s32g2 / s32g3 support")
>>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>>> Signed-off-by: Enric Balletbo i Serra <eballetb@redhat.com>
>>
>> Now that Frank [1] has created a merge request for Linux 7.1-rc1 and
>> the request includes
> 
> Thomas:
> 	It touch drivers/clocksource, Is it okay go through Soc tree Or you
> can help take care this one?

I picked it

Thanks

