Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A04125B9
	for <imx@lists.linux.dev>; Tue,  1 Jul 2025 02:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751336202; cv=none; b=Ppx0QoW/J6OGN5vVm+cGaOi63tIgJ+7bPmzrEzSoLTOdwycbDH9MuJilcaL7NKu3GY3DmMQLXxL3yt/Jyqy6d7YbBHzAiEiGRCG905+nE8ZTQYu7TrzfY6GtyJkAmbmWzR2hKCK3Pv4WR2VSDcPA1sK8CT8Q4Gm/dbsRvF2D/JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751336202; c=relaxed/simple;
	bh=MvuzKwXxEW1WnDLXw1tBlLAnpF1umLI+J5XMI9Y+QYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jIoF+FXvWPGMxjHsm835kOaWQiWhtRvTNfmUnZjkoIsBWAWKt6iz6ggQbss2SWnsHd5u6GnTe/o4DHF8PSNNz/+IxLqzH0Do8lbY79RXdYYMPS8cUg+r6NISAVKgloLei1MTBukPsU1nshQTSuHx12J2q/2TpwU9rss8zYWZVK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=koQvtm+6; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="koQvtm+6"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3de2b02c69eso15694145ab.1
        for <imx@lists.linux.dev>; Mon, 30 Jun 2025 19:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751336200; x=1751941000; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnucjgvU6q5mZapD58W0SglTLoe8Vn8lYPtV2HgiZ2Q=;
        b=koQvtm+6J2ucAYaxj5LuvUC5YJ6gA3SyojmxJg2WxePW9icLYzxHnMcxvQS2vRuwJV
         vhA7sob2xQERSXRNCIQuen6H2Lp6UE8/CUkJMEx7kzilOAhXfrCofSmEEwrU99vZf3Wu
         xxYJjPqJJNEIH5cPRnPWIJS9ThFzGao53KmcTxKTIgRsDG33ZK511/btPyKReKjYtS20
         hn/qHr96pXV9TX7pAoHNmvsqzrxpQ+vcBIKHXcu11cNQ41X9m6bfSF3a63qCYn5OIKs2
         +l6nNa3devcgiEUWyZ/Shl0yRzxVi+SW/xiEVCtfijGDIBKbqYjZ1DxTPwdKSCw4radx
         3Law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751336200; x=1751941000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZnucjgvU6q5mZapD58W0SglTLoe8Vn8lYPtV2HgiZ2Q=;
        b=RVFP+H6fTxRrZ9ziKDsbTizMfPK8hHMD5Cpw7JWqVYJ0+W3Ll8RHO+OrMMBZbodvMY
         W9DZOf7L8/xR17k+QK3SY8EJAMH4fX2a919eTrecyC0go9o+UmCvAj8IW7XJJhL6/iwK
         N5ow6oxlmz4ScxLNCq8WRD2J+mnTgUbtsJRXsnMApngi1EXsVy42wuvxxHIPI10UcFJX
         oCw3aLCHo4hGUFWjhOqTV09ah9Fryc9kohUGUSllNCZFGpdCEV2CfTXmXRcv2JJljLye
         ZPlTLw11OVNDLBO+Xk+RbvL0WvXi2gcH/sq1y58Ipfg/54KGzeJ5LkpaNk31168jzXkC
         nTow==
X-Forwarded-Encrypted: i=1; AJvYcCXPsjsTDwnq3MKe8Mqbs+GPCKepYTblvjsNvJTEvY/1XnlswGP323ZWUNZ4QYpN7DHqdtQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxOsXdbGnUP2ki0WI7597+BUIg2A2ulAPTNwHvURmo+wDd6T5vk
	7qQ9e2LubV7cPtmnT38vYx5Dh+bEp67kE19Ul749zgekmCYq+ZzI5ctrsFhBWx/S0lDPahF9fy/
	euKeghDnnOISOd+VnpDznktuP4GK94f9imbif
X-Gm-Gg: ASbGncthhdSWyisP2TKbt6qWQjLc4/0iNg8AySXC5U7P8g/hqvb9itgKMFAJfErv5r5
	4rz6k3/e709oTejRDp2asgoVr6cW82hY2aDyBWaaoOC2DVwEw7o+keM4K3aj3qvBXMpLBZYu9dy
	3S4cx37Z6f05DygC2O8aIhJGBupzMrNiL38DNBP4zIkek=
