Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C45291C0F
	for <imx@lists.linux.dev>; Fri, 18 Jul 2025 08:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752826889; cv=none; b=hoPphCqILBcWhGUZWKvUYsGr7XYlZvX5lcQxRIK532d87xUmyWwZD1Ai/0b1YXnkcj7x5yxCeNAmPGQ4imsxATWpVAHfsuHUV4kWFiYRHt2XDAjMxQtSVt9UvI9YcfdGPgLKCeeMqCxS5gQjcudNOnXsYUs7iey1PkBPVUewQYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752826889; c=relaxed/simple;
	bh=oKsb6nXBtB9CLylsD8//kkCSnORTdVYyoxwsP6Ck4aA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GRKr9jl5UxUhHxFVq+LKERrU3KW3N9jmP2VpSLUSn42P8Zz4uwmz/UOtcBa/GCHKHVLpUmFsUxlcP0ocg5Eonxmc4juwQBaSVdcuN9G/7+dRMhYhBnfX998X6pV36zsUcarJVvjxGyMMmBRi5o02ml+yAVnatJLnZhfP/31b4MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xo5N3l0t; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xo5N3l0t"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae34f43be56so29316166b.2
        for <imx@lists.linux.dev>; Fri, 18 Jul 2025 01:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752826886; x=1753431686; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Gge5WY60Rp/brYDLLchrO4CnSy89m4VC/nhi82o+ix0=;
        b=Xo5N3l0t4bYLvg91LWWqGiL7jLGjLkU5RaGrBwoTrm/RI7e4q9ytJhYVtTz8giI8hT
         AkjHGIdCM6i1+f4um3NJqqhqjbHOppzene/fUb6fNCseiaMv18AtzKLYdkzyfbbjcm2a
         wgQNqaHjW9WIHj7gJdoH0oZs+D0W2mxrRC0stbCBFnasDq85TF2kohriNZV8G9uxnJfg
         NLyiYPlUZ7iksqWmLP1+owydozgtyULgkWrGnLT0qFb4IwCFItPkjFakuADIYKEbc2Kj
         Y5Jpg0uNCnYJiBtChKl9ZHkDb4+EtfkawjXg6Y3oQn7ZxnPat6f6WwiqpbbuUA9Yl6NG
         5aBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752826886; x=1753431686;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gge5WY60Rp/brYDLLchrO4CnSy89m4VC/nhi82o+ix0=;
        b=M7V7x8ZOoRBFH8z+ruh/y7khlFqXWq1JX7AZ8UnUJWlflFwv9HCn/Kd16VfLlmHn01
         iZox6T60rxJtvo+6zkck5F9aFq7Igly5xFXLflpCS1Hp38PmWfhRmtTsLgZWeFVwEZDp
         r/jCuw5xbE6+QHaEr97aoKBzHwchTLcNiCzNqN0FVRN6LcFJxB5ikYF5Y8r9tfVhFYMC
         j6rPMAk04JwSH9U3DUy+gfk9afARMF8W0bbHgTPBktRGW+bfatvJE8MqGKyW1m+ToZnf
         u9SO77YjBZVz3YkKUZR4+1ddG0qidvqTFRJAN6+YXrdJVkT5RKWaZg+O3zX3BByriQtA
         puOw==
X-Forwarded-Encrypted: i=1; AJvYcCUqHhn1oGELCiSyHhgKHwYxzyyB76rA0TUqoTzJU3t9wkoAJ/6qbBxPSg0DIdNPF52XSI4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0iACXQsI6yUQl3b2/CYoVtRdtNRMloezcBb65sZ2GP5+Szwkh
	pB6HrPOkAiRZWNIDUwF8KOmIOJsNiO1EJvx8KeKi69otQVg656ccZlT7bFV7qJFJvsY=
X-Gm-Gg: ASbGncs/mHqyhqEXrfEKz8kObIWgMqhvI8k7p3e/xuvCCm1/qlEhxJ2BTPK6k07kp+6
	W4NEPuwyzea8Wj5s97Vquovd4xmuNR2KL9HVB7TIH/52R2yxNHami5lgcs3eHeDc8pJ2KGjnfNf
	LfueJDzD36NJbDXSvN8W71Uph0mj3hPv8A4befafrqxyIWCBTzdOybENY4ki3TZkrElXphL94+M
	Ny2i06OUcX3y5V8kiCIvsm9gEqMXso/a4VB1rPZWy1uDZfk61ma5CWWIMPL1XWrtWz5cKNhqdVw
	yRjmMbg8d+gREc4gQ88kM3FblHhiozzBmSM+fTBIUjj21c1wMtiK/FH2Ct+X8+mMo0OLi1/MNy0
	ft+s6IyVX7VPUvD4TC1WA4POV7J02iGK7Qz4Ypx9CTQ==
