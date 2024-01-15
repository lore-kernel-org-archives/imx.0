Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8061AACA
	for <imx@lists.linux.dev>; Mon, 15 Jan 2024 20:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VJ9PPyNQ"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-4b72f2bdbdaso2330072e0c.3
        for <imx@lists.linux.dev>; Mon, 15 Jan 2024 12:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705351105; x=1705955905; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=azIMrD8dDRawfeV8OXx/zcEfaMDpsei97adQc05gFGs=;
        b=VJ9PPyNQjXOnZygJbI0HLO0SZc9eyXB8Ay7U1jsU7EtM8TbdH+dFE9bFMHB6luZ04J
         +5A1Pz2R4QqLBbvreeklRi8NK5Q3SMVodEhyKe+p+Kpx+K8WyMwfEJrHXfqrcS5LMxSO
         wjdts7kc8jfnDKPEEsRTvMsxjLfGTEgQSovciytAzeiXLBNldiFDXftwFjIcbBXQiMGJ
         a39nT2/EOibH1BzXElHrxOxh0nD1UkD0cAoaFl0iXrb7+jq1T5wZrDIWeEt3KbE07mg8
         WflIPiE/ppGXq7lgvNly3YReR05lP+sOkpiifP/B+Y/EY0Rjir6FVykxAGXsGZ9uaqy1
         ifTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705351105; x=1705955905;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azIMrD8dDRawfeV8OXx/zcEfaMDpsei97adQc05gFGs=;
        b=W1CZEzaLyeYgkdTj4nqJGBSINqn0UFiPQcrB/G7w24a0oC72yJgdYKdpbtnAjf5Vs6
         gi2nVmZJji7j5fi+XFsbZQQ+sbmKr84gDjz2E8Bx2+MsSnC/sPiI+4ikR4nPFnwuZG6m
         +ywK3/zf6qGMeXf7WS0oxUexet2JRawN3qFyoeKqNDbY37XOgnCSUOojm4a9h+WcxBk5
         Az03RiJrxvlcqhu4sV57iqHwqdDEa2H9jAoHTE2BDj71FD1yNlTuI0NKaS1/hibSiMDS
         BXob5BHEtyBTjm4HWnGwsB2zxXA8xCjCKdxVYFkCURIFNtunTLNBDeR41bASvz7Rs5eh
         VbIA==
X-Gm-Message-State: AOJu0YzTABUmhDndb3TLJesBbqeZjBKmTARdGnFUMpFMRtwkx19ez5ph
	lLtDH8gvtsb1sQX8/2DAO+lyJEPj5wRBTw==
X-Google-Smtp-Source: AGHT+IFAPHfVnov1xOEdq8jW2isgxqd6CWm3tqaaQraVLttS2Oji/OpTgvC7LJdAWSOAOr2b2LD/iw==
X-Received: by 2002:a05:6122:1783:b0:4b7:8199:5d11 with SMTP id o3-20020a056122178300b004b781995d11mr3094361vkf.8.1705351105040;
        Mon, 15 Jan 2024 12:38:25 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id p15-20020a056122114f00b004abd893ae1asm368683vko.56.2024.01.15.12.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jan 2024 12:38:24 -0800 (PST)
Message-ID: <1b628901-7f71-4c97-9a16-723912988417@linaro.org>
Date: Mon, 15 Jan 2024 21:38:19 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] dt-bindings: i3c: svc: add compatible string i3c:
 silvaco,i3c-target-v1
To: Frank Li <Frank.li@nxp.com>
Cc: robh@kernel.org, alexandre.belloni@bootlin.com,
 conor.culhane@silvaco.com, gregkh@linuxfoundation.org, imx@lists.linux.dev,
 jirislaby@kernel.org, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 miquel.raynal@bootlin.com, zbigniew.lukwinski@linux.intel.com,
 devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20240110175221.2335480-1-Frank.Li@nxp.com>
 <20240110175221.2335480-3-Frank.Li@nxp.com>
 <3c0be658-e7a6-4231-b206-86ffb47e0cb2@linaro.org>
 <ZaFbbeQrC7o2dchO@lizhi-Precision-Tower-5810>
 <e3b9aa63-25a5-41cc-9eb7-6e7d1eacb136@linaro.org>
 <ZaFjaWCA6k+tiCSJ@lizhi-Precision-Tower-5810>
 <ZaWLCrWJEMtFx8cR@lizhi-Precision-Tower-5810>
Content-Language: en-US
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
In-Reply-To: <ZaWLCrWJEMtFx8cR@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/01/2024 20:44, Frank Li wrote:
> On Fri, Jan 12, 2024 at 11:06:01AM -0500, Frank Li wrote:
>> On Fri, Jan 12, 2024 at 04:50:25PM +0100, Krzysztof Kozlowski wrote:
>>> On 12/01/2024 16:31, Frank Li wrote:
>>>> I review previous comments. The previous RFC patches and I just want I3C
>>>> expert review to check if there are comments about whole software
>>>> architecture. Of course, thank you for your comments about "slave".
>>>>
>>>> Go back this binding doc problem. 
>>>>
>>>>   "No, it's the same device.
>>>>
>>>>    Anyway, this was not tested.
>>>>
>>>>    Please use scripts/get_maintainers.pl to get a list of necessary people
>>>>    and lists to CC. It might happen, that command when run on an older
>>>>    kernel, gives you outdated entries. Therefore please be sure you base
>>>>    your patches on recent Linux kernel.
>>>>
>>>>    You missed at least devicetree list (maybe more), so this won't be
>>>>    tested by automated tooling. Performing review on untested code might be
>>>>    a waste of time, thus I will skip this patch entirely till you follow
>>>>    the process allowing the patch to be tested.
>>>>
>>>>    Please kindly resend and include all necessary To/Cc entries.
>>>>    "
>>>>
>>>> It is the same devices, work at difference mode (master  and target).
>>>> what's do you want to change to?
>>>>
>>>> Copy to new file like pci/pci-ep? all context is the same, except for
>>>> compatible string. 
>>>>
>>>
>>> Apologies, I mixed up a bit patches, so this was not obvious. I meant
>>> this comment:
>>>
>>> https://lore.kernel.org/all/20231017201404.GA2570433-robh@kernel.org/
>>>
>>> There is no indication in your commit msg that these concerns were
>>> addressed.
>>
>> Look like everyone already accecpted 'silvaco,i3c-master-v1'.
>>
>> driver part:
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=8911eae9c8a947e5c1cc4fcce40473f1f5e475cd
>> dts part:
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b8ec0f3b42a3498d5115d1fb1490082ab525747b
> 
> @Krzysztof:
> 	Patches were accepted after discussion, what you ponit to. So I
> think everyone agree on the name 'silvaco,i3c-master-v1'.
> 	I plan send next version to fix auto build error. Any additional
> comments about this?

I still do not see how did you address Rob's comment and his point is
valid. You just did not reply to it.

Best regards,
Krzysztof

