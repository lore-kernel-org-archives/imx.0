Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BF45F554
	for <imx@lists.linux.dev>; Fri,  8 Mar 2024 21:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709932554; cv=none; b=mAr0K8B1nJsotAVkWyONNft31gAK/xmp4U07T4q1xef10ql/pNFagDufEM+7V6N9AVzzmh1MK8dGKBYaVndH7QljKAZSCcU3pEGCbRUij3XdTZ2C0PIFG3/79uErUJXUSXzoFG1zwZtSG3tBC1vt+ZhbwHok+5L7PDMiWeXeVCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709932554; c=relaxed/simple;
	bh=TeTFL8k++CGdOhlfe3T5SrVkXeRyBgWcTBx+E/fu2wc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ahscbX0ID/SY4t/wKbsXmj9nemzlZFPYPJsbkH/u737B5aiI86YN3xdLaOfhoPDDogQ21yULazrk16mEW+JJiGeaRUv9WrQeYdjrLJcvpdwlZKS4OecHokm6mLVYGlAdUE9l9G+QiLADvqdtyq9GNFLoIORe6UFEvU7SZymclLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qKrUtCNA; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qKrUtCNA"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-55a5e7fa471so1621981a12.1
        for <imx@lists.linux.dev>; Fri, 08 Mar 2024 13:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709932549; x=1710537349; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N4W64r4suULTbZbM2VCCq3KkVsIO3TU/J/8FcbisdEU=;
        b=qKrUtCNAGz6yxTeJ/gCX4nGv71E54O3PZj3BFxYNwteOpUZ3Q/jdzDYcXhpJ3E+T+C
         nqXRCw6qmHNCBT1YIU+y7SiHFNUrzkxxidg5VIERovt5V1XeeuJfVUGgWMfXjtkZZASZ
         P+J0JiFpuNsFjvXfl5Mrz2Mf4XZ0rJoqoaTxp3a7QZ6HMI7OHtyzUAoSEhthoJuuC3gS
         y/s1xoqcqX1vDxxpXWyj1GR0d41ja+PhS28+lmcLYZfMGS0clDo531RiFnHhzGcyaPtU
         saBoZyt1Z0sVpdZR1tbxCsS2rYhHj9Ul7Vt33wzuIThRo8rbd8p18jFFRYw5jX1qQDOa
         oXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709932549; x=1710537349;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N4W64r4suULTbZbM2VCCq3KkVsIO3TU/J/8FcbisdEU=;
        b=baOHnFADEazKxdc5rjM7a8ftgUBu0nSLXQDEnijfPI0Pv1sY1TDdpQUHMw3nY60YKk
         YvSaMm/Lv2rRF96WsMVuMCRfAMTyVIpZVeGP+Kqe5hsilpOx+hItLQ2/4RuwA29srsza
         flqq24su7XuErKhMWekYi5r32W5rzcJX7rtjknyiJUsNYI500PFtq8AIupSPHsfeJrpN
         NusOIgB7OH1BG+sqDyS9znWLIE9WVKDd2MmW2Di2Xb8CMwmU9MRbc6hLNgYs7guBaZ28
         Zls3HW1IvnstMpEdUyeTuAGBYZgY5MwmgGVLl9LshsiyK/Zi719DxzdOmZ4Bdntf57f2
         ROSA==
X-Forwarded-Encrypted: i=1; AJvYcCX0s/dAsg60Xe+K1qHjbp5aiZyZ9/XVLWw26qyLYyUdT+G3OA3lowjnwYCu+B5cvJm/GCXczCH+QJOMJOPrc6Jo4YS6
X-Gm-Message-State: AOJu0YyAtT5U4ujEVfJ1TxuAVRMfnTNt1HYmfVfEpE9tybBp0jwAFY9q
	to3sq7j8DVt5Ofg7P3nDfWH6kzrthM6zXuUmjntIh6619Fy9+ufeo5UqJ8PxBno=
