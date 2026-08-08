Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA543C9EE8
	for <imx@lists.linux.dev>; Sat,  8 Aug 2026 10:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786185791; cv=pass; b=SMiLPZAENSyCji5YwSgZTAvnEo3qGEgF2dPX3mhvvaz2huY7vQ6h9MhrYCxUdVD1/2e7BdHtzq5Kqty0TnAF3C0QSbnlevfYvLyAg95tYoJQ1Ew2vxb4rLIDIsRYdeg0GZEREikD8q7UEJNz1CIqjfoiTLEPWRrtob+Ji3vcl/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786185791; c=relaxed/simple;
	bh=mXjI6xLrsgJ/BCByKBCc7QBfdI52WmMfRYnj8yT11hk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mpTywugPMwV1wV+lv7Y/Jq43DI8yFxD4CkHlkHsYUPfeMSnn4SXpCRRqF1WPH875OGuUGZ8osQScQPpuAow7U43da/35xeH2M5zRNaTTVhHIv9sBBDDw+u/V+R1gN7QKq4aEECVcG4XpWH3ShPbuc7njGpXJ6rsL30m+fNcKYmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oN2NHSFo; arc=pass smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oN2NHSFo"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84867f07d63so478351b3a.2
        for <imx@lists.linux.dev>; Sat, 08 Aug 2026 03:43:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786185790; cv=none;
        d=google.com; s=arc-20260327;
        b=RCxwC8JacI2zAymjwFVENrUgu1Wpw+bvypgxpVKsYW5qyThzSCe4Lk5WUqU2KXeOI2
         LavwSpgbfOBTcyBe3VREEeRpVjvQKuuG8i/UXmUfA5rxw+mdHf22sj7xUdIAn6EqoiN5
         kBEMgqnkdr6V86uIYjiz6NY36BBzsIma9WUUzrI48Wn9a0MFGVnoWrbIUcYvR3Dk3A4Z
         Cl7LNjgQT78JEwWuR0oPQPj+bWqe1u/QNFKCxzsV2iJo66c0fAyVnZuhSSH9FRUueuIe
         eWpW/VtcHwSoyWcEvRTIz3/ASbuVqu957eoqzeM3M2ofo2mFdwDaLxMHIVOUowGaJxHj
         cewg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TahiDhpqp/N8bPEZcra7/rRwJQuhTtc5hSf7Qko9ehI=;
        fh=rL0Ex071fS3Dimip+Z33L7NgtjKqhG1TIA63CA9wJdY=;
        b=knXlK/pY8olGbQf/VqHG55QgnYclhD4D0X4yS/oCg/7XHKytwbLT7I1tu/1CM9gM00
         1y/F+3oV5InXDGx8206ufddR6uqeZbsKTuZUgbegTx97RHVl84C7MxcYl2/Q1IG6fVpB
         x5GAg8q60z1YYrHX2ungrw3Cg3XyDjc82d/nxPoeTusbsxr4XL4BcvJuyZkBsvxFqbbU
         m/C0o5JZk+JSOOpIdmw34Y0suE4ukQUNoAcg00KPIF0peqn6MKpzRAmtOhNZhBxL5ZK2
         VwI0hEHkHONOzieo2P5Aa2aqTWnV2mlqS1x5jNWbPrFMUJXjUv9g5LOBbkdJxqgz5c7W
         sFbw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786185790; x=1786790590; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TahiDhpqp/N8bPEZcra7/rRwJQuhTtc5hSf7Qko9ehI=;
        b=oN2NHSFoWObscXjoAPmj5L9lqtIiWUTLSEIjF2RTeBhrg/FQWPd96IJpzZKle4PexQ
         taAdS7hYXNF9wwJzv6fF+wfK+dn3cdYLVDyASfFuj78aWwTImwmwv5H1q0k/f+4R+6hK
         XhyDX5NNSu74MaRmUCj4/qxjt4K+Rg+ENSb74rpguxI02PvvICDeig67C/VxAI0PkONE
         59KCN+9nFNKaqVhHMZpU2rOTXBdruGMk8qpb4bG9uYiISPqtL07LpbzfqeQDtjVEtrDr
         ik7Au3dcGLABOuMaEf0AgvMNUSiXdyoWAfXKAywrnQ1LtRyzZlkl8fjkLS+s1JWqfKL5
         pcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786185790; x=1786790590;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TahiDhpqp/N8bPEZcra7/rRwJQuhTtc5hSf7Qko9ehI=;
        b=bjF/yT1cUOTJ2JL8A3LyCBaA5oSVJ1Say8McS1uFjXAbW1LuxFihpwsRiECQzZu0ZR
         6414N4Sx0qjHxrUEQF/jjj3D3hIS+dRe6afJA3J3nHqClzTnXfhoHUW4Xpgd5RfW5beG
         BwttwJwFn9K/yb7F5RBsC8Vhu1egBBMRhAlovuyTRCO5jkgcHGfWyv4P5nPDiuz4UjBN
         DADA1WKA9Bf0+AUlM4OmaXUd6qKKeFb7DgdBgs0c8Ox4zEjE6MkR7/BOjeeTgJylnbfg
         hesyHVuCelhFlz9mV8sxCUSjvlMQElWMkGR/tHVFYjuR3vsoYFyVZ5s4/6GGH/APd6xS
         8FDQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp5NBxAfUXl62qWM0YF/30jsGhEeiiIAr4H/V/PE1yEpm+ZvH5f1Z0XSVukdy6iL1gQ8W0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQmR+L3fX4BAkj4MMoSOCoHugbcw+vnH2tb8+FLJuzI1IviXxA
	EfVwlC5Gi9s4Y4AoWie/DOWWjEJV7Qy9nFfSBdEGAdqL3wMYI4UX3PAyBRIAFn0PI/rWZ5mitMV
	U0bPrZpQj5W6Vps6kf5s9LoThTUUO4dI=
