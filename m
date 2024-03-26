Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA27F12AAEC
	for <imx@lists.linux.dev>; Tue, 26 Mar 2024 07:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711437101; cv=none; b=UnxVXDhVY5ahmZHUONPH2AMYLLKhjLdEks21CmhWa1Y+MLQltKPlS+a9GNC20pSFbUaE6x3hs7Vu+faVExZsm/BL/PA/tXvUSMx6/ufC0hNpogSn6PNgl1iLEb9jbm4/weow8MoWC9HSMIuZytk74DVcQynVmO0SkRNVwhODQHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711437101; c=relaxed/simple;
	bh=fyuSEI2cGbGpGB8qwlIMFD26pi6Q9G+07pjkAHXBNCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MbYrelL7Rh4WNpQ3A8FUoW9ursnFcSC6BJZ0IdmHrZqLt354iyXzw6c3h4OXG/6r/FJrSIcxYTSWeMRq1zAS5R4QaQG91ZZLYecCYN+GaSSvGPHIAgkew54x7d8+wK1POnkaNraaeUeCWli+a5QUuARRjwkxP0+wrTLk1h9FGt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nPQ4c+zk; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nPQ4c+zk"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56c2787aff5so598233a12.3
        for <imx@lists.linux.dev>; Tue, 26 Mar 2024 00:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711437098; x=1712041898; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CRgABjnsVuVK4PxTjay2cWac2hJ8gn4ZFGo6CCsUIAk=;
        b=nPQ4c+zk6MIJGhPwtIkVyTC0sotlNM6foeuVTwQwQ9vWaxbF3DutAERpe/2MsyumPa
         D/lMM0Q2S/PQ8LDfA5OqGHO/+f+ldYBajDzVm5CGj4OuFDJt4Vtqy9IC+XGx004oSewd
         RD72EUWM9do5ZacG26Bs67/wrioGwe6+2OTxK77TLebWSGZzJ/wpJ8+k3NYXjw6sbZk9
         +vLylO6uKCNuWeDwNTNkijCMMttDdX3r9lrHhBAV1bvs2pNIM3qp9/6vDo5CHwArTHGV
         iYefIcsTkDiOAeypFw362/Lx+HgEAAUqj52H2oQ3uBvNa6iY+4X5lV+GGRupIw0alPM1
         pqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711437098; x=1712041898;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CRgABjnsVuVK4PxTjay2cWac2hJ8gn4ZFGo6CCsUIAk=;
        b=Lc9Wuy0ns1Tos+gXXRf/TgoKYqfqmqOukC3hcOCUFBicBbZb9koZCbRU0rxJtvZKVf
         k2idsTowzkg3W51h/DBh3/+5M/9PS4ZVyw8pJmwHFOZSemn3YiGVW3N2HV+YjpSOnVpq
         rZbSIxymMGzitYWIa0NAABxECfNBqKkHqQo2bG62/wPUQsWuc+nGIp0g9OaqPTzC/NXH
         8Mp3ZujGOvxENZPrWyRigIzMzGfqNQe+aDT1sTTzm+kun5eDRVxneW137LF/oCUfbIyN
         CdbdZqaibbm0QQnDe386oe5xPvJ2qmcYIimCp1dnFGMtbdotuUxC+KkO0zQ+MkNH39MM
         SQtw==
X-Forwarded-Encrypted: i=1; AJvYcCWTLPg7QLgQlvt/85jndLzkesrRKxbIKP4ibbd6mT5JqWGSjOxlzmNW2fnGVILv0RQW8tYIYHvZhwO675Lo5NkAfM4L
X-Gm-Message-State: AOJu0YxJgJL6Pbxcz808imzBC+zVu+EiupExx855KoYdBHXmReXTWZ7F
	mR9lBsI5zM2pWe55fVbYXy4dc70lcpOqbf2F7BRpeULVcXAyYnIP539g1xgAytA=
X-Google-Smtp-Source: AGHT+IE20j3uR3nA36ra0wflx2Mz8VTwUFFpZ26m+MgDcApN8mvYR7fHHa9M/5Q82DI9c4quDgjbtg==
X-Received: by 2002:a50:d71e:0:b0:568:a05e:eafd with SMTP id t30-20020a50d71e000000b00568a05eeafdmr6369601edi.39.1711437098264;
        Tue, 26 Mar 2024 00:11:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id c14-20020aa7c98e000000b0056c2409ce15sm925928edt.49.2024.03.26.00.11.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 00:11:37 -0700 (PDT)
Message-ID: <75218bd1-0d88-4986-90a6-35f7bdc53918@linaro.org>
Date: Tue, 26 Mar 2024 08:11:34 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] dt-bindings: arm: Add Au-Zone Maivin AI Vision
 Starter Kit
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: Trevor Zaharichuk <trevor@au-zone.com>, Greg Lytle <greg@au-zone.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
References: <20240325203245.31660-1-laurent.pinchart@ideasonboard.com>
 <20240325203245.31660-5-laurent.pinchart@ideasonboard.com>
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
In-Reply-To: <20240325203245.31660-5-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/03/2024 21:32, Laurent Pinchart wrote:
> The Maivin board is an AI vision starter kit sold by Au-Zone
> Technologies, developed in collaboration with Toradex and Vision
> Components. It is based on a Toradex Verdin i.MX8MP SoM.
> 
> Add a corresponding compatible string.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 0027201e19f8..d892c4f9fda3 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1064,6 +1064,13 @@ properties:
>                - toradex,verdin-imx8mp-wifi  # Verdin iMX8M Plus Wi-Fi / BT Modules
>            - const: fsl,imx8mp
>  
> +      - description: Au-Zone Technologies i.MX8MP-based boards
> +        items:
> +          - const: au-zone,maivin-starter-kit        # Au-Zone Maivin AI Vision Starter Kit
> +          - const: toradex,verdin-imx8mp-nonwifi     # Verdin iMX8M Plus Module without Wi-Fi / BT
> +          - const: toradex,verdin-imx8mp             # Verdin iMX8M Plus Module

I think this should be part of existing "Toradex Boards with Verdin
iMX8M Plus Modules)", just renamed to "boards using Toradex Verdin ...".

Best regards,
Krzysztof

