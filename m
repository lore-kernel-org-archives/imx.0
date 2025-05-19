Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BB5283FCC
	for <imx@lists.linux.dev>; Mon, 19 May 2025 14:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747665252; cv=none; b=WF5G2Tgpi8zFo3biQCSa37EIjpyM+UxVnbz933VNCAffkIqaM6NIyicSlPJPmugSa0Tgo9CeR1h/CAo/HZ6G8tClVwE8pExkFRBo2yYOSOMuNEEA/74PMDLhRfHMzKYxM8sMyKVMKsZmfTYBflhEH/xONLU4MjfOCwnSUQbyNl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747665252; c=relaxed/simple;
	bh=ZaaIqKZbolp3tyZ4jlymGGO1E13TofaCBydtTF3D+SA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mdl4xRCNhWHYIBZbuXJwykExzZyifH0fKShp1gUM2+U4GZ/RBIsLGcQJP5bfX//CJEkzoNbgC31nX4o3p0MntsllxejwKgTgPqniYYCvf+ez2BBqZO7NBdNm543HykP4Ti4UPX4RO+yIsIHoUf4OvPHPvzgm9rnO0HlP49199lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V98C272G; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V98C272G"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e7c5d470a8bso994012276.0
        for <imx@lists.linux.dev>; Mon, 19 May 2025 07:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747665250; x=1748270050; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tWQGQfS8CLVYL4QI2AOhtxcKvBGn1H3Acg4MC1GRK8o=;
        b=V98C272GwU0Ki5eN7Ckwt79kg3EfSlM6xtkyOQRZ630CF/eWbCHTLtRsYNA1Cvp7ng
         kjoPq6GgY74dH0a0KG9+F+iPz1150OrqccovjMaM/FgM1cNM8x0SzdPcUfvFGa2gRWms
         hQK8QC32drkGabnSryU9wHZIPmw/+Bx0B4kiHm3pNXRHLsuSpoxvkEXBBP3/TFTWXTxR
         WHWp8g6J8phTuHQ2i1qaoUzQ9yKGb/O2z77JsGLmf2wF+d5cy/hikI8/pucpM7kXxrdX
         40bs96DywneY1h872xzIsQYH4tno740Q1KWR04iwwCDOINwQuKxczJrmf6UKJsG0/FS3
         fVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747665250; x=1748270050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tWQGQfS8CLVYL4QI2AOhtxcKvBGn1H3Acg4MC1GRK8o=;
        b=SJaxSOC6NyvHEqWVSR546XKs6p08U+7c+w3+qVIatjFjxIQcN+/kuqZ6rAXTNggWso
         Lr7V1k5dTBQ+xVYfdsJVy0OTWtME2ATfDgmCBbLi/qFcg90I6aLqN+SOBLnOlGmQHURx
         V+EIMo9sAXNl7WILoY3OvGKQP5kU2t24UIqF1dX4qqPm9Sb5AR818Zr5ZuR3cIBU2Z+6
         Hp9NLNyERzV7hgeImVrtbz5wGuGfykAD+J3DbvpGOJV7eF70h35hCOOkco9Cwnw4Dwym
         hvSmT/IK9GGluCkYYJDbfDlY/aUctjbzVQ5HM5zUWmXtpvhie6c5gbRwg8to7moGeK6J
         Nu/w==
X-Forwarded-Encrypted: i=1; AJvYcCW+gFvKAzOd4GRc7/Zqn99ZHsA4oCf//DUYN2vo3RTKT2ZxcOcl1PnhHom9UlVGh7GnEbo=@lists.linux.dev
X-Gm-Message-State: AOJu0YySN2qps93+fLhRO7WkMgXM0pWravQhZehnXnLEJmxSE2u2zrf4
	I93SeO5xmeIB9HBLTUGB29MEuq7JfKqd6AKPJ85HWM+peNvQipFZ9b0SfQTSsbR5/S4CKjEnknH
	4yB6id5xCMOPYrhcrUeImTHQy3vykItUrx8S+kiBCdw==
