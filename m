Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC44270557
	for <imx@lists.linux.dev>; Wed, 25 Jun 2025 10:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750846763; cv=none; b=HoVIWYEg8Fud0f1rzEcy6ydPWludqd7NOe8ms42NdA2rKfrFeD1vx515jNaJUCI1W2mQRqdm6M7B0r42XMN9wioKmfpsgvmo5HXZuhbgXWB5qByOQEWR1RR1C5GUoHglBNXbniyZDDCtG/RL0mHZNsZFSoaYFbMq4nWl3Ey7jXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750846763; c=relaxed/simple;
	bh=rETTiKlx9Yq3+PDQAIMBB+ZMyTfACLEpmK3go+sZBpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Weexz+UaP6m3JNvpnrD0bkgTn3uAg5fhp+ISHJ/yOTB3HHhJbqu7RavAqAa4Ef3mlEwFTxFiYJVLvjUN5nA6lzXb1I6XyHe0d5gNP2DhZVGj3ChCGsdWBYuAUwW9HFN0oRWi53x5VWjKXI6gNnTI96V2UnWrVMWdHTst6pt37rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m9boe9Vm; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m9boe9Vm"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so1005490f8f.1
        for <imx@lists.linux.dev>; Wed, 25 Jun 2025 03:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750846760; x=1751451560; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Ll2qquLfGh6XGelYBblYLwfpUh2cahEoEgX9BFfgbw=;
        b=m9boe9Vm1/vpqpZWSDcSnv8bEAfaULrLIFGHNjxCEytFTv5GkjbU+e4nuBFjJGqv8z
         gpCW9GsUsJa90pElUXS865pOo5kONVBzLGjPgLXN6K3bZpFCR7N50vuEpWPv0xERWOjU
         yTRPII57SAAT1MY/PECnVPrdWrLy2g8nIYPD3xrDwpdLUBjecdXPQ2f3m+CZ4LPBhigk
         nxax9/ByM26Ww6Zh4zENJMOnvAbv0wFyE37KH8GOfNm3g7im3CH9+RPw8o9yggO8rORU
         MY2IPNBaL1ajlVyDqTHwvmA8xdsr8NAhck5Cc3kHGE60fguriDocNSEoIzqQy0O4TeD2
         6kOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750846760; x=1751451560;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ll2qquLfGh6XGelYBblYLwfpUh2cahEoEgX9BFfgbw=;
        b=EPoBZ6eusOEuY4dheNf1pbYNquf3fhdWccH3bgKVpB8s//WXY9rK8wweQ8pJqrI5Ci
         vX8XTiURx9kJ83KGkyndaBSvZ552om2N8UwJZFm2sWGJtFETsckkFltoZnvSRZl3ML+M
         n/I+TbcANo+2Ap91/QbmRlhyWWHyoY7JrS/MmZoIdi47ChN9bHrEmvQlBKP6nHuss5mv
         XD+Tb3Mq+QpstwJrW1uBe/RlIYRzyJoNgx6O7eg8ZZ306lyK+trXfSOA1fKLctK/FcfN
         9cPg8sdEC2pOwAvHuxK1haRHPsetoDRwi+brSYACb01wQswFob2U7HEE5vtzRlcKEd8y
         Qhkw==
X-Forwarded-Encrypted: i=1; AJvYcCU+hfudo5RiQYe6m3ZiTeF2EPBNbVULbh/dY0T87Dp1PxOenlm/1LVZKMYyry3iQANykmk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIkHRPZIsrPvnjnwCFwMDB7OS0259SszqQFYAKvPukRb2YsZtM
	ZAvqRinOyc+68OWkJhpRMeYzu2McCr3y8jMUjOopa972jEhoniFz3c7u7Qg7UGKJFi4=
X-Gm-Gg: ASbGncuwdo3OcV+IKHisDtZC9Luqn7iKSbwSH7qAY5aJOQ4K3n/eI2RJey2EQC/flxw
	2FXqAxISH+/pB6mDpkvCVhtcH3yAzdz7T+UNxW4rpwa67gMlBg6O/vy+QnrwZImyX5QIskWyg+L
	AlXLU51ZBUpUBm/wViT9W8VUCra1rKt+eIznCK33N73OFnMJTxjwU5sg6F2Mt8rwkFGHS26mXEm
	6prDTpuu/l/OFiMiLHAe0S5bi/qkaAlTfgBkFUwfWcvhS6RasJ+I/EF7/p33bP38Sn7NdzSEYfS
	SPFoRKAtEGDh+FQMCgpf+w8CDhF6VfGHnzwXNZBbVF+Q1FE6twiSF+/Rvkqbn2DNbo4=
X-Google-Smtp-Source: AGHT+IG4AQnRsnaojqWPjOdW6AAh68yC766lGy7h0in8xaHoSs5FdnvmUELehZ0zifBrriq6WAa6Wg==
X-Received: by 2002:a05:6000:2c0f:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-3a6ed6746a1mr1929543f8f.52.1750846760466;
        Wed, 25 Jun 2025 03:19:20 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234b1b9sm15217565e9.11.2025.06.25.03.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 03:19:19 -0700 (PDT)
Message-ID: <884e86be-112b-44dd-a827-30355a5fdba6@linaro.org>
Date: Wed, 25 Jun 2025 11:19:18 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] spi: spi-fsl-dspi: Stub out DMA functions
To: Arnd Bergmann <arnd@arndb.de>, Frank Li <Frank.li@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>, Christoph Hellwig <hch@lst.de>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
 <20250624-james-nxp-spi-dma-v3-3-e7d574f5f62c@linaro.org>
 <aFrSgJ5xZfccEX9x@lizhi-Precision-Tower-5810>
 <290fc244-e88f-47a3-8dd3-0ec27eb5c60b@app.fastmail.com>
 <0c6c78da-575a-4d29-a79a-3903aa801b42@linaro.org>
 <0f904f12-295c-48fe-96c7-c64c461cdbbd@app.fastmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <0f904f12-295c-48fe-96c7-c64c461cdbbd@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/06/2025 11:00 am, Arnd Bergmann wrote:
> On Wed, Jun 25, 2025, at 11:19, James Clark wrote:
>> On 24/06/2025 6:16 pm, Arnd Bergmann wrote:
>>> On Tue, Jun 24, 2025, at 18:29, Frank Li wrote:
>>
>>> It would also be simpler to enforce this in Kconfig if we only
>>> care about users that use the DMA support.
>>
>> But most of the devices supported by the driver don't do any DMA. That
>> was the reason to stub them out rather than add the Kconfig depends.
> 
> Ah right. So even when running on SoCs that have a DMA engine,
> you can end up not using it?
> 

Yes

> In this case you could have an extra Kconfig symbol to configure
> DMA support for this driver and use that in the source code:
> 
> config SPI_FSL_DSPI_DMA
>        bool "Use DMA engine for offloading Freescale DSPI transfers"
>        depends on SPI_FSL_DSPI && DMA_ENGINE
>        help
>           ....
> 
> 
>       Arnd

Wouldn't that allow someone to break it by disabling (or not enabling) 
that option? The driver won't fall back to the other modes if DMA isn't 
configured, it just won't work. In this case it seems like it's better 
to depend directly on DMA_ENGINE because that fixes the randconfig 
issues, which is the whole reason for the discussion.

Would someone really want an option to disable compilation of two 
functions if their DSPI device is one that doesn't use DMA? Seems like 
this option would always be on anyway.

