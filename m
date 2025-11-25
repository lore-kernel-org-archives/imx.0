Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF622586C2
	for <imx@lists.linux.dev>; Tue, 25 Nov 2025 23:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764113656; cv=none; b=uFwXxNXIAndyY+r9ocFTqMef6s0oyCIWXATtzxm4cAs25glCUtemI5hxYNzT/SKNYGomKWc04i1ZfIohRMpgOaV5GQ2hHk6QhCRis4kBlryoN3QEeI0VAdcqhTnq4cFfs8urKsmPUdbF2EKq+SThH5Zj0NSiH9nQUzwSJfubvj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764113656; c=relaxed/simple;
	bh=7OIcc9KkXH6wW5HnKG3kaGMWstSD64sRgn5IR3BBUQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KEKiKyHBmfxv2aIFIY//1rH/uRpNFJMzGFStNsDm0L7UYKOfKJ2AVds75odF23ei4aR7UUc0xy5kLmJUdgiUqOSCoZMouWDFgUhPOc28ikZlVtcDB61C4O3t0betocrNlHP0O//auMSF12yrwJ9zSFZwTdQDkeV4YEA+Ym7ubf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bl1u0+Pk; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bl1u0+Pk"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so58212235e9.3
        for <imx@lists.linux.dev>; Tue, 25 Nov 2025 15:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764113653; x=1764718453; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YSgFECtP1z+NfavQTbIkfavnGHKDphcmbRff6uSNyR4=;
        b=Bl1u0+Pkn0KN+nFDXBzhuPCO9jDYCyy/mwqyEaVOn/RetkNV2n+7KR1jqVPb9SBIii
         X5dyyWkm7qOHiEeWuSJvdG4RLdYAR4SOeLOnfNqknbKw+DA6gKHrxxahozT37+D6K2Iy
         L1/0lxdPSrCzKRGkcOgG8hnES806gg5jNHxsOg8xXmvWmRzoYafdN22iRb7V+kFKXxV6
         +XBZGY1QeNAZ8kmS6SJst3tEAIFkIwRjc8iU/VwjHe16KCdmaZhsARu16TBVwBzGLex4
         X0zReRhJGXrEKQjRWcoagXPm90m9nO63naUh7QXA6kUP1UIFjJyqInY02+MwbxWX+5Vq
         /jXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764113653; x=1764718453;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YSgFECtP1z+NfavQTbIkfavnGHKDphcmbRff6uSNyR4=;
        b=sneKJD/LNAVkXe4dNDupgaNQBJK8E62CopFdl2mFGCUVx7STHyIv29BjULxKAvkT24
         Q4ja2H5IjhXSx4gxF+rNcLjs2zvIClkEfX8fOW8ioziQhGlnl64BQVF8bqahT1HYNF0v
         AwtLEIRQmkQUaZXdZbUqwsBnlGu7GNmusLsegiUoxobZMDKjDP2EXpOTfAPVUnqWgScS
         giZmyIySY8hTW1fOcfPxq47+kxwIJHjc3dSJVVIWbMdfHqAa8BVG0R8OAtuPg7HTuCb9
         pTc018UAxc7iUTZLFSGsmAr6nv+uK/OtDAP2ejLM0srGVAIMQgN95Nmv+5yw4VZGHcTp
         z23A==
X-Forwarded-Encrypted: i=1; AJvYcCUQ8DWd/58b8H5r6vsiORrTuTuzdIeukJCVgje8AvKVsWAbSs/sK4ZPFsaBcec9DUaqfbk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzm5xKzuzseVMFp29dK7NYzMm3FSYp+cVzMho/TixDg4Ffq2CKq
	6XHOFHbZpzqZicN3dbhCLqzP426NVyke2nsuNypuVwKXvfKH/0FJbMYH
X-Gm-Gg: ASbGnctPV+ZT3tYN/ZP8Ft0AnHo8xROpLQd/qG7aIIVg8gidq8cQdEzrBbwhLTnf11T
	vslajJRlxvny6tK9Psp6nTnbalwXyFP96LOS3CG0zxS0UMtuQHxr0XdS3I3zvGbjz3lKIz1fc+5
	p4yOTP21+ZE05/qj02qJ6fOg7Pq5UVJE7f+NIwhbkp/QgcB1wj7+a2Zoqp1ki8LABHqZkwat+6n
	deg/m8/L+G1VpzUMpSPT4v+U+XmZSaford+69+WlxqwVEX9ciJv+EGxUawsnA0CEmwsmrB+gMQN
	dp3GXNtKF/biS3AG7MMPxWTkyfO7lWRjCdRJQZ2Sq7MZrl6mCcUJD4slvs0A4hEaNrzbi9/HqFs
	/5hrUqaCRj0sQbaL//MwI/a3/OmqeL4WQklYHI/6W28DBeiOlpy7n2d7u7uZyhABzU9Gw0weyTy
	XRwseyXIdytx1N4inapMHiGqoWOaP0xMfkJFNrdeeIzg==
