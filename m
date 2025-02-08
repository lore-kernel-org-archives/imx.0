Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1351F1815
	for <imx@lists.linux.dev>; Sat,  8 Feb 2025 16:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739032757; cv=none; b=bXuv4qAyGCcooeFWY908bWqg1sJ8lF1YiQnys2NIQgE0QiFkd8X9eq6WHVlkbhtKAg7xOSWRGSiRyFDMYR9H4hAuYs+VJpXDI3/hZeHTno9bChk7EIJfdpAT5WyeKzJLX0fMPZVqhe12ZWHdNSKce8deMF2RZUm/rkYqFLEK7lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739032757; c=relaxed/simple;
	bh=y/1eDaD7UEmX6SDnFD+7LbJy3yq0kJ8Ej5d36GX9FI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f1sGk8b9DOd4jnaN/AnIqmQ+1CDQ2rkQbk9j6m1qQokFOAXAnQK4jVJeC77DWjQ8UzdgWRwkgN1RqlVZ23AEUoVkGwuIBgx3tJ4HWa0KaXuK9xpHMCvUrR0oqT0xg1tS/+NyxRpRaOMFbyqFN7RumUnfQxmFEhDvLXJKrN/77tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=NnprR4+r; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="NnprR4+r"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-306007227d3so31516381fa.0
        for <imx@lists.linux.dev>; Sat, 08 Feb 2025 08:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739032754; x=1739637554; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzbNCAl5IRteTAQurBibz5Bt51mhHt96a2+cUjWoDiU=;
        b=NnprR4+rlEY0iqhlKKrolBK0Q4KMx+PrLhsHlvbCKWss4vaXTd56lcnUk6P5Grxhuj
         og8BtEr8MWsZTPPIIme8IULdIRXOphdXQY0A+hM0q3k0VyVJyFhnqbVlI6hxjifbK5Nw
         ZelL/Mr98851rh3mrOOjZ5ohUtylbsrKZvWo2e1BkBMiuYUWwvltme2IIhBEpAbetytu
         SlFuAsbDGFTY46yS5HXX93aFRNnuHWTjkkEQojDkQmEpahXUgPHHdAQ81tpozJsmle9d
         ZS3ZgiqN2jlOvcyJtrN1LkN1UCT8s72ZKYbdszqnshWLbxG+Jq8xpzaL++hdTZYQ2uOb
         GfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739032754; x=1739637554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzbNCAl5IRteTAQurBibz5Bt51mhHt96a2+cUjWoDiU=;
        b=dYm//KmRoQP//7ym0znnSsLWv79J3ULAYLCkcYYFquyT1nPTzwokwqkfrab7sskUid
         2X8XZLlquV7Oe0tlH19VHijEWjvipeLqDVGXDCtFcJpnxvmm2MDfFSd2hVjmOsfpSmSy
         HDjtmku21JCcjQM12GWpxZsInEgeYgIkDqv05x4/QYzuQ0+5l8x1hR0QMYikuQiWOPte
         MKJzo48sfTj71wgxr1XpFh/dVR5obw2aKckk05w6BaLwFXqkAKL4p+JHmMeYDLXgkEP9
         aLfF5J2Z+s4j9ZhNDEcPEjMzdcBtCkswcD/944Xq1Td8fJRsHsTyuRbTRNQi/cMkajHq
         YJTw==
X-Forwarded-Encrypted: i=1; AJvYcCUyflQOXn2VQqWgMEjpo43clifEfOGrYGz5ym2ddetx7LbqvdHrFwh388KVmJWuJo8l+9Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7nGUq50R3Dy8WV68fI6JRG0E3iUqHZe9SEAk0TK6DYCqBvk5W
	gs1TINGAwXlj+lb6sguU046TWk6FZ2TeM9/vUkf8oDwalx8gSIiKLrc8RRmKlK877DWQ5UVYJYy
	xbYaOkLSuTjdmAfjh7dTxkbYNJLpYeFJgQJsjig==
