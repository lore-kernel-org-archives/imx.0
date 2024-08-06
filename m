Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FE53A268
	for <imx@lists.linux.dev>; Tue,  6 Aug 2024 16:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722962660; cv=none; b=J9uBy1K/GdULrvZVnlK057nhpuvepaY3hhvefTGWUJKZBJh4mNfZji3R3sZbRSYrnYkQ7Wqos4jQouazHl3RXg22ObTemHUf4K1prHa/Vc8jbbKAxZa64+GTdlhmotT+HauHdPqBcbIVinF/s/4ssBhGVbEgOQJXxYIMos67dCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722962660; c=relaxed/simple;
	bh=LH2Uy8/PpAWYUaMMR8gc2ewziMO8ttQJx9j92qR3+kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BK3ZCyMnQyjeMUIhcRIPS868PTf1XkSpWdlJRTm/Z9Evj1YSJEklv+cx1RWVrGC7KHr4Ht5EPWUoyOobrv98R1zgqsdd0IIVVf6bdmR5680Lk88sKeRA+07Z1yxOiRNxHdGpqhzauxIbd1igKYYRD6HDr6C42SQvQ21ZCxVYHCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c126AiqU; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c126AiqU"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fc6ee64512so7255635ad.0
        for <imx@lists.linux.dev>; Tue, 06 Aug 2024 09:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722962658; x=1723567458; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6u4tA8v4x0UysMy3fqtmnndZc1v59YAMyuI5VmHB8EI=;
        b=c126AiqUKtu4IA9MmyrbhPk3puLL5jCUgAJhH/A9R6UHpbhPfoZPaLL5Tabtft3NvH
         TTOMJxWedBmnFVSihcF8TLtU/G/P8uGUiDESzclKI8mtXh4Y1AYOqxw8jb7ZtqXFF++B
         n7QSMaGQX/F03p83CVOMZy+kV5MnJk1w/ebSkk5ugnrBWGXwn9VppyzhctqMCJqo+0hL
         TxTrszKUVZUUVY4PI5Imqw+o/aVDj3cm+RTKV9zSK1BLmaE4rwf+LLcP6cocfE3NFGLR
         iopjU+01B/8EKgL64eXEyZRtygFeDTUXCccs57SiPmwdeU9P97ZaYvBvMNtLDmpZTPSG
         cwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722962658; x=1723567458;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6u4tA8v4x0UysMy3fqtmnndZc1v59YAMyuI5VmHB8EI=;
        b=CDe8RUa8eovLkz2ZBJvjVDYZXnaHHuR08GtnM/orZpcDvmmI2pI/DifhhEtNZZfURD
         EMrQCMEiGAlINYGPJcb0zfTQVkL8V7y1vlPigl9sOSv0Gq++AdIEl4ZXuYWf9W6S7BIq
         lOP8SiVSWuuNuc9oMk9/iuq6zmEp89SpUtVTCI5/0ZHpSByQuR2gGn9UsV3piGwnDrSc
         PAZ+DpRldAeHHUwMX2Ol1KdeFIP8LqCSx8fub8N+0cjDcPC+pGDu0RhBkw/ofz0+90yj
         BB6G8KbC2MjxPgqe2EUf5ZoK8lnAlHl48cVY2QnhNlfuFXFQNPa8Tc1cCRUuHf2Fq2sM
         iTsA==
X-Forwarded-Encrypted: i=1; AJvYcCXSYneRzGx4JvheNv7MoOSiewGsq9sBzrrc0gNppMmip0IGFto/+WZDfqUbR1VU12op3zFq8b4zyvQSosZLHV39ZQji
X-Gm-Message-State: AOJu0YyO1g4b6ZpqkBMcxw4S17JsrpLwz/ktlAQKwR4Uf0ua1X9wa0Rz
	uCFl+b3ws9E+XWwVZT6DuAV6oJ6zpMrBgQBHX2aybXzRRaresKNp
X-Google-Smtp-Source: AGHT+IGlhBaOVnvK/UiaEh93n4akX8Vh1cO4RIxT7xtBfOk9/XMFLy9mmBdPQF4JA5iob/CTIDnaVg==
X-Received: by 2002:a17:902:ecc1:b0:1fb:4194:5b78 with SMTP id d9443c01a7336-1ff57462826mr164166625ad.47.1722962658135;
        Tue, 06 Aug 2024 09:44:18 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff592ad9e4sm89259485ad.283.2024.08.06.09.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 09:44:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a03c0609-cc13-457b-84ec-5880fc553bd8@roeck-us.net>
Date: Tue, 6 Aug 2024 09:44:16 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: watchdog: fsl-imx-wdt: Add missing
 'big-endian' property
To: Frank Li <Frank.li@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Animesh Agarwal <animeshagarwal28@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240806103819.10890-1-animeshagarwal28@gmail.com>
 <39e9fc4a-64f7-4695-bfd2-1f77740714c3@kernel.org>
 <ZrJGFk8+tgukCeGg@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZrJGFk8+tgukCeGg@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/6/24 08:49, Frank Li wrote:
> On Tue, Aug 06, 2024 at 12:43:07PM +0200, Krzysztof Kozlowski wrote:
>> On 06/08/2024 12:38, Animesh Agarwal wrote:
>>> Add missing big-endian property in watchdog/fsl-imx-wdt.yaml schema.
>>> This fixes dtbs_check errors.
>>>
>>> Cc: Daniel Baluta <daniel.baluta@nxp.com>
>>> Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
>>> ---
>>> There are 12 similar errors related to this missing property from
>>> different blobs.
>>>
>>> ./arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: watchdog@2ad0000:
>>> Unevaluated properties are not allowed ('big-endian' was unexpected)from
>>> schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>>> ---
>>
>> Not sure if this is correct. I mean, technically it is, but Frank Li was
>> removing big-endian properties so please choose consistent approach.
> 
> drivers/watchdog/imx2_wdt.c never parser big-endian. I suggest remove
> big-endian in dts file. I suggest keep big-endian only if it really used.
> 

Agreed.

Guenter

