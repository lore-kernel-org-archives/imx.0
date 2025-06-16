Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDB9292B2E
	for <imx@lists.linux.dev>; Mon, 16 Jun 2025 13:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750079445; cv=none; b=qq8tBP6lqCcKi6AeNCFgMF3udQVOJH9bq3mudSy0mj8Rng5sDzM3u6YLr8T4d0XoE+IMyr9zsyP7KcTO63zPyw4joweKobxpE3CxPcCaDee8MK8vLT5YrUrBTgxTVNNsZ2rGCKFmEw3Y0pFmsPCVP7V0YiMberGpaG8796hqfUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750079445; c=relaxed/simple;
	bh=pFqG/js0pAlqzBZAvPKECVmOa3/ZW9gFrsfeSebvWj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g1i6msGSo/LEFtYmYgMZXxE4jl6ELr/yUEPaPaI2FKKqojtGqPUNVs6lCkjoInA/6/wlObukuQoohCsg3Pmim5GGzk9WUYO53NMsmWcjut+DvINJTg/rzJbwdmpUrO2rDiwgzKM+kvgZO+5OkbJbPagsjPby/haD2/+FnW74zro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uBqQW11L; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uBqQW11L"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a35c894313so5118465f8f.2
        for <imx@lists.linux.dev>; Mon, 16 Jun 2025 06:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750079442; x=1750684242; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x1cp+4QPv/1PUyqDV9F6cY2KZxx/RBlLdAVmrPE1MfI=;
        b=uBqQW11LcQNWPq85EvmQfqmCKqt7gvjzxZvP8ntBmn80Xu++r0gi7xqHbwoJBCnxbg
         VJLtwJoWpC/oJsv7XoAocb4AFdhUEMpPCESSMQEsbxfX4Ks37YKhNBG48zpDOf5nNE4Q
         TUgHWRh8UqLP1Q+AQUCYRpDo29ph8NVPlVwkbR1GwwbowQtmQvnxPoZ6UF1tw2KecamW
         pA5gtq/nKBVeFwMapa7EiiKSlqQ/ygFD9VJ28GGi/32KeG4alWTe90WnkdjBqa5WG5Ko
         Vy68v5bQPDVLjiGBx8UhFHPHC5iKsFubmcv+iZxKQVynbDLb5WrPaSBLNKn0v2Q5DYVA
         cqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750079442; x=1750684242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x1cp+4QPv/1PUyqDV9F6cY2KZxx/RBlLdAVmrPE1MfI=;
        b=VqneoqmbY/xQJr9r+5ZGpprOP931KIdCNklLsvy1E6KxUXblh3ZkmyOMFxd40ckWBQ
         Ha9nm6HfZ179252HFl7amwpS5gxH0sFwH0T0rQ92atzpT2z8UpeA2yVxCXjh3CS1OrIA
         9ckM9Rxle3oLbhAV7bTR0iEhqu2/XXVf2HXJ46rNdPHlWMpEXRVZOLJHmkckBn69jN6L
         dQbqK5pwR/BRniNLrqQ4pNbHZaNGbvwyGYAz+Su46jLTpy/1qKTisFcDA+47XgtpiqqX
         stGMKsnztmtix2SvV5DLbV5oqAjPuVJFmTLv3fDzg9REWlsJ+ww8j1STw4L5wWRc2LUR
         yQZA==
X-Forwarded-Encrypted: i=1; AJvYcCWPLWAtgTsraGBg1+62WAMZEEtSIxS2mgNHoMYebrNVrmmwGfdoHOJIeJRX2+7c73ty8tM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZa7LMlbyqvut/rOS1FYm7BQfWZ94pjcwEHvFE/1LiUlIenRMm
	kpLJ79UasLt+g9+NrcKzGmckRxrcbDJzZVJUahvRsNfJ76DfsVu8lY3Oh5B9EvEuDOE=
X-Gm-Gg: ASbGncsBeIJZLREi7W0MBZymGeU9xtvCU08Iaz54AP8ZI9hYuI277MclcpHz0jMbG5R
	hFFaqEYy/IB0LuoNAtQLcAoIvfr7tYsXVYNT1Uje1cLFnN7lqq4GP3Y9wEPVP85O9WAbD4lQD/N
	iqqP4MhGVxF26gPkv0rI8zcwv9912V9rgRbveFWny8t1VkqTmwWSMPHerwb4sVg0Ms0RwnOONhy
	31sBs72/TvqRk68l7X5H/CcB17Icqjnxn5lzZoDVUXth2Do7dnWG8jKobZo7ZDhqECnxYf3cnNz
	Tf2sbQR+plzqx6JJgC3CGrkLeFeptaC9g0ExxINDRVBmovYJj95jZuYI721erctnJYc4rSYCVot
	dVg==
X-Google-Smtp-Source: AGHT+IFNHg0hyF1PNKI8qLbgZNCoz4YroOmMfvQ93hu1uR9eCFCC/xZl5Wbo20JN2FbWxFzP2HZ79A==
X-Received: by 2002:a05:6000:4284:b0:3a4:e6e6:a026 with SMTP id ffacd0b85a97d-3a572e6bb83mr7546401f8f.28.1750079441882;
        Mon, 16 Jun 2025 06:10:41 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a54aeasm11271121f8f.14.2025.06.16.06.10.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 06:10:41 -0700 (PDT)
Message-ID: <7cfcf919-3c7d-4f0c-911f-697ea3141080@linaro.org>
Date: Mon, 16 Jun 2025 14:10:40 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-mapping: Stub out dma_{alloc,free,map}_pages() API
To: Christoph Hellwig <hch@lst.de>, Mark Brown <broonie@kernel.org>
Cc: olteanv@gmail.com, oe-kbuild-all@lists.linux.dev, arnd@arndb.de,
 larisa.grigore@nxp.com, Frank.li@nxp.com, linux-spi@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev
References: <202506160036.t9VDxF6p-lkp@intel.com>
 <20250616111749.316413-1-james.clark@linaro.org>
 <20250616112927.GA21689@lst.de>
 <5f1ca0ac-b66c-4b92-8f69-027c2468b117@sirena.org.uk>
 <20250616120832.GA24959@lst.de>
 <2d62254e-5cbe-4174-95d8-e80cae4f4543@sirena.org.uk>
 <20250616121444.GA25443@lst.de>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250616121444.GA25443@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/06/2025 1:14 pm, Christoph Hellwig wrote:
> On Mon, Jun 16, 2025 at 01:11:49PM +0100, Mark Brown wrote:
>> already tied to a platform that needs DMA needing to add the dependency
>> which nobody is going to notice without doing build testing for
>> randconfigs or similar non-useful configs - it's not a productive use of
>> time.
> 
> Stop your unproductive whining and just fix your dependencies.

The change introduces consistency with the existing declarations in 
dma-mapping.h. Surely there is value in consistency and it doesn't do 
any harm to define new ones with stubs the same as the other ones. That 
way when you change an existing device that has DMA stuff to use a new 
part of the API you don't have to predict that it will behave 
differently to another part of the API.

I suppose it is possible to #ifdef out the DMA stuff in this driver, but 
IMO it would be quite messy, and I don't think randomly not stubbing out 
some functions is the right way to move towards fixing all the 
dependencies in all drivers. We should continue with the stubs for now 
and fix whole drivers one by one as a proper effort.

Thanks
James

