Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40E723EA9B
	for <imx@lists.linux.dev>; Wed, 17 Dec 2025 12:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765976096; cv=none; b=gz/3C00TK1m6qHd7NuaLd1rZ90X0mq13tYa7mQgO8GgxDi3/K0XWwNHJyE+Ngcu3WVblv1BwsWErsbKk9/V3Xxmx5UMMWePrOoDZqks0tf9pPnafPEckNessHvZzf8WHr7WZh+SRwuE2mOqdwSWFWNDB/WXFf66eektL2Bo+llE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765976096; c=relaxed/simple;
	bh=G4F2uaGJQmt7bSFp2+IgrlP6CrHtglRAzxQKVYY8gok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XBvfN1WitYHd8NsEJc7vv0US/KL5YEV6W6ehbOGVjrkTyG8cZ5NZWHiwUYTAIp5IgwKdLnU4iyvZ6lQjNc+gyZjE5hlfsiem+8GPqXyQ3nJoKnX0AaI660clrGu60Q/PjGfUCqGt9yVQCnw5lJZJRax8fPPf5KecLoiMR+LDH2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWxMFDQC; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWxMFDQC"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0bae9aca3so48950545ad.3
        for <imx@lists.linux.dev>; Wed, 17 Dec 2025 04:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765976094; x=1766580894; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WB9IDMyF7C6rUTb7bWFFG4m+8S18M2qqzE6q3X6CiU=;
        b=cWxMFDQC2Ei7y7PARX7qH4PDJMSynTQGgCQwF6babGoMUSnqUhMJLFucGp9MtESfDB
         T70TmHEvEGH7oTpa/jFLb795m0Ju+xvjOJnKKeLWnQ7whp80Zy1RWJs5l52zxK2LBlZJ
         pMoxnVlqMFtVPPLVRkztihQaDlREdW1z2LGmiIEDZaZuG1s/leawV6iLFAU/JHlyNdC3
         maBsIPhiJ9aSE0MGA6cZeXvNi0U/gKmFATrZsxwvgBVhwjZC04VG8qwEMh5DjNmWYl/a
         kIL+eLezWvealwh5DXRmuFyRAUika6o3Kcvz4xCZjKlwMNHzDIzc2aDgXpFqC1fo1fJb
         Dl6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765976094; x=1766580894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1WB9IDMyF7C6rUTb7bWFFG4m+8S18M2qqzE6q3X6CiU=;
        b=u1PwiHAdGjEMCiUtKwhzSgj2Jtkt82NUs5OkpBR49a+ggQ6UwdRdcv0sDaTZbp4mXs
         u7jfjPLU6xlwVF/sEjM/GAvK3FYKlYXjXdsRZwMf6TU/oVFIqoMUZOEvQNngSz8rR3yL
         S+PspWc74RFzUsCVJyVTEMv1DJIRAukcah25bEvXbqU1tGqQ/wClwDTDU8Yz21pSV8wu
         EmFD0rEHomVM2I0q9BhHTeu3aXoBzEsqpqJnion2+NsrYLvD6Ei3ayyxxUIZV4I5pjOv
         nBD5LzpaO+7Ng5oCHywU+ftfVQ2n54MmYK74rRxO4y/ixNbEImkD2qDxKjJ33AoQ+FC4
         woyg==
X-Forwarded-Encrypted: i=1; AJvYcCWUomAzrJHveSqF5hLnVlbZ3cPQci64tX/SFScvrAL4qlcR0IisC4VSyDc1AFa8hvC8X9M=@lists.linux.dev
X-Gm-Message-State: AOJu0YyE830oE+zi4irlsDebraA8Hib1U/KMyqbdmdjcasB2UoQfrU39
	DUhNEqdirAauM4uRewNzRxGqt/ESQ8HFZJgLkSSuVEBqJ2A5HNRghuF+rY+DEUH02D+7EJIIhsl
	PDWDff536nEpANP3Zgn5lRj83xzuZ2G0=
