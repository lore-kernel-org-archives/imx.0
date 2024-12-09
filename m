Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D96121CFEC
	for <imx@lists.linux.dev>; Mon,  9 Dec 2024 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733746113; cv=none; b=a+ul49JkwprTp2v92+ncBaCApmWbfh32oYQ/98n3Z3rSK+UYhBehNwqUh7s7fobgkbn1JvyHXdJK6YBbJZLmDTNRY80GxOL7rU9nQk7NyqstTi0Q7WZrja8UZQ7n0ck16mfUlspmoJCcxop8fTLe/2xNv3bXzcV97DC+czKcXVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733746113; c=relaxed/simple;
	bh=wkMAPu6pVsIJyxNBUAniG1KG3qIMQAaDvRb5yVKgZ1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CKvxMIFEprxtVmpKBSSTWvdgDOe1QVLj1XeuqIC3psKPouzxF4+m0Kgn/dA3u4LOz8MoOAPP2MpTLGibMPtYz+TNEWpsn2MbMFOja6rKtURqMeVFN9jPjLEF+L45xatOtuworMm/5Ih4t5+7/yw5hhJudfasV8gFh44hahladYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=OjBDsb7k; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="OjBDsb7k"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30037784fceso23959991fa.2
        for <imx@lists.linux.dev>; Mon, 09 Dec 2024 04:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1733746110; x=1734350910; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6gzkDAhzXovMDqEI+9lRYWllf8EEHxno6K1iEAuLoM=;
        b=OjBDsb7kl1A26R9FMICIwcMhUxaLGddH0V+WTYkfkcUT8oQCrqX4/I2hPqLSwkEDNz
         Bkhlrkel6w4jFFsOILmzhYam5yF/TENmwt+2LyLZ31eQk3GJbdE/R2CFFxGHIC7IZX3b
         c8E4gvlc0w40xhRYpVRBciZH+WZiEdFBZ3oEUWGIr1DA85aE8h4DpHdOpD1PLFovOYxa
         LYZzIaRWEpDOmY7DDS5nuucgT4HMcD640wSDmum8nyVUXZjgD5UFxZ52XCQiEgYTAtYJ
         BAZYChhIsacoUJ42AVWdYyNRrFV+E7w2rRaV0+3PB+bij3piOD97zRzauKp03m5d3w7J
         baAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733746110; x=1734350910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6gzkDAhzXovMDqEI+9lRYWllf8EEHxno6K1iEAuLoM=;
        b=w9XUkoawqj4nkpiXrR/MnoC9E5scztIGV+pCGtaxkUwO0lj7UM0wku4LrnfLEGY7ZZ
         hZDN5Jm6u/EhXiPzRM/2H3qW19mJxc8OYQqpFzJLv0r9H+IfUjUuJU3sS2J5Tcp3qHwo
         TclH5C5HeQUn9PCwbNnnSMN1OJHMIfsMHauZnXCuPqq7IUx4K0hXDcQG8MsQt1/gxv9N
         YdQ/944JQyW3jW1haL3u9yKJUOz/m4QkJc80U+Ye8nyHZh28oe7F2T1JprIjmsufq9HI
         k7RQcNGsExHj7wumXzmRca0ZygGwb1nRJDPP39FFr7wdeR0/AmaIG96HMzrCG9E9AMmb
         ydEA==
X-Forwarded-Encrypted: i=1; AJvYcCVTH3jX8i9MwDh9EU/uc/YfuEbSrZ0MZ6eEuHSMO9xbNyIhNfQEsjeUKMlgF4m0D2/5AN4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAFJShU0/kV33LE/Hpx9CmBfQov/1BWNaMF9zxG2j3hM99b+Pu
	UZtB/U+jwuMDNuWo4d3hIeY2wn9v9yxTCOR09Uqhud68Cxso7JS+qsjv4xeIfKarNL6peZalLVK
	d8hFhOrkK6YjGjMuAmzSnOZuIdQYoKjwyeSGJIA==
X-Gm-Gg: ASbGncv7+aO3hcQtli/v6toX34Ltqiky///7VrJ/+lAWDb999KcdNPBp+TcZgwYlzkS
	UzQrPLpCBp97oTghOifpWQFq2uWDF4l2SFA==
X-Google-Smtp-Source: AGHT+IE7s57c5CX5EN+0VrV/XwVhMQsRyEe4E1tm7jFdZ3xrCHKp5MnSIFcNY2K88pwSkR5p5gRdx23gp0eZz8tJNGY=
X-Received: by 2002:a2e:b013:0:b0:300:33b1:f0cc with SMTP id
 38308e7fff4ca-30033b1f3femr48347421fa.34.1733746109558; Mon, 09 Dec 2024
 04:08:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241208150711.297624-1-apatel@ventanamicro.com>
 <20241208150711.297624-2-apatel@ventanamicro.com> <875xnuq6dc.ffs@tglx>
In-Reply-To: <875xnuq6dc.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 9 Dec 2024 17:38:18 +0530
Message-ID: <CAK9=C2VqU2mdLL-R20bdgvDHi0WcuNyUSqRo7Pztsu-8X1wVvw@mail.gmail.com>
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

On Mon, Dec 9, 2024 at 1:44=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> On Sun, Dec 08 2024 at 20:37, Anup Patel wrote:
> > +
> > +                     tvec =3D vec->local_id =3D=3D mvec->local_id ?
> > +                            NULL : &lpriv->vectors[mvec->local_id];
> > +                     if (tvec && __imsic_id_read_clear_pending(tvec->l=
ocal_id)) {
>
> As I told you before:
>
> I don't see a way how that can work remote with the IMSIC either even if
> you can easily access the pending state of the remote CPU:

For RISC-V IMSIC, a remote CPU cannot access the pending state
of interrupts on some other CPU.

>
> CPU0                            CPU1                   Device
> set_affinity()
>   write_msg(tmp)
>     write(addr); // CPU1
>     write(data); // vector 0x20
>                                                         raise IRQ (CPU1, =
vector 0x20)
>                                 handle vector 0x20
>                                 (other device)
>
>     check_pending(CPU1, 0x20) =3D=3D false -> Interrupt is lost
>
> There is no guarantee that set_affinity() runs on the original target
> CPU (CPU 1). Your scheme only works, when CPU1 vector 0x20 is not used
> by some other device. If it's used, you lost as CPU1 will consume the
> vector and your pending check is not seeing anything.
>
> x86 ensures CPU locality by deferring the affinity move to the next
> device interrupt on the original target CPU (CPU1 in the above
> example). See CONFIG_GENERIC_IRQ_PENDING.

I agree with you.

The IMSIC driver must do the affinity move upon the next device
interrupt on the old CPU. I will update this patch in the next revision.

BTW, I did not find CONFIG_GENERIC_IRQ_PENDING. Is the
name correct ?

>
> The interrupt domains which are not affected (remap) set the
> IRQ_MOVE_PCNTXT flag to avoid that dance and don't use that affinity
> setter code path at all.

Yes, setting the IRQ_MOVE_PCNTXT flag in the remap domain
makes perfect sense.

I suggest adding IRQ_MOVE_PCNTXT usage as part of Drew's
irqbypass series which adds a remap domain in the IOMMU
driver. Unless you insist on having it as part of this series ?

Regards,
Anup
