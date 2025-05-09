Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2FE29293F
	for <imx@lists.linux.dev>; Fri,  9 May 2025 13:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746798388; cv=none; b=MHic3pyyHVcz8LQF/lAyRcMGSJ79mR2YChs4PiTztyG47WFu9BXQnqAaXYiVMms+kz7zr7ucAAWf5diOs4qXEPOO9aTzDWXC09YPh4Dv9YAGk0WCRkyPzoUz3aCYphLyzeyTpw3vS7sy4LkLFgBf6qlrQFGA23MegupYXgILk9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746798388; c=relaxed/simple;
	bh=XO/wK7V6mXY9xU1mcWlD2Ct18mmjFn+FYLp11z65N7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Alqti6hknvdVLdQvcgk8CfpnrTDBoc7RC2Vow/RZuhlEi3V0E1XtZlDk2Dn5XfGkWvnUOm6kkj1fhjEgc6dD+NPpZOT7p3+vaL8AoB2rTfFQwgxbe1DI/jstItq1At5HD3j83Iaw7S0of2bzwWCC4W4bRNKLOzbVVtbI1L0XRGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aguLcmDp; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aguLcmDp"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso13927465e9.3
        for <imx@lists.linux.dev>; Fri, 09 May 2025 06:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746798384; x=1747403184; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PZUF6Q4Qc9CPUkc04ir0Y5K/i90KczoIYGaKnAPCoYU=;
        b=aguLcmDpe8HTX9Vt15UwehU9oAUoDZapZcn3st4AtfVmEuFJzWs2NAkvlDFAhi3qZs
         ZL5Kgk+v0yuT7AWJOs36J2SJHMCqR2Winh0sq69TmCcVnCrvZ6fyJ8H0FhkP6hNvNUYy
         fM3EkxhyGasQaIAzgBF/4jYHAyhS3iYvBrnx/Yq4mpxUSJ1bYDui1JV4fHbK5kmxiIdw
         yFtzK8NadMATKzGLt/CXBT1125DZpzps4rSzusJd+KAcGn4n0Aa7z6KHygecTKebPco8
         SvjWILt2UgbOypcABMg00x5H33tVjTvEc7FbRja6j8ETD7ieEgPUUzXt7zn+wEEwLgPu
         IdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746798384; x=1747403184;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PZUF6Q4Qc9CPUkc04ir0Y5K/i90KczoIYGaKnAPCoYU=;
        b=akzyJKDC0T4Vy7kEhIdIChNI/H9EwBrFpqmD72XnHrrib4iYwSjOks0KTRt+OrPry2
         qmVIHkV/8ihw+j6mXnZeAbHhfvASdHvE/9gt97daDRcPEmiKXCV5gaIItUoMzkNX6sXP
         ms4zXCZSFbmPAa3wjsS9g7QIntEq28SdgHr0G6+1a2MaReDlFCMWfyl3J3/CbR8Ibsk6
         4VL7+AQUv0+3/7Y3J7+56Vy6W1Bf2iuPy08S7lLLq+DwTn392L/pzm0v/D8IYHWbs1bw
         fDqfXEXdD3VkrOQD98CYssC+LJIxVhyI5YcUJJjvJTg6usZb6BlEASQtLbCcUVy86AT1
         iGzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyK8/mqyZhATRAE9OqItO5vsMJa8+Yq4VspQDYA5RANbWCtD9ebiqNNhWZ0czyC0abWe8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdVZesFRJVU1cu9U6xX8UsxW7JqOLVAjMG5UHTbgx42jHLhihR
	oaVM2rlNvCmNqlmYTe+D5m09TFM8PcnjhdIZzQ8vLmrhYfwsO6qzrsGNzkJNriU=
X-Gm-Gg: ASbGncv1v2hsBooeahkY+41WAoaju1Hr2LXmvwIBJs3zBtvNXk2l4q2hPiLKJCtAHPV
	BKWVoHD0fWGoHiRvwYRmw2YMMfXIWFUyu/KdLSx+i292xPgUa8kLT391iSlUv1tTi0w8+KW/KhK
	+rb3DSFoVQ/g6KxReEINxp5FWt0lW3w2iMibvor8eAtGIVQaK6d/q+/S/iqNBGcTlVnbBh25UnX
	YaZRISQiGawWXRUcYmlfOkNq+NXf8fwLZD+V1eZGCYfGSWRd2wy1z30L4x0PQ6jMs1AokzGHSQs
	0qtUDvZfapc2PVfdIa2+zrZDYn9dcN6+vbcI2HQM3GHJUN1ZsprFgw==
X-Google-Smtp-Source: AGHT+IEo0jYrQRcALBtqnax8NWcKiAGj6scBJ0uiGs5jTKoY3ij/ij8y04Oz3H5GiqMjPbUsL8YJBQ==
X-Received: by 2002:a5d:5f95:0:b0:3a0:b84c:7c64 with SMTP id ffacd0b85a97d-3a1f6435b6fmr3000885f8f.13.1746798384562;
        Fri, 09 May 2025 06:46:24 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecaeasm3290573f8f.28.2025.05.09.06.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 06:46:24 -0700 (PDT)
Message-ID: <bc871cb9-0b50-4132-8bdb-3a764bc98180@linaro.org>
Date: Fri, 9 May 2025 14:46:22 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] arm64: dts: Add DSPI entries for S32G platforms
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "Radu Pirea (NXP OSS)" <radu-nicolae.pirea@oss.nxp.com>,
 Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com, arnd@linaro.org,
 andrei.stefanescu@nxp.com, dan.carpenter@linaro.org
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
 <20250509-james-nxp-spi-v1-14-32bfcd2fea11@linaro.org>
 <3ddde799-76b5-43f9-971e-a52ec322e9b1@kernel.org>
 <16e91572-b132-4246-9fa9-8e8bc4c24f40@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <16e91572-b132-4246-9fa9-8e8bc4c24f40@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 09/05/2025 1:54 pm, Matti Vaittinen wrote:
> On 09/05/2025 14:26, Krzysztof Kozlowski wrote:
>> On 09/05/2025 13:06, James Clark wrote:
>>> +&spi1 {
>>> +    pinctrl-0 = <&dspi1_pins>;
>>> +    pinctrl-names = "default";
>>> +    #address-cells = <1>;
>>> +    #size-cells = <0>;
>>> +    status = "okay";
>>> +
>>> +    spidev0: spidev@0 {
>>
>>
>> Node names should be generic. See also an explanation and list of
>> examples (not exhaustive) in DT specification:
>> https://devicetree-specification.readthedocs.io/en/latest/chapter2- 
>> devicetree-basics.html#generic-names-recommendation
>>
>>
>>> +        compatible = "rohm,dh2228fv";
>>
>>
>> Nah, I really doubt. That's not the device you have there. It's
>> possible, though, so can you share schematics?
> 
> Actually, not even possible. There is no DH2228FV from ROHM. There is 
> BH2228FV though:
> https://www.rohm.com/products/data-converter/d-a-converters/8bit-d-a/ 
> bh2228fv-product
> 
> but as you know, it is unlikely this is the part populated on the board.
> 
> For the author:
> https://lore.kernel.org/linux-rockchip/20250213-calamity- 
> smuggler-5d606993be32@spud/T/
> 
> Yours,
>      -- Matti

Correct, I believe these go straight to a header and aren't connected, 
so this device is just an example placeholder for a 'generic' SPI device.

It might be more accurate to remove this, and then anyone using the 
board for development would have to fill in themselves whatever device 
is attached to it.

Thanks
James

