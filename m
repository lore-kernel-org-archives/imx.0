Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997731DE4EC
	for <imx@lists.linux.dev>; Mon, 18 Aug 2025 14:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755528470; cv=none; b=WFrw/toz9LNiq5uttA0135qRO4AirmmDuF67vu73ScLYeU00LhRIZtSC/aGgKOIdADoYQN+a4sYxqmrLTp/dqYknc/rEhslokegwL8E7k0skBbTSaV0bmMyMv6cPIfonLZLJJ20bitu/Aqv+wQVeeAmAUZU0cIYmwUhBYg3VKqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755528470; c=relaxed/simple;
	bh=ifoUL3jsCD9QEp5E4RW0WnOPPi8gp4Hdi1nn9ecnFcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BDpFQKSpuj7DmOX+GYuLcnnzGOd82+PP4Axur6LNGaQCy9C5IFtymaVo5WNBZ+zmaUNu9JgjR+ZIRiuaSY+t1fMAI+sO6Ilp4DrcO68ccPm9bTKNlAZqH1n1pLhS+XXEjKccCTe58w05lcc9fzl9tT3br6h0jp7YNVvOAaRN++M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XdPAQJze; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XdPAQJze"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3b9e7437908so4317590f8f.3
        for <imx@lists.linux.dev>; Mon, 18 Aug 2025 07:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755528467; x=1756133267; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H2afKEgQbtq+HgvwtCFhX+9Qh9FWO4YX7knoa3B5YJg=;
        b=XdPAQJzeDr751QcK5cBLEvrxxjpCvmaYRomUT6snZSkm1osA8EHi7+Vnwd/AVFEAh9
         eAxjDbJrAXs1b6WAxURLMzz2OfALXivKDMstPkJNFxdwZCgjsx+9KjCEKx+PyEpRYwNq
         UPZKCFPbFgzmyP7PWcvQK5WJj8cnIi1VE9QqiMJEDZLp8hspaOkkjNC+BN7Ihp/zjRux
         hE2fkHwi9sOOXu60nr73E3zYBZriy1k76R7BEEfuh+OYYX8mw1wyGubYCplX0xyWUoOI
         kfPeUGCL9PT4Tf2/Oyn8oF0ibky5feJwk/3zRJKW/I+3ZEj+6GGvi/Our5aR3oafU6Tj
         dYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755528467; x=1756133267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H2afKEgQbtq+HgvwtCFhX+9Qh9FWO4YX7knoa3B5YJg=;
        b=mK5djDI7p8JCo7i39voQL5KBLDIlEgBoZt/k++wO6ZDOU8MYtVhtIbbEsBPC0Czyet
         shUpEKWfr9sPYFI9frBzKib6UFbPmYdYe8eV0Glh2cys49Tz/7Bfwds47OBysBj2ZQUH
         VTmxfcbAGRbjnnVwOhKCI7oVlETbTxpGMLeCjGkjBLQjSsKV3Lc1Zyub2LNfclY6x8f1
         XGk5ubqd2bKZPI7Jzgj+VxKspvUjfkQukDBQCqwI+/DYixUttoDU+mGw8HrzxmQvAK49
         69cugzD8KJ1ldOS2r3k+KeFD7w1nrdlY+/ReY5XIMst+jvk2y5EFl0iyJ0Xek4BpAFtE
         kFew==
X-Forwarded-Encrypted: i=1; AJvYcCVO/viXX3vFg/AZt77es5EmOM9db9omCvL0bdKLfjmb4PDKUwN691uU5lHf3kEQKTIFBrY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJhhpVhsyaXB4McqEoMfuqRFaApB7NHHzLpUXVELnnvHFhFm7o
	t72P5ZUfCAcR/c83AFDJ1BTLTFSB2Hy/QL/EaJpKJ2jbJx9toEarr8/1RgPu9U/SoWQ=
