Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948491DF255
	for <imx@lists.linux.dev>; Sun,  9 Feb 2025 20:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739133733; cv=none; b=mQ3une1rz/88RTMmiGWh8DKr/F5ZKEWV7jvCIbmGWNEHiYe9JrOT/FLV3XISj7RbcBS2useH2afhtxkQICt/TqNgUwb3kWwQmuSjoe8QXGnLtUuOks18yqSTQyuFT5cjgR1BdQF4mfOu1KUbuJ3PIANvmdpJLMmaa0D3p0LkPjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739133733; c=relaxed/simple;
	bh=V6vRzYiDC3bB/H6xgCcOGf8C9PBIlt4KxnITd/AzU8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b416jfzpUIf7OFJjM1abEOX6mZbqfXKAKOMY1W9+0zL/tlajid4pZSi7BcIYTn8Wl+KE/gSwEM5AUFbpcRW6iRCI9N2JzdsQibGrymv5P80fgnfYddb4dOeAnURdX69EPQn2y0IkS1hJ+RmwVxqwp/LfHEyYNiYRRusV24b2CFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J9OCH7ji; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J9OCH7ji"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43658c452f5so3567785e9.0
        for <imx@lists.linux.dev>; Sun, 09 Feb 2025 12:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739133729; x=1739738529; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5RGz6LGAgvawN6AjjS8OE8xM5iM+s41gvkEim96ZKyA=;
        b=J9OCH7jirenWnIEIkb0gT5DwhTom+BM5pNfB6+H+lpOUOT8tL2pWVu2sTbu6CDmtW7
         H4R3gVKFmqrEDJW0Gg5VqgkHesbwooBNzlZWP7jD+7u4Rsecsccmgrw+Axt3ItaK1E0v
         2tT4Z4h4dBCAfpUztX8KOUpEUPJkKbimLDFRu7AG06Xfhdsmls+aU/QHrMAuKGsFkffF
         TFmGblLORsL/xVOnwYNGPhkDE2N1E7q+rRkfN43y8q1CNUXOH7OoGJtLbuqni4R/1Ljw
         IZsdwv6JRM658zXAhVeDoxNzVnHecIYMK1M9jD+/riKjgxUgzvUyOgzEJXgrt8n+xUIO
         PhDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739133729; x=1739738529;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5RGz6LGAgvawN6AjjS8OE8xM5iM+s41gvkEim96ZKyA=;
        b=j7tRRHXMX2aBl9jEPbN8e+9/QAcvgMy99GoIJSMqOcstBHJE0JFAvA6VgmBSL94u7g
         Us9j86Y1b/sNlKfeSAoifXN8JLd4J0yTtAwtw14I6zIojWL/lkV4mqpBkh93+I2UgQHZ
         QdFYRAt4LytBmpEv37a4swcViC+Nn3mSpA0wlrcXDpHeq6Z+LDX5bHquLckbkVdz60NZ
         OG/BQgxixAOp9+q6OUFVfhUe1yjPbGYiM+j8n8U3to9nYL0G7axLbAdaWVcgacM8UwnQ
         ZTw6tCE9GICT4EsGc/p/N2XVi2879d06djB8tKV9+8VfYOT52TXsHHFOEfuM2mcC1x8e
         D8fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlPYu0Y+X2CmtdoGb9EMj85j2wBhf3lZxiGA1EzvPBmVEMEM1Lm8X1JidEIrq6bIxAwuQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwVt9knwzDoePtlnqU90GG5mUykq96DHZyFchiK1BMNlxFdion
	2pxf8g6ffZj7yb4wEBbXiKsaTT6n3YQPDnVgHpWXFn7dg7bu/N8Xle7dzsXkKS4=
