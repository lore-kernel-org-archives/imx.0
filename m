Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B96286D49
	for <imx@lists.linux.dev>; Mon, 19 May 2025 17:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747675446; cv=none; b=FI5gISptg227GL5uayugbNEteFMyX4/XTRKXFMrg7FVtlw9HqxpnTQh1OPQ4OMUQeLls2LsJGGMCz2ZbcMa1R/Kutmq97ycdVHuVpbXtf8CSUbBQPS5g8N7XNWPLLsycgIrFL9Z4vdDwqw31RN6PWTeAMjnb2Rm++6cS1BseblY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747675446; c=relaxed/simple;
	bh=nBPoNrpiV9BsfHp5GVG8LeMGMX9QHCmx1mdYrFdbXk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=to1cjKrdz0o7EwYbHs3uRQ+FhDmrIILCDcqdAmFyVyPZy99Z6TwHueQECfMzdX14cqELPupo1L7LhxV6LxrvWJNW6DMt+gfy9uaiC0wwkm6sdH0jHJXJeDagv/2e2FRd9Irm8bzd6DTgYwwMZuzu6Ipp2cN6sn0ZMNyyqVz4W1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acZ7w4ww; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acZ7w4ww"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-527a2b89a11so1438030e0c.2
        for <imx@lists.linux.dev>; Mon, 19 May 2025 10:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747675443; x=1748280243; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GGH/NngmpLn7x/rcD9jvP+7rxM2JWBV0X7vyoSK4edc=;
        b=acZ7w4wwTklnKWohuu2NngaYvdDI7tqGe8fNTk/RtmMgKmvwvL0k3PYY1/O/SIQYjG
         YtY5ngCQp86wsW1GgUYWLn9Ka4NcI51xjr/XKhglbUA2SrMewQrS26lsj1korua0U8aQ
         dXeo4POoihlDz2IDSsjxNubIluwos4u51j/Cg9XXNFT7WoapR+fLQiY7ARFXsT1f/lDi
         lB/xNEptKW6gEs1dfmOJY24K4AUoz8dY3rAATgoKpNvLwZv3x18KlkVHKAtBdCnFt1Jg
         L4/fb3vINfd6cnX3CLeOfC+wb/GOOqF6IdLH1PSInPlqzmgQ8O9SS6z/U9AssrBx/fK5
         qbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747675443; x=1748280243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGH/NngmpLn7x/rcD9jvP+7rxM2JWBV0X7vyoSK4edc=;
        b=n4qZ34LQXAWd4MaRqvPyDgHFUDJUZkUI3E+QctvIiJLP1nXTBL/RA2fJIaW97Y09oa
         9ZV4iPIzSNP2zB2qYWZ3nwrb4DGcR9ViW5C+165eSdT47kWOEg+8uT8L5lg/ANZzsenU
         gXZo6IJHwWSlRx7yurjS1xeIjuuXvAkzKXXZpxAaVLEKZAlrk8iZHuGvjcEPwF7PlaIZ
         TjmrQCvu4DBwUzWiVmidhlECDk2OGz6mgysM2EJAiSLrLZc8qU+BFVDbxfB4hM/ZKxAd
         yn69ZPvF9Tvs/4fCF//Luk6SsTyVXriMkb6YCeuXcE+kzEhDAN/7xrfO4vzaZILrBjWe
         OMFg==
X-Forwarded-Encrypted: i=1; AJvYcCVY25onEwmZ/dsC/mckmPaa4dB5WE4dLP5eN/DCxiXOyBI/R7ECjcKHf5azZG24+ANdN6Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+vnNNL4fMiSk8ydzxv5lyhCFseWxhQZcQzBOlZ3nTLfYhErrC
	BZ1LTD5GG6Epf0STk/daWZ+7JWZih2LCyiEHEX5xU7XbYMJjX5LTxqTj
X-Gm-Gg: ASbGncuTTWI1hankAIjPXwAFKq5PNry5BL3UL9+uQBmVnJReGlEu9BRBtY1yadT+826
	ATIJsOtYVjbYVlOc1TkKzyqThnaR8Yn8je+icDr9qP4VylqKS6fcta0tsrF4VL4VEh1oSAJPI3f
	xrY/Y/EdWMBKzvRM+CuJu5lpSpYupeiWHTTD2shFsgMLqyMYeTIfESieamfX0aW7Dg2PkKwvWpw
	VJ8TRJZp/tV94WPqvr9rhBkLrS0PKjZh6zWMEft4ZAzBkUPtLMqIvwu0AsOBbJ9sWSrZJ+fYaqR
	YuHgME6y98qrv1QBr1EDyp1s2o4Fs3tpALxxGG+/uvc3Fgf8Vw==
