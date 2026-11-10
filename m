Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794310858;
	b=tWgkoNXqhgA9VbvoDAUf3ghVsZjT84vJjtil1nwcj5XeqxyPuO0+pYqCOQkJo+8xN98Y
	 Nl9Da4y5HKUwQ7M4ZF1O2SVdXfCwYvxtcdX4dzUADSNrkP7tXdrExZdG4ZeyOAFUlziZ3
	 QR4VX8mzhyo9TgyRTy4l9r4ncHEAJalOblkM3XikFobhl9NUsIXTFr6zbtxvfpEYsrEbe
	 u2RaVIZmaBcPuAliGHIwzoj1GQZoTFFLnl7g90vg5Qm6K+FW4UEnD9fMEa5XrGh1wax0F
	 Wt044zSbjdyCsY1WkX19yVCATh9+DfLuDrcj+/RWX99ZTUOjruiduAB3IqHJSn8BuWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310858;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=yOns8afdH57msgp9zNnSSwBgpZ3DYVzL6nqt0tH+JOY=;
	b=uYjkx2nhJVRvoMmamZVjvEC8OSPf4CON3UDHsvonRcYYEG4dY6hVytoFClMUsJ4fVacK
	 1g4z+dWtO6UrD2I/5ZZ2LEL4JNoTCAeR0w+B0G0rq6nj9UoQQz1QizXEy88roJGHymw4e
	 7jGbHYleeb7HMpRM8W5jbzxOC9j7cjcTNAhlePScO0qg6VBNb2xEs7UvrSMaR8MxEDP7b
	 TAstESW5PaWH8LIl/+gi+ci9jKMXbppGrvuvH5hSQhqmRA1g5fgG4tKrzhtivXnV9yksa
	 73ybtYuoVBy+ar6LMwgUgrk4Mr1fXMFUtP+IY0nCh/rhRAtryDfgB50GiMtI+0MkufA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i3ACx4ou;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4707D606A330
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 11:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4707D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i3ACx4ou
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91ea5600c9cso24525896d6.1
        for <imx@lists.linux.dev>; Tue, 10 Nov 2026 03:40:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794310857; cv=none;
        d=google.com; s=arc-20260327;
        b=dU784b5VoYYiFtLl0IlbavnEfQ768XO//JTW7ciYwamY2YZVq7K+WAcmoODmfJTmSR
         7cEtuIeJH3Ku0IhSMXimLIN182XGUsHNad5BQ2UaoIigH6tpPOnQfwIwacvSnFvoWoFe
         cuH1/DoDD2Qx59+5HDY1eE0xhJWBND0+NzSvxhiS7zcz/qjRcJ678zzXi4L3FMv9Lhv5
         PaCaBTTi3/o3wAoDaFOVOyufD0qibE31NMEpn/HpwqhwsRPvGUvgTov3y3E6o1tHKAQY
         pnkI0I9tg29iEiK1n83oPx0/IavFy27bRtxwKVXaUohEGYVocfOJrFiczJz2IsVvvRlv
         6QbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yOns8afdH57msgp9zNnSSwBgpZ3DYVzL6nqt0tH+JOY=;
        fh=LcgpHvf8Q9R5NlBSSEW9eNy+WcF5IoW3LDiZImP2iwU=;
        b=TIFuEzxIk471sCGBR0rsNE+TtO01DRxIfGz6Wj3j9JpZZQgNeBoe9Gs2LiMc4eh47/
         exp6+lA6zYR4OaxA72MRF7CUcGBBXe5aE5ENbvYsPwdouuDRrmae6I69VoyKkJMfQc/O
         XISxJQohFDVBMV36Cr/N1DRYs2cgDPIds16vRt/a6fdT0yzERbnHTg3pV8FWj4/9SNvi
         0Z6SwpfSsNs3RQWzguX4VXYIphaMqY6l0f8hFubAamLlU/ZqOUeKkr2XQ0NCLVh5EdFm
         JbLxYsAz1vG4wIz8znzvmFoQDXrp9xUWeeVWfHvY0A0K6JAp0uv90YVNMBCFoiCXCf5R
         O5wQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794310857; x=1794915657; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yOns8afdH57msgp9zNnSSwBgpZ3DYVzL6nqt0tH+JOY=;
        b=i3ACx4ou5VHF3dSvhmvRTUEA8hhZPnKlH3+IcLMnanLVtULaOKEO2Fdq3QlBxJ9gHE
         oAjN4hTgUtdiALmWPehDq104TzxpGjVIyAwCjJ5Z0J2snwAhq2b58c+YxGvOZWzdKKh9
         0vUuhHyLrqfxFsFNjy/Q8GsEkKmrkDCHtfoXw2d72KLHE8G21iTmO3BIstdiO/FRFRRy
         KHsNvXKZ3Txr1cI83htRXYksE/SnqAUD6A6mOj3Mu5EzjhVnErTSECCMv34DW9Zwe3er
         eIBThsQQpF0fo6cTEKSdxJsh0ccr0W9YxOsg9gnhsRmDNzXkRNvNTJGawiikOMIFNXeo
         n5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794310857; x=1794915657;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yOns8afdH57msgp9zNnSSwBgpZ3DYVzL6nqt0tH+JOY=;
        b=HzuVUbtNida2mtByvVDaP3O+dzM8HVGEd4SDjStGCZetXS0UNFvX99lpWc9R+XZFe3
         S/HIOVe5jcMtGoIqjLzREkTii3vMf/gYRlBnHaQVGC6CTIslgH/N7FwmfLXCgp265Epe
         FJh+p5loLIR20tnJ09ZxX5TvLLICPLamumdIirw/4Oii5oz+CPiwRVnLD57k1xqf2U8m
         nwv0qgOZcZwfEs4ObDKFpEivzn6NOvnamIOdBCxPi+3H1qChzkX6d40nvYzAkk/z5KHd
         5wV30vj6W7GameKFrCoBi2VCADJDrHXl8QGND2O9t+QQhyTZrWO+NPCOncYk65fOZgAS
         f/TQ==
