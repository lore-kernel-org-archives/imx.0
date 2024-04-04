Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979134C63A
	for <imx@lists.linux.dev>; Thu,  4 Apr 2024 06:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712211981; cv=none; b=h7r2/5UE5KTSlnHJJNGVb8wScIy32kfH/cEBVPuKCKaEmFBPEw1loJb3FSmpFtWVtJ67HyOXK4d5R6XJ0CTjQShlTgo7iqpZek7iClE09SAPs52Omhb577K/3AOtFVuOzCk9ebNfE7k7I/EdvGhyqyMkEQAEwcb0DnwK14FEKd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712211981; c=relaxed/simple;
	bh=DXMdBYy+JURPXBmu6wf7aZo7UWB6Ed5DGqd53HDljvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=r5JuHsc4aDJoI/w/3vf8wxjB2BkJWrROsN03YH4b5PS4a+8fkyvhu5HJmrgfRPCLq4rz4vQE6RncZyioyaH65PQg9u4xx2mATQXMb+lwIfpWY4tSHxpr4TiL/XyP3PJURR0rJgukQAGFoaCEY0ShXUmDAUmiI4+HjunrxJzKlrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i+g5o+0n; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i+g5o+0n"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a47385a4379so332834966b.0
        for <imx@lists.linux.dev>; Wed, 03 Apr 2024 23:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712211978; x=1712816778; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iSAY67R1WFy93YDpr7xFqvywbHMfxkjyKwnhViSeBMI=;
        b=i+g5o+0nh2hNd5T2NB57sPC9saA31wo5qZ19c/c9OFGlRZlxE76pH+xGDl/WP7nC4k
         fU/JiEKTq+1BT1d1XNn3sRxmJ2RF7JQKHchCCQgD7wHrp53iLmp7hTmWAmwZ1PJUdR9P
         g9E0B9YqZT4TSDhLXBF9NuFitRjPvrOLdc8Gl11OqnscdAzLpq9cHV8kUiAEFso1yV1G
         1soHCqakV3Qjm/ltQTWdT9hCDTzihItmXpRFt3b0OmjirVDPKqM7g76tay3g79E5uqPX
         rVy/QK6GBkUhk4OGfSoeHhcCUQCHcZ3jA9fd05lfxx9xvNMOA1iDGygyDGSqymuo3Pvn
         QyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712211978; x=1712816778;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSAY67R1WFy93YDpr7xFqvywbHMfxkjyKwnhViSeBMI=;
        b=vx4F6dqc1Bz2E3sDUuWvj06ZCKJGHZGP+tjckV7wJFPr1pp/DQJ+Dfj3tTD0M9mVNw
         PJg7swBTww/14E8ocvYA+5wbgw9QQA0rh9gXfFkLZM4a/tGCKzO18mfrzSZd/ujBFSDQ
         wBXtgWubq4BplQIHGMUjjgqIIuoxcQ5wntIX/N9LtcD9hk/P/UjXMWm9r27zF3AbPzsO
         AhaDutxL3Saqm8MxhN/XFY0ZPdMjJwwYTS1ymvG0fwnowFZIxJ+5MJCzKc8dbmPmrpZV
         VaC00O6V1JH+xECPLwHcd4E77RhFALfWc2uln3FmZqV+1pzpK4wmLOnziC+gEFkRyKfS
         E1cw==
X-Forwarded-Encrypted: i=1; AJvYcCUxYJHYy72qbySiPpvEAc2hgcdyL4XS8oloRtWS1TU8RrE4y4X/hr7EpFf8+H2gRaaXNH3BjWWADgUpuQxy8n2l9AtH
X-Gm-Message-State: AOJu0Yw/+xsrIuKcUxSa16JYFb1Mw7gq//mmttf9mq2N91FcGxnCmNBk
	ZlYsJ/G7wu/I+gXieNE9cpcJj/5f5Y0H0+f7+Np3FqkglX2+jESF97YEmimI3NY=
X-Google-Smtp-Source: AGHT+IGBi+x3KcN//qD9D955Pat0vd8vxE5gcHmyvGdVx4wJ4DYpPNiVD0vAZDXzv9VQ8nJasXiTOA==
X-Received: by 2002:a17:906:110c:b0:a4e:eb64:f669 with SMTP id h12-20020a170906110c00b00a4eeb64f669mr1512163eja.1.1712211977965;
        Wed, 03 Apr 2024 23:26:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id wk8-20020a170907054800b00a4e2d7dd2d8sm7825972ejb.182.2024.04.03.23.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 23:26:17 -0700 (PDT)
Message-ID: <af602862-5120-4717-adb6-694ada09e8d8@linaro.org>
Date: Thu, 4 Apr 2024 08:26:15 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: media: imx-jpeg: add
 clocks,clock-names,slot to fix warning
To: Frank Li <Frank.Li@nxp.com>, Mirela Rabulea <mirela.rabulea@nxp.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 "open list:NXP i.MX 8QXP/8QM JPEG V4L2 DRIVER" <imx@lists.linux.dev>,
 "open list:NXP i.MX 8QXP/8QM JPEG V4L2 DRIVER"
 <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20240404035205.59492-1-Frank.Li@nxp.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240404035205.59492-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/04/2024 05:52, Frank Li wrote:
> Fix below DTB_CHECK warning.
> 
> make CHECK_DTBS=y freescale/imx8qxp-mek.dtb
>   DTC_CHK arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb
> arch/arm64/boot/dts/freescale/imx8qxp-mek.dtb: jpegdec@58400000: 'assigned-clock-rates', 'assigned-clocks', 'clock-names', 'clocks', 'slot' do not match any of the regexes: 'pinctrl-[0-9]+'
> 	from schema $id: http://devicetree.org/schemas/media/nxp,imx8-jpeg.yaml#

No, that's not the reason to add properties. Add them if they are valid.



>  
> +  slot:
> +    description: Certain slot number is used.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 3

NAK. Every time.

Fix your DTS instead.

Please read the feedback instead of pushing this stuff for the third time!

https://lore.kernel.org/all/bbb1875b-7980-46aa-80b4-dbaf2a2d5755@linaro.org/

Can NXP take responsibility for this piece of code?

Best regards,
Krzysztof

