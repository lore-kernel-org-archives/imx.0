Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85203914E0
	for <imx@lists.linux.dev>; Sat,  3 Oct 2026 17:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791049338; cv=pass; b=CGG/PDzkcNM9s9VQm9xYAZ1ffLJjLeD6QqTFkcNgnW1HF+l3/BmmE6B5BhGMYFvsmeI+PS7tRrjFVgYc5/1208bUw3vY6/jyKzTQZR1Y5Zb/TaRML8PzOkG54xQhhoMbrHOgvOid+/eSJ92uNg8hbUaWVhv4ikBmaqQT2TnMtnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791049338; c=relaxed/simple;
	bh=N5fbkltW7ZPmNluYPIoQJuzlfwoaYBrbM7dscA21fgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VOmWuwW2dNp85PvkdkAcWBlIcOZIjmdzcO1E45Z7vQOgnVVK+Q2OpUn0klDLn97aznCnBDKOLZKirXmdJUQQ43ITXN8qXATTd7c+CVIjDkAsqmMFxOr3fpCnHyZkoI5OLJ9fZD3nlvwElhN5tyDi7KEh5HSJJLuLnZBWfz4CuuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRZI41/j; arc=pass smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRZI41/j"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e3dcfe205so108169966b.0
        for <imx@lists.linux.dev>; Sat, 03 Oct 2026 10:42:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791049335; cv=none;
        d=google.com; s=arc-20260327;
        b=MhDUR1w5hIPmT99wzEHu0ixYMYWA29323L2anbUbkR/rjEQw7RR/x3gdUOzCq0XajY
         bU3RpxFmHrUrLJE2zDVbVcBui4O7pkyChZt12dZYqOqsGPSZNMKU9XcH+YpiuSUSStH7
         yhMdKmyrIyZ/dz/Gn6lSDWD4mmbH5hJP8c1V7wAnuXqpcod9xoJd4Gr2kdHkqSCM9C0c
         94FBVIQqJiCan3JuVsD4uuDkFXUVYtgQ67pBOIHSK+Vl7Yz+YiEgloq23sldS15L7O/l
         H6OZjxZiahBal8RI5Scy38BEpvAO28BlwYrTCSTaw/cgJDRPahVIZKzcgcfKw07yxvjM
         vCaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wb0uZA3G4W3HP4zsAOWx40esmjqDsaAyOseskYQ6rWw=;
        fh=RWVBVLSPW9veoHXdpyXuh2t+zXMRKTGFQ0UfVTptWOk=;
        b=af+kqPJ61RORjXJLB+IMgd//FCyj22U6OPXTxPB4WuMztS2gqLqujySx5mHeXdmQw1
         zf200MCEU6NwzAkIbqXw6FYsc/dhoZf5tj1pXkfy03ssXfMMrj7WOc2taBNxBljXHE1P
         G2u+ACQ1uPh7YgCppYQP9yf2UoM7/iVJEZvjdee5ixHGWoZwpzeP8SyLIJuzsnYtysL/
         U7Gr1ppUy2r18PutNPEV4Bu84iKAwXlYMznnQjX2NHwznfCBqnjk6d5TxqTVzHHY7ylr
         iKwyGLwNMK5tSKRxpZ2xypo7NGBvrge29lKFJQoxcLNfsNg1eS81sLU2UHvyipXS/ly6
         5wUA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791049335; x=1791654135; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wb0uZA3G4W3HP4zsAOWx40esmjqDsaAyOseskYQ6rWw=;
        b=BRZI41/jth2FJE7wyenGQ7zjl34z7dLVXMiQEMuebGQI1jG/8zHhaa6jnkTu6hL8SM
         0fWWAf4tr/LS9OLBVe5cenO15RNcI/3xb4fiNBUvs0HeUkqfGzdRlH9tbZIzqIkgR6dD
         k/lefGkI+TfaDZCOctM1OliPWTjqONPu5E+QOXT5HmjNUN9sA4alvTMTAEdE/P3zdphP
         tdKOpQAr4drT44HV5XiVFmJUYnEnqo6h3THt7iwYvt9GJAv22LJ58gl8UgWT1J6sHk4h
         cEtp1d9xjt1yzrGOKuZQyNzhZAolHOq08/nIQQxFIPfz3tYYXyCOBc6rh6a33n/Lx53n
         S24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791049335; x=1791654135;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wb0uZA3G4W3HP4zsAOWx40esmjqDsaAyOseskYQ6rWw=;
        b=Ctfov6XI8L2HZ5BNdbcjMkSYWZ2e7UFheyzwAE01mBF1dmLKKTIzLD3xUpkwl9BiOl
         UO6qHarFDZUQbCbckuVJXtSQgCebvDfOVouY8LaOT1JlxniAMKFR3cfWDnLJlaXPT6tx
         s7soZb50Bdn0MtnTN75nnX9u6cB8bVEI1ecInseWxkcNpXGeC2SFRE0RhB9ZaeGfyTF6
         zMZsKLLuLgduuUz1seu0MOJEncCHNRc3RgDpc4KBOy35q0YMHPWCb8bPTZPZ6+1rcuAC
         CWYrkqRbaI8w6oMzhMRiGhBS4pUjUTl3osM6XJi72YlqdZleM1uGvKRqoANe/vYr8A6G
         YT5A==
