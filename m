Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC953290DB
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 04:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774501020; cv=none; b=OZox1Q0Jcg+/QJJTPKdtxZhEtsNEvYSviTe15d8E05By1dT9EkjZZjWQ/5IYggMyzkoHnkU6NMPsYBcK3Pc3UO+PF1brDHo0VOTHxLxC87pxkyh5PCW9YUIVaMYnt1Q1AI80UMA358Qqg0PYgBWJOTPipJhQQkvo9JQdLUs6CgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774501020; c=relaxed/simple;
	bh=3liW3TTczHbCWW6xyzTaD5p7Ee26sA2HpZbUQqz+dhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MOrpQH8hkGqWosrufjkmYcS+bUWi7SUMn5AgZR5OTfIdaiPUH0RqRixRLAYBqW31hzAwaXXPX1vVX9MdaWHMe7fjeH3vi9VsQD7vTFlGC40AmZx63LCD7ENP7DeCymOK79kd31IZ0GHNwu5t3i/ZxEriasnHkOFiek3bb0yYc0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zr52Gqkx; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zr52Gqkx"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c0bb213b16so1116114eec.0
        for <imx@lists.linux.dev>; Wed, 25 Mar 2026 21:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774501018; x=1775105818; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mdrREemxYfCx5YD4EhfvcYVTWQ7/gTjv0x5FHQxyZYY=;
        b=Zr52Gqkx5d5Yf+xnh6KeItwHvY3Wsk2KBTG1S8BUzfnNDnNC6qtHyWje8TIArG2f+E
         WW3O+cuEflRjpLpln4beTEWY9UIiPES4Fg/gEZBzSsuKd0VUQtR4lypK8PMcDJz41uBJ
         p1k76rrLa/UQ6T23IiuyEXeoYvics/f/rJ4VaxC/8e/mpVtiKxuqFETBmyITpfWTHSmF
         4nOrwbmf7l//WRIF9yNZb/vfl4YaTDCqOjMf5R/oQe4+F5DntW2wXYgiYfQXXdk4SPX8
         CpyC0Ebe/CNy1HQCMRmKJr+PJ2TyiMGmlpkpiVLhtGvgyXZh6RVrXsydBXOaPvPOclIe
         HaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774501018; x=1775105818;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdrREemxYfCx5YD4EhfvcYVTWQ7/gTjv0x5FHQxyZYY=;
        b=sDXDJI8MIX4gVkN+A5mFfQsgCpz6FU91eXh5Cd5FTMPdjnADEoN1c+SBzkwUDNr52p
         rr8XeWz6G4YyFpgUfgwE49htg5VGw9RPLlHnir3FgfjcrIj1OGYsqfgM9YLRfVwlYHTn
         Pom1kGO+EQw1CbhHC6tbXH9IcwqXN9DJowrrN7Vn7NUVIPfkOOYUzAXLNFnvC0TNcJoi
         avPdr5x2k1AvW+FegFhQIEHl7P8fNMWFkQ80TCqi9Gzu4S07cNLBnrYy+gPF5/dnkhUr
         M16OvA/m5J02Xz+4+GqVOJgof3eNb5b3xZqIEPziktYUfDS7ITuKAQlqhS2J3ASUSZPB
         ag+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFfchTwwNk5tjreKN1kvD4j9nJNlLJp1rvu8/iNDNztBuoRGJWSNqk+flwtU/MdnpqlOI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxs51lHwg4zZHyOvdmSuxJucQBVffTlGiEXt19zQeInxWANEyvs
	uk4+ybn0swIVx5hCM3c0BlHDKxCPk4lzwXSbz5P/GQzHJnjV5A9cEQxz
X-Gm-Gg: ATEYQzxrOXeIHiSgRYHcKJGTes57jxPD0fC/3ac6ceJ/uWTg6KJi6qHpo08iJEJdy6V
	i3sTiogYfQbFbsndJTEjksUEZh1lrqwAzjfvNDziqK6KPmRMvadgm1pDvwQnYEBnlSvawSoC/if
	m4IouWxoLZKQjI+oKxZIHvKE6HQFzk0khFEVyRnRU+m7Wl8Tczc+fvZypXEVqMrh+T4HlzCiVJS
	xHn6wj2RZ4WlW7f2/creLSGJfx0b8/O3Q/jpygCczMhkfCnGs8Nyz6C1xuDKuTo8A/545H+5qVr
	3zcfYi6gbrmayrISy9eQJWH7gSnzUkgUMBjsItCfUlO8FN40x1ZczLRkwI/6/tgZ/wS3LsvkLYJ
	OQbLH9REXHOca/fqI5aPH/L+wHfcea6kTnc9ERrir+SX2e9N1ig39P3IxeUFMzGDe11gXkbx5RS
	5NqN7qSveRlkhkKRoTNMTOY8spy8kGimKGBPGIq6g2K+HpvNe8Wo2ygsfZxwCyyFArww6f8bul
X-Received: by 2002:a05:7300:430e:b0:2be:9989:331e with SMTP id 5a478bee46e88-2c15d2805admr3224190eec.2.1774501018257;
        Wed, 25 Mar 2026 21:56:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16edc0458sm1635295eec.21.2026.03.25.21.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 21:56:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <478e7388-f91e-4e26-bc47-eef4ec5b1c1f@roeck-us.net>
Date: Wed, 25 Mar 2026 21:56:55 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add support for AAEON SRG-IMX8P MCU
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?B?SsOpcsOpbWllIERhdXRoZXJpYmVz?= <jeremie.dautheribes@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260324-dev-b4-aaeon-mcu-driver-v4-0-afb011df4794@bootlin.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260324-dev-b4-aaeon-mcu-driver-v4-0-afb011df4794@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 3/24/26 12:24, Thomas Perrot (Schneider Electric) wrote:
> This patch series introduces support for the AAEON SRG-IMX8P embedded
> controller (MCU). The MCU is connected via I2C and provides GPIO and
> watchdog functionality for the SRG-IMX8P board.
> 
> The series includes:
> - Device tree binding for the MFD driver
> - MFD driver that serves as the core driver for the MCU
> - GPIO driver implementing the GPIO functionality
> - Watchdog driver for system monitoring
> - MAINTAINERS entry for the new drivers
> 
> The drivers follow the standard Linux kernel subsystem patterns, with
> the MFD driver registering the sub-devices (GPIO and watchdog) which
> are then handled by their respective subsystem drivers.
> 
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>

Sashiko reports a number of issues with this series.

https://sashiko.dev/#/patchset/20260324-dev-b4-aaeon-mcu-driver-v4-0-afb011df4794%40bootlin.com

I can not comment on the non-watchdog concerns, even though the ones I looked at
seem to be valid. However, please address the watchdog subsystem related comments.
If functionality such as CONFIG_WATCHDOG_NOWAYOUT is explicitly not supported,
please add the rationale as comment into the driver.

Thanks,
Guenter