X-Gm-Gg: ASbGncvkokJTz6+M3TnssbimWIf47psbui8m9AXzLpY3EnwC1OJd1Ork+RM82H5XoWB
	jvyTkVObNeuLW3GMkGfFjGpOlLyAEAPajotaEV71agWjghmdK0dCy6GzzpuJERfjJB65CoZu9lB
	uxU7z9nP1yGVwNRlHKU7d7XtRsqc2ZS9B5DQ==
X-Google-Smtp-Source: AGHT+IFWUCxEZiHhmGzWmhcQHoV2f4N5kkNUGaz9Fah8Ux1VEsnpDKqNMNg1yrNsBceCDvpkLeFncOO16VyD8I7q6m8=
X-Received: by 2002:a05:6902:2082:b0:e7d:44ee:9c7a with SMTP id
 3f1490d57ef6-e7d44ee9e76mr1602221276.40.1747665249108; Mon, 19 May 2025
 07:34:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250507160056.11876-1-hiagofranco@gmail.com> <20250507160056.11876-4-hiagofranco@gmail.com>
 <CAPDyKFrHD1hVCfOK-JV5FJM+Cd9DoKKZGKcC94fxx6_9Bsri1g@mail.gmail.com>
 <20250508202826.33bke6atcvqdkfa4@hiago-nb> <CAPDyKFr3yF=yYZ=Xo5FicvSbDPOTx7+fMwc8dMCLYKPBMEtCKA@mail.gmail.com>
 <20250509191308.6i3ydftzork3sv5c@hiago-nb>
