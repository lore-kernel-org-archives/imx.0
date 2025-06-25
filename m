Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174D426A088
	for <imx@lists.linux.dev>; Wed, 25 Jun 2025 14:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750862386; cv=none; b=KLISpZOAqvEDMs/J2qqZdJ/C+cHc27zRMP/K1XQDYTDJM/5g9c7RNW/W5TKgSq6+oWf/8WPZDnmpvYysmo9hCJ46vvdSXR/mhYs+ZQHrbnA3y7tjYrje/8DoHW04XcNYH0bL43vcDX6PO/OCh9q7W5w51E4f47wUbMke8gQiTS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750862386; c=relaxed/simple;
	bh=6s8tdeXIh3dpEBSXcHHnBmYJKc+NPpS/AdGrW0S1RaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KDJJGAwGZSsLbfouOqCicOi1/wj13fM+udx234/iVGxDFJlG4SZj6CQD1BsyUwhbfM8Fd2jnC7e4NVyN+VvBxlyATYWcFZKclkZcxlOvzytlVYCIvA/NysFLYydBMrxhiCQWxtc3wLUKbxxaQ7jgRNAoBW3HP/YFwC92dT3PHWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vQV4aQDN; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vQV4aQDN"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60c4f796446so1163185a12.1
        for <imx@lists.linux.dev>; Wed, 25 Jun 2025 07:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750862381; x=1751467181; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3nfLaDrIv4HHM2VYxZ0QSILSPZOjC+nFi2raIsra4eo=;
        b=vQV4aQDNRecYmfC1GwxVLLXiJJCHroGDivbcGVibHBNkmtHe/6qnVttwCGn1qSYgL9
         JtnieK/dCgbCM1Rj+NTs61GI94gwGcPlDZ1oBo6NiIF62RnfrSFwWW20aXQyD3Ny24zQ
         t9xnXSl/YIp0fHfjt9vmBQPWsXFO6KbRPrl47IXpO1DWH55y3jtuNYWB8KtfZaXqvGmv
         aYE8T9ePgRXKh7tXUeDbFlXhvabtko7UoGami5AwPfsF4LTpH2uwyKHEidz9t+W/QudI
         Tgoj2KoyN75xBOlpmmCwY3DlQGT68cR51BIrEWBaMhtP+ybIXdHu2Wy3hb2qx6XxlHTh
         D4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750862381; x=1751467181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3nfLaDrIv4HHM2VYxZ0QSILSPZOjC+nFi2raIsra4eo=;
        b=h/ajBOwbQRRSCrO1FLH0SJPXQK0jGh7BT1pvcKMIcs/L1YChootouUvq0TPs1uNULR
         U3Q4JPBjQRiTc4VC0Qfvf+Sbdqy3/aEySe5uUGIRWZ6bwwLATMDw533Q1lZG5tzL8DvR
         VOCXSn4b3BjbmfRz5BAg98TlmpgZB59rX3Ge13qgYyLYzOV7itFsXTwpvxoaNEqJSTmL
         /UZDKQOfevSsstcoldL6Ed5XYlmcjSWD7yzRLvoh9CUO5eBS5mh3EDPlXYqGd7vR6oZ7
         yHvwYwGdHfrVchuwunbaW8gYILEpkojtrvoLxIX3/QiTTxKZa6yW76zcMiw61cXe7hHj
         KRyg==
X-Forwarded-Encrypted: i=1; AJvYcCWVlKmYR1k1Pd8unTipyAILXqAnA8HBe/0QvOWMCi9JHdzX3iuysukiWjnhmKLpJyhgaBE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwaFwzB2UhYDY8PIgx+hS+wXSBlLZK+e1H+Jm2nGRwNUHe+e0uA
	iC5NUHOmG7D1Z2MT0ShM8KzdlXVEqIEpuuVs4qT4rK6QSi1OVUsjmt9mV9lbnFov+7/8IUKzV29
	CI2ye6mWdK7NkYutEZwdUzadmKmnRcnatVv2ZHuv/Ow==
X-Gm-Gg: ASbGncuRTJYhFz7LUArpK3cgo3KD3juDlZcbwzxgPglwY1D6N5dFdDXG6vUICm5u6dX
	uijStjzB+s6CaAf5LL9G95JpUTIkqAM6vxRqMFf8EZGIT9LLuZnQ/tT0A721UvSrV/1waVRMVmf
	IiaXTM6Ai3Vaos/nk8RmGuxrUVvWkR65xiJ8can3xtc3gC8xEuCQppTgyb/EIahPLRAV+SiPJKr
	ziaiw==
