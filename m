Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE1928CF42
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 13:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769176694; cv=pass; b=BKFgtBcAj3AWLynqxHLFq7m8amp9xinMIBywTnM3xh6g7sAJ5CuOakVFFzLiPJN1keMDGAoa0++xzq/OWDzascicrLGIAJ7kpHqA7RuFpfR/6GS7GgqVB9GNvq8wnu1urnO4hv7D/lUBTNGAuXeg7mStxeRzyq0rjt+tRfNO9V4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769176694; c=relaxed/simple;
	bh=H3K7Y1UUd5FzBZWnAK5FQmEqy8Onwx/IMpxiGXi9tXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XVIkDq5ZSXcJImB4aA9C4JYNq1Y4bVdRJ34sqfAmNWVYfLTPrU1p/Yql8sB9mc2YGfFzKE1H8sXc21ZVkI/SJFwlAh9Yw6Adav/fcxwWyjvJQO18nmDXBYW/4Fy/T4FSeYCG8cb9C4PW4hJ0lrXCtDC86jXcEyLeZUZB/veR5iI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pXWj6FZE; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pXWj6FZE"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6505d141d02so3273265a12.3
        for <imx@lists.linux.dev>; Fri, 23 Jan 2026 05:58:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769176691; cv=none;
        d=google.com; s=arc-20240605;
        b=bjRgnETtfETyCcqPgxR+EK9jRtIwj80CLJ6LTOHZtnvdHheCQ87nDnrRxS7sHR5vrT
         qNNYYY4YldJUkiEcE/LWc5nR5l6KODjzbW/oDVDTcRJ4zww8Bjm34O0LQOMG7xTEOOnK
         HCmnlaJfuyTIPlGxzkLTqQjsYNtTY8LRtMmuR1iFO8sRSOUYDaRXJRvumi6OT44wdr0g
         yOxSJrf/Z/KMOTExr8/sRqPCRrgnjAFhcAIdVImSux1bhIXluPfcqTUdb5WttFIP0/fX
         6fJ2RWxthfIYP14m5jb5wW02C18SPAUOkqYwIiTPvnXnK0ZI/8JBiV0CVAC9hp2wormE
         po0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GGE0nuYpaKQHKtQZCEQ7uetRNJ215gHEdrxyGaPgKyU=;
        fh=rrBXEjh+3nYVRErgfoVX8PQG9cUNKO95i2GlllT8qpU=;
        b=LLgsuYgVEI8McfDBLmzx1Fx80e45LWTNKEi37XvBSqJUzFgVM0ninxjp/RiP9NQFtu
         9ZjK6UzcODaua6vQbOHG52cyJLsAqmEIWewlnVtpXoAkZqX0R7dHnKeZTuv7dtlZBlrf
         o8dSj9ePSVEQ9uJOl6eyVgrlsTtZXQMsz0zYNpz6UiuiZEkac0ppFuJbzZZJf9XdRVEC
         KhRdsaYDMl4htt+QxaosvEFjkJoIDvQFEs0nv7YAh3CfR8Nw0ugHBhSs0+16J1i+aADG
         rdYR+EkIg3rPk9i+cjwYZ/2Z+I+IdxDosaQR18hX4YIYEyEa7Mm9hvVaNZLLjwOFdOun
         lqAA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769176691; x=1769781491; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GGE0nuYpaKQHKtQZCEQ7uetRNJ215gHEdrxyGaPgKyU=;
        b=pXWj6FZE3cGuwmy6XlrbQD7F/5x1ZbGq6BfPVrasnGTXG2Baah3nXA4wNVli+iFwYY
         ug+rvjOjcUYBL+JITK7QcxSZcgj0t/6nWewVeiPX6XS/ApA4Jzlp9lH0P7N6D1uNeaGN
         ddF7JEcaIJyDdCvqjE5tMrXVggSOO1b4VBYbb0+Pj6YPNHEguvcYIIbOf1uUZuTk9K3A
         dYGwhK29N5d8c+1JjdQtMraK4WKPiH+mlLr7Qqg5yRkdU21sUl+lRgC6Dg3WFwoomxyp
         NsTWUAjumWF/XVIxuJDXxUN+0988ng//Em8k282AA3geCLoPP2p8x4PSVB7J40sfUSSA
         8sjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769176691; x=1769781491;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGE0nuYpaKQHKtQZCEQ7uetRNJ215gHEdrxyGaPgKyU=;
        b=ZUbTmjtSfWOBweSjlDsUUGhSXq5mzS5sBxkiaPuWqoau2UfuaOYoTxhg7x/hkuFQPf
         rKQxxXCwyCXpohOid2vZDLy1xx0n7aZ6l78PAXNnc3KILSZp3XuHwTQFVjGBPt/t51nw
         53U919HygezjTcJke0+INFnpiWtYk2Y6BoAU4XPsYjDVnKCjOiIhfafu4YpUZHFbZkrO
         KQyP2yAZYu+ApBsqT2rpm4l8G789TT8ZbkICDEkfg8l5VzS06n0NUgRPHX73NPjNFWGq
         4VbJ7jqjEQCbj2AC8trlCgwAYeZmNjCY8BkKU7CUOv3HjnsOsSzjV9e7eMbiIv9UiJav
         6Qxw==
