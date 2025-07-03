Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420212D6614
	for <imx@lists.linux.dev>; Thu,  3 Jul 2025 09:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751534722; cv=none; b=YqSqQffMUcpIHN7JM65tr89iwsukV2nmTsRTI2Pi2ibgZYlWXqli+GrNXGO3e6T0dRgC2+oI4rRR8inhFvcJ8850Tl0fuqXC8DC0wYjzA4RCnJQciJum7jhzLeHDrhlqcQL+IJOGoLpqM+AnNpnUac36LCKLq+L4XfCymBTsgAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751534722; c=relaxed/simple;
	bh=v4IoJlg76CmSJ2VtEhP56ipvSCV4NseNd45qWFEYnJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uq5HTKHsU/by26RorqIpb5sQB22O/9pY+ItCLy6ekuG+sl7mbCV0wQFcE2DSxIi4YZHcr0RwfK4yeoXXP26+K0hZlf/e1Sw43LcTUnkXJP2Dj8oLGtRbxWktR5ksLEMmBFK5kscxyJGUDB6P2S7esGnk6J4Rs7wmq1zNlqyIDII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGepe/34; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGepe/34"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3de18fde9cfso29868325ab.3
        for <imx@lists.linux.dev>; Thu, 03 Jul 2025 02:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751534720; x=1752139520; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQxlXjimiWOLNlkmt82ETYNH1B4xm8nZuHa4F1eDm+Q=;
        b=NGepe/34JKr1fDxlk20TeXGgjJa/KoS2GmF71lT1STeaExbLbVr5PI4G2/KcwLy6V1
         ZLIhroGiXL1as97ouDrC1MrwEOkxKd15Y3iRmABjMWezu90Az+wc5xm6UKMWbuRsh0hZ
         9Il9WvkTA5qfxDgj4ye3izuzimrv2gvIA40u1SY1kftmS+tV+waWwKFp19ujOlwjhj/5
         /uh6F+gEbzx/oCyqOxHmGp1sFBm0MvQPq0NcOyepm37ct0hKofAYS51sQpHICQl9b5ZH
         DxMJC66KgkZgBMV1i2mWcL3aClStHiVElgNC5sgyKhswZ6aZ2/hrO9jhvs0CRa9F2at3
         nPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751534720; x=1752139520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQxlXjimiWOLNlkmt82ETYNH1B4xm8nZuHa4F1eDm+Q=;
        b=pnqemukbOqlCJ6r8uoiddaHYow20OeRO+L05ViaEyY2Gqv8qqDuDhMJuGOvF+rBT17
         bjIKdVLua10+U27ElN3/LeoQBhcwvyT/TZrmpG6AJuoyQojshNLffno+k45VpZgS6h8Q
         tMNydxN9UKQI2FQXYUwTSKx9yTiyuQmc4kW6wXiPdGQmbw6r/8wBag7KPt7ySKG1k/n1
         Xmk2RA/x/9UPZw2tnWwuzUSuBnH249MV94D6n95Qjoa0ckN8wwcVV06V+QoXq/GWQn6P
         rLoy9mAAc6nSu3gZbK52iCAYrbJsR72blMKql/1wQPNjSae2CIYVwHzSe9ssID/BgQt4
         aB+w==
X-Forwarded-Encrypted: i=1; AJvYcCW09iqQ5wX5YyKZbJHIaH1RU9Of3pHzTlfDmw6iRSj35vAqvb00RXXODIGxXIeoT2bCHrA=@lists.linux.dev
X-Gm-Message-State: AOJu0YztOBhRZ4U7+reeKxi3XTCF0nZ/nsN8VO/z3y3arCXFMLpqH1g2
	7lcj3gRvSDaDUXMYOuot7vfTj8bu1kNFYsg755C8ia8leT0KJnB3jR7saOQjpB6yOPCUnD1BWN4
	PN0xW9Cxt3gp2pZR8mqj11m2OluI5F3w=
X-Gm-Gg: ASbGncuV0dmMU/VIQXsqUCxiEjRoDUfKc7+tgwM0bySuPMBoX/qFIiWPJdHsDLS5Fqy
	J9uBF/tQkkqFuZ32gDrVKvNZ5nuc51SJqF7zTy9exbXd/e/vdEwEsbvuWqbtD0zAk8yt6mY8hEb
	Mgm9afGEjdnmOEj0M+DN4i4ntvUBHb2+OHVZmnD9v/Mss=
X-Google-Smtp-Source: AGHT+IExz9aStPQQU5jTE1Po0AQPZakEiqsbSsJKe7wO8kX4S2jJmJUZEYtD2nu7s7tlGuCMRGGTZawMXfUO2V+vIVY=
X-Received: by 2002:a05:6e02:2183:b0:3df:4024:9402 with SMTP id
 e9e14a558f8ab-3e05494a935mr73959465ab.8.1751534720124; Thu, 03 Jul 2025
 02:25:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-3-shengjiu.wang@nxp.com> <aGLBvXtSRlaKujqM@p14s>
 <CAA+D8AO4o7dqTyL4aZ+H5VnroTQUNAHM-io5rvJ2r_sasPYs9g@mail.gmail.com>
 <aGP-ZVuhBdd1GPLe@p14s> <CAA+D8ANtw1xTg7OQOFoDeQcdp05Eo9Uo1t=MKcGjtkSYfJqBVw@mail.gmail.com>
 <CAA+D8AP+RPJpY_=8WjSXoV_VB=9hP0NnFGjjUQHXcoDoz3fgfA@mail.gmail.com>
