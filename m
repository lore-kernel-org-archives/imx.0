Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB7D321F2C
	for <imx@lists.linux.dev>; Tue, 19 Aug 2025 09:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755597177; cv=none; b=N34gOvXYP34WbJ0hFntGgMcTPd9Fypz1WlwuX2Vj4VAKdaeUDnaWGdD58bfjzyhDdXa5/DvjIP0+wbz/oYI0MZcIMbK+iQQrvQgEfDhaNxB6mZg4opTrfbVZj3fDmZLxHZ0/wejl98OXzgwc+Z8x0wJHVgFiuc0uBjqBMXbVvxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755597177; c=relaxed/simple;
	bh=D7ULAKtYONClt57a6AjnjqdTGtyDYDEhUbl2DruBwCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lb2ZAliSvCXdZR80HnsjT+mBygGmvflB9sOp89fzW7WpKqJTJPoabUl9w4OBxLY2uA37nnpBT4Lm9FvCLR/9dBv/Kn/2FRXFxaZ3/CZ+59/NoGpBdMkInBoEFEUBwODwrtKngFAAUh+TuqQsNdQYu8/dGQ5M4y+1iUOhxCPab38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wmbi47xI; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wmbi47xI"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b9dc52c430so2498949f8f.0
        for <imx@lists.linux.dev>; Tue, 19 Aug 2025 02:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755597174; x=1756201974; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0h1IqL/4MIVenVvNd5Jvok7Pym6fhE62Ycqm04pTo+s=;
        b=wmbi47xIYi9Fze0wXAhxR5rwYrfb1UTZu5fazSon1faMLmiF39PEwycHIZNNnjnBQY
         wME8HsdNLNp8HwooKGB3me/hhQO11aWfUtbfIy6n0uIPK0Uchxh1iw6Fe8vwMsKFl2jD
         NLbIl6eJNNBA7XfQBte63NMjBjhvBqlp4OPnC+7gnEZG4NCx1ilSkP/q6VxtSopgwOi1
         4iu4J5CV7jsiiUlZTz8gh0T7f4jKcCEdHoKIFaYEENWWJJYCqCpnh1Pnrnr45h0x4MiZ
         ZhnBxiNci+tHb4ng0CjIfAOytSqbkUpylAPgS3E6/VyWQ5BREPQ+AiRVAQSr4VZHLZP2
         L8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597174; x=1756201974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0h1IqL/4MIVenVvNd5Jvok7Pym6fhE62Ycqm04pTo+s=;
        b=GYi+2I0wquAscq0JrBF9DUJKxquygvc8i+u7FKmKmlaRdNVhJudeHDUZxXCPONSCJS
         ZaH3T9VOl8ClJlYA2FFE/NkBjIct+6yrHCYbPCM23EFyfGxxkrITvXk05WCdExpxAjjA
         pXBoVkF9T8hoqEhwsIDWECfdaqtoQ1Xk+LNnzVx2JQgdslXf4wQQZuryUBMY5G2M72ei
         /f4nw9OpzJRrY9/hPZ5RKll453aol4QTAnddGJaIUZGfD9I6WvKfpnUu6KfzuTrloj3G
         osPikIwlyF+5AHkLsSgYgsKISIM8uI77QUg/RTP86OUF+MUaH3MqLoY8y2FEdq3b9UES
         VV3g==
X-Forwarded-Encrypted: i=1; AJvYcCVp8OqIlV62f/DSorewWhT+sod6qhcU8Qw8aEpVXrShe8sgO/ZmY34Qq8KaZtUpXZLfZWE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyzxSoUfQ11vVCuRDBJG62PnaUKLZTL/fMxM80HZ8kn7mgBfT58
	ap2vBmqwEHFmAtRSdQ7Y/CuRG/eMd6KkIy+SLUWPdrTMGrY8+/sWCk3fpAmVvo3U/ZQ=
X-Gm-Gg: ASbGncurGB5WCp0Q0dBBjtrz5djaE7r3tfkJgJbiDan/kLkKsVZvzH6Sndxoi5mpvSX
	ijmhsDF/mw/l5XtVV31cl1tcUKG9+aVKRD0mK3emmDRgLggPNyuVwwKx7hJwl1Ah1LL+PqAdaAp
	rlYg2yoCdD546r98n62tjbYTeWvt8yEE8fYiSdIjDKASZKXcp9+HvFTOktrfNi2g9M0EXVlPfsY
	yQbOiD68Si0Go4FmPyJQ5l77NG2uKp/BrUWP1xlx2Y1RS1MqpDG+HM8d21cGmN7YleQaof5loVP
	lnOVb0FlB9WTbA1yOfC+m5CUEScXlEFBWmjHObLWYl9uVLEzA2PPY+lzfvc29irgf3npOv+vGh5
	og524S0AZoswO0MDiuJ37FGbGJ2o=
X-Google-Smtp-Source: AGHT+IGlP+6ysDxLZ9KBBa3uZiR0t6DXx2J2w37t28LWBAiGheosRQfe24PXM+YBFSqepDRsvanIuQ==
X-Received: by 2002:a05:6000:2881:b0:3a4:f70e:abda with SMTP id ffacd0b85a97d-3c0ea5ba0b6mr1523055f8f.10.1755597173972;
        Tue, 19 Aug 2025 02:52:53 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c78b33csm214351585e9.25.2025.08.19.02.52.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 02:52:53 -0700 (PDT)
Message-ID: <05701887-f78c-4de5-b7fa-d34afdb53af9@linaro.org>
Date: Tue, 19 Aug 2025 10:52:52 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] dt-bindings: lpspi: Document nxp,lpspi-pincfg
 property
To: Frank Li <Frank.li@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Clark Wang <xiaoning.wang@nxp.com>,
 Fugang Duan <B38611@freescale.com>, Gao Pan <pandy.gao@nxp.com>,
 Fugang Duan <fugang.duan@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
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

Let's wait for Larisa to reply. If there's no board and it was only for 
testing maybe we can drop it.

