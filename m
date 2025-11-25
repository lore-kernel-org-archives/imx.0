Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6A82ED15D
	for <imx@lists.linux.dev>; Tue, 25 Nov 2025 09:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764064778; cv=none; b=LA+GZN5pRWAZ+PFHjjae2/g4ACGle2ZzlnDu8QL0d+DszccuOIqzGInUBAiylTVL0f9u0qeLuclhb3c9k4nkqOXb8wdL4ZoT+p9Zqu0kbGihGNgeEDoG8eO7PLp2ivqFlRvWkIpZ/0RnObpQiSjaxB0bBVT7WLN6ZaCaZdXz42M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764064778; c=relaxed/simple;
	bh=R6QMB1wFC2BATzYNPhRuQ8QidzB6qeV3IovdUk/YQTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=prbbWbjgEtas4Lq7+WClxdZ8m2HXh73WZLDFbxWkVP1hVgqT62gv4KRbivrvZKPiw18U+u4mSbthRknq1mhHjCKbl/KULWBXh62J2mxQHajIczWbdUdquk7qLdEtlJovkt3DBBzQmCdF9B1v7pTS8qkxwBXorMi7+J+gY3NmnoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJegff/K; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJegff/K"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b736cd741c1so927849566b.0
        for <imx@lists.linux.dev>; Tue, 25 Nov 2025 01:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764064775; x=1764669575; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fgh4ODFDnXgu6g2WTTqzK1hFnk5Jr1ZOv10EVLwZMBY=;
        b=NJegff/KIDe+a9zAAyuGpH+OdgqlcnUupqRna6leVN3BKXB4aq7/+NVrPbPY/2ivwX
         F4RdyyZzPRSLZsyH5mORn4YvOP25utnqqgSyrf+vNG3bt8GsrAd2upeybpZvqjT3mfgF
         r3ou/kJkQcsq1eGeHwUKckWrJRWTao//mpeIJCpCub+zioKHJ/JooX8u2HqpbhzEMRLN
         SLIGafZqkd1P1ab/gEn/8x8Bz8lXSULVwc3wKMjoPgCD1/HXDw6vDypXEMPUnQsKZsi4
         gCVrTU9g/BU5UCW8Swdmvt2LqexHsEFA3iOndvSzeULwTJmIipftPqUeZ9X300+ajMFj
         tOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764064775; x=1764669575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fgh4ODFDnXgu6g2WTTqzK1hFnk5Jr1ZOv10EVLwZMBY=;
        b=lmdvZCBTB98LU2BwzzgdVtLqzxQq/mbRvW5z4cOLEpZt2oCAsPwaWINOZFJJwkpgEs
         f0Cu423wEAV4EXfx6/FGFbSoF8UAsMe+LDjs3v19jgC/QC5pzbDeeV6IwSIifOPgbNKi
         cmj70H34ndP0A6WZIJBk6KCT5qrfv8SbsQgXjjLuIJVIzHLHfNhecEKOaZpSHSPnseam
         hPVNORG7oIo/sSIJV4/x53Saz2Wz5vnXkixBHqz64ayy/VEQKy0XC0GZbIAnec3Mt8+4
         n0kz9HeWhSL1JEUd6wcOJec/fvideMgkPAyqZwMFRqEH9mEpLCtCSETjwqIUM4SVJU7R
         v7VA==
X-Forwarded-Encrypted: i=1; AJvYcCV4KBs5Gog2l3BelllOc9Geob1sa50T7d6xfCY8S1vqt5rlsxHznNc7tCHaTFHL4x4YJA0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzP7SH97qmjauUF7T3Cc9n8/LEZMK/cyBgpS3ickOlNg+TvZSeP
	aT3KQitct5iu65mDTVXpAr1uze9vGd707yO+fcu/bco71DPBQbPhAb+Y
