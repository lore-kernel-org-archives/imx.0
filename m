Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBE57B
	for <imx@lists.linux.dev>; Wed, 15 Feb 2023 08:29:47 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id s21so1332411uac.13
        for <imx@lists.linux.dev>; Wed, 15 Feb 2023 00:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FXSI5E+3HvE6BYqHUHdzgDWtPGtSlXeME4AX7iotPWY=;
        b=eMqKPTBZcGtq+ABL3ek1LxQUWDBIoO+kWpBdqjZE8z9N4TIEUEPL6VidC5wHfiIVDa
         VFUdPROmFShkuyqqvvZa4ZgrLHVFa0/H98CvEPiY1dTNlbbK5JxH7QSEUym9vNob59Tr
         AAB5K2JuSQm0l5rJxLXpLKIKes4bFIK/1t9mVlsiQFiAQNsI43nD2yuEWyIT1mMYbvPn
         mEm80WqSl/A0HBcT6fUg0wfa3+sFnMyz0XyXpJVDfSlo2ZQfMekE/T9MaYehA9/Pt5T2
         /C70d6gZ0bZTEofzof7/Fjk+3UkfIZua0uCzITBsQpnJ7idT8K49c3T/YLi+7/TE2JbB
         nlkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FXSI5E+3HvE6BYqHUHdzgDWtPGtSlXeME4AX7iotPWY=;
        b=FyMlyCOIZYkh949+3EkRA3krUqqxsKPO6olkXRRFLqtjWIr+F8XNaZxt4By9Mze0MQ
         MsX5/crbZshFLxDhTO2Vtdp00Gy4jCkFEModa5aiXzFIFK6LlOifim2ru41W33NGY7qV
         lfMNCHMtzUetbSrIS7lVT0EpVGHtmOOMOem2wzZxQHrZVUzDCpRRlK4a9L58GmSlORNY
         iJ1utCbrIKRuudfA7fPrKPECQ/3PMttkQI8CTh4wynP5H5WYG8l6ayHQ+t+eY+/e55IA
         YbncG0pN9aQb4LX5wrcxok9KGHx4wDMf5gn/MC98vNxxmCRItWMxbszQPUEhxKFX5i5y
         jtUw==
X-Gm-Message-State: AO0yUKW2MSFpzKjTGZejvoR74a3NykeqCwssmZw90AIYVGGS1JKtt1oE
	fyKEye/h5CwNIIGrpnPWzxo9W0WgJm/c79vjAwQp1x6qM/lpl4Dz
X-Google-Smtp-Source: AK7set/wOEKEM8x4UYollg4KJQQP4EGoy6F8kT5TGE7GywLwIdPiGDrNXiA0jX0JuHOPcsHW/TmCPUwYOhet75U92k0=
X-Received: by 2002:ab0:654d:0:b0:68a:7054:58a6 with SMTP id
 x13-20020ab0654d000000b0068a705458a6mr170019uap.22.1676449786783; Wed, 15 Feb
 2023 00:29:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230214224642.3804927-1-shenwei.wang@nxp.com>
In-Reply-To: <20230214224642.3804927-1-shenwei.wang@nxp.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 15 Feb 2023 09:29:36 +0100
Message-ID: <CAMRc=Mfv-fQPa6Sz9jQ-2BgcZkAsTN=T6UKKnLUUs=exRHiZsA@mail.gmail.com>
Subject: Re: [PATCH 1/1] gpio: mxc: remove static allocation of GPIO base
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 14, 2023 at 11:47 PM Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
> The latest gpio driver framework will give the following warning
> when it detects the static allocation of the GPIO bases.
>
> "[    1.329312] gpio gpiochip0: Static allocation of GPIO base is
> deprecated, use dynamic allocation."
>
> This patch removes the static allocation of GPIO base to get rid
> of the warning message.
>
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  drivers/gpio/gpio-mxc.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index d5626c572d24..07948175441c 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -450,8 +450,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
>         port->gc.request = gpiochip_generic_request;
>         port->gc.free = gpiochip_generic_free;
>         port->gc.to_irq = mxc_gpio_to_irq;
> -       port->gc.base = (pdev->id < 0) ? of_alias_get_id(np, "gpio") * 32 :
> -                                            pdev->id * 32;
>
>         err = devm_gpiochip_add_data(&pdev->dev, &port->gc, port);
>         if (err)
> --
> 2.34.1
>

This is one of the drivers for which we can't do it yet:
https://lore.kernel.org/linux-gpio/20230120104647.nwki4silrtd7bt3w@pengutronix.de/

Bart
