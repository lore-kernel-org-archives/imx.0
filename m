Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D6DBA44
	for <imx@lists.linux.dev>; Wed, 22 Mar 2023 21:42:41 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id eg48so78594032edb.13
        for <imx@lists.linux.dev>; Wed, 22 Mar 2023 14:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679521360;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jg9tSWAP2QBlPFC6Uk7vBpvg/zpu+PHPpGRA2+gIPBw=;
        b=Bvjsp4F4PvN/4IbBDsDWgF6UZuOr0HIkdC4x31cck7sPEOcrtmoF41x/Vyew2LvjFR
         wAJ5z5/DijkP1s2QD88CElYS2CkDSWQ2UD1xXNQ9ZuUi0xlw2b14eN/FmQksw2szbQ6j
         EK3zuG54zn+B0ajBvfkmCOAxs6C3kMtgt/dPGGmQVxn/bjB/L4ir/KlTPBl2Ds0tb21Z
         8SsqzaInIv5v34pj8zNOBu35SrCNTsLx75w/h465+OX2RUw730ExiuHaNac/DZaXWpAX
         WiHuLUiucTyCQwLYovkgGVBliwMxv2vROBuWJOZqveqDYWBzR3mPXGiFwMnwa6GulcCA
         DXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679521360;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jg9tSWAP2QBlPFC6Uk7vBpvg/zpu+PHPpGRA2+gIPBw=;
        b=SmZZlAGHzXKnh4RKDImPLuJ345Ht3CzJBwC6FXdzwzqqWWqoW/4SUxIrwvgYyBo/cp
         2TmODP2uu15TlkCBSdQ9lXlg6Xwtcjn1FaNtn8JxSnPAPZR6z+gFZAiKeNsCFrqk/PnZ
         Kt+WJE6dgBSxRaOr/3r4wddq78xhwvmGGay4oTyZ2tcgWGnu7pRICvialde8zvqJFYBq
         2yjM8bC2+OSdeKpL8pWQDtG3kBe5FWREvGYPH/YRh7nkeR3bQtB6TkMoLCB4pj/u+xlI
         IhdgssSpUNjp+xC7l8Y/pEU0CMkH96eDE1+kIPdp2BVcGrBWUf3cC95t+3Rg1iTYpRU/
         Hrug==
X-Gm-Message-State: AO0yUKUn26VgBYE3iKnQPk3tTXjjkLg0yNQ/EHLqcEKqaJ8OX2RuKTH/
	w4Czd3D2GS/v/bXGeKmVk0PoVA==
X-Google-Smtp-Source: AK7set9S7vlHaPQk+/iOpvQzXSlZJcMwxUj0BsgSMuA85DY34E9csw8r5UTjJPWpti7s4VnZutaMQQ==
X-Received: by 2002:a17:906:7102:b0:8b1:806b:7dbb with SMTP id x2-20020a170906710200b008b1806b7dbbmr8817603ejj.51.1679521360161;
        Wed, 22 Mar 2023 14:42:40 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:626d:5729:6e71:4c22? ([2a02:810d:15c0:828:626d:5729:6e71:4c22])
        by smtp.gmail.com with ESMTPSA id ja21-20020a170907989500b0093338259b2bsm6211230ejc.207.2023.03.22.14.42.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 14:42:39 -0700 (PDT)
Message-ID: <24767874-0b26-78c8-43c2-6cc3adb901f8@linaro.org>
Date: Wed, 22 Mar 2023 22:42:38 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [EXT] Re: [PATCH v3 1/3] dt-bindings: usb: cdns-imx8qm: add
 imx8qm cdns3 glue bindings
