Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B71B3074A3
	for <imx@lists.linux.dev>; Wed, 25 Jun 2025 03:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750821943; cv=none; b=MOfAHKwVAcHPxcqelgU6maM8zkBIqh2zDQME+rBFTbT6BUkskZ6xM55De2Wyu3LeYgOwg2FWNGH+b96jYnzd7D3zP5TzW4mM7J6+wEwLo8nsKlbK8ESg3nvw5eiKddQDTWnrxreamj8+eA7c3XeMkTzc2fPW5vUhYUMxv+UAd0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750821943; c=relaxed/simple;
	bh=4NMFst5bZwlMKW8tHUP/911zQnFY6nUDVvYvEJtmNmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UoystGgPIAnpguSFS6IUzg7vdkGCN7PVBEg3/vClcySSlnQTSOjTZVeFx+mf/b17SM47147b3YFWI/gTr1T8/9dOtLZ/xUsclZFzBJa3k/uwLrTenpafhU8vdlv6gIVdBzq/0mpTOFzOKU74hL6MLo8D+p+XC5FnuUimo7KNR0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFSZmL+p; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFSZmL+p"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3df2dbe85d1so9027885ab.0
        for <imx@lists.linux.dev>; Tue, 24 Jun 2025 20:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750821941; x=1751426741; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5Idd7bAuzOnb9JUX43u5xXxkP4Sj/WJFUVcPFMjRpA=;
        b=VFSZmL+pi8jGzzzw2JrrYqbWbi/e5BDRK2sPIAwwJOMK99MjlikeqUoRrDiz3Nda2o
         HawlpVxmDKIG0bFm5nmJzRb8YTfEeT8OkW61Yn8B+IzRqfncN4jeWA5kvzT5CGSbdoha
         QxsRcb86a7hfAB7QZXD/n5/3H7wVC4/8Gz4R2ODXpewFCepeQvBp5r6AGtx+/b7qgrcL
         GhokCHN1YezctBqfwXdeSWXocU1QaMcjyjr22rddUjKED5bKmDWiaRnnXLUzU2/gFU7v
         M/xqo+yYmeB9xwhPiP1OoGMY7bD4ArruFSVjuOsZ2Wu3r/ZZzrsvDp4pVbyDPKvFU9zf
         AzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750821941; x=1751426741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P5Idd7bAuzOnb9JUX43u5xXxkP4Sj/WJFUVcPFMjRpA=;
        b=cU/DoSSDPKyTHo0nVg8vg1zL634IZmACeFWnCWBp3Xiet8zl8jXqbjY6OXWa7xupBF
         qC5RtGKVE2j8HaxW5vZPQqYwLMP79U7yyFcaHQ4ji9fMJSQ5lGxw9GtQu/edyE8fo0jw
         S5hXaZ1RB8EB50YcV46CpyXJuPZah0wzgUW3sW3cqMY/Cm7YpZcjHxuQdHC7O+O++Jb1
         iv9UOqtIEUU011ovQ8gaArJNBdsBixYD0j8k74CFk6LiQCn10QaK6xzLrylP/ejUYLm7
         kt4tO1dc5SDO6nxU9YgtJhj1o3GNotQYbvoQFe87D2FU4Gyb+WTY8hLKCJfB5nH51w4y
         7S9g==
X-Forwarded-Encrypted: i=1; AJvYcCW7duTzB3ix9jUgF77IjQz4KcDOGgPAUCn6PLV0rYyu08819UiPC0JR/s61rBblggsYbbw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+f7xabxcTS4DAa7hKidmZD3acozm7W+4KA7pOkZ75gr/8fZQl
	Dj/FYjvGDWxuJQks1wUrHX0GnWrS3304RXgmOeFQ5oc1P4VNr64OAG+5PBodLA7INyE9VyVzt79
	PplPH3eVwN34QdIOcM7vcGJ2tR87JF1lC4A==
X-Gm-Gg: ASbGncvbb9jbe4lqlEXCSb2kkKE48JCK3zEW3ScR4Pv0BQjWKHE66GXk7aUbx+alNZA
	dHDpA67lon2ciDXYDkoIkUZ/K03J+jld2tuQdz4Fxvt4EU7RijorWo7ZRFWrslO9j7jCR0n33TE
	FAu3oASJypns6wXSh8G59xPfvh6jXg6MJ7wtPzDNIyH1q3QXuoYe/YkQ==
