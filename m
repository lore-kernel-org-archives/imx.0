Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4EA29AB13
	for <imx@lists.linux.dev>; Thu, 26 Jun 2025 09:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750929303; cv=none; b=pjYKRr70v3sIPGXPpa/A/lJSRTKuCVCVM2Go0S9Of4SLETZpm5gjFYO5j/A2D+n99kGWae3GA0qun3vTYg+2qMUOvST/45XriBYkUZMq7fY7mrL6WdGT5CdOzikU2qAuozECBYz9mqlHyBANwjlo7mvwOah9YDELYYXWhFlxtRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750929303; c=relaxed/simple;
	bh=TXuQPqAg7S5oOsB/2JdDGDJQ7ANNmURcZvFDfmnEIH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WyBjs45aKU3K+pFiZyWuhtvDTmcB4eZqetJj86UHx+3+9VdB/f1jxmIASk2oiDHJNWXMTsORlMITB2r660aPmo3hyZyWzJEvHx6uDcbrvjMHc65rp84CNUt5S8xd/5W+/f+IWOjttk9/L2v/RxZQWFovrgSdankLjXWWG8xi6K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WtyC3VM1; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WtyC3VM1"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-453643020bdso6079275e9.1
        for <imx@lists.linux.dev>; Thu, 26 Jun 2025 02:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750929300; x=1751534100; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o6HELOLH5t63t0lxWsM9sFc0qk5UYWyQgDUSTkLl0Kg=;
        b=WtyC3VM1wvEViiZ3tcBq4gifB8NxqWvS2suQn1t0KIw+7eYz4yNI0z7i6GxkwWxNbO
         oHtXnbk0Xpfb1bwEQt9ZLX4gg0LTI50iNPmnvYy3cHm91SiIgeZafFGEBzlcyE1XJrC9
         ebD6MN0NiwgwUnYdgaAs5jZuVaywZGAvRqycwG0KPWH2cjCn1yfr6YV+5qXklgeYR7bz
         hcwqnlyAcOt3xpQoMdhH7j0kzn066HM+fdN3yrQW8fkQ/I58fXvEPf04KBM1khltVp0s
         A/tnzL6lBsIo8uKQdRXmqACgvIyhgIzEEc1+L4PTXShotX2DoMiXFfOg5+dGJyTj2RKV
         NoAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750929300; x=1751534100;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o6HELOLH5t63t0lxWsM9sFc0qk5UYWyQgDUSTkLl0Kg=;
        b=oRj71/GAZTOhoJRQJ9qUc2yVeaXnDfZh9zRV8WWOgNudG5BC44afdWYf4A8XTahIvB
         +7FVZ5me6vtP2Bwy8sGXRm3D8JaMwf3uNVKWeZonMZfM+mUY5J3SaHBbzNadZujSPXyL
         akw1kRtMZjtKhkCrYilCCY3vlwTVvXgd02C4jpysTLHzUJXAs3UVdR4gvr505mENpylx
         mKX3Ti69D7otogH/FKfhXZNDVLXg1POkv+KqO0WgejzPBuT6mntn8io9sBDubA0nQ3K2
         I8LJAVZYSsnFYbz+FIUNVwfO3sThN2wP8IzipiB7OdalNxQruj3dn4CZI3jCJD/BS5je
         o84w==
X-Forwarded-Encrypted: i=1; AJvYcCVGMJq6ammHRM7u2Ds2Ark1o0rE9eIs6lQnjiBpYTP92JDNzOvbCfO51KHnnn70lSrpyP4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwE+YPrpNBUhyTiF3s701DjCCFxR7ZEb85GxnwnHvCK6dxq0iAx
	I2CwFPotroC4/gNEag1d99xH8OIN4o71ko6RwP1a69i/Xp64MeWCkQbj3Ce0qsRMezU=
X-Gm-Gg: ASbGnctitb0st+dAVeYsa8HYvRnMWSL0vIDuq67/aig3X5Jf0iMc/f6q9UmvTZMgBDZ
	mqZK43CUUA/ZdUrIO3qV8oyDqCE5uC7Fk6ZRaNsoG0JFi030uHeNyr0At2p7tTAZ1QrzmKg/hJN
	X/QF6cl+yA1BeL3BvxWEWtygEczndHJr8giKFKbj8Al/fd6PznEzC9reJRqCA05/K2mm+gC9b6e
	7cIG2lsHULLWWyC7JImpzC+Xgjk22JgdJPeDeHOwQHSB4Kz8LOYadBDuzEB75SKhV6ZdnTDba7k
	q21UdP6SpFjqWZo5WJRxLNbeeTfhTTIQ9t2VpK2nt2iHnAM0nyeVdqk3haN9QzMdiRc=
