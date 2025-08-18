Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F85335BBE
	for <imx@lists.linux.dev>; Mon, 18 Aug 2025 13:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755525040; cv=none; b=I75VALbbYdJKASHde88QsRQd80s5MHBXuG0V4dJehONaLWSZuZs5/2DFFz+X5MfbkQH0wn2DHBxD8qtW3Rs0gYov51M6JzWUCRgB/NPXe3Vm1RypFzBCJnjv/Sfsf+i0NdsFUK/mVB1IlktSVwrFYP5I+AmeegV0WWfNx8E/Hck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755525040; c=relaxed/simple;
	bh=7yHgSWeRbcyIHbjLHLnRwx4d4C71Zhhg/Zdke7nbkOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OXeb5g88b5aX6IdYdeHQd1w/veyYIv3Zds9lEDDIYXzkdkJaW/D3QFhoWegSaAvPNLcxstYXCbA8HIG0FMKlv6nLlpoyznBW8x47+vGngHxPaashnwi+jGE1n1dsvvxCnmukTaSc8e+/SDG+BvLeizNie6isbzY80vmMmEinTxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=imQSELBj; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="imQSELBj"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b9e414ef53so4393195f8f.2
        for <imx@lists.linux.dev>; Mon, 18 Aug 2025 06:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755525037; x=1756129837; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5DVVUnvtZO4/Z08Z1SdfbMyHejdi9PdhiDncUyyHKx0=;
        b=imQSELBjD9oUTaiw6tZoPZM5o1q43gy5qbHpvP1SqRP0o2ZyeujG6LMd+EEnYr+IVs
         OyF5Y+jYYkQZcQbf57uemdaDQaXFNo43I072fEfwAHQ5UuBZmkc54ZjvSvM4ZYamrfyV
         0PgPZ8wy6frRUFyxjEOtMoPOW934WByyWpVpXbC9/rto4FhCFvFUQ1mb0GVB1JUgs6Ly
         X/W2zle8tJOaTM7+qoIOX2m+hafINEk+WJUeJGSJEBukEmGbdEeLCfdnSAhf1ey2sm1B
         covy+w4Zw/hSonF6/ZIICNGxlaZ7LB1xCVMuNGoGtSZ10/HOwJsFnqn3GB+dzlLPLqdY
         U78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755525037; x=1756129837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5DVVUnvtZO4/Z08Z1SdfbMyHejdi9PdhiDncUyyHKx0=;
        b=jM2ctsg/RxEBcOkB4nfwjvYHvh7nvNwXV03eklSpJGfucFYNM81lXJPWd0w7kg8c9O
         QwQoj2iXxI3qU/TPN03QAYSewbkYi//6/58yZedh/XdOpCmH3xwXQVYHyu5vocJY58/L
         wzS53t4Oub5A/9hHHYzfGxLpGa4TytD5AgbAzwpaEyzCEOhpfjXWkU+rdYnbAPuhH1hP
         WK2+k2wyFg1U2OHBdGJ+k2DJOJARwWFQnXBjID7ZPRGQTI+gf+JFzgFFl4G8ahDlgmuo
         Fdx120d54s2QxQzX1NiYY7tTfTRy+B2nypkBgtfnCH3Jfa/TGY2TAatv6jFmsm+NNco3
         hxQg==
X-Forwarded-Encrypted: i=1; AJvYcCUIBL0mHqPEEkUPyYXgTsheSkMyr4ssVHEMLqhnWbeQq2T871kNW7WYpzUGVEG7wO/6TeY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2l7C/EdgyUtn9htMLnwAdHzQppYcPZxqYoiWrnrsx34HAMlMk
	dtV226NJ8Lg0Cp+G3Y+pxGF+D/CpqqO9zV94CgBJxBiHtyauKWASs64hcP4bh2XYXZk=
X-Gm-Gg: ASbGnctk2I9vi1mL33cAYq/C2AaiWT8Dz/wG0tym/MW4hNy8IRhSZWYNnp0pIFtaIHJ
	vbBCej9KalXwgEAlH0bOiyqfdY7XGE+7eWOXkr9rcyd5Xz1nRBA+mlaPO4h1EQqxaguvUL9CIoV
	wP4T79yfPSopMIrYcmreC/4N3FtIUZB8u0au8WqYPljTvJJglCDAALyYwpMveRQSlyBxHEsyCKk
	ZXkEociWmqM0EshRC9gwSKIKO3VjPWoqWOEL/a9AEJ0TO03MCufQnfruAPL+ORSVNjmWX2E065W
	1bvuW2ZvmE9XEM/Of5Hd7Cvzut7tce/ebAe4jBo2K+LpIfz/cOTkTfcFm9O4hFn1wGZBUB6GBOC
	KMZDpKHsMkeKxYIbbn87rQS5b4ww=
X-Google-Smtp-Source: AGHT+IFYGhlIbmElePo7wESeoOURpi8z/foNFggrXzWJl9Ckz2bQUv6UqjNpy4xJdPri66mHTNKaFw==
X-Received: by 2002:a05:6000:2886:b0:3b7:8d70:dac5 with SMTP id ffacd0b85a97d-3bb665647dcmr9959991f8f.2.1755525037164;
        Mon, 18 Aug 2025 06:50:37 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb6816ef48sm12603170f8f.58.2025.08.18.06.50.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 06:50:36 -0700 (PDT)
Message-ID: <a1e7f857-79ec-4cc3-ac64-0f1f43efb7f2@linaro.org>
Date: Mon, 18 Aug 2025 14:50:35 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] spi: spi-fsl-lpspi: Constify devtype datas
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
 <20250814-james-nxp-lpspi-v1-7-9586d7815d14@linaro.org>
 <aJ4tITKLkfto1ltJ@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aJ4tITKLkfto1ltJ@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14/08/2025 7:38 pm, Frank Li wrote:
> On Thu, Aug 14, 2025 at 05:06:47PM +0100, James Clark wrote:
>> struct fsl_lpspi_data->devtype_data and fsl_lpspi_dt_ids that point here
>> are already const, so these can be too.
> 
> Add const for all devtype_data.
> 
> Frank

Ack

>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/spi/spi-fsl-lpspi.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
>> index 98da6a5d7013..332a852b746f 100644
>> --- a/drivers/spi/spi-fsl-lpspi.c
>> +++ b/drivers/spi/spi-fsl-lpspi.c
>> @@ -145,11 +145,11 @@ struct fsl_lpspi_data {
>>    * ERR051608 fixed or not:
>>    * https://www.nxp.com/docs/en/errata/i.MX93_1P87f.pdf
>>    */
>> -static struct fsl_lpspi_devtype_data imx93_lpspi_devtype_data = {
>> +static const struct fsl_lpspi_devtype_data imx93_lpspi_devtype_data = {
>>   	.prescale_max = 1,
>>   };
>>
>> -static struct fsl_lpspi_devtype_data imx7ulp_lpspi_devtype_data = {
>> +static const struct fsl_lpspi_devtype_data imx7ulp_lpspi_devtype_data = {
>>   	.prescale_max = 7,
>>   };
>>
>>
>> --
>> 2.34.1
>>

