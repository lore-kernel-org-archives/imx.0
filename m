Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5DD335BD4
	for <imx@lists.linux.dev>; Mon, 18 Aug 2025 13:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755525282; cv=none; b=qQosvHoFL8PuAGMUkxoxFGMpdrCm51R9kWRpBhwYIQwY6zfCIf2zsxRdSGajXFDb5NGZSCYbdF6XWLxFqGgvuuVZ5LUSGbyXztLrAhND49t5r2RU7UsdHC4idDANJJ+v6bJjsJklN5ufx8Fstfx9QnqBAvVbcidBCK2ZDbNM3Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755525282; c=relaxed/simple;
	bh=0hUvDxAeE7pM0L/uSr+rO+vIOw8U3fLyKq+FUQ9aY4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K5Y8UOJoWlYAGknlZZaWOT7++wxlfnSIQJae7ZwUSwEDrxZBen97b4lkY+80qwIv6rwDCWZSAxmNHeFkm8DbNfASr0Xm8BIHc5d0IXH05sGImGvXBU8f3115FP23D5y3kWlZXveRIkmwDD63QmNNLr4qCyaVskZfetiNbR8awQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QAIFBCgt; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QAIFBCgt"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45a1b05a49cso30127505e9.1
        for <imx@lists.linux.dev>; Mon, 18 Aug 2025 06:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755525278; x=1756130078; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ajbb6uzJgO4JgEqQefnygZnHUM70xCyJcHToGkwu0DU=;
        b=QAIFBCgt6SQsdoKfymZiBHIdYDbwNSy8gmu6Sg+yazupsnou0LkLJxZrOSIwaz6cy8
         yAvfySNPW044TaGvdrliq/6VDv5lFCCkzmQtO34ccj1TKvfw1dzn0HY5/3wYoH8OgaaL
         i16EkKyz0p1X86LLwruZ3rt/7vPYc7OE9gF+5I2tjr2NRIAQiIYZLwkCJcxOJhjLpAno
         jGOyZp++SsEan6m55nnlB0ITWYLrRAYSrRU3rDd4+QfXPBfTti54IvNByjvD3slg6tbg
         mmorSFDGDP7BCpq+yaYc5qGufb4magc0U6dECkofg8PouIkgqUtB6gXp2PsacEOWChEN
         YnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755525278; x=1756130078;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ajbb6uzJgO4JgEqQefnygZnHUM70xCyJcHToGkwu0DU=;
        b=NAfpQp/eV7+8VtwSP2jsWfoAUI5KQHzy+b98mfVbwPXKKk4EPCVUe4JK2edQTruT30
         b1b/KD5EzTOHf+2exNPuwNOEYHm1xt4vROF5CbGkf6eN2RLpFODoXejmgK98kOy3AWRq
         aN/Q/CaXZxNZYsTPmu0uotA2NneevdWFsJ1TuLhk0x08BtdJEaCvZ0hk5T4LtSBL3uIY
         PrdjHtDDF4DJa6hG0Wemodz766muuqrX1sQVS8D39DF0gxVFhQhidqUvyKxciQGGHPee
         0RXU6hjbPhjeMtKi23D66BE01G/mXZUhYra/xSpuIK+EzV4vOH+nwBhxr6IeEg4T+VrV
         pRgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMu/jEt2hegJApVkJ7GIMxioS3PSTiEIwZogV8y+F88ctvZwfo73BvWGDDkvfrMvEhQZ8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxSb3/MRc8H1oOrcJ/WqMH/gWnRKCqk82h9dYOLVnjBXcN0yduK
	YC3droQpeeZozVIuwy0v1crH9vQsQRQ6IbrtJ4OgI+9RIlqKE95Jy5g4gQvfbxvSl94=
