Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B8A248888
	for <imx@lists.linux.dev>; Thu, 12 Jun 2025 14:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749738914; cv=none; b=qtkXSDsv2PfTCw6FfcB6AZwjFH7AufYlGnFaBbJnYBnEhoYAjVg4xHBWCdye8wshQEgJOrPydMXJIp4hzycYLE3uLjvVQXEFMwZJjB4zVfbDoAMhVitinSd/ildmTEIA8Vne3HmqaBBN6Nh8Z6ruLDE3BAeP7WoA1Qm4jxbP5NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749738914; c=relaxed/simple;
	bh=jNAynF8yzo2MaHHQ97XS4c/zX3UfIyeqvS8JmkGhBDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DgW1CBHDuWmsAs0HwDLIPFauHOm9EAFmNiX4VMWxCFfXKBCsK1ngp1apkiKGjc3HDaM+VX1n5sksaCHmQlzXawyvdlxLpCibhD5DjtfnV3TVeh8+glhCNu0qTig4gQ/dYHj1eeX8rPeV17CoOVffDNYNDa+solMKRvSDKK+XOtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EnlmL4sr; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EnlmL4sr"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4f379662cso935949f8f.0
        for <imx@lists.linux.dev>; Thu, 12 Jun 2025 07:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749738911; x=1750343711; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Islg/EqCEkW8m6OOg2kXY87sZ2v1kaNiGQHTKgHcYDM=;
        b=EnlmL4sr9u+lBWQDsYH8YH9ftjLFBwzpPkvl28f42igVCJTyafegYiQHjA63Jf0W0z
         oLmdIHLg4VmSE8cbeepsSO2P5TvSw5n68BXR/0LxvidWkxCIryhsA3vArAMkxV9tNMi5
         AoRdBz5gyvIiSt6BpBIUI4RqAGaZDQVzTrdLx/hsBmHTXdzQteVGWkhMtGF1Ydqr7bog
         USN+6ANbMERq1vo/XLBAg4agwjU4AQXPRfbBNzxYZb0ZfreFdW0vjqGeo2nwbEkqIlWa
         trIfYMKnOkGekfepYGDmwfMVLQRaGAILhQZ7HtRJtXZupaxC+fORpZAVX+JQjH3SLP4i
         QJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749738911; x=1750343711;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Islg/EqCEkW8m6OOg2kXY87sZ2v1kaNiGQHTKgHcYDM=;
        b=Xy7fBs91yq8fTXxIfD4TwOdgSt2Yr73hCWPbMpgp6Gga2w+hHWoQe7O3Hn6HVwmzAe
         wMenn8qdUv9mWeE/WzrqXoi2ELP/u+6MuTQ/sE7hpsRWLTzthcq9856FwLaCfHAC5Y3D
         agihUJv9YqrYXcDd2CUj8EoVklfapAjYZSp/FMB2omKMRPO7kkNPqFzD2+ccjTUxSWy5
         AInTQsZ2lsBcRhXSffjmdNQjYWekIim4rVbjXHeVkRd5l3X5OyDne04O847WenGLU9cq
         LPtd7BX5iMc35G82SafAA/1WbTFuDmtRtJF/jVH0cTslRyu5fD4xCyjNGGqRBBBhq+f2
         PDzA==
X-Forwarded-Encrypted: i=1; AJvYcCWXidFXumbKYBsQcqCZlyR2Y4mrqR7WGM/um/SJ0muSZEl1YzITaREkN3W7rZDDnHHCVgk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQORLBDs9GazDwCnPjzdP/O8UG/w5cJfzsrlE/JEktBemq+Y4S
	cDyc4gNpby8HjbpAaZL0mcGNvDYphKn18Umhmkv/ITiFOl0b6w/aIgdkkxo4Jk9mo/E=
X-Gm-Gg: ASbGnctOYqBlIkPiNl7dCECdBW8Evwqzdoa9UBQwKPGYuwm2UEcNUYu55E8efvvhStx
	AdPCxAh8xO3SGqgBQc2CAl1NySGlyRXsHSBvcIAC6Snowzxc2Tjna6qy+eE20mxkWfJJ6OuBgwu
	y4lAef0qqYmIVYI/CeiD8Kg2iYLYHre+St/2DuCN0gmSnR4Bd77QU3rmGW4FfeKgmus78cj6nSR
	7p7trrI0CCoNt/koPAdHA0Y7D+v/He2xJD93W6xhvLIM40TxdnOtiTcxxMABzkKY/Gm4LcyK50Z
	jE8KgpyiUlDfaJkC+d5G7xap0mdxQCPoiji3qM0PU0fgwBW4eXUqM+A83xvVjMAkw8M=