X-Gm-Gg: AY/fxX55p5n+pKhXv8RXFEQ99SDfxYydkEBWuf51afLYlOC6gFpDxM5fGobE46dKGyM
	8vkHcA0x54d/2IyhFumyJERKc+94jTvaws7fbl4LlqBvFv4ANqwovKTzyPIbtgZj9nSvm9BwFst
	Y73VzuOZ2n0i0mUq2SKDWpTV5lmyGodzB+O2NpEGz4QiIkXbxXVsewYZohuRKroDRTTi5VK39WL
	saSu3vI4YhsZzHnHfF1MWWlMuaLxaOg7ylj9YYds4M91aCFcwfy2A6nkENRS+Mi+vsZbI0OHH1m
	lsTvMD0VR8Kr2ogqtqGdeMYiEetacoSdHxk5sHH4T2g3irbJgQLmlB3sSJ33KLTOtpeDPEYusUM
	pLds38iwSiw==
X-Google-Smtp-Source: AGHT+IFCVxVZKfQazz0Hf+zlDf4DPsGc7oERAwp/C9jL/RfYpJUNkkyKQjqWAoT+yyXwjrVLjDdhD4cpWBi7QA+Z/RI=
X-Received: by 2002:a05:7022:4393:b0:119:e569:fb96 with SMTP id
 a92af1059eb24-11f354776a3mr16162731c88.5.1765976094025; Wed, 17 Dec 2025
 04:54:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251210154906.99210-1-daniel.baluta@nxp.com> <aUHZaapZ1IAs_mRE@p14s>
In-Reply-To: <aUHZaapZ1IAs_mRE@p14s>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 17 Dec 2025 14:57:24 +0200
X-Gm-Features: AQt7F2pCrjbzUdKtcqyy6UJ2W0Ki6ZTb9uglvOiXJFQ03JP1g08LOHMbnAHpvt0
Message-ID: <CAEnQRZC0WU+MGfZ5z3yJCz==MBCcFG4BUwNs2v1ABOMkiRbPrw@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: imx_dsp_rproc: Fix multiple start/stop operations
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, andersson@kernel.org, m.szyprowski@samsung.com, 
	shawnguo@kernel.org, kernel@pengutronix.de, festevam@gmail.com, 
	arnaud.pouliquen@foss.st.com, robh@kernel.org, geert+renesas@glider.be, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	iuliana.prodan@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 12:13=E2=80=AFAM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> Good day,
