Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0D8199385
	for <imx@lists.linux.dev>; Sun, 22 Jun 2025 10:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750588087; cv=none; b=bmhlcSlD7VVk55IW8WLpQbGFU1DfVBh8+csANmSw8juVUdJhMxIrvOyPYXa/KrEGoOsiK0WBSI9raPjynF8oFKp/Bmsv5m/GucwsueD6VwilkhXQLryCG3TXVIZVtFrFWb2vvdRZutgHTtXwYUIW+K5hd0Qn41XzOwr2XVC0fBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750588087; c=relaxed/simple;
	bh=XHnY/XLYnsb/01LU3Hv34FFiB88j8ZZgI1yo9h2KkiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VOjwIRiauHku/KcfZETluGV3D8cXY4v2JNU4pzF9ygJf/vJndohXJPMQasXNbUojLz4dUogX3Ch7heh1t1DBFi17UqSJsGgKFuA6zf6/TP0FmhGd3fIVt+SC5zmVUPKfKL2OiyPGXMkWyF1ZTYbHpXU2q3DFxXDliv6KplN4f2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i1PNojdW; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i1PNojdW"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4ebbfb18fso137851f8f.3
        for <imx@lists.linux.dev>; Sun, 22 Jun 2025 03:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750588084; x=1751192884; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q6EYLYLFpyiYDHg8AKXScLdaa7AF+5W/s+IRWYHsl/k=;
        b=i1PNojdW0rffZUIg0m0uRRx7rR+pfnLonAxBvXbNaEVqMOrwnPdo8Z9VVe18/zxlbk
         Epz8Ih/H8heh48h2rfb9sqca6pspPxChr6u4ux1MU/h/3Q0NohIX6kcwrp3LDRkKR3nN
         1Y7/mjoLQtYHZedhBmY8rWhc06ln0f3K8qPBXjZsxNT7tw/afDUJS+cQ+ZvbGNTg8HjT
         R5Q/p2A9Z4KA1ZHvMUxKNUW29xDlSE87Jf6g8g0gwRwfbMIE0CGnTIZFN+/PTQBhZTTJ
         Dc2QK/u2bSc8OTxp/aUZcJfRL8eUR+Q0Y5qx2Sv1cwzLfijCD/W0VzjJIj4rMukbTyiD
         xx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750588084; x=1751192884;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q6EYLYLFpyiYDHg8AKXScLdaa7AF+5W/s+IRWYHsl/k=;
        b=S01qj1n93+LM33i28jALiM2XWNGnuE8I/Nk1KmPGT3ZmbRZFGuAJ6KYp028CVqCAgh
         KfliaW/an3ECtj7Rcdft/4a+9MAwhXFsNVvgBpnebgd14zDg8mWc2KYcPT+WQds/skj/
         OgXkao04guKocy4I/niSoEoJcw3PsCzABuBkTiwvkrKGnHChdumtmB2rOF1PVScZSVHc
         AVdSc7Hr1rD2N8IJxxwhjwKw5TFWHtxbS9dkrFnZCFUM+5Nce59Q3ztSeXdWiZzfKf1T
         nxKp3HWsmg6uVZwkSwnmibjDqY1t6RE7XUhVq+6U/jXDlVpaeFyC9jYMjnnzhgLuTJix
         0lQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVusZCn8FWcjuAvMcYA9+x9iv07G5Fqy1iGj5aUytuFy2yrCVykIFsGqk1OPkhs0uzbnTo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5oDmLo9zCNQiRwfLbx86L8Os/gTL864oP83qvq9JtDhpFU9iR
	d+sfFb9lU8GkYvvBJziFo4yOGak7Sn4W/OROreku1EjiQPLL0Qh71p4LMnuXQ2QqnRU=
