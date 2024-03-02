Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACA21A5A2
	for <imx@lists.linux.dev>; Sat,  2 Mar 2024 16:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709396449; cv=none; b=LTt7r5Dvls1ByN/dRQTYHpCPFY3ILlOBpDGOnaDEzM4oq/gpbvy0VLQ/aCUigYBP5uTy/4+mca5R+t8VpttV8c2I8he4lJujFJjZnxNNcNaSTyO4uv5qEtktNOA/wzKojgHJw8Kr9S8LVahxYVuZVKYSm/kWJoq+Pgwh6rnVfaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709396449; c=relaxed/simple;
	bh=Wln++snoA40x+qWEZZcKKhppP2VMixbKmdhLjLItlZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FB4PN1njc6HFZjvbiwlQMhfdXjAWRp1/61h6PUJmdG2hx4MFDEeyBMD5MHbmkwcolhP9Pem3luoBpGl7fDjPskDKod95o78MpQHHaCvFUj/SHpIVl4da3KJBLknHDaqKXB4e0MfLuhC63wbohQkallddweVDWk4NrKO/2ra/0/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wnplasn1; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wnplasn1"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d208be133bso37793051fa.2
        for <imx@lists.linux.dev>; Sat, 02 Mar 2024 08:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709396445; x=1710001245; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5OXnrbutt/Uv6uRhzZrmNOJKAYvvA2TzcK2pYWprYqQ=;
        b=wnplasn1ymhI5xigjulj2VMienSM6pXAiQ/tRv3VuqNeeQh85RVQAdwSWR9Jj7o1Kr
         PWNrZc+7Dy98LWfogbPXr+w+ZeKeUHk1IMM24DzqG3ZDU/YXB0WTtSOIvPPtahQkHx7w
         gYdXn8Cmgt924/GAEi2f7idHw3lH0MxviiFxRrRNFVxPs95hHcKwZgVvKXFUY1fZ/y62
         uLRqA99neASZrCHashy5e+zT5RtCurQ8WFuv99X9FMqec0uK0wAx4INshRtLI9QIPiVy
         T5h4ESo7T7PLbX0zo32R8UphrerKyc7t7MmnnXz2p1v/7qs/sa9zEqnOcq6FJNy6/w+K
         3Ojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709396445; x=1710001245;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OXnrbutt/Uv6uRhzZrmNOJKAYvvA2TzcK2pYWprYqQ=;
        b=Ry5+kVR9JXGXqQ8hFXm0IblFWmgmrJHtgl8D6qhBXxySUsoA/enMb+fBy4mGnWNGAC
         nk15fByq7E7b/mxOaaftQGC1illXAGTWA45YQN7R4IsW/yPnV8HpgwPvMoYtJbaB3zDh
         Ehvyms3Pi5nLPJzh8/O0APGtfG9x9msGbPm4Ve02QDZKvys9tcRItEev0BMz/P6j3tri
         epcMzBYAa7f4z0syzeBpgHmRdA0rg5rFsLeODRdk73HQx0D6YEX/nwvO+0fmgaJyQjZ+
         cw7YA/Lw3JPnZz+c/VUsHwK87q0kHOOo+SiRLQ8KNdZFpXhG8SDQ15E9QuCjAKuG8Vhh
         gZfg==
X-Forwarded-Encrypted: i=1; AJvYcCUMTMmfzp9ubzN3swdEfKlPM6cGoS6E2w7NPKIZUgONjmJWKZjm38SEUJTyv1dxMgI0Q9chRF0rbcHwZxAYnEySVgQx
X-Gm-Message-State: AOJu0Yzte5O31MdXq9n1uPIRTqEw2WQFbVb5nZqi9d6ATX7/OGAF1Sl1
	f1znlcFVQK+9we1EDbAMiFMozwRCjHkNN30PfISDhxOChPEmKLNhWUTl+nq9nAg=
X-Google-Smtp-Source: AGHT+IFCfAHe3vqhVH3b8KkO5v+8RaT1HDEedOzzDIti23+vVOzJJjjnubfyY0iN25A1mUB9oygrwQ==
X-Received: by 2002:a2e:9201:0:b0:2d2:7781:3842 with SMTP id k1-20020a2e9201000000b002d277813842mr3538422ljg.38.1709396445416;
        Sat, 02 Mar 2024 08:20:45 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id y26-20020a056402135a00b0056694006fa7sm2699540edw.70.2024.03.02.08.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Mar 2024 08:20:44 -0800 (PST)
Message-ID: <31e62acf-d605-4786-80a1-df52c8490913@linaro.org>
Date: Sat, 2 Mar 2024 17:20:42 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dt-bindings: dma: fsl-edma: allow 'power-domains'
 property
To: Frank Li <Frank.li@nxp.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 dmaengine@vger.kernel.org, imx@lists.linux.dev,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 peng.fan@nxp.com, robh@kernel.org, vkoul@kernel.org
References: <20240301214536.958869-1-Frank.Li@nxp.com>
 <20240301214536.958869-2-Frank.Li@nxp.com>
 <885501b5-0364-48bd-bc1d-3bc486d1b4c6@linaro.org>
 <ZeNI1nG1dmbwOqbb@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZeNI1nG1dmbwOqbb@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/03/2024 16:42, Frank Li wrote:
> On Sat, Mar 02, 2024 at 02:59:39PM +0100, Krzysztof Kozlowski wrote:
>> On 01/03/2024 22:45, Frank Li wrote:
>>> Allow 'power-domains' property because i.MX8DXL i.MX8QM and i.MX8QXP need
>>> it.
>>>
>>> Fixed below DTB_CHECK warning:
>>>   dma-controller@599f0000: Unevaluated properties are not allowed ('power-domains' was unexpected)
>>>
>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>> ---
>>>
>>> Notes:
>>>     Change from v1 to v2
>>>     - using maxitem: 64. Each channel have one power domain. Max 64 dmachannel.
>>>     - add power-domains to 'required' when compatible string is fsl,imx8qm-adma
>>>     or fsl,imx8qm-edma
>>>
>>>  .../devicetree/bindings/dma/fsl,edma.yaml         | 15 +++++++++++++++
>>>  1 file changed, 15 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/dma/fsl,edma.yaml b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
>>> index cf0aa8e6b9ec3..76c1716b8b95c 100644
>>> --- a/Documentation/devicetree/bindings/dma/fsl,edma.yaml
>>> +++ b/Documentation/devicetree/bindings/dma/fsl,edma.yaml
>>> @@ -59,6 +59,10 @@ properties:
>>>      minItems: 1
>>>      maxItems: 2
>>>  
>>> +  power-domains:
>>> +    minItems: 1
>>> +    maxItems: 64
>>
>> Hm, this is odd. Blocks do not belong to almost infinite number of power
>> domains.
> 
> Sorry, what's your means? 'power-domains' belong to 'properties'. 
> 'maxItems' belong to 'power-domains'.It is similar with 'clocks'. what's
> wrong? 

That one device belong to 64 power domains. That's just random code...

Best regards,
Krzysztof

