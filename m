Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7C71F2361
	for <imx@lists.linux.dev>; Tue,  1 Jul 2025 15:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751382540; cv=none; b=LRn0PzpAI1Ur5IPlJs5JaXbuzXl7XyhPUYgEV/2dmKi6xP94G2X2EMedyohstmWE9s+G70VDzUlzhiFoKsyguvFcZ5+h6byZChyq9IYcwDuKEkz+0Iww9qSlP7kaWXUo9WLXIqsE1iSCo1YFLAs5TYdDshAY+YVpqFa9zp8sHqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751382540; c=relaxed/simple;
	bh=LygfmcVRSaPOsa8+C2yvEY4RHbClFgk/DP5RCPz6doI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GZqYG/zcTXiXFCS2Q41webWxnSzlEoOxkc38LhLNkMU89WolbLd3vdJB60JvCpi4d6T0mfwy+V84PaWbE2iZuI7ckQfV3DoJ6QP6m0EFbp4ICphELaHUhDAjMisPfS9aLostmwS7EeJQSIsqxjalv0MF1Wg5qNUV2RWxt3Iwnxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sy0WST8O; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sy0WST8O"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a6f2c6715fso3705745f8f.1
        for <imx@lists.linux.dev>; Tue, 01 Jul 2025 08:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751382537; x=1751987337; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H4YWJf36Jd5Za5bEQzBkDardDPxHz8Phk46tA5vnrP8=;
        b=sy0WST8Oi93wXh7FMHk8dz5wOQdgM2L2zhJMy8VwFzP/rLY4lgbpXO05aJCw4++M6l
         Facyfgz442+ynQ5m88/hAj6krb0mFqXk1+wSAAJErANMozlR6cZOzJ3ot9df5qSKcWwP
         rcsPCfRPFscUOmmNfU6jIYMc3M7TP7RryYbUoyatBoKkIpQ/y3tm9+RYWCeAjbWA1Rok
         om/e8RG8WMZbPzdTK+15stsVbeZUbN1h4p8wwBa1Xy3rh1q2L7xFim5qt8yMJNb8GItg
         Jb19ZNDRZdvKuU5bsrbA1lk7mJlKWAMTVxV9Wahc133QRSa4Rq9y3X74aih2SCfdFNQt
         akiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751382537; x=1751987337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H4YWJf36Jd5Za5bEQzBkDardDPxHz8Phk46tA5vnrP8=;
        b=YTtDWkEn/oQz4qg9Mk8PhMov3+Saw2Hh3FiK0vB2ZM5wqcq7aZSZ8JTcHYTJb/OwfV
         OcCCvW2ne6nI0DPGkzyCnK7T5gdFsUphz8RDwfscziVlh1h5jGV4WqpXEefxwj5tfOZe
         g/oVYy/4KrYvqUoZBIy4cXmn26ZSjGOE5iFpNTQUku6Xa1rgrTnevVHkmyc/qZVQSRyu
         yOFy326YL+DXD+jTaZFiPrKhszFW1+yhpxq1Pbo94ntNKQc3Us/JEJ3PmQUK3Yg9o/sT
         Icwtu6OdSgIZzUgjzvpFdEDxXvsL+3NlKqk5IprUE6RzUga1JIDKaLkPBVePOx84C779
         pCXg==
X-Forwarded-Encrypted: i=1; AJvYcCUfmY/5L9FrhMo5u9XppI8igO+d3Uvb5+tCOaaqA4/j+t5wYGoqbcYeIh4NLrneaIq0eQs=@lists.linux.dev
X-Gm-Message-State: AOJu0YxeBptlYJ4pITlTUvs6dRWIhZJ/HMYEcM5aV6xsWGcQhou8fi8y
	XRxFfLXYwllALpUd93bWrWN78cNVjHD03a52TATDbYWMiynZVV5y3mtnzHQiAc/LirI=