X-Google-Smtp-Source: AGHT+IGu1qpUTz8c4jWhNCy48sK61OzHT2aoxKhnMhoAC1djW2eREuQnj2r7lzI78n8bzCS1SF6OaQ==
X-Received: by 2002:a05:600c:c16d:b0:441:ac58:ead5 with SMTP id 5b1f17b1804b1-45381af23bfmr65504065e9.31.1750929300374;
        Thu, 26 Jun 2025 02:15:00 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c1easm43399545e9.3.2025.06.26.02.14.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 02:14:59 -0700 (PDT)
Message-ID: <6fe9eebc-b050-4b12-a28b-e2f0bcc707e2@linaro.org>
Date: Thu, 26 Jun 2025 10:14:59 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] spi: spi-fsl-dspi: Use non-coherent memory for DMA
To: Frank Li <Frank.li@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
 Larisa Grigore <larisa.grigore@nxp.com>, Christoph Hellwig <hch@lst.de>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
 <20250624-james-nxp-spi-dma-v3-4-e7d574f5f62c@linaro.org>
 <aFrUqW0ijRt7CJzw@lizhi-Precision-Tower-5810>
 <228fc6f7-52c2-48a8-af7e-6f2cfa7b9168@linaro.org>
 <aFwQCL0tQh9peb7x@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aFwQCL0tQh9peb7x@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/06/2025 4:04 pm, Frank Li wrote:
> On Wed, Jun 25, 2025 at 10:00:41AM +0100, James Clark wrote:
>>
>>
>> On 24/06/2025 5:39 pm, Frank Li wrote:
>>> On Tue, Jun 24, 2025 at 11:35:34AM +0100, James Clark wrote:
>>>> Using coherent memory here isn't functionally necessary. Because the
>>>> change to use non-coherent memory isn't overly complex and only a few
>>>> synchronization points are required, we might as well do it while fixing
>>>> up some other DMA issues.
>>>>
>>>> Suggested-by: Arnd Bergmann <arnd@arndb.de>
>>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>>
>>> In https://lore.kernel.org/imx/c65c752a-5b60-4f30-8d51-9a903ddd55a6@linaro.org/
>>>
>>> look like less performance, why need this patch.
>>>
>>> In https://lore.kernel.org/imx/ad7e9aa7-74a3-449d-8ed9-cb270fd5c718@linaro.org/
>>> look like better.
>>>
>>> Any conclusion?
>>>
>>> Need performance gain here if it is better.
>>>
>>> Frank
>>>
>>
>> Hi Frank,
>>
>> The performance figures for this set are in the cover letter. It's either
>> the same or faster, there is no evidence of worse performance. The one you
>> linked was a bad result from not testing it in DMA mode, but it's corrected
>> later in that thread.
> 
> Okay! you need mention why need this change, why non-coherent better than
> coherent at your case.
> 
> You descript what you already done, but not descript why need it.
> 
> for example:
> 
> "fixing up some other DMA issues", what issues exactly?

I can remove that line, it might be more appropriate to add in the cover 
letter as it's relating to other commits in this set.

> 
> some benefit, like memcpy from/to non-coherent is faster then from/to
> coherenct memory ...
> 

Yes I can mention that it's expected to be and was measured to be 
faster. That should help people running git log in the future to see why 
we did it.

> of put test data here will be appreciated.
> 
> The cover letter will be lost after patch merge. When someone run git log
> after some year later, they need know why need this change , what purpose ...
> 
> Frank
> 

I somewhat disagree with this. Usually maintainers add a 'Link:' to the 
mailing list when applying patches, so the cover letter shouldn't be 
lost. And these particular performance test results are short lived, in 
several years time other things may have changed. The performance is 
related to a specific device and the state of the rest of the kernel at 
this time. Additionally, I mentioned that it's the combination of two 
commits. In order to put figures on this commit message I would have to 
run another set of tests with only this commit and not the one to 
increase the buffer size which comes after. I did consider reversing the 
order of them to do this, but it wasn't straightforward, and I really 
didn't think it was worth the effort when I can just put the figures on 
the cover letter.

We only need the figures to judge whether to merge it right now, readers 
in the future will want to read the commit message to see what was done 
and why. I'm sure that they can trust that we measured some improvement 
if for some reason the cover letter is lost.

It's very common in the kernel to put figures relating to an entire 
patchset on the cover letter of it, rather than on the last commit message.

> 
>>
>> The reason the figures aren't in this commit is because it requires this
>> change and the one to increase the size of the buffer.
> 
> 
>>
>> Thanks
>> James
>>

