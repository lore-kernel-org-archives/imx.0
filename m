Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A8739B4BB
	for <imx@lists.linux.dev>; Tue, 17 Mar 2026 08:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773736587; cv=none; b=bmCWBVmUBhnMFxJDhZAf8RXV/TIumegpI2HPtimP1LZXBgKnes03zFg8SiRuBNTdSWwegBXFrm8DcXxhh/vTw31MK5oK8QCx5JKKfSidQle6XwZeS7T6vSmkw5ezp2x+xvuDQwIvcWfBKjJXjPLIY0F6ZMPyAMQBprxVkcQm2jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773736587; c=relaxed/simple;
	bh=1IbAI1LF70M+Kjw+h3BaLZwBsh7cf418N6PFDl+oOnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g/tGwwyAJJaNVpy2Jbc+wnqoCK9C+yVvO4Np+Sq886W+HllSaOTiBgvkzsh7aez5d77yDIOm9kv3a74bxVN5v9MlxlWolSizbcpWZuzGIY7ltrHbv5Bzlb4JpkfPK5inruJbjyiuzdN9RkYYKMzfvbagi7rEgsKsCfVls0A+bfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56b7043c97eso972491e0c.1
        for <imx@lists.linux.dev>; Tue, 17 Mar 2026 01:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773736585; x=1774341385;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idH2bB7nbOzzZw2WFTC74GwVow5g1kiitlzGsuFZK5o=;
        b=J4cwRYZ+Xj9uUTcBEPXsvqaAuR3HXZ+PRtKtgLpLIIgeUHhpcsMrWob6OyPk3IunTH
         sCi9gdsAoRKmhQp1wcN8B6OVLmbmz47Dq02Dte62q7hL9WPH/g8HVw59BdACxF/kGsz1
         zlw8NGIt3CMj2oHc0pLHIY4H9+RrzXk3MLvvMAix5ljNOUehhtq3JI8UYT4K+NCOS+SO
         IHcrjrna6f6t3Kx9YR2hLyQIjw86r8xDpKZedq45ZJx/owshi/S3i+zLqIX7GxIbYiFR
         IhvWuqDxtpgLMLpA8aUnGIQgA10/3d0V4euTT9/8cx4ATKaGJZS3sI4ne15bceIU03+k
         IyrA==
X-Forwarded-Encrypted: i=1; AJvYcCWvUCGh8IkCAnuwrOlnlA9+WtpAySbPj28ot6whzPpZcVGkG8VVnmGYjFlAuiWmCAxGhgY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxDfzTH8uU0fqN03k2xjzWx6V+R8B1oY/s0XZF/Aj/KZrDjxpS
	Bmln/t+2278RRhMbZ+qDMkPlxwTBM2en4Qbo+oZpUQX5Y2lC/74SWa4rKa/QyK/I
X-Gm-Gg: ATEYQzwXbMhthjsRjlDRlgdC2GdvdxvWMHCE4+tUn0rnePkUBZB5EEyQi2H5bt83xmj
	kNbkesak2zChSM3wEo1BetMQWukPl55G/ytrhsPIp2vLCNEEJCtVsnWlDV2FfRJrC+ncAJVXh0s
	qn6jYgRPUo1SAUWgQu+0a/hnMGrBIOchrfFGH9of33NEjX/0gNcngXhJC1XIsFWbnl9o6QCI8Xk
	YNqfSxN5bo7X7x/P2r+tB6b6c530aHPV83q2eNzrdu9qT8j+KL8lVHRQ3aJ5OuDVva8jF4OUi54
	GCUBBs1YgPyoCi1HIJt4Et06/5u8OtUH1yWqn+zYWycfD0Y3K/+FYeB7TxwYmgLFq/5lMh+IcMq
	AgcWtUNf7VRUEQPXYoBi16B4rwElaRVv24AuzECIM0iz2OtTwKFowkmBGzJCK5lB83Y074nFNGM
	cX7t2UKiKu0lpmfXj8xwTz70EuolsU/sNNA2NSqF3X5vZOyvsd2ihxmvFjunzI
X-Received: by 2002:a05:6122:2919:b0:56b:f8e:6b2f with SMTP id 71dfb90a1353d-56b629aa1d4mr5530119e0c.16.1773736584887;
        Tue, 17 Mar 2026 01:36:24 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b84300190sm3095522e0c.18.2026.03.17.01.36.24
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 01:36:24 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5ffc6a96665so1416887137.0
        for <imx@lists.linux.dev>; Tue, 17 Mar 2026 01:36:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU6LkKLZt8eG1rfVNH5FVCJQsA88GTvAMF6nrzDGwPFN30WEzIhh3XgEzLlb+ffwa51u60=@lists.linux.dev