X-Forwarded-Encrypted: i=1; AJvYcCU0Pnyvcsb5tY8L2aEWv3kum8TfHXZCWRrbA7ik+/JvA5HQlS0DZZbMzpcoq4OIOhSxO7k=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6NWIf0ijOakS7kO7Ttn567xRHm1fuDI37hAfHmKB3FPnrl+4k
	p0Z63i9tLwkafFabpO7GQ4KPQWKmHnVLyiakTKIyxPecZD9nieg1f2LPYwWhhk4C9YjJvcSZ3CV
	VGLZflff4buBfEUlOsdOMJu5MYCRe/4L0mMm1A3oFPQ==
X-Gm-Gg: AZuq6aLGQ4ugBOCqRJ9BreHG+hfk5ME/SLnqjr/nGS3P/7HWW3sqUd+49RJ36ehFGyl
	EdWVYzbazfnqOgxeWLXBwGkle8Huv9qo6QD8K7EI7rUCDaiHsrL1mNzf6iOB7X6c4R5fO3s8dNX
	j1BiO7Ea64idncsSx8QI9KjWB0CxjHIojKpgVPtvk5cC3eCP2X6jLH8fdHoKEZA+SwWqiU+bw20
	l9LUDB1kPglOCDBzTXoq/5Bi9UUWhEWXQmuJx/GOHLmxhVwE8zAVUVHDdtwVIVzIiyYjzqR51fF
	9NB20uCC8vXWn36XCk+wc5EG
X-Received: by 2002:a05:6402:144b:b0:64d:4a01:fc23 with SMTP id
 4fb4d7f45d1cf-65848762170mr2202436a12.10.1769176691377; Fri, 23 Jan 2026
 05:58:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com> <20260120115923.3463866-7-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260120115923.3463866-7-khristineandreea.barbulescu@oss.nxp.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 23 Jan 2026 14:57:58 +0100
X-Gm-Features: AZwV_QiAQsZA5zBmebv7whc3eQu-e3v4RPd4MoMEVVMDs04rAsUL7nt2fdX8y_w
Message-ID: <CAKfTPtD6LOMFGhzG3dhiSQCNbYrGLjBiT83eqz9mmwaDVpNV=w@mail.gmail.com>
Subject: Re: [PATCH v8 06/10] pinctrl: s32g2: change the driver to also be
 probed as an MFD cell
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Jan 2026 at 12:59, Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:
>
> From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>
> The old pinctrl bindings for SIUL2 are deprecated by a previous commit.
> The new bindings for the SIUL2 represent it as an MFD device:
> - one cell for combined pinctrl&GPIO
> - two cella acting as syscon providers for SoC registers access
>
> This commit allows the existing driver to also be probed as an MFD cell.
> The changes only impact the way the driver initializes the regmaps for
> accessing MSCR and IMCR registers.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>

[..]

