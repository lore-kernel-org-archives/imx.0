Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42221155A32
	for <imx@lists.linux.dev>; Wed, 21 Aug 2024 05:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724217197; cv=none; b=bB5zNlTiy1zVpmRcHPfw7L9VgWVOTYLkLXNz3wons0C/Kd/klXxfP92Ismp2t7R96gCm0AnbLpLDpY/W+aLrkQsunJdvfMF75Zp+xWHz395p8PpIy/3qTCHrvg8TiCHwedsrIiu72nu0E5KxpZ0hi6rUkIs1nIiiPkrfkkY05fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724217197; c=relaxed/simple;
	bh=Ew6twpKhHdsfTJITQO6Pu+V1ZRLtgHH7YjCR0wKtYtM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CdCjXjeGhtWbEbFtJvrxe2kA8kQ5lf48uM0Q2XNcBgGlxzu5+XOMzcZlBYEPnlf8USdv0h6aRr92W0SUOxgnZ/GmDsAXukM/tJw2Q1OKxU+DVd6mmGsLzDrRTkSLiOlMV86OvrY1PfsknPHwS4ojYjesS57klODpmdA2kRvELDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gf1lhRtK; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gf1lhRtK"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a7d26c2297eso715673066b.2
        for <imx@lists.linux.dev>; Tue, 20 Aug 2024 22:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724217194; x=1724821994; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTpscGSXiapfgInJdFUfK26eoAjrQMiQG2o80nXvv5c=;
        b=gf1lhRtKMJNMsW4GkMtrYUwgOXf37x3NwlQNi/HIaNbm4FSDz8cfWEzIzYmRr+TeK3
         b4a3wVycrjV+jAyT3cpG97yTQp+R34ebowtyQP7GPhctyw/RC9TOU9jD26LZ8foaVui4
         tpGWbl7RDFxUYcmMbp7stoaVlyg4q7Bakw3F9gWI4ZplYFQLcoiH7Mv3asShJZ/P3haw
         BeVtMMuMkIPY4tqQsfSOnXy6rvDmM0PH0K4zJBnoVhT/Qqnenqkhh89QutgxhHAK/Xgi
         T3cVX3sVOn7kdYmez5o+j204Ev8SU3QdustOUmJ3uy1wah8sYKfin7Me18dYo2RvYNE6
         y/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724217194; x=1724821994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTpscGSXiapfgInJdFUfK26eoAjrQMiQG2o80nXvv5c=;
        b=b51Ub1wZB8XNnSgDX7j8eTzQfMULKOuVkkdvz9jiE88pLP9vnqMog5H+sdygZq1MKc
         hTUFgnvrI3Z4CKFQmuHq4evxzTVeBq1BV3efMuctNnP7yIUSRNqIhMoRcA7HJH5KJ+6W
         bYBoroHE7crbA0bvMuzlq/P2IIN5e+SQwwBJZ+i4//wAWaRGmqULfCvAI6KPyaw/D+i+
         qeowKb52zJzwNZNFPIGMjOa49Hr3DRWm8yv6j5DcrQelnrqFtOSlYkh6Z+IEZ3hPGUcb
         CSHQpN1B/+dzTctceLUop7syUDQZmj5UQfLfznjZI+eQUMvmdjhEruSH/dLs2Vl4IySJ
         P+1w==
X-Forwarded-Encrypted: i=1; AJvYcCWCi6NwIA+Sa6AmjmGwB5LkxK0WWfJQhArS+8x2p9jGtCVKmc7Ojh0k/G6iXNehvCnsvD8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzwaG6X5JxxJKxeGrUVuFdovUGENqtq/I+PokBX0RDrZXfWBk/K
	KX2ZjpwmbDNlm7ejWGByHH0kACehLiwNyQOtiykY+Ytdxgr7ntLbS6rRaxGC3+lTAwlvJiOJSu3
	hNwnkwom8qcX1kPnCsG+sX3MJt7U=
