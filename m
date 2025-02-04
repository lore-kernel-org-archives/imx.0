Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D43182B4
	for <imx@lists.linux.dev>; Tue,  4 Feb 2025 14:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738680610; cv=none; b=a2rW0+rH5tskHtgtHZaGTUytwIyeFcEfBVRPV971eAZfiNzHIi13EY+E7PGgy/j63G3659z52G3vqVZst+7Cjf2NsmmnE9XpICHuJkEZfzYAcSEqJ0VhpXDYFfmcEVFvAFNGnkf63yIODVqwo1cZt3p5vzKeNy4y/UxoGFj738E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738680610; c=relaxed/simple;
	bh=nOJm7PkBZEPpoXCGHLNHbKJW+/E6GyUBJzqj9K7/pbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uf3tsJnpcI8r81ktc9osdWOVPDFhlLj/3ojNtNbylrDgPwGeNLQ+Wqq7ame4iqDNrW5r/m0mPYQCLMZkmeYuJLNIyuSjSE0GmHNyIcxwCRXs6o7KAe+dorPgmKBPT0Gy519ek4imOYv+9kozqnOmY/AlMPDSdIh2fbeSXCg4qY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=F/hINWbD; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="F/hINWbD"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-303548a933aso48285151fa.3
        for <imx@lists.linux.dev>; Tue, 04 Feb 2025 06:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738680606; x=1739285406; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a6qovICTGPEEjhTN07umz778RBWf4L4gwOU9re+tr4g=;
        b=F/hINWbDby7aV9GLuP8IPFeRshfMcVZ2EpyryMyHj/fVeVntOhtY8GCRKDiJngExID
         /1m8hWviiL33MOv7P3aizZE6ceuusVR2KObbTWeSKicCMSll7fsW/+YmNib7geVypnTe
         lL703m7yguXlcpSy+WdmePZeqIc9Mp9wDK6oPM0M/vG36cpBUWbV4m/j/W8Dkm4/DlMZ
         yKdpa99lv2rsGAELOjhMqSjegvd1dnCw9rH4O+VU+4IpuXO+gWuinK38v68cK3sjdIrK
         rIsFORRbbTRxf0F6cgcf8vTaIqdgtUXEYI3K1BFHRbZ+kstZ9zhUBD/SVHuODvsKMP+U
         QypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738680606; x=1739285406;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a6qovICTGPEEjhTN07umz778RBWf4L4gwOU9re+tr4g=;
        b=fm6EvWapjqrdXGpX5L065hNYrPJX8JAvLxOm/5Pk1+StHUP6rmyYXEXpE/6ogP7x6v
         b4F2qNJDAKey/TWoBVfJyVhhMn70kJ8qXjRWhd1vQx2c8jyhQVbVwchGmRFZqLEFQwTP
         HzFUdcbXZdM9lP9EG9Yg71fdSxEfWVZL85SjDVlDU8xEoUpxaLuCZ/RLxjk6za6MAZ6x
         c/qLI+2Kx7LWGj22fyE1noGKthZr/pDZGr+vWo/athdMfTOTtkYs5co7QQZEjCL079wA
         k3SByrYMn2+0iMDX0bowu5FNmkQd6OK+Nm6DicyYhTg1gEtC8wIYo2+z7378KKrCPXGN
         CsDw==
X-Forwarded-Encrypted: i=1; AJvYcCU7k/RRpzMx/NUA1shX3dPb3v2M4iwsrJXHNTf7OwZP5PPvNSDyoz8K5ViCPyQURbuu/N8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxp06SHb/3u5+O8EAFi/G9EFebcGfjuJcnCwOIgMgQ2iVXzL3e+
	bQlF4T55snE2eMvgYM58vGAXBeMrgRwagvC8EOcJDewUMOpjNEwcskXSucYxAhtoheFFyIGbLsL
	m55+n7nU0XfsJhMmK7mjixJoI6c3ky2tSGtw2Yg==
X-Gm-Gg: ASbGncvebiXDavJgqNnRfcK375FBispQmEG9nGSNuBbb+M3cka/krTgrJQ6ZwwC0gyI
	2uAL0pw27ivJZq47xiLoxuzzOtOP1ndGZznXlApnMbTYhH/IwcjAxDp2xi4RfGUgY4XQf8bENuQ
	==
