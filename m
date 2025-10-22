Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D9A2D8376
	for <imx@lists.linux.dev>; Wed, 22 Oct 2025 04:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761107669; cv=none; b=SD1kKJbqO57MQJGmRctxoYhKNdajyTbP4F0KrwfeHOVQTunf5bL0Kp8oHs34BP54X06dpACr6ccxtRBwy6TmRNx8s+jfQMCMgtjqNBvd2LrBYa6PWeo/bw6PBTA8Jqu3MSivrjaColbvX2fZJcTVtoHQB2tSVNs/J5Gv+Gtq4TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761107669; c=relaxed/simple;
	bh=jzTEyl6EsyYKirucDMT2WpjFBD7rzCg5P5uTQ3Im7zU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UfOF+gwfLsSQXEs6lYY0WkSyYvYNYhr1mxbMmHQLDUMyEIHVcEwWwvOf0vrqai8sbXD1sASmvvTpEYBetNdJYbWGnGbrWrsdzgGsOGlfOfgEYgNQ6L67UawcWjCYQEtjCXYj0Jo/2yfu+5pND/+VuS43iRbSUB9PJcG2Oy7+UEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=QIxniNtO; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="QIxniNtO"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-273a0aeed57so6855635ad.1
        for <imx@lists.linux.dev>; Tue, 21 Oct 2025 21:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761107667; x=1761712467; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r07oRrpAm0dALdqxQgRoSXIP8i4Uf1rUZOTVIHgHy6w=;
        b=QIxniNtOkA9wgHNsHFHaNL13ZuqzAW2bM3KD+kKoMUUR5KtqU4kGGpHsy2ACJGSDBS
         zdu5MoHD/5k9hLPpjsuYjfI6uPI6E6q2eo5aD6qLpWyTIn3Qm8d9i2z9mK7hCv7UOqfV
         DyQe3GbqDscug+77wVgVWTBLkp+ECW63ngf7/Xu1CAYz/nY6twaAqNk6EfhAJ++NtxOS
         Wv+Kjq1k0OM4gctT4s32bSu5+fOaLKG/ci3g/BBGDM0ZRZf8ImPzCyPrHDGKi2i469Vz
         gst9YUxOCzsyWRRN6IIFKsOcmwOsB1WlBEozjkXVx5SnKwU4b2PJJjN9QilRhzNYAJZ9
         vHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761107667; x=1761712467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r07oRrpAm0dALdqxQgRoSXIP8i4Uf1rUZOTVIHgHy6w=;
        b=p5XOkPVzXBSmttHqCTUzCcVRQyeAMoe/Qou7F50g4yfhwfiRIJeM2IoCg5bu66LjHy
         MSE7Euck13rQJEECycp+HEnNUN/DNjg4sRD26v28T2tnBSNOH2OhSM5yluZ39Wo9FGzL
         m3237oZhnL+bVt4tbNQ1S2VjQP6mjQibdQ1X5oQ7uUJJdHPGCERnzCWmRTglq8kNYSkm
         /Pn4u2PYVAje6mQSlBSd6ZtpkuixzbdS7id78SvUAGqpW/2wmdf5zpuVB0+bPzNtbhE9
         dW45OvGMrCwFJhOJPXsUXFVRDFV7ZTLlB0jM8yUWXViW89OuLE+AfcydWkwI6EDUvZY5
         Zcuw==
X-Forwarded-Encrypted: i=1; AJvYcCVAgcKQ4u8/BUkWFxuwO00WnMZb7VQF40eVrgaU+ToPy63PKLndBvjcYKBetgCTAS9y8Mg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzcQQ8dPSMxgzmSBgI4KsitxpvUtotyLHvaJRG7IN41ay/dalng
	iLgmyLmlWNU9SENB/0lLM/DrhUBUs6xW5K+jL0GyiKeX/8Yj+TYSNV7U3O2U6fuWY1/yIrOMtVd
	6IkmK
X-Gm-Gg: ASbGncufsgHpc9yhweIqOAEdokbdQbh34cLkILhWYJ3UfYq1Dabsqox+qFZnG2bQK6P
	a13QhrooJbB9XGUyPoRbkDKTai4C3M23e571n/w12TVJqDRmNkcgJTNZsZ+6fYCuMq67tJsHLZi
	upbP0vRrsNEHK8uJCeJL7eYXVHclz3uck1b9FnaT2Hyd7DWEeeFMoB0OXy1TYy+wgAHkqlCMhpI
	YXWJkTcuqDLqJtnWKORqkFYJLkKXWu39YA4oszyU4q3V1vXblva1BFU4wJCBzHGGGSlN7DmkEWA
	nFXXY0K+ELE6lvROsVznB+ORERgBorqD3rZ19/66ov9dA3ToIug4gS70hWTBPjTN8Bjmy/5c6Pt
	hJsCKDQbD3SeBe8djh3rQJy+wKLKbXLqfJzQYyWliKGnMiyRTjsIEr0VcZ/s25+21BRpITGG23O
	3yB2SxwUb5m1DK