>
> On Wed, Dec 10, 2025 at 05:49:06PM +0200, Daniel Baluta wrote:
> > After commit 67a7bc7f0358 ("remoteproc: Use of reserved_mem_region_*
> > functions for "memory-region"") following commands with
> > imx-dsp-rproc started to fail:
> >
> > $ echo zephyr.elf > /sys/class/remoteproc/remoteproc0/firmware
> > $ echo start > /sys/class/remoteproc/remoteproc0/state
> > $ echo stop > /sys/class/remoteproc/remoteproc0/state
> > $ echo start > /sys/class/remoteproc/remoteproc0/state #! This fails
> > -sh: echo: write error: Device or resource busy
> >
> > This happens because aforementioned commit replaced devm_ioremap_wc wit=
h
> > devm_ioremap_resource_wc which will "reserve" the memory region with th=
e
> > first start and then will fail at the second start if the memory
> > region is already reserved.
> >
> > Even partially reverting the faulty commit won't fix the
> > underlying issue because we map the address in prepare() but we never
> > unmap it at unprepare(), so we will keep leaking memory regions.
> >
> > So, lets use alloc() and release() callbacks for memory carveout
> > handling. This will nicely map() the memory region at prepare() time
> > and unmap() it at unprepare().
> >
> > Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* function=
s for "memory-region"")
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> > Changes since v1:
> >  * https://lore.kernel.org/imx/091a4f29-5435-428a-9a1c-ef82465211cb@nxp=
.com/T/#t
> >  * took a different approach and instead of partially reverting the
> >   faulty patch, used alloc() and release() callbacks to handle memory
> >   region mapping.
> >  drivers/remoteproc/imx_dsp_rproc.c | 50 ++++++++++++++++++++----------
> >  1 file changed, 33 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/im=
x_dsp_rproc.c
> > index 5130a35214c9..83468558e634 100644
> > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > @@ -644,6 +644,32 @@ static void imx_dsp_rproc_free_mbox(struct imx_dsp=
_rproc *priv)
> >       mbox_free_channel(priv->rxdb_ch);
> >  }
> >
> > +static int imx_dsp_rproc_mem_alloc(struct rproc *rproc,
> > +                                struct rproc_mem_entry *mem)
> > +{
> > +     struct device *dev =3D rproc->dev.parent;
> > +     void *va;
> > +
> > +     va =3D ioremap_wc(mem->dma, mem->len);
> > +     if (!va) {
> > +             dev_err(dev, "Unable to map memory region: %pa+%zx\n",
> > +                     &mem->dma, mem->len);
> > +             return -ENOMEM;
> > +     }
> > +
> > +     mem->va =3D va;
> > +
> > +     return 0;
> > +}
> > +
> > +static int imx_dsp_rproc_mem_release(struct rproc *rproc,
> > +                                  struct rproc_mem_entry *mem)
> > +{
> > +     iounmap(mem->va);
> > +
> > +     return 0;
> > +}
> > +
> >  /**
> >   * imx_dsp_rproc_add_carveout() - request mailbox channels
> >   * @priv: private data pointer
> > @@ -659,7 +685,6 @@ static int imx_dsp_rproc_add_carveout(struct imx_ds=
p_rproc *priv)
> >       struct device *dev =3D rproc->dev.parent;
> >       struct device_node *np =3D dev->of_node;
> >       struct rproc_mem_entry *mem;
> > -     void __iomem *cpu_addr;
> >       int a, i =3D 0;
> >       u64 da;
> >
> > @@ -673,15 +698,10 @@ static int imx_dsp_rproc_add_carveout(struct imx_=
dsp_rproc *priv)
> >               if (imx_dsp_rproc_sys_to_da(priv, att->sa, att->size, &da=
))
> >                       return -EINVAL;
> >
> > -             cpu_addr =3D devm_ioremap_wc(dev, att->sa, att->size);
> > -             if (!cpu_addr) {
> > -                     dev_err(dev, "failed to map memory %p\n", &att->s=
a);
> > -                     return -ENOMEM;
> > -             }
> > -
> >               /* Register memory region */
> > -             mem =3D rproc_mem_entry_init(dev, (void __force *)cpu_add=
r, (dma_addr_t)att->sa,
> > -                                        att->size, da, NULL, NULL, "ds=
p_mem");
> > +             mem =3D rproc_mem_entry_init(dev, NULL, (dma_addr_t)att->=
sa,
> > +                                        att->size, da, imx_dsp_rproc_m=
em_alloc,
> > +                                        imx_dsp_rproc_mem_release, "ds=
p_mem");
>
> Was there a reason you kept those here rather than moving them to probe()=
 as
> Iuliana suggested?  Note that I would be fine with this solution since th=
is is
> how it was before, but if we have to go through a refactoring we may as w=
ell
> take those things into account.

Tried moving imx_dsp_rproc_add_carveout at probe() time but it doesn't work
because stop() will clean the carveout list and then the next start() will =
fail.

at probe()
imx_dsp_rproc_add_carveout
-> rproc_add_carveout (adds allocated carveout to the list).

at start():
   -> first start OK

at stop()
   -> rproc_shutdown
       -> rproc_stop
       -> rproc_resource_cleanup ;//cleans up careveout allocations

at next start()
     -> CRASH
