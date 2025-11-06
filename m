Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83456287508
	for <imx@lists.linux.dev>; Thu,  6 Nov 2025 07:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762415453; cv=none; b=LwwZMeX+2VDGNtyfpcz3ZJfgwshcFMdofGiH8s7buWlBe/JtvuV/ihsdIxvlmt3r5H1bBCOU8ltJLec9CnwSXcGXb/PSCX5PGfLFqfsl84zdjjnYOtFO0bgVMt29Nf9n7q1fBUPIUOq6zCZLcKlBeA1i4TNsQ3SwqyinbMIsqhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762415453; c=relaxed/simple;
	bh=p3t1Nu3/jaRiIeOqwFNK5UrO9I5BIOo4m9uqYA+ne9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l5LiDiNkwmbhCfisjpr9vKRSpuOdtIJmLY96j0d2OFuf3Sdn4Uz5E0B0h+uzZlEP/doH+VNVttuM9dcE46IdlJqJPDvwU8lXexO7WuYYKuLA1ou0WeOULxD7YpRQI3smshNlZ2OAdRI1YLwn5qrnVfR0fE3z+ElVU0TWwJ0BMVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jlUSoTBk; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jlUSoTBk"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3e9d633b78so118557066b.1
        for <imx@lists.linux.dev>; Wed, 05 Nov 2025 23:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762415450; x=1763020250; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4oSZTMv5D/sOGGLnpJ+IvuCz5xyHo5sq+jQga6CKtnM=;
        b=jlUSoTBkHU0E5uDJ/jsMYjWG6YZG2uKK/0J23h5g2zHCsvZjcn7iOx+iLDEbd6GHIM
         iJkoGqOR2v9q8v4e5CVk8TUnklclTBaEQw9bt0utLwqqqa4jHFcdXmAYAC8y5LM46B0Q
         VI5GIdquFSiCl8Inntaz8fHoFRswUVJE+gQXcfqhdtiqr7ih5R2ofe3A3MTiKsii5CvW
         ViCSgp2f7sT9KEdWxUQvUvXo2vyE/gYznCqW9GLIy499ZCQO3YVmR7TSqbhMWJzLZdH2
         J/0DZt8ZTH0wkBYFGepE/3dpUYqQexnFtgaReN3bAlzJX5oLsxXtwTCBo5gLn5fW8OcK
         n2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762415450; x=1763020250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4oSZTMv5D/sOGGLnpJ+IvuCz5xyHo5sq+jQga6CKtnM=;
        b=MFhb9ZgTuCH+el7/w2BVav3ZaIGCbBVLwz91y+4MQHilTvSgf8+diPw22yTLsGu6ff
         sPs9AQjA3k99HsQ905+XHX6CRsl4XHyOo+N7UJ50rHMloUA7trltoP88d4h82TcGevVd
         f5PiBTOY1MgGalILXJ66HsQ+ooGfh08TSI9zoJJL9g5/XgzgWGC5gvoCZS5iNTqAZ/be
         hh8ZPEFdJjct3OKQ1/bn+mbtrh0ofpalplalBrQnYS4CqzuklRsZSCPT3WkzhGYxoZa1
         ME2zzXlj8vVyg8L0mUt80nFKGtQJOD72SV6675j3b/9w/3RjKHK83GUTM1jWVHUx1U7A
         Nu5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUnnuegVizqIthfLR0pjvgsYM4JAvJL8HO+ZJLQiPKXQuW06+3t1PcPhtQJqGk1LL71JoY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIfsPf3MC1xOtRYepz6wYAqZsBWBkntCbPbRHnYr9rp/DejYhC
	5S3O61BA7/CSb63UdbmgQSEb8UILJORaiXg5PJ29R3IgMd6bMRBtXF6mlWeI1VeFiHMKDh8U4ip
	ai2D6QeO+NRUG6nQM+frgQqHQoa+MdeO8kG3lSbno7g==
X-Gm-Gg: ASbGncuubuDyf0rAmKZbAeMIQIrs1yZE2dNNjkiw76mdkVIsDuJCmiRF/qa6PsaYUdN
	74WheBNQM8+teVrOS/UZ4n/6cbdVdoG3v1Z+oHw66ZTfOhVPvz/RCt6X5mp1BrcP40VJQiHk0Nb
	bT2c7K16FnhqpgPICrZ4Q2B9iYK+NCe5v7IPf/8TnXQmAJxKzjhy1+wWwO7APvqC4/qoVWumCf3
	I8U0EjtaYufyVYnZxArgDdhsTmTa6AE7Eo4awkwPDlTEtavkYU5gVzrZFJZyg==
X-Google-Smtp-Source: AGHT+IGTqwA2P7XvjyYF/Izos2lVy+T5to2mL8X2E6WlWDzOEu9Bmz8GxKORg8EJlnHJ5cxaDH8TQQoU0UmnunUk7JI=
X-Received: by 2002:a17:907:94d2:b0:b72:6d68:6663 with SMTP id
 a640c23a62f3a-b728964dea0mr251219566b.31.1762415449844; Wed, 05 Nov 2025
 23:50:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKfTPtCtHquxtK=Zx2WSNm15MmqeUXO8XXi8FkS4EpuP80PP7g@mail.gmail.com>
 <20251106000531.GA1930429@bhelgaas> <vrgjkulv22hzbx65olh3zpyqxq6dr7d5mepngjwgc3gudjoxwo@ll7xc2teya2s>