X-Google-Smtp-Source: AGHT+IGTb/5LGPPf3L0DL//MOyob2CFyZfg/IHtK/wNWTQnMHIKm1ENWEeAPJPDEIqD049xw5eck28OJqJkG6TTW8sI=
X-Received: by 2002:a05:6e02:1c09:b0:3dc:8075:ccd3 with SMTP id
 e9e14a558f8ab-3df3294954dmr17771145ab.9.1750821941152; Tue, 24 Jun 2025
 20:25:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250618062644.3895785-1-shengjiu.wang@nxp.com>
 <20250618062644.3895785-2-shengjiu.wang@nxp.com> <aFltBpXuEXVZ5gKn@p14s>
In-Reply-To: <aFltBpXuEXVZ5gKn@p14s>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 25 Jun 2025 11:25:29 +0800
X-Gm-Features: Ac12FXzRQJouDdZDx5KrobO9xlf8zpg91IyZbOOnLAWOvOD5rocTnkVsx4AQ2xM
Message-ID: <CAA+D8AP47xyftzPZki8MXEeWEfbocug6e134uaJgFH+tx7mH2Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] remoteproc: imx_dsp_rproc: Add support of recovery process
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 11:11=E2=80=AFPM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> Good day,
>
> On Wed, Jun 18, 2025 at 02:26:43PM +0800, Shengjiu Wang wrote:
> > when recovery is triggered, rproc_stop() is called first then
> > rproc_start(), but there is no rproc_unprepare_device() and
> > rproc_prepare_device() in the flow.
> >
> > So power enablement needs to be moved from prepare callback to start
> > callback, power disablement needs to be moved from unprepare callback
> > to stop callback, loading elf function also needs to be moved to start
> > callback, the load callback only store the firmware handler.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  drivers/remoteproc/imx_dsp_rproc.c | 58 ++++++++++++++++++------------
> >  1 file changed, 36 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/im=
x_dsp_rproc.c
> > index 5ee622bf5352..9b9cddb224b0 100644
> > --- a/drivers/remoteproc/imx_dsp_rproc.c
> > +++ b/drivers/remoteproc/imx_dsp_rproc.c
> > @@ -122,6 +122,7 @@ enum imx_dsp_rp_mbox_messages {
> >   * @ipc_handle: System Control Unit ipc handle
> >   * @rproc_work: work for processing virtio interrupts
> >   * @pm_comp: completion primitive to sync for suspend response
> > + * @firmware: firmware handler
> >   * @flags: control flags
> >   */
> >  struct imx_dsp_rproc {
> > @@ -139,6 +140,7 @@ struct imx_dsp_rproc {
> >       struct imx_sc_ipc                       *ipc_handle;
> >       struct work_struct                      rproc_work;
> >       struct completion                       pm_comp;
> > +     const struct firmware                   *firmware;
> >       u32                                     flags;
> >  };
> >
> > @@ -211,6 +213,7 @@ static const struct imx_rproc_att imx_dsp_rproc_att=
_imx8ulp[] =3D {
> >
> >  /* Initialize the mailboxes between cores, if exists */
> >  static int (*imx_dsp_rproc_mbox_init)(struct imx_dsp_rproc *priv);
> > +static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc, const =
struct firmware *fw);
> >
> >  /* Reset function for DSP on i.MX8MP */
> >  static int imx8mp_dsp_reset(struct imx_dsp_rproc *priv)
> > @@ -402,8 +405,24 @@ static int imx_dsp_rproc_start(struct rproc *rproc=
)
> >       const struct imx_dsp_rproc_dcfg *dsp_dcfg =3D priv->dsp_dcfg;
> >       const struct imx_rproc_dcfg *dcfg =3D dsp_dcfg->dcfg;
> >       struct device *dev =3D rproc->dev.parent;
> > +     struct rproc_mem_entry *carveout;
> >       int ret;
> >
> > +     pm_runtime_get_sync(dev);
> > +
> > +     /*
> > +      * Clear buffers after pm rumtime for internal ocram is not
> > +      * accessible if power and clock are not enabled.
> > +      */
> > +     list_for_each_entry(carveout, &rproc->carveouts, node) {
> > +             if (carveout->va)
> > +                     memset(carveout->va, 0, carveout->len);
> > +     }
> > +
> > +     ret =3D imx_dsp_rproc_elf_load_segments(rproc, priv->firmware);
> > +     if (ret)
> > +             return ret;
> > +
> >       switch (dcfg->method) {
> >       case IMX_RPROC_MMIO:
> >               ret =3D regmap_update_bits(priv->regmap,
> > @@ -446,6 +465,7 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
> >
> >       if (rproc->state =3D=3D RPROC_CRASHED) {
> >               priv->flags &=3D ~REMOTE_IS_READY;
> > +             pm_runtime_put_sync(dev);
>
> From this patch I understand that for a recovery to be successful, the
> remote processor _has_ to go through a hard reset.  But here the PM runti=
me API
> is used, meaning the remote processor won't be switched off if another de=
vice in
> the same power domain still neeeds power.  If that is the case, the solut=
ion in
> tihs patch won't work.

Thanks for reviewing.
With the case you mentioned, there is software reset to make the
recovery process work.

best regards
Shengjiu Wang

>
> Thanks,
> Mathieu
>
> >               return 0;
> >       }
> >
> > @@ -472,6 +492,8 @@ static int imx_dsp_rproc_stop(struct rproc *rproc)
> >       else
> >               priv->flags &=3D ~REMOTE_IS_READY;
> >
> > +     pm_runtime_put_sync(dev);
> > +
> >       return ret;
> >  }
> >
> > @@ -774,7 +796,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rpro=
c)
> >  {
> >       struct imx_dsp_rproc *priv =3D rproc->priv;
> >       struct device *dev =3D rproc->dev.parent;
> > -     struct rproc_mem_entry *carveout;
> >       int ret;
> >
> >       ret =3D imx_dsp_rproc_add_carveout(priv);
> > @@ -783,25 +804,6 @@ static int imx_dsp_rproc_prepare(struct rproc *rpr=
oc)
> >               return ret;
> >       }
> >
> > -     pm_runtime_get_sync(dev);
> > -
> > -     /*
> > -      * Clear buffers after pm rumtime for internal ocram is not
> > -      * accessible if power and clock are not enabled.
> > -      */
> > -     list_for_each_entry(carveout, &rproc->carveouts, node) {
> > -             if (carveout->va)
> > -                     memset(carveout->va, 0, carveout->len);
> > -     }
> > -
> > -     return  0;
> > -}
> > -
> > -/* Unprepare function for rproc_ops */
> > -static int imx_dsp_rproc_unprepare(struct rproc *rproc)
> > -{
> > -     pm_runtime_put_sync(rproc->dev.parent);
> > -
> >       return  0;
> >  }
> >
> > @@ -1022,13 +1024,25 @@ static int imx_dsp_rproc_parse_fw(struct rproc =
*rproc, const struct firmware *fw
> >       return 0;
> >  }
> >
> > +static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmwa=
re *fw)
> > +{
> > +     struct imx_dsp_rproc *priv =3D rproc->priv;
> > +
> > +     /*
> > +      * Just save the fw handler, the firmware loading will be after
> > +      * power enabled
> > +      */
> > +     priv->firmware =3D fw;
> > +
> > +     return 0;
> > +}
> > +
> >  static const struct rproc_ops imx_dsp_rproc_ops =3D {
> >       .prepare        =3D imx_dsp_rproc_prepare,
> > -     .unprepare      =3D imx_dsp_rproc_unprepare,
> >       .start          =3D imx_dsp_rproc_start,
> >       .stop           =3D imx_dsp_rproc_stop,
> >       .kick           =3D imx_dsp_rproc_kick,
> > -     .load           =3D imx_dsp_rproc_elf_load_segments,
> > +     .load           =3D imx_dsp_rproc_load,
> >       .parse_fw       =3D imx_dsp_rproc_parse_fw,
> >       .handle_rsc     =3D imx_dsp_rproc_handle_rsc,
> >       .find_loaded_rsc_table =3D rproc_elf_find_loaded_rsc_table,
> > --
> > 2.34.1
> >
>
