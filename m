Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3350263F22
	for <imx@lists.linux.dev>; Wed,  2 Jul 2025 11:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751456915; cv=none; b=gk6pdW5k4oQ5e/TH9KouIAWT6SMfUT2IZuZDhWWO1asrSc8fGPN7kAEcHn0NLBvWpKY6MK4HuNa1eHMBD5LN7WnZQHgSE40KIV9ExJ5UC3KpTcqRRu8H2kg59SAqgpDVOeU28o7kMeI26e9i93FHqvIrHmtLz33q9FQWNvii6IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751456915; c=relaxed/simple;
	bh=CyKuv2VY8buCSaYOnWagFd+yFFQVwFRKwJZQBwkUZu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m6JNUoX9GPFmH2drYv932+TjBYYZH0tLGIdxbcCBUIHztNTonColtn1gB+gv8cUjrbixeqsG0DTQ64NeLkY7OIOPCEp7oPOm7ZlfNAmYKsIDBQy3TOzk6Vgkh9Bvrw3g+a0DDfd9SP7Bg72DtGM98fYsC6B3KkQBOljGi6FAAwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipRLIlvJ; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipRLIlvJ"
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3ddb4a7ac19so24483415ab.3
        for <imx@lists.linux.dev>; Wed, 02 Jul 2025 04:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751456913; x=1752061713; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzPxoOt7/PDx3OAhuOXlHFSJAQjWmG/j7qKRio0DXig=;
        b=ipRLIlvJaA9OgIDRJ0BAO38jk71f8btE53t8tqwRc8E+V/QV7YBYx8snK0e+LeGNGB
         bEwT4w1QfeKwwar1X6LOfbNzQ8m/21/BNwuId86SmN/AMSR7ILQSTXiW/ULHmwCJXE5g
         +CXiQPD9gIP50sphuWarCO7+4WsKIn+o3KSxigPLQ0zeQ0XfvnqZhbCa/JFmFXiCA1nw
         tDBMFL0SgDNL+rLZr53nASrbUIqQ+v+tPNhqpxV2vOwKke8aoFC1JEfBfZuiH4HKyJKO
         u1Y6FEQdenOJ2NYqNeyW8EhiFUXiR1Qrr3gWjTV9BOvPtUrKKjSOkIUbqUSOfB2I0SpQ
         KhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751456913; x=1752061713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pzPxoOt7/PDx3OAhuOXlHFSJAQjWmG/j7qKRio0DXig=;
        b=aI1uDekuzJAM/l7ey+HC3m4ClDDG7vAMEaxo8P3LQuW/ZIv//N5/ZnzL0v02SqHFvo
         6gX3theXIiHBgh9/Hy3EOo9PLGpa+eodt2huKrwkeZlR7Ql36WR84bMgxRK8wibCn0sB
         Tm9CmAPpON+eJfHoYvTc6pJnXZx513C1FxoVtBCr0EiGYF1lFfaYgbDC0OhT5vs+UB5P
         N3aIxcIy3xRuEnO2bXkFhoG3KbrP4eg6P9v9HtaWUcbBiTCRh4+NTMdKFU4bb1xsR6xC
         3DdSdtS83gvVmcc6KWaD5sOz+ks3zWE939b/X90LqEAfEtMqNoNlwatbK5NDHUsPPdXq
         SArQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLwtSU+bMMAzm3d8soN/AtPjm7hLfGzhv1ezt7usKl8kTsBMe9wkQFWwnTnb117jbkhZU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlAoa2XJTqWoelOnFA9z9mqJFVCVdSnyWx+VBJlyRuHdSGjKNL
	wZHkfIqmUfYayPXPXAw2JOB4W2HjdOyGc1wVeDpNDf3BcYB11YlKMGAiyPPC6Ad9f1I1t9gFZMI
	v5zUQtIYy4Wx36F7h2e9Hcb4ZCRe20Ig=
X-Gm-Gg: ASbGncuchjOFTHJZrPHRc5XjqEYsabwkrChKp6MnQ/Nn70gVC7MrdzbwtM2o47WxBDf
	CeUY3acpsHhBj+eh9AQu3ckTl4fVbeNizFLyO/ADjv6QkSY8pQPYrTXWp20P6VfhuTYWpqlOOUh
	vBS2WGL7LD4737wx/GWnSUqWpUwBhrKATo17J3/6nfB74RhpE1h0hMGA==