X-Gm-Gg: ASbGncump1BovaPCpK2AgU+PrChEbqGqvMhy8hZkF3DNoazKh3L9t9Ge+niS4DayRkt
	PG8vNn9EnxRPkQkAkdx1U+geZi49EL0r3JonN+1BvLCTxTIXTNiUCtZIX+K0tiQMsfewyEfX/it
	ZvCf0YvpjVNqBPI+t0Nebi1GF6BcJH6+bPlkWitF+8VRFS3VDyKKrSHfkYYAXX4KXsEwM3JEDKW
	+K+LFbOPx1VEfXPrqDU9RmPLTnhbTI/3kimw4Vli654FTBEDVM3SGjnywCISdqaYKeruSofLvch
	fPOXUdhhY93BlF9oaprNT9u4oPaCJb7QYMpTM7dO40J1Vn0l5hWcnDCfClxEvCMAp44=
X-Google-Smtp-Source: AGHT+IEbIjn4wdPBC/r5LoH/ZIV7Nx4cdgbX0q9FVgHuQEdOsmJoG9kbU5u7jAyd+uqc2CbplXsd9Q==
X-Received: by 2002:a05:6000:440f:b0:3a3:6595:9209 with SMTP id ffacd0b85a97d-3a8fdeffb3emr9901767f8f.36.1751382536969;
        Tue, 01 Jul 2025 08:08:56 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a87e947431sm13537193f8f.0.2025.07.01.08.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 08:08:56 -0700 (PDT)
Message-ID: <019e182b-2830-4325-8c85-19041afd40f4@linaro.org>
Date: Tue, 1 Jul 2025 16:08:55 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] spi: spi-fsl-dspi: Increase DMA buffer size
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Larisa Grigore <larisa.grigore@nxp.com>,
 Frank Li <Frank.li@nxp.com>, Christoph Hellwig <hch@lst.de>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250627-james-nxp-spi-dma-v4-0-178dba20c120@linaro.org>
 <20250627-james-nxp-spi-dma-v4-5-178dba20c120@linaro.org>
 <20250701144711.hfcgk7hhk5w4jmvf@skbuf>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250701144711.hfcgk7hhk5w4jmvf@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/07/2025 3:47 pm, Vladimir Oltean wrote:
> On Fri, Jun 27, 2025 at 11:21:41AM +0100, James Clark wrote:
>> diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
>> index e7856f9c9440..46d3cae9efed 100644
>> --- a/drivers/spi/spi-fsl-dspi.c
>> +++ b/drivers/spi/spi-fsl-dspi.c
>> @@ -493,6 +493,39 @@ static u32 dspi_pop_tx_pushr(struct fsl_dspi *dspi)
>>   	return cmd << 16 | data;
>>   }
>>   
>> +static int dspi_dma_bufsize(struct fsl_dspi *dspi)
>> +{
>> +	if (spi_controller_is_target(dspi->ctlr)) {
>> +		/*
>> +		 * In target mode we have to be ready to receive the maximum
>> +		 * that can possibly be transferred at once by EDMA without any
>> +		 * FIFO underflows. This is CITER * SSIZE, where SSIZE is a max
>> +		 * of 4 when transferring to a peripheral.
>> +		 */
>> +		return GENMASK(14, 0) * DMA_SLAVE_BUSWIDTH_4_BYTES;
> 
> Is this really a constant that can be hardcoded? Should this be queried
> from the EDMA driver somehow?
> 
> I'm not well versed in the dmaengine/dma-mapping API at all, but I see
> fsl_edma_probe() makes a call to dma_set_max_seg_size(), which consumer
> drivers such as DSPI can query using dma_get_max_seg_size(). To the
> untrained eye, and from a great distance, it looks like the value you're
> interested in. Apologies if that isn't the case.
> 

You're probably right, and there's no particular reason to hard code it 
if it can be queried. I'll have a look at this.

>> +	}
>> +
>> +	return PAGE_SIZE;
>> +}
> 
> The other question is: what's fundamentally different between the host
> and target operating modes, such that we return different values? Why
> not the same?

This is missing from the commit message, but the reason is because it's 
a large allocation (256K with both tx and rx buffers) that should be 
avoided unless absolutely necessary so we wanted to limit it to only 
target devices.

The other reason to not allocate it dynamically based on the size of the 
message is because we assumed that it was better to do large contiguous 
allocations at boot time. If it's delayed until the device is used then 
the allocation might fail due to memory fragmentation.

