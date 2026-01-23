Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8B0283FC5
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 13:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769176585; cv=pass; b=jbp8tJYXRcG+TBwtHm9bpkzyoyqVEGYRduRBWuezlvxGA+Mo3GXFpgCh6jsQhZ8ZUS1Y1lueU+4TdVG+okuC8rfe5xo5IHNqSotO7mvoaJ5neqR3eTbzJy0Gpk46SM0yMn3vjE4I69SEa3kE50emfvVAdCCAkswTJuCBIdCub6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769176585; c=relaxed/simple;
	bh=aR8CpMb+s+EUHAjDGHaj1AO5m1hEQkCbg+lElZIdMAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=so28ngx643D8I7KfKjkUZHcTcfrfR5JjEHUhUfSqpGngxOWqLKvHPntbFZsose2m0s38sVJepKEHOuKiqgD8Jv3kIFpm1KAPzf5oawPsM7Iss6umpiJ7q8cs4Ion+2xRpX/qwsxNp44+RXGLc1JIbRcnT1YKt92JmVuInKb4B+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wCtw47tF; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wCtw47tF"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-65807298140so3665482a12.2
        for <imx@lists.linux.dev>; Fri, 23 Jan 2026 05:56:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769176581; cv=none;
        d=google.com; s=arc-20240605;
        b=d8sLg3itfIWZQAdARuRiydin8haFmlCo2Tz1VKuNFyYXQZx+tjAoEDU++g4HyTGIWr
         Sb7w+ENHQYywS4Gd8w3STtzJJJdxBasUiQYOTp+/M9iMdhVFq+rCE5EGY3xPsqil00zW
         rDIvCCvlyYaGwVl6suA1k06cvC7RxSOpjVsEo+0nJi6TXKnJk8cNua+exJnCx1zmerTR
         GPkOsg9Lcbw2C6DBQXk794sW+oT/+NMt1mqUhfqtPenfaoOgFO+HV2Al6gqd8bElVsD5
         5ppfmzIeGOyxqn3n2dVualPe1DhjM7uPV1kvZRHgEJTzGz4nQl7+PPh9ZtkYKhcHDsee
         u0QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MV9DSpmK7zSE3yOlg4auKxgIt8uc1vwlHVSaE0w/qMY=;
        fh=af3ZpckfTH9jbWX2LoCL+kJpmReqd9qGJ+1Zg0J7GBk=;
        b=iygCFadFnmUHu2SYIxiRP8EwHd7g2HV2dj0ap81BXpt9VBRYJxT65Qa5PcTSmZcjDJ
         cgHy52iR++hak7+0KtFUbzrH4bCUxF3CJGP0Wd06CtDhcfPqeAk0DjnpxA2FbTrJmJIg
         ZibM4CN70mAnt27tvqiZ3mstFu+kQKtTtSchzBUsuQ0c6EHFU7KmsuTDYjgX6aRSifC5
         jvn9ANf7lc8fgRq4GVCHkkGycS2ZlnU1sIN/2a3eotcO7dALPYrYy5KwagwVRLJltmER
         UybIQJKEsuLQ9vVvooNVf9IHjQDdoa8mBZoT1yDxtZA7o47/XYsNJ02OHycDXh5za9Mm
         6+xQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769176581; x=1769781381; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MV9DSpmK7zSE3yOlg4auKxgIt8uc1vwlHVSaE0w/qMY=;
        b=wCtw47tFLKPGeITPm/dyFLoaL+DJDSfMte8M5oL41OidKD73IXw4fGsrrEW6qrV7ut
         UVFRR85FzumleVZJJRnXqWzg3tZmcvBl9TcifOPQJvV8xU4P/o2RtWimephUINRxhlIu
         AAdcr19k/Xjzl77bXmdMCrmjXLr+NXAB8s7YT1jQMS1QdteC8qGWEubBYr6IdAow+Thm
         tFPRlZRK5MeP7WRiebK/AWaSU75HVTgBpFVfK4hCmnafUfA0seaNIUW6dzdEK562JROf
         3noRvPCkw4jYJMn6Pisc224yb8M11X7mGVQiLFzEK8tl5EnBwZb2WjhhHBV+aN0pYfK6
         v6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769176581; x=1769781381;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MV9DSpmK7zSE3yOlg4auKxgIt8uc1vwlHVSaE0w/qMY=;
        b=sqDYl0faRaTjirqNQAhGGleoRCTbaLCi/ovk+G4hyCViSLDvIqLMk7CeeTEWkbB2jl
         7jklXEelqEFhcgCHMN80fGpP/7+A6SEhyEltH3P+mX2eTSLc16MgFlTy55GnLjynf/iS
         6n8atUFgSKj242qEPGwGsL/MXrCvg2QM6Gu+5dZYOYOFocJ5kJdO1WHEM9Qmx0ZnB7YJ
         N8S30M7zQUS25+u4cUz+ty48UvrXu6nD4vsK4aYXadzrKtMtQo9mMf1hi5WMWXDYIXJ5
         26CMv/zCRUPF3/53nD0J5P8cZOKrlThtF4Sdj08IvlrpgFWDKBvZthci9G+xUyARuzKx
         Pelg==
