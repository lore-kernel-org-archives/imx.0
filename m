Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C8A1EB44
	for <imx@lists.linux.dev>; Sat,  2 Mar 2024 16:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709397786; cv=none; b=G7REGHNkBObyutH3SuMoZhENQRIbNVOLI2hqLdOpQMX54RExI0zGE2hWwLVJt3KI4HaSJ12hKOP+OipFgD0wZGaGGT9nYB+CIR1P6rRMzMvpyhzQkkjQzOgpaJOZzuXMDypC6vRLnU0TYJ8hRBTXLnVjcVCQfpxAKgpaIEXOynU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709397786; c=relaxed/simple;
	bh=iY2uv6tQ8oAWtbCpRxATIB+TmZmeWRIJZ0VO7Gv8xIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YGxXsr+TJhi+n1w/Lay4LATHdecSUMK59sCSHpOgw9+KI9eMZ1yS1dldtxOcuElMwxGF58TPjhsDFU88S+5DTtBpOn3fXvhcmXreEt/wiKogw2jwcbGObXwWiAkxyT8ZerMgoS8YGJYdEZ/YGC4/IhNerzBUf2deib53uxuV74w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D4Re6JXn; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D4Re6JXn"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-412cb6148dfso7367025e9.1
        for <imx@lists.linux.dev>; Sat, 02 Mar 2024 08:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709397783; x=1710002583; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uYdZ5zGQ9fikWU+RdgNG0JWTvwrS/XBdL5T1cZ9o+tg=;
        b=D4Re6JXn4op1yiBNEYsVMR8J5gIjRsVzQh8qJ1K8/6rrk1vUran7VNiG32hnowcgfo
         Nsczs+q9/oS4epnkak34Xm5cd/K8CIljLKrvl9xKkjLmJ3yfOk6NQBwAAnrktzUyPd7W
         eNTGyzuDOr/3BXpkayQgDLzy7rYt1/rb9DQLECUTGv8TMmmlnLQ6KXpre3ToYTxnlCxe
         IeAEUeXZe7IucWdo0mCxPk8myZuTbld5X7eDIMsbH+ltHYkukVR0TRmbLfAMwj6wuYwY
         rJMuTYzobAAhPeSRrgqtIotWCm2uxOXxdhs7/SAwIrr6Ok/kvWGRdMb6RnuOxTBlO0ZM
         xcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709397783; x=1710002583;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uYdZ5zGQ9fikWU+RdgNG0JWTvwrS/XBdL5T1cZ9o+tg=;
        b=L05/cAJwXLuiB8+s+Nf7ihx6Lg8joIqo2krhVXk0gbxc1pmKLNwf91RRv+27ySTiyG
         vTkuka71YRVKvXqHvJfDQ/yWcj01uv+WOwZ/QQnB/VOybvkhdv+FRIvqDhm8NBgCkC+Q
         t+GetHgMdfuilPD1+q8/vnjRU8aYYTahtgq17XhDZhKLrTrK3DIbSttAmKN7z9SdaQSG
         V6Gd9OFVeJn9DmloJLdUv/foxEsgjSm4wQVsTkREaD+rqzA7wMFwMZiZ5Lcz9xM6iJU5
         3X+HhaylA3qz0eDs5wA9LmOPOBITAoZpruFUOp73rwc7UlaeV/LbGBT5xKvUDEPhjV0j
         IJvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuETQbPp7XdqB5noUJaKls51gh5VFbjuGud2oq584of2dBtwU1owIaTTi/xi0WQ/VTIrVH6nhUNSzG9uTwnjXhXbY3
X-Gm-Message-State: AOJu0YzclaF3OuFsoZUjlIYhM+D640Bp34jfFKadzEkGE+wfO3OdW+F+
	t/EvWK35r7gwL2Ysg7ohgiV3BPQXOsMglVZB2V3uJoDTOYzY81f44myTOAhZsfs=
X-Google-Smtp-Source: AGHT+IEPqjVenlVlKA6dKUFh+8+c5WU6t57JINMGvqCa6BAEO/eWtZxvuuXTQWxOLmQ/WRgA0lfxUg==
X-Received: by 2002:a05:600c:474d:b0:412:c1d4:da7d with SMTP id w13-20020a05600c474d00b00412c1d4da7dmr4397093wmo.33.1709397783200;
        Sat, 02 Mar 2024 08:43:03 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id fa24-20020a05600c519800b00412cb60ac0esm4117575wmb.15.2024.03.02.08.43.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Mar 2024 08:43:02 -0800 (PST)
Message-ID: <e1d0aafe-e54f-4331-8505-135b9a8f9bff@linaro.org>
Date: Sat, 2 Mar 2024 17:43:01 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dt-bindings: dma: fsl-edma: allow 'power-domains'
 property
Content-Language: en-US
To: Frank Li <Frank.li@nxp.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, imx@lists.linux.dev,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 peng.fan@nxp.com, robh@kernel.org, vkoul@kernel.org
References: <20240301214536.958869-1-Frank.Li@nxp.com>
 <20240301214536.958869-2-Frank.Li@nxp.com>
 <885501b5-0364-48bd-bc1d-3bc486d1b4c6@linaro.org>
 <ZeNI1nG1dmbwOqbb@lizhi-Precision-Tower-5810>
 <31e62acf-d605-4786-80a1-df52c8490913@linaro.org>
 <ZeNWXxzFBzNj0gM1@lizhi-Precision-Tower-5810>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZeNWXxzFBzNj0gM1@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/03/2024 17:39, Frank Li wrote:
> On Sat, Mar 02, 2024 at 05:20:42PM +0100, Krzysztof Kozlowski wrote:
>> On 02/03/2024 16:42, Frank Li wrote:
>>> On Sat, Mar 02, 2024 at 02:59:39PM +0100, Krzysztof Kozlowski wrote:
>>>> On 01/03/2024 22:45, Frank Li wrote:
>>>>> Allow 'power-domains' property because i.MX8DXL i.MX8QM and i.MX8QXP need
>>>>> it.
>>>>>
>>>>> Fixed below DTB_CHECK warning:
>>>>>   dma-controller@599f0000: Unevaluated properties are not allowed ('power-domains' was unexpected)
>>>>>
>>>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>>>> ---
>>>>>
>>>>> Notes:
>>>>>     Change from v1 to v2
>>>>>     - using maxitem: 64. Each channel have one power domain. Max 64 dmachannel.
>>>>>     - add power-domains to 'required' when compatible string is fsl,imx8qm-adma
>>>>>     or fsl,imx8qm-edma
>>>>>
>>>>>  .../devicetree/bindings/dma/fsl,edma.yaml         | 15 +++++++++++++++
>>>>>  1 file changed, 15 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
>>>>> index cf0aa8e6b9ec3..76c1716b8b95c 100644
>>>>> --- a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
>>>>> +++ b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
>>>>> @@ -59,6 +59,10 @@ properties:
>>>>>      minItems: 1
>>>>>      maxItems: 2
>>>>>  
>>>>> +  power-domains:
>>>>> +    minItems: 1
>>>>> +    maxItems: 64
>>>>
>>>> Hm, this is odd. Blocks do not belong to almost infinite number of power
>>>> domains.
>>>
>>> Sorry, what's your means? 'power-domains' belong to 'properties'. 
>>> 'maxItems' belong to 'power-domains'.It is similar with 'clocks'. what's
>>> wrong? 
>>
>> That one device belong to 64 power domains. That's just random code...
> 
> Yes, each dma channel have one power domain. Total 64 dma channel. So
> there are 64 power-domains.

OK, then how about extending the example to be complete?

Best regards,
Krzysztof

