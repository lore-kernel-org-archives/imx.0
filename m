Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DC12AE78
	for <imx@lists.linux.dev>; Fri, 24 Oct 2025 00:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761264261; cv=none; b=K6ZO2OSuAjm6iy3YN/UIr09pvRyWhYMxwa4wDjqjdPOY1U3F22rOs2KvPICvD8yvGE8eBm9CjKGJwfNbhc9KH/lyNKjTkj4cfODYUGkO0+FOsRo10oGpSdV+h6rscjnNFB6sjBxjxxpLhMPASRK9QzFTEVgMxr9x+Ps7WNfRCcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761264261; c=relaxed/simple;
	bh=dcbemmyeeMmTnjiRx8pMVuxWJgKXnilUcIcodBpT8G8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lFogbrPE9hhNHME7KsuBVJUSI1QyN42Te8/nQZqC7EvC+6OneF0JSRdbv+XXCAJP+NV39f7HHmV8Lfl6L8rsHmeN34xYfUCCYL5YTcaqurKQgrncrj70DxIzoyEyKOIGrVO2PBXltk1Tr/YXKUPfYcNlpCQwonAvs6Tg2pRLUGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=06RbMXCm; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="06RbMXCm"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-33be037cf73so1603799a91.2
        for <imx@lists.linux.dev>; Thu, 23 Oct 2025 17:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761264260; x=1761869060; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P+K9cJwbaPRk/hXgfMNgGGaWCdBEf3vNiXBdImnfxaI=;
        b=06RbMXCmfUzb3NuSI7InT2vkeOo/55tRGkSTAZWUF4Z6YpGwxsk/pIA8eMGAjV+hZB
         A0eJh85UNLQGKM1+DJSWx4T6NYr66ZlhMmOY9IC9Z0hMY8eYchy9P+ys1oGxAZsP/egn
         IpSmZewoT6nUQXWlMVw8MD4C2quiGZLCT9eMQwgXYLyLhwh80+sNizOkU3B0BXrPfOSG
         wOxrPvE/HJny/iMbSGC+c9Vrr4nlv+PAahJthYP9ICz9lqdpeNiOaqyqHz1wGe2z4ABz
         fXpmha7nIosjXtDb7rG9H4x2ni8g5CTZngu0/xL3bQ2E0Hc370KH9atqrRJDFZ+kTJFC
         dkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761264260; x=1761869060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P+K9cJwbaPRk/hXgfMNgGGaWCdBEf3vNiXBdImnfxaI=;
        b=flQyZUfPboQPyhydEUgOoMSphs/LSo47WEpittxtFt/7N897dUKOhc4ctalSQPahPW
         JCjZGull6GEj6n20Owzzr7J/Zi7HCHSRZk3eybiFDS382EUJpiVIkFvajKek9lnYxBDO
         KhX/8cebge5U4EBxf9U37ZUB6GCATE++kubOVnpcdEPFHi+r/E2Qml0KdIctcng7dlOC
         1+/aQaGPOPIpkTd7GW8XMx/s/C+U6Q6yzrQnTwUb+N0IbuhOaGtzLoMCcTmiUSSqsklJ
         rAAAaUnYFOC4587AQizuyESV31dtlxvxNOmAz1S19DtU8R3Pg0R4pfHQOUFC4/C4AZt4
         AwOg==
X-Forwarded-Encrypted: i=1; AJvYcCWODd9QmTnUqauoxp5JKz5nrrfQyzbVqAt4H9G1JbFqAtZIm88/oWGexQe80rfd3y2o944=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxjw4ypeoaHE9uN+QqD94fsafdGQmWM7gwUgG6G5uyFuEYo9oqm
	4FDDVYR2OwNsL9mJu96XAAZIvHTqqNUFhZZ2x1bfW9eWgj1cpj2XfkagBHRWKvH0x6M=
X-Gm-Gg: ASbGnctXoagtmcgJ4CU6v4Q767xf/Jo+De1u/h6gUDwgP83LzHyZuQLz3uAQnHXZwtT
	/qQ0+pHBbmwGdpnxJwpvijOsXA39ImBpAGqpftvEkN19gRF7sWiq+wgYHqDPeTCTWbav1GkkhRp
	O3DyEyn9cVI/qPDN1vK6MAka8DAK6z2Z1tw8HeHorTMplIDhLDhtjBHeOl6+JTSkthkHf6UAkH3
	sAHyzYc5fuCMnJCDtGVqL6ote5PwOEcyFcL8b3O5ZMNoZeNxuAs05juW4LcxMXlKhZ79uVD0aEo
	pXnAZVwciqY+S1bXhad+FY6bzZwrIrgacJCwIXm/4Js3WIVcPafoQRfxY4FX/GQ+lzfx75SRujX
	pDNwuSCZqg8iBb/SDQgtb7GfT2ow5XFvGxi6lc3chDMQijs9LDG61JFL8RwZtGVLVZB7/W+i2iw
	8I3b8gbZwkw6VhtJMDCQ7mL/eU6uo=