In-Reply-To: <CAA+D8AP+RPJpY_=8WjSXoV_VB=9hP0NnFGjjUQHXcoDoz3fgfA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 3 Jul 2025 17:24:57 +0800
X-Gm-Features: Ac12FXwGsyCT-FrKcuI-KzJt0SyzwBQ-E9tIqBn9TSAoTP3Lnf3fS8E6YzQ5JhE
Message-ID: <CAA+D8ANdfOr=iyJQqE9_k+JUCRin2KXOVf9zL6BVxRrV0REvqQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] remoteproc: imx_dsp_rproc: Add support of coredump
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	iuliana.prodan@nxp.com, daniel.baluta@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 7:48=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail.c=
om> wrote:
>
> On Wed, Jul 2, 2025 at 3:20=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail=
.com> wrote:
> >
> > On Tue, Jul 1, 2025 at 11:27=E2=80=AFPM Mathieu Poirier
> > <mathieu.poirier@linaro.org> wrote:
> > >
> > > On Tue, Jul 01, 2025 at 10:28:33AM +0800, Shengjiu Wang wrote:
> > > > On Tue, Jul 1, 2025 at 1:05=E2=80=AFAM Mathieu Poirier
> > > > <mathieu.poirier@linaro.org> wrote:
> > > > >
> > > > > On Wed, Jun 18, 2025 at 02:26:44PM +0800, Shengjiu Wang wrote:
> > > > > > Add call rproc_coredump_set_elf_info() to initialize the elf in=
fo for
> > > > > > coredump, otherwise coredump will report an error "ELF class is=
 not set".
> > > > > >
> > > > > > Remove the DSP IRAM and DRAM segment in coredump list, because =
after
> > > > > > stop, DSP power is disabled, the IRAM and DRAM can't be accesse=
d.
> > > > > >
> > > > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > > > ---
> > > > > >  drivers/remoteproc/imx_dsp_rproc.c | 6 +++---
> > > > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remot=
eproc/imx_dsp_rproc.c
> > > > > > index 9b9cddb224b0..9e7efb77b6e5 100644
> > > > > > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > > > > > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > > > > > @@ -738,9 +738,7 @@ static int imx_dsp_rproc_add_carveout(struc=
t imx_dsp_rproc *priv)
> > > > > >               mem =3D rproc_mem_entry_init(dev, (void __force *=
)cpu_addr, (dma_addr_t)att->sa,
> > > > > >                                          att->size, da, NULL, N=
ULL, "dsp_mem");
> > > > > >
> > > > > > -             if (mem)
> > > > > > -                     rproc_coredump_add_segment(rproc, da, att=
->size);
> > > > > > -             else
> > > > > > +             if (!mem)
> > > > >
> > > > > Flag rproc->recovery_disabled is never set to true, meaning that =
since this
> > > > > driver was introduced, some kind of recovery was available.
> > > >
> > > > Actually since this driver was introduced, the recovery can't work.
> > > > We didn't test the recovery function before. sorry for the mistake.
> > >
> > > Let me see if I get this right:
> > >
> > > (1) Almost 5 years ago you sent me a driver with code you did not tes=
t.
> >
> > Driver was tested but missed the recovery/coredump function.
> >
> > > (2) It took all this time to realize and fix the problem.
> >
> > I just realized that the recovery/coredump is one of the functions supp=
orted
> > by remoteproc.
> >
> > > (3) I should trust that, this time, you have tested your code.
> >
> > recovery/coredump has been tested.
>
> I am not sure if we must power off dsp in .stop() and power on dsp in .st=
art().
> because I see such comments in remoteproc_core.c
>         /* power up the remote processor */
>         ret =3D rproc->ops->start(rproc);
>
>         /* power off the remote processor */
>         ret =3D rproc->ops->stop(rproc);
>
> So I moved pm_runtime_get_sync() to .start() and pm_runtime_put_sync()
> to .stop()
> in this patchset.
>
> previously we called pm_runtime_get_sync() in .prepare(),
> pm_runtime_put_sync() in
> .unprepare().
> If we can keep the power on/off in .prepare()/.unprepare.  maybe we
> can refine the
> .load function which is to move .reset to .load(),  then we can reduce
> the code change
> and not need to change the coredump scope.
>
> Before I test this idea I'd like to have your opinion about this.
> Thanks.

Today I tested this method, it looks good, the code change is smaller.
I will send v2 for reviewing.
Thanks.

>
> Best regards
> Shengjiu Wang
> >
> > Best regards
> > Shengjiu Wang
> >
> > >
> > > Did I understand all that correctly?
> > >
> > > >
> > > > >
> > > > > I worry that your work will introduce regression for other users.=
  Daniel and
> > > > > Iuliana, once again have to ask you to look at this patchset.
> > > > >
> > > > > Thanks,
> > > > > Mathieu
> > > > >
> > > > > >                       return -ENOMEM;
> > > > > >
> > > > > >               rproc_add_carveout(rproc, mem);
> > > > > > @@ -1203,6 +1201,8 @@ static int imx_dsp_rproc_probe(struct pla=
tform_device *pdev)
> > > > > >               goto err_detach_domains;
> > > > > >       }
> > > > > >
> > > > > > +     rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA)=
;
> > > > > > +
> > > > > >       pm_runtime_enable(dev);
> > > > > >
> > > > > >       return 0;
> > > > > > --
> > > > > > 2.34.1
> > > > > >
> > > > >
