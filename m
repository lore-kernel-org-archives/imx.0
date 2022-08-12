Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F59C37A
	for <imx@lists.linux.dev>; Fri, 12 Aug 2022 08:30:27 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id x25so271099ljm.5
        for <imx@lists.linux.dev>; Fri, 12 Aug 2022 01:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=DiGq++8L+onGlbzyqSifDwiKR7o1FzZbcbbtnv3rVuA=;
        b=SH+X5cbxpgc5TySGkww8khFDFEUxB5zO7WG2WO3wclK6Xr37YjEMpFPR6kM/Rh28za
         RC9rgAnIGwRN/w9XlihbU4SqQHMAvkObAFCGSg3AySKx4AAIVaVoDkQdjOBFzEBJzoln
         Ihqn2sgglfpekHM27kQwrF9ZME2ZKw6JzZ9+HjgRjImVPrdT+2J403VVCyqBXqdWcyI/
         pEIFhMyZTcgJeTEskdQjL28eIHhuHJDsKDp/nI/Ro0acEV45QN4wSvu+lWMv9WPmeqXx
         7BtiDoHQ3ZGHoAJXEC8DAW+FA3dAOPm6ohdyo0aCafaaO3qqjo61AXUKRefqYjw0Dw1m
         qlyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=DiGq++8L+onGlbzyqSifDwiKR7o1FzZbcbbtnv3rVuA=;
        b=ntghmVKMsi0gRG+kbqTz7jRRB3aHdaqB8tWDz4qEn7xFQ4s+IKzrt3JXJYP5+fK1KT
         iZt76HNVb+z297Ynaqoi76EXYV8X/b7wuO4jEQorOFB2jpfUJmfvicRW/eccoT0lznSV
         pKXClbqdifmWoQhwTcdVGqlmGNCH4G7UT+zVsRa5GMAz/8A3942muzshusvnMXbQUWWq
         TEDpdP175Krejk1j3qZ8OOWwm8cxlL3BhNgkETOjtnOW4jXTGIuB1+V/dtd/N5keu9X7
         LsyBouF0Jt56dpO9zBaeuXyHQpY8ZBwyWSKU6Rg7lJYtMjselqKZCSwHI/Lb5ATsIZZF
         XYGg==
X-Gm-Message-State: ACgBeo3UT8XdMROMxc8Dv/SNXOAedRePHKm1O91ng4jRynym5Y2tyV8R
	y/XRtybgI6YUcyOUOg9kP3CvIg==
X-Google-Smtp-Source: AA6agR490Fje+0RZ9nk8vN+xnLWyRcUgRMfN6sb/V25nFrMySDrQMtC7bcbMjipBBsPw2gwOYHf0pg==
X-Received: by 2002:a2e:a808:0:b0:25f:f326:f2ab with SMTP id l8-20020a2ea808000000b0025ff326f2abmr927859ljq.152.1660293025328;
        Fri, 12 Aug 2022 01:30:25 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id m7-20020a056512014700b0048ad80a6d07sm132049lfo.170.2022.08.12.01.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 01:30:24 -0700 (PDT)
Message-ID: <33877eba-1d59-8e3a-4486-751ab9f955e8@linaro.org>
Date: Fri, 12 Aug 2022 11:30:20 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [EXT] Re: [PATCH v4 1/3] dt-bindings: gpio: Add imx scu gpio
 driver bindings
Content-Language: en-US
To: Shenwei Wang <shenwei.wang@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "brgl@bgdev.pl" <brgl@bgdev.pl>, "shawnguo@kernel.org"
 <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>
References: <20220811124135.95299-1-shenwei.wang@nxp.com>
 <20220811124135.95299-2-shenwei.wang@nxp.com>
 <db3020ef-7321-e171-b5bc-9c1795c2cced@linaro.org>
 <AM9PR04MB82741882E177387DB95AE3B589649@AM9PR04MB8274.eurprd04.prod.outlook.com>
 <01c832c4-6631-4865-30b3-7f060e27a7ff@linaro.org>
 <AM9PR04MB82747D7D07C481CC6981993189649@AM9PR04MB8274.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <AM9PR04MB82747D7D07C481CC6981993189649@AM9PR04MB8274.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/08/2022 18:30, Shenwei Wang wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Thursday, August 11, 2022 10:11 AM
>> To: Shenwei Wang <shenwei.wang@nxp.com>; robh+dt@kernel.org;
>> krzysztof.kozlowski+dt@linaro.org; linus.walleij@linaro.org; brgl@bgdev.pl;
>> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
>> festevam@gmail.com; dl-linux-imx <linux-imx@nxp.com>
>> Cc: devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
>> gpio@vger.kernel.org; linux-arm-kernel@lists.infradead.org; imx@lists.linux.dev
>> Subject: Re: [EXT] Re: [PATCH v4 1/3] dt-bindings: gpio: Add imx scu gpio driver
>> bindings
>>
>> Caution: EXT Email
>>
>> On 11/08/2022 17:52, Shenwei Wang wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Sent: Thursday, August 11, 2022 9:36 AM
>>>> To: Shenwei Wang <shenwei.wang@nxp.com>; robh+dt@kernel.org;
>>>> krzysztof.kozlowski+dt@linaro.org; linus.walleij@linaro.org;
>>>> brgl@bgdev.pl; shawnguo@kernel.org; s.hauer@pengutronix.de;
>>>> kernel@pengutronix.de; festevam@gmail.com; dl-linux-imx
>>>> <linux-imx@nxp.com>
>>>> Cc: devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
>>>> gpio@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>>>> imx@lists.linux.dev
>>>> Subject: [EXT] Re: [PATCH v4 1/3] dt-bindings: gpio: Add imx scu gpio
>>>> driver bindings
>>>>> diff --git
>>>>> a/Documentation/devicetree/bindings/gpio/fsl,imx-sc-gpio.yaml
>>>>> b/Documentation/devicetree/bindings/gpio/fsl,imx-sc-gpio.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..a1b024cddc97
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/gpio/fsl,imx-sc-gpio.yaml
>>>>> +description: |
>>>>> +  This module provides the standard interface to control the
>>>>> +  resource pins in SCU domain on i.MX8 platforms.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - fsl,imx8qxp-sc-gpio
>>>>
>>>> Now the filename does not match compatible. Use the same compatible
>>>> as filename.
>>>
>>> The subnodes under fsl,scu.yaml have their own naming rule. For
>>> example, the watchdog compatible is "fsl,imx-sc-wdt", but the file name is
>> "fsl,scu-wdt.yaml".
>>
>> The other files have for example fsl,imx-sc-wdt, so they match compatible.
> 
> I don't see the file fsl,imx-sc-wdt you mentioned under the watchdog directory.
> 
> $ ls fsl*
> fsl-imx7ulp-wdt.yaml  fsl-imx-wdt.yaml  fsl,scu-wdt.yaml

Eh, they looked similar enough that I did not spot it during review.
fsl,scu-wdt.yaml should be named fsl,imx-sc-wdt.yaml, of course.


Best regards,
Krzysztof