X-Google-Smtp-Source: AGHT+IHzWIzOFiN81mXWsIwlcADAW/TciskQv42/IcHuT0StqjmbrWG5adDVugJYhOStZ3cEIlESlQ==
X-Received: by 2002:a17:907:72c6:b0:ae0:caeb:276d with SMTP id a640c23a62f3a-ae9c99973c2mr354671566b.4.1752826886280;
        Fri, 18 Jul 2025 01:21:26 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c8f0a267sm608092a12.11.2025.07.18.01.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 01:21:25 -0700 (PDT)
Message-ID: <0e72dd5c-c633-4265-a6a9-ed8ef7dbf67c@linaro.org>
Date: Fri, 18 Jul 2025 10:21:23 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] remoteproc: imx_rproc: Support i.MX95
To: Peng Fan <peng.fan@oss.nxp.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Peng Fan <peng.fan@nxp.com>, "Rob Herring (Arm)" <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Frank Li <frank.li@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Iuliana Prodan <iuliana.prodan@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>
References: <20250710-imx95-rproc-1-v4-0-a7123e857dfb@nxp.com>
 <175224423523.783161.17907302929832941912.robh@kernel.org>
 <PAXPR04MB845959EF2767C96794EAE6DD8854A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <aHkNS51jgV5ulsNB@p14s> <20250718082033.GA25126@nxa18884-linux>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
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
 DFH41ZZ3t1Qbk0N9O0FimwUCaBdQXwUJFpZbKgAKCRAbk0N9O0Fim07TD/92Vcmzn/jaEBcq
 yT48ODfDIQVvg2nIDW+qbHtJ8DOT0d/qVbBTU7oBuo0xuHo+MTBp0pSTWbThLsSN1AuyP8wF
 KChC0JPcwOZZRS0dl3lFgg+c+rdZUHjsa247r+7fvm2zGG1/u+33lBJgnAIH5lSCjhP4VXiG
 q5ngCxGRuBq+0jNCKyAOC/vq2cS/dgdXwmf2aL8G7QVREX7mSl0x+CjWyrpFc1D/9NV/zIWB
 G1NR1fFb+oeOVhRGubYfiS62htUQjGLK7qbTmrd715kH9Noww1U5HH7WQzePt/SvC0RhQXNj
 XKBB+lwwM+XulFigmMF1KybRm7MNoLBrGDa3yGpAkHMkJ7NM4iSMdSxYAr60RtThnhKc2kLI
 zd8GqyBh0nGPIL+1ZVMBDXw1Eu0/Du0rWt1zAKXQYVAfBLCTmkOnPU0fjR7qVT41xdJ6KqQM
 NGQeV+0o9X91X6VBeK6Na3zt5y4eWkve65DRlk1aoeBmhAteioLZlXkqu0pZv+PKIVf+zFKu
 h0At/TN/618e/QVlZPbMeNSp3S3ieMP9Q6y4gw5CfgiDRJ2K9g99m6Rvlx1qwom6QbU06ltb
 vJE2K9oKd9nPp1NrBfBdEhX8oOwdCLJXEq83vdtOEqE42RxfYta4P3by0BHpcwzYbmi/Et7T
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250718082033.GA25126@nxa18884-linux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/07/2025 10:20, Peng Fan wrote:
> On Thu, Jul 17, 2025 at 08:48:43AM -0600, Mathieu Poirier wrote:
>> On Mon, Jul 14, 2025 at 11:52:05AM +0000, Peng Fan wrote:
>>>> Subject: Re: [PATCH v4 0/5] remoteproc: imx_rproc: Support i.MX95
>>>>
>>> [...] 
>>>> New warnings running 'make CHECK_DTBS=y for
>>>> arch/arm64/boot/dts/freescale/' for 20250710-imx95-rproc-1-v4-0-
>>>> a7123e857dfb@nxp.com:
>>>>
>>>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb:
>>>> scmi (arm,scmi): Unevaluated properties are not allowed
>>>> ('protocol@80', 'protocol@81', 'protocol@82', 'protocol@84' were
>>>> unexpected)
>>>
>>> Same as replied in v3.
>>> This is because [1] is still not picked, not because of my patchset.
>>
>> I won't move on this patchset until this is resolved.
>>
> 
> Not understand why hold on this patchset. I suppose you may not
> understand what the error means. The warning is totally irrelevant
> to this patchset, there is no dependency.
> 
> Others added a property to arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
> &scmi_bbm {
>         linux,code = <KEY_POWER>;
> };
> But this "linux,code" property not landed(missed to be picked up) to DT binding.
> 
> This patchset does not touch scmi_bbm. I could help address the warning
> in the other patch, but I do not see why "linux,code" under scmi_bbm node
> could block this patchset.


Lack of proper binding for that property might hide other issues with
this patchset, because schema is not evaluated. Make your DTS and
bindings correct, then start growing the device nodes.

Best regards,
Krzysztof
