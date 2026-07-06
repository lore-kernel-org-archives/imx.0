Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC16137DEB9
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 15:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350143; cv=pass; b=DeQL7q0COYMmidklPDYhOgpVA+l80hKM/UPl7sEWPtLlB+fpig0gmYchEoc2EN/fh1uO2EjrV0bNbQ6ucmWB6HEDPnVxoZ+xmCjOz9syWvw1L1cugXkEXXOltU3JlkwYLYls+1XTkTrGkX0XbQMpzbSLzlEwxlNV7HCfe4tFmrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350143; c=relaxed/simple;
	bh=uwie9VKIViz/AqclWFsim2aaQPT5dg/nPcZEXlZNetQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t+DG9Bbt7UTSGP6P9PabtengA4ANCK8QphNVpniR8jSGKuJ6gpBw0EwgEWJvoEG2is3fq8Kqx277u9/crk6/6k10ZXq5sqhUsl97mUgtPEib6o/4hs/MnS3424R+S4I2szWlFJTsopcXVE+DH3GjRczmrc9NGPC+JGgFn35vu50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XETIcxZ2; arc=pass smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XETIcxZ2"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3997a448ecbso31650291fa.0
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 08:02:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783350140; cv=none;
        d=google.com; s=arc-20260327;
        b=RrRTsfcNN9i/8toJcndAsw39U12dR8WJ/UNgaQAhkI+4VuVHu76wfDQYTpgeNfIgc0
         1n+1pB9o6UZGYrmf930qvQXGChB1QzhkwdB9NpCvbbsPigpT+8A/mMFUcS5qJyHPs7VP
         ZaFJhzeIxwmVYYkY5EamwcvG4T7HtJySkmjxWsiN5Tnc8iWYsFw9HrYTlIFbCFnEuoCN
         ms3ePV6Ocz0TW0WF1sT2DTirBPy/W+NqRqtoXH1zmoz2GiKEU6mjy21by47jf41RtnMA
         dBY4kr3iwPxbfoqg7PwFdDKoZ8Bv0K1lP2jtBaTy78IQR1O1miwvpRy3T1SSEWqzqsRX
         3WVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PWV4JkS2cCeJPf0nGFS2jwqaTnw6RGYanrKcHVTs/QE=;
        fh=bCCnq8rX+o+rOJPu6WWyR3sifpnOTIxyYv0t/4m8oYA=;
        b=k6qweE1ixkyHxMrbWGUa9In5ZAThygpwM2rs8NQ1qRokb86IPMJxNjSaQA1qnz6lpg
         Ph2Swrn6+aiw1RlvPDY6+SeGykoqXQe9259aTZUQ0Be/DWolppbGNe/BpRxG11BnICZw
         S4+8SAfCMOox9e7hsX+9ffXtjOMn4Jjz5fdO6clWA+/FFyfpke+Rt6Nhgiel3+xUUjKA
         n0DMtgbgC6/eDs5ePBWDFOdMnorACV+4UB5rkopT1iwkp/qlwdHC18q1weK3mZXYBJl4
         69zixOoF28E3avkc/U4K6e5lXfB9A2AYN4N2ujYs43bfdonc/pyWAQPzKt2TN8IPDSqK
         e8ig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783350140; x=1783954940; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PWV4JkS2cCeJPf0nGFS2jwqaTnw6RGYanrKcHVTs/QE=;
        b=XETIcxZ2dTx7t8hvSKvs4WuQNhROd6cPNuGGu1TjFp9ETSmP4q74s8UyO0TuQJWenl
         OAtXEtf5jyHIvy0Kc3san0zehEcBMIzKRgrVPDFk/TcDpyIWMrQNI5sCtuiLc8H7iZEE
         ctiWHkc6LbhTOq+HkgJs0qANCuFhLqdTyOAVLa9mdQfhHWGqnGhs8RhoWUQekTH8JIhD
         HOSQedwScAbxoA506KPH9C1MN3BKlMiIPZDdQOS/XTwTaAwnD7MoYVqTtStcaOn1LKet
         RppSITOMxgLS6f8amMhIL6FpvswB0v3nPgscLRX/R97BKbZud371r8KVUBv3xkTqLh6U
         8Xyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350140; x=1783954940;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PWV4JkS2cCeJPf0nGFS2jwqaTnw6RGYanrKcHVTs/QE=;
        b=XQfx1Mef/uJ2l2Jg5ldOWgOdo//o8TukG3ScPcFEesHrBBotd5PAvy/pp6zieN1AWc
         tDwgHcpKER94Zpn84/5PvzTGj5Z6xhcEi2Nb4ZFyg1lyGZcfy0ZpxmfT6HKZjmQE8Dv5
         E0wddT/3MUAVBt0LJubkglW3bURGkwP1Fjq/4PD0KZD9SsHqj0d/c9V7tt5QUpAIxT6E
         wsxa9lmEBVo3izqesIIaaZA33cTL+MlQFjxfiGE/8eEEFDTY/5hiGIzb8Xi8cLI1nldo
         S/e6xuhTbe+v0Dv3HjMFAmk+VvnG34b+1okkbTLR0wZVkLnzbhRv4bZvdEMwB10VpQmQ
         kKAA==
