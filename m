Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DE429AAEF
	for <imx@lists.linux.dev>; Thu, 12 Jun 2025 15:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749742663; cv=none; b=mNntcjr+1YedvteePw1RJHCI5fM9DNq0rUgwQzyQU8zWPa5SU5UAE1FxAne1/7ZgbaFHS6e8fCUmtDNsppEhn1jjCU892Yxq/rGvnbUG8iVgiHV4g6XYeeapflSrH7EmwvLtHbRK9rvZRrWUo3nNoFdmDUi+58igxLZEpU3OdkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749742663; c=relaxed/simple;
	bh=z2zBLVhAg3p3R67jfYWg7Qs+bluv2nCq11ZiAgcv6A0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=re7C4fQK3Vs4FEmo1Ws3vTLjb7MzZ+lyr2dDIQ0ybsjmmtgeb4hBRQ8LQFtyCUCpP5O2qwGs4Ay/6e3dYJVetldDA+di6r6/U6d9FYxZA452BS8t6b4sZ9qS9asEXkAbYX/Op1Nl2e3ifTVC8TQnGKwraop6An4FyA4A4jEkC84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kcr70pco; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kcr70pco"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-442fda876a6so9781735e9.0
        for <imx@lists.linux.dev>; Thu, 12 Jun 2025 08:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749742660; x=1750347460; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lUktKHSDBv8YyZ3T2JIpTkEKDY+CUAzzGXJTRlK4hLM=;
        b=kcr70pcohZxFK+JYpwoPwpQgjWle7yBp/JOA29TwZ+dMgxDca+68HGBY37Ese4Vr2t
         pg9N4j2OTGUWxx0hwFg10lSdkry+Jzw1Cy83jYQy0lGDe9NKHF/K57ZtNbbGMlahxORm
         03unEpqORjPEKMcMGDeaXyR20b0a+eWeRFfeZJcslmhyHzeiOoEeAODA9hqHnNJHbxct
         UaZsPSWoTTCsd1Ln87Sm8OMctR7tZBaQLyZd4Mr7vzfL3W4yYVT+QRRDFeaP4t1NE+bk
         Unz9WtbMreb5ZDALhLWQqyv3AGxXfhVlrz1NPhyPmV54EL+qAPAweAx27LRxKD4kDUvj
         Qy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749742660; x=1750347460;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lUktKHSDBv8YyZ3T2JIpTkEKDY+CUAzzGXJTRlK4hLM=;
        b=GXG2ZnqNu/6ALiH/Sy1hbAwKGCEixZARAJ5hKH3zXWa64pPpLBBmI2+RgZ5QxxhKKc
         7Nx6ktCx78Di3AYbWysYJl+VnAl9zCo0Yj3X5oZbrqeUqoGzzztFmkLDi0tQdzIEKfOO
         YM7nLh4PpWojGplsDGuwe02mX7q90m+SOW2PrAlRVWM3aUGQwcRjNmerfAKFRfnE1LL3
         czkcgZVRqAFBJMm50DYSRJWxrVz27ahU66vrE507lnaIkOJY6HZuhz/NIiLu1iuNw0n8
         S7IdQ4L6aOswa2ZfeMlexgP2IvWdUTzFSplO8AU6kvBCZTHtiWwuQwKhiklE0iLlyz1Q
         2PZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAp95mjK3otPXHAAxCB81PwRmtYMTNXZ1lNOrk7zYtL8kDSjX1BcJeAwdOU4W870i3FBo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQP0Evqfv1HL7PBI8vaZkKX4+ka/4rRO53KgWvbOs98AnHkL0o
	lEvywNsLPfaKvsSBtOoNzfw5mJ124VLCMQIn9JgZH56PlViQGJzNm5BiF6RuZw+/Zg4=