X-Gm-Gg: AR+sD12QUqjr4uQr3NFjCiTdfWpFXSp8cQJuT7KpH2VEReWhr1qxVbI9Z2RXa8IkjI1
	FyAEF9Vv5CpbmmWVKnhpYBo0/nTqsl0sFtqc37wSouX2HGHnDXjPotTE2NBuS63x23FK8UzRXXV
	WRuis/C7koSJhHSIlIgiZ1KeTzrSHDVTG5vHzBgf9+78KDGuw0+wWRE/uRqD0CxupXydsrQZ6xQ
	w/BSin9mYw5qL1SPMKd3bJ+VcBsHRC+6aCgTYDgfiA4iLvh2jDiaOPUYe23WD8keHpo/hfcBxXu
	BgjBNnkQs4Yr3uC22IIPBp9A5DuK/Qa3SEOMJyscstgfev9xziOBWBu5u7i8WrC7mrCinW5mBdk
	G7bViLJYKg2Z2izaEJSqre42RipjdQZLVh79goSVNreab8gAcIVCl9d7QdL+sbVz3kxfKOQwZcU
	RI0jsv7l+I12/1wvk=
X-Received: by 2002:a05:6a00:4293:b0:84a:6540:3389 with SMTP id
 d2e1a72fcca58-84f2dfc53e4mr33552422b3a.10.1786185789775; Sat, 08 Aug 2026
 03:43:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260807090945.41690-1-phucduc.bui@gmail.com> <20260807090945.41690-3-phucduc.bui@gmail.com>
 <20260807092245.4730E1F000E9@smtp.kernel.org>
In-Reply-To: <20260807092245.4730E1F000E9@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 8 Aug 2026 17:42:58 +0700
X-Gm-Features: AUfX_mwps0K_oGqDED58AIb5iJaSMgZ8HxJfRxTKu9khW67GW5bUW_-aJvkpS2I
Message-ID: <CAABR9nFW8XYSts6ZxTekZJSTpProDCrVgOm5=5aW1ahXV=wG5g@mail.gmail.com>
Subject: Re: [PATCH 3/3] serial: 8250_mtk: Propagate errors from optional IRQ lookup
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 4:22=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [Critical] The probe function exits with an error without unregistering=
 the previously registered 8250 port, leading to a port leak and a use-afte=
r-free of devm-allocated memory.
>
> Pre-existing issues:
> - [High] Runtime PM is enabled after the UART port is registered, violati=
ng TTY subsystem guidelines and risking circular wait conditions during pro=
be.
> --
>
> --- Patch [3]: [PATCH 3/3] serial: 8250_mtk: Propagate errors from option=
al IRQ lookup ---
> commit b5b9e4c48c3e7b1094e5e1c9834f9f8130a17c26
> Author: bui duc phuc <phucduc.bui@gmail.com>
>
> serial: 8250_mtk: Propagate errors from optional IRQ lookup
>
> This commit updates mtk8250_probe() to propagate error codes such as
> -EPROBE_DEFER or -EINVAL from platform_get_irq_optional(), rather than
> continuing without an IRQ.
>
> > diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/82=
50/8250_mtk.c
> > index e6a56cf54ae0c..d0d2aecf90059 100644
> > --- a/drivers/tty/serial/8250/8250_mtk.c
> > +++ b/drivers/tty/serial/8250/8250_mtk.c
>
> [ ... ]
>
> > @@ -587,6 +587,8 @@ static int mtk8250_probe(struct platform_device *pd=
ev)
> >               return data->line;
> >
> >       data->rx_wakeup_irq =3D platform_get_irq_optional(pdev, 1);
> > +     if (data->rx_wakeup_irq < 0 && data->rx_wakeup_irq !=3D -ENXIO)
> > +             return data->rx_wakeup_irq;
>
> [Severity: Critical]
> Does this error path leak the registered serial port?
>
> The port was successfully registered earlier in mtk8250_probe() via
> serial8250_register_8250_port(), but there is no call to
> serial8250_unregister_port() before returning the error here.
>
> Could this result in a use-after-free if the tty device is later accessed=
?
> The devm-allocated memory for the data structure will be automatically fr=
eed
> when the probe fails, but the port remains active globally.
>
> >
> >       pm_runtime_set_active(&pdev->dev);
> >       pm_runtime_enable(&pdev->dev);
>

I agree that this makes sense. I'll make the change and send v2.

> [Severity: High]
> This is a pre-existing issue, but should runtime PM be enabled before
> the serial port is registered?
>
> The mtk8250_do_pm() callback invokes pm_runtime_get_sync(). If
> serial8250_register_8250_port() synchronously invokes the pm callback
> during registration, it will attempt to use uninitialized runtime PM
> infrastructure, which can lead to circular wait conditions.
>
> >
> >       return 0;
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807090945.41=
690-1-phucduc.bui@gmail.com?part=3D3

In mtk8250_probe(), uart.port.pm is set to mtk8250_do_pm:

uart.port.pm =3D mtk8250_do_pm;

In serial8250_register_8250_port(), this part:

if (uart->port.type !=3D PORT_8250_CIR) {
        if (uart_console_registered(&uart->port))
                pm_runtime_get_sync(uart->port.dev);

calls pm_runtime_get_sync() directly on the device, and I don't see a
direct call to port.pm here.
it may be invoked in some other helper function called within
serial8250_register_8250_port() itself.

That said, this is a pre-existing issue, so I'd like to keep this
patch scoped as-is and not address it here.
