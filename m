Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA62D34405D
	for <imx@lists.linux.dev>; Fri, 31 Oct 2025 12:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761912428; cv=none; b=Bm0bZHFr5mOxJfn7iSrD82hyAglRRCt8wJfwdoCp5OaNhFSt/saQMGgwvcZ0TBYi9YFa3/EShFboqekEUg6pIhWSsLicYNH1TKjlYoOqd/6RO69Ys0B08AkFmpfXxUlKwTQcvT6PlSsdrolXCOg88uzhS4bvnV84gl/wiRyBQww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761912428; c=relaxed/simple;
	bh=QdfcKgydSkRm0A8GQzQXVINVhev5YokC6RzzW3M0ueA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SY7yhJHKD+jh5JeqSplQMKBtwIu9GUocUHseaFj8BrPqiI0RtA+V9ont+82w8d3hVovpp8GVWnlmpbNdpjc5XfzbSFjriMZCHe+QgUs6Z0EvdyVOW6XXKfHmxNRKjesnDxKFoWsfTvuirQMnE3ZEpxuNUSi6ijA36bPcJngHvlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZlkD3Zx; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZlkD3Zx"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-37a17d470dfso17206931fa.3
        for <imx@lists.linux.dev>; Fri, 31 Oct 2025 05:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761912425; x=1762517225; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g+wNT7KW8FpybzoaA+6FfZ6C32T5hx5xiEfdag3k3wE=;
        b=YZlkD3Zx9qrDDH2mlc2RWjcJlv8fLh+2ZGh+XsTuiZfPxuiiFxfh/xFlgMC8Acl+E8
         H2ugQslOIShAHZ3ZLWa9CPJYtlI62PBlx3iBLxBAcsm3unuAur7rQGO5BecT2vn+19fL
         EjUunZaWVVn55dMWHe0txXl84cDRf+hDuRAjGF1Xo5WpNBmn03iolLVtPgAbUdiFPu7h
         X7rD+aIaieHFGpIVxFgMKxMDL1i0fPhAt57VJIXDCfc/ZvhiBkcA0VIOVmVhEg9+g60G
         AzvkVuM4C7w0MAjfYzoghvsojqzMy4PBqqeZxV++lyGkePgRQ2ZhBYH4GwWyeaIw9kk6
         ueOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761912425; x=1762517225;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+wNT7KW8FpybzoaA+6FfZ6C32T5hx5xiEfdag3k3wE=;
        b=sPjgtfE80qAt9Tun8fHGBAAGD+VXS2vKFVMnN0xgr0ObgIBEewg78zU/UiCvr6RY7L
         u2HbTz022e9txb7B71FwRaq4alwmFmkJns51/lwrzoZ7gRC4Lsp2BePAp4T/Q0rdI9hk
         gvFFECtp7EnnzKbcWQR00rYOhvPKh/WWxyN/9q7WMFA9qaT8P0x4x+7xA+ZhjpUZCQSe
         ot1lR43Q5/jWVjp4SYhZ+Ns5Dj7FaNuGWEkle/wMWFSXzam3bCS8HnJUQc99zaocipw3
         uM4wBQ3cuL4Wm26x3Ura4xdMkUKnWW0QZJUmlXLoaH8cC8Hw8H0YwRZLMD8vNrtWUO2N
         gENg==
X-Forwarded-Encrypted: i=1; AJvYcCXS7ZBwIk8JJyuIuE3GzX6AqCk3wLCW6s/BXoGWqcqA/FvjRtOPvVkfgjrn8At/rzh3rqk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxltfPNm/MB/u6we/dRuyq1n0emroS/h8EO8GoHldlwFnMK2avJ
	Xf/4va9MJ/ZXtXosDjOn4kDJBw3+x/3gRp0SpTVzEiHWUGXkWiD/Wi9d
