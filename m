Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C5A20DD48
	for <imx@lists.linux.dev>; Wed, 12 Nov 2025 09:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762939364; cv=none; b=oDkcegoH8k/1f73Km3wHzzM3SiSD1YzGadLKDp+8y8Gr/GOJVbUqluT3Ge+huLMWw5oMgwQIItrFlLNIrX2Q2Da+2j/qqao14/TjHnLCdSlaMO8U78QkuC4J4aOlZzeVdh6XpralicDbzMOIx4wn9Q3EncGHbF9JICeE8/gVDf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762939364; c=relaxed/simple;
	bh=irP/NYx314ad1KcqSO0MFFrZXRvRXpdw+52ymx49qRs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=l3IHA28KBBB/t2dhb0PZge7LjZuiu6sBDe1WP9sLmSW1Jqb44d+2W8Crqv8JfEdAaNuzQvK49M6O02YZ1x2d9OZ3Zjn8wjqJvl2N4i5ld8rNFvAD9oPawlPaRYOMb7Je3zit6E+Wfbhle/Dk7E4f3wUPGIgLo6Kaibe1rYAPwRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tFR0AV1O; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tFR0AV1O"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b3108f41fso327868f8f.3
        for <imx@lists.linux.dev>; Wed, 12 Nov 2025 01:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762939362; x=1763544162; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xwBqkT0dayuRt6r3Xh02njTiGQp2OWToLaNl9xy/5Ho=;
        b=tFR0AV1Ov8wWNxmdmamj6/U0bg/F9ym7xi2FcAV6A78lXg06baLsTIuUYu6TjviSYL
         qZuArk0ei5X2sxTkj1hUyaDvv8U1sl5CIV6BSlLyw3hfeds0hEmsqT0DGRO/UyyD27ft
         IlRvziV+Y5+c3SjcW4qYqq8/3P1JoHMtZ2Xll+UzNNVr3gwMXM3Pc831K6ytTsBUbu3O
         P0vEi5DM03FWcLzVPj9nP6dDpBZsbPHToiOOyIm+bfc3+BoFVq+lThZsmAynWndu6nH1
         KB2V4tYSbNam4ZKWuSVbeIDBln5FKOXhs4SsH1wVpJal4dIsUnWO3OGcBUwAaDR471jM
         o2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762939362; x=1763544162;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xwBqkT0dayuRt6r3Xh02njTiGQp2OWToLaNl9xy/5Ho=;
        b=fY/0GMvLiVUHq/r06kSDH+2GofcW0wBBa6UG01AH8ZcMyI2R+UVbJPmU53NHkW/zOC
         idLpCuowzt09wiOX71dphhVZLpQLNVD5y55O4h0vgW+4/6B/vDAyBGEBunj6wrQlEtiP
         RMu1NmQwyOHPyZcB7mtWSP7jFid6ey9NS4OpwKaz5diab4hyc9Y6Gq0gbr+BShrzgLIo
         urzlMHhnJguvrZBSpOeBk7cCfXWuoPUpL6AwdXUM56TFLQeAkRL+Hy3yqzBjgrPMV1/W
         k0M7td13WIxUnf6Bs+Jtg5y4FVxF4J26JK4u8hML8I3sXTr4BXpvXzjif0um9qC/S1Uf
         1qBA==
X-Forwarded-Encrypted: i=1; AJvYcCWBxd5TOyS6UUFN3oxp3AQsIZH2zDNra8TlLmdmo8MJ1ESXCEuFJxgcZJAkNc30O5IVJsc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzf8bbAqC9Cpflu5LzE++Nl7S65JO2WBZb9aDxPquXay5JjPLVs
	59ZbRX3NYQaiI3/5Ef6XN89QgdL6X9+kRiEPrPttTVqHOeieKV79pjWCRwlrRLfHKj8=
