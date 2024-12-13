Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B9A1C3BE7
	for <imx@lists.linux.dev>; Fri, 13 Dec 2024 15:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734104648; cv=none; b=JBJ6/j0V2SMtb/zZOVVj6x7Mo780lFthq0JPPd2yslj69SamalWUJ8sbxinhP+5WqCF8SNfFH8EIFzkmah01EzwDNDXfNQwEYY3GHsGZCcZIgY7kdpFPnGfY18lhKAQjdC5gCjeVy+lMNYNrNehbpGgQMJ/z1eoU0t0W8qbmgK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734104648; c=relaxed/simple;
	bh=yUqHq0lbebJEoW8xZlmwhDVjB4dI3bj/g8P3DfRDrxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WVqYNzK6Hgdsk/jIks5gKbQmCzdPWUui8OvkRDYzfmNz0+FxTk/2CwJJ/zhRCufZljTERNC/bBq0ukEaRCyXg+q3oi0pqU/+aOpGR2qO6an0CJnqB2fQdMGMBxcpLX2MNk+JKkpC/GCAuDtrFsBmacjDDnJl+DUKXiJU4bs/pf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=d17eLQM7; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="d17eLQM7"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so1883832e87.2
        for <imx@lists.linux.dev>; Fri, 13 Dec 2024 07:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734104644; x=1734709444; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0ijAsgfcCAkYLFOhSL209z2mytAy3LE8Gke6LPHkUA=;
        b=d17eLQM7HkNOeShQkLUA0rpJD/K5kotZZencrmsXDjtxy6ee9B6ASgNkuHcsSnSvBA
         7AnIRLNdIBpe5qiY9Fh2/7Ft7m0CdVkY6cfEiTDU4ArdCoy9Wm1lLN18iDQGjGfGpdnj
         vL2AI3l1I2OOWTNSUbfgWd8B8qNG/cghz9Bs3htA+XUjc75WxktUbTsGrTwvYUZGa4Z5
         dyfuJ+AQzXvGdMYtT1xYfHfjzW/SL3K+5jlPBCaYCTgV6qeMnBlgq66l0acJrM6NzSri
         FFVPUuQYR4WwrU8t655G9DNLY8lbQIl2m3lmHob8VKGUn/N6S8aZVfv2scdhvN+MEi1C
         204A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734104644; x=1734709444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0ijAsgfcCAkYLFOhSL209z2mytAy3LE8Gke6LPHkUA=;
        b=VqDLWisMJLkhD2vcMXnehgHIXVT2IS4pq8Wcsso1xWN3G9vRU2fyWjBZ+EMlmhBnb+
         HMKaAQBYVQpu5lyb7/4NujvYZvMAci3pbMblcktm+ySebwUr2hasxMwrZvjqmIqn28bt
         P/QvdN3P3KJgTb9x8ddKWA5bOH0zjfIZt41dhR9FS7d/o2Ot4Y8o2w9Hq16Ap6sdsR4y
         2TZqiaJ7OshVSu71yxMVQUhFWT/beiSf3cvUAFF4awg9in1Ksr1aNQMe5EQ/IeXkNTTy
         5iMAHx6KyyKlrDy7ymwyouIZSDj8g7SnA9oWgOsk/TBQ1Hsp4+h/hR+gmL3F5DP7h5kp
         lg9g==
X-Forwarded-Encrypted: i=1; AJvYcCVkkzIbpvIp4RycG/SxI/jS4QREd/EhXjUS1JiakWlXc6j2bYhYpJG6aOPKcoXNbIwhejg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+9JVWIn2GzKfuakrKHwpc6GoTi0EImhp+rCgFg6lH9E5K+0Fu
	7iRunm8nEU4zi0iE7NchWur5+ZrgxsAK0CyRYWRPiQEWN+vApYIeH8NAYk5irPXty5EnjbE10vd
	vvFJcGmIJqwYKLpkU9Ve1rd0pTotAJZfKFs8GFg==
X-Gm-Gg: ASbGncvWjmAaHcfBYAbWEuShtZupJfPnb1a4KXJmD2497wNsuPyv+V24vnIcQUfoT58
	R5BHCpljgnEOwGU55IFsMrLrFZeBIdwZH3rBOYSo=
