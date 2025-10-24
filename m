Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7059F136658
	for <imx@lists.linux.dev>; Fri, 24 Oct 2025 00:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761264254; cv=none; b=KKB/GiejvrBXDF9Wk1V6AtgepkjlyJlEaWPgogxlnfeat2zo8SJp0SbdxMcS9pgM0uSNoWv0AEwRvctIRNgWtq/+Hi68fm4jv12r242fLTv5n0HSVAzZnvZwR5im4odPe1TgoANUumkF7EAdl6LmK2Z9P6NDkeX5EL+fSRAU76o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761264254; c=relaxed/simple;
	bh=oBXWaTXlxJXobBTW+QXHPr5R6s0tFE5GXaxWYWcUIRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ab1v4mk7lNrhwC+woEc7CVu9aGw7YwnN0L312a9Qs4maC+4eeDu+Heke7L9sKcs1s3gT0/UMTIalr0xygEWEqiPq3bR0vjF1YY26pIK4lPSPc1H3ve8TCvC5jV35A8bgBjy2rhGynAxcpFSPpO2t7poy771qxSALlokPlZPjZG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=sPblAfLz; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="sPblAfLz"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-33ba2f134f1so1437570a91.2
        for <imx@lists.linux.dev>; Thu, 23 Oct 2025 17:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761264251; x=1761869051; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kG8oovmqRaNzTSGBD2RsxBVDQfNgYBWR0ofPiKC/9wo=;
        b=sPblAfLzz+oU5K7g9NDzvTZ73Mm0sExoZxKk2a2LSKtwbj6nCIBF9lMo4UQrxKYF4B
         HsT6i282pcKjnTu/PFf/dlYb76w0sTpDC2NrsBdlkdOMYYZNVmFM1HlwCJPbvYExuI3T
         UT23jZ3PKIRcRbtru1eK397nncPktAfEhe025FP0ObUBkBwX/q5E8J7MDNa3uuEO9+Hk
         sFQ0ng7icUzGmuE9HeT4zFx77LQ+gHD0ykq0CeuESipgxzT/E0o8bAp1tHtgFg4HTfrp
         i6hDv/rTMC0ZNGz1y4gklTIi3hZdUQf2bk2d4jAmTlUQxIDnsnl7loXZIk7Sep0/SHb1
         +EQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761264251; x=1761869051;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kG8oovmqRaNzTSGBD2RsxBVDQfNgYBWR0ofPiKC/9wo=;
        b=m8aETkbF1CGB5wiCuj6BvVPCJroV2zLZuhAM5i+8dkNcAW4nsTVIguBHQmawzBLNtN
         x8Gby8GXTOUHsDbkZ0OMJ9duqAnSKFz7i2CDwbleOKZYtrnLgc0MHKa9iGo22EzC+tSc
         jHZ89qdFLjuR+fU8iG5D/wfjybXrkIRn0zrI6tx6385VfWYQk9Kda8/KBRmqMZqCDcCa
         3owRtDqoCuGF2N39MOWUrVUBKrAt9pr6OM859Pehx6mOIO7K2AVAGQnalbd/DQ9FKhFa
         p6k+sNFnsP8W15WfEFdmSEQ6HMn2oZmBVHPlRjMu3b5ZlbtYKUV5iKB8tdqoNjmotox0
         8pKA==
X-Forwarded-Encrypted: i=1; AJvYcCXmbzAYWmV/AYC5P5ETgZPjR6XuOv2TbHEADWlMTCqdUSPOw4oie/Rk14/7tLZtnf/GSBI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0xg8svprJWCSEF8BKYkpo97V3D8dozxpTU7HVy6HhGLLa6J9i
	yhXo/hdXec6KvSCZfvgFRVazk7A3lwNggX/jUx7G8pGVdZfZx6uKFFuLcUQLFirmjF8=
