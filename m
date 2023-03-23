Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1339415AD
	for <imx@lists.linux.dev>; Thu, 23 Mar 2023 06:33:45 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id i5so35289397eda.0
        for <imx@lists.linux.dev>; Wed, 22 Mar 2023 23:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679553224;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eCemMeqwjMVzDE8wLEMLT09xBhWQ5v22MwjMcsbx1sU=;
        b=PsqyKTLDetNlpt0ioowCO9i1kC460cyNFfDcJTUVpuwT/+woKSaTewkqDytEoVu3t1
         NRXN5BEvRzQispLKUSgWLybXw5kJOtVT/2baPm0pRYWUoHx2crNLiZ4J6GK1vSeCadTu
         X5N6agYVbG2niSiDwsC8B6TY0jt1qJn7VAKJwTtNkWQ0A1hOL1fQsEq6C22uZBrxf8EZ
         TbYCJ8aJTD403hfPGa6dvjMie+bXVbz7D5TbdP6mpol/YawKl9PPMQUvgEuTg75YbvIz
         1dCY1t2uicaWCSDWDeJrw8wWnWZUkX1GivJ1SRsJOOATyEFsEGX+491sD18+K4DUN5oD
         xm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679553224;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eCemMeqwjMVzDE8wLEMLT09xBhWQ5v22MwjMcsbx1sU=;
        b=NCIi5LgfgeimunN0RyCT3drY3fTlexT78nqMadfjsoqUKOZWxwNRL/niTJI4EHVIKk
         m5uHnC+xHByLC8+ImH29M19/dKeNNaz6+WNO91GNd/Q733tbzIChoCrW4wL+aVOtR7ae
         T/52xRG9IarE7yoCHJXyvuoRFb+CU8gmeABefUBbzGFRPpZld1f3GTrz6rG5pb+tDEEb
         V57CwT8SYhJuOenqwZBV0VrEUrs9M0k64fz4z1ho94NEJi/SZ6pxQuzjRH0toPt5wcCI
         Z6yAlZIAi2P6Qu+Hh/ItwUP/UhYIvRN4+dkIevWGzhbaVggqnxf7VLqRX8VrGN0c6qhe
         Ohxg==
X-Gm-Message-State: AO0yUKXRwTQ4DaRc0mRsQTlSaBNf8+Fj5Twvjwcty0WRewG4s5aLYbmN
	BYSZu4q35YV/T+bL2FdJyZ8aUg==
X-Google-Smtp-Source: AK7set8RJB+DTjcD2EokLbHqFm7mMwV6VlW000RW9DWaB/UvoxAV3HiuakfE6JeUhHOVeryNXcJddg==
X-Received: by 2002:a17:906:f6d9:b0:930:1391:da7c with SMTP id jo25-20020a170906f6d900b009301391da7cmr8831790ejb.60.1679553224138;
        Wed, 22 Mar 2023 23:33:44 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a665:ed1e:3966:c991? ([2a02:810d:15c0:828:a665:ed1e:3966:c991])
        by smtp.gmail.com with ESMTPSA id i6-20020a170906250600b009306be6bed7sm8146661ejb.190.2023.03.22.23.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 23:33:43 -0700 (PDT)