X-Gm-Gg: ASbGncs2/e40Mp9O/LNnIKdJ/+Xqrix7EojyPLUJacNNVwHJCFFb+zBXbnQf2G7GkyB
	C6xMrH32FPQ7TQVEVSn8D23XfwEYYastcRPD8twhILlp++q4D6JTRoGcLzVNdxsuFXfNNiSWABw
	+CBhJ7nbrzQblBHoN2MQC/dM1SZUYvfnXgqE6JSbqDLe5yqK5IvyADTZ5AOLysnze7z71jRpxVO
	J8gxVzi1lx1QjvH66vF//O+IDD3PjQsNVtceaP8OTdiY6ENSslvzZ91amo2XuhHL0/8wBJ09z4n
	LMOcDxm7MqNFYLO9GrO11+wnGSbhOIAmSiGMMxM9NJc/w64LVGwCHRTGTopAbPVr6sM=
X-Google-Smtp-Source: AGHT+IFW8ovzvaCmO1YWcta4MdeADZMqjWi7FwUuaTUhmWbYq1MdUXaxsJ0b8e/O7yTwG63YiU9oPw==
X-Received: by 2002:a05:600d:104:b0:450:d611:eb95 with SMTP id 5b1f17b1804b1-453343c068fmr616725e9.17.1749742660256;
        Thu, 12 Jun 2025 08:37:40 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561a3c756sm2314615f8f.52.2025.06.12.08.37.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 08:37:39 -0700 (PDT)
Message-ID: <e9f0cb03-06c3-4cea-ba2b-1ca1571a8f31@linaro.org>
Date: Thu, 12 Jun 2025 16:37:39 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] spi: spi-fsl-dspi: Use non-coherent memory for DMA
From: James Clark <james.clark@linaro.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Frank Li <Frank.li@nxp.com>,
 Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
 <20250609-james-nxp-spi-dma-v1-2-2b831e714be2@linaro.org>
 <aEhMBsqlx9I4XqJS@lizhi-Precision-Tower-5810>
 <de7142ac-f1a3-412f-9f00-502222b20165@app.fastmail.com>
 <aEhVsrEk0qv+38r3@lizhi-Precision-Tower-5810>
 <20250611090107.t35zatn47vetnvse@skbuf>
 <c65c752a-5b60-4f30-8d51-9a903ddd55a6@linaro.org>
 <20250612111514.rfb3gpmlilznrfxs@skbuf>
 <ad7e9aa7-74a3-449d-8ed9-cb270fd5c718@linaro.org>
 <20250612143644.cmw6d4iiootipafp@skbuf>
 <7e4bcfe4-cf79-4b21-865d-a1248e09ffee@linaro.org>
Content-Language: en-US
In-Reply-To: <7e4bcfe4-cf79-4b21-865d-a1248e09ffee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12/06/2025 4:36 pm, James Clark wrote:
> 
> 
> On 12/06/2025 3:36 pm, Vladimir Oltean wrote:
>> On Thu, Jun 12, 2025 at 03:14:32PM +0100, James Clark wrote:
>>>> FWIW, the XSPI FIFO performance should be higher.
>>>
>>> This leads me to realise a mistake in my original figures. My head 
>>> was stuck
>>> in target mode where we use DMA so I forgot to force DMA in host mode 
>>> to run
>>> the performance tests. The previous figures were all XSPI mode and 
>>> the small
>>> difference in performance could have been just down to the layout of the
>>> code changing?
>>>
>>> Changing it to DMA mode gives figures that make much more sense:
>>>
>>> Coherent (4096 byte transfers): 6534 kbps
>>> Non-coherent:                   7347 kbps
>>>
>>> Coherent (16 byte transfers):    447 kbps
>>> Non-coherent:                    448 kbps
>>>
>>>
>>> Just for comparison running the same test in XSPI mode:
>>>
>>> 4096 byte transfers:            2143 kbps
>>> 16 byte transfers:               637 kbps
>>
>> So to be clear, the 'non-coherent' test was done just with patch 2
>> applied, or also with 3?
> 
> The whole set, and then the non-coherent patch reverted.
> 

And with DMA forced in host mode as a hack.