X-Gm-Gg: ASbGncvXiJCSdiR5RlMgV3fvmmZBTR+CyagchsAWXGJLV6N8BsSEEDcO08RZRNOOs1p
	61R1L8BWilDZTWCTH1hpNbLHwY8waFpTL7eHnwe0eC0IZ6sIzZocN4YH9r8FUUQQKlA8ZzLTkEL
	VokRy6cKdBVkiatZtXSqg5A9s1XoB0jKFvIelXFYzQjjQy8NdOQNJ1mlmd0rc9mIAgF8aAjri8D
	N6MVfi8TjrYQOpdEfbt8sFzTLGmJxSnXCum8hVDh/Ou4T04NHcpkG+Od1rdIAEL5ZkLuNzPjUxw
	cLjFGm5sv5d77qFzpiO0H2+or2rPgPP22jXD3aZBttnL0X4jLnnXo8SSZp48iC5r0rGZGpOqiye
	GENppz5qltakEKCunhAxWC+syUSadX70EJq3zLOtZjxSv6DsuiOoi3pPZWjPS2wabYICGqXU61p
	2BH+Y9BnUIwETiK0nfTHoUj9Xb1RdRPTtHyAPjnQ==
X-Google-Smtp-Source: AGHT+IHSGU24WurHFEd08HU+CrxqEKTFB2CNJlwi6t/j28NxxvFCPIXZXTfDae9QkSIwWA6BVf5SSA==
X-Received: by 2002:a17:90b:48c6:b0:32e:59ef:f403 with SMTP id 98e67ed59e1d1-33bcf8e95c3mr35479556a91.17.1761264251417;
        Thu, 23 Oct 2025 17:04:11 -0700 (PDT)
Received: from [10.211.55.5] ([208.115.86.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33faff373easm3702460a91.5.2025.10.23.17.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 17:04:11 -0700 (PDT)
Message-ID: <a43b6ddf-c552-4db8-89cc-49951015161d@riscstar.com>
Date: Thu, 23 Oct 2025 19:04:10 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] spi: fsl-qspi: add a clock disable quirk
To: Frank Li <Frank.li@nxp.com>
Cc: han.xu@nxp.com, broonie@kernel.org, dlan@gentoo.org,
 guodong@riscstar.com, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251023175922.528868-1-elder@riscstar.com>
 <20251023175922.528868-6-elder@riscstar.com>
 <aPq75FBuYvFQrbQE@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aPq75FBuYvFQrbQE@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/25 6:36 PM, Frank Li wrote:
> On Thu, Oct 23, 2025 at 12:59:17PM -0500, Alex Elder wrote:
>> The SpacemiT K1 SoC QSPI implementation needs to avoid shutting off the
>> clock when changing its rate.  Add a new quirk to indicate that disabling
>> and enabling the clock should be skipped when changing its rate for
>> operations.
> 
> remove "for operations."

OK.

>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v2: - The quirk flag is now named QUADSPI_QUIRK_SKIP_CLK_DISABLE
>>      - The predicate now returns bool and is not inline
>>
>>   drivers/spi/spi-fsl-qspi.c | 21 +++++++++++++++++----
>>   1 file changed, 17 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
>> index 1944e63169d36..c21e3804cb032 100644
>> --- a/drivers/spi/spi-fsl-qspi.c
>> +++ b/drivers/spi/spi-fsl-qspi.c
>> @@ -197,6 +197,11 @@
>>    */
>>   #define QUADSPI_QUIRK_USE_TDH_SETTING	BIT(5)
>>
>> +/*
>> + * Do not disable the "qspi" clock when changing its rate.
>> + */
>> +#define QUADSPI_QUIRK_SKIP_CLK_DISABLE	BIT(6)
>> +
>>   struct fsl_qspi_devtype_data {
>>   	unsigned int rxfifo;
>>   	unsigned int txfifo;
>> @@ -306,6 +311,11 @@ static bool needs_tdh_setting(struct fsl_qspi *q)
>>   	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_USE_TDH_SETTING);
>>   }
>>
>> +static inline bool needs_clk_disable(struct fsl_qspi *q)
> 
> needs_skip_clk_disable()

OK.  I was trying to avoid the double-negative:

     if (!needs_skip_clk_disasble())
	clk_disable...()

But I'll do as you suggest.

Thanks.

					-Alex
> 
> Frank
>> +{
>> +	return !(q->devtype_data->quirks & QUADSPI_QUIRK_SKIP_CLK_DISABLE);
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
>> 2.43.0
>>

