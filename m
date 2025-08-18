Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E16F341AB2
	for <imx@lists.linux.dev>; Mon, 18 Aug 2025 14:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755526951; cv=none; b=X/y99zGQ+lUnSxhw5UeibbCw/0xSYbSt7M5ab5l0d3aWBBHxp1NMcRwazt/Jjh6VtawRh5B2wRJr/faEePt6mizevjdLw/O4FcgxCFnFk1X5u3oL3OUSzU4IhqlmaaoC+hF0QSVgQK0SIEUNO0g2MCHR8TbeKrDWw5C5DAavAWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755526951; c=relaxed/simple;
	bh=Ld4BTbysJvvmlTmsob/shBMtAaRTdrmxmv8v8XzejBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gDzCGZG6bkHRnK6Cx2UIB4o4a0P6dNjeLO0A5hHA7oiZEUlR8YWbv2RtlwraoDJTJBfGF3/HFltRdqLLqPvQec4+/KrMs+sGiPQhLc0n2ikAADCYaoZsO5AKgtml9xhYeGRJBBw/OZLt1jbeh3qq+0WcG7Z/4BaH9qwthnkgUxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pod5DKRl; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pod5DKRl"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b9e41101d4so2242198f8f.2
        for <imx@lists.linux.dev>; Mon, 18 Aug 2025 07:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755526948; x=1756131748; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VFT7EYdl/U8S17HmCa7RikHeUwhOUF2kdHWiG5vKuDQ=;
        b=Pod5DKRl2km3eSlfPEH23wdP/RtlhKugjGb6SVFv+y5evULQ4/Pbjwvk9QYt1nSAOV
         0cocWSSFblJfa/UV5F4r6w8HVnT4eEm6QM+7OO0PQHnBwDaVdOF3OHtc01m7WeoOAO3H
         N+uTidFedTLWJDcDUXd6K/u0ToL1EsSZ23BZQo4OGBILprEKX/SReTqaB4tg3V2T9vAc
         KNhGORMJcOkKZ22NTvwcIEWFLuagitlSJa9YU7H00u5sc/ME2OlUpTdpC+JDI5G57zQ/
         SMTOzKl+4wi5k5G9qo+SOZnx1I1uYjStakPx/X9GvoHElx3tGfsRfc62D1Zk0PnIWJ6u
         ERAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755526948; x=1756131748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VFT7EYdl/U8S17HmCa7RikHeUwhOUF2kdHWiG5vKuDQ=;
        b=WvxARDb1VpncTYQxUKKMGnnYsw0sf0t2H1aKZZhXS5PdkBG4pLghe+Baqu3zI9gI/v
         OwQvPK8HRzux+vdiWWduTPE6m3t0siLuOGcYRys840a+LPleoCbs2vKK9KVe7wyThTNP
         8L5mhNbeQEwaz12oFQgoVUrf9uHAP6ls9fqdptBxhcXBJaVjSjAHCjUJ7AYOQngC72wq
         OrkSL3lTcKUdeG2nkZpvHXBeEbfVeb4lfHDM5Hcxyp7VZ6h5a8PxJln0ylEbu19RxVzl
         K7GrVLtMbrBEfbPsQaNKN7oAbnuyBuiG9iBJtdCacHFUWBNo/9AhbzpPamyt4GH2Ebvy
         9qJg==
X-Forwarded-Encrypted: i=1; AJvYcCVPH9HOhcQX2uRRoa+/ggqAiPdk68USTeBkJKNdTENDvRaU94Joows6I08w6fV23FYclfU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGao5w6YYaFUNdLne7ZWEqiKRXcz9IpF7h3aaqCCnU1QPr2cYG
	D0OCriAFW2Sr3hzWL18D0n/4TbJtYRzn+nC/GXKbusf6DFzFkwadPzXsNXhE+TEWV8I=
