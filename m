Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B377F2BCF5
	for <imx@lists.linux.dev>; Fri, 24 Oct 2025 00:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761264251; cv=none; b=AqJj6BQNY92HFwQCjz6JINgHxCdwWDb8QDsog3C9qnseodWexkjf42LbZI2Ta+tW7wmQfxzNU7gBN4w/kZok3wG+US220mejFdyHqolg17A+zO56lKYHGIvPgRloT7xGFjJ5Z6XrxNdzyOr+rIalRymgTj7kXA7mZbDx9P/JMWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761264251; c=relaxed/simple;
	bh=PQewqef8yzvtBnGMpEYxHFkLVWv3yesJZz1LSiXZ7bA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IBAnMOBMRekZd2wH17sIhKr4p83yGGkbcxYeNxx112arr65RBMkPgUryb5cCTBn1Iw6z4aXBR24m+95dwVrRq14glKxOxelDGvkhnzxDpMoxVN86jbtIKfby3VeRWacYBIG131wMjZ+ilMQ0KGAuAbRLcg8E77uWFYgSvJinysE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=V3C2bRVZ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="V3C2bRVZ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29470bc80ceso14989365ad.1
        for <imx@lists.linux.dev>; Thu, 23 Oct 2025 17:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761264248; x=1761869048; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iB+cZBHLCpSws7+7BlwrY++97OnOWh6DYfkP9FhnwvQ=;
        b=V3C2bRVZW/b1fdvRenLcCiotzDjMMJe87pQQOMGsY1Z0qIV5TLy8AhWmLefPadlLYB
         Y0Jq3+ouYPWUuzGI27Ev5VfzfJB8rPpa4FjlnClZ7AIdBqv70fsQAR5CrdRKMvJqpz2a
         5kZi3NobHFNRrXmgPCgw37r4p56Nzq7oecOQxPoZOoBN0iIbHeq46VPWsIaQblK3Y7XN
         MZsxj8lfz4TixBNorgQWVFCW6edw9q5VKaidGoSvdoKZCJhE1NNdbR/aTPQfrJnI+hJ5
         y8iaxucoMOUbKfdIwBFEbpmD36/sU3+v5vBf33eoYVIUe00+mo2Lwk/4bJ4gT28Pk6Q1
         MvzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761264248; x=1761869048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iB+cZBHLCpSws7+7BlwrY++97OnOWh6DYfkP9FhnwvQ=;
        b=jtTZu0vuk5lE5z3kqXugcUYtPQXFw+cuBk/mRTTY9A3/Z5pKZvOOO3oRK7aUSTcykY
         9vKj5ALC17zwokHKCVVrVq9yRkGQnBC3FtbHwNu+vUCZj3lGONYByUioKx7RBopo10jv
         DNnpeKrx9ps40ewc2UeD7iwpP0/mBsyHNUIf/yDZrKlIyVeG+xkBbeZ4KndRkG3+jtV+
         S1xn88B++Bvf7qO0iBFN+UPgs8HjEDiwSRMXIMCgmDQD0r8s5Zodcbe3ejED2Sr2O3VI
         3QyzTLkO6N02y/7jeYwV4RlkBytpOmuIbstSwk23Lj/cz6HeLPB9P1yxzmpWNlcI8KTM
         9rig==
X-Forwarded-Encrypted: i=1; AJvYcCUyootQKghVA9Eca96qZzrZc1u/QeQkCWzUk2vULo3GC/v8j/k6w1ngh1NPXFHh10PcCYs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwTpmXJv5iKRgLMHijrKE3clqPqX1Ay3SUqXIxpgneu5Dgzve4L
	YK/T5Iv97mXE5YehUTD/84B1y2rhDXi/J+8JI6oLJztFnI8FJhBDuNmZqgVQUEZ6w0Q=
X-Gm-Gg: ASbGncvsvLlZPLlRGTrrCALjNxZIB65SKnEd+VhnBAualY55yfy7zSLCZ3CrMnI4LKO
	DTQ3kznpYFyjRxnGWwz3oTHCHC1cIw79ElwfUmYEzKwC58RKzKJrpP7jSyLXELQMBO7OyyRde8i
	1c4i2ta3v6GTFE6kubrAe+aig5sDSFeZP5ZdKD8Hz8n9E6z1zqp4zl4eKLDgdtCEutVyVRmW9ay
	3j0zFvn0nAjmZQ1WGk9qlnswN11setrWII96Oi+tNx4nymtoBZ4G3ZWsZ/1TPpwmU19dXO/Zb6L
	yXF8rtwpz6/2TCk0YI3SeB+6meQ5A8WCv8z72tpTdbfJpwDVX0yL3UPunBSc39pPd1JxKU478xn
	lpzBnVf1jbcxviOAnRbxMuJZam3p5PV8NAxyMrHfY99qIqyTCSZ3jWxYLKyUsjd8PXOPJ38KHSn
	+Pnc4TgKGJgATfHLVg
