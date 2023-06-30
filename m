Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012BA1FB8
	for <imx@lists.linux.dev>; Fri, 30 Jun 2023 09:20:06 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-51d946d2634so1791413a12.3
        for <imx@lists.linux.dev>; Fri, 30 Jun 2023 02:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688116805; x=1690708805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G18F6df4riglz+fx97D6+kt+RmpbWgrWAbSyMwVzsm0=;
        b=ojXkqEC0msA4chNgXH2YHjLThDShIype4X1kuSDJ2o7u+csr7+UticsvL5Zy9kD1N5
         zHj/Lq2aUIxwuJHxNZz6zgUEzNBXJTaEIXk6rYqv+7qAJQfUIv0Xvhqnf9kANF7evGEb
         mphCrJBwz+Cd+j3s8NBpLD9HNswUzwNW+OXqHopKYctWXQV+FkDm8pY3ebD2xLDGMNa5
         1gLz2uDpwPaGS82KXaDxg2VLVIpzIu7EfFOA/po9Zp2Qt8JktwwM02gxuuylSoff61Q6
         XWJqSrrxHE9DxwgSeYnulgHQ2jl3uwa2tS5aqf+jN/XowCRjDX3AeE8tBofeXFyOIl+w
         msWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688116805; x=1690708805;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G18F6df4riglz+fx97D6+kt+RmpbWgrWAbSyMwVzsm0=;
        b=J4hch8QW0wquYfw+A2sh6CjAUq4sMUuKzOoiP4dzEHQ+dY1Wlcjeibj/G3Z6y0N49g
         dr8XsGYf3Cjou+X/DPgSi2or+S1kUHQ61ZcFnI6pxAkapE2Ixli1hYsatCst2YHho0lS
         iRJQ/NdzLXRy/BQ4ydDHYPs/2N01pgGfDT7fKVDLqCY4ORbvvClkC0VM6StEgYJlH8p9
         5UgHrmqvczl4vqdirQ5cAt/mRg0u6sfMz+CeDx7t6muck/S6Qlkin8el6GgGtHzH8SqH
         SbNl3M0w0I/6y/p7E/hlbrBatiFd7leKgk8vb50yrD38yuBlp1KdFd+g7L7OaJXjryw0
         Fm0Q==
X-Gm-Message-State: ABy/qLa9v86xYrUuwkUmu8uHSCPgCpA3U9nxcHyjTRw9Pw1m9afbHhdg
	onl9N/LS1Zl/vHef8cB5FVoWhFnICT8ezhizAbU=
X-Google-Smtp-Source: APBJJlHgQeCVylikI3fQ5zY8/heMfDFu2Rml+z4kI9yX7xzHJjeYASkt8h8KugK7sEkZY24oF/3TuMxrrl+0w3T4yCk=
X-Received: by 2002:aa7:cf91:0:b0:51d:a24c:db20 with SMTP id
 z17-20020aa7cf91000000b0051da24cdb20mr1369137edx.18.1688116804567; Fri, 30
 Jun 2023 02:20:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230629191903.2423243-1-shenwei.wang@nxp.com>
In-Reply-To: <20230629191903.2423243-1-shenwei.wang@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 30 Jun 2023 12:19:27 +0300
Message-ID: <CAHp75Vc5JFrh1HqYQca9BcYALQfVD6A-kHgmc5OpwtvcGC4beA@mail.gmail.com>
Subject: Re: [PATCH] gpio: mxc: add runtime pm support
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 29, 2023 at 10:19=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com=
> wrote:
>
> Adds runtime PM support and allow the GPIO controller to enter
> into runtime suspend automatically when not in use to save power.
> However, it will automatically resume and enable clocks when a
> GPIO or IRQ is requested.

...

> +static int mxc_gpio_request(struct gpio_chip *chip, unsigned int offset)
> +{
> +       int ret;
> +
> +       ret =3D gpiochip_generic_request(chip, offset);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D pm_runtime_get_sync(chip->parent);

reference count disbalance here.

> +       return ret < 0 ? ret : 0;
> +}
> +
> +static void mxc_gpio_free(struct gpio_chip *chip, unsigned int offset)
> +{
> +       gpiochip_generic_free(chip, offset);
> +       pm_runtime_put(chip->parent);
> +}

So, you want to have this to track the amount of GPIO lines requested, righ=
t?
Calling PM runtime after the first request makes little sense.

But here is the question: does your controller support wake from IRQ?

Have you tried to see if the lines that are used for IRQ with
gpiod_to_irq() really work with this?

...

> +       err =3D pm_runtime_get_sync(&pdev->dev);
> +       if (err < 0)

reference count leak here.

> +               goto out_pm_dis;


> +static int __maybe_unused mxc_gpio_runtime_suspend(struct device *dev)

Please, no __maybe_unused. Use new PM macros for that.

> +{
> +       struct platform_device *pdev =3D to_platform_device(dev);
> +       struct mxc_gpio_port *port =3D platform_get_drvdata(pdev);

What's wrong with dev_get_drvdata()?

> +       mxc_gpio_save_regs(port);
> +       clk_disable_unprepare(port->clk);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused mxc_gpio_runtime_resume(struct device *dev)
> +{

Same comments as per above function.

> +}

...

Personal view on this is that it makes little sense to do and is prone
to subtle bugs with wake sources or other, not so obvious, uses of the
GPIO lines. Can you provide the numbers of the current dissipation if
the controller is on and no line is requested? Also is there any real
example of hardware (existing DTS) that has no GPIO in use?

--=20
With Best Regards,
Andy Shevchenko
