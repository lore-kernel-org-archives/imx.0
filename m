Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DD0274B33
	for <imx@lists.linux.dev>; Wed,  9 Jul 2025 08:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752049764; cv=none; b=t/gBYkkm1m5WjtbPeMepGN11szse8N+6g3q3NytH6fTxj0C3KFrCNdNQ64hfE6S71rGzLBn5SCPj+TnWVYDl+MaqBSsK5sonwMI5dndhACscT5sIXjJOd/ELfHIBId99+qajL212SiPvdj/Fnl0LtYzEATUXop/phZ/y5QDm8pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752049764; c=relaxed/simple;
	bh=Gz615AA1RemfbzZ5O+NZcL2ZlXa7UhUhm7op+3BwqTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TXxXFaavM+IFHLiXeD/WFxu/b2HFjLWHxWT2g3kyP8Tr29A5ZKzatEJBevQ8gtbIN55E+TgAUIaHHNmTstu/Orc5ez9IixEOu77EuzVr1BmuOOAymz3jsqqLzV95Av838lGQX9ZfHiWI0SblglzYRtWfvTStqk/5jcPHF+gA8Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKnJFnz8; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKnJFnz8"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60cc11b34f6so1210989a12.0
        for <imx@lists.linux.dev>; Wed, 09 Jul 2025 01:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752049761; x=1752654561; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bi/l3ud7Bd1Vu8GC02tc5orfdCo7D2QgRurFTd5r8ic=;
        b=QKnJFnz81KnenJ5yOB2+x0z/W8cKBvdJYzsogwGLdtBZmo6u+msPqLk2AJsdFR2iIh
         Xq2PCBJb/mh32Re1ekWgS/8ol5EDZuIkrJPJ0rVGCWPPnp77SGVMxYGfhILUBWvByc/z
         zvCktZUn1AqbpkQ670SSadcJUPFKEef7/0ZHHMIwZQzbhkZDPevLQG1eY4leTAqRpzj2
         0qOH/O5zthMRuoDs2nCYnYddpwXLunew+vZsUNohK7iNobsAUhJZRcY88K3gtH7vBqEn
         j3PvZwh5m0SLA0FdpuRxud0CzEKwl6Ciwp/PKf0eWVjU5Lx/91lYMPzUbpEaDF428xVj
         F/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752049761; x=1752654561;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bi/l3ud7Bd1Vu8GC02tc5orfdCo7D2QgRurFTd5r8ic=;
        b=RnPlrMJCeXqXCPD2TjZ61cKgQ2+O5LZgO4KWYCwWyzWLpjyR3dz1zT6mzWfTq904Pr
         mjbHfdAXF+XmVdkovwmRS7ZkLX++5NxHFGiOqFmFbMfXoWaM/UZBZxjv+7Ju1MpNRDLQ
         Nud14F9ACmDLJEWB7+ML0xwD5RXcGoKhmk2bN9hmVNAXHQWwyWAIKxMFbOVNkqvgPj4B
         QWLs6X6RTEZR74uYP9nFX62UJuPF+R4Po5rNwg3pTE72+NFlbNm2X1AKxSLN9ZCFOwc4
         bjFzDOy5MmcNH1o8XrUzdKmfu4rseOCUkQkEmiLp80OxzAXtinB+SUaXs1b4vfkMZpkr
         8xNg==
X-Forwarded-Encrypted: i=1; AJvYcCWshtBxYweOpmxhvOzyX3McsCcRWkwte2g85bK/3RDq5LWUK81FAnDxgpBV+kt4w8cim18=@lists.linux.dev
X-Gm-Message-State: AOJu0YweqH5Sw6xZsra09uNDea8SJvJA8MFsVJU6M1HZSGEo1NomohKu
	D3bHk02g1sG1rHOcgb6FfVn74XJaQKNm7ztRTTrTxAjPcnvR7P+ZsDwI
