Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABE8125D5
	for <imx@lists.linux.dev>; Mon, 28 Aug 2023 18:52:33 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-99c1d03e124so468415366b.2
        for <imx@lists.linux.dev>; Mon, 28 Aug 2023 11:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693248752; x=1693853552;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=msgoo0EGmKZT8iEDbAnkmxIQCbH4ZJi+yNmYHn/RV8k=;
        b=moL27IuVCTH2AG4+6tuUvP+GeGteJW5VZhN4gXHv5C1Dn/mx1zXOgP1nH65N7Nx1g+
         MaUl0ZgYI6SkiN0EP9UQtHdmbIjUl1rIrLJiPB4g9VO8MDk3M3oH8uQ1ewQZpQ5a9JFD
         zI71vOKS5GyReJz4Xc5DPLOktnjtK5y66GdSwQ3HtCrJEnleo3ZZfGoC/twyPrzJt3YM
         oCtdk5iVqv2/2bLqCLuHy+Zyt+qcTLquGp67KdqV4YrblGSVMyKSRg1NUZIiqNRf3aFH
         6TZeaPRu6lcQ749niSZImXLUjT77k2p6NPvfV5b1A/GwEwiogYV55j4RFi3LzBdEblum
         PcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693248752; x=1693853552;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=msgoo0EGmKZT8iEDbAnkmxIQCbH4ZJi+yNmYHn/RV8k=;
        b=WjpYiSFQI26AZwCU9RtN5phWBwx/e30eJm5nauAl/Ec3zGg8Ib024DtvtIGpg6HaKO
         zfnFNOY74RXrgS3a7cPJZlLkii/O6qcAT/Xh7vZwIAruCfRSVcFYq5BI0yiXVlriLsVo
         UbI1YA0xl5JCU5/AoZHzNHD+VCXTRVyv17uyNqplG++WU0i94kKIJo1qMcEPCOMctnO3
         U/aYqwvX3Pm8Uws7osq8SfJpd8s/nDaIHaKPhhks8TFgqUEWyn1FNrIsv8OLKAp/yzQH
         ktfnJsOW9FVcU/BA+az4zKienF7qYwOEk9TMnOsLDEBXNNPUPx4JIh/12hbY6zhydoKm
         Is9A==
X-Gm-Message-State: AOJu0Yzq2laH/yYLBM18xZANy793QdzwFEZmwymGKSWSBWifPp4cga9M
	AOV6fyv9JoRm78xqu795SOCBrQ==
X-Google-Smtp-Source: AGHT+IFJhhHTUDFg9dK6RUh/03jqVt7lmO39ivTXreeW8kAHxJp0tKCaq6azeuowmPdxM526mWbB8w==
X-Received: by 2002:a17:906:300c:b0:9a1:6252:16a0 with SMTP id 12-20020a170906300c00b009a1625216a0mr19361228ejz.46.1693248751894;
        Mon, 28 Aug 2023 11:52:31 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.225])
        by smtp.gmail.com with ESMTPSA id v19-20020a170906339300b009932337747esm4932604eja.86.2023.08.28.11.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 11:52:31 -0700 (PDT)
Message-ID: <f3e89479-14ab-d1d0-ad87-6f457f313c39@linaro.org>
Date: Mon, 28 Aug 2023 20:52:30 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/2] dt-bindings: power: Add regulator-pd yaml file
Content-Language: en-US
To: Shenwei Wang <shenwei.wang@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>
References: <20230818153446.1076027-1-shenwei.wang@nxp.com>
 <CAPDyKFqsn6kVjPFUdVyRxNDiOaHO9hq=9c+6eAK4N-v-LVWUPw@mail.gmail.com>
 <PAXPR04MB91858254554272C90822FED1891DA@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAPDyKFoV2Z=-WUiF3SgXqhF+K+r5QqsLgz8_hau0WKfZxTzYpg@mail.gmail.com>
 <PAXPR04MB9185F6AA20B0440B8FAB847789E3A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <4e2c18e3-b1ed-6361-3998-5de060d2bcf0@linaro.org>
 <PAXPR04MB9185957B729588D3E7CA3A5089E0A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <51fe3126-16ba-ade6-b106-e3683f96ad26@linaro.org>
 <PAXPR04MB9185DC79721E78E631F9889589E0A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <154b36de-652b-3931-96e6-04e99253a09f@linaro.org>
 <PAXPR04MB91852AD4E5242306B57A910B89E0A@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <PAXPR04MB91852AD4E5242306B57A910B89E0A@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/08/2023 20:50, Shenwei Wang wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Monday, August 28, 2023 1:42 PM
>> To: Shenwei Wang <shenwei.wang@nxp.com>; Ulf Hansson
>> <ulf.hansson@linaro.org>
>> Cc: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>;
>> Liam Girdwood <lgirdwood@gmail.com>; Mark Brown <broonie@kernel.org>;
>> imx@lists.linux.dev; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
>> dl-linux-imx <linux-imx@nxp.com>
>> Subject: [EXT] Re: [PATCH 1/2] dt-bindings: power: Add regulator-pd yaml file
>>>>>>> Are you suggesting to move the regulator-pd to the imx directory
>>>>>>> and add a company prefix to the compatible string?
>>>>>>
>>>>>> There is no such part of iMX processor as such
>>>>>> regulator-power-domain, so I don't recommend that approach. DTS
>>>>>> nodes represent hardware, not your SW layers.
>>>>>>
>>>>>
>>>>> That's not always the case, as we do sometimes need a virtual device.
>>>>> As an example, the "regulator-fixed" acts as a software abstraction
>>>>> layer to create virtual regulator devices by interfacing with the
>>>>> underlying
>>>> GPIO drivers.
>>>>
>>>> Not true. This is a real regulator device. Real hardware on the board.
>>>> You can even see and touch it.
>>>>
>>>
>>> The physical hardware component is the GPIO pin, which is what you can only
>> touch.
>>
>> No. The regulator is the chip.
>>
> 
> In the definition of dts node below, where is the chip? The real hardware is just a GPIO Pin.
>     reg1: regulator-1 {
>     	compatible = "regulator-fixed";
>     	regulator-name = "REG1";
>     	regulator-min-microvolt = <3000000>;
>     	regulator-max-microvolt = <3000000>;
>     	gpio = <&lsio_gpio4 19 GPIO_ACTIVE_HIGH>;
>     	enable-active-high;
>     };

There is a chip. This is the chip. If you have there only GPIO pin, then
your DTS is just wrong. Drop it. If you learn from wrong DTS, then sure,
power-domain-regulator seems like great idea...

> 
>>> The regulator functions virtually through software layer above of the
>>> GPIO driver. While we may call it a "regulator" or whatever else, this
>>> cannot obscure the fact that the underlying hardware is just a GPIO pin being
>> used in a specialized way.
>>
>> The regulator is some tiny little box, you can touch and called
>> ti,tps51632 or similar.
>>
> 
> We are talking about the specific "regulator-fixed" driver, why did you bring up "ti,tps51632" here?

Just an example. Can be TPS123098.

Best regards,
Krzysztof

