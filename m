Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C78F3B7A8
	for <imx@lists.linux.dev>; Fri, 20 Mar 2026 00:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773965496; cv=pass; b=g2Bx72OLQdYlTAMl36AsoT8B275k0S8W9/8iEUz7p7tyT1qVqtXTi3CWpIUEOA6tkA6CZJ1wUntSHHbHngqo7jzddOo1GCS1LKNWc+hxBhnvCXT228SIvgr/l8tU+AkOpvRohWtd1+LzMrZNjvXRLYFkJw7C/I101CIn4CKrJKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773965496; c=relaxed/simple;
	bh=gI9RF56rEVccfANAw0mjJRT6sIl7aJcBmX4u0k/0kLY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a6dM5T2SGctcjUD3mteI6qKXeXJpu0AJSXPtjd3+0O6OSLfRhcjIp58lRRY/YoP5wGplRvcBkCzR4X/4LcfrNj8Kmz/DJTPNBlA1u5AeHPvA5dmv6w5wF1+J18IGCoGWdF+Qfh3XTC/p9YIFxAtwWPyBk11bj8CAAJoS4xlQdTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uqxq/Jko; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uqxq/Jko"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-660a58841d4so94678a12.0
        for <imx@lists.linux.dev>; Thu, 19 Mar 2026 17:11:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773965494; cv=none;
        d=google.com; s=arc-20240605;
        b=ByzZ8G0FTeyDuL9y5ZurEhrVViDRVhlB321jriMMkoj4yR1EgExoWS0qjhaB3W0a/2
         WclZZaW5AaQpWlxjleAo700av4F5DNACSf/dYhQPwU2aOEESNXZjXubKNI/rOOJkkON3
         RoC9omjk4Uo+ccTCmvQzQS2ZXek4GTV0//m3vqMnxXwuTwx7Fstrz1/2WeqQWSYTZCfF
         Ze4LcNaQwPGqTMuAC4B9GmpPrJ9jYp7bmQOBpNhwWSz46Ioe9Tzdyhw1kuoCMF1inaBt
         pD3LWG98+8gP1BjQOd0K79WEaQKvBksk3aosFOjN5WSkTzEvBRwfu6++O7agl/hGBC6z
         LkUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NsqY7865Oc2d7isEI7t69HCmXThZdea9XKdAmAr2SZw=;
        fh=Xj75yChSmdxY6HkTXXdSDTy0e4Usty13VRhuWRhb1xU=;
        b=XY49eK6wi9AV5NKSIJuMoAjl71r7h71Ukp7/VW4ys5DOBXol0fg9IFfd0zz7Okbgrh
         gJhtViZsNNX1H6LDF3SIsdAi78xx/zC5IhpQ0nnZm5qIwwgPkSivH0ZBhbTXARxgnuoI
         2mdoOhqDAQ9B5azSAFLWUB4uVTz/6cI7OdRXAx00sR3TDi0cRyAf2ZpCMYVdLEYG1CA0
         0meeNy7dRhrGfSy6FhcM3kUq0Z6zo8jSyLX/HZBl/gl+ntZYRbb2vuJgjwupZvqq/9Zq
         0qpDPH6jT1lpqRNvM+A8caCK58mbSZyKjsQJucXrl9zZ36RFS5ghBxiO6fvyCTxZgpEZ
         2+Pw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773965494; x=1774570294; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NsqY7865Oc2d7isEI7t69HCmXThZdea9XKdAmAr2SZw=;
        b=Uqxq/JkoMQ7LBIUIyvAVt4x3jjnriMG3I473rl4S1vVM/MWoUe/RghGzgH/3YtY8dD
         SJC+JiJnweX7hIeCA1zXIjc7GgRmrDrCDKQpZX8I88UrL3yxam0ENQRSSmBd/g5iFit8
         azVYXO2fBZkqN5qIf1CpJEGMTMg1Rxk0psm++uQ2zDBYJK5vmHwbBKW/g1PZebt/YAD7
         p7dIqxqnH0Q+ZHYWifuCtp2wUOnlMJ5/aX9nfsU17kKdCuolUVI2OcaupMTR21/rQVAn
         kgWwHk7RQc2qPqaN27PczWMCrAJB/bRq3S3jLaVKM+BfIsGzAly0LEEyRNUfe9HH2XAo
         5tMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773965494; x=1774570294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NsqY7865Oc2d7isEI7t69HCmXThZdea9XKdAmAr2SZw=;
        b=RWSA1ua10N1N+NEXJoquQ7AeCq1fGbxKIqxqld41eWI9GTEPWvRsrHixhgtCbic6sC
         O63IT8aT9J4ZhWDUS/fgErCIEkhZEk4Dm5IDu05ZGiYeV5tSw1Ni3nbb3mIoiu+HCh2f
         SYPM5rQ4lCUxsMi3GAjp+NnPFEXDymppaR5lquyeOqgl6mJT+K40gEMFSXCeYGjmRyYE
         eZx1yuLTbm9T9rxLvEu9reqGZTuB/unHp4ahWrjnG/JCy8c/SJg6XXrdkVlvYtS9mC8P
         mwajhpbfADIw+d+e75nSZizqcNGI94E/JOPu/KO71cIKN/29deUXW/2GlcDNn6t4i1wp
         E17Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYINAmpiZXPmcTdER6ne8FVw8uBhpA6280g0qY4aiS+rOLSp8Al3M7/pBlKeWYn8oF89k=@lists.linux.dev
X-Gm-Message-State: AOJu0YxxNtQmuIJO61sjd+WeXgdBbpxECEzsXY/w98GWA0a1FxW7p7bG
	5a4bHZQ0OoXcOsMUHjxn0NosZxcM1zS30pAyOiocsgcMKlIXU5IfUMjYSWimWIsP70Ftud1GBPb
	0PxKX+QNsaMS0iUbceegqiLUBjUYY4p4=
