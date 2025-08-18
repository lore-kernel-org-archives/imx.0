Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CAC335BA7
	for <imx@lists.linux.dev>; Mon, 18 Aug 2025 13:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755524941; cv=none; b=k47Xc33+DDAwzCCweUtNxpPvCC4eJinDZUfps8scFR3cy+JqcLlEm+MH/upgV2lGKnnTpV4fkROz9AUJL//16+dgzimsUx66OIra46z0CHyOVLAX2WuAd5awSJd8FCKMZDRk3twDZnDMVNtUBgO1exUHFPMuRVs2hTdV5K0v90k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755524941; c=relaxed/simple;
	bh=Iq41YliHm0d8n8rWWR3bza0G/ceeGQ4+coO+hydkSXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jph1IonjFMqpmEmCaJtiqEMzIXFf1z5RQnt2FMEkXwqg0h/Zd40lu/WQfEOryMTrGi1jNMD3CJyrMSTD3Av6VFQTgf48XJyvQad6zboaGKruTG7lJSReOvvpDw/b/u/550sOeQu6JeDn+wizxv1LhyQptt5G4L3VlY3j16SnyCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LTVEA8gN; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LTVEA8gN"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b9d41cd38dso3342068f8f.0
        for <imx@lists.linux.dev>; Mon, 18 Aug 2025 06:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755524937; x=1756129737; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sh+bHoKKtm/hsPtjkx/NyjNhDEo2COTVB4L7LsR7sJ4=;
        b=LTVEA8gNgpZ5Bfla3UugK7003hQtngK/81V6h1Ds9kWyEbw0oaT/IUmCI6VjDLqOm8
         d5vF6nRKyU5PwiBpMnpnAIpnZGglRhOifKzFPIipSySRF9FirsGzKvrVzE4h3Hm3+JA+
         mnimlGRkDD+7ha8SNbmzgOvrZ3V/PjVrEOgRRv3POhPOBM3yEf6blC3g/0doHcRr4w2c
         g0wTSzIaRP3nW4A6p3lyV1R4PQADc+Uf1xbiaR/eCpwE0rt7sLNpvn4xXgZSA9MmgbN0
         pZBy9NuBnKWEE1hT+6X9fw9zF25z6iChzSLJomG8rZLFhT0Jk1HhaGmU1F9d0n7tGjZx
         jkCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755524937; x=1756129737;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sh+bHoKKtm/hsPtjkx/NyjNhDEo2COTVB4L7LsR7sJ4=;
        b=DIwVJmpHczUD827W1dmiWCptD7xD1+qKVvgBPHBbEwfUzYhRqyV5jnEUuboDgaEh4H
         Ptaw1XG+RHwZGflWYMBL2LF9L1KUm+9MY0g8h4Ryk0wK6E6x+WzY/nOD1+NouSO1otm7
         dx/NOrUc74l28SNGjO32Dd47MNbzvpufPEZua5T8UKP5ddaPJNJ5NDjGgnLooebb1BGt
         qaIO0LKHRhOjJ0ZtJLKGSI778SNfKSOwzsoevnIUOWmM/Jf/hnckdKTBUqebC69jrH8x
         PbZNp4FtOxrU4uu8bxGVc3AJ8XO9ISITWfINhGIGP/swoP67Kq3bbtfecXMi6eEDNqVK
         KFxA==
X-Forwarded-Encrypted: i=1; AJvYcCVSaz/jyYnM52WvAo+ntKGax3m1nJxTUCRsYYbSucfln0oOEzOJhSCXM5um+7Y0JNLc5Mg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTf3iQB4H8dvD7QwAiu8k7GDmpPBn3EgEhNLQoaZorhWE0/Abr
	QpoClgXbY+1A5CXmjclfWn+qIjMl6he2ehDQgAAK/jV3qLC0mUIrwzLqH+EPVjgOTac=
X-Gm-Gg: ASbGncsyFSVtL86Rg70zEuoKCiDoSOXneQWC7BzeRk8/xd//L3g037z56j3YOPMrJoQ
	0Df8owmknZvQ4T2WgzNTKI7N1ISO5KMw1AIDr0u/JmA6H6SUk8WPCRRnCws00MDoj/kImXzLuoZ
	kGFWFZjjCor+vKXXvkSeqkqMjs/TrlfGdwUZqJX0EAdEgtmxLFp1iHY7QzZymqpEZeShYkq7yNu
	h7dRKvvtOEcNo28DKVDrxgNpCEaV0ucu1NOuCJIFyJVMMyIvJfBWJwl/YgoBtOzpwTV836/i5JE
	98dNQDiL2MKy+xbSpIjC3IJ0BWGBMJ4TNngnQ3hY1YOts5JTA8nof5Ondlsh3ZYDcjvgnfPCp2g
	6W9BFn4s7QDQ2tXzRS2mfglfvk5Y=
