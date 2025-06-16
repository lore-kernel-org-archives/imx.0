Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11B72E06CE
	for <imx@lists.linux.dev>; Mon, 16 Jun 2025 13:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079761; cv=none; b=GUGi6tnQRi6kNJ49q3L+ofEETmL0LjyaYe4PFqpO2Cs/dwkrlpNbnRqKsHsR6eygo57omnscXdkIxdpPE13LssCcVx2ki1dDCBTpxYBVKAGXfPIV++Hx3gPxWhnlXZp2BtkCtDmYVsW8XUsrspaxZuB6VJYhP8Fad2cIahLSfTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079761; c=relaxed/simple;
	bh=5hRzPTtmBcuXKvnr1u8SKXzEFc7yHR0Ah2bvFxcA2o8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=WbToxIO59CuWrveNvP4aRKni6Y9g1MKOx8xPPnEvmi/Yxo4wuu5Wk0FeWmaFA4juUJfKAncCQHnkAwl4vehmLnxRLffQanNQwbPrgBDxZnjkNJZCb4aYgPR/VMX59XKwY2gcaus+jeVpd+4nfMrPRS/2KD5MOnISvbR8FtHT4ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g85R3KON; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g85R3KON"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-451d7b50815so37453695e9.2
        for <imx@lists.linux.dev>; Mon, 16 Jun 2025 06:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750079758; x=1750684558; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MRJ1d1h4wdrkCI/v3DN5wRcdUPl+ITQvSsG/x26pFEQ=;
        b=g85R3KONidtVyh1PNaw+Trmt8LWv1hpuUfxiKWq8tnTJ+VbHdviPMx81ENIUgNAKBk
         LixRebdL9F5qISswwEN4Uix0K5Wc3/Y/BcHq1VUSApjPC5tTOptL58KbOra8ztEwdrcP
         udGvGhW0NyYXj50NHHE7cRMBj8Rp2lINRVGKGq6GalR00pbBNWFQ9M4PBwiG8WNTwv+E
         ruP2wrTakXfkWfspILfczdkK7LWIaaw7djmY98uacpVC7P21oVBCDQ8vytLH/sxQ5/iY
         H4CZoQdISENAwNP2zfbO0RnYN1W9kPzqvJA/bPp6wlu9Z3LChu/6JkW/oEI9sUi+rIJA
         cJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750079758; x=1750684558;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MRJ1d1h4wdrkCI/v3DN5wRcdUPl+ITQvSsG/x26pFEQ=;
        b=bAD/VYiUk2dZe34mdyUUSjOEp3p8GLmLDQkqtpxHIFm9CiDZpmd2fL0WRpFBp5d69s
         R1/y2oMuEBsq5hEX7W2JJVEEMrBsFc6NZowuS1JpOnlIxgCUDt4lOxYl35PDZ7JrmjsE
         HyhhyCxdAOmVtWTerzEklDx0aE0BhnogXK/cIXYv/cqiav0eR073oRCpVkkuhmqW5MRF
         Yorkn5uiDxsv0qY04IoHUtkX21FwWPljrmM+4vTTEvPYudZlpsSUkpffQ3GE/IZ1UK14
         zayc3aTFFYw8TYQJIkPDMAlY/mfNDtDnPHbQQ8ilFpmM9UhjWxD/9/SH/L7kYtwgcar1
         hckA==
X-Forwarded-Encrypted: i=1; AJvYcCUarqv/NkPrsDEqv8Z+BG3TvbjxQQvuyEu0qRYuGOlRbUs+uPA85XnHT1sJNwCHOYG6dyY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx71OyAbf19r4iAO7nW0uct/rOhdzF67No2K3KBnJuow+wuvIGY
	lzwSN9fs8PldAESUlHUuC/VIRWQfXi77rMOnoYLPuSUi2To+TjXoJC4EfhlxfJJGT/Y=
