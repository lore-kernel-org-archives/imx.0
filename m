Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C593218CA
	for <imx@lists.linux.dev>; Mon, 18 Aug 2025 13:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755522322; cv=none; b=SYmO3yrHKI7OLZeD1Wv8NI4fWZAeAkek+Q/8HzAVPSn7b20MgioKD1+ktLCfJ6HnFgkxrOKIOPidrD/obkfNEiWD8+SiW3dmkODdDzpoiaHv2CqqsLbOwDGDdHa1AcSUPcvVy2S/mTIz5Rbx83Gvs+AW4Z2D+ZJ92CZ2yljKJso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755522322; c=relaxed/simple;
	bh=RpAhxP2uLqbqjInuTE70JRXrQca1fdqD+vDq2S1ckfg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iM5w+ZLFa9i9drgT+OXuBlfAC2hnHd7sxMMXzvHFLODKLU2SD1sXEzHnLNXms/1Obki3tCjsOzx76j3FaejlVwSTZTgUBfPe+WUSQFj19nu3bqXTQounu5oeJ/XrdQaXPFbUypkm6vsGxHft78qytnIi24cekNgSSYC4ETWjS9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dfk0ITIO; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dfk0ITIO"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b9d41bfa35so3619789f8f.0
        for <imx@lists.linux.dev>; Mon, 18 Aug 2025 06:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755522319; x=1756127119; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=86BJmrJXeETeW2kp8meE7Uq7AvyYwzMOqYpCJJXyfLs=;
        b=dfk0ITIOQ8jJogAT4RnqVUZ1LlEJQlqMaZjoxntJpbLnjTVwAXA3DIZtLpBHQ/dC+i
         5S/5ozI33IRDgOGVY6BtYndl7i1ZfPwOx7Jj6VZe/qIQZRe/5yIl7/RocfHEat23lxEo
         1FnLo6Elgx7VnISE7UHv9sLaBrUC6YP5GyUv9AQ5AceMYDcXrsqdM2LqjmBEP5WGTdK+
         B2l2MCkQJFJdIEtcyM70RMj7uxxAfNvB5Q9wdADbKU0GKGWv+69jWzAsSbHm17uP6fVe
         AWFol9Z/HQnUtHBmdvfVcgvkyydYc87iuyMkxsUB+szBbJvLOhaf4Szcf9jiammLr+1U
         naAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755522319; x=1756127119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=86BJmrJXeETeW2kp8meE7Uq7AvyYwzMOqYpCJJXyfLs=;
        b=iRQd1gVAzNhA7Zn+5OWkxUUb+Fj78RJHlAgyUdmJDQQilluYPsMylnoSIaGh+SSDTQ
         KEyxm3FKK0kFx9SQcL1yeoAeh1ZMGle5jXzdHR1jmhDON1LAgZT2aI5N8RZSyt1x0VYM
         5CLWxah9ME3wZRTs1JY2ut/AJX4kXEPNrQo97NONoWUMCmkG3UNUO1+bUhaUFM6vGbeR
         KFQL1r/3ysAv7AHl6MxixnfWwmaX7n47iqbLy1eYH6y9Vl808GctHKRlS9EgAfPIv0kn
         4kiem9XjLfFvs+YBbXI7buBj/+zXj2oYsik5OpiDE8HzuAfM9F2K7N1gOZ3qN2nzgBfO
         rKPQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8HQbA0XWjo47RWD64jhhbpkwIHQZXVzaxN2C6NY33wo5F3ONLIaRECDKUBSUSxQt9GKo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwExb9ijetlTKKA8KRxdRTvdQihW8H6tMmcYPo6LIxF4D4JqMOF
	ZYDE7P3pq5Ok9eq6qTkc/sVcNFyMGx2+f/knHE+1WICqigL1XOYKJZP6NSZYwn+f+U4=
