Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5638A144D21
	for <imx@lists.linux.dev>; Tue,  8 Oct 2024 09:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728379768; cv=none; b=fYMd/kTnbEpPYJxPVhJzDeK48G6qmUtPU4MZqa6DvXD9ruHUxLsJR8bmrzav8LkqNnLn21nAH14gmF4cz2l6iN2EixmZHy0kgeT+HPShP9sUlfZK7zIx12BsKNPrzG/SG/oroSRfArY8lAUK4/gSWooPFDBzRorsIXSYNao7tPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728379768; c=relaxed/simple;
	bh=eWN/MaFojHAW9m6Ae/35VSjoROU+iItX2kOUEWuuCUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PzB09GNdAImAUHsBAtys3bwJ5sd9r3HozurPFx9kx+Si+zjv9jwxV/5OiU2SMvWeuuBzWGNunSj2ft9ntCdgRWyhJ6Xp09UsM1yVyQVGQSz99U7OP2mkgNQkZYDaUHu7Nlon5YyE3rAUFs2M4HqNuHc4ozFfbixhmLo9osMszyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nd2O8C/h; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nd2O8C/h"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e28f4549288so141553276.1
        for <imx@lists.linux.dev>; Tue, 08 Oct 2024 02:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728379765; x=1728984565; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQNyfPSCVIG01EOy/uu8Bi4UqKVZ2bxP52ZD84vL7uY=;
        b=Nd2O8C/h7y8sKsaRiN3LSyTsW4mUJtuXY2ESKX/UNFnZormd2K8z3qtio09t6fM8Xx
         i7T5zeS+I/INa+Vh+F2TEs2HAiwymsP2r7UEMrjYHE7I5qZLjKTL98Haabpl47lo5/bP
         Y9c2Eu/1jhcQkaaTPx832FLsHh/C3rpgPJTqjkZa3A/f3dD4DqYJd3BoyDlLDPQW3j/Z
         CEH1A5ZNoaC/GthihJHqHjSmuRakrW/n7+Hn+aUwNxsgaRldPkrH3Dd/IshivDW3qHbh
         8TNWHQ807Pdr7NEs3MZkDRc2bDj1YguFP0fTMtBUl0dGgnLo4V41crcCknhiwD1XF+bA
         wTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728379765; x=1728984565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQNyfPSCVIG01EOy/uu8Bi4UqKVZ2bxP52ZD84vL7uY=;
        b=CKyi6GpSW94q6uIqWYTNXyMeVK8xfLeXU5V9KKyfXiuLijUIDYTdjA9vq/MnaIAtvY
         x1+xg0lmZcntSlsSp3I8PmgUumBNjmXcU1ql5fRk3t57G+CFDRi25hGLvdFVbKx2R0Ee
         4haN4ahcWhuNppSvsxnlZq9WhwYnq3v4PMffL76Mn8Lt9bbsbFUvpGcWR1RIq6doRxu/
         ba4QuPUZgFFC9EmBWFtNmD592h0mYEJYWSekIZT7NIAhXnL/7OyqGXe+opARlCUtFeTK
         WmraOuyuuX6SDdlNci9xuoGncqdcDZzbUQoqA+sYKyHvCga3djgAWKR5i/rX+J9L2Qjv
         3ddg==
X-Gm-Message-State: AOJu0YyVGUYNSiUNlrH6FRqdel2tl/BjoSamt7HF1W6fQgRvUzMEvAeO
	QpB6odJKWcDbpcWzzIh6j+XFCj2WwVH1kwsw4/GtRhi8+OvTA4KST9jHvLB54fOmNjSLseAWcbw
	Ploy7m85t1nhWj+qJUqlSYApy3HU=
X-Google-Smtp-Source: AGHT+IEhq3KmwZVymDz4Fd++jHViv8z0hh+44qM6R8bbFsO1VjRYVuySILrif1O42D+aB2/WwvvxlKICDyBFTZBy9O8=
X-Received: by 2002:a05:6902:1b87:b0:e26:2aa0:a3b0 with SMTP id
 3f1490d57ef6-e289392b426mr9499416276.45.1728379765172; Tue, 08 Oct 2024
 02:29:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241008091817.977999-1-dillon.minfei@gmail.com> <PAXPR04MB85106420DA87BA00EF755A85887E2@PAXPR04MB8510.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB85106420DA87BA00EF755A85887E2@PAXPR04MB8510.eurprd04.prod.outlook.com>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Tue, 8 Oct 2024 17:28:49 +0800
Message-ID: <CAL9mu0K9YJT_tvpV6C01yhBgU2=eiD7Q4jUnnu1priBchA8mkQ@mail.gmail.com>
Subject: Re: [PATCH v1] net: ethernet: fix NULL pointer dereference at fec_ptp_save_state()
To: Wei Fang <wei.fang@nxp.com>
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Clark Wang <xiaoning.wang@nxp.com>, "davem@davemloft.net" <davem@davemloft.net>, 
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>, 
	"pabeni@redhat.com" <pabeni@redhat.com>, 
	"u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>, 
	"csokas.bence@prolan.hu" <csokas.bence@prolan.hu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wei

Ok, Thanks, just ignore this patch.

Br.