X-Gm-Gg: ASbGncsQTvU9HZlQkBOvoSDAsITKakKfFGjYvZng4YFDnbBehlWQ7Jise/tFQU8LG/q
	jPgumxia22UueKAhrXp8psnEO2ERk1bxo4RxpX2SfP8XeqnHt5MWLHb+jtJNKEIqCmx18DlZ8w0
	vYVaClKRObcId7qsPGsVBSMpXNX4Sp0v5EyHeMaOhcv3D4bQcB9DBkhfVGVhMBhQhv5VmAwsTtA
	mpMP+qNXUceiqzTvW02+j2fCAb+sgtql6C5Z37g9VPdCWllSJGHByNVOvy0ELmO/P1em782gv5p
	bmgwrlcerz0r1qZsTpzFYGvQB0zsBTR4geskUufbarAE41QEhlFG5pe3ZXz1s8iIWjU=
X-Google-Smtp-Source: AGHT+IGAmjzfqrOCVqwqF8zQeuRiuJlPPFK6JjwkpluH+DPJPa87BVcnTa2cfcWuNNx592BuRyZiZA==
X-Received: by 2002:a05:6000:2585:b0:3a4:fbaf:749e with SMTP id ffacd0b85a97d-3a572e99648mr7009457f8f.49.1750079758052;
        Mon, 16 Jun 2025 06:15:58 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45320562afbsm152625665e9.1.2025.06.16.06.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 06:15:57 -0700 (PDT)
Message-ID: <d16bdc40-20d6-49db-bf41-18bb9b8e01fd@linaro.org>
Date: Mon, 16 Jun 2025 14:15:56 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-mapping: Stub out dma_{alloc,free,map}_pages() API
From: James Clark <james.clark@linaro.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Mark Brown <broonie@kernel.org>, olteanv@gmail.com,
 oe-kbuild-all@lists.linux.dev, arnd@arndb.de, larisa.grigore@nxp.com,
 Frank.li@nxp.com, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev
References: <202506160036.t9VDxF6p-lkp@intel.com>
 <20250616111749.316413-1-james.clark@linaro.org>
 <20250616112927.GA21689@lst.de>
 <5f1ca0ac-b66c-4b92-8f69-027c2468b117@sirena.org.uk>
 <20250616120832.GA24959@lst.de>
 <2d62254e-5cbe-4174-95d8-e80cae4f4543@sirena.org.uk>
 <20250616121444.GA25443@lst.de>
 <7cfcf919-3c7d-4f0c-911f-697ea3141080@linaro.org>
 <20250616131346.GB29838@lst.de>
 <83855c1a-c128-4762-9d6b-e17f2c4c8820@linaro.org>
Content-Language: en-US
In-Reply-To: <83855c1a-c128-4762-9d6b-e17f2c4c8820@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/06/2025 2:14 pm, James Clark wrote:
> 
> 
> On 16/06/2025 2:13 pm, Christoph Hellwig wrote:
>> On Mon, Jun 16, 2025 at 02:10:40PM +0100, James Clark wrote:
>>> The change introduces consistency with the existing declarations in
>>> dma-mapping.h. Surely there is value in consistency and it doesn't do 
>>> any
>>> harm to define new ones with stubs the same as the other ones. That way
>>> when you change an existing device that has DMA stuff to use a new 
>>> part of
>>> the API you don't have to predict that it will behave differently to
>>> another part of the API.
>>
>> Well, redoing the rest would definitively be nice, but so far no one
>> has signed up to that.
>>
>>> I suppose it is possible to #ifdef out the DMA stuff in this driver, but
>>> IMO it would be quite messy, and I don't think randomly not stubbing out
>>> some functions is the right way to move towards fixing all the 
>>> dependencies
>>> in all drivers. We should continue with the stubs for now and fix whole
>>> drivers one by one as a proper effort.
>>
>> Does the driver even work at all without DMA support?
>>
> 
> Yes it does, it has a few modes that don't require it. Presumably we 
> can't just add a depends into the kconfig for all devices because they 
> might not be using DMA.

*for all the different variants of spi-fsl-dpsi devices I mean