X-Gm-Gg: ASbGncs7ECY1P6EkmusuQpmjP2bDaXL2thbvOk2OFlBn39WduRYEmpxs8rAuI/py882
	vjKGVvNPOdlFuscwPsWQIMIFWbfyUpKrLGwlj4LoY+YVDf0qalQZi60XSoHoUmkg5zmn9HhxJ/2
	7vFYFcHhDAAGgbZ10LMaEWa+HDUinjeVN2+JZ+RHAxAlCM8n5xnl9nMvMYAxJ7fLhVnP66NndT7
	kQgL/hplSoR1xc78s4QmDXnrWrPoyOMQmB5YoxjyYJtIGcwSQlrPwRUXDm+oaeZRyzndeRpagGk
	OaLhRiCrS4tSKyyPX22kqeDcrtwQMRvCDbSujRqfxnkAf4GbmkfDEcZotvvskqvDOKfIYOBF7ss
	h0y8Ontep4iQuKJMk1/B2G+p45W3Y64I2NycOc/hE7PiA47c++YEjuywCBH6RWCJ8MU8HQajhHe
	zWZSpXXMibN1wXtEJorFz8VyDhPcBBbxjHefsy02kcpcoVtyhrDmSKvwfyG1Wk+SgolcB5
X-Google-Smtp-Source: AGHT+IH/ICNj/bMV5RVGbwRdK/Ejd2emYkz7dh/g7c7spskiA/UNWUDs1dQqtabTPzVdNpWwUCQDtw==
X-Received: by 2002:a2e:8689:0:b0:36a:925e:cf3c with SMTP id 38308e7fff4ca-37a18dc7311mr10659721fa.31.1761912424618;
        Fri, 31 Oct 2025 05:07:04 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a1bfb3e70sm3216571fa.12.2025.10.31.05.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 05:07:03 -0700 (PDT)
Message-ID: <0beeacba-c484-43c0-80fb-66b2e0293681@gmail.com>
Date: Fri, 31 Oct 2025 14:07:03 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] arm64: dts: freescale: add Ka-Ro Electronics
 tx8m-1610 COM
To: =?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@KARO-electronics.de>
Cc: Maud Spierings <maudspierings@gocontroll.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20251022-mini_iv-v2-0-20af8f9aac14@gocontroll.com>
 <20251022-mini_iv-v2-3-20af8f9aac14@gocontroll.com>
 <a7012995-c2a8-48a3-abe1-5c227272f21c@gmail.com>
 <65202d1f-6c4f-4d4e-9fef-85cfb74ec768@gocontroll.com>
 <938f85b0-4c9b-463a-960a-f5f4e4092480@gocontroll.com>
 <20251029081138.2161a92a@karo-electronics.de>
 <4a47b9b5-f482-41b6-a441-7728572c5a0c@gmail.com>
 <20251029104838.44c5adcf@karo-electronics.de>
 <d05c62c9-7ed7-46e4-aa4d-27172741b5ee@gmail.com>
 <0667e026-99f3-4233-b3f6-e38273961d49@gocontroll.com>
 <20251030095434.1dc06df2@karo-electronics.de>
 <26fc62bb-3484-4812-b576-6640eef72c49@gmail.com>
 <20251030130006.0221957a@karo-electronics.de>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251030130006.0221957a@karo-electronics.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/10/2025 14:00, Lothar Waßmann wrote:
> Hi,
> 
> On Thu, 30 Oct 2025 13:01:52 +0200 Matti Vaittinen wrote:
>> On 30/10/2025 10:54, Lothar Waßmann wrote:
>>> Hi,
>>>
>>> On Wed, 29 Oct 2025 16:35:25 +0100 Maud Spierings wrote:
>>>> Hi Matti,
>>>>
>>>> On 10/29/25 11:05, Matti Vaittinen wrote:
>>>>> On 29/10/2025 11:48, Lothar Waßmann wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On Wed, 29 Oct 2025 10:42:17 +0200 Matti Vaittinen wrote:
>>>>>>> On 29/10/2025 09:11, Lothar Waßmann wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On Tue, 28 Oct 2025 14:10:04 +0100 Maud Spierings wrote:
>>>>>>>>> On 10/28/25 13:42, Maud Spierings wrote:
>>>>>>>>>> On 10/28/25 13:15, Matti Vaittinen wrote:
>>>>>>>> [...]
>>>>>>>>>>> Could/Should this be described using the:
>>>>>>>>>>> 'rohm,feedback-pull-up-r1-ohms' and
>>>>>>>>>>> 'rohm,feedback-pull-up-r2-ohms'? If I understand the comment
>>>>>>>>>>> correctly, that might allow the driver to be able to use correctly
>>>>>>>>>>> scaled voltages.
>>>>>>>>>>>
>>>>>>>>>>> https://elixir.bootlin.com/linux/v6.18-rc1/source/Documentation/
>>>>>>>>>>> devicetree/bindings/regulator/rohm,bd71837-regulator.yaml#L108
>>>>>>>>>>   
>>
>> // snip
>>
>>>>>>>
>>>>>>> If real voltages aren't matching what is calculated by the driver, then
>>>>>>> the voltages requested by regulator consumers will cause wrong voltages
>>>>>>> to be applied. Debug interfaces will also show wrong voltages, and the
>>>>>>> safety limits set in the device-tree will not be really respected.
>>>>>>>
>>>>>>> I think this would be well worth fixing.
>>>>>>>      
>>>>>> Before doing the real-life test I did the same calculation that's done
>>>>>> in the driver to be sure that it will generate the correct values:
>>>>>> bc 1.07.1
>>>>>> Copyright 1991-1994, 1997, 1998, 2000, 2004, 2006, 2008, 2012-2017
>>>>>> Free Software Foundation, Inc.
>>>>>> This is free software with ABSOLUTELY NO WARRANTY.
>>>>>> For details type `warranty'.
>>>>>> fb_uv=0
>>>>>> r1=2200
>>>>>> r2=499
>>>>>> min=800000
>>>>>> step=10000
>>>>>> # default voltage without divider
>>>>>> min+30*step
>>>>>> 1100000
>>>>>> min=min-(fb_uv-min)*r2/r1
>>>>>> step=step*(r1+r2)/r1
>>>>>> min
>>>>>> 981454
>>>>>> step
>>>>>> 12268
>>>>>> # default voltage with divider
>>>>>> min+30*step
>>>>>> 1349494
>>>>>>
>>>>>> Probably we need to use this value rather than the nominal 135000 as
>>>>>> the target voltage in the DTB.
>>>>>
>>>>> Yes. When the driver calculates the voltages which match the actual
>>>>> voltages, then you should also use the actual voltages in the device-tree.
>>>>>       
>>>>   
>>
>> // snip
>>
>>>>
>>>> Then setting 1349494 as the actual voltage makes it fully work.
>>>> Otherwise it complains:
>>>> buck6: failed to apply 1350000-1350000uV constraint: -EINVAL
>>>>
>>>> Final debug output now:
>>>> [    0.327807] rohm-bd718x7 0-004b: buck6: old range min 800000, step 10000
>>>> [    0.327813] rohm-bd718x7 0-004b: new range min 981454, step 12268
>>>> [    0.327819] rohm-bd718x7 0-004b: regulator 'buck6' has FB pull-up
>>>> configured
>>>>
>>>> I will add this fix to the next version of this patchset and include
>>>> your requested change in the dts.
>>>>   
>>> Does it also work with min/max settings in the DTS that are taken from
>>> the designated value +/- 5% tolerance margin, so that the DTS contains
>>> reasonable values determined by the HW requirements, rather than some
>>> artificial number that is enforced by the SW behaviour?
>>
>> I am unsure what you mean by "artificial number that is enforced by the
>> SW behaviour"?
>>
> The nominal voltage that is required by the consumer is 1.35 V. That's
> the voltage I would expect to set as target for the regulator.
> If that voltage cannot be achieved exactly, I would prefer to have the
> intended voltage listed explicitly rather than listing a value that
> accidentally can be achieved by the regulator but has nothing to do with
> the requirements of the consumer.

Ah. Thanks for the explanation. I get it now - sorry for the noise.

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