X-Google-Smtp-Source: AGHT+IHZ9je7Q4wNIeQHcyNcnaJnhhnOodLilsyRMuSV1JE3fXLLki02TIaeEvqoYWw7EJtjaXhTvWijRC/VtLe64zk=
X-Received: by 2002:a17:907:f1d1:b0:a77:c0f5:69cc with SMTP id
 a640c23a62f3a-a866f8bf4f3mr92233966b.61.1724217194063; Tue, 20 Aug 2024
 22:13:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
 <CAOMZO5DiSvAG225poAoj9hHKioq9XSg_Y7kJ8PG66HEVo-SjMA@mail.gmail.com>
 <d3c5d73f-a756-4f35-97f1-9301529cce34@lunn.ch> <ZsUXEkc5A5IBLpJv@shell.armlinux.org.uk>
 <CAOMZO5CymmmUUhBrYwyCJ54sj=55wAVMqWpuYRbJOhoaroCUXA@mail.gmail.com> <CAOMZO5DUmw=PZ_v32Y_xkbOTkQiR-9BPmNH7992YSV0m3Yhbfw@mail.gmail.com>
In-Reply-To: <CAOMZO5DUmw=PZ_v32Y_xkbOTkQiR-9BPmNH7992YSV0m3Yhbfw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 21 Aug 2024 08:12:37 +0300
Message-ID: <CAHp75VfQx8TrCxV7KkrdsiNp63gYArJ=e2zy9__r8aCaXWW0Lg@mail.gmail.com>
Subject: Re: pca953x: Probing too early
To: Fabio Estevam <festevam@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, Oleksij Rempel <o.rempel@pengutronix.de>, andi.shyti@kernel.org, 
	linux-i2c <linux-i2c@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 3:50=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:
> On Tue, Aug 20, 2024 at 8:18=E2=80=AFPM Fabio Estevam <festevam@gmail.com=
> wrote:
>
> > The pca953x driver tries to write to the i2c-2 bus before i2c-2 is regi=
stered.
> >
> > This is the point I don't understand: how can the pca953x driver get
> > probed before its I2C bus parent?

It's just messages. The clients are getting probed inside the
adapter's probe phase.

> Disconsider what I wrote above.
>
> I'm trying to recover from the arbitration lost like this:
>
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -491,6 +491,8 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct
> *i2c_imx, int for_busy, bool a
>                 /* check for arbitration lost */
>                 if (temp & I2SR_IAL) {
>                         i2c_imx_clear_irq(i2c_imx, I2SR_IAL);
> +                       pr_err("******* Arbitration lost\n");
> +                       i2c_recover_bus(&i2c_imx->adapter);
>                         return -EAGAIN;
>                 }
>
> @@ -1487,6 +1489,7 @@ static int i2c_imx_probe(struct platform_device *pd=
ev)
>         i2c_imx->adapter.nr             =3D pdev->id;
>         i2c_imx->adapter.dev.of_node    =3D pdev->dev.of_node;
>         i2c_imx->base                   =3D base;
> +       i2c_imx->adapter.retries        =3D 5;
>         ACPI_COMPANION_SET(&i2c_imx->adapter.dev, ACPI_COMPANION(&pdev->d=
ev));
>
> but still get pca953x probe failure:
>
> [    1.756761] pca953x 2-0020: supply vcc not found, using dummy regulato=
r
> [    1.766564] pca953x 2-0020: using no AI
> [    1.775333] ******* Arbitration lost
> [    1.783811] ******* Arbitration lost
> [    1.793701] ******* Arbitration lost
> [    1.797455] ******* Arbitration lost
> [    1.801209] ******* Arbitration lost
> [    1.804964] ******* Arbitration lost
> [    1.808562] pca953x 2-0020: failed writing register
> [    1.813602] pca953x: probe of 2-0020 failed with error -11
> [    1.819222] i2c i2c-2: IMX I2C adapter registered

I think you should check that the adapter is powered on, to me it
sounds like you get 0xffffffff in temp or so.

--=20
With Best Regards,
Andy Shevchenko
