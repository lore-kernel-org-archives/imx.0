Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE64346FDA
	for <imx@lists.linux.dev>; Fri, 19 Jun 2026 06:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781849454; cv=pass; b=tN9O6RrjlwlRIcr2k/pWMem4YyGN+DCLRHD6W2hQwLVRv9xhnNabKXMld3iE4jtdOYZfKhphvzY0Pq/JMs0hfNIM4Z9GA/9oB1nIgIrHf9ABWh2HIv3/JzgrIs2E/nfA09zZn+tzq7/d1aw7o4xbOv7Yai/xotye3LR/oDO4vP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781849454; c=relaxed/simple;
	bh=dk2S5WBPELrkoYZjdzCA40IFW7G6nPxmUcJbi0UDXs0=;
	h=From:References:MIME-Version:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j9SvgTvzHrtbOV3QUp+hirl77seXCbml/6pjqSFgemz2QUADyTMNYxUcj9zLG99tSeCrtrXsyG4BRBp8YAp0+H05rf0JPwFzlHvSwaVX8RT/zb9IphCwuoxtqNje1/tk99KeEAdHEeh0ab3TIIzG9PjEPD1/3a4KQ/K7gdfMOqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HGrMI4Do; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HGrMI4Do"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c07a6520cafso185839566b.0
        for <imx@lists.linux.dev>; Thu, 18 Jun 2026 23:10:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781849449; cv=none;
        d=google.com; s=arc-20240605;
        b=RrMGg2tQr8TdoQqzpDma2L4sKaNdsmlXyMQ6wqgdwIwdnldJhlZsSS0EG8k/qFVFNW
         cvduC14bqOwbGrjyup8oq6HAnxD6JI7GvPozvS+DRaHXrXjv7PRHC0NvKqDNSxT+5G7g
         e7n0NHk7cP8IojBxIdHJ3KEnvKjI+addONAqTvVKSol0IZZsqgX5USpTI3FE0OdLhG0J
         /PIJA61Ozv20boJZFD0XRMh8xzzttkzllOSYoGxeqsPHUZ8dLckMZS0wpkzN+bIhIXyy
         XoPMiW4PmBziVO/toB9BMX7e4fOuwmpO4wlMaFTMjSDcsRSq0F0XzPlM4Sxjx/RXygbI
         lIyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:dkim-signature;
        bh=v9MezgOvVYdDVhHOvhxfflYG59sVc/14+1QAhEmgyMo=;
        fh=dnJDq5anIilNlYLG8WHX9GG0obJxy3URAJOzeqBsA2M=;
        b=FKXYUV4kx1H6c2mRF1uwlR5hEMTsM8Rbgit1EjJIUR38hscf3e17NK/mcxfqfTn1qo
         OEpeo9MaLqEwkiJQWDkuk3jLNS37uKfvqvN39LVKGGxNrhbo1M3umio6zqi6yvYhoGD1
         nz3X9KkT3cGGLKIPA4h60g0GElUFe81/UcWk+rEPailncJkXdohpt0vtb12Ho/2HoEBb
         Twvk+FAjPgF//DoO9LEfaBUriFjI0Dl0mWA4O7DBqrES8oI2/Cqs+pJyelPU382a+1CZ
         SiIILvx/1akNqMO1Llc/U/cerOwo/fTDuvTBooPsRiKSEm1BlCLw5NQGzI/N62a4qhDR
         6nmw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781849449; x=1782454249; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=v9MezgOvVYdDVhHOvhxfflYG59sVc/14+1QAhEmgyMo=;
        b=HGrMI4DoyiLTGeOCdYhJ+dGP3ffeozLPKwkaXgnRBhoQBjZ5fED0/Td5BQkPIb9VSO
         rYscp9vdMpms4+6xNJ1VdAAfjWtRGI21tpb4Qze8UdPjGtRQ0o1R4Ph6psiy9x9ZaBVx
         cVkehePfgdYnVqBpV2AwsT989SXmMcpxrqDtavR1t/XVJf8/X6/Rnnzhu7WRuIX8MgIU
         fdLGVdo0l4DXY1O4t5+4W/OKhlIJvVCSq6sYIdqTI/HXfncIQ1sqA32158gmmcxBBffB
         Ek/PSC6MFL9zRchIY1Xhphe95C+xtNSKM32S6PtDTWV1nyTnwCp0wHG9aDYdaEVjftZK
         9itQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781849449; x=1782454249;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v9MezgOvVYdDVhHOvhxfflYG59sVc/14+1QAhEmgyMo=;
        b=kEMgMqYMiLUf4GjvVa25XfLiSLn/mxJnL/tMpBodFJX8Dh+WA84HMc7xz1jnTp/j/6
         aRrZcRHdSC/AI/gD/alcxkhEili/0HoNp8lvdimrU9/JULK76SOtT5ZYMpYyn45x8FEW
         68JaTNwY9lwx5rWReDdOFgRXMm+s+ViTtv93yhPJVsvS6EsceCgRJS5E74fyNVYZ4JFR
         TIa1ZW8WKmatUjMsNnBTWpW9TtH9YoeaAvRkvndifE8yuYaXwktbDQF/tswj1Ks26PjT
         DaVO+H8dGIQkBfbEteVr2i7RX3mQzM+ZZEIM60pY28HghlxONcFHAJPNqBsQV0/Sn08a
         8ZlA==