X-Gm-Gg: ASbGnctfybzgRvnNX9sq/t6ZPhODU94oheNwkL3UdjLRZIxaSQdp2V3XqVLwb+9wVzA
	itI6FMpKYzTKW1dceXTal1ils2utJSIQngwrCbUSlUnZKljfgk069OmyBzV7IGyWMYSS2jSh6ya
	3S/1dKDhcwPxrHXOzxh4y8O8AegZYS4E2dzlVXxi9tlVTBjHHUa0l6jxfXtzSX5JsXU6iUuxFpd
	HtW0FwOFoosCvyeiy7422jefuJEiuI0yZkNMBpQeIOwm22e71NBtvZ6R8lg7XvgfJIjnIgJiZmr
	spjzke4G+r9f1WM8M1ZjF8UcCd5aSve5kQlfXzQrvXyI1o1scpAR2J7b/Kzar8Ggvum0+Gp4/kr
	WPmBH1mA=
X-Google-Smtp-Source: AGHT+IGExnyr33PA01GZxb+bF5kgM29BezDYfAl+iMhypV/l7Sou3GfjrHoyyQam3QcDSe2CP4RzQw==
X-Received: by 2002:adf:9ccb:0:b0:3a5:2554:71ff with SMTP id ffacd0b85a97d-3a6d1319e1emr2002220f8f.13.1750588084189;
        Sun, 22 Jun 2025 03:28:04 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453647084a5sm76513045e9.38.2025.06.22.03.28.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 03:28:03 -0700 (PDT)
Message-ID: <af90121a-37e3-488f-aa28-fac0d1c69c09@linaro.org>
Date: Sun, 22 Jun 2025 12:28:01 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 1/2] media: dt-bindings: nxp,imx8-jpeg: Add
 compatible strings for IMX95 JPEG
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Shawn Guo <shawnguo2@yeah.net>
Cc: Frank Li <Frank.Li@nxp.com>, mirela.rabulea@nxp.com, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, ming.qian@nxp.com
References: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
 <20250521173444.310641-1-Frank.Li@nxp.com>
 <eef5ccd99d82dd33e3a4ecdb5d4a5b75ccb0b972.camel@ndufresne.ca>
 <aFORokzx/sImgDtA@dragon>
 <d46d73f84e78daf152962ffb5cce7dd3ae0920d1.camel@ndufresne.ca>
 <6898ce74-808d-4976-b04e-31737396a86c@linaro.org>
 <82d38c0dc93255da3195a919dc650ef8fc07e7f2.camel@ndufresne.ca>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <82d38c0dc93255da3195a919dc650ef8fc07e7f2.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/06/2025 17:06, Nicolas Dufresne wrote:
> Le vendredi 20 juin 2025 à 07:54 +0200, Krzysztof Kozlowski a écrit :
>> On 19/06/2025 19:16, Nicolas Dufresne wrote:
>>> Le jeudi 19 juin 2025 à 12:27 +0800, Shawn Guo a écrit :
>>>> On Fri, May 23, 2025 at 07:22:04PM -0400, Nicolas Dufresne wrote:
>>>>> Hi,
>>>>>
>>>>> Le mercredi 21 mai 2025 à 13:34 -0400, Frank Li a écrit :
>>>>>> Add compatible strings "nxp,imx95-jpgdec" and "nxp,imx95-jpgenc", which
>>>>>> are backward compatible with "nxp,imx8qxp-jpgdec" and
>>>>>> "nxp,imx8qxp-jpegenc". i.MX95 just need one power domain which combine
>>>>>> wrap and all slots together. Reduce minItems of power-domains to 1 for
>>>>>> i.MX95 and keep the same restriction for others.
>>>>>>
>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
>>>>>
>>>>> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>>>>>
>>>>> Krzysztof, will you take this one once the DTS part is ready ?
>>>>
>>>> dt-bindings is the prerequisite of DTS.  DTS patch looks good to me
>>>> and I'm waiting for dt-bindings part to be applied first.
>>>
>>> I was waiting for sign of life on the DTS part, we usually get some ack,
>>> which is good sign we can take the bindings.
>>
>> Such process never happens. DT bindings are the prerequisite here and
>> platform maintainers wait for bindings to be accepted before taking DTS
>> or even sometimes reviewing DTS. Why even bother to review DTS if it
>> follows entirely incorrect binding?
> 
> You are the one requesting DTS with DT bindings for review purpose. You've
> done so regularly this year.

Yes, I asked for DTS for before/while reviewing very questionable
bindings and drivers. Was this reviewed already? Yes, it was. Therefore
after my review, how is this relevant?

Best regards,
Krzysztof
