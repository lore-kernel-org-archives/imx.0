Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1706A19CCF7
	for <imx@lists.linux.dev>; Fri, 20 Mar 2026 01:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773968783; cv=pass; b=nIsUhjSu6Lr7lQ3WOo0/iozeJZ8o7MOjHp/FKj6LJZ/oc+Y7s3aaiDQRw6aDwvA0an+lpgstQYdgP/5anwatbxN0kWVqdKB7FmJ4C5Asm2qhEpqbRPZ/eNrQaLcVx15DEN84/eP71QTSipAMSNtsJUFEbGQDgXHLeByukpemzys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773968783; c=relaxed/simple;
	bh=r69ExM9MAmSbi4Pa8SdsjkeGTV4p53z6YKYrX7qJXnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YWsZJd4kOgeOlSups/afgNF9GE1PwX5o3YB//zcpbZH1C3s4CmTH3jbfyzNBeQnTyL+RRC5giHpVGTkm3BOUyh8epaFlLafXmyo+hF3oojCi3frZkzL4Q2OuRt7MLQtz02WR2/dXRfNmcMr0O29vTr7WxuFaapljBl4sjSyEU8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGVTUQeq; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGVTUQeq"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-668d41905a4so508862a12.0
        for <imx@lists.linux.dev>; Thu, 19 Mar 2026 18:06:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773968780; cv=none;
        d=google.com; s=arc-20240605;
        b=geZbtWXpgWWA1ik4j0Vcawg1P81DghV/u5OuDF2vMqIqDrd9f0BeFTYKa8EB7zvcHX
         t7dXglafScOD7p1fNJusomExkstW1+K0JRUCPxiuteuu77yq0krtbjWFAVE75kA2z+ux
         OZAWy/eN07wOQ9jdF/yv3fAV9R5MPq+0RwPER8BDNld63gjKfk8DJZUf/7Qp925zcS70
         SA+f0hTuMiC1pRwau008usHsgY++0xH5kYJGq8CUKZxGsH4i3IZ+ue5oDSRWWJli+QLa
         mBd+MRYCqA+DlKE4nNfBRrlRiLr6Th2eteMuzX9G4sI9R7UiFswvpqz37z4ViYjUzT9U
         WmzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9SqJxw/G3C8Z+MfgxLYlgt9ClPmc6gVykGItWwhh0uU=;
        fh=saUO6yY50D58Oku8OGTsC5JTifbKFUTg8JB9245iTFM=;
        b=fWDkKALxkIa5UB/ufJkZk/2CvYpQ+i+N//sjD7wBfyM/Q96M3LdlEtuu0Ayb2/2JjD
         7pvJKqrqnZJgP5bloUbHZlEzn0hNADDcwbL73UgFjy5+Kew1hcKQgmYERX4mzPNCIERO
         MGW+vzF2089ERJzJlIsS55ZIYqplQw74H+Vx/RoDzKTtk6Wo1nun4s+bD27wdtfp98Qd
         AgQ+TsBzLN7mfhYimge9LAW6+/w0oYG1LBi9gDlTaY8C+q1nwp2PjhWa6ru3YX3CiGIp
         0gOYwDrlVligTEJ1TeGaArTunsCNztGqRliuWpfed6DGUb0u/dfZW48dttVlj5620xJx
         Bnsw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773968780; x=1774573580; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SqJxw/G3C8Z+MfgxLYlgt9ClPmc6gVykGItWwhh0uU=;
        b=dGVTUQeqn1RWio0R/eZYrPfh4zS5lZXT6XvbJpdTdYWYQULNEve6mpH9iYt5uvBich
         Jx9NtvZeUUf43ab9ziE7lFgwjpET8g0xaOblmqlCmk+ZhCF9gItohtvaygI9md3RKB7W
         DkadBsLVvW2pZi/dUjBQN2eSEswpdLaS6lolBvqHLDiK8CraSGO/cBURIjnQDZoTVttw
         ABFgpRpTD/932omM0Dcb8ErdkO58IQf2057ozGhYZuwrSqnY9mZvyaAcPE5kQNoX9d32
         WEJOvHb6AykN19ujK8ypD4rLBZwYTjDh6ujIkWu+h60OLp8i7ccvqxldxQK4tdhyBrll
         17Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773968780; x=1774573580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9SqJxw/G3C8Z+MfgxLYlgt9ClPmc6gVykGItWwhh0uU=;
        b=NFYKEdMTM0SfNn2G2G2HxRkFYGF19pUeeoigk6UBETw8GekSUN9juBGrE3+BHf/6HF
         +9Y2xvbDf7p6Nfj8WIdk8hQ0Ix5dQPqunFiYUJGfGPlXx/cSQ/BNhagvjEDi0zfer0vn
         35q+G/42a/I5WMIAZCrFkQvcfEZ8TmaoS9Ymh9hiCb7kiOxbeY5wUNCHtB1L5Tv09Mug
         N4QzRDVifL2oFpkEOdi/W/554OfDDVvtgSzBSNNiKQ4yHc9WIaYs8YDy1WnMAb2p03Vv
         61GsyQVfDZq989s4FMhb6o17fVlin/hCEo65mszDzC58XayY3RIgWYRQ877vNJNTc7kX
         PyaA==
