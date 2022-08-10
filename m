Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020BE29A5
	for <imx@lists.linux.dev>; Wed, 10 Aug 2022 15:46:03 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id x9so12817617ljj.13
        for <imx@lists.linux.dev>; Wed, 10 Aug 2022 08:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=DCCjTYZ0qN8vBfPF1lwOb8EOTQj5fWe2+onwYOWjKsw=;
        b=BNTZtwqIPvOw5SsHSMFNsnlLhZ49JLS1j+DZDiuYlnDZ4zNxuI5qux+fn/wm783Joc
         m6fdIrPnJBco0EhE1TvkXC2uVOudAz3Qz/+T3W1v+Yp8bZusjPHFYuApNfGqg6O3qmc0
         WkON1bYYV/3nx+l+jMkK1p+md86rty447/XrPh0CTuY+w4B9rhsQrMTykBrdYVrGUbx7
         1UBt4hs/6oyTNMhruBx6y8EOsRVrRz3HCjg30qUOe9nD2fQcL/FRyIOZ6TBMTFTIFlXS
         vu2cBYpoly76o4eS85rLv0rQZ/eLprt9bxMplRMq+m/6klWJzinblrjV7uaOH0SvHamZ
         ANsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=DCCjTYZ0qN8vBfPF1lwOb8EOTQj5fWe2+onwYOWjKsw=;
        b=Gcmq9iJiQJRsR2kBN39U9S/31UyA+sxjMVM1R3CPm2GEzDdyElHj69wEvS1u5v8936
         rA6gUuyfvcmTO8Qvw+WIXoS241lGw6OM3rFo+XFNqJUCIOXQ04Cb3hVlcl/sTfUnPDXP
         Ooakw1IZe1NozBaP8mU+g+LGw44eZEEjgi4XDKp04Gs5qBbH8ElKawojQFChyuRyI+Nh
         5EUVCxJIqZT/HhEWpzVLAn/Sby5bWpBMWw9ZcYQij/d+DSWujUlzqkFaW0ZGJI8I9TAG
         G+OHZ6YxRG5ObuI4ToNZqAKsBerGwenCgLIAVf8V5OMZFnrSO9yjDCO4KdXRZYCkH1zY
         a7Qw==
X-Gm-Message-State: ACgBeo3v4KywEAL5zJTYB4rAI0OCBUpAIoWuTTW5jgLdcI/aETiRp+/M
	THKN6fdNKmf8gw1wnxqjHar/Qw==
X-Google-Smtp-Source: AA6agR5sH0ECkekUtJa3azyuIaHtiF8N4pVi6n1YrHGKr9bBBmKnyPTJAXXs3TI9F7mXBtYTGiz2rA==
X-Received: by 2002:a2e:9e17:0:b0:25d:8897:2a77 with SMTP id e23-20020a2e9e17000000b0025d88972a77mr8720646ljk.441.1660146362059;
        Wed, 10 Aug 2022 08:46:02 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id w4-20020a19c504000000b0048af6242892sm388217lfe.14.2022.08.10.08.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Aug 2022 08:46:01 -0700 (PDT)
Message-ID: <40ca4f73-aed5-3e2a-7fb6-cd3a2cb74cb9@linaro.org>
Date: Wed, 10 Aug 2022 18:45:58 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [EXT] Re: [PATCH v3 1/3] dt-bindings: gpio: Add imx scu gpio
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
References: <20220810133005.74653-1-shenwei.wang@nxp.com>
 <20220810133005.74653-2-shenwei.wang@nxp.com>
 <ec6fd9eb-f46d-afa9-b08b-15e202b3a624@linaro.org>
 <AM9PR04MB827495CB596427BD86A1522B89659@AM9PR04MB8274.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <AM9PR04MB827495CB596427BD86A1522B89659@AM9PR04MB8274.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/08/2022 18:23, Shenwei Wang wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Wednesday, August 10, 2022 9:46 AM
>> To: Shenwei Wang <shenwei.wang@nxp.com>; robh+dt@kernel.org;
>> krzysztof.kozlowski+dt@linaro.org; linus.walleij@linaro.org; brgl@bgdev.pl;
>> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
>> festevam@gmail.com; dl-linux-imx <linux-imx@nxp.com>
>> Cc: devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
>> gpio@vger.kernel.org; linux-arm-kernel@lists.infradead.org; imx@lists.linux.dev
>> Subject: [EXT] Re: [PATCH v3 1/3] dt-bindings: gpio: Add imx scu gpio driver
>> bindings
>>
>> Caution: EXT Email
>>
>> On 10/08/2022 16:30, Shenwei Wang wrote:
>>> Add binding document for the imx scu gpio driver.
>>>
>>> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
>>> ---
>>>  .../bindings/gpio/fsl,imx-sc-gpio.yaml        | 40 +++++++++++++++++++
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - fsl,imx8qxp-sc-gpio
>>> +      - fsl,imx-scu-gpio
>>
>>
>> This is too generic compatible and it even conflicts with the above...
>> Your driver binds to both without driver data which is even more confusing.
>> Make the compatible specific for one, given SoC.
>>
> 
> Oh, that's my bad. It is a typo. The generic compatible should be "fsl,imx-sc-gpio".  
> So far there is no driver data required for both imx8qxp and imx8dxl, but it might be
> required sometimes later in case the scu firmware is customized for a specified use case.
> That's why I put the generic one here.

That's not a proper reason to add generic one. Either all
implementations are compatible or not. If you are unsure, this should be
assumed as not and just use specific compatible. If you are 100% sure,
then use fallback, not two compatibles, and properly justify it.

Best regards,
Krzysztof
