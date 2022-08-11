Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20B133C6
	for <imx@lists.linux.dev>; Thu, 11 Aug 2022 15:10:44 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id o2so18627802lfb.1
        for <imx@lists.linux.dev>; Thu, 11 Aug 2022 08:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=ythLCoVb9L2vBawwAE87aN65NfOERO7MePsawDGE0HM=;
        b=GpHMp+mUorkB7eVPzZYP3xQ08kbw0mkr0pImGlClMbek72EeegLNz+nhuMZOo7wuLu
         qzOjPuzyDt/Y/ThaKW3KFd16H+SO0VVDwWvTJKnr73a1nhQo8fQr0LvCzR+VBl1QL9f6
         m1xSxv7/TpzHVngyUuhfrCYcVrAK0M2o8pR9d67WHzKPntTsGTIjYLMSd2BMshgaNv7f
         ZwfuvnLKFxkSo6EY4u84KS6jhrXCMD1PO9/uETlCO0Tac3Ey02V40jeHKh4uN13U3XOU
         3gsVNo/HiWRRtRqs/cJtjtlwzh93ZwtURmiGfAm95rmKR13v4hPOrhsG13yhr0GvZotH
         SfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=ythLCoVb9L2vBawwAE87aN65NfOERO7MePsawDGE0HM=;
        b=nFykAD0BYbYyVu8YiVcquaxAA60mYdZT1ohdnllS8LBW7MYWIQDirr1LZfMKLzi3Nt
         btU0Ha62bnZrQHZXWFFjzUoX0UAOwVXkwEagQ896nS8PhLyRWtiCOrNCu+mObbzPVxQB
         QBV4qQccJYb32el9F8YpGWf26hHFIeJ/hBbH+r3cZGAUKtT5mcXfU1JmX+7Q0Z7DqZP9
         hIS/6EWHTFS+AC7r5wRmy/HxG71p7mWd6rOjnhw3+TrNj92A2eDKU0OREio/eP0Ebt8b
         Ibw3N8Nb1PrTmT41aunu5SY1tqC02yKh62uUh8pxEkZneLs6fNKgEBLGDMIEsOVGm5Ba
         9z+g==
X-Gm-Message-State: ACgBeo0KnEsZw+nkBJEtM++OevEca/MSlDH+jXeOS6ZwXxFu4KT/xfEE
	MkRADneiTLBcQ1IIAq0ceHQ7Iw==
X-Google-Smtp-Source: AA6agR7oR08zhJzkZ8rf5MkbjaIHuaVnR+OLR5jaO9Pq5H4A3inAXP8eN7ZQLCJOAcsPhXzgtxQT9w==
X-Received: by 2002:a05:6512:2316:b0:48a:f2e3:be97 with SMTP id o22-20020a056512231600b0048af2e3be97mr10845161lfu.383.1660230642636;
        Thu, 11 Aug 2022 08:10:42 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id w12-20020a05651234cc00b0048137a6486bsm726277lfr.228.2022.08.11.08.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 08:10:42 -0700 (PDT)
Message-ID: <01c832c4-6631-4865-30b3-7f060e27a7ff@linaro.org>
Date: Thu, 11 Aug 2022 18:10:36 +0300
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <AM9PR04MB82741882E177387DB95AE3B589649@AM9PR04MB8274.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/08/2022 17:52, Shenwei Wang wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Thursday, August 11, 2022 9:36 AM
>> To: Shenwei Wang <shenwei.wang@nxp.com>; robh+dt@kernel.org;
>> krzysztof.kozlowski+dt@linaro.org; linus.walleij@linaro.org; brgl@bgdev.pl;
>> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
>> festevam@gmail.com; dl-linux-imx <linux-imx@nxp.com>
>> Cc: devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
>> gpio@vger.kernel.org; linux-arm-kernel@lists.infradead.org; imx@lists.linux.dev
>> Subject: [EXT] Re: [PATCH v4 1/3] dt-bindings: gpio: Add imx scu gpio driver
>> bindings
>>> diff --git
>>> a/Documentation/devicetree/bindings/gpio/fsl,imx-sc-gpio.yaml
>>> b/Documentation/devicetree/bindings/gpio/fsl,imx-sc-gpio.yaml
>>> new file mode 100644
>>> index 000000000000..a1b024cddc97
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/gpio/fsl,imx-sc-gpio.yaml
>>> +description: |
>>> +  This module provides the standard interface to control the
>>> +  resource pins in SCU domain on i.MX8 platforms.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - fsl,imx8qxp-sc-gpio
>>
>> Now the filename does not match compatible. Use the same compatible as
>> filename.
> 
> The subnodes under fsl,scu.yaml have their own naming rule. For example, the watchdog
> compatible is "fsl,imx-sc-wdt", but the file name is "fsl,scu-wdt.yaml". 

The other files have for example fsl,imx-sc-wdt, so they match compatible.

> Is the filename required 
> to match its compatible?

Yes, that's the convention. Otherwise people tend to name the files in
whatever way they like...

Best regards,
Krzysztof
