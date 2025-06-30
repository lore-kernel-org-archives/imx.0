Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F98A2036EC
	for <imx@lists.linux.dev>; Mon, 30 Jun 2025 10:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751280405; cv=none; b=JyAnJSkPn8lWwJZeX/Qj9RgS1UMwFnChTEf4i/hNQLsYPR2Aypx3L7VmX7W+VTnQDb9tHMqkH0kToojAmTkkCrMUMwjRs4mY5/oinsBVwM4x71rPy57RCMV2oUiWL0ms6lVPlenP5tNOHec9E3ln3Dhd8K1E5eyZYZduiBfpc2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751280405; c=relaxed/simple;
	bh=gvyprsey8lBq/cwWETIidXRcGflIGW0KiZP0ucqQnYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aOzXPTWQRCN26fPsVcXhJ6rDkW2VglfzsDjOTbovIrLYiGHTuLIB9fiYW9+0fQs7eOgdC+R9UaNhfd3wskTGt+ye39hvmMZhhq8pUDIgRXV83kw4Tt++4G7ytm9KaxNP7/NmIL1KLdxKrrRVX7CH1v8YYXo7MZ2fSDPWkodQqic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aniWXFPI; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aniWXFPI"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3ab112dea41so910549f8f.1
        for <imx@lists.linux.dev>; Mon, 30 Jun 2025 03:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751280401; x=1751885201; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HFNukEVeOuH7fRtCazTP0zdNBYQLRBbJSaq5WQ9/jSE=;
        b=aniWXFPIyJzvej1J9sGSkIMo9SlJ9nJNUTfbTFveZwDcA3775mb79qNlW4dOybTCsu
         qhuk1/G2C/XhR94qnWE/uChdPl52BatbnI26W+QUGZ/WpzpldH3m4G4GYsQ8U0rX+382
         Q17u2FgjdIO5PdJpPaZeUHUehCI90pyXFlgPavHNt+G+dFP9haoWSq+K4zSAmYz+3pTr
         Z523q65PF2Go/kMlE64SScCszUioKoUSJyuN3Rqco+yKtKT4CDnXhsWYpE2K9nygVeVO
         21h6LUfV169oFp5Tc/8sD3LrJfRem/1E6OQ5B3DH/SaFyRdh7BkiiORgUeJ8XMiKaoXv
         dV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751280401; x=1751885201;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HFNukEVeOuH7fRtCazTP0zdNBYQLRBbJSaq5WQ9/jSE=;
        b=K5twMewZ4chE3RbYzqba9fYw0Oo5NohBDYfBSMavd6O3J0VvrZYNlh/1BsQfckL0Ug
         ztuvmfBuEu6ATY98IXreiOSKXg82iidm58ps0OsH2mjA9nF18bYkqbvnakKkp080RpVL
         bXURmKrhFEsoPfOO96R81etQTQh6uE7r+7oRB+3arO7+xu2c8wkRBkr3bPR7S3zMapCf
         uo7NtcJQ0ObRAnvgqqotQJ4JSgET70CPJ/9g5FamISoRyeJjPp7Ekd02oPuaSm/pGLPt
         CQO/KbvJfX734a6Pa+JsjUeRBQBFHtRV8UXvlOuqiYboSsL+56do9nzhYImI721/S95h
         gm4g==
X-Forwarded-Encrypted: i=1; AJvYcCWodPbLxHAbqribxhbrBdf8oOY6Hdu5SjCaR3C/8KKpopWMIKMVPlcbrlK3dW9d3QvSUeI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwCCKsG55okqLk0DGCJ9l6s4QV1j26p16fhROj/2Z/MDhIvKBo
	8whiBoYrFlOo96Rz4BLUJlED8dp+48mFC7H/Mi/6PoxFAsFUjxU/KCWHprsLXARQ5Es=