X-Received: by 2002:a05:6102:5127:b0:5ff:2569:cfe7 with SMTP id
 ada2fe7eead31-6020e2129e6mr6024902137.10.1773736584585; Tue, 17 Mar 2026
 01:36:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260303115720.48783-1-dakr@kernel.org> <20260303115720.48783-5-dakr@kernel.org>
 <DH4M3DJ4P58T.1BGVAVXN71Z09@kernel.org>
In-Reply-To: <DH4M3DJ4P58T.1BGVAVXN71Z09@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Mar 2026 09:36:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=hfK82_QKXL=n-nMos-HjScKuw9jNTy4xsxJ2qnPYyA@mail.gmail.com>
X-Gm-Features: AaiRm50LJFP1R3ITAUSRjqb1napf13plX5N5KjefHP89RPorlF5H9VKuGn2urAs
Message-ID: <CAMuHMdW=hfK82_QKXL=n-nMos-HjScKuw9jNTy4xsxJ2qnPYyA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] driver core: platform: use generic driver_override infrastructure
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	abelvesa@kernel.org, srini@kernel.org, s.nawrocki@samsung.com, 
	nuno.sa@analog.com, brgl@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Danilo,

On Tue, 17 Mar 2026 at 00:57, Danilo Krummrich <dakr@kernel.org> wrote:
> On Tue Mar 3, 2026 at 12:53 PM CET, Danilo Krummrich wrote:
> > diff --git a/arch/sh/drivers/platform_early.c b/arch/sh/drivers/platform_early.c
> > index 143747c45206..3cd17bb0be67 100644
> > --- a/arch/sh/drivers/platform_early.c
> > +++ b/arch/sh/drivers/platform_early.c
> > @@ -25,10 +25,12 @@ static int platform_match(struct device *dev, struct device_driver *drv)
> >  {
> >       struct platform_device *pdev = to_platform_device(dev);
> >       struct platform_driver *pdrv = to_platform_driver(drv);
> > +     int ret;
> >
> >       /* When driver_override is set, only bind to the matching driver */
> > -     if (pdev->driver_override)
> > -             return !strcmp(pdev->driver_override, drv->name);
> > +     ret = device_match_driver_override(dev, drv);
> > +     if (ret >= 0)
> > +             return ret;
> >
> >       /* Then try to match against the id table */
> >       if (pdrv->id_table)
>
> I was just about to pick up this series, but then noticed that checking for
> driver_override in the platform_early case doesn't make sense in the first place
> and was accidentally added when the platform_match() callback was copied over in
> commit 507fd01d5333 ("drivers: move the early platform device support to
> arch/sh").
>
> Thus, I'm going to drop this hunk and add in the following patch; please let me
> know if there are any concerns.
>
> commit 39cae4095efda4b00b436c0fc46f21de84128969
> Author: Danilo Krummrich <dakr@kernel.org>
> Date:   Tue Mar 17 00:37:15 2026 +0100
>
>     sh: platform_early: remove pdev->driver_override check
>
>     In commit 507fd01d5333 ("drivers: move the early platform device support to
>     arch/sh") platform_match() was copied over to the sh platform_early
>     code, accidentally including the driver_override check.
>
>     This check does not make sense for platform_early, as sysfs is not even
>     available in first place at this point in the boot process, hence remove
>     the check.
>
>     Fixes: 507fd01d5333 ("drivers: move the early platform device support to arch/sh")
>     Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>
> diff --git a/arch/sh/drivers/platform_early.c b/arch/sh/drivers/platform_early.c
> index 143747c45206..48ddbc547bd9 100644
> --- a/arch/sh/drivers/platform_early.c
> +++ b/arch/sh/drivers/platform_early.c
> @@ -26,10 +26,6 @@ static int platform_match(struct device *dev, struct device_driver *drv)
>         struct platform_device *pdev = to_platform_device(dev);
>         struct platform_driver *pdrv = to_platform_driver(drv);
>
> -       /* When driver_override is set, only bind to the matching driver */
> -       if (pdev->driver_override)
> -               return !strcmp(pdev->driver_override, drv->name);
> -
>         /* Then try to match against the id table */
>         if (pdrv->id_table)
>                 return platform_match_id(pdrv->id_table, pdev) != NULL;

Nice catch!
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