Content-Language: en-US
To: Frank Li <frank.li@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
References: <20230321151951.2784286-1-Frank.Li@nxp.com>
 <20230321151951.2784286-2-Frank.Li@nxp.com>
 <1ce3bf91-6bef-b4c1-1ec9-3a345518efeb@linaro.org>
 <AM6PR04MB483828FC1083E3C98930DF6488869@AM6PR04MB4838.eurprd04.prod.outlook.com>
 <b5d67af0-ed08-e243-2c0c-92f1f002e552@linaro.org>
 <AM6PR04MB483841E17BEEE4F9EC596DBA88869@AM6PR04MB4838.eurprd04.prod.outlook.com>
 <835cda64-5d42-1ff3-aa8f-0802fe3d705f@linaro.org>
 <AM6PR04MB48383C58EF1D9CFD8F7C401E88869@AM6PR04MB4838.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <AM6PR04MB48383C58EF1D9CFD8F7C401E88869@AM6PR04MB4838.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/03/2023 22:40, Frank Li wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Wednesday, March 22, 2023 4:38 PM
>> To: Frank Li <frank.li@nxp.com>
>> Cc: devicetree@vger.kernel.org; festevam@gmail.com; imx@lists.linux.dev;
>> kernel@pengutronix.de; krzysztof.kozlowski+dt@linaro.org; linux-arm-
>> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; linux-
>> kernel@vger.kernel.org; robh+dt@kernel.org; s.hauer@pengutronix.de;
>> shawnguo@kernel.org
>> Subject: Re: [EXT] Re: [PATCH v3 1/3] dt-bindings: usb: cdns-imx8qm: add
>> imx8qm cdns3 glue bindings
>>
>> Caution: EXT Email
>>
>> On 22/03/2023 22:36, Frank Li wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Sent: Wednesday, March 22, 2023 4:32 PM
>>>> To: Frank Li <frank.li@nxp.com>
>>>> Cc: devicetree@vger.kernel.org; festevam@gmail.com;
>> imx@lists.linux.dev;
>>>> kernel@pengutronix.de; krzysztof.kozlowski+dt@linaro.org; linux-arm-
>>>> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; linux-
>>>> kernel@vger.kernel.org; robh+dt@kernel.org; s.hauer@pengutronix.de;
>>>> shawnguo@kernel.org
>>>> Subject: Re: [EXT] Re: [PATCH v3 1/3] dt-bindings: usb: cdns-imx8qm: add
>>>> imx8qm cdns3 glue bindings
>>>>
>>>> Caution: EXT Email
>>>>
>>>> On 22/03/2023 15:34, Frank Li wrote:
>>>>>
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>> Sent: Wednesday, March 22, 2023 2:32 AM
>>>>>> To: Frank Li <frank.li@nxp.
>>>>>>> +      - const: usb3_aclk
>>>>>>> +      - const: usb3_ipg_clk
>>>>>>> +      - const: usb3_core_pclk
>>>>>>> +
>>>>>>> +  assigned-clocks:
>>>>>>> +    items:
>>>>>>> +      - description: Phandle and clock specifoer of
>>>>>> IMX_SC_PM_CLK_MST_BUS.
>>>>>>
>>>>>> Drop useless pieces so "Phandle and clock specifoer of " and name the
>>>>>> hardware, not the syntax.
>>>>>>
>>>>>>> +
>>>>>>> +  assigned-clock-rates:
>>>>>>> +    items:
>>>>>>> +      - description: Should be in Range 100 - 600 Mhz.
>>>>>>
>>>>>> That's better but I still do not understand why do you need it in the
>>>>>> bindings. You never actually answered this question.
>>>>>
>>>>> I am not sure 100% sure the reason.
>>>>> I think difference system target's  axi bus frequency is difference,
>>>>> And just one time work, needn't software to manage it.
>>>>> Following other driver's code style may be another reason.
>>>>
>>>> That's the reason of heaving it in DTS. But I am asking about bindings.
>>>> You do understand you define here interface?
>>>
>>> I defined here is descript AXI frequency for usb controller. Supposed
>> difference
>>> Platform will have difference working frequency.
>>
>> I don't understand how does this answer my concerns of having it in DT
>> bindings. If you do not add it, you "will have difference working
>> frequency", so what's the point?
> 
> For example: imx8qxp, it need set to 250Mhz,  i.MX8QM need set to 200Mhz.
> Maybe future chip can set to 400Mhz.

And? So as you can see you will still have different frequencies, so
what's the point? What is the benefit? Dunno, maybe we do not understand
each other, because I don't think you are answering my questions at all.

Best regards,
Krzysztof