X-Forwarded-Encrypted: i=1; AJvYcCW8A4lMkwUDYyyEsprLaPTwaytWDDmPckZj3idF1WXagvcWHkF2zcEMlHX5WKha17ZcOuI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9lGOPehv7O3sd3GGmQ78iXeTC1zybt+IxRPd6Thj98UxY3hXv
	OZG6iXQ2nCIxu1IyA4T/M9V0A8o7KHgVq0ciwQCmEYbXozOyJShgO/J//A2bmY2CeXLnltPcIZY
	tfNjKiHYgGcAFWIz4c+2vbjf0Mmt4g0DP4Ebbm9cYIQ==
X-Gm-Gg: AZuq6aJBYBmMoT0lxy2D1bXiLtHv2oYxeyMNKot2ZCL4fOF6kQic+st8MrkNcqGmduu
	k51fLUNJfUpAcqALkhgW7qlHxUx0GJ9bkax5V/88LhSQYfREz7ydkZg9RhRd+Ex+0SaA9gHv1S0
	hkP2ldCxWyL5KvKrUaLdQloJgUWwiScr2AsdDvF3SHGCtmAsg6glmB9GpIVQGFdVA5OweGUbcGq
	wsVy4ebzEgqxUKv6L7tHwStKvcqRM1eRkA8U3DPBUGQiQoQ9BUaq2Ncs58gq1TaMqzlIFW8vCOv
	xJcCsfy4mxH9zbJtbqJkNo9Y
X-Received: by 2002:a05:6402:35cb:b0:64d:e1c:4c0a with SMTP id
 4fb4d7f45d1cf-6584868efb4mr2064138a12.0.1769176581281; Fri, 23 Jan 2026
 05:56:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com> <20260120115923.3463866-9-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260120115923.3463866-9-khristineandreea.barbulescu@oss.nxp.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 23 Jan 2026 14:56:09 +0100
X-Gm-Features: AZwV_QitT_JBj7lN6X8pXiBMkI1LXoq3ivXbG1n_-sBl-TpYf_jVZTRwjJZibTg
Message-ID: <CAKfTPtBCmwL3fpQuWp12HST9Nud583+QUs_BNBA48z9xRbcf9g@mail.gmail.com>
Subject: Re: [PATCH v8 08/10] pinctrl: s32cc: implement GPIO functionality
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
> Add basic GPIO functionality (request, free, get, set) for the existing
> pinctrl SIUL2 driver since the hardware for pinctrl&GPIO is tightly
> coupled.
>
> Also, remove pinmux_ops which are no longer needed.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

[..]

> @@ -1068,5 +1318,42 @@ int s32_pinctrl_probe(struct platform_device *pdev,
>
>         dev_info(&pdev->dev, "Initialized S32 pinctrl driver\n");
>
> +
> +       /* Legacy bindings only cover pinctrl functionality. */
> +       if (soc_data->legacy)
> +               return 0;
> +
> +       mfd = dev_get_drvdata(pdev->dev.parent);
> +       if (!mfd)
> +               return dev_err_probe(&pdev->dev, -EINVAL, "Invalid parent!\n");
> +
> +       gc = &ipctl->gc;
> +       gc->parent = &pdev->dev;
> +       gc->label = dev_name(&pdev->dev);
> +       gc->base = -1;
> +       /* In some cases, there is a gap between the SIUL GPIOs. */
> +       gc->ngpio = mfd->siul2[mfd->num_siul2 - 1].gpio_base +
> +                   mfd->siul2[mfd->num_siul2 - 1].gpio_num;
> +       ret = s32_gpio_populate_names(&pdev->dev, ipctl);
> +       if (ret)
> +               return ret;
> +
> +       gc->set = s32_gpio_set;
> +       gc->get = s32_gpio_get;
> +       gc->set_config = gpiochip_generic_config;
> +       gc->request = s32_gpio_request;
> +       gc->free = s32_gpio_free;
> +       gc->direction_output = s32_gpio_dir_out;
> +       gc->direction_input = s32_gpio_dir_in;
> +       gc->get_direction = s32_gpio_get_dir;
> +       gc->init_valid_mask = s32_init_valid_mask;
> +
> +       ret = devm_gpiochip_add_data(&pdev->dev, gc, ipctl);

Your mfd child device doesn't have a DT node, only its parent has one.
How do you point to the gpio controller in DT with a phandle ?

You probably need to create a child DT node


> +       if (ret)
> +               return dev_err_probe(&pdev->dev, ret,
> +                                    "Unable to add gpiochip\n");
> +
> +       dev_info(&pdev->dev, "Initialized s32 GPIO functionality\n");
> +
>         return 0;
>  }
> --
> 2.50.1
>