X-Google-Smtp-Source: AGHT+IFTUSDlblXeHlfVDe8niGAxTlpQ6jMgiT9dHwTwMbW1zIwAk0PUlMzR2hff1vm/DrjTiJgiQiYP2mI3M++ExsU=
X-Received: by 2002:a05:6512:39cc:b0:540:2f59:7561 with SMTP id
 2adb3069b0e04-54099b699d2mr968768e87.50.1734104644176; Fri, 13 Dec 2024
 07:44:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241208150711.297624-1-apatel@ventanamicro.com>
 <20241208150711.297624-2-apatel@ventanamicro.com> <875xnuq6dc.ffs@tglx>
 <CAK9=C2VqU2mdLL-R20bdgvDHi0WcuNyUSqRo7Pztsu-8X1wVvw@mail.gmail.com>
 <87r06gq2di.ffs@tglx> <CAK9=C2XEhtB00y6WTMaO0X=7K820T_BSCLA5bw6hJbfvQAD+Pw@mail.gmail.com>
 <877c84ade6.ffs@tglx>
In-Reply-To: <877c84ade6.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 13 Dec 2024 21:13:52 +0530
Message-ID: <CAK9=C2Xyqk1WRHTXa_74s1uWuuMP5d=RBpnoSREvuF=C3OWW_A@mail.gmail.com>
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

On Fri, Dec 13, 2024 at 1:21=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> On Thu, Dec 12 2024 at 22:11, Anup Patel wrote:
> >> --- a/kernel/irq/chip.c
> >> +++ b/kernel/irq/chip.c
> >> @@ -47,6 +47,13 @@ int irq_set_chip(unsigned int irq, const
> >>                 return -EINVAL;
> >>
> >>         desc->irq_data.chip =3D (struct irq_chip *)(chip ?: &no_irq_ch=
ip);
> >> +
> >> +       if (IS_ENABLED(CONFIG_GENERIC_PENDING_IRQ_CHIPFLAGS) && chip) =
{
> >> +               if (chip->flags & IRQCHIP_MOVE_DEFERRED)
> >> +                       irqd_clear(&desc->irq_data, IRQD_MOVE_PCNTXT);
> >> +               else
> >> +                       irqd_set(&desc->irq_data, IRQD_MOVE_PCNTXT);
> >> +       }
> >
> > We need similar changes in irq_domain_set_hwirq_and_chip()
> > because we use IRQ_DOMAIN_HIERARCHY in RISC-V.
>
> Grr, you are right. Let me add that to the base patch.
>
> >>         irq_put_desc_unlock(desc, flags);
> >>         /*
> >>          * For !CONFIG_SPARSE_IRQ make the irq show up in
> >> @@ -1114,16 +1121,21 @@ void irq_modify_status(unsigned int irq,
> >>         trigger =3D irqd_get_trigger_type(&desc->irq_data);
> >>
> >>         irqd_clear(&desc->irq_data, IRQD_NO_BALANCING | IRQD_PER_CPU |
> >> -                  IRQD_TRIGGER_MASK | IRQD_LEVEL | IRQD_MOVE_PCNTXT);
> >> +                  IRQD_TRIGGER_MASK | IRQD_LEVEL);
> >>         if (irq_settings_has_no_balance_set(desc))
> >>                 irqd_set(&desc->irq_data, IRQD_NO_BALANCING);
> >>         if (irq_settings_is_per_cpu(desc))
> >>                 irqd_set(&desc->irq_data, IRQD_PER_CPU);
> >> -       if (irq_settings_can_move_pcntxt(desc))
> >> -               irqd_set(&desc->irq_data, IRQD_MOVE_PCNTXT);
> >>         if (irq_settings_is_level(desc))
> >>                 irqd_set(&desc->irq_data, IRQD_LEVEL);
> >>
> >> +       /* Keep this around until x86 is converted over */
> >> +       if (!IS_ENABLED(CONFIG_GENERIC_PENDING_IRQ_CHIPFLAGS)) {
> >> +               irqd_clear(&desc->irq_data, IRQD_MOVE_PCNTXT);
> >> +               if (irq_settings_can_move_pcntxt(desc))
> >> +                       irqd_set(&desc->irq_data, IRQD_MOVE_PCNTXT);
> >> +       }
> >> +
> >
> > These changes in irq_modify_status() need to be dropped to support
> > the above changes in irq_domain_set_hwirq_and_chip().
>
> Why? With CONFIG_GENERIC_PENDING_IRQ_CHIPFLAGS enabled this hunk is
> compiled out. So nothing is modifying PCNTXT here. That's the whole
> point.
>

Understood, please ignore my previous comment.

I was using irq_set_status_flags() in irq_domain_set_hwirq_and_chip()
which did not work because irq_modify_status() did not modify PCNTXT.

Regards,
Anup