X-Google-Smtp-Source: AGHT+IGRviLTeo62L5TV0RMJJBJvgHY6LfT1aj/EMG2TzZ7seoCGW/qrJst+1Op6xHvQDdGo6QSqHA==
X-Received: by 2002:a05:6122:6504:b0:52d:bc0d:83f with SMTP id 71dfb90a1353d-52dbc0d0968mr7149532e0c.11.1747675443405;
        Mon, 19 May 2025 10:24:03 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbab4e983sm7017867e0c.31.2025.05.19.10.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:24:02 -0700 (PDT)
Date: Mon, 19 May 2025 14:23:57 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com, Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_rproc: add power mode check for
 remote core attachment
Message-ID: <20250519172357.vfnwehrbkk24vkge@hiago-nb>
References: <20250507160056.11876-1-hiagofranco@gmail.com>
 <20250507160056.11876-4-hiagofranco@gmail.com>
 <CAPDyKFrHD1hVCfOK-JV5FJM+Cd9DoKKZGKcC94fxx6_9Bsri1g@mail.gmail.com>
 <20250508202826.33bke6atcvqdkfa4@hiago-nb>
 <CAPDyKFr3yF=yYZ=Xo5FicvSbDPOTx7+fMwc8dMCLYKPBMEtCKA@mail.gmail.com>
 <20250509191308.6i3ydftzork3sv5c@hiago-nb>
 <CAPDyKFpnLzk5YR3piksGhdB8ZoGNCzmweBTxm_rDX5=vjLFxqQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFpnLzk5YR3piksGhdB8ZoGNCzmweBTxm_rDX5=vjLFxqQ@mail.gmail.com>

Hi Ulf,