X-Google-Smtp-Source: AGHT+IEoGNaUupWOV8xq/VF/UmZ75W1Egh/x7LX2TjiyozewvOd7dKD/hFx0PT4Ozuh1uRBEElDY6DKi0WQ9HbWmEgA=
X-Received: by 2002:a05:6e02:1527:b0:3df:4024:9402 with SMTP id
 e9e14a558f8ab-3df4ab78488mr169121505ab.8.1751336200129; Mon, 30 Jun 2025
 19:16:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-2-shengjiu.wang@nxp.com> <aFltBpXuEXVZ5gKn@p14s>
 <CAA+D8AP47xyftzPZki8MXEeWEfbocug6e134uaJgFH+tx7mH2Q@mail.gmail.com>
 <CANLsYkz2JMMMhBAXjt9YSzU4n-0Ld6EvJHC=7Ospsefoxc6BGA@mail.gmail.com>
 <CAA+D8AM47P7xw2Ppgcr9d=DB2eSkQg6uQ_F22Te_=HFuMCNXxw@mail.gmail.com> <aGLAEvhyjrCbZoIf@p14s>
In-Reply-To: <aGLAEvhyjrCbZoIf@p14s>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 1 Jul 2025 10:16:21 +0800
X-Gm-Features: Ac12FXy80mkzgbzMVX8fGVYqHr03n47hheZnuVvSEZcgI5tUYYlWrg949W4MhsU
Message-ID: <CAA+D8ANLOxnfj9cWhbTUWHuFGt5Qb-upTmKfCyNxEb1ChJKjbg@mail.gmail.com>
Subject: Re: [PATCH 1/2] remoteproc: imx_dsp_rproc: Add support of recovery process
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 12:49=E2=80=AFAM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Thu, Jun 26, 2025 at 09:32:06AM +0800, Shengjiu Wang wrote:
> > On Wed, Jun 25, 2025 at 10:39=E2=80=AFPM Mathieu Poirier
> > <mathieu.poirier@linaro.org> wrote:
> > >
> > > On Tue, 24 Jun 2025 at 21:25, Shengjiu Wang <shengjiu.wang@gmail.com>=
 wrote:
