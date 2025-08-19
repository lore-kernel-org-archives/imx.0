Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02BA31A050
	for <imx@lists.linux.dev>; Tue, 19 Aug 2025 09:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755597068; cv=none; b=HMIG5t9V+Wx3RofFh807tNeOLDxGUg2RLV1ji4RZIjSxXYJE9N1rfLmKS0Oh1LIA+aeokW30x11tZzBUCNuSibBdO/+xUfPuu1AzOh3E7OtC+koW023nDENchjoGqDqFOClyqY/iqb7UAhltLTz737PAAbN8iGYuYITiHu04rHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755597068; c=relaxed/simple;
	bh=UHFObRlIIZeDanFV92i7VHnr2QcfoemI+cerUuacbO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HRrFZM/c1u4DxDTE0JpSCNAadQf9jrhMQtSNsiRkg2xwUK65zRGl1ztZ/Qz9SjfgzmmsehVxmXbvi0fpK3Ya4vTel4hfKhNLVEHt6tvWkQzSsGWfhH0NakrqASZNTIVyJoN5FJdM+KdlCwSKlQXQwggDH1PE39bSSlBnr5A8dR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B1cMTwSx; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B1cMTwSx"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3b9d41c1963so2525588f8f.0
        for <imx@lists.linux.dev>; Tue, 19 Aug 2025 02:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755597065; x=1756201865; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dEbA4I5qSZY6spIoEFlqu08c9+21gKrj1SN48109zCo=;
        b=B1cMTwSxF2/B6Tfcup6jY7ccZmYD0hdqg5CwpjcRB7u0Ly0yXey9awhqwbBPFiP7Tn
         h8bJmD5EzVKbZDXeNl7LhY8BwjqhdKBQYr/RUPhN3VjspIfT8JWnefHfttDLWT4BLSdp
         VyVVNkKK7Q6fJiuniGAJFInLfnbSaFjkPxAf+TtDvRRCfzt2GOI2+LwFlc+4y/pysOIu
         bB4k5rX255wDca7zueV5F5RSyrb1C81mfTL3LFhVPd2fW/NbyqtgFYsEzrIj3zj0ZvG8
         n092f6BIQuk7z306YeE+L9bZBnAyBI94t0DsYbHnr0z0WincOOrgOEEbRCjknTSHAiFs
         XE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597065; x=1756201865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dEbA4I5qSZY6spIoEFlqu08c9+21gKrj1SN48109zCo=;
        b=R8kmddGctRXgiREj7b6CabyFBUKfayWwlHGefuc+2iYqFOT3/HFQCztGMFMYdNkgO3
         4uLYNTpafTp4zN3pU6+mrM3qM5M7y4EZHXlfUOYGU4OLsD/Rnw1psPPGj8nsmgnxgCX2
         JNun80uBtF1E1Gt5sBFPNpT9VBZr9ix3KfVUG/Mg1U9HWEsFnXOVXpwZYSAXkqFz+imt
         L7kXu008FM/XiUQBEZLuC8/zxqgNwqSWr2J89PwSSphhJWFfid5zz6spaV/1S31xAGsM
         pas5sjue108aMSx+d3NQTJCpi8uBR6QzClpHBbzE+PLU+Igd69yPODneAv9BKX5aHDSB
         xawQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7cnAdOGPzdwQjzvaY2S5VIkApc3lO8sp04Orz6igqycp3raU+UqJQFFXp09oPuuLwUqk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yycz0NZ6pl1xAh/dEd+P/yo7dE7sNOaHtuO5I469P8YryMXaqnm
	NXzY/GEM0oLrM1EfOhNNi27ghpo3TXjxvtaNu64LHLHadHHi6vrIMzq+xiyysNKDNRI=
X-Gm-Gg: ASbGncvq3RiUxZEve/Ho0+KvsNDm7bDbR+Yk7CxXYHXSgk422rIjYXkNkajXnqMU6Pl
	M1RC9sqV5wywEQ2tLVOlpAzEH2LIrAjZpdyZ5GxbkeUYVPWKQsdObNRq0oQc/f1ZL3q9LC6dWUy
	1nyybobnzUdx4aDNjdcij9o4lr2dV5qYfp2/QYYJZLwtHUdd+s4ujgFDsQLFtyY9/PKPgsZGUm0
	zS7Try7k5lmIquydbJaWkFmKPxv7UcD5qbrKHTdj8QWwirQ7IAgopKkpTqfdLIBnLXBy5KIvh1L
	hMRF6G/UexX3a4+bPaBL3aHjWd0KHnVwNK3j7I6R/VuCbGp5LgrkCrcw9fjCkBwxs6C75tR5TYG
	mKgdTuUikRzv18/UKyIqC+S0X9Nw=
X-Google-Smtp-Source: AGHT+IEhCbEtO72B94zboRfNoT34vBXWkQcIIE5hKfiRYQPXuGCMsQYLXo/jdD8ygHW2tXsu4oCNdQ==
X-Received: by 2002:a05:6000:1a85:b0:3b9:148b:e78 with SMTP id ffacd0b85a97d-3c0ecc324b5mr1596498f8f.53.1755597065105;
        Tue, 19 Aug 2025 02:51:05 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c07487a009sm3017107f8f.11.2025.08.19.02.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 02:51:04 -0700 (PDT)
Message-ID: <91b3e06d-501a-48db-b626-5f056287a451@linaro.org>
Date: Tue, 19 Aug 2025 10:51:03 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] dt-bindings: lpspi: Document nxp,lpspi-pincfg
 property
