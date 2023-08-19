Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD551879
	for <imx@lists.linux.dev>; Sat, 19 Aug 2023 08:04:09 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-99d90ffed68so581078866b.0
        for <imx@lists.linux.dev>; Sat, 19 Aug 2023 01:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692432247; x=1693037047;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=deRfy4MmWhNo/qJGo68CHwTkl2+R+5alRlJweBHZEfs=;
        b=aCgvU0CiVM/aEDBPDLFu+sF3l8qpjC4PkigK2hLvR3K7RKhfJxz3HS/75ABvsvSWoN
         3rs+wNfGBianQpt1CpPz2wuk0SMhpaO4hNJVHxGUWCddxhtAjqehLYh2eeF6Cd2gfprt
         u99N5o2xA+OV9mkJEvHL8v9Sml9QxHE5RSYlEoG19qytqLjYIQrrBy0qzFM2unicwyLa
         mN/wOmmb8gJoRVSAd/vndrNCjmRKhfuPY1Oj6vJIcmhGH8NULGtsPXJiRwsfqQijm+12
         V21avF6ka3kRNfArK+MavM1X5UQ8aoJ14k4YvOe8lMxAi1ufEq9rfBchTMt6jERjp1tv
         sIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692432247; x=1693037047;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=deRfy4MmWhNo/qJGo68CHwTkl2+R+5alRlJweBHZEfs=;
        b=b5jSscE2C7GAz8jJYJ28c7CGLRTfACpQpQ5+6OWeeBUlk4oClGm1yVrWiA/OgtyGSX
         1Hxbh5+Uttliv0v0fMAmpR4atmmmBg1lPubtEKFIhxF4X1rpMMHPbUPnW4PNjSQmR5uZ
         FOCIlG1fzGywBhLEqLqvIV/rKlzBkPTcGRVxeb4h8ZIcOh6Ob0P5u97Ut+PbQ5mPAMTN
         fGJJAqSmTTF56553PLq/HxSES+cwPwNvd4vHwDeMemH4JcEwtSLmDKniTdG/UGpab4/I
         0gz0eI19ZLSdN2yIaSng92ZiDPNDk55f13DXs2+lZGnGRITOfpLYAjh0kuMYKjq7RY/C
         2xZw==
X-Gm-Message-State: AOJu0YzkHzTsIuT2TbS4DYDkWuc2Q5XqZXp5qc1e0v1solceIMAjWhs2
	qKoOpamDYzixkXhO8i7vKtRWbg==
X-Google-Smtp-Source: AGHT+IHBzvmTwnBZ67sD/6WjMdA5xmu96I7L2+RI5CGp7G/r5zU7hudwu/IAczFJtEBUGVFcm5NiSw==
X-Received: by 2002:a17:906:8a73:b0:99d:e417:d6fb with SMTP id hy19-20020a1709068a7300b0099de417d6fbmr1522299ejc.25.1692432247428;
        Sat, 19 Aug 2023 01:04:07 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id u22-20020a170906409600b009929ab17be0sm2265161ejj.162.2023.08.19.01.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Aug 2023 01:04:06 -0700 (PDT)
Message-ID: <9927403d-6dd9-3e5e-8f9d-f38e6640f95f@linaro.org>
Date: Sat, 19 Aug 2023 10:04:05 +0200
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
To: Shenwei Wang <shenwei.wang@nxp.com>, Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>
References: <20230818153446.1076027-1-shenwei.wang@nxp.com>
 <CAL_Jsq+XA_P-aRK9_WuGPmJ0_xJgsSr9smZy4BRbKZbmVsMQBQ@mail.gmail.com>
 <PAXPR04MB918539A19B8F817F623BBD1F891BA@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <PAXPR04MB918539A19B8F817F623BBD1F891BA@PAXPR04MB9185.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/08/2023 23:06, Shenwei Wang wrote:
> 
> 
>> -----Original Message-----
>> From: Rob Herring <robh+dt@kernel.org>
>> Sent: Friday, August 18, 2023 3:52 PM
>> To: Shenwei Wang <shenwei.wang@nxp.com>
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley
>> <conor+dt@kernel.org>; Ulf Hansson <ulf.hansson@linaro.org>; Liam Girdwood
>> <lgirdwood@gmail.com>; Mark Brown <broonie@kernel.org>;
>> imx@lists.linux.dev; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
>> dl-linux-imx <linux-imx@nxp.com>
>> Subject: [EXT] Re: [PATCH 1/2] dt-bindings: power: Add regulator-pd yaml file
>>>
>>> Documenting the regulator power domain properties and usage examples.
>>
>> This needs to answer why we need this.
>>
>> It looks like just an abstraction layer to make regulators look like a power
>> domain.
>>
> 
> Yes, it is a wrapper that allows using regulators as a power domain. This removes 
> the need to add regulator operating code in each consumer device driver. As a power 
> domain, the regulator will be managed automatically by the device driver framework 
> and PM subsystem.
> 
> This is very useful when a device's power is controlled by a GPIO pin, which currently 
> requires using the fixed-regulator to achieve the same purpose. However, the 
> fixed-regulator approach may have to add code in the driver in order to use it.

Why do you start discussion from zero ignoring all previous history of
this patchset?

https://lore.kernel.org/all/20220609150851.23084-1-max.oss.09@gmail.com/

Best regards,
Krzysztof

