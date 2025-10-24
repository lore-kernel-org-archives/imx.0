Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984F71A2389
	for <imx@lists.linux.dev>; Fri, 24 Oct 2025 00:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761264265; cv=none; b=DePymGm9wmIl2a03MTFYkFkpQ3+jQ2+hxVhSIjO86+X1MtgAJGtJpJxvIH3CsiAbuoHVWO+y6Lg4cR2q/dU6Kn4HNGv2A3iTyy92sVVUkCwCGlkhQ6D2bbNKu5LG8eXq1dHEetARcD3tsmunDbPLJV/ezvGJikHxEuKH8lRviBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761264265; c=relaxed/simple;
	bh=ceWD1KwcWrkZhyx2DZAU3kYVDAav9FmdCMppa5vbOco=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OUT9F5VRdVRCXZ8XgrVKyIJSATH71fppM4EU4Wgz60IG9jbERmeUFWtNRQXqR712OkRediwSDzlMA5VC39dIkOxKAyzEKB/03JUayYHIThNDgwj4huasfQutJPQr6yMMk/QmWm+t4DTXP8SDpCdW8U6Hcjui55ckDZGFbpzBAC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ng448WhC; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ng448WhC"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7810289cd4bso1401071b3a.2
        for <imx@lists.linux.dev>; Thu, 23 Oct 2025 17:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761264263; x=1761869063; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qjw6GkWiRFtO3Gl0DgzCouuS1/pA0eKo+XSbrrk/AhI=;
        b=ng448WhCcsAhQlwcIYvi2BA3ZvKX7D237aErEiIlsHhspFbqe4yOzXZZXVix3m2yE/
         h8XbgHOHWzWSpO9XgSkH3AtWHbdTGyutcIDLNwoD+Lz2071cW6+LCRl7bDNHQvZD7Tgk
         fhmXTIm3v5Rj8ctDnu8vP9tPUKoYu4xAq1ilc6pFIfQbgPfRRxicV5QTTv/r4M+0HeP3
         B3dFvjP4VdFKiuKK3l4d7OvP7ywbzwMrhTETNgsmCdJUhXpKvItMpmlGeTRprgET1P9o
         PtfAbBZh9vzyU3CiHS3gzByX/5w99nXYj/FEJpG3SH13ytAzYv9rD8ERmBQVs+x9QIjX
         fb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761264263; x=1761869063;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qjw6GkWiRFtO3Gl0DgzCouuS1/pA0eKo+XSbrrk/AhI=;
        b=EQT7ZgkwHSD/ZkxcQj3L+xiw4ieV6py7cN+jyp2ypy+DEDpFRrck6gbCsFpWwEh4y5
         wfZ2BEMthymWI20mPv8bgyUqHEOHVaZYkXAyokJ2liDZxMA8J54dizh/xnxT1xYYd3WT
         pswwdiK9QR7Pk06qNME4Fxkfkq6Km4GBovWPukRTPA7znw9y3o7MySYRP563DV85inpi
         tqy8HfWj41WgTwsER+nGsAzr1ukWhkKvFi80VB2mJDdtRUUtZ2r1BXZP3frMXX8VYjbv
         NWdH9siyU0q3nEjbsND7YMkw0cQLgwp7QGVJBP5Pscl3tsJZjgupW/Pw5jCxjEF4X+Dj
         xwXg==
X-Forwarded-Encrypted: i=1; AJvYcCWnxxvYtrErHsiIQIE8ByyzLr/4O8EEvQel+XkF9X8jmUVHupaCayUCAwveAyjf50pGGf0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWh1lRUALGJ0IOQFd/pHeA0LRxeS2VOCGqeaBjD7utuCl8Mpeg
	9FkCsJmWikg/2wCzzvbJIgdS2hFKpM5DotQUiEdrZO3aD/oNBkbvUshYfO0BIL22ilk=
X-Gm-Gg: ASbGncuAtyjFgrQgYCLbWJb5AYsn5b+nauKrj1jGaKQye7hxhG5qL24auYLVVUojQ49
	YcrPWUz05l3NSrxtzTBmsUjSYh08ej3LyP2Tv+y2OXsJ5fuWao861gVQAIiMaNWKV9oj+M7AhTP
	tjbTXcwXT+atsPOQLMd0Q5kpD15toiAsYSWvc/14ReTp/gvOb9eAL2JfxgT81i9pOeNim+vZXrc
	xRapnik8MkX+bucdRwe3smiwFJpU8fnuSTKapQ5j9KqF6V4QxUL5P5I349KDqPYSkvphIot3X6Y
	smWCxb4rjfAIOwh1gJzZBpdk9gtyq10UdFhOqM3OOYPTBBa3wVYl+pOmhX1TfKPTgeUygmsc+3P
	CPgWzvrtl76XqAzf3lAIG+A0Kob3Wn+riw5oWgKE41EmDpjTglFHMBis8dCsNBBgvVqiqEbLk0C
	COoUO+trtuxaYLjCBO
X-Google-Smtp-Source: AGHT+IEVlzxGRMXWgrP8LOTMF8F9hRbegGiF7+NmjpjW9vsaNPPeuDl5n70FEErCCNUHIH/8Cpl0Uw==
X-Received: by 2002:a05:6a20:e212:b0:334:a4dd:cd09 with SMTP id adf61e73a8af0-334a85341bbmr37585340637.10.1761264262970;
        Thu, 23 Oct 2025 17:04:22 -0700 (PDT)
Received: from [10.211.55.5] ([208.115.86.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33faff373easm3702460a91.5.2025.10.23.17.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 17:04:22 -0700 (PDT)
Message-ID: <f1da325a-af36-4759-b3e6-6b0a4e9eb13c@riscstar.com>
Date: Thu, 23 Oct 2025 19:04:22 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] spi: fsl-qspi: support the SpacemiT K1 SoC
To: Frank Li <Frank.li@nxp.com>
Cc: broonie@kernel.org, han.xu@nxp.com, dlan@gentoo.org,
 guodong@riscstar.com, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251023175922.528868-1-elder@riscstar.com>
 <20251023175922.528868-8-elder@riscstar.com>
 <aPq9LHwtALpsOIwz@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aPq9LHwtALpsOIwz@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/25 6:41 PM, Frank Li wrote:
> On Thu, Oct 23, 2025 at 12:59:19PM -0500, Alex Elder wrote:
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
>> +	.invalid_mstrid = QUADSPI_BUFXCR_INVALID_MSTRID,
>> +	.quirks = QUADSPI_QUIRK_TKT253890 | QUADSPI_QUIRK_SKIP_CLK_DISABLE,
>> +	.little_endian = true,
> 
> did you test your code? miss set sfa_size here.

I confessed earlier I did not, and I'm very sorry about that.
No future version will be sent until it's all tested.

					-Alex
> 
> Frank
> 
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