X-Gm-Gg: ASbGncujiLxPRH4itQRsoEmUN1qL9x5BQV1gfC8ZPT/+wpH0rtCjbK5e9W2nVcwwGoU
	poF8MlWDCTuAmgCrcxku5NZHxAvIq6ZStpMHnfg+plUe1FncjGRbnNeqg+fI0EjRvl5G/1TGhKw
	==
X-Google-Smtp-Source: AGHT+IGvFt/lUkJMn2aRQEvESWo9Z5oF0kyb7TRY8Q8nKrFZ5W9AeQ7/IOmXGcmYebYfPo1D+0khmxqI7+T7H0ISs7U=
X-Received: by 2002:a05:6512:2316:b0:542:2190:9d99 with SMTP id
 2adb3069b0e04-54414aa9b2cmr2867257e87.6.1739032753575; Sat, 08 Feb 2025
 08:39:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250205155948.81385-1-apatel@ventanamicro.com>
 <20250205155948.81385-5-apatel@ventanamicro.com> <87r04an95m.ffs@tglx>
In-Reply-To: <87r04an95m.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 8 Feb 2025 22:09:02 +0530
X-Gm-Features: AWEUYZmtJ_BNHW9YQuvOs8JRCDD3omWxa9DvXZBLIHAyvsMvY1csghzsdyTnHOs
Message-ID: <CAK9=C2X0Occ4jmeQ+Vp7EZA0WyTVQBaG1-95GNd_hK7PUTdrhg@mail.gmail.com>
Subject: Re: [PATCH v4 04/11] genirq: Introduce common irq_force_complete_move()
 implementation
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

On Fri, Feb 7, 2025 at 1:22=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> On Wed, Feb 05 2025 at 21:29, Anup Patel wrote:
> > The GENERIC_PENDING_IRQ requires an arch specific implementation
> > of irq_force_complete_move(). At the moment, only x86 implements
> > this but for RISC-V the irq_force_complete_move() is only needed
> > when RISC-V IMSIC driver is in use and not needed otherwise.
> >
> > To address the above, introduce common weak implementation of
> > the irq_force_complete_move() which lets irqchip do the actual
> > irq_force_complete_move().
> >
> > +void __weak irq_force_complete_move(struct irq_desc *desc)
> > +{
> > +     struct irq_data *d =3D irq_desc_get_irq_data(desc);
> > +     struct irq_chip *chip =3D irq_data_get_irq_chip(d);
> > +
> > +     if (chip && chip->irq_force_complete_move)
> > +             chip->irq_force_complete_move(d);
> > +}
>
> I seriously doubt that works as intended.

Ahh, yes. This function needs to consider hierarchical domains.

>
> In patch 9 you implement this as callback for the imsic_irq_base_chip,
> but that's not the top level chip in the hierarchy. The top level chip
> is the PCI/MSI device domain chip, which obviously does not have that
> callback set.
>
> Something like uncompiled below should work. That avoids the weak
> function and handles x86 in exactly the same way.

Okay, I will try the below code and include it in the next revision.

Thanks,
Anup