X-Google-Smtp-Source: AGHT+IFalyeW7faMHDifKV64koi9lzILMgomHzb1dC1jupNeqdx4t6uHO6adv/AIDeDahL7H73btnA==
X-Received: by 2002:a05:600c:4443:b0:477:af74:ed64 with SMTP id 5b1f17b1804b1-477c114f00amr174145245e9.27.1764113652924;
        Tue, 25 Nov 2025 15:34:12 -0800 (PST)
Received: from [192.168.1.129] ([82.79.237.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790addeeaasm12850205e9.7.2025.11.25.15.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 15:34:12 -0800 (PST)
Message-ID: <9ce8bcf1-7a62-44ce-81e3-f1c51f8be9b0@gmail.com>
Date: Wed, 26 Nov 2025 01:34:10 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] reset: imx8mp-audiomix: Replace mask with bit
 index
To: Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
 <20251114133738.1762-3-laurentiumihalcea111@gmail.com>
 <aSCHjNqj3CV3ahX0@lizhi-Precision-Tower-5810>
 <6be8a682-6c72-45c8-be0e-880ab66045ff@gmail.com>
 <aSR8q5cE/XXbZuF0@lizhi-Precision-Tower-5810>
 <4a022153-009c-44fd-8c4b-39819ae69390@gmail.com>
 <9f07e541fc000d9065c1ff1716f1edc4c2278c8d.camel@pengutronix.de>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <9f07e541fc000d9065c1ff1716f1edc4c2278c8d.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/25/2025 12:40 PM, Philipp Zabel wrote:
> On Di, 2025-11-25 at 01:59 -0800, Laurentiu Mihalcea wrote:
>> On 11/24/2025 7:41 AM, Frank Li wrote:
>>> On Mon, Nov 24, 2025 at 01:28:32AM -0800, Laurentiu Mihalcea wrote:
>>>> On 11/21/2025 7:38 AM, Frank Li wrote:
>>>>> On Fri, Nov 14, 2025 at 05:37:34AM -0800, Laurentiu Mihalcea wrote:
>>>>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>>>>
>>>>>> Replace the reset map mask with the bit index to make it clear that all
>>>>>> reset lines are managed by exactly 1 bit.
>>>>> I don't think there are benefit because I met some periphal need a magic
>>>>> number to reset.
> Toggling multiple bits in unison is different from having to write a
> magic number to a register field. The driver currently supports
> neither. That is why I suggested to change from mask to bit.
>
>>>> Please provide more information. What SoC? Which peripherals? What block control?
>>>>
>>> I can't reminder exact one. I grep some code
>>>
>>> [IMX8MP_MEDIABLK_PD_LCDIF_1] = {
>>>                 .name = "mediablk-lcdif-1",
>>>                 .clk_names = (const char *[]){ "disp1", "apb", "axi", },
>>>                 .num_clks = 3,
>>>                 .gpc_name = "lcdif1",
>>>                 .rst_mask = BIT(4) | BIT(5) | BIT(23),
>>>                 .clk_mask = BIT(4) | BIT(5) | BIT(23),
> According to the reference manual, these are three separate software
> resets for three separate clocks: lcdif_pixel_clk, lcdif_apb_clk, and
> lcdif_axi_clk.
>
>>>                 .path_names = (const char *[]){"lcdif-rd", "lcdif-wr"},
>>>                 .num_paths = 2,
>>>         },
>>>
>>> mask is more extenable and easily support more hardware in future.
> If such hardware appears in the future, it will be easy to adapt the
> driver. Usually we don't prematurely add complexity for possible future
> hardware.
>
>>> Change to bit number have not big benefit.
> It improves readability as it makes immediately clear from the code
> that all resets correspond to a single bit.
>
>> sure, I'm fine with the mask-based approach. The big idea here is to make this driver
>> usable in as many scenarios as possible.
>>
>> Philipp, please let me know if you're okay with the proposal. Will also have to tweak
>> one of the subsequent patches since, so far, we've been operating under the assumption
>> that reset lines are 1 bit.
> Given that the current code is already using mask, and if you think it
> is likely that there will be need for reset controls that require
> toggling multiple bits with a single write, I'm fine with keeping the
> mask.


ACK. Unfortunately, I don't have an use-case for this driver in which we'd want to

manage multiple underlying reset lines as a single one like in Frank's example. I'm

also assuming Frank doesn't have one either based on his previous comment.


Despite this, however, the previous version of the driver was already able to handle

this use-case. The single-bit reset restriction was introduced by this series. Therefore, I

suggest we reduce the number of changes and revert to the old behavior.


This way, we'll avoid reverting the patches if someone does ever come up with

such an use-case. I'd say the driver is simple enough that the code readability will

not be severely impacted.


Either way, I think we'd be fine with any of the two approaches in the end.


>
> regards
> Philipp