X-Forwarded-Encrypted: i=1; AFNElJ/QB64cRaZhaLsQ7kj2mvuXuZ8XftkPnPqFdvOudC96rMZb34n/OoTLk+r1APrOqrN/V8s=@lists.linux.dev
X-Gm-Message-State: AOJu0YydakRmRl2UZcKWu5XL4F0vAuYjOnqk/s3AlVK6ec8MZ6JS7ORD
	ChgHjP/m1qWl79t+W7QuDWm3Bx2Sj7EGozzKYBWQrNBX9CrnAAt7Uw+tkgNH+9ex91d9mOEE+Vb
	4+cX9Qrg1Veky5oLLq8TrxKIiptIAX75cKx6DJp3ozF/QGiQVGZGb
X-Gm-Gg: AfdE7clR5YHHGxpt/t2hiaHjSDSbGOiJw27xZ9FtdMvNioPgpg6mIB3iT1FEhpjSIBQ
	fqop3KX5NWGJaMo+vitKBNsH0yh0x6CCWLU9JlPUZP39yFBpDZvIJEoNHsVFY15NSFGr9Jh06uA
	DZ1W1ssMUZMZES6COrIFUbYTBQd93yR9l4fHmZS5NXmCMI3D2TbQB7ztMa5tnCIiXxA9NG+H5TB
	K6xTL7Jtd3dbo78/oAH5yspP5LgVfiG1G3TNHyjnuHgqtZ+o+6srAIH0YDbxPbDsi6XmxPovdeu
	iqeKys5m73klc3DhJaxjxnu/Jg==
X-Received: by 2002:a17:907:3e98:b0:bf1:a59e:653f with SMTP id
 a640c23a62f3a-c097c9c486cmr103959766b.28.1781849449146; Thu, 18 Jun 2026
 23:10:49 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 18 Jun 2026 23:10:48 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 18 Jun 2026 23:10:48 -0700
From: Angelo Dureghello <adureghello@baylibre.com>
References: <20260609142139.1563360-6-gerg@linux-m68k.org> <20260610142725.031C31F0089A@smtp.kernel.org>
 <937086f1-5158-41e9-9194-b6d1feaee17f@linux-m68k.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <937086f1-5158-41e9-9194-b6d1feaee17f@linux-m68k.org>
Date: Thu, 18 Jun 2026 23:10:48 -0700
X-Gm-Features: AVVi8CeRdz8EjQv7N6iu4inU7GEg0JeeUbGrB_UMI7cQpI9RGlKWq-bZNMislQ0
Message-ID: <CALSJ-wAO-HpN+9E4cNrfQ0ELF6akddMv7DBXE2W2tKxRWvEZtQ@mail.gmail.com>
Subject: Re: [PATCHv2 4/4] m68k: coldfire: fix non-standard readX()/writeX() functions
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: sashiko-reviews@lists.linux.dev, Oliver Hartkopp <socketcan@hartkopp.net>, 
	Vincent Mailhol <mailhol@kernel.org>, linux-can@vger.kernel.org, Frank.Li@kernel.org, 
	Oleksij Rempel <o.rempel@pengutronix.de>, Marc Kleine-Budde <mkl@pengutronix.de>, imx@lists.linux.dev, 
	Angelo Dureghello <adureghello@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