X-Google-Smtp-Source: AGHT+IE6HvbwvsCvQ5Cwmi6yqRRJUHyh9wrThsLz6Rz6ydecgfWWPWXRIw3RN/OVaQzDTAtqVvVBTg==
X-Received: by 2002:a17:90b:2247:b0:32d:e780:e9d5 with SMTP id 98e67ed59e1d1-33bcf8e5f10mr34441928a91.22.1761264259653;
        Thu, 23 Oct 2025 17:04:19 -0700 (PDT)
Received: from [10.211.55.5] ([208.115.86.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33faff373easm3702460a91.5.2025.10.23.17.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 17:04:19 -0700 (PDT)
Message-ID: <f1a77da8-edf9-4e14-a7f9-01680f60fce6@riscstar.com>
Date: Thu, 23 Oct 2025 19:04:18 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] spi: fsl-qspi: support the SpacemiT K1 SoC
To: "han.xu" <han.xu@nxp.com>
Cc: broonie@kernel.org, dlan@gentoo.org, Frank.li@nxp.com,
 guodong@riscstar.com, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251023175922.528868-1-elder@riscstar.com>
 <20251023175922.528868-8-elder@riscstar.com>
 <20251023195615.ke4rjhlgrxiavv6r@cozumel>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251023195615.ke4rjhlgrxiavv6r@cozumel>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/25 2:56 PM, han.xu wrote:
> On 25/10/23 12:59PM, Alex Elder wrote:
>> Allow the SPI_FSL_QUADSPI Kconfig option to be selected if ARCH_SPACEMIT
>> enabled.
>>
>> Add support for the SpacemiT K1 SoC in the Freescale QSPI driver by
>> defining the device type data for its QSPI implementation.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v2: - A continued line the Kconfig file is now aligned
>>
>>   drivers/spi/Kconfig        |  3 ++-
>>   drivers/spi/spi-fsl-qspi.c | 10 ++++++++++
>>   2 files changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
>> index 4d8f00c850c14..592d46c9998bb 100644
>> --- a/drivers/spi/Kconfig
>> +++ b/drivers/spi/Kconfig
>> @@ -435,7 +435,8 @@ config SPI_FSL_LPSPI
>>   
>>   config SPI_FSL_QUADSPI
>>   	tristate "Freescale QSPI controller"
>> -	depends on ARCH_MXC || SOC_LS1021A || ARCH_LAYERSCAPE || COMPILE_TEST
>> +	depends on ARCH_MXC || SOC_LS1021A || ARCH_LAYERSCAPE || \
>> +		   ARCH_SPACEMIT || COMPILE_TEST
>>   	depends on HAS_IOMEM
>>   	help
>>   	  This enables support for the Quad SPI controller in master mode.
>> diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
>> index a474d1b341b6a..d4b007e8172b2 100644
>> --- a/drivers/spi/spi-fsl-qspi.c
>> +++ b/drivers/spi/spi-fsl-qspi.c
>> @@ -268,6 +268,15 @@ static const struct fsl_qspi_devtype_data ls2080a_data = {
>>   	.little_endian = true,
>>   };
>>   
>> +static const struct fsl_qspi_devtype_data spacemit_k1_data = {
>> +	.rxfifo = SZ_128,
>> +	.txfifo = SZ_256,
>> +	.ahb_buf_size = SZ_512,
> 
> Do you need to set the new sfa_size here for multiples of 1KB requirement?

Wow, yes.  I'm very sorry, I shouldn't have sent this series
out so soon.  I'm not at home and am not using my normal
development machine.  But importantly I admit to not testing
this on the target hardware before sending.

I won't do that again.

					-Alex

> 
>> +	.invalid_mstrid = QUADSPI_BUFXCR_INVALID_MSTRID,
>> +	.quirks = QUADSPI_QUIRK_TKT253890 | QUADSPI_QUIRK_SKIP_CLK_DISABLE,
>> +	.little_endian = true,
>> +};
>> +
>>   struct fsl_qspi {
>>   	void __iomem *iobase;
>>   	void __iomem *ahb_addr;
>> @@ -1003,6 +1012,7 @@ static const struct of_device_id fsl_qspi_dt_ids[] = {
>>   	{ .compatible = "fsl,imx6ul-qspi", .data = &imx6ul_data, },
>>   	{ .compatible = "fsl,ls1021a-qspi", .data = &ls1021a_data, },
>>   	{ .compatible = "fsl,ls2080a-qspi", .data = &ls2080a_data, },
>> +	{ .compatible = "spacemit,k1-qspi", .data = &spacemit_k1_data, },
>>   	{ /* sentinel */ }
>>   };
>>   MODULE_DEVICE_TABLE(of, fsl_qspi_dt_ids);
>> -- 
>> 2.43.0
>>