In-Reply-To: <20250509191308.6i3ydftzork3sv5c@hiago-nb>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 May 2025 16:33:30 +0200
X-Gm-Features: AX0GCFsG_40iOKNCPwkbiqnn-4ukoqDDfiyLZnVk1h-WIiTDA33EI1CKHx8gLMM
Message-ID: <CAPDyKFpnLzk5YR3piksGhdB8ZoGNCzmweBTxm_rDX5=vjLFxqQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_rproc: add power mode check for
 remote core attachment
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, linux-pm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 May 2025 at 21:13, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> On Fri, May 09, 2025 at 12:37:02PM +0200, Ulf Hansson wrote:
> > On Thu, 8 May 2025 at 22:28, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > >
> > > Hello,
> > >
> > > On Thu, May 08, 2025 at 12:03:33PM +0200, Ulf Hansson wrote:
> > > > On Wed, 7 May 2025 at 18:02, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > > > >
> > > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > > >
> > > > > When the remote core is started before Linux boots (e.g., by the
> > > > > bootloader), the driver currently is not able to attach because it only
> > > > > checks for cores running in different partitions. If the core was kicked
> > > > > by the bootloader, it is in the same partition as Linux and it is
> > > > > already up and running.
> > > > >
> > > > > This adds power mode verification through the SCU interface, enabling
> > > > > the driver to detect when the remote core is already running and
> > > > > properly attach to it.
> > > > >
> > > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > > > Suggested-by: Peng Fan <peng.fan@nxp.com>
> > > > > ---
> > > > > v2: Dropped unecessary include. Removed the imx_rproc_is_on function, as
> > > > > suggested.
> > > > > ---
> > > > >  drivers/remoteproc/imx_rproc.c | 13 +++++++++++++
> > > > >  1 file changed, 13 insertions(+)
> > > > >
> > > > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > > > index 627e57a88db2..9b6e9e41b7fc 100644
> > > > > --- a/drivers/remoteproc/imx_rproc.c
> > > > > +++ b/drivers/remoteproc/imx_rproc.c
> > > > > @@ -949,6 +949,19 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
> > > > >                         if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
> > > > >                                 return -EINVAL;
> > > > >
> > > > > +                       /*
> > > > > +                        * If remote core is already running (e.g. kicked by
> > > > > +                        * the bootloader), attach to it.
> > > > > +                        */
> > > > > +                       ret = imx_sc_pm_get_resource_power_mode(priv->ipc_handle,
> > > > > +                                                               priv->rsrc_id);
> > > > > +                       if (ret < 0)
> > > > > +                               dev_err(dev, "failed to get power resource %d mode, ret %d\n",
> > > > > +                                       priv->rsrc_id, ret);
> > > > > +
> > > > > +                       if (ret == IMX_SC_PM_PW_MODE_ON)
> > > > > +                               priv->rproc->state = RPROC_DETACHED;
> > > > > +
> > > > >                         return imx_rproc_attach_pd(priv);
> > > >
> > > > Why is it important to potentially set "priv->rproc->state =
> > > > RPROC_DETACHED" before calling imx_rproc_attach_pd()?
> > > >
> > > > Would it be possible to do it the other way around? First calling
> > > > imx_rproc_attach_pd() then get the power-mode to know if
> > > > RPROC_DETACHED should be set or not?
> > > >
> > > > The main reason why I ask, is because of how we handle the single PM
> > > > domain case. In that case, the PM domain has already been attached
> > > > (and powered-on) before we reach this point.
> > >
> > > I am not sure if I understood correcly, let me know if I missed
> > > something. From my understanding in this case it does not matter, since
> > > the RPROC_DETACHED will only be a flag to trigger the attach callback
> > > from rproc_validate(), when rproc_add() is called inside
> > > remoteproc_core.c.
> >
> > Okay, I see.
> >
> > To me, it sounds like we should introduce a new genpd helper function
> > instead. Something along the lines of this (drivers/pmdomain/core.c)
> >
> > bool dev_pm_genpd_is_on(struct device *dev)
> > {
> >         struct generic_pm_domain *genpd;
> >         bool is_on;
> >
> >         genpd = dev_to_genpd_safe(dev);
> >         if (!genpd)
> >                 return false;
> >
> >         genpd_lock(genpd);
> >         is_on = genpd_status_on(genpd);
> >         genpd_unlock(genpd);
> >
> >         return is_on;
> > }
> >
> > After imx_rproc_attach_pd() has run, we have the devices that
> > correspond to the genpd(s). Those can then be passed as in-parameters
> > to the above function to get the power-state of their PM domains
> > (genpds). Based on that, we can decide if priv->rproc->state should be
> > to RPROC_DETACHED or not. Right?
>
> Got your idea, I think it should work yes, I am not so sure how. From
> what I can see these power domains are managed by
> drivers/pmdomain/imx/scu-pd.c and by enabling the debug messages I can
> see the power mode is correct when the remote core is powered on:
>
> [    0.317369] imx-scu-pd system-controller:power-controller: cm40-pid0 : IMX_SC_PM_PW_MODE_ON
>
> and powered off:
>
> [    0.314953] imx-scu-pd system-controller:power-controller: cm40-pid0 : IMX_SC_PM_PW_MODE_OFF
>
> But I cannot see how to integrate this into the dev_pm_genpd_is_on() you
> proposed. For a quick check, I added this function and it always return
> NULL at dev_to_genpd_safe(). Can you help me to understand this part?

As your device has multiple PM domains and those gets attached with
dev_pm_domain_attach_list(), the device(s) that you should use with
dev_pm_genpd_is_on() are in imx_rproc->pd_list->pd_devs[n].

>
> >
> > In this way we don't need to export unnecessary firmware functions
> > from firmware/imx/misc.c, as patch1/3 does.
> >
> > If you think it can work, I can help to cook a formal patch for the
> > above helper that you can fold into your series. Let me know.
> >
> > >
> > > With that we can correcly attach to the remote core running, which was
> > > not possible before, where the function returns at "return
> > > imx_rproc_attach_pd(priv);" with the RPROC_OFFLINE state to
> > > rproc_validate().
> >
> > I see, thanks for clarifying!
> >
> > Kind regards
> > Uffe
>
> Thank you!
> Hiago.

Kind regards
Uffe