X-Gm-Gg: ATEYQzw5oaVsLlzCT8H+FUhq/XgaNwXl75QV2iRKxYPKA0Smfr1YjBzdqW6iT9tbtwZ
	odRvv1VPSNBiFvD2LnYVSpmfrKzKxtGlfqoeEDI2SqClNw98vSP7FESl6MFDJhyMJ4QkI/8/Td8
	TKoGOmphO50fYOBcG2NuxLKM6wFipN2jErqtG4m2UROwCKAQSA1GMlsbbWLOpMaoKXzwBay3NZ5
	km8EboCsgH+kGKgbnPMKhPPdMDD4NahhZF2QRDllDQdP0/L1FuJwztIZrF2aTFbezXcOblq/bPY
	x+6CzzedqpD2mUUKxkC+8f/ReGmj2Fvl++BADPJrdHJrhrpPz5Yxqc3J9VMv2j3ksYfq37/lvXR
	sV7Uo+0y1xLncEA/8
X-Received: by 2002:a17:907:82a5:b0:b98:21eb:e362 with SMTP id
 a640c23a62f3a-b982f25b778mr71309566b.24.1773965493513; Thu, 19 Mar 2026
 17:11:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260306044536.149204-1-rosenp@gmail.com> <20260319220901.GD950375@killaraus.ideasonboard.com>
In-Reply-To: <20260319220901.GD950375@killaraus.ideasonboard.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 19 Mar 2026 17:11:22 -0700
X-Gm-Features: AaiRm52ILjwYSbA2_rf4fpvc5tasK399kECRpWwjEnLOwZZm6-7yacGmgm9khGg
Message-ID: <CAKxU2N856yYXURRf3td-_RCpe9hyX=zAy3qtD3ki23RjgO+a4Q@mail.gmail.com>
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

On Thu, Mar 19, 2026 at 3:09=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Mar 05, 2026 at 08:45:36PM -0800, Rosen Penev wrote:
> > Use a flexible arraay member to combine allocations.
> >
> > It looks like pipes never gets freed anywhere. Meaning this effectively
> > fixes a memory leak.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 11 ++++-------
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h |  3 ++-
> >  2 files changed, 6 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/driv=
ers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > index 16392420903a..657ffecc4d7e 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > @@ -459,25 +459,21 @@ static const struct dev_pm_ops mxc_isi_pm_ops =3D=
 {
> >
> >  static int mxc_isi_probe(struct platform_device *pdev)
> >  {
> > +     const struct mxc_isi_plat_data *pdata;
> >       struct device *dev =3D &pdev->dev;
> >       struct mxc_isi_dev *isi;
> >       unsigned int dma_size;
> >       unsigned int i;
> >       int ret =3D 0;
> >
> > -     isi =3D devm_kzalloc(dev, sizeof(*isi), GFP_KERNEL);
> > +     pdata =3D of_device_get_match_data(dev);
> > +     isi =3D devm_kzalloc(dev, struct_size(isi, pipes, pdata->num_chan=
nels), GFP_KERNEL);
> >       if (!isi)
> >               return -ENOMEM;
> >
> >       isi->dev =3D dev;
> >       platform_set_drvdata(pdev, isi);
> >
> > -     isi->pdata =3D of_device_get_match_data(dev);
>
> I'd keep
>
>         isi->pdata =3D pdata;
>
> here and not below.
Sure
>
> > -
> > -     isi->pipes =3D kzalloc_objs(isi->pipes[0], isi->pdata->num_channe=
ls);
>
> Wouldn't it be simpler to just replace this with devm_kcalloc() ?
That would only make sense if pipes remained a pointer. A flex array
member allows combining allocations since it doesn't take up extra
space.

Technically kzalloc_flex is simpler but I assume a devm version of
that will be handled in another treewide commit.
>
>         isi->pipes =3D devm_kcalloc(dev, isi->pdata->num_channels,
>                                   sizeof(isi->pipes[0]), GFP_KERNEL);
>
> No other change would be needed.
With a flex array member, that's a compile time error, which I use as
a hint to complete the conversion.
>
> > -     if (!isi->pipes)
> > -             return -ENOMEM;
> > -
> >       isi->num_clks =3D devm_clk_bulk_get_all(dev, &isi->clks);
> >       if (isi->num_clks < 0)
> >               return dev_err_probe(dev, isi->num_clks, "Failed to get c=
locks\n");
> > @@ -487,6 +483,7 @@ static int mxc_isi_probe(struct platform_device *pd=
ev)
> >               return dev_err_probe(dev, PTR_ERR(isi->regs),
> >                                    "Failed to get ISI register map\n");
> >
> > +     isi->pdata =3D pdata;
> >       if (isi->pdata->gasket_ops) {
> >               isi->gasket =3D syscon_regmap_lookup_by_phandle(dev->of_n=
ode,
> >                                                             "fsl,blk-ct=
rl");
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/driv=
ers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > index 3cbd35305af0..99532efa4e41 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > @@ -286,7 +286,6 @@ struct mxc_isi_dev {
> >       struct regmap                   *gasket;
> >
> >       struct mxc_isi_crossbar         crossbar;
> > -     struct mxc_isi_pipe             *pipes;
> >       struct mxc_isi_m2m              m2m;
> >
> >       struct media_device             media_dev;
> > @@ -294,6 +293,8 @@ struct mxc_isi_dev {
> >       struct v4l2_async_notifier      notifier;
> >
> >       struct dentry                   *debugfs_root;
> > +
> > +     struct mxc_isi_pipe             pipes[];
> >  };
> >
> >  extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;
>
> --
> Regards,
>
> Laurent Pinchart