X-Gm-Gg: ASbGncseuh8x2gs5d8G+ymETZUu1G3CMOM5BXj4q9EeNURRH5m3EFdmZjdZqUPLXu2J
	gmuRYprnpHF07eKcVKCPN0f0X0b07vhCfIB++Ah2zxh7KnrweK/p5LcDYE4g2l7osYaCaRvFIhz
	IPv4wpZPNqxMULumB2HS0TWmlBrGT9Y3SDPAAobzb1DWC+JsNCooksrvCRvtP3l+AgvNE+xDkIE
	A64oDov78ZbyI6ieD6zRnhLEnxr5joc7I/W+vjvSRcalRZmC/k0COwogfZWFy+xmVw6tEYDZazq
	rhKkbxwUVpxr7WHlimrEyU40c4qiTPoqc6hRzWfICFLxLyk/OS3RK0tDchwBA+kwBz/96ymnFVb
	uEq069Pg2DQ==
X-Google-Smtp-Source: AGHT+IG7Froez94aK00sHDKtRfqK1t5pvOLh2GahZldwvh4yUsreoBwkPjrJr30QJyEe79WxSjfLsA==
X-Received: by 2002:a17:907:3c88:b0:ae3:ee3a:56ee with SMTP id a640c23a62f3a-ae6d1266a1bmr156027366b.3.1752049760977;
        Wed, 09 Jul 2025 01:29:20 -0700 (PDT)
Received: from [192.168.5.87] ([92.120.5.6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f692d101sm1073719866b.54.2025.07.09.01.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 01:29:20 -0700 (PDT)
Message-ID: <907a40d6-7d55-4bdf-b16b-01c71b5f4104@gmail.com>
Date: Wed, 9 Jul 2025 11:29:16 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pwm: imx-tpm: reset counter if CMOD is 0
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-pwm@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
References: <20250701220147.1007786-1-laurentiumihalcea111@gmail.com>
 <vwozlwajisjw5qomwtmnfdklmucevyxncsxl2cdmixn2yixxrk@x6j3r2lrl5qz>
 <a1b6039e-7020-4d17-8186-d40ac17ba730@gmail.com>
 <xo56zato6pgqqttdriskfgh4kdt2g6q5eg5jxte56uddkdfr63@sa7coeifbsmy>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <xo56zato6pgqqttdriskfgh4kdt2g6q5eg5jxte56uddkdfr63@sa7coeifbsmy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/9/2025 9:05 AM, Uwe Kleine-König wrote:
> Hello Laurentiu,
>
> On Wed, Jul 02, 2025 at 11:31:28AM +0300, Laurentiu Mihalcea wrote:
>> On 7/2/2025 8:51 AM, Uwe Kleine-König wrote:
>>> On Tue, Jul 01, 2025 at 06:01:47PM -0400, Laurentiu Mihalcea wrote:
>>>> +		 * MOD will NOT reset the value of the TPM counter.
>>>> +		 *
>>>> +		 * Therefore, if CNT.COUNT > MOD.MOD, the counter will reset
>>>> +		 * after UINT32_MAX - CNT.COUNT + MOD.MOD cycles, which is
>>>> +		 * incorrect.
>>>> +		 *
>>>> +		 * To avoid this, we need to force a reset of the
>>>> +		 * counter before writing the new MOD value.
>>>> +		 */
>>> Without the reference manual at hand or a deeper understanding of the
>>> hardware this isn't understandable. What is MOD? What is CMOD?
>> so, MOD is the reference value for the counter. The counter needs to
>> count until this value is reached, at which point the counter value
>> gets reset to 0 and the output signal is driven HIGH or LOW (depends
>> on the configured polarity). This value is used to define the period
>> of the PWM.
>>
>> CMOD, on the other hand, is a clocking-related configuration option.
>> I'd say what we're most interested in here is the fact that if CMOD is
>> 0 then the counter will be disabled. Otherwise, it will be enabled.
> JFTR: I marked your patch as "changes requested" now in patchwork and my
> inbox and expect an updated patch, but without holding my breath :-)

Sorry for the long delay! Got this on my TODO list. Busy week :(


Thanks,
Laurentiu