X-Forwarded-Encrypted: i=1; AJvYcCWWQfrX/tVVpMkIv5yUipGArCVJYEHD92cxthFhWw1qPzrg/0/HYWgRKXqhFgsOBXNweq8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxdoosfW0XwG0SgBun3GpfXgDuudKHwTBTvaWAQUNvcUhErTYsR
	URmSHJDWxVNjxf9igY0XOpP0/khZOgip6b/smXs+GNINWrWh9srMXKIhJWvjKUM38UPw11i7qqw
	hu3t0pNl2C5CpYoppGf6B8e+YJSU7hzXhz3gE
X-Gm-Gg: ATEYQzz47YRhdUJ2tktXPWJbcquIUApR/Nfn611fP8NJeNKGXjOkcF+/RJSTUYLKgSf
	dXofpFR3pzCQs3HnYWK07ODIJiQ8/V9CDdxNcXaimg0ZTceUGAtPXXF2LvEmHY9Lx6yJUTOb931
	I24iREbpDjiGffHjvco4Hc/TsccQS4d3U7xCPyBkhUH1m1pV57eiqlKb+b1SgUbr4/6TVeP/I/8
	FH4X9+7Th8pj8wnXzNHqu8AQMjPNwNBazOc89ar0BYnHL+h6tfEdyQD60TyOTssk4pYif4bmtIi
	B34dpdGsTcbFOLbUzbBephXgSm91xxWTDEYUNFaWz9MNF8FBSFohlF8pl0s1xjGlW3dJbxRVL54
	jhqRFhg==
X-Received: by 2002:a17:907:8d85:b0:b97:f1a8:ecb7 with SMTP id
 a640c23a62f3a-b982f20c0b2mr81117866b.25.1773968779976; Thu, 19 Mar 2026
 18:06:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260306044536.149204-1-rosenp@gmail.com> <20260319220901.GD950375@killaraus.ideasonboard.com>
 <CAKxU2N856yYXURRf3td-_RCpe9hyX=zAy3qtD3ki23RjgO+a4Q@mail.gmail.com> <20260320005737.GE950244@killaraus.ideasonboard.com>
In-Reply-To: <20260320005737.GE950244@killaraus.ideasonboard.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 19 Mar 2026 18:06:07 -0700
X-Gm-Features: AaiRm53rx05Tqdc9FwzZoPf5XXpIJZUGAo0qoy3HNuWTkbHSxfZxEG9QI9aaaDs
Message-ID: <CAKxU2N81WEMkAPOVRHUORWodc21oW7wqvUJYVhd3uBJdLxRW4w@mail.gmail.com>
Subject: Re: [PATCH] media: nxp: imx8-isi: remove kzalloc_objs
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-hardening@vger.kernel.org, 
	gustavoars@kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 5:57=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Mar 19, 2026 at 05:11:22PM -0700, Rosen Penev wrote:
