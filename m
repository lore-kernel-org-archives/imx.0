Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEF32D7DE8
	for <imx@lists.linux.dev>; Wed, 22 Oct 2025 04:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761107666; cv=none; b=kji6pu4AGKlal/kFyPLaq42Uk+eQenFhqoHL2l+4M1q55VeharG+0XKD+TNSvDSXQNh5yM3IvDQNZyxCPaerZ5hIZL/JBbSQznlAZF5cQG4S3ql0RBLxU7GsnC5xFKB079yi62ON3UPJz4FpZUfRfI8dj0EOHkyhwdkYFfvXZw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761107666; c=relaxed/simple;
	bh=M0//wu4eodGM73UzE+/RSQN3dfA7ycS4x9S8XdOl3lg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sqhldhkalW/+xBIHGMwaftIl2BUFHAtrBEkwDt1IdikmhfHakRIf4woSRWiNkpFDCspZg6BChshYaGWjRm0HVsUYLAB8pF5CGaSa/BfpM3fFY3Mk/CnRrYoa0g64rQIjAZ7ppUHY0o+Fc2ER2ACTAjg2aJRhDmlKtCq9p/Xh8AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=DzUoAiEi; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="DzUoAiEi"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-290d14e5c9aso60568745ad.3
        for <imx@lists.linux.dev>; Tue, 21 Oct 2025 21:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761107664; x=1761712464; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EssM+PiDmpcGAGhJSWtJ6fJ+4b18HXlZ45HuXkPg0+A=;
        b=DzUoAiEiHYoKS4jqqRdJKdxHnAyY0hVZH0PNRYfaFaHOAz3Xa/BQBEe5s6UYDaipJO
         DV63sMyC0ZERNCSGIAVqQ5jmAlIPIvyb0l1JB57d2BXlQJYZkEfWsYOjVo52YgoMaWmN
         IVsxF0I/FafeQ3lXij/5Omxxi5kNZK03U+RBa1h6utnX3i7wJWIzGt3Y9Cr2Z1Zjs2X7
         fu/uYAi8EuNu3D25CufyBUKA543NEB89hbQI7n7mMhFwAFBNOvEM7uYC8un51JYyTJTZ
         9B1CqXEO5EJFUK8lQLjxAbv8XfqAcX4ZATNSXRwa/ihdCcQ6THqjD3Sd5dcHLk8r1D8V
         qZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761107664; x=1761712464;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EssM+PiDmpcGAGhJSWtJ6fJ+4b18HXlZ45HuXkPg0+A=;
        b=rVyTiuq/9kDby1eMvFLVt0oUL/mAFUyP3BQLg36X+WZ2yK8bhvabAGBg/JIuNeYLvs
         z7dqOWZwIxQVI5Nn2B53QcOIgEqLGn0DuvTQMTwLLTpR5cNv/CB2yhQTB1VYS5p7fXX3
         pj7/twBGCYsqbLmQbjv2E5E8u710h2wpqA6ZK0Homu6OMracPrEqZqPf9clkr0gMCyhg
         /i5LpExs8gjCeSzGrrL6bqhOOfQs8uWjr0m3MBVSVzW3GNYSm+u8n13seDCrw5WI4OK5
         jSHoVU6rQMD/kOxZalUpH2lP142GIox6xP0sxvh/BWCMPk2JYfd3nQRMAedANBimuXus
         UjEw==
X-Forwarded-Encrypted: i=1; AJvYcCWMfvaMTr1oOg6byo1i+RqZhTKj08IPedNiJg0j0cgUHGBZhUZxQCGSqs3PJI6KDbhdAGo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwSLE3KejavG2GwiiSjyvA0eOeRDow3/HLCg3p9rJKcg53XhC0s
	E7/UuOpg1sOPJS+Zl7p19mZUB05lcqv68lMwewofI4b4VdZeN7hdwWm+BZynQ3giKTo=
X-Gm-Gg: ASbGncuLyzvqNFN2NXcNBRyCmBjQGnU0EZWV/DAOjtil5tBLFlsl1N8A2fMghXM6xt0
	T9EZtHhv2itWQ7exD+o2jQ6DngHcL7bxMo/r483QQeclijwk6IPsScE0FlZ+NNxoS/+hGZ9uG9W
	pH5IJDoK/vCXDCssYyLk5pwG7wODB9OR2IQvahXhI7wM67eIISgkl/JiwBL7fMCWXFJkmNkgXMS
	llJ9984THJqAhSPh8DpmISTHB98EaD4nGuvRokWgmNYgyQwW2BJsmsXQcTviIS1CykFC4m1sEOZ
	0WzwDZdEvzA83N7NcjGCpRY0NNA6+KEJzActXJItQMNg4Du+O1c0yKAt2YRyo9RJM5ce1KnfvER
	0wWzOinbqQtZRQb5nfAvD7xQ+IxoV7iAkk8Mq9htI/xBVB3ZxTQBuTgh4UrE7arHxMlAsdj5bMn
	b3zLBaXDRJUrq4
