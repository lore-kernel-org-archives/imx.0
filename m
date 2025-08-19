Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE52310645
	for <imx@lists.linux.dev>; Tue, 19 Aug 2025 08:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755591674; cv=none; b=P1kNrnI59mi5GSQTKSR7V+4n42gYI1Rf2bIJSHzLCJtureZHZJ75ulJF8sFyI398aSpKGl7BE8ORGT1Da8bw7pXYshNDCtL/vik6GGhn7sR1QZxSDudQUCOlKH0b5Kb5FIjzRc2AqFSrU5BiT6X7GUGJAcAeAXp5RcMj+6TxGsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755591674; c=relaxed/simple;
	bh=wUlUXNYlT2av8wbOvTTdJzvL3+bwtI0HGI8+TD3utoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cefeQCd+0tyVP+CEHHSQpXjjW5rg2KOuu+hNfv3hAMHsb8IN2UX/3qLUCfVQLPkiXkcuuD4XfjYHdiMq3svLYJhJsinNLYm7drEdS/BznsTFQIOGf/i+yGSQ34ndhN6m2K60hDk5NA8LpJPpAASlgDZOvebRTYA+0GGYLDCuhko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BOVqEFLn; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BOVqEFLn"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b9d41c1963so2473895f8f.0
        for <imx@lists.linux.dev>; Tue, 19 Aug 2025 01:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755591671; x=1756196471; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KYn6biyygAUVxiflH2dTAhFnJ7gRMdUiaEcaWo4kcaM=;
        b=BOVqEFLntrkoP9MFrXu6TOzdyBM9BTkEZ9rneJ4iXnH1AeD19lZPo0maFEKyiumY36
         pbL6Hx0yMuItNfzTUmf7rOXIc5Yir32M+0lxkPCGBtAMz3iAg9P/COmcuYnQwVbhuenM
         O6/7e2fAlEXmcSCwgmtOQrB03s5pduubZHSz1mKsci1ngpqhvrOeGuz3M9RvQGzARYpc
         6RbXl0TafgCbu1dZBj3j+T8JzmHTawjxWhRk/yJh2cJoLQ7MpTBkmXAX38Tw15xOg0nw
         3AHXotop5z2Vv+JRc2PP6zWJVEZ+dzNzi1WDfYlrGy7pKLmXRU2S4hoYBgz1ZrQsz4pd
         XBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755591671; x=1756196471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KYn6biyygAUVxiflH2dTAhFnJ7gRMdUiaEcaWo4kcaM=;
        b=m3vpjGg4n9kmbxoTvr170EHJYpl6pTJ3JkGeQxIKQLpQbOv4JxNDCSn9aYdaUghU2a
         XZXbRULEHReABJwshl5oKal6GsVUxr4zVp1qIt0WYtkCOEWUq6070GS+CrVdCAbr4yoC
         GK494WmlBCsIXK8Ly0ITL+3gcFabRPuYAUjjoJnHYQjLzwhizw033DiVgm2iKWkZdr7Z
         su3VkJJRUD9SZq3CE7tJB0D9iIUqgFE03S/GbAYjj94vwizyczAHeI2BjOv8fmrf6hxR
         tl+FEDxieA0sb7PoE9mSnkrTn5PPcX8NksusDY87G7sEkpWskQgqtdO7HjyOjeipxghG
         PPUg==
X-Forwarded-Encrypted: i=1; AJvYcCWrPvYWKTkgHvVxCTrE8/Gk2PjVPkwSJ8wrrBtX5EpOSFVS6yWjcfHhnPPsKaYoA4Kx9qw=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywu0q7JQcaeL0okc66EJoeGMFSlJEBhFe3faLhzTMUfilWG3/2j
	hK1MKcPEUDvd7lPsQut/Tgc6XsCyVQJHyqleenmZo3n37RNcBQH9RmUqYKD5xFWVXso=
X-Gm-Gg: ASbGncvRF6H6Y7sbOnkt3ehVqvcJPyznliNZ2BJaKwUsuKhZimiaZ+wmpbBWA67i5p1
	d3AxSzIXtl25AdsrxgSZv91kKRp0UlKcBMXxhaMf/cNSWzBgWtrKXcj0gcYxi8DGGLOMj/xWywy
	icAoFgm+qhi8R8Vkh5h5iqVYd2/Pc1T/Q76aMcbcCWuyHI0U8HSjsLCtR5uYTZvAKtdj6ycv7gv
	GadrrAhSqk5+bBxcKo0+j7dXU8quA4QlXajmshkq0TGL0h1I1m5LVEM4lsy+LqZuh/hpgHtDJMe
	VIJPs+A3dB7oAQ8+VNVsu2h9rW43jVWrxU/hz0mLMAYk4fRDWaDjZwAY6Khz0763C19WOWxJt2S
	rB5Rsu2BN/SQnZXFeeOG37EX4iMw=
