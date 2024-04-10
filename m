Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7706524A
	for <imx@lists.linux.dev>; Wed, 10 Apr 2024 06:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712730631; cv=none; b=CceD85feIr7pz2gJkVrRWEfZvaerggGc9FpSJXtvYkwuBZvfO200Ttpvj1oNtBv20MHO8q84SWzfSLdev69tRQRAvxvhccKK/GiErv3Jw3YvrOnOfABG3wJgkZzm2t7crAoMdcjTBeNyh1PPO3oYRavfdyW2VfHXjr5Gf6P78NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712730631; c=relaxed/simple;
	bh=snLcBzW5JAfOjL33AeXOFsWB7BGPbRw5aXOn3Slj5aE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IUCW3Ez2eILMdLs0WRoS04k8kly3l0IOIeUPxsNCZbA0lnkvBAe+wqCgksSsJO8JWxamDeSyEKzOYnMzpACpZJcSoJvmx6pC5iyeV2MZG2UhJ5IuZB9OHATEZXtQMfQWVH3TsIdlNGP05e8TgEEKoWB5k67UNWXu1sBxesYJjs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xvyys8jN; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xvyys8jN"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41786893a0bso603525e9.1
        for <imx@lists.linux.dev>; Tue, 09 Apr 2024 23:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712730628; x=1713335428; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gWci41MJZyAHUWq9dFdkgNIb3G6A9TJ1w2pD10mN2/A=;
        b=xvyys8jNwFEQqZT0xLhXjyznYOZLIykHD43XNkWJfAzRDvL0W60pYeQgrFSFQc7xkd
         oazyGt73E7sq0jTd0Yxari8oE+B0e7yt8Etjorqyruna8n7arpKlDc+uK8jsMZhiPq7b
         ZQUDByvW2h6Lfvr7mQOwW/FNHGSlm4xCNF99H/yGfQlBXFJPAKLZCbDxc+7Zae+y+l3t
         +5MuONLgJgQkx/laAl2cZVo5zgjnKDzQhKnIeAO/aXQLBhmQUn35ex3OVIQoEjkISpW3
         ZOKayaSP2wo8zXY6lRecQe6Z16g+2XXhRQLfC61P3wxO5a0hV2gocn3uVaHdwHw+zEcB
         n1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712730628; x=1713335428;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWci41MJZyAHUWq9dFdkgNIb3G6A9TJ1w2pD10mN2/A=;
        b=lOuZ4Qqx2l7HSiWBnKG5lrrtSzgcrO6GaNkC2DgacZkIPypL0Gctl+K6/8SbAMzg1k
         XPlzo8Q2FsRFEjy0smiwXdJbHMZCWSFY0XaqE9hmNAYYMS21ph4UGnXGpML+7G/Mmm5z
         JGXcyoxz+VoumiBm+TqDSqnzkTpqwrWOyfy0dJI8Nz+mnyL712x+hhrqO6JVr1SIjwjZ
         3inKB0p9ly3rwESxiVn5bdDfs65det4zacbXqipUrM4CIOXmL1ql3/f5rj/mXDQwR7kX
         E9VjyNxFj02B+Zs68/wBRVgxChg+UqBaighdPnKPuV5ZXe8QuQY+FujxmTytQgbpE0YN
         BAog==
X-Forwarded-Encrypted: i=1; AJvYcCXTeSeshXQD6+AlwS6rVFzs6hs4qUYgcrvmAVCYMu7w8RyBwCDfUKfIhpLjRhm+A060WippPqSFOKUqdo8Ef0GiOF/C
X-Gm-Message-State: AOJu0YyaKMK0Y8h8GXzxRriKeG+7jSlmuLcufDV64BsJYW0srOlv2zHB
	rKLTSRmGZ9LU5zmzZrmFXk+uveSz3pDpf6Gzj3vaN5RmpJCufafSSRPM6GqsAoc=
X-Google-Smtp-Source: AGHT+IF0eTsJpLQnt6d4A/NrzBUkHTYbJp6X8EjIxxI0DFlEzYReQ/Xs/F3dE6+19zJczYeIySaAfA==
X-Received: by 2002:a05:600c:4f08:b0:416:259d:b250 with SMTP id l8-20020a05600c4f0800b00416259db250mr1522584wmq.18.1712730628148;
        Tue, 09 Apr 2024 23:30:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id f13-20020adfdb4d000000b00341c6b53358sm13049534wrj.66.2024.04.09.23.30.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 23:30:27 -0700 (PDT)
Message-ID: <680f8830-6cd8-433b-85b7-439070bc528f@linaro.org>
Date: Wed, 10 Apr 2024 08:30:25 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: dma: fsl-edma: remove 'clocks' from
 required
To: Frank Li <Frank.li@nxp.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, imx@lists.linux.dev,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 peng.fan@nxp.com, robh@kernel.org, vkoul@kernel.org
References: <20240409185416.2224609-1-Frank.Li@nxp.com>
 <b15ad271-037e-4ee3-ad88-e8068d31c8c8@linaro.org>
 <ZhWuetC8bRvDyxgX@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZhWuetC8bRvDyxgX@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/04/2024 23:09, Frank Li wrote:
> On Tue, Apr 09, 2024 at 10:02:32PM +0200, Krzysztof Kozlowski wrote:
>> On 09/04/2024 20:54, Frank Li wrote:
>>> fsl,imx8qm-adma and fsl,imx8qm-edma don't require 'clocks'. Remove it from
>>> required and add 'if' block for other compatible string to keep the same
>>> restrictions.
>>>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>> ---
>>>
>>> Notes:
>>>     Change from v2 to v3
>>>       - rebase to dmaengine/next
>>
>> This fails...
> 
> What's wrong? 
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git/log/?h=next
> 
>>
>>>
>>> diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
>>> index 825f4715499e5..657a7d3ebf857 100644
>>> --- a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
>>> +++ b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
>>> @@ -82,7 +82,6 @@ required:
>>>    - compatible
>>>    - reg
>>>    - interrupts
>>> -  - clocks
>>>    - dma-channels
>>>  
>>>  allOf:
>>> @@ -187,6 +186,22 @@ allOf:
>>>          "#dma-cells":
>>>            const: 3
>>>  
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +	  contains:
>>
>> It does not look like you tested the bindings, at least after quick
>> look. Please run `make dt_binding_check` (see
>> Documentation/devicetree/bindings/writing-schema.rst for instructions).
>> Maybe you need to update your dtschema and yamllint.
> 
> Strange, Test passed
> 
> make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8  dt_binding_check DT_SCHEMA_FILES=fsl,edma.yaml
>   LINT    Documentation/devicetree/bindings
>   DTEX    Documentation/devicetree/bindings/dma/fsl,edma.example.dts
>   CHKDT   Documentation/devicetree/bindings/processed-schema.json
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>   DTC_CHK Documentation/devicetree/bindings/dma/fsl,edma.example.dtb

Nope, you tested other patch. Just look at your second patch for this.
When reviewer points to errors to your code, please investigate?

NAK, fix your patches.

Best regards,
Krzysztof