X-Google-Smtp-Source: AGHT+IF+2IOi2vlkb7frAQI7xnO/+5ggSuzSXcXZ4DCJ3RIWA9BMWmGP9exglnUcXrvVgUWfIgCoyg==
X-Received: by 2002:a17:903:228f:b0:24c:ea17:e322 with SMTP id d9443c01a7336-290c9c89cbemr234187615ad.3.1761107664444;
        Tue, 21 Oct 2025 21:34:24 -0700 (PDT)
Received: from [10.211.55.5] ([4.28.11.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fe4cdsm126257025ad.97.2025.10.21.21.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 21:34:24 -0700 (PDT)
Message-ID: <d13590f1-937d-4ef6-8d2f-d0647557b695@riscstar.com>
Date: Tue, 21 Oct 2025 23:34:23 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] spi: fsl-qspi: add a clock disable quirk
To: Frank Li <Frank.li@nxp.com>
Cc: han.xu@nxp.com, broonie@kernel.org, dlan@gentoo.org,
 guodong@riscstar.com, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251020165152.666221-1-elder@riscstar.com>
 <20251020165152.666221-5-elder@riscstar.com>
 <aPaJ479zH/90fJ2d@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aPaJ479zH/90fJ2d@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/25 2:13 PM, Frank Li wrote:
> On Mon, Oct 20, 2025 at 11:51:47AM -0500, Alex Elder wrote:
>> The SpacemiT K1 SoC QSPI implementation needs to avoid shutting
>> off the clock when changing its rate.  Add a new quirk to indicate
>> the clock should not be disabled/enabled when changing its rate
>> for operations.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/spi/spi-fsl-qspi.c | 21 +++++++++++++++++----
>>   1 file changed, 17 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
>> index 1e27647dd2a09..703a7df394c00 100644
>> --- a/drivers/spi/spi-fsl-qspi.c
>> +++ b/drivers/spi/spi-fsl-qspi.c
>> @@ -197,6 +197,11 @@
>>    */
>>   #define QUADSPI_QUIRK_USE_TDH_SETTING	BIT(5)
>>
>> +/*
>> + * Do not disable the "qspi" clock when changing its rate.
>> + */
>> +#define QUADSPI_QUIRK_NO_CLK_DISABLE	BIT(6)
> 
> NO_CLK_DISALBE look likes not clk disable capability. Maybe
> 
> QUADSPI_QUIRK_SKIP_CLK_DISABLE

OK, that's better.

> 
>> +
>>   struct fsl_qspi_devtype_data {
>>   	unsigned int rxfifo;
>>   	unsigned int txfifo;
>> @@ -306,6 +311,11 @@ static inline int needs_tdh_setting(struct fsl_qspi *q)
>>   	return q->devtype_data->quirks & QUADSPI_QUIRK_USE_TDH_SETTING;
>>   }
>>
>> +static inline int needs_clk_disable(struct fsl_qspi *q)
> 
> bool type?

Yes I agree with this suggestion.  However all of the other
needs_*() functions return int and are marked inline (neither
of which I would normally do).

You want me to add a patch to update the others too?  If I
do that it will look more like this:

static bool needs_swap_endian(struct fsl_qspi *q)
{
         return !!(q->devtype_data->quirks & QUADSPI_QUIRK_SWAP_ENDIAN);
}


					-Alex

> 
> Frank
> 
>> +{
>> +	return !(q->devtype_data->quirks & QUADSPI_QUIRK_NO_CLK_DISABLE);
>> +}
>> +
>>   /*
>>    * An IC bug makes it necessary to rearrange the 32-bit data.
>>    * Later chips, such as IMX6SLX, have fixed this bug.
>> @@ -536,15 +546,18 @@ static void fsl_qspi_select_mem(struct fsl_qspi *q, struct spi_device *spi,
>>   	if (needs_4x_clock(q))
>>   		rate *= 4;
>>
>> -	fsl_qspi_clk_disable_unprep(q);
>> +	if (needs_clk_disable(q))
>> +		fsl_qspi_clk_disable_unprep(q);
>>
>>   	ret = clk_set_rate(q->clk, rate);
>>   	if (ret)
>>   		return;
>>
>> -	ret = fsl_qspi_clk_prep_enable(q);
>> -	if (ret)
>> -		return;
>> +	if (needs_clk_disable(q)) {
>> +		ret = fsl_qspi_clk_prep_enable(q);
>> +		if (ret)
>> +			return;
>> +	}
>>
>>   	q->selected = spi_get_chipselect(spi, 0);
>>
>> --
>> 2.48.1
>>

