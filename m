Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D89201015
	for <imx@lists.linux.dev>; Wed, 12 Feb 2025 20:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739391199; cv=none; b=FVfTvPgCbJlq81UhaYZ1DHouruQdLrfnxq4qTCnuARJ37IQyQn7gQFnHh9IHc/HWFIn3uqirt3ULVYBABVBi1sYhc3xfWe021cGclTjXQzRDmjF9NH2FMEEco0qajjnEb4g1DQRQeAKfa+LI9SMcatvyXJoeYdhbfy5RMLzf2Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739391199; c=relaxed/simple;
	bh=j/NWfqrGg2Htwk0XbFpelCllT9Cca3nYwhWHYC4gO5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AGoNztnZCh0ue3b1e0zceyzPy+NfQi7aQ1TB09CSRuOQQSkW+QREtL1hLfKOrTwxxrn0HI6kF8ZD/FdLnQ+Vq5bgAl0Qb/YF92DgimB/SC9rB1QzueEAvCMWiihpgliEbbkjW4TF1T+/ypmZ7RolSgW4xDh0k782cy+ipj70d7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gjDi//O4; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gjDi//O4"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4395f645200so151605e9.2
        for <imx@lists.linux.dev>; Wed, 12 Feb 2025 12:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739391195; x=1739995995; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=siR4X3wXu1dY8Wk3/59DZPVn6YOYAggv/c5RGQ73U1w=;
        b=gjDi//O4HHmOEo/xxozOt/nQ3AKrroZZH+0EhPj4+XiJfPmacVAEsOxuCzj2LlhEMD
         88GXNtDwBzuv8VryeotjJTXa05Eysr3C/0j9K4yPhGU7msP+LeiGEmwQh2HnXetw7Xf8
         zv5l5m4pFq9ESBckcjYQNybqryunoj+p89BM8xJzmkSmpS6XQYW6gsEy6KHp1e9UwvrE
         9molOmAEqOMbzveIkrPOHwJlIfdihgGRq3aEVEH0Kfaf0ZpHy6nsrNwfhc30sb/Awm49
         LsKQywmy9MQpQ7bwcRxtNezCp7OedZsoSfFlBdKnY2IKshzYEHzZDTWy/44rFDv7sTww
         NQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739391195; x=1739995995;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=siR4X3wXu1dY8Wk3/59DZPVn6YOYAggv/c5RGQ73U1w=;
        b=Pf7xo+CzhUp+mZMFJhxYCpU4ULm4uv5gtRMMYkelduOkWI6VIl0W9M09IzvFRTFEh9
         HiOb/nWv1xzcjUYj/nRcefjuyuNAkNOnbdEnN8MYtPmpuCuy+K8eyEYKYx0NciCbGcVl
         OwZVv0YbBmYaiwBURNwGc9wzDpxGztf5ljH3QKgFLyXpnJ5t6jNya+qSSFMkxrooDhXR
         09fMaZPLVWweEyPK2gWdW+YEnQvpy6CRCzfz08crKNNBfv2Ki9igLcGVHdNVxyVTi/98
         cTeLX3ZdseaYY7OPSWB0gfZoQOVu34him0BsxymBtIVGJogeSmBlIpXCgScEJdG8oK4m
         p7Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWblKkOBelezjVeSwgfZtwvBAWLJINxlSV3v+NKGmtOvrwVqCD+lN0flYyyXsZDd+glro4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNGjxvl9SCGafAA9kEfKi4gth8GyJNtTs2u8xa9zHOtGdTt1Dm
	Y5UyKYKjll/j30m4L563R3po+pKZwZLYFBnPxnZ6Nd5QxKLYRGwvoD3byxL0NhM=
X-Gm-Gg: ASbGncssmXJr06iwyaaG9fQbe63mqLoxRxS+tbXhrcHteofYfjhcQLGmj0o+yyrfY0o
	112DrgtWPd52b8JdSl6GacJ5vjR6FbnSc76p/H8RDH3KbFqQ4/+BtApa4eyJuJbnJ1ctPx3qk3L
	kUO/nRy9pXWy+A4m28raBXDjDI0pz+UdGQx1YxHA9x5hEmpTFEJnvGo6oRr/6sWPxei5/erwyaD
	cfiSHmbS0WoUIVfJD3Zvx3/2ov8sColoSd9w/Lf+xrsiYIwJFfsCqMcIqNpFpnueNkrGzg8CuYB
	myjIfW9Gomos0mbbgpgW0tZUY6nkOO5Ys+g=