> > > >
> > > > On Mon, Jun 23, 2025 at 11:11=E2=80=AFPM Mathieu Poirier
> > > > <mathieu.poirier@linaro.org> wrote:
> > > > >
> > > > > Good day,
> > > > >
> > > > > On Wed, Jun 18, 2025 at 02:26:43PM +0800, Shengjiu Wang wrote:
> > > > > > when recovery is triggered, rproc_stop() is called first then
> > > > > > rproc_start(), but there is no rproc_unprepare_device() and
> > > > > > rproc_prepare_device() in the flow.
> > > > > >
> > > > > > So power enablement needs to be moved from prepare callback to =
start
> > > > > > callback, power disablement needs to be moved from unprepare ca=
llback
> > > > > > to stop callback, loading elf function also needs to be moved t=
o start
> > > > > > callback, the load callback only store the firmware handler.
> > > > > >
> > > > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > > > ---
> > > > > >  drivers/remoteproc/imx_dsp_rproc.c | 58 ++++++++++++++++++----=
--------
> > > > > >  1 file changed, 36 insertions(+), 22 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remot=
eproc/imx_dsp_rproc.c
> > > > > > index 5ee622bf5352..9b9cddb224b0 100644
> > > > > > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > > > > > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > > > > > @@ -122,6 +122,7 @@ enum imx_dsp_rp_mbox_messages {
> > > > > >   * @ipc_handle: System Control Unit ipc handle
> > > > > >   * @rproc_work: work for processing virtio interrupts
> > > > > >   * @pm_comp: completion primitive to sync for suspend response
> > > > > > + * @firmware: firmware handler
> > > > > >   * @flags: control flags
> > > > > >   */
> > > > > >  struct imx_dsp_rproc {
> > > > > > @@ -139,6 +140,7 @@ struct imx_dsp_rproc {
> > > > > >       struct imx_sc_ipc                       *ipc_handle;
> > > > > >       struct work_struct                      rproc_work;
> > > > > >       struct completion                       pm_comp;
> > > > > > +     const struct firmware                   *firmware;
> > > > > >       u32                                     flags;
> > > > > >  };
> > > > > >
> > > > > > @@ -211,6 +213,7 @@ static const struct imx_rproc_att imx_dsp_r=
proc_att_imx8ulp[] =3D {
> > > > > >
> > > > > >  /* Initialize the mailboxes between cores, if exists */
> > > > > >  static int (*imx_dsp_rproc_mbox_init)(struct imx_dsp_rproc *pr=
iv);
> > > > > > +static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc=
, const struct firmware *fw);
> > > > > >
> > > > > >  /* Reset function for DSP on i.MX8MP */
> > > > > >  static int imx8mp_dsp_reset(struct imx_dsp_rproc *priv)
> > > > > > @@ -402,8 +405,24 @@ static int imx_dsp_rproc_start(struct rpro=
c *rproc)
> > > > > >       const struct imx_dsp_rproc_dcfg *dsp_dcfg =3D priv->dsp_d=
cfg;
> > > > > >       const struct imx_rproc_dcfg *dcfg =3D dsp_dcfg->dcfg;
> > > > > >       struct device *dev =3D rproc->dev.parent;
> > > > > > +     struct rproc_mem_entry *carveout;
> > > > > >       int ret;
> > > > > >
> > > > > > +     pm_runtime_get_sync(dev);
> > > > > > +
> > > > > > +     /*
> > > > > > +      * Clear buffers after pm rumtime for internal ocram is n=
ot
> > > > > > +      * accessible if power and clock are not enabled.
> > > > > > +      */
> > > > > > +     list_for_each_entry(carveout, &rproc->carveouts, node) {
> > > > > > +             if (carveout->va)
> > > > > > +                     memset(carveout->va, 0, carveout->len);
> > > > > > +     }
> > > > > > +
> > > > > > +     ret =3D imx_dsp_rproc_elf_load_segments(rproc, priv->firm=
ware);
> > > > > > +     if (ret)
> > > > > > +             return ret;
> > > > > > +
> > > > > >       switch (dcfg->method) {
> > > > > >       case IMX_RPROC_MMIO:
> > > > > >               ret =3D regmap_update_bits(priv->regmap,
> > > > > > @@ -446,6 +465,7 @@ static int imx_dsp_rproc_stop(struct rproc =
*rproc)
> > > > > >
> > > > > >       if (rproc->state =3D=3D RPROC_CRASHED) {
> > > > > >               priv->flags &=3D ~REMOTE_IS_READY;
> > > > > > +             pm_runtime_put_sync(dev);
> > > > >
> > > > > From this patch I understand that for a recovery to be successful=
, the
> > > > > remote processor _has_ to go through a hard reset.  But here the =
PM runtime API
> > > > > is used, meaning the remote processor won't be switched off if an=
other device in
> > > > > the same power domain still neeeds power.  If that is the case, t=
he solution in
> > > > > tihs patch won't work.
> > > >
> > > > Thanks for reviewing.
> > > > With the case you mentioned, there is software reset to make the
> > > > recovery process work.
> > >
> > >
> > > Are you talking about a manual software reset of some other mechanism=
?
> > >
> > > If manual software reset, the recovery may or may not work and we
> > > simply don't know when that might be.  If it's another mechanism, the=
n
> > > that mechanism should be used in all cases.  Either way, I don't see
> > > how we can move forward with this patch.
> >
> > Not manual software reset,  in this driver we registered .reset() funct=
ion.
> > it has been called at imx_dsp_runtime_resume(),  I paste the function b=
elow.
> >
> > And I have tested the case you mentioned, the recovery works.
> >
> > /* pm runtime functions */
> > static int imx_dsp_runtime_resume(struct device *dev)
> > {
> >         struct rproc *rproc =3D dev_get_drvdata(dev);
> >         struct imx_dsp_rproc *priv =3D rproc->priv;
> >         const struct imx_dsp_rproc_dcfg *dsp_dcfg =3D priv->dsp_dcfg;
> >         int ret;
> >
> >         /*
> >          * There is power domain attached with mailbox, if setup mailbo=
x
> >          * in probe(), then the power of mailbox is always enabled,
> >          * the power can't be saved.
> >          * So move setup of mailbox to runtime resume.
> >          */
> >         ret =3D imx_dsp_rproc_mbox_init(priv);
> >         if (ret) {
> >                 dev_err(dev, "failed on imx_dsp_rproc_mbox_init\n");
> >                 return ret;
> >         }
> >
> >         ret =3D clk_bulk_prepare_enable(DSP_RPROC_CLK_MAX, priv->clks);
> >         if (ret) {
> >                 dev_err(dev, "failed on clk_bulk_prepare_enable\n");
> >                 return ret;
> >         }
> >
> >         /* Reset DSP if needed */
> >         if (dsp_dcfg->reset)
> >                 dsp_dcfg->reset(priv);
> >
> >         return 0;
> > }
> >
>
> Thanks for the clarification.  I would have been nice to have that kind o=
f
> explanation (not the copy paste of the imx_dsp_runtime_resume() function)=
 in the
> changelog.

Ok, will add it.

>
> That said, that is just one aspect of the things I find bizarre with this
> patchset - see below.
>
> > >
> > > >
> > > >
> > > > best regards
> > > > Shengjiu Wang
> > > >
> > > > >
> > > > > Thanks,
> > > > > Mathieu
> > > > >
> > > > > >               return 0;
> > > > > >       }
> > > > > >
> > > > > > @@ -472,6 +492,8 @@ static int imx_dsp_rproc_stop(struct rproc =
*rproc)
> > > > > >       else
> > > > > >               priv->flags &=3D ~REMOTE_IS_READY;
> > > > > >
> > > > > > +     pm_runtime_put_sync(dev);
> > > > > > +
> > > > > >       return ret;
> > > > > >  }
> > > > > >
> > > > > > @@ -774,7 +796,6 @@ static int imx_dsp_rproc_prepare(struct rpr=
oc *rproc)
> > > > > >  {
> > > > > >       struct imx_dsp_rproc *priv =3D rproc->priv;
> > > > > >       struct device *dev =3D rproc->dev.parent;
> > > > > > -     struct rproc_mem_entry *carveout;
> > > > > >       int ret;
> > > > > >
> > > > > >       ret =3D imx_dsp_rproc_add_carveout(priv);
> > > > > > @@ -783,25 +804,6 @@ static int imx_dsp_rproc_prepare(struct rp=
roc *rproc)
> > > > > >               return ret;
> > > > > >       }
> > > > > >
> > > > > > -     pm_runtime_get_sync(dev);
> > > > > > -
> > > > > > -     /*
> > > > > > -      * Clear buffers after pm rumtime for internal ocram is n=
ot
> > > > > > -      * accessible if power and clock are not enabled.
> > > > > > -      */
> > > > > > -     list_for_each_entry(carveout, &rproc->carveouts, node) {
> > > > > > -             if (carveout->va)
> > > > > > -                     memset(carveout->va, 0, carveout->len);
> > > > > > -     }
> > > > > > -
> > > > > > -     return  0;
> > > > > > -}
> > > > > > -
> > > > > > -/* Unprepare function for rproc_ops */
> > > > > > -static int imx_dsp_rproc_unprepare(struct rproc *rproc)
> > > > > > -{
> > > > > > -     pm_runtime_put_sync(rproc->dev.parent);
> > > > > > -
> > > > > >       return  0;
> > > > > >  }
> > > > > >
> > > > > > @@ -1022,13 +1024,25 @@ static int imx_dsp_rproc_parse_fw(struc=
t rproc *rproc, const struct firmware *fw
> > > > > >       return 0;
> > > > > >  }
> > > > > >
> > > > > > +static int imx_dsp_rproc_load(struct rproc *rproc, const struc=
t firmware *fw)
> > > > > > +{
> > > > > > +     struct imx_dsp_rproc *priv =3D rproc->priv;
> > > > > > +
> > > > > > +     /*
> > > > > > +      * Just save the fw handler, the firmware loading will be=
 after
> > > > > > +      * power enabled
> > > > > > +      */
> > > > > > +     priv->firmware =3D fw;
> > > > > > +
>
> Why is a new firwmare variable needed?  Why can't you just use rproc->fir=
mware?

 The "firmware" in "rproc->firmware" is "const char *firmware;"
* @firmware: name of firmware file to be loaded

But "const struct firmware *fw" is the result after request_firmware()
ret =3D request_firmware(&firmware_p, rproc->firmware, dev);
"firmware_p" is the "fw".

As the remoteproc_core.c has called request_firmware(), so we don't need to=
 call
the request_firmware() again.  so use the new "const struct firmware
*firmware;" for
saving the "fw".

Best regards
Shengjiu Wang
>
> > > > > > +     return 0;
> > > > > > +}
> > > > > > +
> > > > > >  static const struct rproc_ops imx_dsp_rproc_ops =3D {
> > > > > >       .prepare        =3D imx_dsp_rproc_prepare,
> > > > > > -     .unprepare      =3D imx_dsp_rproc_unprepare,
> > > > > >       .start          =3D imx_dsp_rproc_start,
> > > > > >       .stop           =3D imx_dsp_rproc_stop,
> > > > > >       .kick           =3D imx_dsp_rproc_kick,
> > > > > > -     .load           =3D imx_dsp_rproc_elf_load_segments,
> > > > > > +     .load           =3D imx_dsp_rproc_load,
> > > > > >       .parse_fw       =3D imx_dsp_rproc_parse_fw,
> > > > > >       .handle_rsc     =3D imx_dsp_rproc_handle_rsc,
> > > > > >       .find_loaded_rsc_table =3D rproc_elf_find_loaded_rsc_tabl=
e,
> > > > > > --
> > > > > > 2.34.1
> > > > > >
> > > > >