>
> Thanks,
>
>         tglx
> ---
> --- a/arch/x86/kernel/apic/vector.c
> +++ b/arch/x86/kernel/apic/vector.c
> @@ -888,8 +888,85 @@ static int apic_set_affinity(struct irq_
>         return err ? err : IRQ_SET_MASK_OK;
>  }
>
> +/*
> + * Called from fixup_irqs() with @desc->lock held and interrupts disable=
d.
> + */
> +static void apic_force_complete_move(struct irq_data *irqd)
> +{
> +       unsigned int cpu =3D smp_processor_id();
> +       struct apic_chip_data *apicd;
> +       unsigned int vector;
> +
> +       guard(raw_spinlock)(&vector_lock);
> +       apicd =3D apic_chip_data(irqd);
> +       if (!apicd)
> +               return;
> +
> +       /*
> +        * If prev_vector is empty or the descriptor is neither currently
> +        * nor previously on the outgoing CPU no action required.
> +        */
> +       vector =3D apicd->prev_vector;
> +       if (!vector || (apicd->cpu !=3D cpu && apicd->prev_cpu !=3D cpu))
> +               return;
> +
> +       /*
> +        * This is tricky. If the cleanup of the old vector has not been
> +        * done yet, then the following setaffinity call will fail with
> +        * -EBUSY. This can leave the interrupt in a stale state.
> +        *
> +        * All CPUs are stuck in stop machine with interrupts disabled so
> +        * calling __irq_complete_move() would be completely pointless.
> +        *
> +        * 1) The interrupt is in move_in_progress state. That means that=
 we
> +        *    have not seen an interrupt since the io_apic was reprogramm=
ed to
> +        *    the new vector.
> +        *
> +        * 2) The interrupt has fired on the new vector, but the cleanup =
IPIs
> +        *    have not been processed yet.
> +        */
> +       if (apicd->move_in_progress) {
> +               /*
> +                * In theory there is a race:
> +                *
> +                * set_ioapic(new_vector) <-- Interrupt is raised before =
update
> +                *                            is effective, i.e. it's rai=
sed on
> +                *                            the old vector.
> +                *
> +                * So if the target cpu cannot handle that interrupt befo=
re
> +                * the old vector is cleaned up, we get a spurious interr=
upt
> +                * and in the worst case the ioapic irq line becomes stal=
e.
> +                *
> +                * But in case of cpu hotplug this should be a non issue
> +                * because if the affinity update happens right before al=
l
> +                * cpus rendezvous in stop machine, there is no way that =
the
> +                * interrupt can be blocked on the target cpu because all=
 cpus
> +                * loops first with interrupts enabled in stop machine, s=
o the
> +                * old vector is not yet cleaned up when the interrupt fi=
res.
> +                *
> +                * So the only way to run into this issue is if the deliv=
ery
> +                * of the interrupt on the apic/system bus would be delay=
ed
> +                * beyond the point where the target cpu disables interru=
pts
> +                * in stop machine. I doubt that it can happen, but at le=
ast
> +                * there is a theoretical chance. Virtualization might be
> +                * able to expose this, but AFAICT the IOAPIC emulation i=
s not
> +                * as stupid as the real hardware.
> +                *
> +                * Anyway, there is nothing we can do about that at this =
point
> +                * w/o refactoring the whole fixup_irq() business complet=
ely.
> +                * We print at least the irq number and the old vector nu=
mber,
> +                * so we have the necessary information when a problem in=
 that
> +                * area arises.
> +                */
> +               pr_warn("IRQ fixup: irq %d move in progress, old vector %=
d\n",
> +                       irqd->irq, vector);
> +       }
> +       free_moved_vector(apicd);
> +}
> +
>  #else
> -# define apic_set_affinity     NULL
> +# define apic_set_affinity             NULL
> +# define apic_force_complete_move      NULL
>  #endif
>
>  static int apic_retrigger_irq(struct irq_data *irqd)
> @@ -923,11 +1000,12 @@ static void x86_vector_msi_compose_msg(s
>  }
>
>  static struct irq_chip lapic_controller =3D {
> -       .name                   =3D "APIC",
> -       .irq_ack                =3D apic_ack_edge,
> -       .irq_set_affinity       =3D apic_set_affinity,
> -       .irq_compose_msi_msg    =3D x86_vector_msi_compose_msg,
> -       .irq_retrigger          =3D apic_retrigger_irq,
> +       .name                           =3D "APIC",
> +       .irq_ack                        =3D apic_ack_edge,
> +       .irq_set_affinity               =3D apic_set_affinity,
> +       .irq_compose_msi_msg            =3D x86_vector_msi_compose_msg,
> +       .irq_force_complete_move        =3D apic_force_complete_move,
> +       .irq_retrigger                  =3D apic_retrigger_irq,
>  };
>
>  #ifdef CONFIG_SMP
> @@ -1068,99 +1146,6 @@ void irq_complete_move(struct irq_cfg *c
>                 __vector_schedule_cleanup(apicd);
>  }
>
> -/*
> - * Called from fixup_irqs() with @desc->lock held and interrupts disable=
d.
> - */
> -void irq_force_complete_move(struct irq_desc *desc)
> -{
> -       unsigned int cpu =3D smp_processor_id();
> -       struct apic_chip_data *apicd;
> -       struct irq_data *irqd;
> -       unsigned int vector;
> -
> -       /*
> -        * The function is called for all descriptors regardless of which
> -        * irqdomain they belong to. For example if an IRQ is provided by
> -        * an irq_chip as part of a GPIO driver, the chip data for that
> -        * descriptor is specific to the irq_chip in question.
> -        *
> -        * Check first that the chip_data is what we expect
> -        * (apic_chip_data) before touching it any further.
> -        */
> -       irqd =3D irq_domain_get_irq_data(x86_vector_domain,
> -                                      irq_desc_get_irq(desc));
> -       if (!irqd)
> -               return;
> -
> -       raw_spin_lock(&vector_lock);
> -       apicd =3D apic_chip_data(irqd);
> -       if (!apicd)
> -               goto unlock;
> -
> -       /*
> -        * If prev_vector is empty or the descriptor is neither currently
> -        * nor previously on the outgoing CPU no action required.
> -        */
> -       vector =3D apicd->prev_vector;
> -       if (!vector || (apicd->cpu !=3D cpu && apicd->prev_cpu !=3D cpu))
> -               goto unlock;
> -
> -       /*
> -        * This is tricky. If the cleanup of the old vector has not been
> -        * done yet, then the following setaffinity call will fail with
> -        * -EBUSY. This can leave the interrupt in a stale state.
> -        *
> -        * All CPUs are stuck in stop machine with interrupts disabled so
> -        * calling __irq_complete_move() would be completely pointless.
> -        *
> -        * 1) The interrupt is in move_in_progress state. That means that=
 we
> -        *    have not seen an interrupt since the io_apic was reprogramm=
ed to
> -        *    the new vector.
> -        *
> -        * 2) The interrupt has fired on the new vector, but the cleanup =
IPIs
> -        *    have not been processed yet.
> -        */
> -       if (apicd->move_in_progress) {
> -               /*
> -                * In theory there is a race:
> -                *
> -                * set_ioapic(new_vector) <-- Interrupt is raised before =
update
> -                *                            is effective, i.e. it's rai=
sed on
> -                *                            the old vector.
> -                *
> -                * So if the target cpu cannot handle that interrupt befo=
re
> -                * the old vector is cleaned up, we get a spurious interr=
upt
> -                * and in the worst case the ioapic irq line becomes stal=
e.
> -                *
> -                * But in case of cpu hotplug this should be a non issue
> -                * because if the affinity update happens right before al=
l
> -                * cpus rendezvous in stop machine, there is no way that =
the
> -                * interrupt can be blocked on the target cpu because all=
 cpus
> -                * loops first with interrupts enabled in stop machine, s=
o the
> -                * old vector is not yet cleaned up when the interrupt fi=
res.
> -                *
> -                * So the only way to run into this issue is if the deliv=
ery
> -                * of the interrupt on the apic/system bus would be delay=
ed
> -                * beyond the point where the target cpu disables interru=
pts
> -                * in stop machine. I doubt that it can happen, but at le=
ast
> -                * there is a theoretical chance. Virtualization might be
> -                * able to expose this, but AFAICT the IOAPIC emulation i=
s not
> -                * as stupid as the real hardware.
> -                *
> -                * Anyway, there is nothing we can do about that at this =
point
> -                * w/o refactoring the whole fixup_irq() business complet=
ely.
> -                * We print at least the irq number and the old vector nu=
mber,
> -                * so we have the necessary information when a problem in=
 that
> -                * area arises.
> -                */
> -               pr_warn("IRQ fixup: irq %d move in progress, old vector %=
d\n",
> -                       irqd->irq, vector);
> -       }
> -       free_moved_vector(apicd);
> -unlock:
> -       raw_spin_unlock(&vector_lock);
> -}
> -
>  #ifdef CONFIG_HOTPLUG_CPU
>  /*
>   * Note, this is not accurate accounting, but at least good enough to
> --- a/include/linux/irq.h
> +++ b/include/linux/irq.h
> @@ -486,6 +486,7 @@ static inline irq_hw_number_t irqd_to_hw
>   * @ipi_send_mask:     send an IPI to destination cpus in cpumask
>   * @irq_nmi_setup:     function called from core code before enabling an=
 NMI
>   * @irq_nmi_teardown:  function called from core code after disabling an=
 NMI
> + * @irq_force_complete_move:   optional function to force complete pendi=
ng irq move
>   * @flags:             chip specific flags
>   */
>  struct irq_chip {
> @@ -537,6 +538,8 @@ struct irq_chip {
>         int             (*irq_nmi_setup)(struct irq_data *data);
>         void            (*irq_nmi_teardown)(struct irq_data *data);
>
> +       void            (*irq_force_complete_move)(struct irq_data *data)=
;
> +
>         unsigned long   flags;
>  };
>
> @@ -619,11 +622,9 @@ static inline void irq_move_irq(struct i
>                 __irq_move_irq(data);
>  }
>  void irq_move_masked_irq(struct irq_data *data);
> -void irq_force_complete_move(struct irq_desc *desc);
>  #else
>  static inline void irq_move_irq(struct irq_data *data) { }
>  static inline void irq_move_masked_irq(struct irq_data *data) { }
> -static inline void irq_force_complete_move(struct irq_desc *desc) { }
>  #endif
>
>  extern int no_irq_affinity;
> --- a/kernel/irq/internals.h
> +++ b/kernel/irq/internals.h
> @@ -442,6 +442,7 @@ static inline struct cpumask *irq_desc_g
>         return desc->pending_mask;
>  }
>  bool irq_fixup_move_pending(struct irq_desc *desc, bool force_clear);
> +void irq_force_complete_move(struct irq_desc *desc);
>  #else /* CONFIG_GENERIC_PENDING_IRQ */
>  static inline bool irq_can_move_pcntxt(struct irq_data *data)
>  {
> @@ -467,6 +468,7 @@ static inline bool irq_fixup_move_pendin
>  {
>         return false;
>  }
> +static inline void irq_force_complete_move(struct irq_desc *desc) { }
>  #endif /* !CONFIG_GENERIC_PENDING_IRQ */
>
>  #if !defined(CONFIG_IRQ_DOMAIN) || !defined(CONFIG_IRQ_DOMAIN_HIERARCHY)
> --- a/kernel/irq/migration.c
> +++ b/kernel/irq/migration.c
> @@ -35,6 +35,16 @@ bool irq_fixup_move_pending(struct irq_d
>         return true;
>  }
>
> +void irq_force_complete_move(struct irq_desc *desc)
> +{
> +       for (struct irq_data *d =3D irq_desc_get_irq_data(desc); d; d =3D=
 d->parent_data) {
> +               if (d->chip && d->chip->irq_force_complete_move) {
> +                       d->chip->irq_force_complete_move(d);
> +                       return;
> +               }
> +       }
> +}
> +
>  void irq_move_masked_irq(struct irq_data *idata)
>  {
>         struct irq_desc *desc =3D irq_data_to_desc(idata);
