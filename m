Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B522040A2
	for <imx@lists.linux.dev>; Tue, 29 Oct 2024 09:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730195414; cv=none; b=kjLc/VU4Nv1LMDCN5YdnElg7fY7GbopbeZourxypIRlaxGX0fbx7pqmXE56qmZ3YjhFmJyK4Qd0EB52j6TjT8RonDy7Bb4JdYksmjb5VRypbEwKzxQHXFmngYuDslf+nWdZzpMXEzSyJM9q1C2/940OZsVgMSFtju6CPjw/jV/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730195414; c=relaxed/simple;
	bh=blGrvXyQ8dgv2iLCBmQDJQg8SgYY1wWYY9FXFSGskY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aTCLyV9QB0P8Dw2oKYf0ewfNVwVb1L03Gt2aHssFqIkvXe+RISUvJFJgYCCbZlkzXjrHsmBuKczxO4cVI2aYmKTdqmMqwc15ajd8ras5Bq7swZ17J69adJVrPegeK1nGPwYIr2Ao8mGzZzMD8Eu/yRR+gb5yDQ50iuRSR7SDDQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LHYGG5Om; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LHYGG5Om"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37d4c1b1455so3393534f8f.3
        for <imx@lists.linux.dev>; Tue, 29 Oct 2024 02:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730195410; x=1730800210; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OoTvBOrAuRYQReshFO2dNXUuJfaDJJsaTs/Pc/IWOP8=;
        b=LHYGG5OmOqjgmvy6KyhIi/S5j+YbMMggr1y1fb2+2FHC4ew/MZACr979qLcPtvfiTy
         Tp04LIAAxtClTFmnf8Z5h6zd+0Jvl8JypSSwK9yA6DNN/h7lfcdqjnhaMwOrHUum7+vk
         M4DHiyO8Lxhrs3aX+IC5D/vYcJ2mqpQ7vrAPicv/vem0piPbP76AQyKgHgsKxxPbuPyf
         uiMYGPJ4qftORdrUaiMh2twVruTUNqDXI1+2jAalqGt3EgveaF/lP6f2cRjjae2dOp6N
         kSNTV3GDns8kVTgFhV3+UmWNlqfFB1m+9ytHZC8/e9KkrPzoC+YxBQkMPli4W/gIzaoB
         YkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730195410; x=1730800210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OoTvBOrAuRYQReshFO2dNXUuJfaDJJsaTs/Pc/IWOP8=;
        b=HvuWCBMVD8a3sNt1utgRrAsZql4hUsRypRPt+yf9m7KRJmbA3KUvsds7Zgv0CYe5pX
         9IoZ5Bz3sH1yrCAerc2ymRWwhpVIHIcdzgVHhxiAXJlYcd8vKXYMtQGf12vmUlpB3flO
         /kFs/yJQSSFsWqBX/4CHCnoOnpscU15LEAeJkQCcF02Z4fTF5DREKDGEm4KpYxEa/N4b
         6H9tbDc3F3aYOF82rf1CjZeWHoPj4H1PLu3srykHe4EOGp+KDDfVGDzxvxZW+ResY/9L
         cCnO43yRDyIGth2fUz4g52K3FsXewdOM/ygJ76HJBVu8Bf4aTYEG7YUHUI2V9SYMJewg
         WHVg==
X-Forwarded-Encrypted: i=1; AJvYcCWSe4L7vYNloCp33NM22rwePYBTbRyANIUIUVOE/xPzKF1Wx1H6vlB5TPspvIqqEOYHoaE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyTyBr5cn0/0lGCv6jjMU00R1c5nCjKKeGtquQcxjlaaDdrbhW2
	lb3N6wHzhYlWsXg1wKjiHxAJxXTUm+Igzwv0pB0o0u6uya87bBi9MmV/CkBx9pU=
X-Google-Smtp-Source: AGHT+IG8XiDibHrJEMH96PoQ8A9rLpt+HJm76xNOeHtTIaWfK/6v5TMKsOr0lvl5ZC2cOMzvQ499EQ==
X-Received: by 2002:a5d:66c8:0:b0:374:b6f3:728d with SMTP id ffacd0b85a97d-380611f48c7mr8065520f8f.46.1730195410305;
        Tue, 29 Oct 2024 02:50:10 -0700 (PDT)
Received: from [192.168.0.157] ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b47952sm11897956f8f.48.2024.10.29.02.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 02:50:09 -0700 (PDT)
Message-ID: <58142044-b232-48d6-8c98-7a0ac0fab099@linaro.org>
Date: Tue, 29 Oct 2024 09:50:07 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] mtd: spi-nor: support vcc-supply regulator
To: Michael Walle <mwalle@kernel.org>, Marc Kleine-Budde
 <mkl@pengutronix.de>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 Marco Felsch <m.felsch@pengutronix.de>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Pratyush Yadav <pratyush@kernel.org>
References: <20240930-spi-v2-0-ed7f6bcbe0df@nxp.com>
 <20240930-spi-v2-2-ed7f6bcbe0df@nxp.com>
 <20240930-wonderful-wealthy-aardwolf-b455d6-mkl@pengutronix.de>
 <20240930-amaranth-stallion-of-fantasy-67701d-mkl@pengutronix.de>
 <D4PERKZ4GL6B.1WKA1I3MYSQVL@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <D4PERKZ4GL6B.1WKA1I3MYSQVL@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/7/24 8:50 AM, Michael Walle wrote:
> Hi,
> 
>>>> +	ret = devm_regulator_get_enable(dev, "vcc");
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>
>>> What happens if the SPI-NOR doesn't have a "vcc" regulator?
>>
>> ...the SPI-NOR will use the dummy regulator.
> 
> Which then prints a warning "using dummy regulator". Is that the
> usual way to go?
> I mean the regulator is actually mandatory because it is the main
> voltage rail for the flash. To get rid of the warning one can add a
> fixed-regulator (which is correct anyway). But OTOH, the device tree

I think it's fine to have the warning. It will help people write a
better device tree.

> lists it as optional (marking it as required isn't an option either
> because virtually all device trees won't have that property).
> 
> -michael