X-Gm-Gg: ASbGnct9w1HcH+ZV5dTlk2Ov9c6WhiFlkn160nIreP+U+vt2ISMRgklV2Iiq4eWSgbN
	nln+U2gX2bOxCGpwCljPcZhygxOWvhw0zQ/SJB3SMtqOg/DhWFOdHveczkcok2+P6DEdKOC3J1V
	bqgbfcunQxhj9oGGHxPdolKecOjMBRIKmV/LfOxFxD+D397lqAoRZuak0YKPfqcK1QKVgcoVfhj
	/KoMWna7gErpo2x+nFoYooT2RJ8MkdLOHcK5+vKLNIp566qewfI4pPBK7GPS12E1s3n3NOittuh
	IRMRZgBeD+5ygRJGE3w/PeknttJxgcAVVrhi8VBSl046rinzpmZcKG1LNs/6odrNPwMdznEfoVD
	TNndi37AoWAcPlZtOIdWXBhT0eEc=
X-Google-Smtp-Source: AGHT+IFQZt9NUrq552ZnmOgo1r2cW0JA2ngaMERpzFx/grzhOblNLS8XApQAK6JESCty8GRa8dkPGg==
X-Received: by 2002:a05:6000:4027:b0:3a5:2599:4178 with SMTP id ffacd0b85a97d-3bc684d7b99mr7876232f8f.19.1755528466878;
        Mon, 18 Aug 2025 07:47:46 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a8asm13066641f8f.39.2025.08.18.07.47.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 07:47:46 -0700 (PDT)
Message-ID: <bd59344b-9dc0-42bd-98c8-80ab9ca97123@linaro.org>
Date: Mon, 18 Aug 2025 15:47:45 +0100
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
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aJ4ox8+OLhIir2bU@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/08/2025 7:19 pm, Frank Li wrote:
> On Thu, Aug 14, 2025 at 05:06:52PM +0100, James Clark wrote:
>> Document the two valid pincfg values and the defaults.
>>
>> Although the hardware supports two more values for half-duplex modes,
>> the driver doesn't support them so don't document them.
> 
> binding doc should be first patch before drivers.
> 
> binding descript hardware not driver, you should add all regardless if
> driver support it.
> 

Replied to same on "[PATCH 10/13] spi: spi-fsl-lpspi: Add compatible for 
S32G"

>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml b/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
>> index ce7bd44ee17e..3f8833911807 100644
>> --- a/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
>> @@ -70,6 +70,19 @@ properties:
>>     power-domains:
>>       maxItems: 1
>>
>> +  nxp,pincfg:
>> +    description:
>> +      'Pin configuration value for CFGR1.PINCFG.
>> +        - "sin-in-sout-out": SIN is used for input data and SOUT is used for
>> +                             output data
>> +        - "sout-in-sin-out": SOUT is used for input data and SIN is used for
>> +                             output data
>> +      If no value is specified then the default is "sin-in-sout-out" for host
>> +      mode and "sout-in-sin-out" for target mode.'
> 
> why need this? are there varible at difference boards? look like default
> is more make sense.
> 

+ Larissa. I think this might also be a question for the hardware 
designers about why the feature to swap the pins was deemed worth including.

I'm assuming the flexibility is given for routing reasons. If you have 
another device with the pins in one order then you can route it without 
a via if they happen to be in the same order.

> SPI signal name is MOSI and MISO
> 
> Frank
> 

As mentioned in the commit message of "[PATCH 05/13] spi: spi-fsl-lpspi: 
Enumerate all pin configuration definitions" the names were taken 
directly from the reference manual and this doc text was too. I think 
diverging from CFGR1_PINCFG could be potentially quite confusing. And 
MOSI isn't mentioned once in S32G3RM rev 4:

   Configures which pins are used for input and output data during serial
   transfers. When performing parallel transfers, the Pin Configuration
   field is ignored.

     00b - SIN is used for input data and SOUT is used for output data
     01b - SIN is used for both input and output data, only half-duplex
           serial transfers are supported
     10b - SOUT is used for both input and output data, only half-duplex
           serial transfers are supported
     11b - SOUT is used for input data and SIN is used for output data

James

>> +    enum:
>> +      - sin-in-sout-out
>> +      - sout-in-sin-out
>> +
>>   required:
>>     - compatible
>>     - reg
>> @@ -95,4 +108,5 @@ examples:
>>           spi-slave;
>>           fsl,spi-only-use-cs1-sel;
>>           num-cs = <2>;
>> +        nxp,pincfg = "sout-in-sin-out";
>>       };
>>
>> --
>> 2.34.1
>>

