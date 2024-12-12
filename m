Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF3B2288EE
	for <imx@lists.linux.dev>; Thu, 12 Dec 2024 16:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734021677; cv=none; b=H+Q56V8kXYM9RNxjeY7xfAV3d5r00u6kxdw3mnk2evhrexMRbDJPFC/d10Nbzr0fO9l8M8Tyijlbg1A06Iz5tYRCmMM7O6W7Qo90acG+Y1Ksz2Y2COcpIMwqcHNNWbhoW28xM8f7u2znrfK7onliBN36CKA+YBEk8g6nD9P7RQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734021677; c=relaxed/simple;
	bh=+MQ/uMeQmvvgO8TnUxGq/7awVct5gsTlq1rp/sJixcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fLb+SrlsQiIeCLXrTl1Tb5LVRwDWgs3PAuG3RhM7vPfS0lAVZfZWadrDLrnX4JZ2sme95TOigPSMPNlqantoU+jJi6/B6waZDgdHAdcOTzetisHNPGauEJAoTnzfgA3q6xRmbQIR52iPh9R7vfa3rs8dCNnJlSh815M3DsVW+SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Y10dtrYS; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Y10dtrYS"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so823241e87.2
        for <imx@lists.linux.dev>; Thu, 12 Dec 2024 08:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734021673; x=1734626473; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5kF3A0mcCtzDysahXl4uMuj8y+benJqJoE125oESxI=;
        b=Y10dtrYSTBSrNml5tpzVs/KYTyAmCHltxJNfSzxJLiKTv1Pyoj1WYIlkq/JUd1Rmv4
         06Fprx/AL71YatdWN3+byLiJrU9ZEwXCQWzpCZoAMxSB34CLEZs6/1Nr+Qm5wa3uBrU6
         QjyeGyCnTxuiNz0t0ideLYMrsgpH28kxWXaQp9GsVvtFhVlrBSUa9Jn3E7xbM5EPm7FR
         IAYiJnUpd410frWYYiGFhKuXGBNmJ9e8tR2kJn6nA6XGnTfPMVAnDZPd3qw500BD8x6z
         /IyKAurJNcKf+Eg9CrhL324s/tzUACHbqZWchYkq12PlcJSuN826C7B6RNOWZVoQzxBf
         BYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734021673; x=1734626473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o5kF3A0mcCtzDysahXl4uMuj8y+benJqJoE125oESxI=;
        b=X3ZA3CZMYPTYvv/Qfq1ov3WvGad3CgjjpmYQafk/yMwaud0hrwMW6aOVCYd6sjy2ME
         W4jDDJm5RvAREjGgry8WKebmFEizvmRqScFgmxgixwfp/Koz5YM7ZR2yb36upfWDIvpe
         62ewgTrjyUwPc880HJL7qzyKGDQ2XJr03O1CYs5zzOaG9Yq87CMqMh7FsqnGHEWVdR1O
         uaEHLxNvw0j1LbEfoTt+tTAFjTXIhkIhrnaxdV0q5h9nPNfX5LbRr+Br7enWgFuJVLEC
         mxaYw+iVx+xm4bweGgiPqq6uJvuZ1J6iYnwYfkZP5pDF4RoP20scoq4j1SOWTb0JVvxo
         cTHw==
X-Forwarded-Encrypted: i=1; AJvYcCWlkASal+V7Y7e9ZRbedNqxrVxvclCBBi9SxgixH0wW9qZXZOgnwO89Kvjc2MEhASZccMM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNUXlI1eSvW2BRYJMk0ReXqNvj3WxL/dxeBXyN1MCv5CjlcQas
	LRf6Pd728OqyL1uGUdyKFphdhwztVDa00H9Zi/fbv3nA/IasBJnWk81PWFrKGbdtnJ/f7xndy/g
	OGY+azi4Qcy5dGrwCFGv7gFcjAoH3LrfC3a+jIQ==
X-Gm-Gg: ASbGncu9qvcBpZRmF4EmoRdXus0+Nvfdffcp9T1V4e3SjNOaW3C780J1S+RS5oVFvky
	HZtmW5CoxRQHf0dztTjEAKdO7B9A3qd/J1K31+mEd
