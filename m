Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0F2273D75
	for <imx@lists.linux.dev>; Thu, 13 Nov 2025 15:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763048532; cv=none; b=qo7WnuksetVk1JVqMe8ISPu9lga/YjU5L21iACuAMCAP3WTettuQTnma1zRrV3nrWwNyX5hWmlyMxLfA/aZn39ef7mX2/o6Pv/JvUuCafmCd5wSeilEHKk9IY7/SvpRTyDYgVN4N2oB5xze7fG6YR/UlmJSXmWsSGGNnaFsxyqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763048532; c=relaxed/simple;
	bh=uufp0c+6vRpS7yu0MiSOz3lgC+JY/1RrawKtcoSuby0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TNImqJZoxIMfGcASBGulCIe/huRgDDdjzl6OdbIiWwvg/7QkpgXn3ZffPKYz7WDZBlucQ5JHUNV5bGCL2hCR5cf0/REVWgEXOBwFvQBTbpuY66LfUzni+KkvpOGOIOOd6aZyxmiox8zdRxBCsXShMGrHOBMppr1LAgRfOkUNqyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kLUfHyA4; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kLUfHyA4"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so7377555e9.0
        for <imx@lists.linux.dev>; Thu, 13 Nov 2025 07:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763048528; x=1763653328; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vdckbTlZRYgwauz5tn8aS58Sj8fDyGi1aX7HfTm8ByM=;
        b=kLUfHyA4vNLZIEj7X6JctpOJqJO98AYPpklC26wQCxyXuIG3lErYRLLW14U5Qjhcnw
         EPg7xbt/d283PJToUsKOxI8V+PFUIzlNoW4IubnuGNGysY4tooHFuTliIRFjfPk+V3cY
         fuyt2BX6JviqCLtGwHISguSp6kRr1OuytKxF1f9wI48d3ow64DQotlFxFM+UHyCGDjLG
         jm76AGaMpxcvAOXtmbPggG2bYmGGoJjZh2W/RTXuTB2q/xO/O9n7GBh4WopCQMggMuu0
         E2rn3Dk97dUxe+AmV0TUmTSkXm62CLMQQK5ri3hpIMLLHteXJUC3yCM64QO2CHlxltOe
         M8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763048528; x=1763653328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vdckbTlZRYgwauz5tn8aS58Sj8fDyGi1aX7HfTm8ByM=;
        b=r824ms/d1FgoOMQKWD2MysxnTMUKo3zmFuslQw/G00HLhtjcI8+3KvRupU7/73swgx
         Wi0B6wgdtvEKGYoRBn3tsFCE9vTymOL5gQ4sgXK7XhNnhGZLJFF/NPK1xuzs++sYHtjt
         uPaawq7yCf2D1uHU1TOHZJSO4w4H5vr039DA1eGSBsTq1DrcKkBBrDGmH3SVrvzSCOgn
         ES1LGQQ3TdafZONFifpNmpWywduUUZWvRRmCKx1PfVjhJeSoGB+BPgo9tiCN6/0fqK8e
         UhOdDJ21EhIIzYDgoFb6M2U4Wqq46gZRqZYKDWp46SdI3UW0twitkjZ3wqBWkoY+eAK0
         7H2g==
X-Forwarded-Encrypted: i=1; AJvYcCWRjpXofKa14gK0Psp/L1iAUeZ+SaO2SLbscUwpshZ3mAQnelMVy4cP+BLvbvCSz/56JyM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUK7XirV8lpwzA5MMxyWsiPlNvKqUxyjxdg9KdNlaToU0V6fg2
	+PFvt7dFYuYVsg0jL8c3Y3SHEAbSnp4UXPuBf3t8DOs9gxPbvRtAj6RPaPC/u23avzCm+v0i3nB
	T92Yb
