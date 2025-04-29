Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B3C221295
	for <imx@lists.linux.dev>; Tue, 29 Apr 2025 15:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745939861; cv=none; b=VGurDDLsC4delObYIewAdFuRenmu1nFH9wCeTEtrXaGvp7NBdxb4nG4BEUK7poEPinpty/HwytMGXEBAIZ/GSiY4T2RAh4XwTAMUtxoER8IETBJwm/2znC/hyDS1BhrJ08rQTJdIuL1GODXPii7SQwQNoxdX0TvcPk6N6982Sew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745939861; c=relaxed/simple;
	bh=DiuiAYICLRUl59C/aRhELeH+HvVB1l5QG0k9BnluZU0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CHasq2TFQ+NZmQIOv8Qsu1M0YpASRY13NX+YmwQKSG7tHSytVBcmOSKEzasP9UpSYTK8oir9Gf8T/3GhkKvc+R0iN4iF0OD4y+vZ7Ab1GP1q7ESie52pjENAm3P59cB9bpXKg3+mKOMBEYOHaAtl5Z9YQxalr5mf1gzh42fbOrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jerCzFjk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jerCzFjk"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43f106a3591so6737505e9.3
        for <imx@lists.linux.dev>; Tue, 29 Apr 2025 08:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745939857; x=1746544657; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BokEIJpAcKb2binz16NzuPQ4I7I+6I7p32b1cJZhi5A=;
        b=jerCzFjku2DxidcyT5evGc6shqnPOxwrkc7TjMoeMVeUyKTXgYY2OtvYGGimZzT8LG
         IFLbr4QJUihcxBsRLla58a3LVeTNPcC3A7JtTLowTFqpjWAvMhs9BXdKGMLLKmRvXP5P
         uTsPTYMTnDf5rEThMgYCtr7AYxm0dwXf0HNAdrKFLxmg3XQE2qsjNtq7egaO4UapVF0y
         FhoOx4do6FPVQuMPlvDXPu12QQr8At3rTtiyDpoqCcPU8AZbVQeljOF/Xux37lbQKRXo
         /nBBxXvEsX+zHiQz99yXUtGuCakW4Q07i7bevj9GUUiBoWgD7b55QhxW6JlenG1bOgBE
         nIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745939857; x=1746544657;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BokEIJpAcKb2binz16NzuPQ4I7I+6I7p32b1cJZhi5A=;
        b=v8xnsrt5EkN3KIsyfF7UvHoHJOSzM7lGCnmoZViRgzifJos2mWiLCRMV6NZc5Bl26K
         pLyUIcu30aAvFLZN4EFgp9cZus15NSBjhjMb91hyh5K8iGgOzvrYJeIKvusONAzIGCG0
         ClUwH2qhjgG2yJHtSHbUSYx/WatjSNScsDehyLDKT4YzoEd7Ny9yUjmBOVOWctbmcAjU
         2vcXYKYfLJDtPORGhAg293ZpGIXfuZl+SbTLhfjzQt+gr3phll2k0XJ4/5EZQZSCTRiQ
         YGzSAZI1RhjCf/vZxZ/zMPZ/3SAknkQy840N+OeFbKrgCz6xi1Jbzqlvgk/iTdiio64g
         BfQw==
X-Forwarded-Encrypted: i=1; AJvYcCVNO9aT2wTIPHYUH54NHwYXwRI8/Rbl7vbRLMaiw99dLsXjAz+ybHl681T7/okzhHmJJYE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9Ggwl7AegTA/xM17W7uugLdLGrCzQYRYc1RgPvded5W50vpI1
	STXf25axaj/lYRRvy3NuHTCl7gxfZrVnDv3BeRVRDnNU1+dPvNU8Fhx3lodZRAI=
X-Gm-Gg: ASbGncvmX3j/J/JEc394NxJ6HLhyf3mrbUykpFb9NBvRaU2qfUExHPfdGL5NBdtcQD1
	Bg9jF6R9zRJEW7TlHtX+OgOGpx5KmlqtP5ucqVWGy+PdnMaB/Gf/0uNVOgsadt0E37zjDPmqu3X
	VJ6ZSZWPa+6r27zRt/IorvC2qU5sNrfDPveT00YFoZpZsDGq6ohWBQemGy7uN++yVwarcMYCKy7
	XWckmw7FNWSplUVn9N+VK44rNeppZsEYHIgHyH95aG/MZ6wrF1uXwJHPLHMwuQV8NYsoXMANDws
	hEsEclkEZA8XwFmxNrMMFZZE3xz5dhwIUvu/gqcx14mASh/ZCXOwtzTCap8=