X-Gm-Gg: ASbGncszP8pq6h7Pt7Y21hBtjs/ATCAuuomZr2+/QfEAUydIGm9zNJthnhWaxOafP5H
	wFhs9kxtpIvi85DnGpcUp84AnebYu4moRgphqP/9pqc+UwGiYKPliq02YDILvuBOYPyVqlTj9LR
	RLM4EY/mZgElK1Y8NMoqnldzJQGkwJCUI2qI5ZaCcPsDl6cbHTATmKh49X21XICJwuQCOPdwPpo
	cph6FitT3OFA6ZkgIjBFpGD9woGZkTQa97TscxbrQ0+vxVm04dlHJgB4C59yBGPkw0wcaCNkuLK
	Wag/k82vZabtn+BCaB8uLl5QKmTw5kscxFY=
X-Google-Smtp-Source: AGHT+IHavxVn/g//pI/tj743lyQj9IQgBXD+xK+zca5kRGYd7NJ/QZZbL6fGqI1Nq1uUaAm5IKE3zg==
X-Received: by 2002:a5d:5889:0:b0:38c:5db6:69cb with SMTP id ffacd0b85a97d-38dc9355cacmr2960535f8f.13.1739133728818;
        Sun, 09 Feb 2025 12:42:08 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dcae80dsm122161845e9.22.2025.02.09.12.42.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 12:42:08 -0800 (PST)
Message-ID: <5c0c716c-3f82-4b10-aceb-c85ecba52a53@linaro.org>
Date: Sun, 9 Feb 2025 21:42:05 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: dt-bindings: media: i2c: align filenames format
 with standard
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Heidelberg <david@ixit.cz>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Ramesh Shanmugasundaram <rashanmu@gmail.com>,
 Tim Harvey <tharvey@gateworks.com>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Akinobu Mita <akinobu.mita@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250209195517.148700-1-david@ixit.cz>
 <20250209201833.GE21843@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250209201833.GE21843@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/02/2025 21:18, Laurent Pinchart wrote:
> Hi David,
> 
> Thank you for the patch.
> 
> On Sun, Feb 09, 2025 at 08:53:43PM +0100, David Heidelberg wrote:
>> Append missing vendor and align with other sony definitions.
>>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>  .../media/i2c/{ad5820.txt => adi,ad5820.txt}  |  0
>>  .../i2c/{adp1653.txt => adi,adp1653.txt}      |  0
>>  .../i2c/{adv7180.yaml => adi,adv7180.yaml}    |  2 +-
>>  .../i2c/{adv7343.txt => adi,adv7343.txt}      |  0
>>  .../i2c/{adv748x.yaml => adi,adv748x.yaml}    |  2 +-
>>  .../i2c/{adv7604.yaml => adi,adv7604.yaml}    |  2 +-
>>  .../i2c/{mt9v032.txt => aptina,mt9v032.txt}   |  0
>>  .../i2c/{max2175.txt => maxim,max2175.txt}    |  0
>>  .../i2c/{mt9m111.txt => micron,mt9m111.txt}   |  0
>>  .../i2c/{tda1997x.txt => nxp,tda1997x.txt}    |  0
>>  .../i2c/{mt9m001.txt => onnn,mt9m001.txt}     |  0
>>  .../media/i2c/{ov2640.txt => ovti,ov2640.txt} |  0
>>  .../media/i2c/{ov2659.txt => ovti,ov2659.txt} |  0
>>  .../media/i2c/{ov7670.txt => ovti,ov7670.txt} |  0
>>  .../media/i2c/{ov7740.txt => ovti,ov7740.txt} |  0
>>  .../media/i2c/{ov9650.txt => ovti,ov9650.txt} |  0
>>  .../i2c/{imx219.yaml => sony,imx219.yaml}     |  2 +-
> 
> I've submitted
> https://lore.kernel.org/r/20250208195202.23164-1-laurent.pinchart@ideasonboard.com
> ("[PATCH] dt-bindings: media: imx219: Rename binding file with vendor
> prefix") that does the same for imx219.yaml. I don't mind if this patch
> gets merged instead.


David's patch was submitted in December:
https://lore.kernel.org/all/6djxfcuroxlth2th3tpuesauhdnowatzgnyhesewjfz32v6gbz@q2dj7jsxiqlw/

and also earlier:
https://lore.kernel.org/all/20200715140951.90753-9-jacopo+renesas@jmondi.org/

Best regards,
Krzysztof