X-Google-Smtp-Source: AGHT+IHGD+FKI853WgGp5aiNF/V4TxjRvLR3P42qPzeJbmR1YHKdgcN+H9zGrdpu4QQZKKNMIaFVqg==
X-Received: by 2002:a05:6000:4313:b0:3a5:1471:d885 with SMTP id ffacd0b85a97d-3a567a2b4camr116503f8f.56.1749738911096;
        Thu, 12 Jun 2025 07:35:11 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561a3ce55sm2162802f8f.65.2025.06.12.07.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 07:35:10 -0700 (PDT)
Message-ID: <31a16580-e3ce-4cc8-8310-04a0dd292df5@linaro.org>
Date: Thu, 12 Jun 2025 15:35:09 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] spi: spi-fsl-dspi: Use non-coherent memory for DMA
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Frank Li <Frank.li@nxp.com>,
 Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250609-james-nxp-spi-dma-v1-2-2b831e714be2@linaro.org>
 <aEhMBsqlx9I4XqJS@lizhi-Precision-Tower-5810>
 <de7142ac-f1a3-412f-9f00-502222b20165@app.fastmail.com>
 <aEhVsrEk0qv+38r3@lizhi-Precision-Tower-5810>
 <20250611090107.t35zatn47vetnvse@skbuf>
 <c65c752a-5b60-4f30-8d51-9a903ddd55a6@linaro.org>
 <20250612111514.rfb3gpmlilznrfxs@skbuf>
 <ad7e9aa7-74a3-449d-8ed9-cb270fd5c718@linaro.org>
 <20250612142306.3c3dl46z326xvcud@skbuf>
 <5b21c4c9-0ef7-41e5-a3bb-5a48a0c73644@linaro.org>
 <20250612143157.bu4vayvhieohdtbu@skbuf>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250612143157.bu4vayvhieohdtbu@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/06/2025 3:31 pm, Vladimir Oltean wrote:
> On Thu, Jun 12, 2025 at 03:28:37PM +0100, James Clark wrote:
>>
>>
>> On 12/06/2025 3:23 pm, Vladimir Oltean wrote:
>>> On Thu, Jun 12, 2025 at 03:14:32PM +0100, James Clark wrote:
>>>>> That's why I don't like the DMA mode in DSPI, it's still CPU-bound,
>>>>> because the DMA buffers are very small (you can only provide one TX FIFO
>>>>> worth of data per DMA transfer, rather than the whole buffer).
>>>>
>>>> Is that right? The FIFO size isn't used in any of the DMA codepaths, it
>>>> looks like the whole DMA buffer is filled before initiating the transfer.
>>>> And we increase the buffer to 4k in this patchset to fully use the existing
>>>> allocation.
>>>
>>> Uhm, yeah, no?
>>>
>>> dspi_dma_xfer():
>>>
>>> 	while (dspi->len) {
>>> 		dspi->words_in_flight = dspi->len / dspi->oper_word_size;
>>> 		if (dspi->words_in_flight > dspi->devtype_data->fifo_size)
>>> 			dspi->words_in_flight = dspi->devtype_data->fifo_size;
>>> 		dspi_next_xfer_dma_submit();
>>> 	}
>>
>> Right but that's before the change in this patchset to use the whole page
>> that was allocated, hence the next bit:
>>
>>> And we increase the buffer to 4k in this patchset to fully use the
>>    existing allocation.
>>
>> We were allocating for the size of the FIFO (multiplied by two to hold the
>> control words), but dma_alloc_coherent() will be backed by a whole page
>> anyway, even if you only ask for a few bytes.
>>
>> After changing that to make use of the full allocation the FIFO length is no
>> longer involved.
> 
> Ok, I haven't walked through patch 3 yet, I didn't realize it would be
> changing that. I will want to test it on LS1028A.

Yeah testing it somewhere else would be good. Maybe there is some 
limitation there about the max size of the DMA transfer, but I didn't 
see it.

I realise the tense in my original message may have been a bit 
confusing. I was mixing up the existing code and proposed changes...