X-Google-Smtp-Source: AGHT+IHwONa+JhNx4dio96T0pi5jX7gQn7L+kUedgzrY/88DyPg1TeMpxysV+irX79Ls6/3y0GlTjA==
X-Received: by 2002:a05:600c:ccc:b0:439:a1ce:5669 with SMTP id 5b1f17b1804b1-441ac890828mr11476225e9.5.1745939857335;
        Tue, 29 Apr 2025 08:17:37 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f8909sm167238875e9.2.2025.04.29.08.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 08:17:35 -0700 (PDT)
Message-ID: <c2d8374b-b623-447d-a695-3f2ead068265@linaro.org>
Date: Tue, 29 Apr 2025 17:17:33 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] arm64: dts: imx: Move Ethernet aliases out of SoC
 DTSI
To: Lucas Stach <l.stach@pengutronix.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, Francesco Dolcini <francesco@dolcini.it>,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
References: <20250425-dts-imx-aliases-ethernet-v1-0-15b9d5cca611@linaro.org>
 <e97d3388a5b4272d70d7379b020843a47874a104.camel@pengutronix.de>
 <c5538590-efe4-4b90-b291-6c429d8fa3fe@kernel.org>
 <06efb082c24176e6401265b4349b677468850f7d.camel@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <06efb082c24176e6401265b4349b677468850f7d.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/04/2025 17:13, Lucas Stach wrote:
> Am Dienstag, dem 29.04.2025 um 16:30 +0200 schrieb Krzysztof Kozlowski:
>> On 29/04/2025 11:39, Lucas Stach wrote:
>>> Hi Krzysztof,
>>>
>>> Am Freitag, dem 25.04.2025 um 21:48 +0200 schrieb Krzysztof Kozlowski:
>>>> Not tested on hardware.
>>>>
>>>> Ethernet interface, like other exposed interfaces, aliases depend on
>>>> actual board configuration, e.g. its labeling, thus aliases should be
>>>> defined per each board or each SoM.
>>>>
>>>> Some boards (e.g. Gateworks) follow this convention but many do not.
>>>>
>>>> This is continuation of my comments from:
>>>> https://lore.kernel.org/r/16a98816-f43c-4f4d-940e-9da30cb1f73f@kernel.org
>>>>
>>> The i.MX boards have traditionally listed aliases for many hardware
>>> peripherals with the same numbering that's used in the SoC reference
>>
>> ... which is not correct. Aliases should represent how boards are really
>> labeled, not how reference manual labels them.
>>
> While that is the commonly agreed interpretation today, I do not see
> any language in the DT spec itself or kernel Documentation/devicetree
> that would mandate aliases to be used in this way.
> 
> In fact there are examples to the contrary like
> Documentation/devicetree/bindings/serial/samsung_uart.yaml which says:
> "Each Samsung UART should have an alias [...] as specified by User's
> Manual of respective SoC."

And that is an ABI. Did I affect ABI here?

> 
> So I would argue that there is no hard line between correct/incorrect
> for the historical usage of the alias nodes on the i.MX platform.

There is. ABI is documented. There are things which turn out ABI, even
though they are not documented, like node names. Was there a problem
with refactoring these in NXP?

No.


> 
>>> manual. Boards always have the option to override those aliases if they
>>> have a good reason to do so, e.g. labeling on the physical device.
>>>
>>> Other users besides Linux rely on fixed numbering provided by the
>>> aliases. Both barebox and U-Boot number their ethernet interfaces
>>> according to the alias.
>>
>> And?
>>
> Some usecases depend on the aliases being the same between kernel and
> bootloader. Historically that has been guaranteed on the i.MX platform
> by the aliases in the SoC DTSI, when the board didn't have a need to

I know.

> change them. With this series applied some other users may now end up
> with missing aliases if the only include the DTSI.

Bring actual case, what is broken by this changeset.

> 
>>>
>>> While you seem to add back aliases for in-tree boards, this breaks the
>>> majority of boards that include the kernel DTSI from an out-of-tree
>>> board. I can understand that we can't always accommodate these users,
>>
>> This is not ABI, so every out of tree user is on their own.
> 
> I am not too sympathetic about out-of-tree users myself, but I don't
> think we should make their life harder deliberately.

We are making our life easier by maintaining and improving source code:
e.g. not creating fake aliases for devices which do not exist on given
board.


Best regards,
Krzysztof
