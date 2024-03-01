Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F54C5FDC3
	for <imx@lists.linux.dev>; Fri,  1 Mar 2024 06:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709274650; cv=none; b=h2SCdOAR7milLSTC5OEHcL4sG0fnALythxuTAL+GHGpkjqAHt6YSNmdWxyUs2rMXu5FrEMpZzcYX8TqJvf9mmsGyQE/XuhXA6zLZUyCt5gH8ZEQqhgimZ6k/JrFeKDT/TRdiefVJaQoaEMP/EHOBfq20N0uBGCy9xiuu1fpkgV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709274650; c=relaxed/simple;
	bh=k5V8vWbKOVu5rrnBCKAXa/253TOmV4ruxxbPCrXY1KM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G6SSvIdffA48q9evYb1Cz0f9nVzIoh2mX5j6NUtTcme4OuE3cEg0F9Mgc+602H4vJ+UA98DQbYygfOaQrCLzTYlzd6+SJTc53t58zPx66tMi6HZeNacYnpN+qHhX9yYjHVqxWuuQ/P/NObgUB+DfSAaoXEdWEv++4T6agzxJ02E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UcPg1+ai; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UcPg1+ai"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-563cb3ba9daso2354557a12.3
        for <imx@lists.linux.dev>; Thu, 29 Feb 2024 22:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709274647; x=1709879447; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aQcieXKF9GCrmMdAMMXGeMlTjz7NiZHPsZQNigcQEYE=;
        b=UcPg1+aiG3+pcA58n4BC17RvNfo5j40mvrW9y2fBKPnHSJvq4di4YZrpX7nzgYFZWP
         CSumR1vLk/Si5Hc3YO23PiuyBYkiKIvd0rrq+wkRtDHsE2JcYlOCB4BuIm6ssY1mqWnS
         YtzZT9rrR12mpzK0hYyqGotg0DXXI7Vj46IzaX4i1J519TvFCnOViKtqCMOf7wWVwtaf
         QMv279lgi7PccUsf7Cjw5c4GtGSFzPFMt3AyGisF15x4POGfSLyN0Ywe5HBswsu82Oi2
         QJJWfCP0ZVoeJ7vKoG4trL8ReW4h8VoDJr1xMKykyFWaGbW3Pn/6E+zxvYbblzv6x5EW
         RZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709274647; x=1709879447;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aQcieXKF9GCrmMdAMMXGeMlTjz7NiZHPsZQNigcQEYE=;
        b=qQK1z/OkDtNLGqyevMUabHiwBAHb96V7UpaZ3RJeiNpgi3cH3ToCmSOAC90ErHDVGY
         KkBOBpq+Fm+ZiQoH+KhhDGQauvDudVics0whUn5exCY19/bJVlXYDj+01vTo38A8Sgyz
         P/MMnURmc1onCnJqoM45+MFoFSKXq8Etg5XDcIijL4ZmS6XN+MJwP4kJ+FcEaJGdt2lR
         /ECeWWVPDQEgSlqbtEUnkLX/ghf3XGi5rK8uLlzAFWXzF0hfSx+11o+kPTuNGvOYFSJM
         Qwdd2sejTIh6cvb5NQGiy3Yo6P+7N6Oj2SRGh2d8v1RuwxBaY5Hhl2YZwKIaJprR8C7C
         7ToQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+PwN+iFRz4/LPH9FzqjB+E8tU7rTTf0yLLXgSG0UXDTcRRxqzxIFcBKMTNoWrGJA4aG3iEFVKY4V125NJHgzYSE/P
X-Gm-Message-State: AOJu0Ywlis8gEuLeQnz8gcmjq2OyWVaG9ugzTwA3szy++g1YrckJGzf4
	zIUQcynnLQyRXzNwCYpJMt9hyfa+UBkWN47sv/33RrcAkitP0os1CbRCVkjDsZ4=
X-Google-Smtp-Source: AGHT+IGSNoAmpYgNPAtqvUYUD4eCOtLsMfV3o/9sM6pyzlMN2Qlq4pj7F3rZftORbzbgCQ7xE0a3KQ==
X-Received: by 2002:a05:6402:5245:b0:566:dede:1f82 with SMTP id t5-20020a056402524500b00566dede1f82mr116248edd.29.1709274647520;
        Thu, 29 Feb 2024 22:30:47 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id o20-20020aa7c514000000b005663e9bd8c1sm1258757edq.38.2024.02.29.22.30.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 22:30:46 -0800 (PST)
Message-ID: <a1861d70-80e2-4f42-b99a-f2b8c8efe042@linaro.org>
Date: Fri, 1 Mar 2024 07:30:45 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] ASoC: dt-bindings: fsl,imx-asrc: update max
 interrupt numbers
Content-Language: en-US
To: Frank Li <Frank.li@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240228-asrc_8qxp-v3-0-d4d5935fd3aa@nxp.com>
 <20240228-asrc_8qxp-v3-2-d4d5935fd3aa@nxp.com>
 <3460ecc8-d7d7-4d1c-ad0c-b32efc3b9049@linaro.org>
 <ZeFTqM8o/eozl+MS@lizhi-Precision-Tower-5810>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZeFTqM8o/eozl+MS@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/03/2024 05:03, Frank Li wrote:
> On Thu, Feb 29, 2024 at 10:44:42AM +0100, Krzysztof Kozlowski wrote:
>> On 28/02/2024 20:14, Frank Li wrote:
>>> fsl,imx8qxp-spdif and fsl,imx8qm-spdif have 2 interrupts. Other platforms
>>> have 1 interrupt.
>>>
>>> Increase max interrupt number to 2 and add restriction for platforms except
>>> i.MX8QXP and i.MX8QM.
>>>
>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>> ---
>>>  .../devicetree/bindings/sound/fsl,spdif.yaml         | 20 +++++++++++++++++++-
>>>  1 file changed, 19 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/fsl,spdif.yaml b/Documentation/devicetree/bindings/sound/fsl,spdif.yaml
>>> index 82430f1d5e5a2..785f7997eea82 100644
>>> --- a/Documentation/devicetree/bindings/sound/fsl,spdif.yaml
>>> +++ b/Documentation/devicetree/bindings/sound/fsl,spdif.yaml
>>> @@ -31,7 +31,8 @@ properties:
>>>      maxItems: 1
>>>  
>>>    interrupts:
>>> -    maxItems: 1
>>> +    minItems: 1
>>> +    maxItems: 2
>>>  
>>>    dmas:
>>>      items:
>>> @@ -100,6 +101,23 @@ required:
>>>  
>>>  additionalProperties: false
>>>  
>>> +allOf:
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          enum:
>>> +            - fsl,imx35-spdif
>>> +            - fsl,vf610-spdif
>>> +            - fsl,imx6sx-spdif
>>> +            - fsl,imx8mq-spdif
>>> +            - fsl,imx8mm-spdif
>>> +            - fsl,imx8mn-spdif
>>> +            - fsl,imx8ulp-spdif
>>> +    then:
>>> +      properties:
>>> +        interrupts:
>>> +          maxItems: 1
>>
>> else:
>> minItems: 2
> 
> I think needn't 'else' here. Top have set to maxItems is 2. 

So explain why one item is correct here.


Best regards,
Krzysztof