X-Forwarded-Encrypted: i=1; AHgh+Rqopj+uLFZozs2Z3BdaMGoUtZeC2+ApL7RXvIJle6gUX+ag+rZqoq7MowVxxpL9gsaDq5E=@lists.linux.dev
X-Gm-Message-State: AOJu0YzzvXsdM60ytDDBM+xO3u7tgEZWkjEa433CiFtcehNt1EXZdQsp
	X3Y9hqqoCzwOSl9Qjw1+YPbolj4PxSZ7CcWMMTrUbGCu/nYVZZAcq0a/R6pSSAIqybYvUF69dQw
	6iWbccbK2frEfMmOuFMn19jc1uP6xMXU=
X-Gm-Gg: AfdE7ckEX3g90popnv0DABEtdlpI+lvYU/bCEnJN+6pNdVWL5tz5mvA+QCl9SayKQJa
	rWkluODhhgdx0O0v+wU1AuK9mqyW8Qf22Hogov+N6ewK8StfjkTxUWOlmk8jAMWlMoZasXdvjtC
	Dbq8FUluiTPlMKM610mm3OAdCofKIyFeJQuSGiY1XeYmRB0uANHyTApC6Bwj7TgNmyinAth3HWf
	FT+eigM3eRsuPjALl24kTVva105hn9jqzCJZU3UkyAHk2r4iieb0fHFLJZ7yIniEOEZ+4yXG7Kc
	L9DGkvKWTgkMltqCp+M0sjWv22KedAg/C10em55NoBdxbJVsIHSiKiqYpcegfAE=
X-Received: by 2002:a2e:bc26:0:b0:39a:d718:da74 with SMTP id
 38308e7fff4ca-39c5fb3b7cemr2704641fa.0.1783350139532; Mon, 06 Jul 2026
 08:02:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260624100326.413699-1-piyushpatle228@gmail.com>
 <aj5MNiKSCiEDvDzL@raspi> <CAMB+xkayaViXeC2GyMMUfeCMzA4=fh-Dq6NYOL-hzKoLfAF19w@mail.gmail.com>
 <aksVMhFr8YzedE1w@raspi> <CAMB+xkY2rut-sEUMyFnXqYCNmyseP4nAGj4BfreORTTM=SN8_g@mail.gmail.com>
 <akuEOT2FRa77L0Jn@raspi>
In-Reply-To: <akuEOT2FRa77L0Jn@raspi>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Mon, 6 Jul 2026 20:31:42 +0530
X-Gm-Features: AVVi8CfYmix7GDHRP2N19e9NG0C7gIJlvJ3wBifD247sso2jQN2_T0J0s6RlIs4
Message-ID: <CAMB+xka8Fame7aFZSiWEtVcozSTXX8g9MKJu+cycU2vtiSDHmQ@mail.gmail.com>
Subject: Re: [RFC] drm/imx: upstream direction for i.MX95 display support
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, marex@nabladev.com, 
	daniel.baluta@nxp.com, Frank.Li@nxp.com, shawnguo@kernel.org, 
	tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, simona@ffwll.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 4:00=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote:
>
> On Mon, Jul 06, 2026 at 03:15:24PM +0530, Piyush Patle wrote:
> > On Mon, Jul 6, 2026 at 8:07=E2=80=AFAM Liu Ying <victor.liu@nxp.com> wr=
ote:
> > >
> > > On Sun, Jul 05, 2026 at 03:33:51AM +0530, Piyush Patle wrote:
> > > > On Fri, Jun 26, 2026 at 3:22=E2=80=AFPM Liu Ying <victor.liu@nxp.co=
m> wrote:
> > > > >
> > > > > On Wed, Jun 24, 2026 at 03:33:18PM +0530, Piyush Patle wrote:
> > > > >
> > > > > [...]
> > > > >
> > > > > > The current dc/ implementation is a multi-device component driv=
er
> > with one
> > > > > > platform_driver per block bound via the component framework. Th=
e
> > downstream
> > > > > > i.MX95 driver is a single monolithic platform_driver mapping al=
l
> > blocks from
> > > > > > one register base. Unifying appears to require reconciling two =
bind
> > models,
> > > > > > rather than only adding match_data.
> > > > >
> > > > > I think that upstream i.MX95 display controller driver would also=
 be