X-Google-Smtp-Source: AGHT+IEXbwpYqOJzdRZX+yeVCW+HRgEFHEhSfhpnfqLc9E63Y9hId0Tl9GklX8WzGZZ/QxYr9McgUg==
X-Received: by 2002:a17:903:17cb:b0:292:9ac7:2608 with SMTP id d9443c01a7336-2935e02e491mr1133385ad.8.1761107667134;
        Tue, 21 Oct 2025 21:34:27 -0700 (PDT)
Received: from [10.211.55.5] ([4.28.11.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fe4cdsm126257025ad.97.2025.10.21.21.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 21:34:26 -0700 (PDT)
Message-ID: <06af60b7-7ef7-451c-babd-e612a356013c@riscstar.com>
Date: Tue, 21 Oct 2025 23:34:26 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] spi: fsl-qspi: allot 1KB per chip
To: Frank Li <Frank.li@nxp.com>
Cc: han.xu@nxp.com, broonie@kernel.org, dlan@gentoo.org,
 guodong@riscstar.com, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251020165152.666221-1-elder@riscstar.com>
 <20251020165152.666221-6-elder@riscstar.com>
 <aPaLibm+oVKSDbL9@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aPaLibm+oVKSDbL9@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/25 2:20 PM, Frank Li wrote:
> On Mon, Oct 20, 2025 at 11:51:48AM -0500, Alex Elder wrote:
>> In fsl_qspi_default_setup(), four registers define the size
>> of blocks of data to written to each of four chips that
>> comprise SPI NOR flash storage.  They are currently defined
>> to be the same as the AHB buffer size (which is always 1KB).
>>
>> The SpacemiT QSPI has an AHB buffer size of 512 bytes, but
>> requires these four sizes to be multiples of 1024 bytes.
> 
> I think it'd better to add field at fsl_qspi_devtype_data, like
> sfa_size.

OK.

> sz = q->devtype_data->sfa_size ? q->devtype_data->sfa_size : q->devtype_data->ahb_buf_size.

Why not just set sfa_size always then?

Anyway my biggest concern on this was what to call it.  What
does "sfa" stand for?

I'll do it the way you suggest for v2.

Thanks.

					-Alex


> 
> qspi_writel(q, addr_offset + 1 * sz, base + QUADSPI_SFA1AD);
> ...
> 
> Frank
>>
>> Rather than add a new quirk to support this scenario, just
>> define the four sizes to be 1KB rather than being dependent
>> on the AHB buffer size.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   drivers/spi/spi-fsl-qspi.c | 17 +++++++----------
>>   1 file changed, 7 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
>> index 703a7df394c00..9ecb756b33dba 100644
>> --- a/drivers/spi/spi-fsl-qspi.c
>> +++ b/drivers/spi/spi-fsl-qspi.c
>> @@ -795,17 +795,14 @@ static int fsl_qspi_default_setup(struct fsl_qspi *q)
>>   	 * In HW there can be a maximum of four chips on two buses with
>>   	 * two chip selects on each bus. We use four chip selects in SW
>>   	 * to differentiate between the four chips.
>> -	 * We use ahb_buf_size for each chip and set SFA1AD, SFA2AD, SFB1AD,
>> -	 * SFB2AD accordingly.
>> +	 *
>> +	 * We use 1K for each chip and set SFA1AD, SFA2AD, SFB1AD, SFB2AD
>> +	 * accordingly.
>>   	 */
>> -	qspi_writel(q, q->devtype_data->ahb_buf_size + addr_offset,
>> -		    base + QUADSPI_SFA1AD);
>> -	qspi_writel(q, q->devtype_data->ahb_buf_size * 2 + addr_offset,
>> -		    base + QUADSPI_SFA2AD);
>> -	qspi_writel(q, q->devtype_data->ahb_buf_size * 3 + addr_offset,
>> -		    base + QUADSPI_SFB1AD);
>> -	qspi_writel(q, q->devtype_data->ahb_buf_size * 4 + addr_offset,
>> -		    base + QUADSPI_SFB2AD);
>> +	qspi_writel(q, addr_offset + 1 * SZ_1K, base + QUADSPI_SFA1AD);
>> +	qspi_writel(q, addr_offset + 2 * SZ_1K, base + QUADSPI_SFA2AD);
>> +	qspi_writel(q, addr_offset + 3 * SZ_1K, base + QUADSPI_SFB1AD);
>> +	qspi_writel(q, addr_offset + 4 * SZ_1K, base + QUADSPI_SFB2AD);
>>
>>   	q->selected = -1;
>>
>> --
>> 2.48.1
>>