X-Google-Smtp-Source: AGHT+IFMCXCK9wgxZ9X1waWYq1FWyGk6N/vUke9mVrMaFS0aIoajO/AFuehg2yaWUxtXmN5DBKI78w==
X-Received: by 2002:a5d:5d0d:0:b0:3b8:f887:c870 with SMTP id ffacd0b85a97d-3c0e9f01259mr1308081f8f.19.1755591670842;
        Tue, 19 Aug 2025 01:21:10 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077c56454sm2659047f8f.58.2025.08.19.01.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 01:21:10 -0700 (PDT)
Message-ID: <7a81e256-ec55-4baa-a054-04c4fba0b5c7@linaro.org>
Date: Tue, 19 Aug 2025 09:21:08 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] spi: spi-fsl-lpspi: Set correct chip-select
 polarity bit
To: Frank Li <Frank.li@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Clark Wang <xiaoning.wang@nxp.com>,
 Fugang Duan <B38611@freescale.com>, Gao Pan <pandy.gao@nxp.com>,
 Fugang Duan <fugang.duan@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Larisa Grigore <larisa.grigore@oss.nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Ciprianmarian Costea <ciprianmarian.costea@nxp.com>, s32@nxp.com,
 linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250814-james-nxp-lpspi-v1-0-9586d7815d14@linaro.org>
 <20250814-james-nxp-lpspi-v1-2-9586d7815d14@linaro.org>
 <aJ4TkKdkIPiJhhF4@lizhi-Precision-Tower-5810>
 <90d40899-c9b8-4628-a0b5-06ee0aa497be@linaro.org>
 <aKNEfJrD+pp8+0dT@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aKNEfJrD+pp8+0dT@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 18/08/2025 4:19 pm, Frank Li wrote:
> On Mon, Aug 18, 2025 at 02:05:16PM +0100, James Clark wrote:
>>
>>
>> On 14/08/2025 5:49 pm, Frank Li wrote:
>>> On Thu, Aug 14, 2025 at 05:06:42PM +0100, James Clark wrote:
>>>> From: Larisa Grigore <larisa.grigore@nxp.com>
>>>>
>>>> The driver currently supports multiple chip-selects, but only sets the
>>>> polarity for the first one (CS 0). Fix it by setting the PCSPOL bit for
>>>> the desired chip-select.
>>>>
>>>> Fixes: 5314987de5e5 ("spi: imx: add lpspi bus driver")
>>>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
>>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>>> ---
>>>>    drivers/spi/spi-fsl-lpspi.c | 6 ++++--
>>>>    1 file changed, 4 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
>>>> index d44a23f7d6c1..c65eb6d31ee7 100644
>>>> --- a/drivers/spi/spi-fsl-lpspi.c
>>>> +++ b/drivers/spi/spi-fsl-lpspi.c
>>>> @@ -70,7 +70,7 @@
>>>>    #define DER_TDDE	BIT(0)
>>>>    #define CFGR1_PCSCFG	BIT(27)
>>>>    #define CFGR1_PINCFG	(BIT(24)|BIT(25))
>>>> -#define CFGR1_PCSPOL	BIT(8)
>>>> +#define CFGR1_PCSPOL_MASK	GENMASK(11, 8)
>>>>    #define CFGR1_NOSTALL	BIT(3)
>>>>    #define CFGR1_HOST	BIT(0)
>>>>    #define FSR_TXCOUNT	(0xFF)
>>>> @@ -425,7 +425,9 @@ static int fsl_lpspi_config(struct fsl_lpspi_data *fsl_lpspi)
>>>>    	else
>>>>    		temp = CFGR1_PINCFG;
>>>>    	if (fsl_lpspi->config.mode & SPI_CS_HIGH)
>>>> -		temp |= CFGR1_PCSPOL;
>>>> +		temp |= FIELD_PREP(CFGR1_PCSPOL_MASK,
>>>> +				   BIT(fsl_lpspi->config.chip_select));
>>>> +
>>>
>>> Feel like FILED_PREP(..., BIT()) is stranged.
>>>
>>> I suggest #define CFGR1_PCSPOL(x) BIT((x) + 8)
>>>
>>> Frank
>>
>> It's using an existing macro that everyone knows though and I found 65
>> instances of exactly this. It can be read as "set bit X and put it into the
>> PCSPOL field without any further investigation.
> 
> Where have such pattern in kernel?
> 
> Frank
> 

Grep "FIELD_PREP\(.*,\n?.*BIT\("

65 results, e.g:

   return FIELD_PREP(RTL8366RB_LED_0_X_CTRL_MASK, BIT(port));

James

>
>> If we make a new macro, first the reader will have to jump to it, then it
>> still doesn't immediately explain what the "+ 8" part is. Using FIELD_PREP()
>> also has the potential to use autogenerated field masks from a machine
>> readable version of the reference manual. You can't statically check your
>> macro to see if + 8 is correct or not, and it also doesn't catch overflow
>> errors like FIELD_PREP() does.
>>
>> There might be an argument to add a new global macro like FIELD_BIT(mask,
>> bit). But it's not very flexible (can't set multiple bits) and you can
>> already accomplish the same thing by adding BIT() to the existing one.
>>
>> Thanks
>> James
>>
>>>
>>>>    	writel(temp, fsl_lpspi->base + IMX7ULP_CFGR1);
>>>>
>>>>    	temp = readl(fsl_lpspi->base + IMX7ULP_CR);
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>

