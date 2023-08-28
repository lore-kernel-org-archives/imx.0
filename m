Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB8C613D
	for <imx@lists.linux.dev>; Mon, 28 Aug 2023 10:45:23 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-99c1d03e124so399851266b.2
        for <imx@lists.linux.dev>; Mon, 28 Aug 2023 03:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693219522; x=1693824322;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7OanaXXnrMsaEfBjCXrcfdtKi7g9UEMwaAf60pZJsSc=;
        b=C1oa92btKyiq9BivM1fEjwLmi66V9PA7yJw4LUzkelTctM0ppXJ//6PCvBudrgPQCi
         nEis/LIE3gfdzxcrDS8lyKyjEPmxAyLdoVQW/z79vVwyZOlcbX0JxAxePNCGQRxl8TvP
         YaUF8nWONY/lPa/awNeyRtbr64JYs45xfZaQYjTcXKx0pLWS07q+sZkiK3TtfaF5e5c6
         Rp1Tgl/Vkwo1lXaUSL37MZu6AyX9p2R5TN8S1Ow4OLVaw/fSoPRQ2guC7OF7QRJD17rb
         jEo6fFDE0Uf52p1ZgJEckdYTJgfmz+1FvVZpC1gSRzJEPyex18gFdedoKdRTWn88Lv8r
         +bZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693219522; x=1693824322;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7OanaXXnrMsaEfBjCXrcfdtKi7g9UEMwaAf60pZJsSc=;
        b=D2IiFV9GXmoJEQsYHGAjMDAHYwO3VfsqDH7+eBHshbuDBAJKoDyq92TOtO8Cxb51f2
         6N/xpmv/NtWnybbOpnxtFjCwPfz0AvUc8Qtm8W9tD/AQwmfWasvnL11PSMoyjL3r+B0Y
         KfwjjoZIxNe1KuaNUt9OcnfJ5/cd2+S8u5pLnmkED6LRuxQDsEIi12SjT5M5iqhGXim/
         7H+zQNv9ssMAuSuRwt2H/gJr1lhW0y60uZlwH9AJpihJe794Bd/TH86yMEHcpHcr8wUF
         t+rdQNusVC5qSPiE/8hJY99WyP54I17Jz2/RV082ySYh+z6rP4dAc/wYscIPGO4HhbId
         Ko+w==
X-Gm-Message-State: AOJu0YzTmjvmPuIeQbW47EQA2+9BFKx/B/PQ9mOyiWELj1RqOnuFJs7Y
	Jv68ask7eIhuIG/Ef6dCwJ0gYQ==
X-Google-Smtp-Source: AGHT+IHTA017TesrZlA/sySPLP1brYSSYzfcBNjrMk0jhiVJiNfeXLqU0j3wzbMWlEZaqDpfvcftoQ==
X-Received: by 2002:a17:906:7392:b0:9a1:d087:e0bd with SMTP id f18-20020a170906739200b009a1d087e0bdmr11535283ejl.6.1693219522129;
        Mon, 28 Aug 2023 03:45:22 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.225])
        by smtp.gmail.com with ESMTPSA id cf20-20020a170906b2d400b0098e78ff1a87sm4500818ejb.120.2023.08.28.03.45.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 03:45:21 -0700 (PDT)
Message-ID: <8f9f24c7-c93f-4cb8-bbd2-f0a8502d5f1b@linaro.org>
Date: Mon, 28 Aug 2023 12:45:20 +0200
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
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Rob Herring <robh+dt@kernel.org>,
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
 <CAPDyKFro6roynXuS1caARpMK08hvARQ7mQfiJcDgCyJXiw=nzw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAPDyKFro6roynXuS1caARpMK08hvARQ7mQfiJcDgCyJXiw=nzw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/08/2023 11:59, Ulf Hansson wrote:
> On Sat, 26 Aug 2023 at 19:31, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 25/08/2023 17:44, Shenwei Wang wrote:
>>>>
>>>> The genpd provider then needs to be a consumer of the resources it needs. In
>>>> this case a couple of regulators it seems like.
>>>>
>>>
>>> If I understood your reply correctly,  it seems that the current implementation of
>>> regulator-pd is what you have described. Please correct me if I'm mistaken.
>>>
>>> The following are the diff of scu-pd and this regulator-pd.
>>>
>>>     power-controller {                                                    power-controller {
>>>         compatible = "fsl,imx8qxp-scu-pd", "fsl,scu-pd";      |               compatible = "regulator-power-domain";
>>>         #power-domain-cells = <1>;                                    #power-domain-cells = <1>;
>>>                                                             >
>>>                                                             >         regulator-number = <2>;
>>>                                                             >         regulator-0-supply = <&reg1>;
>>>                                                             >         regulator-1-supply = <&reg2>;
>>>     };                                                                    };
>>>
>>> Are you suggesting to move the regulator-pd to the imx directory and add a company prefix
>>> to the compatible string?
>>
>> There is no such part of iMX processor as such regulator-power-domain,
>> so I don't recommend that approach. DTS nodes represent hardware, not
>> your SW layers.
> 
> I would agree if this was pure SW layers, but I don't think it is. At
> least, if I have understood the earlier discussions correctly [1],
> there are certainly one or more power-domains here. The power-domains
> just happen to be powered through something that can be modelled as a
> regular regulator(s). No?

No. It was for controlling power of multiple devices, supplied by
multiple different or similar regulators, where Linux drivers for these
devices (so not even all drivers...) do not have regulator control. The
bindings for these devices allow power-domains, but not regulator.

There are no multiple power domains in the problem. Even term "power
domain" is questionable here, because we tend to look power domain as
part of SoC. Here it is some selected part of the circuitry, like few
totally independent devices which share purpose and power rails.

But more important is my first paragraph - this is purely to avoid
adding regulators to these devices.

Best regards,
Krzysztof