X-Google-Smtp-Source: AGHT+IHDEbsYQipfejXqFohjxLWs79QcoPD2kP+1yrW9qYk9n/SN/qyoP+wLyuKonmtT1FmQCmqnzeGwlD2OFASKWU0=
X-Received: by 2002:a05:651c:2115:b0:302:3a28:76cf with SMTP id
 38308e7fff4ca-307968e725emr115509751fa.25.1738680606043; Tue, 04 Feb 2025
 06:50:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250204075405.824721-1-apatel@ventanamicro.com>
 <20250204075405.824721-11-apatel@ventanamicro.com> <87o6zinl5o.ffs@tglx>
In-Reply-To: <87o6zinl5o.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 4 Feb 2025 20:19:53 +0530
X-Gm-Features: AWEUYZnsP5bIEqfYtAEgSHeeevhnHrIfy83h-jtA8at0gwbWoWLEsA0X1oOoSQI
Message-ID: <CAK9=C2VgOnSVBRPh+bJBQnGreVYcUh6HWVg1MEzDtfYsuT0s-g@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] irqchip/riscv-imsic: Use IRQCHIP_MOVE_DEFERRED
 flag for PCI devices
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

On Tue, Feb 4, 2025 at 2:26=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> On Tue, Feb 04 2025 at 13:24, Anup Patel wrote:
> > Devices (such as PCI) which have non-atomic MSI update should
> > migrate irq in the interrupt-context so use IRQCHIP_MOVE_DEFERRED
> > flag for corresponding irqchips.
> >
> > The use of IRQCHIP_MOVE_DEFERRED further simplifies IMSIC vector
> > movement as follows:
> >
> > 1) No need to handle the intermediate state seen by devices with
> >    non-atomic MSI update because imsic_irq_set_affinity() is called
> >    in the interrupt-context with interrupt masked.
> > 2) No need to check temporary vector when completing vector movement
> >    on the old CPU in __imsic_local_sync().
> > 3) No need to call imsic_local_sync_all() from imsic_handle_irq()
>
> I have no idea how you came to that delusion.
>
> IRQCHIP_MOVE_DEFERRED is part of the mechanism to handle this insanity
> correctly. It does not prevent the device from observing and actually
> using the intermediate state. All it does is to ensure that the kernel
> can observe this case and act on it.
>
> The fact that the kernel executes the interrupt handler on the original
> target CPU does not prevent the device from firing another interrupt.
> PCI/MSI interrupts are strictly edge. i.e. fire and forget.
>
> IRQCHIP_MOVE_DEFERRED solely ensures that the racy affinity update in
> the PCI device happens in the context of the original target CPU, which
> is required to handle all possible cases correctly.
>
> Let's assume the interrupt is affine to CPU0, vector A and a move to
> CPU1, vector B is pending. So we have three possible scenarios:
>
> CPU0                            Device
> interrupt
>                                 1) Raises interrupt on CPU0, vector A
>   ...
>
>     write_msg()
>         write_address(CPU1)
>                                 2) Raises interrupt on CPU1, vector A
>         write_data(vector B)
>                                 3) Raises interrupt on CPU1, vector B
>
> #1 is handled correctly because the interrupt is retriggered on CPU0,
>    vector A, which still has the interrupt associated (it's cleaned up
>    _after_ the first interrupt arrives on CPU1, vector B).
>
> #2 cannot be handled because CPU1, vector A is either not in use or
>    associated to a completely unrelated interrupt, which means if that
>    happens the interrupt is lost and the device might become stale.
>
> #3 is handled correctly for obvious reasons.
>
> The only way to handle #2 properly is to do the intermediate update to
> CPU0, vector B and checking for a pending interrupt on that. The
> important role IRQCHIP_MOVE_DEFERRED plays here is that it guarantees
> that the update happens on CPU0 (original target). Which in turn is
> required to observe that CPU0, vector B has been raised.
>
> The same could be achieved by executing that intermediate transition on
> CPU0 with interrupts disabled by affining the calling context (thread)
> to CPU0 or by issuing an IPI on CPU0 and doing it in that context. I
> looked into that, but that has it's own pile of issues. So at the end
> moving it in the context of the interrupt on the original CPU/vector
> turned out to be the simplest way to achieve it.

I got confused because IRQCHIP_MOVE_DEFERRED updates affinity
with the interrupt masked which I interpreted as masked at the device
level. Also, PCI MSI mask/unmask is an optional feature of PCI devices
which I totally missed.

I will keep the intermediate transition in the next revision. Thanks for
the clarification.

Regards,
Anup