Hi,
On Thu, Jun 11, 2026 at 11:35:02PM +1000, Greg Ungerer wrote:
> Hi Sashiko-bot,
>
> On 11/6/26 00:27, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> >
> > New issues:
> > - [High] The transition to asm-generic readX()/writeX() changes the endianness of ColdFire internal IO accesses, breaking unpatched ColdFire drivers.
> >
> > Pre-existing issues:
> > - [High] Undefined behavior when shifting 1 by 32 or more using `BIT(ch)` in `mcf_edma_tx_handler`.
> > - [High] The error interrupt handler incorrectly skips handling high channels and returns `IRQ_NONE` after servicing low channels.
> > --
> >
> > commit 25193db3eba89f780b6dc534f2f72e16f3429571
> > Author: Greg Ungerer <gerg@linux-m68k.org>
> >
> > m68k: coldfire: fix non-standard readX()/writeX() functions
> >
> > Remove the local ColdFire definitions of readb()/readw()/readl() and
> > writeb()/writew()/writel() and use the asm-generic versions of them.
> >
> > > diff --git a/arch/m68k/include/asm/io_no.h b/arch/m68k/include/asm/io_no.h
> > > index 4f0f34b06e37c..2f12f4ed0da54 100644
> > > --- a/arch/m68k/include/asm/io_no.h
> > > +++ b/arch/m68k/include/asm/io_no.h
> >
> > [ ... ]
> >
> > > -#define writel writel
> > > -static inline void writel(u32 value, volatile void __iomem *addr)
> > > -{
> > > -	if (cf_internalio(addr))
> > > -		__raw_writel(value, addr);
> > > -	else
> > > -		__raw_writel(swab32(value), addr);
> > > -}
> >
> > [Severity: High]
> > Does replacing the local readX()/writeX() with the asm-generic versions
> > change the endianness of unpatched ColdFire drivers?
> >
> > The old ColdFire implementation detected internal IO memory using
> > cf_internalio() and bypassed byte-swapping to provide native big-endian
> > access. The asm-generic accessors always assume little-endian devices and
> > perform byte-swapping.
> >
> > Will unpatched drivers relying on readX()/writeX() for internal IO
> > (such as spi-coldfire-qspi.c, sdhci-esdhc-mcf.c, or fec_main.c) now read
> > and write byte-swapped values and malfunction?
>
> This is of course a real problem, and much effort has been expended to
> find and fix affected drivers. Specifically here:
>
>     patch 1 in this series fixes fec_main.c
>     patch 3 in this series fixes sdhci-esdhc-mcf.c
>     patch 4 (this patch) fixes spi-coldfire-qspi.c with the endian change to spi-fsl-dspi.c
>
> Not mentioned here, but patch 2 in this series fixes the smc91x driver.
>
> It is not believed at this time that any other drivers are affected.
>
>
> > [ ... ]
> >
> > > diff --git a/drivers/dma/mcf-edma-main.c b/drivers/dma/mcf-edma-main.c
> > > index 9e1c6400c77be..4ed0ce644e37e 100644
> > > --- a/drivers/dma/mcf-edma-main.c
> > > +++ b/drivers/dma/mcf-edma-main.c
> > > @@ -21,9 +21,9 @@ static irqreturn_t mcf_edma_tx_handler(int irq, void *dev_id)
> > >   	unsigned int ch;
> > >   	u64 intmap;
> > > -	intmap = ioread32(regs->inth);
> > > +	intmap = ioread32be(regs->inth);
> > >   	intmap <<= 32;
> > > -	intmap |= ioread32(regs->intl);
> > > +	intmap |= ioread32be(regs->intl);
> > >   	if (!intmap)
> > >   		return IRQ_NONE;
> >
> > [Severity: High]
> > This is a pre-existing issue, but does this shift invoke undefined behavior
> > for higher channels?
> >
> > Looking at the loop immediately following this in mcf_edma_tx_handler():
> >
> > 	for (ch = 0; ch < mcf_edma->n_chans; ch++) {
> > 		if (intmap & BIT(ch)) {
> > 			...
> >
> > On a 32-bit architecture like m68k, BIT(ch) expands to a 32-bit unsigned
> > long. Since ch can be up to 64, shifting by 32 or more would be undefined,
> > potentially causing channels 32-63 to be improperly processed or missing
> > their interrupts entirely.
> >
> > Should this use BIT_ULL(ch) when testing against the 64-bit intmap?
> >
> > [ ... ]
> >
> > > @@ -43,7 +43,7 @@ static irqreturn_t mcf_edma_err_handler(int irq, void *dev_id)
> > >   	struct edma_regs *regs = &mcf_edma->regs;
> > >   	unsigned int err, ch;
> > > -	err = ioread32(regs->errl);
> > > +	err = ioread32be(regs->errl);
> > >   	if (!err)
> > >   		return IRQ_NONE;
> >
> > [Severity: High]
> > This is a pre-existing issue, but does this early return incorrectly skip
> > handling high channels?
> >
> > If regs->errl is zero, it returns IRQ_NONE immediately, ignoring any errors
> > in regs->errh. This could leave errors in higher channels uncleared.
> >
> > [ ... ]
> >
> > > @@ -55,7 +55,7 @@ static irqreturn_t mcf_edma_err_handler(int irq, void *dev_id)
> > >   		}
> > >   	}
> > > -	err = ioread32(regs->errh);
> > > +	err = ioread32be(regs->errh);
> > >   	if (!err)
> > >   		return IRQ_NONE;
> >
> > [Severity: High]
> > This is a pre-existing issue, but does this return the wrong IRQ status if
> > low channel errors were already handled?
> >
> > If errl was non-zero (so some errors were handled) but errh is zero,
> > returning IRQ_NONE here instead of IRQ_HANDLED might incorrectly signal
> > to the IRQ subsystem that the interrupt wasn't handled at all.
>
> At casual inspection these may well be real problems. I will have to defer
> to the driver author and current maintainers for them to fix. The changes
> to fix ColdFire readl()/writel() have no effect on these, and are really
> outside of the scope of this series.
>
> Thanks for the review!
>

will fix this. Thanks.

> Regards
> Greg
>
>
>
Regards,
angelo
>
