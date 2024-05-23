Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7967A42070
	for <imx@lists.linux.dev>; Thu, 23 May 2024 07:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716447772; cv=none; b=K9lsjzGREVI93cHFx/UU1fXIDRlnx6DzHZMh/VhmmJo59iinHhe2kwuDkzHeXaLoLGaamo1iMkvVj6VGxKW67kx5u5KW609eUxxegefdFk7HWeAOVE6VMTpUN+ywpeicpNiLAyq4PiSAbbjhm/0cLQJkOPnwjgdfqOaOKJYmERg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716447772; c=relaxed/simple;
	bh=2iwAMzrl4dDMMQsEIaTB4uokRYYhC3LD8qk0O9UaQeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=m7DH/p45cRchq22dK6S6E1ftxRiQ49CJiS0R3XP2VE/EApIsSJ1GPJlzXShzGnVAPddw+5ZrFATC2Nr+HEaV0u1Yg3a4GO+aFsQHe7tlsCa1xnllJNP7j50Q3JokdhTUVCGl0ZKqT1L7oGqmxrmwVS3ZZ8vRUjLeT1sBjyTlA9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dkb5dcVv; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dkb5dcVv"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4200ee47de7so50769535e9.2
        for <imx@lists.linux.dev>; Thu, 23 May 2024 00:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716447769; x=1717052569; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8itbzUF/Z2ZMEmOObc0N18iAGI/cMcrQQ08PQ71w8q4=;
        b=Dkb5dcVv6OCyYGuvw7orSyubBnsdXBXaGrJUkzSdSmulEniKRUVKpA85L+UsNlSIhB
         l1BAVVEC7IvXNdZJ+5QjA7EXvqleNgnNoho8SZNJR3BP2i2iTS+6c62aSfDOGR6zvAeL
         miPuuBUULCiXIjLGp5XnQSCWsA2LsJV9Z2CAWBBCOvuvaqABnkTC3viRN2ePfdscw4Fl
         1FCp0z6BThNiOm9IC6Pe7tySqt+zk6MZ0Uk2S0+pGu3S7I4XVyjEls87cCz2yKwYHZzS
         prPegLMnI7JTZujbcKZgCXpycNlffEIZxXc4zBRizYR6W7wlpatUryNm2ojPadGl6X3s
         JhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716447769; x=1717052569;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8itbzUF/Z2ZMEmOObc0N18iAGI/cMcrQQ08PQ71w8q4=;
        b=cke0euzBlJGvj8Te4zFSiNUurVR45fY6moJw/AHtJwECUjBHEDtcVjj0+Mv/Jpy5mj
         ZQX1SEm+ZYaS7dhWoDDoVnuEG5QeMw+5Xt5wys2pMJbn9VUxxET7Kml9CHpR6RXC5uhJ
         PX2kiechHQ0LGSgikjyC1Gf0BjKo+3+RPF3qQVblOzZAHzmeGl1qQQ4174n8w0R/dzRh
         agbyQyUPrFky/+A0ps45GXid8S+827QTJpjGkUs+gff/6Z4IqQbTowi3Q1qaP7WYRgDg
         2SQXlVjTaJeskS+Fn4A2ZnqfyEBYXK6PETrU0JjRmbjyVChXXJmU/PiPMkkGM10RVGn+
         Et9g==
X-Forwarded-Encrypted: i=1; AJvYcCV56h4DaHuL3nqPiyKCXt8r5Fzc8lw2OUU2mG3d68E3SPLy66+boh9F7qbZTVQoBNV28MvkkJ+P0GRHRiSQyi4GSk/A
X-Gm-Message-State: AOJu0YzwGxf6utEnVLfMLihZDr1nFQvw8wXAFxCVZ62KQ3F2BWpaM6ZG
	yyWpxtL5tAThR/8Aje43r0ehym9QX4T7mWS6P7ebhYHaZtOuYxxnf4rxDlAHZjU=
X-Google-Smtp-Source: AGHT+IEULw/4bJ30NXLcAzBBA6aS68zSf6t9wgP7S71NPOAFLWawxehFRN+A4HA7vgdVZuWnS5fGwA==
X-Received: by 2002:a05:600c:2047:b0:418:c2af:ab83 with SMTP id 5b1f17b1804b1-420fd363ab2mr36128485e9.36.1716447768844;
        Thu, 23 May 2024 00:02:48 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100ef3625sm16208925e9.7.2024.05.23.00.02.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 May 2024 00:02:47 -0700 (PDT)
Message-ID: <07250029-7cea-4a82-9e70-22e0e6f7fb37@linaro.org>
Date: Thu, 23 May 2024 09:02:46 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: rename gw7905 to gw75xx
To: Tim Harvey <tharvey@gateworks.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Li Yang <leoyang.li@nxp.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20240522215043.3747651-1-tharvey@gateworks.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240522215043.3747651-1-tharvey@gateworks.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/05/2024 23:50, Tim Harvey wrote:
> The GW7905 was renamed to GW7500 before production release.
> 
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 0027201e19f8..d8bc295079e3 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -920,8 +920,8 @@ properties:
>                - fsl,imx8mm-ddr4-evk       # i.MX8MM DDR4 EVK Board
>                - fsl,imx8mm-evk            # i.MX8MM EVK Board
>                - fsl,imx8mm-evkb           # i.MX8MM EVKB Board
> +              - gateworks,imx8mm-gw75xx-0x # i.MX8MM Gateworks Board

That's not even equivalent. You 7500 != 75xx.

>                - gateworks,imx8mm-gw7904
> -              - gateworks,imx8mm-gw7905-0x # i.MX8MM Gateworks Board

Compatibles do not change. It's just a string. Fixed string.

Best regards,
Krzysztof