In-Reply-To: <vrgjkulv22hzbx65olh3zpyqxq6dr7d5mepngjwgc3gudjoxwo@ll7xc2teya2s>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 6 Nov 2025 08:50:37 +0100
X-Gm-Features: AWmQ_bkYpQyZF7OktEjeeIhdfj_KOUOxVV3OYB8DSDbc8qdV2MpPBlN_Lqu--DE
Message-ID: <CAKfTPtB=oMPsfjRFcQrAKM1m97B1LL9RJYVix+ea9Vb0FqDk3A@mail.gmail.com>
Subject: Re: [PATCH 3/4 v3] PCI: s32g: Add initial PCIe support (RC)
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, chester62515@gmail.com, mbrugger@suse.com, 
	ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, bhelgaas@google.com, 
	jingoohan1@gmail.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, Ghennadi.Procopciuc@nxp.com, 
	ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com, Frank.li@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	cassel@kernel.org, Richard Zhu <hongxing.zhu@nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Minghuan Lian <minghuan.Lian@nxp.com>, 
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, 
	Christian Bruel <christian.bruel@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Nov 2025 at 07:24, Manivannan Sadhasivam <mani@kernel.org> wrote:
>
> On Wed, Nov 05, 2025 at 06:05:31PM -0600, Bjorn Helgaas wrote:
> > [+cc imx6, layerscape, stm32 maintainers for possible suspend bug]
> >
> > On Fri, Oct 24, 2025 at 08:50:46AM +0200, Vincent Guittot wrote:
> > > On Wed, 22 Oct 2025 at 21:04, Bjorn Helgaas <helgaas@kernel.org> wrot=
e:
> > > > On Wed, Oct 22, 2025 at 07:43:08PM +0200, Vincent Guittot wrote:
> > > > > Add initial support of the PCIe controller for S32G Soc family. O=
nly
> > > > > host mode is supported.
> >
> > > > > +static void s32g_init_pcie_controller(struct s32g_pcie *s32g_pp)
> > > > > +{
> > > > > ...
> > > > > +     /*
> > > > > +      * Make sure we use the coherency defaults (just in case th=
e settings
> > > > > +      * have been changed from their reset values)
> > > > > +      */
> > > > > +     s32g_pcie_reset_mstr_ace(pci, memblock_start_of_DRAM());
> > > >
> > > > This seems sketchy and no other driver uses memblock_start_of_DRAM(=
).
> > > > Shouldn't a physical memory address like this come from devicetree
> > > > somehow?
> > >
> > > I was using DT but has been asked to not use it and was proposed to
> > > use memblock_start_of_DRAM() instead
> >
> > Can you point me to that conversation?
> >
> > > > > +     s32g_pp->ctrl_base =3D devm_platform_ioremap_resource_bynam=
e(pdev, "ctrl");
> > > > > +     if (IS_ERR(s32g_pp->ctrl_base))
> > > > > +             return PTR_ERR(s32g_pp->ctrl_base);
> > > >
> > > > This looks like the first DWC driver that uses a "ctrl" resource.  =
Is
> > > > this something unique to s32g, or do other drivers have something
> > > > similar but use a different name?
> > >
> > > AFAICT this seems to be s32g specific in the RM
> >
> > It does look like there's very little consistency in reg-names across
> > drivers, so I guess it's fine.
> >
> > > > > +static int s32g_pcie_suspend_noirq(struct device *dev)
> > > > > +{
> > > > > +     struct s32g_pcie *s32g_pp =3D dev_get_drvdata(dev);
> > > > > +     struct dw_pcie *pci =3D &s32g_pp->pci;
> > > > > +
> > > > > +     if (!dw_pcie_link_up(pci))
> > > > > +             return 0;
> > > >
> > > > Does something bad happen if you omit the link up check and the lin=
k
> > > > is not up when we get here?  The check is racy (the link could go d=
own
> > > > between dw_pcie_link_up() and dw_pcie_suspend_noirq()), so it's not
> > > > completely reliable.
> > > >
> > > > If you have to check, please add a comment about why this driver ne=
eds
> > > > it when no other driver does.
> > >
> > > dw_pcie_suspend_noirq returns an error and the suspend fails
> >
> > The implication is that *every* user of dw_pcie_suspend_noirq() would
> > have to check for the link being up.  There are only three existing
> > callers:
> >
> >   imx_pcie_suspend_noirq()
> >   ls_pcie_suspend_noirq()
> >   stm32_pcie_suspend_noirq()
> >
> > but none of them checks for the link being up.
> >
>
> If no devices are attached to the bus, then there is no need to broadcast
> PME_Turn_Off and wait for L2/L3. I've just sent out a series that fixes i=
t [1].
> Hopefully, this will allow Vincent to use dw_pcie_{suspend/resume}_noirq(=
) APIs.

I'm going to test it

Thanks

>
> - Mani
>
> [1] https://lore.kernel.org/linux-pci/20251106061326.8241-1-manivannan.sa=
dhasivam@oss.qualcomm.com/
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