X-Gm-Message-State: APuU4Z8X1jW4J+uP4xHIYO2inJKs8IWthL7yhsV4zhFKX6W7lCGggsxw
	OfcW27vEjokIPkLf2IbvaTR2nt/YLkN7nnr47TBenn67n/LxWibrbpDrUad3LNja/lfS7Jvc+gC
	ArVFyUs85xvMMdQV9gNLicpUTx5TJgxI=
X-Gm-Gg: AYBFou0qa9QWh7T+zhRV3pcql20AsHYeUxO4F4EmWyqELu0tnDNt1lrlRNeMsUnd1Fb
	Z+7y3d8gBVjydGM/+iq9lKGri/DMKhPNb0+hu5pAcN/r6bdPGGxmcZkmoMttjQsbMinmCkSfwVM
	MskigzjtsNlogRLaz0DeReGNhHjVuMqrHFPp9QyHMmnpp2J2sBHTcpeo59feJH74N8elmCwMvKO
	IsLEwddOoerWLtP+4QGHDrt5lIE91OTawivQS7dTGWINpSfgKcfJA5+AsdRPT0Q7ObMfVaUPc05
	XjL8LK2jG0ELtjGjRSESxoH8gXduju83lBseLJlrMrIfkWJStA6ahGXzEAo1ifgrn4CwCquvve6
	Q91SkEA/NiPGR6U+EwBiskiWBvQbXh77KsyKtA8Mx+9B4SHcBzrA8BzjdflvoIk6FQj9Ff2noxm
	F2TkZJAmUkdYqnxg==
X-Received: by 2002:a05:6214:daf:b0:91c:144e:fb71 with SMTP id
 6a1803df08f44-91ef0255616mr33151936d6.24.1794310855984; Tue, 10 Nov 2026
 03:40:55 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110105436.2487822-1-hj351016@gmail.com> <sashiko-outbox-206921@kernel.org>
In-Reply-To: <sashiko-outbox-206921@kernel.org>
From: khj <hj351016@gmail.com>
Date: Tue, 10 Nov 2026 20:40:44 +0900
X-Gm-Features: AclHuK95HtKLSfOqbTSyErDz1GpIXJGgGnTKcIi6bWHaVEa1K4fFqz8zx3nLc5E
Message-ID: <CAGr5VtP-Sb3k9dT5zuJ0D=AQYVfsBN4igVE2ocArZ3=s050rNg@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: imx_dsp_rproc: drain the vq work before
 freeing the mailbox
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks -- both are correct, and my patch is wrong.

[High] The AB-BA deadlock is real. imx_dsp_rproc_free_mbox() runs from the
pm_runtime suspend path (__rproc_shutdown() -> rproc_unprepare_device() ->
imx_dsp_rproc_unprepare() -> pm_runtime_put_sync() ->
imx_dsp_runtime_suspend()),
and __rproc_shutdown() holds rproc->lock across that. imx_dsp_rproc_vq_work=
()
also takes rproc->lock, so cancel_work_sync() there waits for the work whil=
e the
work waits for the lock -- a deadlock. The cancel must not run under
rproc->lock,
so it cannot live in free_mbox().

[Critical] You're right that the unbind path can skip free_mbox() entirely:
devm_rproc_add() is registered before devm_pm_runtime_enable(), so on unbin=
d
devres disables runtime PM before devm_rproc_remove() runs rproc_del() /
__rproc_shutdown(). pm_runtime_put_sync() then returns -EACCES without call=
ing
imx_dsp_runtime_suspend(), so free_mbox() never runs -- the mailbox channel=
s and
rproc_work stay live while the rproc / imx_dsp_rproc are freed (UAF + the c=
lk
leak you note). So my one-liner does not even fix the unbind UAF it targete=
d.