X-Google-Smtp-Source: AGHT+IFX6YErZc4X0azI//lUIKC3QskpMA6Zrb31XzAcPoKGq1xhjZhrKiVd7ScDBHlZMmLWlzS4cw==
X-Received: by 2002:a50:cd03:0:b0:568:335d:a95d with SMTP id z3-20020a50cd03000000b00568335da95dmr309733edi.18.1709932549023;
        Fri, 08 Mar 2024 13:15:49 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id fd23-20020a056402389700b005683b3a471asm61050edb.72.2024.03.08.13.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Mar 2024 13:15:48 -0800 (PST)
Message-ID: <2749c144-4606-49c5-a9e1-3b9547e5978a@linaro.org>
Date: Fri, 8 Mar 2024 22:15:45 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] ASoC: dt-bindings: fsl,imx-asrc: update max
 interrupt numbers
Content-Language: en-US
To: Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20240308-asrc_8qxp-v6-0-e08f6d030e09@nxp.com>
 <20240308-asrc_8qxp-v6-2-e08f6d030e09@nxp.com>
 <20240308181103.GA855753-robh@kernel.org>
 <ZetgiaZ1+wt5lCkB@lizhi-Precision-Tower-5810>
 <Zeti5mFUUh9UedAx@lizhi-Precision-Tower-5810>
 <ZetmXE4YooDYJgSM@lizhi-Precision-Tower-5810>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZetmXE4YooDYJgSM@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/03/2024 20:26, Frank Li wrote:
> On Fri, Mar 08, 2024 at 02:11:34PM -0500, Frank Li wrote:
>> On Fri, Mar 08, 2024 at 02:01:29PM -0500, Frank Li wrote:
>>> On Fri, Mar 08, 2024 at 12:11:03PM -0600, Rob Herring wrote:
>>>> On Fri, Mar 08, 2024 at 10:30:51AM -0500, Frank Li wrote:
>>>>> fsl,imx8qxp-spdif and fsl,imx8qm-spdif have 2 interrupts. Other platforms
>>>>> have 1 interrupt.
>>>>>
>>>>> Increase max interrupt number to 2 and add restriction for platforms except
>>>>> i.MX8QXP and i.MX8QM.
>>>>>
>>>>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>>>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>>>> ---
>>>>>  .../devicetree/bindings/sound/fsl,spdif.yaml        | 21 ++++++++++++++++++++-
>>>>>  1 file changed, 20 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/sound/fsl,spdif.yaml b/Documentation/devicetree/bindings/sound/fsl,spdif.yaml
>>>>> index 56f8c0c8afdea..a242f68f99f18 100644
>>>>> --- a/Documentation/devicetree/bindings/sound/fsl,spdif.yaml
>>>>> +++ b/Documentation/devicetree/bindings/sound/fsl,spdif.yaml
>>>>> @@ -31,7 +31,11 @@ properties:
>>>>>      maxItems: 1
>>>>>  
>>>>>    interrupts:
>>>>> -    maxItems: 1
>>>>> +    minItems: 1
>>>>> +    maxItems: 2
>>>>> +    items:
>>>>> +      - description: Combined or receive interrupt
>>>>> +      - description: Transmit interrupt
>>>>
>>>> Test your patches please because this will have warnings. Or, you can 
>>>> put in *exactly* what I provided because this is not it.
>>>>
>>>> If you continue to just toss crap at us at the rate you are, the DT 
>>>> maintainers will either just start ignoring your patches or require some 
>>>> trusted review by another NXP colleague first (offhand, not sure who 
>>>> that would be which is part of the problem).
>>>
>>> Sorry, I run wrong command to check another dtb file. So have not catch
>>> this problem.
>>
>> Strange when I run second time, spdif warning disappeared.
>>
>> make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8  CHECK_DTBS=y freescale/imx8dxl-evk.dtb
>>   DTC_CHK arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb
>> /home/lizhi/source/linux-upstream-dts/arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: /: fixedregulator@101: 'anyOf' conditional failed, one must be fixed:
>> 	'reg' is a required property
>> 	'ranges' is a required property
>> 	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> /home/lizhi/source/linux-upstream-dts/arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: bus@34000000: clock-cm40-ipg: {'compatible': ['fixed-clock'], '#clock-cells': [[0]], 'clock-frequency': [[132000000]], 'clock-output-names': ['cm40_ipg_clk'], 'phandle': [[15]]} should not be valid under {'type': 'object'}
>> 	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> /home/lizhi/source/linux-upstream-dts/arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: intmux@37400000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
>> 	from schema $id: http://devicetree.org/schemas/interrupt-controller/fsl,intmux.yaml#
>> /home/lizhi/source/linux-upstream-dts/arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: dma-controller@591f0000: 'clocks' is a required property
>> 	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml#
>> /home/lizhi/source/linux-upstream-dts/arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: dma-controller@591f0000: Unevaluated properties are not allowed ('power-domains' was unexpected)
>> 	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml#
>> /home/lizhi/source/linux-upstream-dts/arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: dma-controller@599f0000: 'clocks' is a required property
>> 	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml#
>> /home/lizhi/source/linux-upstream-dts/arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: dma-controller@599f0000: Unevaluated properties are not allowed ('power-domains' was unexpected)
>> 	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml#
>> /home/lizhi/source/linux-upstream-dts/arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: serial@5a070000: Unevaluated properties are not allowed ('resets' was unexpected)
>> 	from schema $id: http://devicetree.org/schemas/serial/fsl-lpuart.yaml#
>> /home/lizhi/source/linux-upstream-dts/arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: dma-controller@5a1f0000: 'clocks' is a required property
>> 	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml#
>> /home/lizhi/source/linux-upstream-dts/arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: dma-controller@5a1f0000: Unevaluated properties are not allowed ('power-domains' was unexpected)
>> 	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml#
>> /home/lizhi/source/linux-upstream-dts/arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: dma-controller@5a9f0000: 'clocks' is a required property
>> 	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml#
>> /home/lizhi/source/linux-upstream-dts/arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: dma-controller@5a9f0000: Unevaluated properties are not allowed ('power-domains' was unexpected)
>> 	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml#
>> /home/lizhi/source/linux-upstream-dts/arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: bus@5b000000: clock-conn-bch: {'compatible': ['fixed-clock'], '#clock-cells': [[0]], 'clock-frequency': [[400000000]], 'clock-output-names': ['conn_bch_clk']} should not be valid under {'type': 'object'}
>> 	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> /home/lizhi/source/linux-upstream-dts/arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: dma-apbh@5b810000: $nodename:0: 'dma-apbh@5b810000' does not match '^dma-controller(@.*)?$'
>> 	from schema $id: http://devicetree.org/schemas/dma/fsl,mxs-dma.yaml#
>> /home/lizhi/source/linux-upstream-dts/arch/arm64/boot/dts/freescale/imx8dxl-evk.dtb: dma-apbh@5b810000: 'clock-names', 'interrupt-names', 'power-domains' do not match any of the regexes: 'pinctrl-[0-9]+'
>> 	from schema $id: http://devicetree.org/schemas/dma/fsl,mxs-dma.yaml#
>>
> 
> I figured out what's happen. CHECK_DTB will check binding doc except
> example part. So I skip run dt_binding_check when I have not touch example
> part in dt-binding doc.
> 
> The problem is
> step 1. run make CHECK_DTB=y freescale/imx8ulp-evk.dtb
>         Then I get some sai error, I found use wrong 8ulp-evk.dtb
> 
> step 2. run make CHECK_DTBS=y freescale/imx8dxl-evk.dtb
>         Then tools not check dt_binding file again even there are warning.
> 
> Do you have option let CHECK_DTBS to force check binding doc every time.

CHECK_DTB is for checking dtbs, not binding. You must run
dt_bindings_check, as asked by every damn document and guide.

Best regards,
Krzysztof

