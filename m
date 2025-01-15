Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22D016DECB
	for <imx@lists.linux.dev>; Wed, 15 Jan 2025 16:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736960166; cv=none; b=rufqcitxx6GGY5EjOj4Znlkae7fRAb8KOjk6cZUauW0E9x073I1gHCT80zk6EAUmYeawvIemGbVzB6TMqsSmaRQID3JqTIciP4UZkCuA4K4kOoVjVEn2mY++i+jdf16yT4tBJTwQ/V2FxwTxOrmdK/AFRszhPzLMl4b+7/KRpdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736960166; c=relaxed/simple;
	bh=RSfkRbCWqIamZDO8E8ElkZP3AhnUl+QQuRPa3vEfpEw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eW7hhKEg+rzUCyNQx+JDp1XIkHdFSAJToACLTDAh2PJodk4sh5GpoH40RXLTFvbqClqvTDmKakcEFtMHD5d1LQi7Lg9qE0I1F3GKBTy4/THEp8ytO9ugPJz2CzDHBKRcyV/5DxCzPFTcoIpgaXW755V3jWbB6aaVm6GXfkzOTdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=p+3k0sQ8; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="p+3k0sQ8"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30036310158so74751fa.0
        for <imx@lists.linux.dev>; Wed, 15 Jan 2025 08:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736960162; x=1737564962; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdDOl+2ekFWaRdVJqcysp5umnfHOOWv97QkbmEKnRbk=;
        b=p+3k0sQ8Di3e1xwCcKYSCZhMvOst7zb1huzNem6E86GtX3BO/iaCVfzhwdLL3vSy4f
         H9wMYEkwiOtXXc05NHNHqfsn88/i64iS+EJ1jMSKA0dyV4LjueI3lYjsQ3MKrTVQ0g+9
         WQGJmU01eIBnjpKiFhc1yp+Z5Z87U4WewidtHYb4mvawV2KGQ9DIch3d9QeyTbz0kpSZ
         xtuNTmZfQoETjHJFpMi9/SD/Z8NvTNVqUXKSABmFLGGLLoXySXkdK9YhIY0ETkl+QRJ6
         5yxZwCIlYmaZXm2IbC1BPUN3o/4LimjL3W9/lPowNKm3DY4PcZzgZD01oUSsQG43RD2a
         YaOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736960162; x=1737564962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xdDOl+2ekFWaRdVJqcysp5umnfHOOWv97QkbmEKnRbk=;
        b=beZFahvYbE2SlDVNuAFhIfTor2ndTuo2zA7daEHq5yhxKWuxnF+P9k+IlhdBTJ8A7E
         UN+jAhgHqxvlWRIjf0xi9vvY+ixgj9f9+53AOgj8oANwbjO5nUqqSkicDAUASVIRfta9
         oXjnwEWxlYp2mfflNx4rj7hFseSDbT/58sa4JlcduQIB8vEqnKDnPd+tChOHi+m9Wr8u
         gg89Ao4tYfnyuSd6d8oE1i43UiPKmgy4/owWQmCBy4sKS27INm1PiTGqfgHqXv1GLL6e
         MAHBsmo0q4SJARTbtX5pouGlg1IwmhfaQbN0kfc6xrOuxPvCbmJywGfUT05M7Epn32iJ
         0hBQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+ga7G6XO9xgpdWEnmWrewkCVQ1Qi43gQW0EnBReo5HWvu6inKoK0zhcBzE5QvuLoUxak=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7w9MdRcJzifNwEHUhWjSkDZsk4Nc4xnQoc7ckiDCxO5ABUDEk
	FfdqPJDlA3Y8jNIMbQLrpufrPvMYlakTjgJEK4EAkZTaVa3VG2INN5CRcBqexqPrHMAAVYm7Vqe
	PXeq+3dP1bWE0dgZqEy8V1ji4W4LmRq2sIZYjAg==
X-Gm-Gg: ASbGncubMb6nDrAPePE8KpuNS3Nne4XIgaodJWmgty+xHz5Kle9UjjzQ1edFvcn9n+9
	zT+SsTdnso113pyR1+iA4TdVXO4akwrYnNRzWP0PfIpXktQ5GKvBti/tTcb7MmWwC8Qggvg==
X-Google-Smtp-Source: AGHT+IGVCtsxu4Nxc8II+Al+gawBhAtzB4MYz+9Ecl8oqi13xJMRfbsu1WNLIppYV5ME9m0nmbvdoGhE02xkVmEh7JE=
X-Received: by 2002:a05:651c:508:b0:302:2cdf:7fbb with SMTP id
 38308e7fff4ca-305f4531690mr91529781fa.6.1736960161839; Wed, 15 Jan 2025
 08:56:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250113-b4-imx-gpio-base-warning-v1-0-0a28731a5cf6@pengutronix.de>
 <20250113-b4-imx-gpio-base-warning-v1-3-0a28731a5cf6@pengutronix.de>
In-Reply-To: <20250113-b4-imx-gpio-base-warning-v1-3-0a28731a5cf6@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 15 Jan 2025 17:55:51 +0100
X-Gm-Features: AbW1kvYbGBKWyTqAigHygOqZRSa-0z8NaBAPzFESViEk5Er4NeXPKYxQ6sb6LgU
Message-ID: <CAMRc=MfZncRy_Qx_Yi_QjqX2cszv9X9st5Yk87Q7R3Hug2S9KQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpio: mxc: remove dead code after switch to DT-only
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Whitcroft <apw@canonical.com>, 
	Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dario Binacchi <dario.binacchi@amarulasolutions.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Catalin Popescu <catalin.popescu@leica-geosystems.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 11:19=E2=80=AFPM Ahmad Fatoum <a.fatoum@pengutronix=
.de> wrote:
>
> struct platform_device::id was only set by board code, but since i.MX
> became a devicetree-only platform, this will always be -1
> (PLATFORM_DEVID_NONE).
>
> Note: of_alias_get_id() returns a negative number on error and base
> treats all negative errors the same, so we need not add any additional
> error handling.
>
> Fixes: 0f2c7af45d7e ("gpio: mxc: Convert the driver to DT-only")
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  drivers/gpio/gpio-mxc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 4cb455b2bdee71ba4eb20c93567c3b8db100dbb2..619b6fb9d833a4bb94a93b420=
9f01b49ad1cbdb0 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -490,8 +490,7 @@ static int mxc_gpio_probe(struct platform_device *pde=
v)
>         port->gc.request =3D mxc_gpio_request;
>         port->gc.free =3D mxc_gpio_free;
>         port->gc.to_irq =3D mxc_gpio_to_irq;
> -       port->gc.base =3D (pdev->id < 0) ? of_alias_get_id(np, "gpio") * =
32 :
> -                                            pdev->id * 32;
> +       port->gc.base =3D of_alias_get_id(np, "gpio") * 32;
>
>         err =3D devm_gpiochip_add_data(&pdev->dev, &port->gc, port);
>         if (err)
>
> --
> 2.39.5
>

This looks like I can pick it up separately from the rest? Is that right?

Bart