X-Gm-Gg: ASbGncuWUwFCoNPmOAxtZxYYBwDWs4irD1dYgg/A0cCW9fV68sL2+pMGQOov+6p/6/G
	L4bJbZWbvR9lki56vksj1ifsFrhj5SgqrkpLLn9xkhI4zri1HOsEhO+qimW+BXAM0UYv2LkZ3WH
	T4UqzuGYIFdGvN+XwwRdZQRG/KGq9Wnrj4gr07PneGckBeZcvwEACiqCzKj6iUTY0BYm+cYIA+b
	hjbcCTqnECa0yjl2ZT4z1pR9HT/ys3/L68lCSEuDnftuIuRZdZKyARJl4uGOa+YjT7K7wi4Dgjk
	OT1OEJuC7Srbi4AeCzHxvqE/dLuD8eGpr9y+bmEFXKtx9oEp98xn+Mhvvyz76BCGRrU=
X-Google-Smtp-Source: AGHT+IELSI+nHvc6/8x9c+zD3eFzVE2pjiOsqeuYSJZ1xJs78DtrT3WanbqFwCoHNk3vMxHy8BC9hg==
X-Received: by 2002:a05:6000:2013:b0:3a4:f7dc:8a62 with SMTP id ffacd0b85a97d-3a8f2f34f7cmr10696844f8f.0.1751280401373;
        Mon, 30 Jun 2025 03:46:41 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453814ae64fsm106803355e9.1.2025.06.30.03.46.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 03:46:41 -0700 (PDT)
Message-ID: <f4616741-9763-4221-b385-74c6d332b092@linaro.org>
Date: Mon, 30 Jun 2025 11:46:40 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] spi: spi-fsl-dspi: Report FIFO overflows as errors
To: Mark Brown <broonie@kernel.org>, Frank Li <Frank.li@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
 Larisa Grigore <larisa.grigore@nxp.com>, Christoph Hellwig <hch@lst.de>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250627-james-nxp-spi-dma-v4-0-178dba20c120@linaro.org>
 <20250627-james-nxp-spi-dma-v4-6-178dba20c120@linaro.org>
 <aF73e/ggeycsYiaD@lizhi-Precision-Tower-5810>
 <22d69113-fec0-4405-872d-af76bd038c09@sirena.org.uk>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <22d69113-fec0-4405-872d-af76bd038c09@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/06/2025 10:41 pm, Mark Brown wrote:
> On Fri, Jun 27, 2025 at 03:56:43PM -0400, Frank Li wrote:
>> On Fri, Jun 27, 2025 at 11:21:42AM +0100, James Clark wrote:
> 
>>> In target mode, the host sending more data than can be consumed would be
>>> a common problem for any message exceeding the FIFO or DMA buffer size.
>>> Cancel the whole message as soon as this condition is hit as the message
>>> will be corrupted.
> 
>>> Only do this for target mode in a DMA transfer, it's not likely these
>>> flags will be set in host mode
> 
>> "not likely", I think SPI controller should stop CLK if FIFO empty and full.
>> It should be "never" happen.
> 
>> Only check FIFO error flags at target mode because it never happen at host mode.
> 
>> You can remove below whole paragram.
> 
> I agree it *should* never happen in host mode but it can be good
> practice to look in case something gets messed up.  That said extra
> device accesses in the hot path are probably going to be noticable so
> likely not worth it, but in the dspi_poll() case:
> 

Yeah the point was to be defensive. Even though it shouldn't happen I 
don't see an issue with checking error flags.

We could add a condition to only do it in target mode, but it doesn't 
make the code more readable, and it wouldn't be any faster than just 
checking the flags. So I'm not sure what problem we're trying to solve 
by removing it.

>> @@ -1067,6 +1080,9 @@ static void dspi_poll(struct fsl_dspi *dspi)
>>                          regmap_read(dspi->regmap, SPI_SR, &spi_sr);
>>                          regmap_write(dspi->regmap, SPI_SR, spi_sr);
>>
>> +                       dspi->cur_msg->status = dspi_fifo_error(dspi, spi_sr);
>> +                       if (dspi->cur_msg->status)
>> +                               return;
> 
> we're reading the register anyway so the overhead is much lower.

In both poll and interrupt mode we're already reading it. Only DMA mode 
didn't have a read and I didn't add a check for error flags there anyway.