X-Gm-Gg: ASbGnctiGTEJrullPO/wfdns2JNN08ZIF1Lh+PUZ148eAI7GAZJGJ+bDZpEjNdXcmnP
	zCT4TePUO1rwv4NGr/74AZCLyqkdygWLoKPpgDxS7c/RcW1ED7nMI9kby8fL/t+deE/dU+4X/eV
	FEGNTd1JI3Yhz0XgOAaovEbH5nYN1TaCvLvzWJXvAwTgh2MW+3uRRmPfEvx8lZZQCFOdSx1fRCf
	mpmanLL5Ai9MbDX5KlI1R9fAFS3mNPcdJQUBtzSfWPnC4Q8wperUvGwUEHHyNkOB/xbn6QpjT0q
	G3nhdi0bCt0OWjzIMwWKYAHh/HpryTAl2vTnZlj7SfqDLtlH3VEH2yNTY/otR6m/WmmWHWXmV0u
	sizpTOveTicxiVbjlUk2D4WP1LrXmoxsR5PaMq7P1Nz5MkrWel5jYvveZJfay/d0P1RXR7hok6C
	WaeBzhmw==
X-Google-Smtp-Source: AGHT+IFlCo98BPfCIQ5CH901ne1qG93gSkHrk0bVofSu01+xDEnw6EvzRBsaTLdl3pxJ6Hq04gASjQ==
X-Received: by 2002:a05:600c:4585:b0:477:7b16:5f77 with SMTP id 5b1f17b1804b1-4778704406emr72935215e9.3.1763048528417;
        Thu, 13 Nov 2025 07:42:08 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e35b7esm101023995e9.4.2025.11.13.07.42.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 07:42:07 -0800 (PST)
Message-ID: <a7c3db5c-bad5-401a-ac97-d59f81950b92@linaro.org>
Date: Thu, 13 Nov 2025 17:42:06 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] mtd: spi-nor: micron-st: add comment for
 mt35xu02gcba
To: Pratyush Yadav <pratyush@kernel.org>, Haibo Chen <haibo.chen@nxp.com>
Cc: Michael Walle <mwalle@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20251112-nor-v4-0-e4637be82a0a@nxp.com>
 <20251112-nor-v4-5-e4637be82a0a@nxp.com> <mafs08qga9ehe.fsf@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <mafs08qga9ehe.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/13/25 4:47 PM, Pratyush Yadav wrote:

Hi!

> On Wed, Nov 12 2025, Haibo Chen wrote:
> 
>> The MT35XU02GCBA flash device does not support chip erase,
>> according to its datasheet. It supports die erase, which
>> means the current driver implementation will likely need
>> to be converted to use die erase.
>>
>> Furthermore, similar to the MT35XU01GBBA, the
>> SPI_NOR_IO_MODE_EN_VOLATILE flag probably needs to be enabled.
>>
>> Link: https://datasheet.octopart.com/MT35XU02GCBA1G12-0AAT-Micron-datasheet-138896808.pdf
>> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
>> ---
>>  drivers/mtd/spi-nor/micron-st.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
>> index c89c06b1fc61a581fea2e18732be2501a15715f9..f94e9d2d17bf4aa7c36ba3aa37d34f767a9f93ac 100644
>> --- a/drivers/mtd/spi-nor/micron-st.c
>> +++ b/drivers/mtd/spi-nor/micron-st.c
>> @@ -204,6 +204,16 @@ static const struct flash_info micron_nor_parts[] = {
>>  		.fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE,
>>  		.fixups = &mt35xu01gbba_fixups,
>>  	}, {
>> +		/*
>> +		 * The MT35XU02GCBA flash device does not support
>> +		 * chip erase, according to its datasheet.
>> +		 * It supports die erase, which means the current
>> +		 * driver implementation will likely need to be
>> +		 * converted to use die erase.
>> +		 * Furthermore, similar to the MT35XU01GBBA, the
>> +		 * SPI_NOR_IO_MODE_EN_VOLATILE flag probably needs
>> +		 * to be enabled.
>> +		 */
> 
> Maybe I am missing some context from previous patches, but why are we
> adding this comment here instead of fixing the support for this flash?
> What does "the driver will likely need to be converted to use die erase"
> mean? If it doesn't support chip erase, then it _does_ need to be fixed
> by using die erase.
> 
> Also, why does the flash "probably" need SPI_NOR_IO_MODE_EN_VOLATILE?
> Are you guessing based on datasheet and do not have the hardware at
> hand?

Yes, no hardware at hand. He can test with mt35xu01gbba which is a smaller
flash that share the datasheet with this flash, so that's why the TODO
and not a direct change.

> 
> The changelog should also explain _why_ this comment is added here, and
> not just repeat the text.
> 
>>  		.id = SNOR_ID(0x2c, 0x5b, 0x1c),
>>  		.name = "mt35xu02g",
>>  		.sector_size = SZ_128K,
> 