X-Gm-Gg: ASbGncuCC7brAlj5tnG2B8iEAUCQEPvTx6dJRIbAOgCBvBd+ZiPxcxT22dXwvNtJnGP
	HTKWxmlK0aaw5mU6TJxvLgGktPgxQjXzc9V/3SHsFD3WfEi7XnzsbrMg9Wt6ta8pRIojGdJJ6Sw
	O5XjFFfIelD/6GZ2ntexZREJqVidHA34Tix/hJHhrDB2bwm5RHmhkjhYEDm8ogkPjXPLnGkwpbO
	ELfSDRPYRJfc56TRDVhulAzIuTlvWAX3GHTUKJx/r5c+X1Dw6FfjnCJ9AbmcjSYHwYmjWMnynoj
	NMkwOzupnLWpyGDgRk0yI7Gp9xnSYTTD3N50k7pfX0ZKCIysDQTVfJpcH67VgHrkcJGfIiv0fU/
	Wk3lZ/8qWUaa6ZUTgJZCmh6D9WwfwASs0nDkl8Gti+urEVz5/rrxp/nyIHhqLWRBfLW0AW/mrMk
	suYLcMzQ==
X-Google-Smtp-Source: AGHT+IHVj/yhPNsguLn+9iN6v36uGx0TqDeIQDAvMb7zZQB2BMHPjxqAzj8p/cZVed7p0kysc8mvog==
X-Received: by 2002:a05:6000:4308:b0:42b:4185:e590 with SMTP id ffacd0b85a97d-42b4bdd5872mr1717415f8f.58.1762939361592;
        Wed, 12 Nov 2025 01:22:41 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac679c5dcsm37014843f8f.44.2025.11.12.01.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 01:22:41 -0800 (PST)
Message-ID: <ea9d58d9-30bc-4793-a111-1df428f74e31@linaro.org>
Date: Wed, 12 Nov 2025 11:22:39 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] mtd: spi-nor: micron-st: add comment for
 mt35xu02gcba
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Haibo Chen <haibo.chen@nxp.com>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev
References: <20251112-nor-v3-0-20aaff727c7d@nxp.com>
 <20251112-nor-v3-5-20aaff727c7d@nxp.com>
 <013215bb-3562-484f-868d-485d0da095d8@linaro.org>
Content-Language: en-US
In-Reply-To: <013215bb-3562-484f-868d-485d0da095d8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/12/25 11:21 AM, Tudor Ambarus wrote:
> 
> 
> On 11/12/25 8:48 AM, Haibo Chen wrote:
>> mt35xu02gcba is similar with mt35xu01gbba, but with four
>> dies inside. According to datasheet, it contain SFDP and
>> support 8D-8D-8D mode. Add comments here, remider to change
>> the code in future if has a chance to test on this chip.
> 
> you'll need to rephrase a bit the above> 
>> Link: https://datasheet.octopart.com/MT35XU02GCBA1G12-0AAT-Micron-datasheet-138896808.pdf
>> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
>> ---
>>  drivers/mtd/spi-nor/micron-st.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
>> index 6d081ec176c37249e5ddb724b61bd70f68088163..cc053b4d615ade3f12068618f8355779561dce55 100644
>> --- a/drivers/mtd/spi-nor/micron-st.c
>> +++ b/drivers/mtd/spi-nor/micron-st.c
>> @@ -206,6 +206,12 @@ static const struct flash_info micron_nor_parts[] = {
>>  		.fixup_flags = SPI_NOR_IO_MODE_EN_VOLATILE,
>>  		.fixups = &mt35xu01gbba_fixups,
>>  	}, {
>> +		/*
>> +		 * MT35XU02GCBA contain SFDP, so no need the size
>> +		 * and no_sfdp_flags here, should similar with
> 
> this is expected for all the flashes that have SFDP, so no need to
> specify this again here.
> 
>> +		 * MT35XU01GBBA, but with 4 dies. If someone can
>> +		 * test on this chip, can change accordingly.
>> +		 */
> 
> How about we rephrase this to:
> The MT35XU02GCBA flash device does not support chip erase, according to
> its datasheet. It only supports die erase, which means the current driver

drop "only" as it supports sector erase as well :)

> implementation will likely need to be converted to use die erase.
> Furthermore, similar to the MT35XU01GBBA, the SPI_NOR_IO_MODE_EN_VOLATILE
> flag probably needs to be enabled.
> 
> With something along the above lines you can add:
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
>>  		.id = SNOR_ID(0x2c, 0x5b, 0x1c),
>>  		.name = "mt35xu02g",
>>  		.sector_size = SZ_128K,
>>
> 