> > based
> > > > > on the component helper.  That's something for sure.
> > > > >
> > > > > [...]
> > > > >
> > > > > > There is also anticipated divergence which is not yet upstream
> > (i.MX8QXP
> > > > > > prefetch/PRG, LTS and tiling modifiers, and the downstream i.MX=
95
> > blit
> > > > > > engine), although mainline dc/ is KMS-only today.
> > > > >
> > > > > Just want to point out that I sent out v5 patch set[2] to add i.M=
X8QXP
> > > > > prefetch engine(DPRC + PRG) support for KMS.  That changes the
> > driver's
> > > > > mode setting code a lot.
> > > > >
> > > > > [2]
> > https://lore.kernel.org/all/20251027-imx8-dc-prefetch-v5-0-4ecb6c6d4941=
@nxp.com/
> > > > >
> > > > > [...]
> > > > >
> > > > > > One question for Liu Ying is whether the separate-driver plus s=
hared
> > > > > > helper-library approach is still the preferred direction, and w=
here
> > the
> > > > > > helper boundary would be drawn (which blocks/ops are shared ver=
sus
> > > > > > implemented per driver).
> > > > >
> > > > > Yes, separate DRM drivers + a helper library approach is still th=
e
> > direction
> > > > > I want.  I think that the drivers and library would sit in the sa=
me
> > > > > directory drivers/gpu/drm/imx/dc/.
> > > > >
> > > > > The purpose to add a library is to share code to reduce overall c=
ode
> > lines.
> > > > > I'd assume that shared blocks or common part of slightly differen=
t
> > blocks
> > > > > should be covered by the library.
> > > > >
> > > > > [...]
> > > > >
> > > > > > how the component and monolithic driver models
> > > > > > would be reconciled given the differences described above.
> > > > >
> > > > > Like I said above, I don't think upstream driver would be monolit=
hic.
> > > > >
> > > > > --
> > > > > Regards,
> > > > > Liu Ying
> > > >
> > > > Hi Liu,
> > >
> > > Hi Piyush,
> > >
> > > >
> > > > A quick follow-up with some progress.
> > > > I went ahead with the refactoring we discussed and now have it work=
ing
> > on the
> > > > i.MX95 15x15 FRDM, following the component-based model.
> > > > The common implementations for ConstFrame, ExtDst, LayerBlend, Fram=
eGen
> > and
> > > > the FetchUnit base have been moved into shared dc-lib-* helpers, wi=
th
> > >
> > > Can you please share the code in a public place, like github?
> > >
> >
> > Sure. I've pushed the current work-in-progress branch here:
> > https://github.com/PiyushPatle26/linux-mecha-im95-wip/tree/imx95-dc-pre=
view
>
> I gave this branch a quick look.  The major problem is that you are using
> the same 'struct drm_driver dc_drm_driver' for i.MX95 and i.MX8QXP displa=
y
> controllers instead of using separate DRM drivers.  From userspace's POV,
> they should see different driver names(drm_driver.name).  From drivers'
> POVs, they should implement different mode setting callbacks.

I've reworked it based on your feedback and updated version to the same bra=
nch
I've split them into separate DRM drivers.
The shared dc_drm_driver and dc-drv-common.c are gone. i.MX8QXP and i.MX95
now each have their own struct drm_driver, component bind path, probe logic=
 and
mode-setting callbacks. Userspace now also sees different driver names
for the two SoCs.

The mode_valid, atomic_check, atomic_begin and atomic_flush callbacks
were already
identical in the previous version, so I've left them as a small shared
helper to avoid
duplicating the same code. If they diverge later, I'll split them into
separate implementations.

>
> It looks like it's not worth extracting common code into those dc-lib-* f=
iles.
> Each dc-[block].c is a library itself, though I could be wrong - after al=
l,
> I haven't find a time slice to add i.MX95 blocks to them and see how they
> will be.
>

Agreed. I removed the dc-lib-* split. The shared register code is now place=
d
directly inside each dc-[block].c file, so every block stays
self-contained while
still being reused by both drivers where needed.