To: Frank Li <Frank.li@nxp.com>
Cc: Larisa Grigore <larisa.grigore@nxp.com>, Mark Brown <broonie@kernel.org>,
 Clark Wang <xiaoning.wang@nxp.com>, Fugang Duan <B38611@freescale.com>,
 Gao Pan <pandy.gao@nxp.com>, Fugang Duan <fugang.duan@nxp.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Larisa Grigore <larisa.grigore@oss.nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Ciprianmarian Costea <ciprianmarian.costea@nxp.com>, s32@nxp.com,
 linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250814-james-nxp-lpspi-v1-0-9586d7815d14@linaro.org>
 <20250814-james-nxp-lpspi-v1-12-9586d7815d14@linaro.org>
 <aJ4ox8+OLhIir2bU@lizhi-Precision-Tower-5810>
 <bd59344b-9dc0-42bd-98c8-80ab9ca97123@linaro.org>
 <aKNJFJDf1Clnkbex@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aKNJFJDf1Clnkbex@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 18/08/2025 4:39 pm, Frank Li wrote:
> On Mon, Aug 18, 2025 at 03:47:45PM +0100, James Clark wrote:
>>
>>
>> On 14/08/2025 7:19 pm, Frank Li wrote:
>>> On Thu, Aug 14, 2025 at 05:06:52PM +0100, James Clark wrote:
>>>> Document the two valid pincfg values and the defaults.
>>>>
>>>> Although the hardware supports two more values for half-duplex modes,
>>>> the driver doesn't support them so don't document them.
>>>
>>> binding doc should be first patch before drivers.
>>>
>>> binding descript hardware not driver, you should add all regardless if
>>> driver support it.
>>>
>>
>> Replied to same on "[PATCH 10/13] spi: spi-fsl-lpspi: Add compatible for
>> S32G"
>>
>>>>
>>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>>> ---
>>>>    Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml | 14 ++++++++++++++
>>>>    1 file changed, 14 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml b/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
>>>> index ce7bd44ee17e..3f8833911807 100644
>>>> --- a/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
>>>> +++ b/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
>>>> @@ -70,6 +70,19 @@ properties:
>>>>      power-domains:
>>>>        maxItems: 1
>>>>
>>>> +  nxp,pincfg:
>>>> +    description:
>>>> +      'Pin configuration value for CFGR1.PINCFG.
>>>> +        - "sin-in-sout-out": SIN is used for input data and SOUT is used for
>>>> +                             output data
>>>> +        - "sout-in-sin-out": SOUT is used for input data and SIN is used for
>>>> +                             output data
>>>> +      If no value is specified then the default is "sin-in-sout-out" for host
>>>> +      mode and "sout-in-sin-out" for target mode.'
>>>
>>> why need this? are there varible at difference boards? look like default
>>> is more make sense.
>>>
>>
>> + Larissa. I think this might also be a question for the hardware designers
>> about why the feature to swap the pins was deemed worth including.
>>
>> I'm assuming the flexibility is given for routing reasons. If you have
>> another device with the pins in one order then you can route it without a
>> via if they happen to be in the same order.
> 
> DT team need reason to judge if a new property is reasonable/neccesary. You
> need  mention the reason why need this property. Here, some board design
> swap sin/sout.
> 
>>
>>> SPI signal name is MOSI and MISO
>>>
>>> Frank
>>>
>>
>> As mentioned in the commit message of "[PATCH 05/13] spi: spi-fsl-lpspi:
>> Enumerate all pin configuration definitions" the names were taken directly
>> from the reference manual and this doc text was too. I think diverging from
>> CFGR1_PINCFG could be potentially quite confusing. And MOSI isn't mentioned
>> once in S32G3RM rev 4:
>>
>>    Configures which pins are used for input and output data during serial
>>    transfers. When performing parallel transfers, the Pin Configuration
>>    field is ignored.
>>
>>      00b - SIN is used for input data and SOUT is used for output data
>>      01b - SIN is used for both input and output data, only half-duplex
>>            serial transfers are supported
>>      10b - SOUT is used for both input and output data, only half-duplex
>>            serial transfers are supported
>>      11b - SOUT is used for input data and SIN is used for output data
> 
> dt binding is ABI, design user easy understand property string.  like
> 
> enum:
>    - normal
>    - swap
>    - half-duplex-on-sin
>    - half-duplex-on-sout
> 
> Frank
> 

If we're not directly using the names that get programmed into the 
register then it's better to remove the implicit 5th mode that you get 
for leaving it blank and to use that as "normal" instead. Then "swap" is 
to swap whatever "normal" would have picked. Otherwise "normal" being a 
fixed value doesn't match up to the current "normal" behavior which is 
actually different value depending on host or target mode.

So it would look like this with the "if no value is specified..." bit 
reworded too:

    description:
       'Pin configuration value for CFGR1.PINCFG.
         - "normal": Hosts - SIN is used for input data and SOUT is used
                       for output data.
                     Targets - SOUT is used for input data and SIN is 

                       used for output data.
         - "swap": The inverse of "normal"
         - "half-duplex-on-sin": SIN is used for both input and output
                   data. Unsupported.
         - "half-duplex-on-sout": SOUT is used for both input and output
                   data. Unsupported.
       If no value is specified then the default is "normal".

>>
>> James
>>
>>>> +    enum:
>>>> +      - sin-in-sout-out
>>>> +      - sout-in-sin-out
>>>> +
>>>>    required:
>>>>      - compatible
>>>>      - reg
>>>> @@ -95,4 +108,5 @@ examples:
>>>>            spi-slave;
>>>>            fsl,spi-only-use-cs1-sel;
>>>>            num-cs = <2>;
>>>> +        nxp,pincfg = "sout-in-sin-out";
>>>>        };
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>