On Mon, May 19, 2025 at 04:33:30PM +0200, Ulf Hansson wrote:
> On Fri, 9 May 2025 at 21:13, Hiago De Franco <hiagofranco@gmail.com> wrote:
> >
> > On Fri, May 09, 2025 at 12:37:02PM +0200, Ulf Hansson wrote:
> > > On Thu, 8 May 2025 at 22:28, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > > >
> > > > Hello,
> > > >
> > > > On Thu, May 08, 2025 at 12:03:33PM +0200, Ulf Hansson wrote:
> > > > > On Wed, 7 May 2025 at 18:02, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > > > > >
> > > > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > > > >
> > > > > > When the remote core is started before Linux boots (e.g., by the
> > > > > > bootloader), the driver currently is not able to attach because it only
> > > > > > checks for cores running in different partitions. If the core was kicked
> > > > > > by the bootloader, it is in the same partition as Linux and it is
> > > > > > already up and running.
> > > > > >
> > > > > > This adds power mode verification through the SCU interface, enabling
> > > > > > the driver to detect when the remote core is already running and
> > > > > > properly attach to it.
> > > > > >
> > > > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > > > > Suggested-by: Peng Fan <peng.fan@nxp.com>
> > > > > > ---
> > > > > > v2: Dropped unecessary include. Removed the imx_rproc_is_on function, as
> > > > > > suggested.
> > > > > > ---
> > > > > >  drivers/remoteproc/imx_rproc.c | 13 +++++++++++++
> > > > > >  1 file changed, 13 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > > > > index 627e57a88db2..9b6e9e41b7fc 100644
> > > > > > --- a/drivers/remoteproc/imx_rproc.c
> > > > > > +++ b/drivers/remoteproc/imx_rproc.c
> > > > > > @@ -949,6 +949,19 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
> > > > > >                         if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
> > > > > >                                 return -EINVAL;
> > > > > >
> > > > > > +                       /*
> > > > > > +                        * If remote core is already running (e.g. kicked by
> > > > > > +                        * the bootloader), attach to it.
> > > > > > +                        */
> > > > > > +                       ret = imx_sc_pm_get_resource_power_mode(priv->ipc_handle,
> > > > > > +                                                               priv->rsrc_id);
> > > > > > +                       if (ret < 0)
> > > > > > +                               dev_err(dev, "failed to get power resource %d mode, ret %d\n",
> > > > > > +                                       priv->rsrc_id, ret);
> > > > > > +
> > > > > > +                       if (ret == IMX_SC_PM_PW_MODE_ON)
> > > > > > +                               priv->rproc->state = RPROC_DETACHED;
> > > > > > +
> > > > > >                         return imx_rproc_attach_pd(priv);
> > > > >
> > > > > Why is it important to potentially set "priv->rproc->state =
> > > > > RPROC_DETACHED" before calling imx_rproc_attach_pd()?
> > > > >
> > > > > Would it be possible to do it the other way around? First calling
> > > > > imx_rproc_attach_pd() then get the power-mode to know if
> > > > > RPROC_DETACHED should be set or not?
> > > > >
> > > > > The main reason why I ask, is because of how we handle the single PM
> > > > > domain case. In that case, the PM domain has already been attached
> > > > > (and powered-on) before we reach this point.
> > > >
> > > > I am not sure if I understood correcly, let me know if I missed
> > > > something. From my understanding in this case it does not matter, since
> > > > the RPROC_DETACHED will only be a flag to trigger the attach callback
> > > > from rproc_validate(), when rproc_add() is called inside
> > > > remoteproc_core.c.
> > >
> > > Okay, I see.
> > >
> > > To me, it sounds like we should introduce a new genpd helper function
> > > instead. Something along the lines of this (drivers/pmdomain/core.c)
> > >
> > > bool dev_pm_genpd_is_on(struct device *dev)
> > > {
> > >         struct generic_pm_domain *genpd;
> > >         bool is_on;
> > >
> > >         genpd = dev_to_genpd_safe(dev);
> > >         if (!genpd)
> > >                 return false;
> > >
> > >         genpd_lock(genpd);
> > >         is_on = genpd_status_on(genpd);
> > >         genpd_unlock(genpd);
> > >
> > >         return is_on;
> > > }
> > >
> > > After imx_rproc_attach_pd() has run, we have the devices that
> > > correspond to the genpd(s). Those can then be passed as in-parameters
> > > to the above function to get the power-state of their PM domains
> > > (genpds). Based on that, we can decide if priv->rproc->state should be
> > > to RPROC_DETACHED or not. Right?
> >
> > Got your idea, I think it should work yes, I am not so sure how. From
> > what I can see these power domains are managed by
> > drivers/pmdomain/imx/scu-pd.c and by enabling the debug messages I can
> > see the power mode is correct when the remote core is powered on:
> >
> > [    0.317369] imx-scu-pd system-controller:power-controller: cm40-pid0 : IMX_SC_PM_PW_MODE_ON
> >
> > and powered off:
> >
> > [    0.314953] imx-scu-pd system-controller:power-controller: cm40-pid0 : IMX_SC_PM_PW_MODE_OFF
> >
> > But I cannot see how to integrate this into the dev_pm_genpd_is_on() you
> > proposed. For a quick check, I added this function and it always return
> > NULL at dev_to_genpd_safe(). Can you help me to understand this part?
> 
> As your device has multiple PM domains and those gets attached with
> dev_pm_domain_attach_list(), the device(s) that you should use with
> dev_pm_genpd_is_on() are in imx_rproc->pd_list->pd_devs[n].

Ok got it, thanks for sharing.

I just send the v3 with the changes Peng proposed (here
https://lore.kernel.org/lkml/20250519171514.61974-1-hiagofranco@gmail.com/T/#t),
but I am a bit confused which path we should take, the initial approach
proposed or using these PD functions. Maybe we can discuss this in the
new v3 patch series?

> 
> >
> > >
> > > In this way we don't need to export unnecessary firmware functions
> > > from firmware/imx/misc.c, as patch1/3 does.
> > >
> > > If you think it can work, I can help to cook a formal patch for the
> > > above helper that you can fold into your series. Let me know.
> > >
> > > >
> > > > With that we can correcly attach to the remote core running, which was
> > > > not possible before, where the function returns at "return
> > > > imx_rproc_attach_pd(priv);" with the RPROC_OFFLINE state to
> > > > rproc_validate().
> > >
> > > I see, thanks for clarifying!
> > >
> > > Kind regards
> > > Uffe
> >
> > Thank you!
> > Hiago.
> 
> Kind regards
> Uffe

Thanks,
Hiago.
