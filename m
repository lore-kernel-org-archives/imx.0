Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B7741C72
	for <imx@lists.linux.dev>; Sat,  8 Aug 2026 09:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786183086; cv=pass; b=EGugvYJmaAIl6u/nJQANsVuNvjjFjVKpgcLzq8ki7Mytdv2YPyKhyfFbIlxmcI4V78WTiXRMybf8L1SogVvZOs9xONF6dD348f1e4XiYJGfG9gwsFRL0URQbWbcUTu9IiZ3HhcRACO6JKaOMtSmgpsk5gYgeDy8M5jZv0b7HaQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786183086; c=relaxed/simple;
	bh=AQUQcUjRoYf4C9UbV6Nt5xsI+KWuVC3ynY9uYHP6YCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jx5iuSI4/PW1uIq5YzRk6UAjtehhamD3SMoqMo/2kcC+OzCXP5ObZhhOk0kf1wf2S61GvfyUQdUJJMvyOX0WZsJCuuc9mWjJdtKWqrnvLxmbbiQQYrdIzlL+yE4Xxhqsf236A12THG+0Qbrk6FpM2EKeuwJ1NXlsaec2MeXSrCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=svp+i2xj; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="svp+i2xj"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ced3386430so4706965ad.1
        for <imx@lists.linux.dev>; Sat, 08 Aug 2026 02:58:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786183084; cv=none;
        d=google.com; s=arc-20260327;
        b=nj901Bdg/wb3jO2gLFaEXRrmhbXLHmhIzynLmXnkhjVQZvdhEwzncr2Do7XY9QNnfC
         TvHeJthn1A2JZ6QHtSkmDyyoeG3C9Ht9MY8TgMaoBoGKOZ2CS74Tkp3z935Krmxgmc0f
         AkqGHqh+4r7yCJqz4SIlFKrtgyrVvzsFX6iK09ctTQJ8Pr/YHnjV4E6Ax12yquZRbi/U
         HDNxB8lywle1IDIcnBioQBl9qGQVterZ9t90adq2+OxBQXNdyw4jT/a30IfpNHdbV2v4
         G2qHcJevJDTu3siqRIJnjWMw/8E6nmvNKwC/U0ajd7zva8DqwTGqAn2s6m1VNom3fQNf
         sgIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=p99Oc2WulxAtBkn/1eRnUDyT/vg/oXBEufz/upvtijE=;
        fh=aWsx/IUUtfdn9+gXphL5fUi6AYO9vGzfxMYVkuVkzqs=;
        b=YokwNXFXVJS5gp4S58/hbNnVOln1mmdutLPvnSFG5A6Y2LryeHx64X9B3e9LNLLY1T
         +Y1eNz47nRcwmHtWw2eGtmFkW5KOZBS4tGEU/UD/KJEhelBrmt6SOpjhrtxQo45ZhuX6
         2kaY6MDAyRGIy+dXnpfhqQ0XkPlHTd1GpbS76T/XCCwzsnp/EndlOOrbfuCBiY2FYQhm
         Rus+xSU51yYFNbmHyAuv0hTIbn3shMfYygL8+uET9+n2v0D65HK27WCrPkX9L9oFw2mJ
         XerXcmgXJ1CV/8gVa0EYTSNYIiojOIAqLAarLbkXFv17DhnNBUC0Fio7LkTlCFX3nGOd
         5TBA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786183084; x=1786787884; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p99Oc2WulxAtBkn/1eRnUDyT/vg/oXBEufz/upvtijE=;
        b=svp+i2xj307qAgA0McTLy5D/GsT8vYIqxEErJcnGEqUeEOnqjG8RNAZEc4wFu1pAe7
         UMImsG7P/CrklxBiJOzLWEel45lqyEfceQz9GrM+Wd50k4wkFa5uJiNvjho0yn5wP2Nb
         65jkAK7yTvH2IEpPV1nELYzRp0rU4rhFNwrjDjTpHNfFVbDEC5yigSh1AOCPIb/39N7y
         DieDyITv0WfRxAgLbq62clqLNWlAFXALfaBagQVvmghKrEIEYkRGJFE9qwr96snFfVr3
         H3vWzLCWt2zB3PT5KzjxzqqIVd35gsm6+sOWucgehaLpmuDiASDrXpyZ3TvN+YxAiZeO
         0+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786183084; x=1786787884;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p99Oc2WulxAtBkn/1eRnUDyT/vg/oXBEufz/upvtijE=;
        b=sJ4gfWLoO4joN27HFMUTyEv+sZTXLlDw1y1RK3F1mdKSl1opG4N1nMDCQR5I519D57
         sOgo9SSAc2yOci4/0SejWZHRgIqgRiUtHSFzkI+vSfb2qKr0hZMBtVl8AcfYFI/YUnWE
         S/iv9PqfNqNnOxcRWvjy0MK4igtOQCFLkw9fUIAry/Pjnu3afxGuTPFHwyP2BG0Wosgc
         KZeczISicJVd+dbT89c7jHUVY/DLdx2nhxvc912Bnm1E3tboUJv5n139/XhJYTtuC146
         MVbAeSLv7xhCDE/isoeb3hVaI9X3owR5tFTnpJP29LwGYvpk/hAQ29a+zWW1exrE7cmw
         5ndg==