On Tue, 8 Oct 2024 at 17:24, Wei Fang <wei.fang@nxp.com> wrote:
>
> > -----Original Message-----
> > From: dillon.minfei@gmail.com <dillon.minfei@gmail.com>
> > Sent: 2024=E5=B9=B410=E6=9C=888=E6=97=A5 17:18
> > To: Wei Fang <wei.fang@nxp.com>; Shenwei Wang <shenwei.wang@nxp.com>;
> > Clark Wang <xiaoning.wang@nxp.com>; davem@davemloft.net;
> > edumazet@google.com; kuba@kernel.org; pabeni@redhat.com;
> > u.kleine-koenig@baylibre.com; csokas.bence@prolan.hu
> > Cc: imx@lists.linux.dev; netdev@vger.kernel.org; linux-kernel@vger.kern=
el.org;
> > Dillon Min <dillon.minfei@gmail.com>
> > Subject: [PATCH v1] net: ethernet: fix NULL pointer dereference at
> > fec_ptp_save_state()
> >
> > From: Dillon Min <dillon.minfei@gmail.com>
> >
> > fec_ptp_init() called at probe stage when 'bufdesc_ex' is true.
> > so, need add 'bufdesc_ex' check before call fec_ptp_save_state(), else
> > 'tmreg_lock' will not be init by spin_lock_init().
> >
> > run into kernel panic:
> > [    5.735628] Hardware name: Freescale MXS (Device Tree)
> > [    5.740816] Call trace:
> > [    5.740853]  unwind_backtrace from show_stack+0x10/0x14
> > [    5.748788]  show_stack from dump_stack_lvl+0x44/0x60
> > [    5.753970]  dump_stack_lvl from register_lock_class+0x80c/0x888
> > [    5.760098]  register_lock_class from __lock_acquire+0x94/0x2b84
> > [    5.766213]  __lock_acquire from lock_acquire+0xe0/0x2e0
> > [    5.771630]  lock_acquire from _raw_spin_lock_irqsave+0x5c/0x78
> > [    5.777666]  _raw_spin_lock_irqsave from fec_ptp_save_state+0x14/0x6=
8
> > [    5.784226]  fec_ptp_save_state from fec_restart+0x2c/0x778
> > [    5.789910]  fec_restart from fec_probe+0xc68/0x15e0
> > [    5.794977]  fec_probe from platform_probe+0x58/0xb0
> > [    5.800059]  platform_probe from really_probe+0xc4/0x2cc
> > [    5.805473]  really_probe from __driver_probe_device+0x84/0x19c
> > [    5.811482]  __driver_probe_device from
> > driver_probe_device+0x30/0x110
> > [    5.818103]  driver_probe_device from __driver_attach+0x94/0x18c
> > [    5.824200]  __driver_attach from bus_for_each_dev+0x70/0xc4
> > [    5.829979]  bus_for_each_dev from bus_add_driver+0xc4/0x1ec
> > [    5.835762]  bus_add_driver from driver_register+0x7c/0x114
> > [    5.841444]  driver_register from do_one_initcall+0x4c/0x224
> > [    5.847205]  do_one_initcall from kernel_init_freeable+0x198/0x224
> > [    5.853502]  kernel_init_freeable from kernel_init+0x10/0x108
> > [    5.859370]  kernel_init from ret_from_fork+0x14/0x38
> > [    5.864524] Exception stack(0xc4819fb0 to 0xc4819ff8)
> > [    5.869650] 9fa0:                                     00000000
> > 00000000 00000000 00000000
> > [    5.877901] 9fc0: 00000000 00000000 00000000 00000000 00000000
> > 00000000 00000000 00000000
> > [    5.886148] 9fe0: 00000000 00000000 00000000 00000000 00000013
> > 00000000
> > [    5.892838] 8<--- cut here ---
> > [    5.895948] Unable to handle kernel NULL pointer dereference at virt=
ual
> > address 00000000 when read
> >
> > Fixes: a1477dc87dc4 ("net: fec: Restart PPS after link state change")
> > Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> > ---
> >  drivers/net/ethernet/freescale/fec_main.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/freescale/fec_main.c
> > b/drivers/net/ethernet/freescale/fec_main.c
> > index 60fb54231ead..1b55047c0237 100644
> > --- a/drivers/net/ethernet/freescale/fec_main.c
> > +++ b/drivers/net/ethernet/freescale/fec_main.c
> > @@ -1077,7 +1077,8 @@ fec_restart(struct net_device *ndev)
> >       u32 rcntl =3D OPT_FRAME_SIZE | 0x04;
> >       u32 ecntl =3D FEC_ECR_ETHEREN;
> >
> > -     fec_ptp_save_state(fep);
> > +     if (fep->bufdesc_ex)
> > +             fec_ptp_save_state(fep);
> >
> >       /* Whack a reset.  We should wait for this.
> >        * For i.MX6SX SOC, enet use AXI bus, we use disable MAC @@ -1340=
,7
> > +1341,8 @@ fec_stop(struct net_device *ndev)
> >                       netdev_err(ndev, "Graceful transmit stop did not =
complete!\n");
> >       }
> >
> > -     fec_ptp_save_state(fep);
> > +     if (fep->bufdesc_ex)
> > +             fec_ptp_save_state(fep);
> >
> >       /* Whack a reset.  We should wait for this.
> >        * For i.MX6SX SOC, enet use AXI bus, we use disable MAC
> > --
> > 2.25.1
>
> Hi Dillon,
>
> I have sent the same patch this morning.
> https://lore.kernel.org/lkml/20241008061153.1977930-1-wei.fang@nxp.com/
