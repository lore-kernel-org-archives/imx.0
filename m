Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8212186324
	for <imx@lists.linux.dev>; Tue,  4 Feb 2025 16:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738687581; cv=none; b=i43FFtCz4HzXvAdZY5CUt/hDoDtVe/aQDD9u4zKV+dtYqRjYE6yhKLYHBb7NRtEzHrWkJAioy3zFtEH4f6ctYkjCYsekyoDIJoDaL39LBA1TMreDOsw27qH0DlYb2vQqUXWXO3gDTdg6SbukQXtrzpRnoK7sojsMRCcH9BMu09c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738687581; c=relaxed/simple;
	bh=6WoYhyQuV8rFp7jubI4neBJnEuNk7Olf5CohNrIqXqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YvwmpaaiWkDOmny+ajYkyuQS3MioW1iS76XQHKQBIgeEKxSPD9vPr7Gy5qBe6u3APSrNw4JYn3clquISYSf0xyRRqJDti5BCqmN/8apoT7ksrlIpqo1kBHZA58LoIDNSQ2WhfJvHXstStUw9Kn6dnUe3qDphNHXPsjV6dEq7/tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1OOs8SA; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1OOs8SA"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d90a5581fcso10614903a12.1
        for <imx@lists.linux.dev>; Tue, 04 Feb 2025 08:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738687578; x=1739292378; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bAIs5I+VFr2GejFoX2T/rQp94SdXPfytTAWpFTw7jK8=;
        b=c1OOs8SAvlMwmD5rSN2MH4lWVKN1nNtzvq5UuxtcSpRkLWeNbWLHuaZqpszB6DPDqz
         Vlr0n4TmEt8onkj0RivczVOWuxi7fkIDKcD9aRMwrIK6zAbo0QL1rZ/67k3boaqunXk2
         qWJ6AbrOIh8DgIj2+zTYl/Yp4wJ8PUIm0E5CkOR0Avs/R2xLJKAflndagzEYknkrVsGl
         j8bac8XH5HxIDnQ/wXXot5nbQRz9a2PrY1xcMgUSwN5NsKmonCjFopOrdP1jLNGI5T7M
         HQGIpGNof4Xi/7ilB1qT4dubUUqYv9B4/C8rNZjT9ZRnMiGKtwIuMaDJDinhOiRpYIUL
         S9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738687578; x=1739292378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bAIs5I+VFr2GejFoX2T/rQp94SdXPfytTAWpFTw7jK8=;
        b=slksC6a3qPlqYb1UXz1j8M5lFwNQ0SFvazuYEqTa9YoH9QDhJuBAa+u5tlWVFduV1O
         b1ye6bsROlzRntxzO5gtoud6uSzGYyIVyyNVgyUqBz7MzvGmrRf1Ho+V8b8XX1q8iDzB
         YlgoRgkLWSyAEq2xb7LAlvoVAnwoyGKBEQC3W2Ltv2gr2mHfq1zF9WidQJuES3g6lbxO
         mFKGl1O4OBtiIxmuthfx62MqNO8NmqheI9uYYaONEZhqAqE1bQuhNUZWbDBBkSFlc/X9
         25Dpgn1mqqrhOdWXoZvJaM6svgWOqmSxovvlzUBSde7IaHlgbJM2czVcBVKe8prKUrdw
         9WZA==
X-Forwarded-Encrypted: i=1; AJvYcCWOHSvg4N/BENEtnYH9krFp/6v9sutthOeDLRdOjRmYDSw2xIZ8cTkIXWqYcbvRsjwqvg0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwA/+1wIfco/dNZqpbt0Dz921lF0XS1nFid7OazOiGG5oBcIdD1
	/5uALak5D5BKrIt6gkQBu6iZYjuWfcSCgiPlgUs+0a5SZxyEJw8Z
X-Gm-Gg: ASbGncsxrwFZOIiOqw9onkLoscGFi8hC1V7LEM1XN+b+h3HloaoUfZLMVUqDsKP9jqo
	XJpln5YYglREnmlEG5pz0ytGLHEYvLHx8GRiH45vy6vY57hxKmH2TC+pZnuwcrrUGXRhFNvAXw0
	hW5rK+MOO8dkieT1JcusQesyqhIDHzm7GbahXXL4U5BnR1m88WWH10bXq9woiuJ9y1XdSjz1NM2
	Dx9+eYoK8/v+MzabBKMi+hrXz3EaChdYrL6s2ySpYLsu2m4UxHopeQgC7rrj9OvLQnB4BuZ30OZ
	0Va4hkZdB+qcLTIoDtKoht+wxEItbh1GsJ9qL1mC8AaS
X-Google-Smtp-Source: AGHT+IE79frgfLC8a4Bx1mxN3BZ+cxcioNpM5kWchbXny/5nm0Akp5DFdF7cYUim9dZdQ3f/v6TBQw==
X-Received: by 2002:a17:907:940a:b0:ab7:53af:3eb1 with SMTP id a640c23a62f3a-ab753af45ecmr249487866b.36.1738687577334;
        Tue, 04 Feb 2025 08:46:17 -0800 (PST)
Received: from [192.168.1.130] ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e49ff269sm945268766b.118.2025.02.04.08.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 08:46:16 -0800 (PST)
Message-ID: <1e228234-96eb-4482-bc35-343ed42af746@gmail.com>
Date: Tue, 4 Feb 2025 18:46:15 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] ASoC: SOF: imx: merge imx8 and imx8ulp drivers
To: Frank Li <Frank.li@nxp.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Iuliana Prodan <iuliana.prodan@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 imx@lists.linux.dev
References: <20250203171808.4108-1-laurentiumihalcea111@gmail.com>
 <20250203171808.4108-9-laurentiumihalcea111@gmail.com>
 <Z6EhvHXeNJPW1Cwh@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <Z6EhvHXeNJPW1Cwh@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


(snip)

>>  IMX_SOF_DEV_DESC(imx8, sof_imx8_machs, &imx8_chip_info, &sof_imx8_ops, imx_ops_init);
>>  IMX_SOF_DEV_DESC(imx8x, sof_imx8_machs, &imx8x_chip_info, &sof_imx8_ops, imx_ops_init);
>>  IMX_SOF_DEV_DESC(imx8m, sof_imx8_machs, &imx8m_chip_info, &sof_imx8_ops, imx_ops_init);
>> +IMX_SOF_DEV_DESC(imx8ulp, sof_imx8_machs, &imx8ulp_chip_info, &sof_imx8_ops, imx_ops_init);
>>
>>  static const struct of_device_id sof_of_imx8_ids[] = {
>>  	{
>> @@ -339,6 +448,10 @@ static const struct of_device_id sof_of_imx8_ids[] = {
>>  		.compatible = "fsl,imx8mp-dsp",
>>  		.data = &IMX_SOF_DEV_DESC_NAME(imx8m),
>>  	},
>> +	{
>> +		.compatible = "fsl,imx8ulp-dsp",
>> +		.data = &IMX_SOF_DEV_DESC_NAME(imx8ulp),
>> +	},
> Can you put imx8ulp_dai into driver data to avoid of_device_is_compatible()
> logic?
>
> Frank

should be able to add it to "struct imx_chip_info"

