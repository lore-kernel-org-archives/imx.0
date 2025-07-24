Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5862BE040
	for <imx@lists.linux.dev>; Thu, 24 Jul 2025 12:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753359753; cv=none; b=kvh+rVibDSFEln9/rASdbGJF7qi4IoncxMp48A1AaQZsVw2SEEkmYuA5OxgMmIzDfB+nGl2PvWuNhqG5tU+AivUm7gGvEuPjFOV3bfv5DhOFd3JYx56Kw5E9mJyKOKOLxAT0Y3H2BhfsB9prVsO476Czxyw+RmR5EQrlzpPJqnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753359753; c=relaxed/simple;
	bh=SuuzfGDvzCnvi/bsKJ4BfINBu+QjHlhVEd84kJsyMAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ueej2guU5yoyQwbFBkgjRRkCWSd64t/pzoOKr/qe6IsPwBpiNJYlASUgY6ix80LDzcqweURQSYU74/31KO13j4x6Y2Ty+Lq4GqRbB0ZapS8kfa8M4yIiCNva42IRRTFAlGDcM5hdCUChJcdREGoawcrfHfdpXS4F+JfhRhMozx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jp3eXpIv; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jp3eXpIv"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-608acb0a27fso1628912a12.0
        for <imx@lists.linux.dev>; Thu, 24 Jul 2025 05:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753359750; x=1753964550; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCH9wMZuCq9rz+O+tflGRTfcHTnRU43/VMnWUAJfNWE=;
        b=jp3eXpIv6oH2OiOfqIFHrhhatuk/qwgITnaxpttmerUQKwvM4tUYEcac8vTdrtPAZ2
         VI6FAvj6WTtmN48GpVEMcduyo90eSwMD7CSKkvKah8drXGUWhNe9VvhDBvCMM7dfrBA7
         xg2JulVvIy+3JXfHabBJuuTXfKn3xCtbUN9UmQXmnQqfMtvAL9/4QMRJe/9Cf5Iiu2v2
         fl1dor7w8ta2w3P1YoTcr7lGkYVRIfTa7fSyBz39jEHE2P9DMApuj7GLWfkYdNs8GCS6
         YfqpVYZm2OABqsMhWbIwnwzxKJsEBUucNJUdgOPMCEW3KwSZKwp3h7h8YLsztygxLk5t
         QeEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753359750; x=1753964550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PCH9wMZuCq9rz+O+tflGRTfcHTnRU43/VMnWUAJfNWE=;
        b=NjmKXG8GDWz8B0o9x3F+wGLws5OIrk3RpG08kAma58S7f2gtNdTwESSH/L0H/Y3jyK
         sGfRfMSm4eQHvluLToFTt1crtU6Ewwl1NQ6maaaPyUt9gOJ/I+Aqd0r/j8h5JXsfi5e4
         RqQRo/fX9xAUSBC7s3HzVzep2Xy+8KeOYLSKAZuXLqA1uVGlmgJDRpt/v863t5LEaxPt
         Xnbdc0ypd/4PO97/lloEOSJ2oHUar4dwycYXg9MBR0RVPSPBeXvRT88yqPkWyFfNKMzu
         YwS54En5yvUBTYwy3D9GtnLNkvZ+rwX9rLjppaBop9ycUHlL5RlVvLL5dftsJ2HLOMjK
         Ns2w==
X-Forwarded-Encrypted: i=1; AJvYcCWgCjw938Ywuc2yYTHbQwImiPEIm4VYu2x63YoJB5sZ0u43UwofC2jRxaLcv+K/ips4G9A=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCuUU2dQjF4T4YwBDCC/bCT0GvFPD1K7eHiiCUq798o1M7XVbb
	HyV4slTara//wfyIsorClrHpqLYDZJdnoY0590nGLxNAXVpIXGNP61uycvN4NK/N3r3fAyXWEUc
	fdTw3p6OUJq7fhLi8JMwIt/UWAXJP4Ds=
X-Gm-Gg: ASbGncuG5kB8kvJPXJU0aOYLjlByrG/rcXIPziW29VGqflT3WYRe1Eoc7jiuOhUlOJ2
	F/Fva39sJWOiWBaE1bqDC30IphkzDZje4tag/BXteVojZMLf4U/txw/Fht8udM2DcjvmNQUntNh
	oRMu+FIeQx3AhQcio3N0ATmfaPQDBwf4/X52FLobzp8M5Ggtg5btyybD/0GSCz9csBEcoI9cAiy
	B2KzyBjKg==