X-Gm-Gg: ASbGncviobQo5tMfkeylKl6mDcqq1kjhGMAsqLL5lQFrPThfCIycqhYY+HyjqLZq0kS
	UhKcSF5NN8kCH11yePRFppWHnvAFUhSUkUwUrHqRyspquVDkiyNhZ9Yq9W21LCfpMerk5zAlYRA
	aF6cb1X47wLsFMS04ijoLxp5Eo1SNTSKXw6PzFeXfJAWkumMVMTF0PC2WxMDor1XQ20Na5Ck7zJ
	jSPKWTPfhASaPJdWHky2s9amool5FYTOFG6yGW+fKG9KbzEYYXBZuSqmpQjodfFoH8Rg9LWk57Q
	YcgtQAPJHNvkexd1MkrUfc6+dBe/4JG9ItWugwibTZrO/7i7Mmua6GYayQdsmQoDXfIOZk+fwdM
	fz9SHHw+bKg5iM0chrUJHbdWR6wI=
X-Google-Smtp-Source: AGHT+IHXXBqcG5WtLIRqk/YWgEdHVWCYOOUWvQEUiJZ9gf9C/DO/NkLfo+uNFk8MgEI2qKitz8FZdg==
X-Received: by 2002:a05:6000:2c09:b0:3b7:882c:790 with SMTP id ffacd0b85a97d-3bb68a1644bmr9651163f8f.37.1755526947830;
        Mon, 18 Aug 2025 07:22:27 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1b226eecsm106540185e9.1.2025.08.18.07.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 07:22:27 -0700 (PDT)
Message-ID: <14fd2e7a-0fe6-4f00-b826-7f3971dd09ae@linaro.org>
Date: Mon, 18 Aug 2025 15:22:25 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/13] spi: spi-fsl-lpspi: Parameterize reading num-cs
 from hardware
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
 <20250814-james-nxp-lpspi-v1-9-9586d7815d14@linaro.org>
 <aJ4rmLgTm+A2hDA0@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aJ4rmLgTm+A2hDA0@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/08/2025 7:31 pm, Frank Li wrote:
> On Thu, Aug 14, 2025 at 05:06:49PM +0100, James Clark wrote:
>> To avoid adding more string matching here for every new device, move
>> this property into devtype data.
> 
> Add query_hw_for_num_cs in devtype to avoid directly check compatible
> "fsl,imx93-spi".
> 
> No functionaltiy change.
> 
> Frank

Ack

>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/spi/spi-fsl-lpspi.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
>> index 1013d5c994e9..6d0138b27785 100644
>> --- a/drivers/spi/spi-fsl-lpspi.c
>> +++ b/drivers/spi/spi-fsl-lpspi.c
>> @@ -97,6 +97,7 @@ static const char * const pincfgs[] = {
>>
>>   struct fsl_lpspi_devtype_data {
>>   	bool prescale_err : 1;
>> +	bool query_hw_for_num_cs : 1;
>>   };
>>
>>   struct lpspi_config {
>> @@ -150,10 +151,12 @@ struct fsl_lpspi_data {
>>    */
>>   static const struct fsl_lpspi_devtype_data imx93_lpspi_devtype_data = {
>>   	.prescale_err = true,
>> +	.query_hw_for_num_cs = true,
>>   };
>>
>>   static const struct fsl_lpspi_devtype_data imx7ulp_lpspi_devtype_data = {
>>   	.prescale_err = false,
>> +	.query_hw_for_num_cs = false,
>>   };
>>
>>   static const struct of_device_id fsl_lpspi_dt_ids[] = {
>> @@ -960,7 +963,7 @@ static int fsl_lpspi_probe(struct platform_device *pdev)
>>   	fsl_lpspi->rxfifosize = 1 << ((temp >> 8) & 0x0f);
>>   	if (of_property_read_u32((&pdev->dev)->of_node, "num-cs",
>>   				 &num_cs)) {
>> -		if (of_device_is_compatible(pdev->dev.of_node, "fsl,imx93-spi"))
>> +		if (devtype_data->query_hw_for_num_cs)
>>   			num_cs = ((temp >> 16) & 0xf);
>>   		else
>>   			num_cs = 1;
>>
>> --
>> 2.34.1
>>