> The idea is to share some code between the two DRM drivers *naturally*.
>
> >
> > The files you asked about are:
> > drivers/gpu/drm/imx/dc/dc-drv-common.c
> > drivers/gpu/drm/imx/dc/dc-lib-*.c
> > One thing I'd like to point out is that the pixel interleaver, display =
pixel
> > link, LDB and LVDS PHY drivers are ports of the existing NXP downstream
> > drivers. The new work in this branch is mainly the DC refactoring into =
the
> > component model and the shared helper library.
> > > > SoC-specific register layouts and tables supplied as data. The per-=
SoC
> > glue is
> > > > split into dc-drv-common.c, dc-drv-imx8qxp.c and dc-drv-imx95.c, wh=
ile
> > >
> > > Same here, just want to see how dc-drv-common.c and dc-lib-* would lo=
ok
> > like.
> > >
> > The files you mentioned are available under:
> > drivers/gpu/drm/imx/dc/dc-drv-common.c
> > drivers/gpu/drm/imx/dc/dc-lib-*.c
> > The helper library currently contains the common implementations for
> > ConstFrame, ExtDst, LayerBlend, FrameGen and the FetchUnit base.
> >
> > > > i.MX95-specific blocks such as DomainBlend, Dither, FetchEco, Fetch=
YUV,
> > > > HScaler and VScaler remain separate component drivers.
> > >
> > > i.MX8QXP display controller also has Dither, FetchEco, HScaler and
> > Vscaler,
> > > so they are not i.MX95-specific blocks.  To add minimal feautures at
> > first,
> > > we don't need to support them as of now.  i.MX95-specific FetchYUV is
> > similar
> > > to i.MX8QXP-specific FetchDecode, so maybe FetchYUV won't be a separa=
te
> > > component driver at the end of the day.  To start up small, I think t=
he
> > > must-have DomainBlend and Dither(for Data-Enable, HSync and VSync pol=
arity
> > > controls) and two FetchLayers can be enabled to support two display
> > pipelines.
> > >
> >
> > Okay, I've reduced the implementation accordingly. The current branch
> > only keeps DomainBlend, Dither and two FetchLayers. FetchEco, FetchYUV,
> > HScaler and VScaler have been dropped for now.
> > > BTW, do you have the i.MX95 TRM?  If no, then it would be difficult f=
or
> > you
> > > to add DT bindings for *all* blocks.  Note that the DT bindings are
> > supposed
> > > to be complete at the first place.
> > >
> >
> > Yes, I do.
> >
> > > >
> > > > The implementation is functional on the FRDM over the pipeline
> > > > DPU -> pixel-interleaver -> pixel-link -> LDB -> LVDS PHY -> IT6263=
 ->
> > HDMI
> > >
> > > As I said before in separate mail thread, pixel link is not used in t=
he
> > LVDS
> > > display pipeline, but instead it's only used in the MIPI DSI display
> > pipeline.
> > >
> >
> > Thanks for pointing that out. After checking the TRM, I updated the DT =
graph
> > so the LVDS pipeline is now:
> >
> > DC -> Pixel-interleaver -> LDB -> LVDS PHY -> IT6263 -> HDMI
>
> Yes, this pipeline is correct.
>
> >
> > Removing display_pixel_link from the LVDS path also required moving the
> > bridge
> > format translation into the pixel interleaver driver.
> > > >
> > > > EDID is read successfully, the initial modeset works for all tested
> > modes
> > > > (1920x1080@60, 1280x720@60, 720x480 and 640x480), and Weston and sw=
ay
> > both run.
> > > >
> > > > There are still two known limitations. The initial modeset works, b=
ut
> > > > subsequent mode changes currently wedge the ExtDst content shadow l=
oad,
> > which
> > > > appears related to the lack of a reset path for the i.MX95 FrameGen=
.
> > >
> > > Not sure what's the cause of the issue, but FrameGen needs to be disa=
bled
> > and
> > > then re-enabled if you want to do a full modeset.  I'd say that's not=
 a
> > reset
> > > path.  This critical issue needs to be fixed before posting formal
> > patches.
> > >
> >
> > Understood. I'll continue investigating the modeset issue before postin=
g the
> > formal patch series.
> >
> > > > In
> > > > addition, the DSI path is implemented on the DC side but remains
> > unvalidated.
> > >
> > > It's fine to support the LVDS display pipeline first as long as it do=
esn't
> > > do harm to the MIPI DSI display pipeline support.  So, maybe drop the
> > latter
> > > first.
> >
> > I've done that in the current branch. It now focuses only on the valida=
ted
> > LVDS pipeline.
> >
> > >
> > > >
> > > > The implementation is currently based on v7.2-rc1 together with you=
r
> > prefetch
> > > > v5 series.
> > > >
> > > > The work is now ready to be posted as patch series: Adding LVDS/DSI
> > > > i.MX95 support.
> > > >
> > > >
> > > > Regards,
> > > > Piyush Patle
> > >
> > > --
> > > Regards,
> > > Liu Ying
> >
> > Thanks again for taking the time to review this.
> >
> > Regards,
> > Piyush Patle
>
> --
> Regards,
> Liu Ying

framegen re-tune issue is still unresolved.
I'll fix that before posting the formal patch series.

Regards,
Piyush Patle