X-Gm-Gg: ASbGncuGfkefD3iZ8Sw4WB6K2GLHwEeBgl2ekbNg5D4ow9mytJwvaOgW8wCZyMz8aGN
	PbNCrXqxYx2Jk1Axe9H+FRKl8qVlW39be3VWVdlt9QcQ8yjfdiImz/NE11YgsanFOib2WywGUcx
	HCfkifoKNZFj5LyVV1qlSHfAY/7PXTXUsatYWnxF0AjNGMF69y3cmyOEoR65HGTBsFHoSVZg/LN
	gcYe/zK7ZYa/1Kik0Bmc93ui0KsO0EtBMct7slF0ktwGOPpZ8AsGbtuQm8o+g9EWiVTNxPmssUY
	o1RR+w0Yi8zi4GPV+U3Fn2esAl4utqiMYLo2efjjBnwHsl0Gr2OaY1zlYLplwkhJfAMdEy+ilax
	1byGbXxGEZp0xK5GN1/Kw9IaiOhYxjH3Qr4TYZihhKWh/ag2RLl+OTXzooBa6JjDw/yS/H8x6T7
	FQtl0FnW32nIR2Mri+k85pDpiiK+wLSxgXr1NPOROC9ZM=
X-Google-Smtp-Source: AGHT+IESxJDwS/BJ1YU+rQ3vBeFJBP5tEOROc8lHgEyTp+47bod8zHWxWQ5jr9upDauFLWFNyK0Ddg==
X-Received: by 2002:a17:907:3daa:b0:b73:57eb:688 with SMTP id a640c23a62f3a-b767183c4b1mr1636055866b.53.1764064774524;
        Tue, 25 Nov 2025 01:59:34 -0800 (PST)
Received: from [10.25.216.228] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd51fbsm1498870766b.33.2025.11.25.01.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 01:59:34 -0800 (PST)
Message-ID: <4a022153-009c-44fd-8c4b-39819ae69390@gmail.com>
Date: Tue, 25 Nov 2025 01:59:31 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] reset: imx8mp-audiomix: Replace mask with bit
 index
To: Frank Li <Frank.li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
 <20251114133738.1762-3-laurentiumihalcea111@gmail.com>
 <aSCHjNqj3CV3ahX0@lizhi-Precision-Tower-5810>
 <6be8a682-6c72-45c8-be0e-880ab66045ff@gmail.com>
 <aSR8q5cE/XXbZuF0@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <aSR8q5cE/XXbZuF0@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/24/2025 7:41 AM, Frank Li wrote:
> On Mon, Nov 24, 2025 at 01:28:32AM -0800, Laurentiu Mihalcea wrote:
>> On 11/21/2025 7:38 AM, Frank Li wrote:
>>> On Fri, Nov 14, 2025 at 05:37:34AM -0800, Laurentiu Mihalcea wrote:
>>>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>>>
>>>> Replace the reset map mask with the bit index to make it clear that all
>>>> reset lines are managed by exactly 1 bit.
>>> I don't think there are benefit because I met some periphal need a magic
>>> number to reset.
>>
>> Please provide more information. What SoC? Which peripherals? What block control?
>>
> I can't reminder exact one. I grep some code
>
> [IMX8MP_MEDIABLK_PD_LCDIF_1] = {
>                 .name = "mediablk-lcdif-1",
>                 .clk_names = (const char *[]){ "disp1", "apb", "axi", },
>                 .num_clks = 3,
>                 .gpc_name = "lcdif1",
>                 .rst_mask = BIT(4) | BIT(5) | BIT(23),
>                 .clk_mask = BIT(4) | BIT(5) | BIT(23),
>                 .path_names = (const char *[]){"lcdif-rd", "lcdif-wr"},
>                 .num_paths = 2,
>         },
>
> mask is more extenable and easily support more hardware in future. Change
> to bit number have not big benefit.


sure, I'm fine with the mask-based approach. The big idea here is to make this driver

usable in as many scenarios as possible.


Philipp, please let me know if you're okay with the proposal. Will also have to tweak

one of the subsequent patches since, so far, we've been operating under the assumption

that reset lines are 1 bit.