> > On Thu, Mar 19, 2026 at 3:09=E2=80=AFPM Laurent Pinchart wrote:
> > > On Thu, Mar 05, 2026 at 08:45:36PM -0800, Rosen Penev wrote:
> > > > Use a flexible arraay member to combine allocations.
> > > >
> > > > It looks like pipes never gets freed anywhere. Meaning this effecti=
vely
> > > > fixes a memory leak.
> > > >
> > > > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > > > ---
> > > >  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 11 ++++-----=
--
> > > >  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  3 ++-
> > > >  2 files changed, 6 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/=
drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > index 16392420903a..657ffecc4d7e 100644
> > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > @@ -459,25 +459,21 @@ static const struct dev_pm_ops mxc_isi_pm_ops=
 =3D {
> > > >
> > > >  static int mxc_isi_probe(struct platform_device *pdev)
> > > >  {
> > > > +     const struct mxc_isi_plat_data *pdata;
> > > >       struct device *dev =3D &pdev->dev;
> > > >       struct mxc_isi_dev *isi;
> > > >       unsigned int dma_size;
> > > >       unsigned int i;
> > > >       int ret =3D 0;
> > > >
> > > > -     isi =3D devm_kzalloc(dev, sizeof(*isi), GFP_KERNEL);
> > > > +     pdata =3D of_device_get_match_data(dev);
> > > > +     isi =3D devm_kzalloc(dev, struct_size(isi, pipes, pdata->num_=
channels), GFP_KERNEL);
> > > >       if (!isi)
> > > >               return -ENOMEM;
> > > >
> > > >       isi->dev =3D dev;
> > > >       platform_set_drvdata(pdev, isi);
> > > >
> > > > -     isi->pdata =3D of_device_get_match_data(dev);
> > >
> > > I'd keep
> > >
> > >         isi->pdata =3D pdata;
> > >
> > > here and not below.
> >
> > Sure
> >
> > > > -
> > > > -     isi->pipes =3D kzalloc_objs(isi->pipes[0], isi->pdata->num_ch=
annels);
> > >
> > > Wouldn't it be simpler to just replace this with devm_kcalloc() ?
> >
> > That would only make sense if pipes remained a pointer. A flex array
> > member allows combining allocations since it doesn't take up extra
> > space.
>
> Yes, I understand that. My point was that with devm_kzalloc() here you
> won't need to change the mxc_isi_dev structure. The leak fix will be a
> one-liner patch.
Leak fix is not the point of the patch to be fair.
>
> > Technically kzalloc_flex is simpler but I assume a devm version of
> > that will be handled in another treewide commit.
> > >
> > >         isi->pipes =3D devm_kcalloc(dev, isi->pdata->num_channels,
> > >                                   sizeof(isi->pipes[0]), GFP_KERNEL);
> > >
> > > No other change would be needed.
> >
> > With a flex array member, that's a compile time error, which I use as
> > a hint to complete the conversion.
> >
> > > > -     if (!isi->pipes)
> > > > -             return -ENOMEM;
> > > > -
> > > >       isi->num_clks =3D devm_clk_bulk_get_all(dev, &isi->clks);
> > > >       if (isi->num_clks < 0)
> > > >               return dev_err_probe(dev, isi->num_clks, "Failed to g=
et clocks\n");
> > > > @@ -487,6 +483,7 @@ static int mxc_isi_probe(struct platform_device=
 *pdev)
> > > >               return dev_err_probe(dev, PTR_ERR(isi->regs),
> > > >                                    "Failed to get ISI register map\=
n");
> > > >
> > > > +     isi->pdata =3D pdata;
> > > >       if (isi->pdata->gasket_ops) {
> > > >               isi->gasket =3D syscon_regmap_lookup_by_phandle(dev->=
of_node,
> > > >                                                             "fsl,bl=
k-ctrl");
> > > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/=
drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > > index 3cbd35305af0..99532efa4e41 100644
> > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > > > @@ -286,7 +286,6 @@ struct mxc_isi_dev {
> > > >       struct regmap                   *gasket;
> > > >
> > > >       struct mxc_isi_crossbar         crossbar;
> > > > -     struct mxc_isi_pipe             *pipes;
> > > >       struct mxc_isi_m2m              m2m;
> > > >
> > > >       struct media_device             media_dev;
> > > > @@ -294,6 +293,8 @@ struct mxc_isi_dev {
> > > >       struct v4l2_async_notifier      notifier;
> > > >
> > > >       struct dentry                   *debugfs_root;
> > > > +
> > > > +     struct mxc_isi_pipe             pipes[];
> > > >  };
> > > >
> > > >  extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;
>
> --
> Regards,
>
> Laurent Pinchart