X-Forwarded-Encrypted: i=1; AKwUvBzFCZ9H/rup/Oz869j57CKeHFEEJb1xc1drcUJowWpJXyclijgqHZXVAJooXqomNBITqr4=@lists.linux.dev
X-Gm-Message-State: AFuF++nk/+jSgnrPqh2O1Z6ymo6iIaCx04ST3toTJHvTMs0LvcQpeVgv
	nAFgT/8VjmG8EtORQhg99RxweTee4nYjWSELfn3atmffHKJjMYUJSh4dCh0ZBuBXVb4zO9jIO67
	o63O2x7K2kzdgClp+WqPbgUOOw/zO+KM=
X-Gm-Gg: AYBFou1D/iJHZm12C0TQfAp828Q/fqeNvAR31HCnEmFabHhrgct8R3Tq1xtL2TjTTqs
	MEsHm2gXq/FU1Y43S/JzpzjRf63qcPq87tjfRmQWfOMVmEMrHj9ETlANOOyuLT9R3m6pmbpc0ol
	3mPAGgOF8pdBXn+ayRFy+TbLn58WbMmf3YHcw6PWTFk/qGJrhtFZyQek8e4wii7/H12UlJ8Wq1a
	GP6zSbMGrSAK90lOIa1WH5vEp47bSc9ZvRHncwiTNHFvgRPg8nqfRw343tFAenXD3ERrjxxI/yJ
	Lvbfr0bGVr9bhHdnXzkR9wjBO4vc2Q7LrAjm3Gb+vyh7Vu4jo/GhRvaAxYycoHNJL9/XTwcql/X
	bmiH4HgBqe8ngtSSW5IdMDJ5DLFp92HPONAIPG8PUKGT7zjZRr8jO3p7zm+QWnYBPBrTtpwYyVk
	Mc8W1miMOp8xvp7Lz8D8OrCHJg84QD8UuePn7t190NlQ==
X-Received: by 2002:a17:907:3e93:b0:c26:1649:47ab with SMTP id
 a640c23a62f3a-c2e4af30556mr531245666b.33.1791049334807; Sat, 03 Oct 2026
 10:42:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com> <20261003-gpio-mxc-cleanup-v1-2-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-2-dad728ce27f2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Oct 2026 20:41:38 +0300
X-Gm-Features: AclHuK-YbJvYMQ90snp8Z-brjwfCdtteRLBnw6C84XXIIOdG-WKJaroDt_HV2CY
Message-ID: <CAHp75VcDrc0a+79HuUVQw77ALVywxag5hXrzjg8mZ7vALZ99Uw@mail.gmail.com>
Subject: Re: [PATCH 2/9] gpio: mxc: fix wakeup_pads bit operations for correctness
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 3:09=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> Replace the open-coded BIT() / mask operations with the atomic
> set_bit() / clear_bit() / test_bit() API. Atomic variants are required
> because gpio_set_wake_irq() can be called concurrently for different
> pins on the same port - irq_set_irq_wake() only holds the per-IRQ
> descriptor lock, not a per-port lock, so concurrent modification of
> different bits in wakeup_pads is possible.
>
> However wakeup_pads field is typed as u32 but accessed via set_bit() /
> clear_bit() / test_bit() which operate on unsigned long pointers. On
> 64-bit platforms this causes an 8-byte read-modify-write on a 4-byte
> field, corrupting the adjacent is_pad_wakeup field.
>
> Change wakeup_pads from u32 to unsigned long to match the bitops API
> width requirements.
>
> Also fix the disable path to only clear the wakeup_pads bit when
> disable_irq_wake() succeeds, matching the enable path which already
> checks the return value. Previously, a failed disable_irq_wake() would
> still clear the bit, causing the driver to lose track of the wakeup
> source.

The above is too verbose, try to squeeze it to the point.

> Also fix a latent signed-shift bug: the old (1 << i) expression in
> mxc_gpio_set_pad_wakeup() has implementation-defined behavior when
> i =3D=3D 31, since 1 is a signed int.

Too many words for a simple (non-critical) update.

...

>  struct mxc_gpio_port {
>         u32 both_edges;
>         struct mxc_gpio_reg_saved gpio_saved_reg;
>         bool power_off;
> -       u32 wakeup_pads;
> +       unsigned long wakeup_pads;
>         bool is_pad_wakeup;
>         u32 pad_type[32];
>         const struct mxc_gpio_hwdata *hwdata;

While at it, run `pahole` and update the arrangement (of the members
you touched here) accordingly.

...

> static int gpio_set_wake_irq(struct irq_data *d, u32 enable)

>                         ret =3D enable_irq_wake(port->irq_high);
>                 else
>                         ret =3D enable_irq_wake(port->irq);
> -               port->wakeup_pads |=3D BIT(gpio_idx);
> +               if (!ret)
> +                       set_bit(gpio_idx, &port->wakeup_pads);
>         } else {
>                 if (port->irq_high && (gpio_idx >=3D 16))
>                         ret =3D disable_irq_wake(port->irq_high);
>                 else
>                         ret =3D disable_irq_wake(port->irq);
> -               port->wakeup_pads &=3D ~BIT(gpio_idx);
> +               if (!ret)
> +                       clear_bit(gpio_idx, &port->wakeup_pads);
>         }
>
>         return ret;

Instead do the following after the if (enable) {} else {} block, namely

  if (ret)
    return ret;

  assign_bit(..., enable)
  return 0;

...

>  static bool mxc_gpio_set_pad_wakeup(struct mxc_gpio_port *port, bool ena=
ble)

>         for (i =3D 0; i < 32; i++) {
> -               if ((port->wakeup_pads & (1 << i))) {
> +               if (test_bit(i, &port->wakeup_pads)) {

Instead just start using for_each_set_bits() from bitops.h.

>                         type =3D port->pad_type[i];
>                         if (enable)
>                                 config =3D pad_type_map[type];

--=20
With Best Regards,
Andy Shevchenko