X-Google-Smtp-Source: AGHT+IEw1dzWm4QIwYZ3nobQC6Sl0JTwXZBOf8R8fgqREreP3zTUiwJZ1QMMnvhYh5RwfOmvgp90q36ljwFt6u6cKug=
X-Received: by 2002:a92:c244:0:b0:3dd:d155:94cb with SMTP id
 e9e14a558f8ab-3e0549795b6mr28666715ab.7.1751456912803; Wed, 02 Jul 2025
 04:48:32 -0700 (PDT)
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
In-Reply-To: <CAA+D8ANtw1xTg7OQOFoDeQcdp05Eo9Uo1t=MKcGjtkSYfJqBVw@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 2 Jul 2025 19:48:12 +0800
X-Gm-Features: Ac12FXxpIvbzeFcwinOMXn9TEBzcrnmh0tjz9irrB5pa_wug2azkcr5nRrXHUhc
Message-ID: <CAA+D8AP+RPJpY_=8WjSXoV_VB=9hP0NnFGjjUQHXcoDoz3fgfA@mail.gmail.com>
Subject: Re: [PATCH 2/2] remoteproc: imx_dsp_rproc: Add support of coredump
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	iuliana.prodan@nxp.com, daniel.baluta@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 3:20=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail.c=
om> wrote:
>
> On Tue, Jul 1, 2025 at 11:27=E2=80=AFPM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > On Tue, Jul 01, 2025 at 10:28:33AM +0800, Shengjiu Wang wrote:
> > > On Tue, Jul 1, 2025 at 1:05=E2=80=AFAM Mathieu Poirier
> > > <mathieu.poirier@linaro.org> wrote:
> > > >
> > > > On Wed, Jun 18, 2025 at 02:26:44PM +0800, Shengjiu Wang wrote:
> > > > > Add call rproc_coredump_set_elf_info() to initialize the elf info=
 for
> > > > > coredump, otherwise coredump will report an error "ELF class is n=
ot set".
> > > > >
> > > > > Remove the DSP IRAM and DRAM segment in coredump list, because af=
ter
> > > > > stop, DSP power is disabled, the IRAM and DRAM can't be accessed.
> > > > >
> > > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > > ---
> > > > >  drivers/remoteproc/imx_dsp_rproc.c | 6 +++---
> > > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remotep=
roc/imx_dsp_rproc.c
> > > > > index 9b9cddb224b0..9e7efb77b6e5 100644
> > > > > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > > > > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > > > > @@ -738,9 +738,7 @@ static int imx_dsp_rproc_add_carveout(struct =
imx_dsp_rproc *priv)
> > > > >               mem =3D rproc_mem_entry_init(dev, (void __force *)c=
pu_addr, (dma_addr_t)att->sa,
> > > > >                                          att->size, da, NULL, NUL=
L, "dsp_mem");
> > > > >
> > > > > -             if (mem)
> > > > > -                     rproc_coredump_add_segment(rproc, da, att->=
size);
> > > > > -             else
> > > > > +             if (!mem)
> > > >
> > > > Flag rproc->recovery_disabled is never set to true, meaning that si=
nce this
> > > > driver was introduced, some kind of recovery was available.
> > >
> > > Actually since this driver was introduced, the recovery can't work.
> > > We didn't test the recovery function before. sorry for the mistake.
> >
> > Let me see if I get this right:
> >
> > (1) Almost 5 years ago you sent me a driver with code you did not test.
>
> Driver was tested but missed the recovery/coredump function.
>
> > (2) It took all this time to realize and fix the problem.
>
> I just realized that the recovery/coredump is one of the functions suppor=
ted
> by remoteproc.
>
> > (3) I should trust that, this time, you have tested your code.
>
> recovery/coredump has been tested.

I am not sure if we must power off dsp in .stop() and power on dsp in .star=
t().
because I see such comments in remoteproc_core.c
        /* power up the remote processor */
        ret =3D rproc->ops->start(rproc);

        /* power off the remote processor */
        ret =3D rproc->ops->stop(rproc);

So I moved pm_runtime_get_sync() to .start() and pm_runtime_put_sync()
to .stop()
in this patchset.

previously we called pm_runtime_get_sync() in .prepare(),
pm_runtime_put_sync() in
.unprepare().
If we can keep the power on/off in .prepare()/.unprepare.  maybe we
can refine the
.load function which is to move .reset to .load(),  then we can reduce
the code change
and not need to change the coredump scope.

Before I test this idea I'd like to have your opinion about this.
Thanks.

Best regards
Shengjiu Wang
>
> Best regards
> Shengjiu Wang
>
> >
> > Did I understand all that correctly?
> >
> > >
> > > >
> > > > I worry that your work will introduce regression for other users.  =
Daniel and
> > > > Iuliana, once again have to ask you to look at this patchset.
> > > >
> > > > Thanks,
> > > > Mathieu
> > > >
> > > > >                       return -ENOMEM;
> > > > >
> > > > >               rproc_add_carveout(rproc, mem);
> > > > > @@ -1203,6 +1201,8 @@ static int imx_dsp_rproc_probe(struct platf=
orm_device *pdev)
> > > > >               goto err_detach_domains;
> > > > >       }
> > > > >
> > > > > +     rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
> > > > > +
> > > > >       pm_runtime_enable(dev);
> > > > >
> > > > >       return 0;
> > > > > --
> > > > > 2.34.1
> > > > >
> > > >