Message-ID: <10d3e045-9aba-6ceb-273c-4f23afec3b92@linaro.org>
Date: Thu, 23 Mar 2023 07:33:42 +0100
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
 <24767874-0b26-78c8-43c2-6cc3adb901f8@linaro.org>
 <AM6PR04MB4838ECE2917EF132943830EA88869@AM6PR04MB4838.eurprd04.prod.outlook.com>
 <6cf27e09-af76-34a5-1913-77165866480b@linaro.org>
 <AM6PR04MB483887C7F652AD96F92D002488869@AM6PR04MB4838.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <AM6PR04MB483887C7F652AD96F92D002488869@AM6PR04MB4838.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/03/2023 23:15, Frank Li wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Wednesday, March 22, 2023 5:09 PM
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
>> On 22/03/2023 22:57, Frank Li wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Sent: Wednesday, March 22, 2023 4:43 PM
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
>>>> On 22/03/2023 22:40, Frank Li wrote:
>>>>>
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>> Sent: Wednesday, March 22, 2023 4:38 PM
>>>>>> To: Frank Li <frank.li@nxp.com>
>>>>>> Cc: devicetree@vger.kernel.org; festevam@gmail.com;
>>>> imx@lists.linux.dev;
>>>>>> kernel@pengutronix.de; krzysztof.kozlowski+dt@linaro.org; linux-arm-
>>>>>> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; linux-
>>>>>> kernel@vger.kernel.org; robh+dt@kernel.org;
>> s.hauer@pengutronix.de;
>>>>>> shawnguo@kernel.org
>>>>>> Subject: Re: [EXT] Re: [PATCH v3 1/3] dt-bindings: usb: cdns-imx8qm:
>> add
>>>>>> imx8qm cdns3 glue bindings
>>>>>>
>>>>>> Caution: EXT Email
>>>>>>
>>>>>> On 22/03/2023 22:36, Frank Li wrote:
>>>>>>>
>>>>>>>
>>>>>>>> -----Original Message-----
>>>>>>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>>> Sent: Wednesday, March 22, 2023 4:32 PM
>>>>>>>> To: Frank Li <frank.li@nxp.com>
>>>>>>>> Cc: devicetree@vger.kernel.org; festevam@gmail.com;
>>>>>> imx@lists.linux.dev;
>>>>>>>> kernel@pengutronix.de; krzysztof.kozlowski+dt@linaro.org; linux-
>> arm-
>>>>>>>> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>;
>> linux-
>>>>>>>> kernel@vger.kernel.org; robh+dt@kernel.org;
>>>> s.hauer@pengutronix.de;
>>>>>>>> shawnguo@kernel.org
>>>>>>>> Subject: Re: [EXT] Re: [PATCH v3 1/3] dt-bindings: usb: cdns-imx8qm:
>>>> add
>>>>>>>> imx8qm cdns3 glue bindings
>>>>>>>>
>>>>>>>> Caution: EXT Email
>>>>>>>>
>>>>>>>> On 22/03/2023 15:34, Frank Li wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>> -----Original Message-----
>>>>>>>>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>>>>> Sent: Wednesday, March 22, 2023 2:32 AM
>>>>>>>>>> To: Frank Li <frank.li@nxp.
>>>>>>>>>>> +      - const: usb3_aclk
>>>>>>>>>>> +      - const: usb3_ipg_clk
>>>>>>>>>>> +      - const: usb3_core_pclk
>>>>>>>>>>> +
>>>>>>>>>>> +  assigned-clocks:
>>>>>>>>>>> +    items:
>>>>>>>>>>> +      - description: Phandle and clock specifoer of
>>>>>>>>>> IMX_SC_PM_CLK_MST_BUS.
>>>>>>>>>>
>>>>>>>>>> Drop useless pieces so "Phandle and clock specifoer of " and
>> name
>>>> the
>>>>>>>>>> hardware, not the syntax.
>>>>>>>>>>
>>>>>>>>>>> +
>>>>>>>>>>> +  assigned-clock-rates:
>>>>>>>>>>> +    items:
>>>>>>>>>>> +      - description: Should be in Range 100 - 600 Mhz.
>>>>>>>>>>
>>>>>>>>>> That's better but I still do not understand why do you need it in
>> the
>>>>>>>>>> bindings. You never actually answered this question.
>>>>>>>>>
>>>>>>>>> I am not sure 100% sure the reason.
>>>>>>>>> I think difference system target's  axi bus frequency is difference,
>>>>>>>>> And just one time work, needn't software to manage it.
>>>>>>>>> Following other driver's code style may be another reason.
>>>>>>>>
>>>>>>>> That's the reason of heaving it in DTS. But I am asking about bindings.
>>>>>>>> You do understand you define here interface?
>>>>>>>
>>>>>>> I defined here is descript AXI frequency for usb controller. Supposed
>>>>>> difference
>>>>>>> Platform will have difference working frequency.
>>>>>>
>>>>>> I don't understand how does this answer my concerns of having it in DT
>>>>>> bindings. If you do not add it, you "will have difference working
>>>>>> frequency", so what's the point?
>>>>>
>>>>> For example: imx8qxp, it need set to 250Mhz,  i.MX8QM need set to
>>>> 200Mhz.
>>>>> Maybe future chip can set to 400Mhz.
>>>>
>>>> And? So as you can see you will still have different frequencies, so
>>>> what's the point? What is the benefit? Dunno, maybe we do not
>> understand
>>>> each other, because I don't think you are answering my questions at all.
>>>
>>> Benefit: New chip just need change dts file for the same IP, like change
>> base
>>> Reg address and irq number.
>>
>> To remind - the question was:
>> "That's better but I still do not understand why do you need it in the
>> bindings."
>> If you drop it from the bindings the benefit is still there, so what do
>> you want to prove?
>>
>>>
>>> Your question is:  "why need this assigned-clock-rates
>> IMX_SC_PM_CLK_MST_BUS property?"
>>
>> This was the previous thread. Now, related but slightly different, why
>> do you still need it in the bindings?
>>
>>
>>> My answer: it is one of hardware property, like reg base address and irq
>> number.
>>
>> Sure, it is, I know, and bindings already allow it. Just look at many
>> DTS and their bindings. Do you see the bindings defining this property?
>> No. So why do you think it is needed here? I am asking this since like 6
>> emails and your answers are not related to bindings at all.
>>
>>>
>>> If can't match your expectation, can you change another words or provide
>> me an example?
>>
>> Yeah, just open several DTS and look for assigned-clock, then open their
>> bindings and answer - why do you need to add it to the binding but all
>> other bindings did not have to? If you have the answer, sure, bring
>> these parts of bindings.
> 
> Do you means, Needn't add assigned-clock in binding *document* yaml file?
> And dts file still can use assigned-clock property. 

Yes, I said it many times already...

Best regards,
Krzysztof