X-Gm-Gg: ASbGncsRAV6l/ml9kgjj0v64g0DX2614vaglEQUbgmhBN+xsq27zJLJx0HX34AQOBjy
	reQzYmafjX6vDxJ+YlTDjR96bXhrONvK7reZyqtZo93m3EDy9w50A7sAiksUbMlGQGrnSMNA+n3
	g+kKnJMIvFFOCo8YO9WK47yqrLaceBt48mAYylUSKyqjKDYt2kSNnZAiIXR9veJ7I4gvhH4gcx6
	3u023IK7OkKWvydR1nDjoGLF68W2/bg2SJ6nMnzT22w3Bi6Q9v/VhllBolzgJFnHl/qRPeTuwgF
	YBwL9b2zqGc7swQ9IbIVeuAunCWKSEfg9lqXZ3gqw9VkjZBrRsECFYEtL+Aaxn3NQ2eesiuvhD9
	VGVnWZ9EHTkD6G1O3BEJaqH5zgT8=
X-Google-Smtp-Source: AGHT+IFsqQPe2NKcX8XP+TiqznD4ogEZ/CDbCC23S0D8qqY54BvYFiH5p+gzA/UnoS6QDPc9lUMMiQ==
X-Received: by 2002:a05:6000:2408:b0:3b8:f864:2fec with SMTP id ffacd0b85a97d-3bb66943367mr9469963f8f.2.1755525277815;
        Mon, 18 Aug 2025 06:54:37 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bc5e232534sm10596525f8f.24.2025.08.18.06.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 06:54:37 -0700 (PDT)
Message-ID: <7c4cb21a-e1ea-4931-9b51-91cfc8217155@linaro.org>
Date: Mon, 18 Aug 2025 14:54:36 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] spi: spi-fsl-lpspi: Make prescale erratum a bool
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
 <20250814-james-nxp-lpspi-v1-8-9586d7815d14@linaro.org>
 <aJ4sktG1NoMPu5wZ@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aJ4sktG1NoMPu5wZ@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/08/2025 7:36 pm, Frank Li wrote:
> On Thu, Aug 14, 2025 at 05:06:48PM +0100, James Clark wrote:
>> This erratum only ever results in a max value of 1, otherwise the full 3
>> bits are available. To avoid repeating the same prescale values for
>> every new device's devdata, make it a bool.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/spi/spi-fsl-lpspi.c | 12 +++++++-----
>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
>> index 332a852b746f..1013d5c994e9 100644
>> --- a/drivers/spi/spi-fsl-lpspi.c
>> +++ b/drivers/spi/spi-fsl-lpspi.c
>> @@ -96,7 +96,7 @@ static const char * const pincfgs[] = {
>>   };
>>
>>   struct fsl_lpspi_devtype_data {
>> -	u8 prescale_max;
>> +	bool prescale_err : 1;
>>   };
>>
>>   struct lpspi_config {
>> @@ -144,13 +144,16 @@ struct fsl_lpspi_data {
>>   /*
>>    * ERR051608 fixed or not:
>>    * https://www.nxp.com/docs/en/errata/i.MX93_1P87f.pdf
>> + *
>> + * Devices with ERR051608 have a max TCR_PRESCALE value of 1, otherwise the full
>> + * 3 bits are available (0-7).
>>    */
>>   static const struct fsl_lpspi_devtype_data imx93_lpspi_devtype_data = {
>> -	.prescale_max = 1,
>> +	.prescale_err = true,
> 
> I think prescale_max is good and clear enough, you can treat 0 as no
> limit for prescale.
> 
> Frank

Ack

>>   };
>>
>>   static const struct fsl_lpspi_devtype_data imx7ulp_lpspi_devtype_data = {
>> -	.prescale_max = 7,
>> +	.prescale_err = false,
>>   };
>>
>>   static const struct of_device_id fsl_lpspi_dt_ids[] = {
>> @@ -329,12 +332,11 @@ static int fsl_lpspi_set_bitrate(struct fsl_lpspi_data *fsl_lpspi)
>>   {
>>   	struct lpspi_config config = fsl_lpspi->config;
>>   	unsigned int perclk_rate, div;
>> -	u8 prescale_max;
>> +	u8 prescale_max = fsl_lpspi->devtype_data->prescale_err ? 1 : 7;
>>   	u8 prescale;
>>   	int scldiv;
>>
>>   	perclk_rate = clk_get_rate(fsl_lpspi->clk_per);
>> -	prescale_max = fsl_lpspi->devtype_data->prescale_max;
>>
>>   	if (!config.speed_hz) {
>>   		dev_err(fsl_lpspi->dev,
>>
>> --
>> 2.34.1
>>