> @@ -969,12 +1017,28 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>         s32_pinctrl_desc->confops = &s32_pinconf_ops;
>         s32_pinctrl_desc->owner = THIS_MODULE;
>
> +       ipctl->regions = devm_kcalloc(&pdev->dev, soc_data->mem_regions,
> +                                     sizeof(*ipctl->regions), GFP_KERNEL);
> +       if (!ipctl->regions)
> +               return -ENOMEM;
> +
> +       ipctl->legacy = soc_data->legacy;
> +       if (soc_data->legacy)
> +               ret = legacy_s32_pinctrl_regmap_init(pdev, ipctl);
> +       else
> +               ret = s32_pinctrl_mfd_regmap_init(pdev, ipctl);
> +
> +       if (ret)
> +               return dev_err_probe(&pdev->dev, ret,
> +                                    "Failed to init driver regmap!\n");
> +
>         ret = s32_pinctrl_probe_dt(pdev, ipctl);
>         if (ret)
>                 return dev_err_probe(&pdev->dev, ret,
>                                      "Fail to probe dt properties\n");
>
> -       ret = devm_pinctrl_register_and_init(&pdev->dev, s32_pinctrl_desc,
> +       ret = devm_pinctrl_register_and_init(s32_get_dev(ipctl),

you should better add a child node for your pinctrl mfd device in its
"nxp,s32g2-siul2" parent instead of registering the pinctrl device on
the parent device. This would fix phandle to gpio too



> +                                            s32_pinctrl_desc,
>                                              ipctl, &ipctl->pctl);
>         if (ret)
>                 return dev_err_probe(&pdev->dev, ret,
> diff --git a/drivers/pinctrl/nxp/pinctrl-s32g2.c b/drivers/pinctrl/nxp/pinctrl-s32g2.c
> index c49d28793b69..2d56ffb1a109 100644
> --- a/drivers/pinctrl/nxp/pinctrl-s32g2.c
> +++ b/drivers/pinctrl/nxp/pinctrl-s32g2.c
> @@ -3,7 +3,7 @@
>   * NXP S32G pinctrl driver
>   *
>   * Copyright 2015-2016 Freescale Semiconductor, Inc.
> - * Copyright 2017-2018, 2020-2022 NXP
> + * Copyright 2017-2018, 2020-2022, 2024-2025 NXP
>   * Copyright (C) 2022 SUSE LLC
>   */
>
> @@ -762,7 +762,7 @@ static const struct pinctrl_pin_desc s32_pinctrl_pads_siul2[] = {
>         S32_PINCTRL_PIN(S32G_IMCR_SIUL_EIRQ31),
>  };
>
> -static const struct s32_pin_range s32_pin_ranges_siul2[] = {
> +static const struct s32_pin_range legacy_s32_pin_ranges_siul2[] = {
>         /* MSCR pin ID ranges */
>         S32_PIN_RANGE(0, 101),
>         S32_PIN_RANGE(112, 122),
> @@ -773,27 +773,47 @@ static const struct s32_pin_range s32_pin_ranges_siul2[] = {
>         S32_PIN_RANGE(942, 1007),
>  };
>
> -static const struct s32_pinctrl_soc_data s32_pinctrl_data = {
> +static const struct s32_pinctrl_soc_data legacy_s32_pinctrl_data = {
>         .pins = s32_pinctrl_pads_siul2,
>         .npins = ARRAY_SIZE(s32_pinctrl_pads_siul2),
> -       .mem_pin_ranges = s32_pin_ranges_siul2,
> -       .mem_regions = ARRAY_SIZE(s32_pin_ranges_siul2),
> +       .mem_pin_ranges = legacy_s32_pin_ranges_siul2,
> +       .mem_regions = ARRAY_SIZE(legacy_s32_pin_ranges_siul2),
> +       .legacy = true,
>  };
>
>  static const struct of_device_id s32_pinctrl_of_match[] = {
>         {
>                 .compatible = "nxp,s32g2-siul2-pinctrl",
> -               .data = &s32_pinctrl_data,
> +               .data = &legacy_s32_pinctrl_data,
>         },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, s32_pinctrl_of_match);
>
> +static const struct s32_pin_range s32_pin_ranges_siul2[] = {
> +       /* MSCR pin ID ranges */
> +       S32_PIN_RANGE(0, 101),
> +       S32_PIN_RANGE(112, 190),
> +       /* IMCR pin ID ranges */
> +       S32_PIN_RANGE(512, 595),
> +       S32_PIN_RANGE(631, 1007),
> +};
> +
> +static const struct s32_pinctrl_soc_data s32_pinctrl_data = {
> +       .pins = s32_pinctrl_pads_siul2,
> +       .npins = ARRAY_SIZE(s32_pinctrl_pads_siul2),
> +       .mem_pin_ranges = s32_pin_ranges_siul2,
> +       .mem_regions = ARRAY_SIZE(s32_pin_ranges_siul2),
> +       .legacy = false,
> +};
> +
>  static int s32g_pinctrl_probe(struct platform_device *pdev)
>  {
>         const struct s32_pinctrl_soc_data *soc_data;
>
>         soc_data = of_device_get_match_data(&pdev->dev);
> +       if (!soc_data)
> +               soc_data = &s32_pinctrl_data;
>
>         return s32_pinctrl_probe(pdev, soc_data);
>  }
> --
> 2.50.1
>