X-Gm-Gg: ASbGncvAwaXd94g2MnUdgaX7wJkmByZ2Y++haNQGfpVbVACrpQf3zDunjhpSn5vX020
	me9s2U/OCdfGev++n8vUfkQFEha4oQgYbewc+lS0jInSIyXE/GhIrOpPaOsL/58XxRXIf4ZaY1r
	nPJrqJifvB/Nm2SLp7aUawz4CcYycxI4P1Kf4gBIvtRb8B8WzB1D0NIoDlZW808NpZmnFiPba+o
	FM3I15MIujAax3n3aubpUMuJ/pzIijyS8cJGqXWJEqVh5RKa6Na59lA0pejjkiIMtInL0/mEQpv
	xWknCJfahcaYufhYerp5FD74wV87fRaZcXr4FwT9Vb8KAmf6Q0Y+bK7r9AUP8lE+RMkgPcpsCVS
	E6AB37zpIvR9iS4Fxh88aj6Pb/VuDVFRmyhzyGQ==
X-Google-Smtp-Source: AGHT+IHcwykrBK8tXrdhApeeaxgZhKOjTfFirzDPuKeFi7nfZYLL6OLNQGBRz5fJTm0ZvXzAmYWt9A==
X-Received: by 2002:a05:6000:1788:b0:3b8:d493:31ed with SMTP id ffacd0b85a97d-3bb690d3800mr10683315f8f.47.1755522318746;
        Mon, 18 Aug 2025 06:05:18 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb64758d1csm13236548f8f.8.2025.08.18.06.05.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 06:05:17 -0700 (PDT)
Message-ID: <90d40899-c9b8-4628-a0b5-06ee0aa497be@linaro.org>
Date: Mon, 18 Aug 2025 14:05:16 +0100
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
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aJ4TkKdkIPiJhhF4@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/08/2025 5:49 pm, Frank Li wrote:
> On Thu, Aug 14, 2025 at 05:06:42PM +0100, James Clark wrote:
>> From: Larisa Grigore <larisa.grigore@nxp.com>
>>
>> The driver currently supports multiple chip-selects, but only sets the
>> polarity for the first one (CS 0). Fix it by setting the PCSPOL bit for
>> the desired chip-select.
>>
>> Fixes: 5314987de5e5 ("spi: imx: add lpspi bus driver")
>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/spi/spi-fsl-lpspi.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
>> index d44a23f7d6c1..c65eb6d31ee7 100644
>> --- a/drivers/spi/spi-fsl-lpspi.c
>> +++ b/drivers/spi/spi-fsl-lpspi.c
>> @@ -70,7 +70,7 @@
>>   #define DER_TDDE	BIT(0)
>>   #define CFGR1_PCSCFG	BIT(27)
>>   #define CFGR1_PINCFG	(BIT(24)|BIT(25))
>> -#define CFGR1_PCSPOL	BIT(8)
>> +#define CFGR1_PCSPOL_MASK	GENMASK(11, 8)
>>   #define CFGR1_NOSTALL	BIT(3)
>>   #define CFGR1_HOST	BIT(0)
>>   #define FSR_TXCOUNT	(0xFF)
>> @@ -425,7 +425,9 @@ static int fsl_lpspi_config(struct fsl_lpspi_data *fsl_lpspi)
>>   	else
>>   		temp = CFGR1_PINCFG;
>>   	if (fsl_lpspi->config.mode & SPI_CS_HIGH)
>> -		temp |= CFGR1_PCSPOL;
>> +		temp |= FIELD_PREP(CFGR1_PCSPOL_MASK,
>> +				   BIT(fsl_lpspi->config.chip_select));
>> +
> 
> Feel like FILED_PREP(..., BIT()) is stranged.
> 
> I suggest #define CFGR1_PCSPOL(x) BIT((x) + 8)
> 
> Frank

It's using an existing macro that everyone knows though and I found 65 
instances of exactly this. It can be read as "set bit X and put it into 
the PCSPOL field without any further investigation.

If we make a new macro, first the reader will have to jump to it, then 
it still doesn't immediately explain what the "+ 8" part is. Using 
FIELD_PREP() also has the potential to use autogenerated field masks 
from a machine readable version of the reference manual. You can't 
statically check your macro to see if + 8 is correct or not, and it also 
doesn't catch overflow errors like FIELD_PREP() does.

There might be an argument to add a new global macro like 
FIELD_BIT(mask, bit). But it's not very flexible (can't set multiple 
bits) and you can already accomplish the same thing by adding BIT() to 
the existing one.

Thanks
James

> 
>>   	writel(temp, fsl_lpspi->base + IMX7ULP_CFGR1);
>>
>>   	temp = readl(fsl_lpspi->base + IMX7ULP_CR);
>>
>> --
>> 2.34.1
>>

