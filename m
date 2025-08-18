Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9C8340DA4
	for <imx@lists.linux.dev>; Mon, 18 Aug 2025 13:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755523292; cv=none; b=U0en8RZwZUgOi5Svb89/kn76pZ7pW+hjK40DwoSxALM2l0GPW6SOjKK6VP5IC2aVG8PPzascm7fgHZqkTQ4uvFuBQ9NsVIxUXmTpvYPLWU33eq5J0CjMxE0gn6Zo8tOGaHz9kCmgutJ1G/x9MSjuEXixt2Mn8lr+YDbKSrGl2Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755523292; c=relaxed/simple;
	bh=+cKh+v4Cm+T1peei9b5ebp+8tJt6yVUSf7x8iARtLHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D0Oi96oNDREeMddlZ76N5jcr8BJsCrO+V6QbwKltdR1kewDcRdG7lmhC366YJAyFmCQ36iut0B1Shacf8UH9M0qhCgkbxOgg+SCo+Jz2JpDl8NQ+imf7ZGrszUW71ZheZqOjRL+/agZAkhlgKjKnPijXDG07hbFSJ0TBgC0k4Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N2wyLuO4; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N2wyLuO4"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1b0bde14so21325525e9.2
        for <imx@lists.linux.dev>; Mon, 18 Aug 2025 06:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755523289; x=1756128089; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qHosbQ56I8nDu/Jz/4UBzucrPmhDO2H2KjGIBtWOyX8=;
        b=N2wyLuO4FdqQoS0r4g358u7XWNXooBMQiaMs9DQxnPRiVeg2rsleQ+5UhyfQGTC1TH
         8DBnDQKSDqpodtQ61z7I3R+FF/AWYaMEOB5HX2lTMx4ToLmgXRSZ+c8r5pJTI8xyT45d
         DVQ9GsAf5EKftVWenrz4GWTheUg/wQ3q3x7c1GPajpMvvfSAkOczTqxw+o4u8rimV3PK
         Z+53/ySAkVnzW0QsMTY5tYXY+GZ+T7k/jzR8F1pB9NlcB64LQ8EwSkCKAXNcdN2cy52v
         NdysZ52jLEme+S/yIL6hrjYABY7xktZX+NfporRsSrGYBS6Z4i65PJsKg9/vCORTBfcm
         OXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755523289; x=1756128089;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qHosbQ56I8nDu/Jz/4UBzucrPmhDO2H2KjGIBtWOyX8=;
        b=mupaJs4FFONo6ZLzrzLYFMus0YTzy/aBCPs/BP7sexULl1Y+6sKBGknVftKI6scorh
         nCrkH3wK0FxhYeQY/9MrkEGIS9/NsZ6CXBoPY7gvEfOqMmZGtXhYflvgrilqn9ksmChB
         RyIHCrfzCYZQQXDsPRBCWWmC3SvhnwWi3O+wpTceioZbIEyLKf3O07HeUpMvz1m3HZAy
         Sr2Q+Dc0scP3nUWeGKgXRY1p+Wlx6446fMF+hviWQJrYu/6CWTeKZKBkkY+I8yvgnM2g
         +YF1wNQ2MYKF6vtvYL0nRyMvWok1iFRuWBX9LvKjUSVPXGYjDOCAE+tnzbPWtbdeCBL5
         Qmnw==
X-Forwarded-Encrypted: i=1; AJvYcCXc/AzIvioyBWQcvtiBHz26pc0xOvKr9ITc4xvTnUQsJYm7lhlwVtBHNVUy1KkrMEQwI78=@lists.linux.dev
X-Gm-Message-State: AOJu0YzOhPBj05jfmna3gNRMxQqoNh/K73wPDV6ymOBpeqqsHVIAtmS8
	7DtNu/W1T80dYVgIpnpk+kqz5qDO9CV/J7vCjcecn/ZSmFw3jNth6PZSczVeXBVw9U8=
