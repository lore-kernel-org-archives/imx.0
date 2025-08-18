Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5B7322549
	for <imx@lists.linux.dev>; Mon, 18 Aug 2025 13:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755523082; cv=none; b=jZTucpqgPByHxJ1ebtFRKVl7AGoGx0wY9sPCRgihlARzOQ8nYSLpB/4V3IXiPSU4bahfKGMEO4zuXedMfqPVStNkuYhASiThUe4990zg3im4k4a+g93aDLoyf9Vn7ZPedKxt5grQdRSIRnJmvlsScuugjoy5vTpGW2q+3PufXaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755523082; c=relaxed/simple;
	bh=cN2Dr1U3N+epcvzyenIo+98wH45Absd+P6IxmKwk8T0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p+ogGuzCVMF4XhrwROlXr1Y9dby3Tld4HlOryYynZ6eRCPQOBeM2kZ4MGu0a4WZ/QnizpieBjVWnPnVh8Ks5Pi61hGF62S7ZfI2EpELxtvdVA7J1YBZfVMPnspnGBD7ITaGPkQxpGIFLXpo2pofGXXLhObMPupoU5J2FMe8o9Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s6w2Z/IZ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s6w2Z/IZ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b9d41cd38dso3313995f8f.0
        for <imx@lists.linux.dev>; Mon, 18 Aug 2025 06:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755523078; x=1756127878; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WD8JY7wGfENB2vQCzVFhM+JL0GSgqtbytlovzqiUGn8=;
        b=s6w2Z/IZN3ZxCiA0WHPj0h9+AA4oCRsWQv5cMU5YCLTHFclx1807HUaxSPwg84kwIX
         S3+30s4lcDSubyQRlPyVyhmlAXtRsbNNIkSRszZ+hRs6rHue9+90/pauLzk2RFfViUwy
         T9SeTpR7QhMLeV/Tk13ui+stADASQHYK0umgGZ/HP5PSNcU0zE8MucpFIY5rQIdjW1MS
         kDG2xz8bctRzSVJq8YOumcg1g5cVQbXNEfiLflUKKazCQCMMtiJcTwoqM+CViApwXIxL
         c98tcxorJboXRotzHQ/luao90G7amu5h2QlJEKe2oVbpo0L19cXen8KPyngP0iPbjsw6
         fxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755523078; x=1756127878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WD8JY7wGfENB2vQCzVFhM+JL0GSgqtbytlovzqiUGn8=;
        b=FuknKjefdBGEODG6paCzufsU0bG0SIWe67gVcjawLfR61BAmi2G+KEHEFfVDqW00Iw
         SjgatW2wpDXHqIlQnj1PWXxUH4BmcZB9gvwyKFL/UdrC8ZG72hUQLTvSDKaZQ5B5SuAC
         MdhE3rI3Xzrq/hRxpIZO/ysgLCY1lVSt1cbZH6GWC3C723R5Jae/7e/tlFB4dBnLYpth
         dTee2iTsr0siqms65P84x0eLIzjV9y5lQfB1FhpeVjgFDwHfGsuMJzYtk30dIXkrRfP1
         EEfDBJ5jbvFZ52jG23BbXSEBFoXTgvLu+XZmaED5now+2h0lAIwN2mBMbuqS3q2r0KuN
         J48A==
X-Forwarded-Encrypted: i=1; AJvYcCXD/wrYD4gy69AD/xPx/nV/9rT45dLWgI5W7blNQxH+5ivr2vUTt8lz+u4/dmdOP5cCOGs=@lists.linux.dev
X-Gm-Message-State: AOJu0YwS6svyCxxuH5KjL6/zE5v2UKMoGATAtKS8c4pCV0eYfbUX87LQ
	npDo5NG5EeOQio9QoxvCdNgbdjNJrhaX/5qJ7yi/1JI+cebEQdGZ4DRYEctZovB/7m4=
X-Gm-Gg: ASbGncvWeMXhIAyHAeXwVHIhoBSGq2jFPpQgxfij238TqNJCX7DePeq32l5QETWKtGk
	+Kmxj8Scy1OM1sxtYe3bfNDBl2KE0fZ1jMJ0IK/A6W7YkQLP+3sJnK22IQjoLYDGulkXUt3CXFQ
	aIg1iT7uIetLO+VBskQKQZE+/a0sA53+i1ZJffGyZKKFT8FYzHIeL8MUw+O0x3pHNWA5TDIpzf1
	mw4ZXMvnfi+Jdz6IMUMvzKUe7dAuPXUdVRl+KSG1TygfxwkgKCWpRsa1yBR7L+qJzlD1IGuB2DM
	dBDoEkpxUrEeyMDAaxS96JeT8/NBBHmQkamDy5aFKCRJ7jUClGRp7kJOw3ApgNwnGPdXqxJbe8u
	IcKOIqEXau16spEhZLD6f6wczIDc=
X-Google-Smtp-Source: AGHT+IFJio5fCS2fBNF+0hXuSZxnS4K+PQVhd5zP27O8GnG2aQ92KmNgjsK/8qAhqnk6lalVTMRMDQ==
X-Received: by 2002:a05:6000:1a89:b0:3b9:717:4bcd with SMTP id ffacd0b85a97d-3bb68b0d589mr9121216f8f.40.1755523077542;
        Mon, 18 Aug 2025 06:17:57 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a22321985sm131021375e9.17.2025.08.18.06.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 06:17:57 -0700 (PDT)
Message-ID: <7bd5e0aa-c7fc-4c3f-9e5c-998a1d4f5703@linaro.org>
Date: Mon, 18 Aug 2025 14:17:55 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] spi: spi-fsl-lpspi: Reset FIFO and disable module
 on transfer abort
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
 <20250814-james-nxp-lpspi-v1-3-9586d7815d14@linaro.org>
 <aJ4UH8fSWGODwnmO@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aJ4UH8fSWGODwnmO@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/08/2025 5:51 pm, Frank Li wrote:
> On Thu, Aug 14, 2025 at 05:06:43PM +0100, James Clark wrote:
>> From: Larisa Grigore <larisa.grigore@nxp.com>
>>
>> In DMA mode fsl_lpspi_reset() is always called at the end, even when the
>> transfer is aborted. When not using DMA, aborts skip the reset leaving
> 
> Nit: s/"When not using DMA"/In PIO mode

Ack

> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
>> the FIFO filled and the module enabled.
>>
>> Fix it by always calling fsl_lpspi_reset().
>>
>> Fixes: a15dc3d657fa ("spi: lpspi: Fix CLK pin becomes low before one transfer")
>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/spi/spi-fsl-lpspi.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
>> index c65eb6d31ee7..aab92ee7eb94 100644
>> --- a/drivers/spi/spi-fsl-lpspi.c
>> +++ b/drivers/spi/spi-fsl-lpspi.c
>> @@ -734,12 +734,10 @@ static int fsl_lpspi_pio_transfer(struct spi_controller *controller,
>>   	fsl_lpspi_write_tx_fifo(fsl_lpspi);
>>
>>   	ret = fsl_lpspi_wait_for_completion(controller);
>> -	if (ret)
>> -		return ret;
>>
>>   	fsl_lpspi_reset(fsl_lpspi);
>>
>> -	return 0;
>> +	return ret;
>>   }
>>
>>   static int fsl_lpspi_transfer_one(struct spi_controller *controller,
>>
>> --
>> 2.34.1
>>

