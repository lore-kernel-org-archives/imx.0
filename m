Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE552D877F
	for <imx@lists.linux.dev>; Wed, 25 Jun 2025 09:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843147; cv=none; b=q9JRJ8vIy4DJ9gBAHDVIRN9MyyMs2C+9WmpR3aU3Tqi2KE4Eg/gwPMbyPcMQykoBoMH4UCAq0IunTX+H9tn34QRhkvksT9SUuwQuEWUE9Y7LjzEb5BwGs9Wg4XEgPtxqkOEgZDyaRDFTQMOv4wlA+yLUAxaUa0Kbs6t3moYpP7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843147; c=relaxed/simple;
	bh=20e3PphxG30T3V+Zob/qx0IQxDG73Gud5foeaYVbVvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ffv4rXNIlWEeH7wLTdV9tq+1H4x6O/ZFwuUs8AsHwvxA9ueX5GR5L2xg3PiQsByB2WWcZaHq2tfnoJhQ7quTdk+CqI1ZQHpUqtR9U5C11SCcnljxbfdQYjLiNtGdv9TzyKOEf2gkZJi5sbUVRTuddoSHyFT7CWr06tZm0P16TW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EFlHI2jZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EFlHI2jZ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so4857565e9.1
        for <imx@lists.linux.dev>; Wed, 25 Jun 2025 02:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750843143; x=1751447943; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ojAQtrqRfWE5uG2/EcUt6MJrN5Ulz0bDOzZRTcZgA5A=;
        b=EFlHI2jZ25gV9fRoiaNgi/Ny+v6KV2li8TgN58dHWXiWId6Xk2PauWh3D1aXqlLZeo
         Wi1wbDAawxsUFG2fQ6kWVpCHAGB3rr7EtT+q6tQtFeVlqei4VbJDV1iEo2trReFdecvh
         0qnP3ivQSu2Bt1+wqdmdlM+P4KSs9X5Q9DJNcIRnKE7E0kyUnLFOA2N3cHa9fV4W7BkO
         jQjwtsBPhzj/cQ59GLs7HTZTjUpbi8PZBNq+ty/O2/8Hw2pVs+CBx/BDpXpZZAVS+RG4
         oNKMZjYTFWf2fzbpGDshx3Cta0mBTIpFRLxkSjhdNRdQLaWdZSfWp1fZdxgdFkvLVwvz
         j9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843143; x=1751447943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ojAQtrqRfWE5uG2/EcUt6MJrN5Ulz0bDOzZRTcZgA5A=;
        b=ULNzer9YG2NQWwrbF+nQqr3Oy3BB72fVZMxajsoiF53cmz4np5YllZsaxtef4zw1em
         KceCBVN/k3dk8NPHxXcTtTbd/+aD1NC0gNg2xQzRJfWeMJvhzLTx+JmYhIpKQCqXj+Jn
         gm/u421uVoaR3Fyft4H3o76TWdU2rTCjaashflUib3nWBcenQhR+n2+9MREG3qlUvGOi
         CV4eVxygs3n3Nlwp/cVcICch+Vs9MBr1eWVk/SZBWH/tY3eNVy9yNLyvK7R/NuV3yCYn
         VeHVXYmdpWNA0/Hs5ioBe3HUxr+EfatrrVUQo8ePKEoeklhBPYH5q8Po93/eDnjXrHJN
         uGCQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9HCbzCU7sOy9DXaoyV72nFVzo8sOwQYBFRC5Dz/eIztxBmL7aMFMnM6DHM4YI85jwX7Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YzU4+PqnHz7chq9bO6+hP3p8EcYiPp0yw6DKS3oQyVTOdb1qFX5
	9KNZjs+ybB2Cxhe9/LojUhYwGDgkQdvslYwAU5MiR6KiF2+LVBmVVD/54pWYWN1snwM=
X-Gm-Gg: ASbGncuSrKoparYhAe00efTbDDWAf4opirv1A1+FSp4SXFQLyWcwsQZJOHnfGVxo2yd
	Cgi4tnhp1oey6Ov36ywQMbKhT27dv0vItvoQHDxTlEXpFgnfA43wfr44U964iHner+jrrU6HAzd
	TWw5H/WXsO6NuL56NyDwR6vQMNfiIpN32ClxXqJLAUDR//yefcscSAsr52DfkM4si5jnEsaGm8/
	MYT/3dfJervGTwxaCeDOAOhLVQxtLCLIZhzP2RBMgIpy+KWY+vC8URPRHPPzNRxIwVtnNP87IEc
	CHSaPUvvylduKwrm4S4ODv10WLivm4gWhW2eyBEMhGpQz6k3oHjaTFEqIXz7NbnPpDM=
X-Google-Smtp-Source: AGHT+IHH7ZCWqc0u7ZgOrAL3WMonYTs/JRdAzK3sDu8U1/EewCY+ihQcjBc/zfznNgiZP8hFENkJ8Q==
X-Received: by 2002:a05:600c:450f:b0:43d:174:2668 with SMTP id 5b1f17b1804b1-4537b631db6mr57163895e9.0.1750843143517;
        Wed, 25 Jun 2025 02:19:03 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80693c6sm3957051f8f.41.2025.06.25.02.19.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 02:19:03 -0700 (PDT)
Message-ID: <0c6c78da-575a-4d29-a79a-3903aa801b42@linaro.org>
Date: Wed, 25 Jun 2025 10:19:02 +0100
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
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <290fc244-e88f-47a3-8dd3-0ec27eb5c60b@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/06/2025 6:16 pm, Arnd Bergmann wrote:
> On Tue, Jun 24, 2025, at 18:29, Frank Li wrote:
>> On Tue, Jun 24, 2025 at 11:35:33AM +0100, James Clark wrote:
>>> This will allow the build to succeed with !CONFIG_HAS_DMA, either due to
>>> a randconfig build test or when the target only uses one of the non-DMA
>>
>> I supposed you met kbuild error. If yes, can you add kbuild build report
>> tags.
> 
> Actually I would suggest making it a dependency on CONFIG_DMA_ENGINE
> instead of CONFIG_HAS_DMA, since that is the more relevant symbol.
> 

Makes sense.

> It would also be simpler to enforce this in Kconfig if we only
> care about users that use the DMA support.
> 
>        Arnd

But most of the devices supported by the driver don't do any DMA. That 
was the reason to stub them out rather than add the Kconfig depends.