X-Forwarded-Encrypted: i=1; AHgh+RqkMR26xBYxG2kEZ4X0CtRcJywsucKVXpCdWjSRT2/Th1SMyoh6oXRrIKr6X2x2XQCYm8s=@lists.linux.dev
X-Gm-Message-State: AOJu0YynRBRXsvSI2JiQ8XmkioEWv3N/wDaaSy645bXUZMs7EgkX0vla
	R9c3vW7I6QkNalhry/Mm5WUP9LbCPA5Gjez31b6rzt0FXroPo2bdM3lCIk6+vVBMmu/ivHdCV0F
	XQAignYdkn4icOXhpG6BgBYmiSUO3D5E=
X-Gm-Gg: AR+sD11cMfVakfy3tzaoVMDEx0aQLN4nIng6RecvIhQEdcN7BtrTHMlnQeYp7TATopk
	sUkyQYy8lcvmrqmqU3vQHx5LKfNzjPJCVG3UtG1iSbOz03iTcWihYn0piX+xLGSkTKbju0SDCqY
	pm70Fd/iLzgA1oKP9LOlKotLLoegcdcXUNv9R/rVWyGrjAyR1g6/XRq9260pU/hxNUJC64YSokc
	uQNlos2KlSEQOjdlulyEnFCxDlnT96DwE7IxH0bSTSuI76YWKhvy3MoHUJmVb5kLBHv8PMK+zWI
	srsU9qLERb4tEpwoR82P0JAk5aUaPR/gM1O8b+Zoq42p8BgO9BzNCFVc5lpLfGwAbKm2po5oFSR
	fwidwwwBbEy5DBK3NwU6BrCeKb04Aep73clwVX/9eg5Ya7H9CNJWK5Uja0+MFSlKnkvqDehC4ne
	wszNwLICdXqssFxs4=
X-Received: by 2002:a17:903:37cd:b0:2ca:d9b3:715e with SMTP id
 d9443c01a7336-2d294b4b5b1mr129349815ad.9.1786183084203; Sat, 08 Aug 2026
 02:58:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260807090945.41690-1-phucduc.bui@gmail.com> <20260807090945.41690-2-phucduc.bui@gmail.com>
 <20260807091846.2CCA01F000E9@smtp.kernel.org>
In-Reply-To: <20260807091846.2CCA01F000E9@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 8 Aug 2026 16:57:50 +0700
X-Gm-Features: AUfX_mxbTUFPg7Di01lp35B6Qz2fWJS8SBUdIDBT4jVPvbSAez6A1XxwG-Js3g0
Message-ID: <CAABR9nH-zL25=rcmKtLLe1RVZ=P=-JBrATptV_ODsxh2exbqLg@mail.gmail.com>
Subject: Re: [PATCH 2/3] tty: serial: imx: Propagate errors from optional IRQ lookup
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 4:18=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The global `imx_uart_ports` array retains a dangling pointer to =
a freed `sport` object if `uart_add_one_port()` fails during probe, or afte=
r device unbind.
> --
>
> --- Patch [2]: [PATCH 2/3] tty: serial: imx: Propagate errors from option=
al IRQ lookup ---
> commit 1b33dc8f639bc337c3928860fbfd0de822e373c4
> Author: bui duc phuc <phucduc.bui@gmail.com>
>
> tty: serial: imx: Propagate errors from optional IRQ lookup
>
> This commit updates imx_uart_probe() to properly propagate error codes
> from platform_get_irq_optional(). It ensures that errors like probe
> deferrals are returned rather than ignored.
>
> > diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
> > index 251a50c8aa387..4224454d360ef 100644
> > --- a/drivers/tty/serial/imx.c
> > +++ b/drivers/tty/serial/imx.c
> > @@ -2463,7 +2463,11 @@ static int imx_uart_probe(struct platform_device=
 *pdev)
> >       if (rxirq < 0)
> >               return rxirq;
> >       txirq =3D platform_get_irq_optional(pdev, 1);
> > +     if (txirq < 0 && txirq !=3D -ENXIO)
> > +             return txirq;
> >       rtsirq =3D platform_get_irq_optional(pdev, 2);
> > +     if (rtsirq < 0 && rtsirq !=3D -ENXIO)
> > +             return rtsirq;
> >
> >       sport->port.dev =3D &pdev->dev;
> >       sport->port.mapbase =3D res->start;
>
> [Severity: High]
> This is a pre-existing issue, but looking further down in imx_uart_probe(=
),
> does the error path for uart_add_one_port() leave a dangling pointer in t=
he
> global array?
>
> If uart_add_one_port() fails, we see this sequence:
>
> drivers/tty/serial/imx.c:imx_uart_probe() {
>     ...
>     imx_uart_ports[sport->port.line] =3D sport;
>     ...
>     ret =3D uart_add_one_port(&imx_uart_uart_driver, &sport->port);
>
> err_clk:
>     clk_disable_unprepare(sport->clk_ipg);
>     return ret;
> }
>
> When this returns an error, devres will free the memory for sport, but
> the global imx_uart_ports array still retains the pointer. Can a subseque=
nt
> console operation dereference this freed memory?
>
> Additionally, the same issue appears to exist in imx_uart_remove() when
> the device is unbound:
>
> drivers/tty/serial/imx.c:imx_uart_remove() {
>     struct imx_port *sport =3D platform_get_drvdata(pdev);
>
>     uart_remove_one_port(&imx_uart_uart_driver, &sport->port);
> }
>
> Should this removal function explicitly clear the pointer from
> imx_uart_ports to avoid leaving a dangling pointer?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807090945.41=
690-1-phucduc.bui@gmail.com?part=3D2

This is a pre-existing issue, so if it is confirmed to be a real problem,
I think it would be better to address it in a separate patch.
For the current patch, I'd prefer to keep the scope limited to propagating
errors from the optional IRQ lookup.