X-Gm-Gg: ASbGnctrw7gfFlzcVuEKxWDI1aupYoPWvRTPJqSssKk+PzTmLUEX23rYO4l93i76GX/
	6T8zFDfqET3fjVzDau9bkQTkO8yOgJEtB6u2bemKU8zAnwPlbhONKf2b3ns9LiZsQL2wy+ilq3e
	CxD9E7gZYzVD2glLTEoU6wM10daqddyHmk8Q4Er3Hk8YBzeS1bikARWjqrviq/J2Uuby3x8zlvL
	eUs2AVvVqM0d2/fkfsj+XgArjfNUO16S60Z+keoKNU+TF4/wq5jP7DTl+jRhiaf6v9F6GQnOPPE
	0Ajs4zkZcdGjLExk2yqZTk75In/sOnQzEAXvojqc3FuXs5MEP/lngQYBrImbU2sGcVxHs+M5NMB
	3RmOpbD1Ib5ZcS8CE+aSAD6jQxHM=
X-Google-Smtp-Source: AGHT+IHmQYSiITA4A2f3X+nYYnR5TguRUDLdC1f6m0CIICjfTIGcLFHLP+kZ1Fsg3j7tteqznpBIhw==
X-Received: by 2002:a05:600c:a43:b0:459:db69:56bd with SMTP id 5b1f17b1804b1-45a21839e02mr89031265e9.20.1755523288609;
        Mon, 18 Aug 2025 06:21:28 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1b1db885sm108362605e9.0.2025.08.18.06.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 06:21:28 -0700 (PDT)
Message-ID: <40b29323-66db-492c-be00-71ff87f48d77@linaro.org>
Date: Mon, 18 Aug 2025 14:21:26 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] spi: spi-fsl-lpspi: Clear status register after
 disabling the module
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
 <20250814-james-nxp-lpspi-v1-4-9586d7815d14@linaro.org>
 <aJ4VpLhI+hZU+cpj@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aJ4VpLhI+hZU+cpj@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/08/2025 5:58 pm, Frank Li wrote:
> On Thu, Aug 14, 2025 at 05:06:44PM +0100, James Clark wrote:
>> From: Larisa Grigore <larisa.grigore@nxp.com>
>>
>> Clear the error flags after disabling the module to avoid the case when
>> a flag is set between when the flags were just cleared, and when the
>> module is disabled.
> 
> between flags clear and module disable
> 
> And use SR_CLEAR_MASK to replace hardcoded value for improved readability
> 

Ack

> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
>>
>> Although fsl_lpspi_reset() was only introduced in commit a15dc3d657fa
>> ("spi: lpspi: Fix CLK pin becomes low before one transfer"), the
>> original driver only reset SR in the interrupt handler, making it
>> vulnerable to the same issue. Therefore the fixes commit is set at the
>> introduction of the driver.
>>
>> Fixes: 5314987de5e5 ("spi: imx: add lpspi bus driver")
>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/spi/spi-fsl-lpspi.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
>> index aab92ee7eb94..79b170426bee 100644
>> --- a/drivers/spi/spi-fsl-lpspi.c
>> +++ b/drivers/spi/spi-fsl-lpspi.c
>> @@ -82,6 +82,8 @@
>>   #define TCR_RXMSK	BIT(19)
>>   #define TCR_TXMSK	BIT(18)
>>
>> +#define SR_CLEAR_MASK	GENMASK(13, 8)
>> +
>>   struct fsl_lpspi_devtype_data {
>>   	u8 prescale_max;
>>   };
>> @@ -536,14 +538,13 @@ static int fsl_lpspi_reset(struct fsl_lpspi_data *fsl_lpspi)
>>   		fsl_lpspi_intctrl(fsl_lpspi, 0);
>>   	}
>>
>> -	/* W1C for all flags in SR */
>> -	temp = 0x3F << 8;
>> -	writel(temp, fsl_lpspi->base + IMX7ULP_SR);
>> -
>>   	/* Clear FIFO and disable module */
>>   	temp = CR_RRF | CR_RTF;
>>   	writel(temp, fsl_lpspi->base + IMX7ULP_CR);
>>
>> +	/* W1C for all flags in SR */
>> +	writel(SR_CLEAR_MASK, fsl_lpspi->base + IMX7ULP_SR);
>> +
>>   	return 0;
>>   }
>>
>>
>> --
>> 2.34.1
>>