X-Google-Smtp-Source: AGHT+IHikjJvp5u8qCa0vEGl29r0IoBtI4+HDUF6b7Z7YpsAzvHLbGnS/H5Prc+T/NKOySlDUqzPlA==
X-Received: by 2002:a05:6000:400b:b0:38d:cab2:91dd with SMTP id ffacd0b85a97d-38dea270b48mr1432182f8f.6.1739391193872;
        Wed, 12 Feb 2025 12:13:13 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd4ebdb8csm12825633f8f.55.2025.02.12.12.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 12:13:13 -0800 (PST)
Message-ID: <83f805b2-afa7-4939-87c5-840d9aaf2443@linaro.org>
Date: Wed, 12 Feb 2025 21:13:10 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: ti: k3-am62a7-sk: Add overlay for fusion
 2 board
To: Sebastian LaVine <slavine@d3embedded.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Abel Vesa <abel.vesa@linaro.org>, Achath Vaishnav <vaishnav.a@ti.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Javier Carrasco <javier.carrasco@wolfvision.net>, Jianzhong Xu <xuj@ti.com>,
 Julien Massot <julien.massot@collabora.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mikhail Rudenko <mike.rudenko@gmail.com>, Nishanth Menon <nm@ti.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stuart Burtner <sburtner@d3embedded.com>, Tero Kristo <kristo@kernel.org>,
 Thakkar Devarsh <devarsht@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Will Deacon <will@kernel.org>,
 Zhi Mao <zhi.mao@mediatek.com>
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <20250212195656.69528-4-slavine@d3embedded.com>
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
In-Reply-To: <20250212195656.69528-4-slavine@d3embedded.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/02/2025 20:56, Sebastian LaVine wrote:
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 27fb3c1be732..bf6a48da0887 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21890,6 +21890,7 @@ M:      Stuart Burtner <sburtner@d3embedded.com>
>  L:     linux-media@vger.kernel.org
>  S:     Odd Fixes
>  F:     Documentation/devicetree/bindings/media/i2c/sony,imx728.yaml
> +F:     arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso
>  F:     drivers/media/i2c/imx728.c
> 
>  SONY MEMORYSTICK SUBSYSTEM
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index f71360f14f23..fcd8d11e5678 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -31,6 +31,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62-lp-sk-nand.dtbo
>  # Boards with AM62Ax SoC
>  dtb-$(CONFIG_ARCH_K3) += k3-am62a7-sk.dtb
>  dtb-$(CONFIG_ARCH_K3) += k3-am62a7-phyboard-lyra-rdk.dtb
> +dtb-$(CONFIG_ARCH_K3) += k3-am62a7-sk-fusion-2.dtbo

I don't see the overlay being applied.

> 
>  # Boards with AM62Px SoC
>  dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso b/arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso
> new file mode 100644
> index 000000000000..68e06d643bfd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk-fusion-2.dtso
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * DT Overlay for Fusion 2 (FPD-Link IV) board on SK-AM62A
> + * https://www.ti.com/tool/J7EXPAXEVM/
> + *
> + * Copyright (C) 2024 D3 Embedded - https://www.d3embedded.com
> + */
> +
> + /dts-v1/;
> + /plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&{/} {
> +       clk_fusion2_25M_fixed: fixed-clock-25M {
> +               compatible = "fixed-clock";
> +               #clock-cells = <0>;
> +               clock-frequency = <25000000>;
> +       };
> +};
> +
> +&exp2 {
> +       p9-hog {
> +               /* P9 - CSI_RSTz */
> +               gpio-hog;
> +               gpios = <9 GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name = "CSI_RSTz";
> +       };
> +
> +       p19-hog {
> +               /* P19 -CSI_SEL2 */
> +               gpio-hog;
> +               gpios = <19 GPIO_ACTIVE_HIGH>;
> +               output-low;
> +               line-name = "CSI_SEL2";
> +       };
> +};
> +
> +&main_i2c2 {
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       status = "okay";
> +
> +       i2c-switch@71 {
> +               compatible = "nxp,pca9543";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x71>;

reg is always the second property. See DTS coding style.



Best regards,
Krzysztof
