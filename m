Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02797200132
	for <imx@lists.linux.dev>; Wed, 27 Nov 2024 23:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732749205; cv=none; b=nAc0wXzgjcEyJL6xhNPWhOwQhMk4PbKZC0Qph+uLqwgYDH8cZ57IwzQkuOm4KTA3qfPIzLaiCgKMimHv7OxTxNEbp88EzTiWqhFE8+wiulDIhzG/4d6UqePKkL5xxzQ4kZXKu9T3FOy8quYqF4z3MamA7LetCIhseQqAqWVQILQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732749205; c=relaxed/simple;
	bh=rU5wIufCy4uiJARVkNiuAv8jatzDOSwqt8P25tk9a1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HXhgh+0XlfOPTvX2gDT1mGkd2VZy9ih4nKjLSwNSi/Y/Hu2/WBmJEbgCPcd1R69ZtrWwL0WKTDPVH+Z+Nnu/kUIYUxqLiFDZltjSsDOgS4op1RU4BDMstTxwuCm9BTIKbFyscUyvuMAC/oRE+QUnVvwQApA9kHi/ilMxOjy6l7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UvDViRjt; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvDViRjt"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7f71f2b1370so112993a12.1
        for <imx@lists.linux.dev>; Wed, 27 Nov 2024 15:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732749203; x=1733354003; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Ym7l4wP9jm33rMK8hq7Dojc9huneQPkXTHv2AKyJM8=;
        b=UvDViRjtlP7gqnrb2j/OipE3c8z2/S3ayOx82u3UKKv/A5j4+vKmAJC8kSpTxpLygT
         ftfK8dhZVL48iaa4VhvQgM/dTIOhw2JJ1yG/d3XcQxZeI0uf8UU6G2QvHLmxXvIzE40H
         nGvdUfOh4JtwCZjUVB+wIz2+/nZXctJA4QZ6bLOqhiIIjt+iAMTeTtwI5FIpFg8oyQSN
         c0JiM4iXDAXVgIY0s9PO53B3sJI0dL2ktrQLLOhxYz0fCm6zOfKyfFOZ2hH29/pjiEWJ
         qMRmigVZP9mcU7FFHtfU5+mIW2ssOt2swtj+8whsLkPW4YqtCAL+vcGTz5fosY0jMN4g
         9Ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732749203; x=1733354003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Ym7l4wP9jm33rMK8hq7Dojc9huneQPkXTHv2AKyJM8=;
        b=MCuXDhTFE3AnoxMPOvO2Y57Mv2D75qBe20XAXKdGZ8GUwArjI/IsyNNOYCRwgf82I/
         1Bz+6dwYNCxX+w+f1GWk5OUyNLPPfI0h568kRNnmLgPh4KfTTmnm27PRs+GOk48wQV4G
         ag/s214oWNJWWK3NAkbg/9P0ixtbUfq3qDD2GnVBxgic0p5WtAc+qExHnbbSEaVak6Uv
         OATsMlJou2wmpbaqhI635S/3pvlTOfwRHTdO+U059aFt3GnqG7cOcLyVZdGLH63ZNZ84
         iR/0DhdbdTedIYkggK+EmHLMF/J9PVhYRrB7v8cwe4LbZXgvC1qbe4zjZUjjlP6Nf/8W
         +x6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTkMWmKXar0OR4PQ4PSeb6IjKtpNBF3kH+VDNM6EE1+7U1rEuU0lz1ZoL9pOLxx+3LEt4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHd5fdcoE57GMTrYMOWGXOkhj6NneIzc9QF2S5SISG0uYjBlWK
	QpeA8tIA6i6dcuW2O1vxCPamAsu/8I0KCXvkibE+zcEkED93tldc
X-Gm-Gg: ASbGncsnJRRMzUUB9qhgXlICtihnX+EnJ+GFIZnqiNh/kqp9eoKEcM0ChR3okH3p4t4
	mQYJy/lEWSxae2Ydo5m42Bx5GmM/7CX7pyWgwhVvC8zHvolgd3WgpwQUpiX3p2wrilPvqwICR4X
	opM6DuhpAv4ZRaPlDS5E5JzPFk44+zUsbVRXRLrJa6l3C5EqnxiI9VQ/blvg6QjdgfQi3q0IMuj
	AH7ccq77U4b3MUwCBXVAwbfuUZpQc9oqyet9IsYsiSa2X+H6025/FSeAVuC99o=
X-Google-Smtp-Source: AGHT+IE5q1S2MINZEvwdh0rBuph7heoy1wo1HGVrVW7vPzA/G9lPkX+dnmrQTdS6lAjOf0bFbomyig==
X-Received: by 2002:a05:6a20:a111:b0:1db:ff57:562b with SMTP id adf61e73a8af0-1e0e0b88dffmr10479085637.31.1732749203191;
        Wed, 27 Nov 2024 15:13:23 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176121asm114591b3a.39.2024.11.27.15.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 15:13:22 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 27 Nov 2024 15:13:21 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, linux@armlinux.org.uk, s.hauer@pengutronix.de,
	linus.walleij@linaro.org, esben@geanix.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	arnd@arndb.de, Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH v2] ARM: imx: Re-introduce the PINCTRL selection
Message-ID: <85db9cc6-f1c2-4159-a826-f90b97b59a89@roeck-us.net>
References: <20241127190605.1367157-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127190605.1367157-1-festevam@gmail.com>

On Wed, Nov 27, 2024 at 04:06:05PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Since commit 17d210018914 ("ARM: imx: Allow user to disable pinctrl"),
> the CONFIG_PINCTRL option is no longer implicitly selected, causing
> several i.MX SoC pinctrl drivers no longer getting selected by default.
> 
> This causes boot regressions on the ARMv4, ARMv5, ARMv6 and ARMv7
> i.MX SoCs.
> 
> Fix it by selecting CONFIG_PINCTRL as before.
> 
> This defeats the purpose of 7d210018914 ("ARM: imx: Allow user to disable
> pinctrl"), but it is the less invasive fix for the boot regressions.
> 
> The attempt to build Layerscape without pinctrl can still be explored
> later as suggested by Arnd:
> 
> "Overall, my best advice here is still to not change the way
> i.MX pinctrl works at all, but just fix Layerscape to not depend
> on i.MX. The reason for the 'select' here is clearly that the
> i.MX machines would fail to boot without pinctrl, and changing
> that because of Layerscape seems backwards."
> 
> Fixes: 17d210018914 ("ARM: imx: Allow user to disable pinctrl")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/linux-arm-kernel/49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net/
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changes since v1:
> - Reintroduce "select PINCTRL" as a minimal fix for 6.13-rc.
> 
>  arch/arm/mach-imx/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
> index e4fe059cd861..dc47b2312127 100644
> --- a/arch/arm/mach-imx/Kconfig
> +++ b/arch/arm/mach-imx/Kconfig
> @@ -6,6 +6,7 @@ menuconfig ARCH_MXC
>  	select CLKSRC_IMX_GPT
>  	select GENERIC_IRQ_CHIP
>  	select GPIOLIB
> +	select PINCTRL
>  	select PM_OPP if PM
>  	select SOC_BUS
>  	select SRAM
> -- 
> 2.34.1
> 