So this needs a teardown rework rather than a cancel in free_mbox(): e.g.
reorder devm_pm_runtime_enable() before devm_rproc_add() so the suspend pat=
h
(and mailbox free) actually runs on unbind, and drain rproc_work from a con=
text
that does not hold rproc->lock. Since that touches the driver's probe/teard=
own
ordering, I'd rather not guess at the shape -- Mathieu, Frank, how would yo=
u
prefer this handled? I'm happy to send a v2 once the preferred
direction is clear.

Thanks,
Hyunjung

2026=EB=85=84 11=EC=9B=94 10=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 8:08, =
<sashiko-bot@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] remoteproc: imx_dsp_rproc: AB-BA deadlock in
>   imx_dsp_rproc_free_mbox()
> It also noticed 1 related pre-existing issue this patch does not
> introduce:
> - [Critical] remoteproc: imx_dsp_rproc: use-after-free and resource
>   leaks on unbind [1]
> --
>
> commit 17e3fec9a8c6e436afd532f653405b5a78e316af
> Author: Hyunjung Ko <hj351016@gmail.com>
>
> remoteproc: imx_dsp_rproc: drain the vq work before freeing the mailbox
>
> This commit calls cancel_work_sync(&priv->rproc_work) in
> imx_dsp_rproc_free_mbox() after freeing the mailbox channels to drain any
> pending virtqueue work item.
>
> > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/im=
x_dsp_rproc.c
> > index 96d619daf3f5b..89c72d916b1e4 100644
> > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > @@ -642,6 +642,13 @@ static void imx_dsp_rproc_free_mbox(struct imx_dsp=
_rproc *priv)
> >       mbox_free_channel(priv->tx_ch);
> >       mbox_free_channel(priv->rx_ch);
> >       mbox_free_channel(priv->rxdb_ch);
> > +
> > +     /*
> > +      * The mailbox rx callback schedules rproc_work; the channels are=
 now
> > +      * freed, so no new work can be queued. Drain any pending work be=
fore
> > +      * the rproc (which the work dereferences) can be freed.
> > +      */
> > +     cancel_work_sync(&priv->rproc_work);
> >  }
>
> [Severity: High]
> Can calling cancel_work_sync(&priv->rproc_work) in imx_dsp_rproc_free_mbo=
x()
> cause an ABBA deadlock with rproc->lock?
>
> CPU0                              CPU1
> ----                              ----
> mutex_lock(&rproc->lock)
>                                   imx_dsp_rproc_vq_work()
> cancel_work_sync(&priv->rproc_work)
>                                     mutex_lock(&rproc->lock)
>
>  *** DEADLOCK ***
>
> CPU0: __rproc_shutdown() -> rproc_unprepare_device() ->
>       imx_dsp_rproc_unprepare() -> pm_runtime_put_sync() ->
>       imx_dsp_runtime_suspend() -> imx_dsp_rproc_free_mbox()
> CPU1: process_one_work() -> imx_dsp_rproc_vq_work()
>
> Because priv->rx_ch remains active until mbox_free_channel(priv->rx_ch) r=
uns
> inside imx_dsp_rproc_free_mbox(), an inbound mailbox interrupt before or
> during shutdown can queue priv->rproc_work while __rproc_shutdown() holds
> rproc->lock.  imx_dsp_rproc_vq_work() then blocks on rproc->lock while
> imx_dsp_rproc_free_mbox() waits in cancel_work_sync(&priv->rproc_work).
>
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can unbinding an active
> DSP remoteproc device skip imx_dsp_rproc_free_mbox() entirely [1] and
> leave both the mailbox channels and priv->rproc_work active when the rpro=
c is
> freed?
>
> drivers/remoteproc/imx_dsp_rproc.c:imx_dsp_rproc_probe() {
>         ...
>         ret =3D devm_rproc_add(dev, rproc);
>         if (ret)
>                 return dev_err_probe(dev, ret, "rproc_add failed\n");
>
>         rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_XTENSA);
>
>         return devm_pm_runtime_enable(dev);
> }
>
> Because devm_rproc_add() is registered before devm_pm_runtime_enable(),
> devres teardown disables runtime PM before devm_rproc_remove() calls
> rproc_del() and __rproc_shutdown().  When imx_dsp_rproc_unprepare() then
> calls pm_runtime_put_sync(), rpm_suspend() fails with -EACCES without
> calling imx_dsp_runtime_suspend() or imx_dsp_rproc_free_mbox(), leaving
> priv->clks enabled and the mailbox channels and priv->rproc_work able to
> dereference the freed rproc and imx_dsp_rproc structures.
>
> [1] https://sashiko.dev/#/bug/linux-a6e902ee-9958-4d44-96cc-d854c6256124
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110105436.24=
87822-1-hj351016@gmail.com?part=3D1