X-Google-Smtp-Source: AGHT+IEKz79YyPVBfJQGlFogDcQJMYXgYE5WI5cAwBE2CTscdIWf8BDHmqXB1zUVqxIISepL6GSx+Q==
X-Received: by 2002:a05:6000:430c:b0:3b7:8984:5134 with SMTP id ffacd0b85a97d-3bb66a3b2ddmr9157492f8f.16.1755524936995;
        Mon, 18 Aug 2025 06:48:56 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bc5e232534sm10573878f8f.24.2025.08.18.06.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 06:48:56 -0700 (PDT)
Message-ID: <84498b4b-9023-4a39-bc75-d2b7a495821f@linaro.org>
Date: Mon, 18 Aug 2025 14:48:54 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] spi: spi-fsl-lpspi: Enumerate all pin configuration
 definitions
To: Frank Li <Frank.li@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Clark Wang <xiaoning.wang@nxp.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Larisa Grigore <larisa.grigore@oss.nxp.com>,
 Larisa Grigore <larisa.grigore@nxp.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Ciprianmarian Costea <ciprianmarian.costea@nxp.com>, s32@nxp.com,
 linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250814-james-nxp-lpspi-v1-0-9586d7815d14@linaro.org>
 <20250814-james-nxp-lpspi-v1-5-9586d7815d14@linaro.org>
 <aJ4mfDUcbrP7OSOH@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aJ4mfDUcbrP7OSOH@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/08/2025 7:10 pm, Frank Li wrote:
> On Thu, Aug 14, 2025 at 05:06:45PM +0100, James Clark wrote:
>> Add all the possible options, use names more similar to the reference
> 
> Add all the possible pincfg options,
> 
>> manual and convert _OFFSET to _MASK so we can use FIELD_PREP() and
>> FIELD_FITS() macros etc.
>>
>> This will make it slightly easier to add a DT property for this in the
>> next commit.
> 
> Make it slightly easier to add a DT property ...
> 
> No funtionality change.
> 

Ack

>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/spi/spi-fsl-lpspi.c | 21 +++++++++++++++------
>>   1 file changed, 15 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
>> index 79b170426bee..816e48bbc810 100644
>> --- a/drivers/spi/spi-fsl-lpspi.c
>> +++ b/drivers/spi/spi-fsl-lpspi.c
>> @@ -69,7 +69,11 @@
>>   #define DER_RDDE	BIT(1)
>>   #define DER_TDDE	BIT(0)
>>   #define CFGR1_PCSCFG	BIT(27)
>> -#define CFGR1_PINCFG	(BIT(24)|BIT(25))
>> +#define CFGR1_PINCFG_MASK		GENMASK(25, 24)
>> +#define CFGR1_PINCFG_SIN_IN_SOUT_OUT	0
>> +#define CFGR1_PINCFG_SIN_ONLY		1
>> +#define CFGR1_PINCFG_SOUT_ONLY		2
>> +#define CFGR1_PINCFG_SOUT_IN_SIN_OUT	3
>>   #define CFGR1_PCSPOL_MASK	GENMASK(11, 8)
>>   #define CFGR1_NOSTALL	BIT(3)
>>   #define CFGR1_HOST	BIT(0)
>> @@ -411,8 +415,9 @@ static int fsl_lpspi_dma_configure(struct spi_controller *controller)
>>
>>   static int fsl_lpspi_config(struct fsl_lpspi_data *fsl_lpspi)
>>   {
>> -	u32 temp;
>> +	u32 temp = 0;
>>   	int ret;
>> +	u8 pincfg;
>>
>>   	if (!fsl_lpspi->is_target) {
>>   		ret = fsl_lpspi_set_bitrate(fsl_lpspi);
>> @@ -422,10 +427,14 @@ static int fsl_lpspi_config(struct fsl_lpspi_data *fsl_lpspi)
>>
>>   	fsl_lpspi_set_watermark(fsl_lpspi);
>>
>> -	if (!fsl_lpspi->is_target)
>> -		temp = CFGR1_HOST;
>> -	else
>> -		temp = CFGR1_PINCFG;
>> +	if (!fsl_lpspi->is_target) {
>> +		temp |= CFGR1_HOST;
>> +		pincfg = CFGR1_PINCFG_SIN_IN_SOUT_OUT;
>> +	} else {
>> +		pincfg = CFGR1_PINCFG_SOUT_IN_SIN_OUT;
>> +	}
>> +	temp |= FIELD_PREP(CFGR1_PINCFG_MASK, pincfg);
>> +
>>   	if (fsl_lpspi->config.mode & SPI_CS_HIGH)
>>   		temp |= FIELD_PREP(CFGR1_PCSPOL_MASK,
>>   				   BIT(fsl_lpspi->config.chip_select));
>>
>> --
>> 2.34.1
>>