X-Google-Smtp-Source: AGHT+IHK0IoDJ6PED5zWXfzDhpKgh5VZvydISu4XMaUvDPUT/I7krIj8dXVVfHCUqibcmSSRfe/rVr8gG8zy8ado+mw=
X-Received: by 2002:a17:907:60cb:b0:aec:6600:dbe3 with SMTP id
 a640c23a62f3a-af2f9385acfmr671282766b.56.1753359749816; Thu, 24 Jul 2025
 05:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org> <20250724-pinctrl-gpio-pinfuncs-v3-12-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-12-af4db9302de4@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 24 Jul 2025 14:21:53 +0200
X-Gm-Features: Ac12FXz2KOnsH_foq66JE5xieoDhq1Ik71OykKjuCvc1b-KzV3FeiggPCBwSd4M
Message-ID: <CAHp75Vc4vsJh_-GbP+YO50veoGoGtfAPL4tjcF+73uophfmnGw@mail.gmail.com>
Subject: Re: [PATCH v3 12/15] pinctrl: allow to mark pin functions as
 requestable GPIOs
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 11:25=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> The name of the pin function has no real meaning to pinctrl core and is
> there only for human readability of device properties. Some pins are
> muxed as GPIOs but for "strict" pinmuxers it's impossible to request
> them as GPIOs if they're bound to a devide - even if their function name
> explicitly says "gpio". Add a new field to struct pinfunction that
> allows to pass additional flags to pinctrl core. While we could go with

passing
to the pinctrl

> a boolean "is_gpio" field, a flags field is more future-proof.
>
> If the PINFUNCTION_FLAG_GPIO is set for a given function, the pin muxed
> to it can be requested as GPIO even on strict pin controllers. Add a new

"...the pin, which is muxed to it, ..."

> callback to struct pinmux_ops - function_is_gpio() - that allows pinmux
> core to inspect a function and see if it's a GPIO one. Provide a generic
> implementation of this callback.

...

> -       if (ops->strict && desc->mux_usecount)
> +       if (ops->function_is_gpio && mux_setting)

Seems mux_setting presence is prior to the GPIO checks, I would swap
the parameters of &&.

> +               func_is_gpio =3D ops->function_is_gpio(pctldev,
> +                                                    mux_setting->func);

One line is okay.

> +       if (ops->strict && desc->mux_usecount && !func_is_gpio)
>                 return false;
>
>         return !(ops->strict && !!desc->gpio_owner);

I think this whole if/return chain can be made slightly more readable,
but I haven't had something to provide right now. Lemme think about
it,

...

> +               if (ops->function_is_gpio && mux_setting)
> +                       func_is_gpio =3D ops->function_is_gpio(pctldev,
> +                                                            mux_setting-=
>func);
> +               if ((!gpio_range || ops->strict) && !func_is_gpio &&
>                     desc->mux_usecount && strcmp(desc->mux_owner, owner))=
 {

This is very similar to the above check, I think at bare minimum here
can be a helper for both cases.

...

> +/**
> + * pinmux_generic_function_is_gpio() - returns true if given function is=
 a GPIO
> + * @pctldev: pin controller device
> + * @selector: function number

Missing Return section. Please run kernel-doc validator against new kernel-=
docs.

> + */
> +bool pinmux_generic_function_is_gpio(struct pinctrl_dev *pctldev,
> +                                    unsigned int selector)
> +{
> +       struct function_desc *function;
> +
> +       function =3D radix_tree_lookup(&pctldev->pin_function_tree,
> +                                    selector);

One line is okay.

> +       if (!function)
> +               return false;
> +
> +       return function->func->flags & PINFUNCTION_FLAG_GPIO;
> +}

...

>  struct pinfunction {
>         const char *name;
>         const char * const *groups;
>         size_t ngroups;
> +       unsigned long flags;

Not sure we need this. If the function is GPIO, pin control already
knows about this. The pin muxing has gpio request / release callbacks
that change the state. Why do we need an additional flag(s)?

>  };

--=20
With Best Regards,
Andy Shevchenko