X-Google-Smtp-Source: AGHT+IFcKdSrqT7xgQwrQlOlaQ2f5WNANwnYfOWWoePQcrKU9KH6N2PbU7UTt7twJeYpTYL40SC+Ctc9RsAiiKycytg=
X-Received: by 2002:a2e:7809:0:b0:300:1bf1:df23 with SMTP id
 38308e7fff4ca-30251e0df39mr2768441fa.12.1734021673243; Thu, 12 Dec 2024
 08:41:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241208150711.297624-1-apatel@ventanamicro.com>
 <20241208150711.297624-2-apatel@ventanamicro.com> <875xnuq6dc.ffs@tglx>
 <CAK9=C2VqU2mdLL-R20bdgvDHi0WcuNyUSqRo7Pztsu-8X1wVvw@mail.gmail.com> <87r06gq2di.ffs@tglx>
In-Reply-To: <87r06gq2di.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 12 Dec 2024 22:11:01 +0530
Message-ID: <CAK9=C2XEhtB00y6WTMaO0X=7K820T_BSCLA5bw6hJbfvQAD+Pw@mail.gmail.com>
Subject: Re: [PATCH 1/4] irqchip/riscv-imsic: Handle non-atomic MSI updates
 for device
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Mon, Dec 9, 2024 at 9:23=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> Anup!
>
> On Mon, Dec 09 2024 at 17:38, Anup Patel wrote:
> > On Mon, Dec 9, 2024 at 1:44=E2=80=AFAM Thomas Gleixner <tglx@linutronix=
.de> wrote:
> >> There is no guarantee that set_affinity() runs on the original target
> >> CPU (CPU 1). Your scheme only works, when CPU1 vector 0x20 is not used
> >> by some other device. If it's used, you lost as CPU1 will consume the
> >> vector and your pending check is not seeing anything.
> >>
> >> x86 ensures CPU locality by deferring the affinity move to the next
> >> device interrupt on the original target CPU (CPU1 in the above
> >> example). See CONFIG_GENERIC_IRQ_PENDING.
> >
> > I agree with you.
> >
> > The IMSIC driver must do the affinity move upon the next device
> > interrupt on the old CPU. I will update this patch in the next revision=
.
> >
> > BTW, I did not find CONFIG_GENERIC_IRQ_PENDING. Is the
> > name correct ?
>
> CONFIG_GENERIC_PENDING_IRQ is close enough :)
>
> >> The interrupt domains which are not affected (remap) set the
> >> IRQ_MOVE_PCNTXT flag to avoid that dance and don't use that affinity
> >> setter code path at all.
> >
> > Yes, setting the IRQ_MOVE_PCNTXT flag in the remap domain
> > makes perfect sense.
> >
> > I suggest adding IRQ_MOVE_PCNTXT usage as part of Drew's
> > irqbypass series which adds a remap domain in the IOMMU
> > driver. Unless you insist on having it as part of this series ?
>
> You need to look at the other RISC-V controllers. Those which do not
> need this should set it. That's historically backwards.
>
> I think we can reverse the logic here. As this needs backporting, I
> can't make a full cleanup of this, but for your problem the patch below
> should just work.
>
> Select GENERIC_PENDING_IRQ and GENERIC_PENDING_IRQ_CHIPFLAGS and set the
> IRQCHIP_MOVE_DEFERRED flag on your interrrupt chip and the core logic
> takes care of the PCNTXT bits.
>
> I'll convert x86 in a seperate step and remove the PCNTXT leftovers and
> the new config knob once the dust has settled.
>
> Thanks,
>
>         tglx
> ---
> --- a/include/linux/irq.h
> +++ b/include/linux/irq.h
> @@ -567,6 +567,7 @@ struct irq_chip {
>   *                                    in the suspend path if they are in=
 disabled state
>   * IRQCHIP_AFFINITY_PRE_STARTUP:      Default affinity update before sta=
rtup
>   * IRQCHIP_IMMUTABLE:                Don't ever change anything in this =
chip
> + * IRQCHIP_MOVE_DEFERRED:            Move the interrupt in actual interr=
upt context
>   */
>  enum {
>         IRQCHIP_SET_TYPE_MASKED                 =3D (1 <<  0),
> @@ -581,6 +582,7 @@ enum {
>         IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND        =3D (1 <<  9),
>         IRQCHIP_AFFINITY_PRE_STARTUP            =3D (1 << 10),
>         IRQCHIP_IMMUTABLE                       =3D (1 << 11),
> +       IRQCHIP_MOVE_DEFERRED                   =3D (1 << 12),
>  };
>
>  #include <linux/irqdesc.h>
> --- a/kernel/irq/Kconfig
> +++ b/kernel/irq/Kconfig
> @@ -31,6 +31,10 @@ config GENERIC_IRQ_EFFECTIVE_AFF_MASK
>  config GENERIC_PENDING_IRQ
>         bool
>
> +# Deduce delayed migration from top-level interrupt chip flags
> +config GENERIC_PENDING_IRQ_CHIPFLAGS
> +       bool
> +
>  # Support for generic irq migrating off cpu before the cpu is offline.
>  config GENERIC_IRQ_MIGRATION
>         bool
> --- a/kernel/irq/chip.c
> +++ b/kernel/irq/chip.c
> @@ -47,6 +47,13 @@ int irq_set_chip(unsigned int irq, const
>                 return -EINVAL;
>
>         desc->irq_data.chip =3D (struct irq_chip *)(chip ?: &no_irq_chip)=
;
> +
> +       if (IS_ENABLED(CONFIG_GENERIC_PENDING_IRQ_CHIPFLAGS) && chip) {
> +               if (chip->flags & IRQCHIP_MOVE_DEFERRED)
> +                       irqd_clear(&desc->irq_data, IRQD_MOVE_PCNTXT);
> +               else
> +                       irqd_set(&desc->irq_data, IRQD_MOVE_PCNTXT);
> +       }

We need similar changes in irq_domain_set_hwirq_and_chip()
because we use IRQ_DOMAIN_HIERARCHY in RISC-V.

--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1509,6 +1509,13 @@ int irq_domain_set_hwirq_and_chip(struct
irq_domain *domain, unsigned int virq,
        irq_data->chip =3D (struct irq_chip *)(chip ? chip : &no_irq_chip);
        irq_data->chip_data =3D chip_data;

+       if (IS_ENABLED(CONFIG_GENERIC_PENDING_IRQ_CHIPFLAGS) && chip) {
+               if (chip->flags & IRQCHIP_MOVE_DEFERRED)
+                       irq_clear_status_flags(virq, IRQ_MOVE_PCNTXT);
+               else
+                       irq_set_status_flags(virq, IRQ_MOVE_PCNTXT);
+       }
+
        return 0;
 }
 EXPORT_SYMBOL_GPL(irq_domain_set_hwirq_and_chip);


>         irq_put_desc_unlock(desc, flags);
>         /*
>          * For !CONFIG_SPARSE_IRQ make the irq show up in
> @@ -1114,16 +1121,21 @@ void irq_modify_status(unsigned int irq,
>         trigger =3D irqd_get_trigger_type(&desc->irq_data);
>
>         irqd_clear(&desc->irq_data, IRQD_NO_BALANCING | IRQD_PER_CPU |
> -                  IRQD_TRIGGER_MASK | IRQD_LEVEL | IRQD_MOVE_PCNTXT);
> +                  IRQD_TRIGGER_MASK | IRQD_LEVEL);
>         if (irq_settings_has_no_balance_set(desc))
>                 irqd_set(&desc->irq_data, IRQD_NO_BALANCING);
>         if (irq_settings_is_per_cpu(desc))
>                 irqd_set(&desc->irq_data, IRQD_PER_CPU);
> -       if (irq_settings_can_move_pcntxt(desc))
> -               irqd_set(&desc->irq_data, IRQD_MOVE_PCNTXT);
>         if (irq_settings_is_level(desc))
>                 irqd_set(&desc->irq_data, IRQD_LEVEL);
>
> +       /* Keep this around until x86 is converted over */
> +       if (!IS_ENABLED(CONFIG_GENERIC_PENDING_IRQ_CHIPFLAGS)) {
> +               irqd_clear(&desc->irq_data, IRQD_MOVE_PCNTXT);
> +               if (irq_settings_can_move_pcntxt(desc))
> +                       irqd_set(&desc->irq_data, IRQD_MOVE_PCNTXT);
> +       }
> +

These changes in irq_modify_status() need to be dropped to support
the above changes in irq_domain_set_hwirq_and_chip().

>         tmp =3D irq_settings_get_trigger_mask(desc);
>         if (tmp !=3D IRQ_TYPE_NONE)
>                 trigger =3D tmp;
>
>
>

Let me know if you have alternate suggestions instead of the above changes.

Regards,
Anup