X-Google-Smtp-Source: AGHT+IG1GOEsittfwiwfypAgRO1bXivhphlMMbLL2fhQ3i2Er7Mu9kpHhxTrXPCZNYaEGYBC76LFsA==
X-Received: by 2002:a17:902:ef4e:b0:290:d8f0:60be with SMTP id d9443c01a7336-29489e70291mr8426785ad.30.1761264248064;
        Thu, 23 Oct 2025 17:04:08 -0700 (PDT)
Received: from [10.211.55.5] ([208.115.86.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33faff373easm3702460a91.5.2025.10.23.17.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 17:04:07 -0700 (PDT)
Message-ID: <aea95912-9f06-4a3c-897b-d985c18e89e8@riscstar.com>
Date: Thu, 23 Oct 2025 19:04:06 -0500
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] spi: fsl-qspi: switch predicates to bool
To: Frank Li <Frank.li@nxp.com>
Cc: han.xu@nxp.com, broonie@kernel.org, dlan@gentoo.org,
 guodong@riscstar.com, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251023175922.528868-1-elder@riscstar.com>
 <20251023175922.528868-5-elder@riscstar.com>
 <aPq7ZnKrxbokwHxP@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aPq7ZnKrxbokwHxP@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/25 6:33 PM, Frank Li wrote:
> On Thu, Oct 23, 2025 at 12:59:16PM -0500, Alex Elder wrote:
>> Change all the needs_*() functions so they are no longer inline, and return
>> bool rather than int.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v2: - New patch: predicates now return bool type and drop inline
>>
>>    patch (patch 4).
>>   drivers/spi/spi-fsl-qspi.c | 22 +++++++++++-----------
>>   1 file changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
>> index 1e27647dd2a09..1944e63169d36 100644
>> --- a/drivers/spi/spi-fsl-qspi.c
>> +++ b/drivers/spi/spi-fsl-qspi.c
>> @@ -276,34 +276,34 @@ struct fsl_qspi {
>>   	u32 memmap_phy;
>>   };
>>
>> -static inline int needs_swap_endian(struct fsl_qspi *q)
>> +static bool needs_swap_endian(struct fsl_qspi *q)
> 
> why drop inline, and next patch needs_disable_clk() have inline.

That was a mistake.  I intend to drop inline on all of them.
Will fix.

					-Alex

> 
> Frank
>>   {
>> -	return q->devtype_data->quirks & QUADSPI_QUIRK_SWAP_ENDIAN;
>> +	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_SWAP_ENDIAN);
>>   }
>>
>> -static inline int needs_4x_clock(struct fsl_qspi *q)
>> +static bool needs_4x_clock(struct fsl_qspi *q)
>>   {
>> -	return q->devtype_data->quirks & QUADSPI_QUIRK_4X_INT_CLK;
>> +	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_4X_INT_CLK);
>>   }
>>
>> -static inline int needs_fill_txfifo(struct fsl_qspi *q)
>> +static bool needs_fill_txfifo(struct fsl_qspi *q)
>>   {
>> -	return q->devtype_data->quirks & QUADSPI_QUIRK_TKT253890;
>> +	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_TKT253890);
>>   }
>>
>> -static inline int needs_wakeup_wait_mode(struct fsl_qspi *q)
>> +static bool needs_wakeup_wait_mode(struct fsl_qspi *q)
>>   {
>> -	return q->devtype_data->quirks & QUADSPI_QUIRK_TKT245618;
>> +	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_TKT245618);
>>   }
>>
>> -static inline int needs_amba_base_offset(struct fsl_qspi *q)
>> +static bool needs_amba_base_offset(struct fsl_qspi *q)
>>   {
>>   	return !(q->devtype_data->quirks & QUADSPI_QUIRK_BASE_INTERNAL);
>>   }
>>
>> -static inline int needs_tdh_setting(struct fsl_qspi *q)
>> +static bool needs_tdh_setting(struct fsl_qspi *q)
>>   {
>> -	return q->devtype_data->quirks & QUADSPI_QUIRK_USE_TDH_SETTING;
>> +	return !!(q->devtype_data->quirks & QUADSPI_QUIRK_USE_TDH_SETTING);
>>   }
>>
>>   /*
>> --
>> 2.43.0
>>