X-Google-Smtp-Source: AGHT+IE3R4XbiDX3SYA4jSl4fNvcu/S1vq69n8Iz6TYDCXbK45875fCSUjjDmvhS6/h6ekIgErdfshIIh5wv3ORIDiQ=
X-Received: by 2002:a17:907:6d0b:b0:ae0:c539:b89a with SMTP id
 a640c23a62f3a-ae0c539bd16mr311563366b.19.1750862381102; Wed, 25 Jun 2025
 07:39:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-2-shengjiu.wang@nxp.com> <aFltBpXuEXVZ5gKn@p14s> <CAA+D8AP47xyftzPZki8MXEeWEfbocug6e134uaJgFH+tx7mH2Q@mail.gmail.com>
In-Reply-To: <CAA+D8AP47xyftzPZki8MXEeWEfbocug6e134uaJgFH+tx7mH2Q@mail.gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 25 Jun 2025 08:39:30 -0600
X-Gm-Features: Ac12FXxfnFqETZmTye9WOASdoWQr8KdaOBSc0QxWt1fCM_5NlgRJzqlsQfx7gyU
Message-ID: <CANLsYkz2JMMMhBAXjt9YSzU4n-0Ld6EvJHC=7Ospsefoxc6BGA@mail.gmail.com>
Subject: Re: [PATCH 1/2] remoteproc: imx_dsp_rproc: Add support of recovery process
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 24 Jun 2025 at 21:25, Shengjiu Wang <shengjiu.wang@gmail.com> wrote=
:
>
> On Mon, Jun 23, 2025 at 11:11=E2=80=AFPM Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > Good day,
> >
> > On Wed, Jun 18, 2025 at 02:26:43PM +0800, Shengjiu Wang wrote:
> > > when recovery is triggered, rproc_stop() is called first then
> > > rproc_start(), but there is no rproc_unprepare_device() and
> > > rproc_prepare_device() in the flow.
> > >
> > > So power enablement needs to be moved from prepare callback to start
> > > callback, power disablement needs to be moved from unprepare callback
> > > to stop callback, loading elf function also needs to be moved to star=
t
> > > callback, the load callback only store the firmware handler.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  drivers/remoteproc/imx_dsp_rproc.c | 58 ++++++++++++++++++----------=
--
> > >  1 file changed, 36 insertions(+), 22 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/=
imx_dsp_rproc.c
> > > index 5ee622bf5352..9b9cddb224b0 100644
> > > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > > @@ -122,6 +122,7 @@ enum imx_dsp_rp_mbox_messages {
> > >   * @ipc_handle: System Control Unit ipc handle
> > >   * @rproc_work: work for processing virtio interrupts
> > >   * @pm_comp: completion primitive to sync for suspend response
> > > + * @firmware: firmware handler
> > >   * @flags: control flags
> > >   */
> > >  struct imx_dsp_rproc {
> > > @@ -139,6 +140,7 @@ struct imx_dsp_rproc {
> > >       struct imx_sc_ipc                       *ipc_handle;
> > >       struct work_struct                      rproc_work;
> > >       struct completion                       pm_comp;
> > > +     const struct firmware                   *firmware;
> > >       u32                                     flags;
> > >  };
> > >
> > > @@ -211,6 +213,7 @@ static const struct imx_rproc_att imx_dsp_rproc_a=
tt_imx8ulp[] =3D {
> > >
> > >  /* Initialize the mailboxes between cores, if exists */
> > >  static int (*imx_dsp_rproc_mbox_init)(struct imx_dsp_rproc *priv);
> > > +static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc, cons=
t struct firmware *fw);
> > >
> > >  /* Reset function for DSP on i.MX8MP */
> > >  static int imx8mp_dsp_reset(struct imx_dsp_rproc *priv)
> > > @@ -402,8 +405,24 @@ static int imx_dsp_rproc_start(struct rproc *rpr=
oc)
> > >       const struct imx_dsp_rproc_dcfg *dsp_dcfg =3D priv->dsp_dcfg;
> > >       const struct imx_rproc_dcfg *dcfg =3D dsp_dcfg->dcfg;
> > >       struct device *dev =3D rproc->dev.parent;
> > > +     struct rproc_mem_entry *carveout;
> > >       int ret;
> > >
> > > +     pm_runtime_get_sync(dev);
> > > +
> > > +     /*
> > > +      * Clear buffers after pm rumtime for internal ocram is not
> > > +      * accessible if power and clock are not enabled.
> > > +      */
> > > +     list_for_each_entry(carveout, &rproc->carveouts, node) {
> > > +             if (carveout->va)
> > > +                     memset(carveout->va, 0, carveout->len);
> > > +     }
> > > +
> > > +     ret =3D imx_dsp_rproc_elf_load_segments(rproc, priv->firmware);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > >       switch (dcfg->method) {
> > >       case IMX_RPROC_MMIO:
> > >               ret =3D regmap_update_bits(priv->regmap,
> > > @@ -446,6 +465,7 @@ static int imx_dsp_rproc_stop(struct rproc *rproc=
)
> > >
> > >       if (rproc->state =3D=3D RPROC_CRASHED) {
> > >               priv->flags &=3D ~REMOTE_IS_READY;
> > > +             pm_runtime_put_sync(dev);
> >
> > From this patch I understand that for a recovery to be successful, the
> > remote processor _has_ to go through a hard reset.  But here the PM run=
time API
> > is used, meaning the remote processor won't be switched off if another =
device in
> > the same power domain still neeeds power.  If that is the case, the sol=
ution in
> > tihs patch won't work.
>
> Thanks for reviewing.
> With the case you mentioned, there is software reset to make the
> recovery process work.


Are you talking about a manual software reset of some other mechanism?

If manual software reset, the recovery may or may not work and we
simply don't know when that might be.  If it's another mechanism, then
that mechanism should be used in all cases.  Either way, I don't see
how we can move forward with this patch.

>
>
> best regards
> Shengjiu Wang
>
> >
> > Thanks,
> > Mathieu
> >
> > >               return 0;
> > >       }
> > >
> > > @@ -472,6 +492,8 @@ static int imx_dsp_rproc_stop(struct rproc *rproc=
)
> > >       else
> > >               priv->flags &=3D ~REMOTE_IS_READY;
> > >
> > > +     pm_runtime_put_sync(dev);
> > > +
> > >       return ret;
> > >  }
> > >
> > > @@ -774,7 +796,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rp=
roc)
> > >  {
> > >       struct imx_dsp_rproc *priv =3D rproc->priv;
> > >       struct device *dev =3D rproc->dev.parent;
> > > -     struct rproc_mem_entry *carveout;
> > >       int ret;
> > >
> > >       ret =3D imx_dsp_rproc_add_carveout(priv);
> > > @@ -783,25 +804,6 @@ static int imx_dsp_rproc_prepare(struct rproc *r=
proc)
> > >               return ret;
> > >       }
> > >
> > > -     pm_runtime_get_sync(dev);
> > > -
> > > -     /*
> > > -      * Clear buffers after pm rumtime for internal ocram is not
> > > -      * accessible if power and clock are not enabled.
> > > -      */
> > > -     list_for_each_entry(carveout, &rproc->carveouts, node) {
> > > -             if (carveout->va)
> > > -                     memset(carveout->va, 0, carveout->len);
> > > -     }
> > > -
> > > -     return  0;
> > > -}
> > > -
> > > -/* Unprepare function for rproc_ops */
> > > -static int imx_dsp_rproc_unprepare(struct rproc *rproc)
> > > -{
> > > -     pm_runtime_put_sync(rproc->dev.parent);
> > > -
> > >       return  0;
> > >  }
> > >
> > > @@ -1022,13 +1024,25 @@ static int imx_dsp_rproc_parse_fw(struct rpro=
c *rproc, const struct firmware *fw
> > >       return 0;
> > >  }
> > >
> > > +static int imx_dsp_rproc_load(struct rproc *rproc, const struct firm=
ware *fw)
> > > +{
> > > +     struct imx_dsp_rproc *priv =3D rproc->priv;
> > > +
> > > +     /*
> > > +      * Just save the fw handler, the firmware loading will be after
> > > +      * power enabled
> > > +      */
> > > +     priv->firmware =3D fw;
> > > +
> > > +     return 0;
> > > +}
> > > +
> > >  static const struct rproc_ops imx_dsp_rproc_ops =3D {
> > >       .prepare        =3D imx_dsp_rproc_prepare,
> > > -     .unprepare      =3D imx_dsp_rproc_unprepare,
> > >       .start          =3D imx_dsp_rproc_start,
> > >       .stop           =3D imx_dsp_rproc_stop,
> > >       .kick           =3D imx_dsp_rproc_kick,
> > > -     .load           =3D imx_dsp_rproc_elf_load_segments,
> > > +     .load           =3D imx_dsp_rproc_load,
> > >       .parse_fw       =3D imx_dsp_rproc_parse_fw,
> > >       .handle_rsc     =3D imx_dsp_rproc_handle_rsc,
> > >       .find_loaded_rsc_table =3D rproc_elf_find_loaded_rsc_table,
> > > --
> > > 2.34.1
> > >
> >
