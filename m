Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBDD28D8EB
	for <imx@lists.linux.dev>; Fri,  9 May 2025 10:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746787060; cv=none; b=qTd/pEoN+aCv7ACw8FY/k0OIaO767DIDFkn6GJJOmO31HIDp36vtzJhCtKZOP1FRB7ziX+bwgbQDmUVwLBJc8V7N3L5S3wxU2vLifn3jWtXW20zoC86zzKkNALADOgm21KwRK85NN6oiiOG0dLzZxqerYr6ZOWww8apI5jjr1u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746787060; c=relaxed/simple;
	bh=0fs5ylNaOzunUNujH/KRjBP5JnkjVQPfv0qiTCj0QOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DD6cGFA5PrpxzybmlJU6FOskK4QBl+Vf9jUiZdGcayBLRPDKQ6iTf5b6tzT7SqXG6QuAY8CQHXvmkoA5v4jnAj5cWD+zeYz+rYbp5bZhe9mlBsJMRB8mhKkGBJhdzzoVqFMXc6ArQBmAa4C0XNp/Wf7UHW1cwExpKcaDFwVCKyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VpQvWMeh; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VpQvWMeh"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e733a6ff491so2107115276.2
        for <imx@lists.linux.dev>; Fri, 09 May 2025 03:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746787058; x=1747391858; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v8HWqsBnOgHqfOkli6JOl9XjSbPGwepeT1L+AmPmiow=;
        b=VpQvWMehOQt0faCW2R5UNIShn+hd8CBWAkkvuN0WBOJSqPeVpjHVnd8tpz5MU/tjnL
         nS38ZIYq5RxJgM8D6X8Woql8CLThtm+Kz+FF/MqLLYnn0I0fuEKisUOK+5GhhlQ1+Cy+
         TDLh6FwaChDo6w1asfXUGpOUimz4VGDb3Pkmf2ERPL/4kzV7g9H0o7bEByqoSxWeqsXD
         UEDN0kDatN8bX51vY1elIF9Mon2k+fKb+b/3x+h4iKn7fppSLKH6rbJ6bcZbdfLvdMiO
         vdhuOn30i5nLjUksKPmdV98wjrLrJ1D1a5xsI9yxonon3hDpKhqwbpeRAjrKzCLmDB6a
         to7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746787058; x=1747391858;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8HWqsBnOgHqfOkli6JOl9XjSbPGwepeT1L+AmPmiow=;
        b=SNStPs/2lyKv+KKlz3S0j8EId2njZznai2CAMg6+vTQNNzZxio7LklH2o2TV0RSs61
         C6aTKUHfaB8g9rxfUNUnnUABshbGkyL8kI7q0dWAkMvezufEbdQCdrpKwiAoxJ3V/G4e
         8KUjjnDw7P4yYgwwkAdUmjQHNzxs+ljimznPYJUk40ev4gmPVBF9Xt0q46C4E8VViHFr
         z2kB2OdIyCM78C55stflzEx//KYwDjbUCMvc4+KkeMa6nkEli3XzS7X6+6CZT2Zm71if
         wqOIjgpNrucZLuW046O2/QezB7W6uqxZWR5s8+QwhFMJ3PtjD50U4lM5l7v/iFxmkhfu
         YYyw==
X-Forwarded-Encrypted: i=1; AJvYcCUo2ybcoILtiJObfoNKB2GWx/peI7RQbYoBrkCVx8KErdUQSlw1F2ZRVluhTe6CoUUNOwM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzhNIwNJlWNGlcKeThWlu+s3h45RHpJZfvGwMdF3xuUpMn2UvZc
	lTRV7CXdfEtt5qoa+zFk9DJuQgiVufCRTUUstam25qp0xZjdu3Slt4SjfNy4QXmmIjusnwGAuo+
	bddKyogBq/xOlsITHSCQE09SzFrQyJksHZrfahw==
X-Gm-Gg: ASbGncs9wcdM5hWT2MzzkVA90ZMQMBuPLmyDmC8EFYUmKN+rsl+jIjuAn4PuxkzA1TG
	OeKhOFAO6GF7nX2QTlVRo3EHxSworcGL80b1YlRmkzuggWDnm+3pFHYDJJXJ/aVClPxw9PjWI+O
	irrhFX057It4JlEh6Oiy9UmgA=
X-Google-Smtp-Source: AGHT+IHGUQjJVdBjTJmRKFe+lI4Dr7Yvcb3JZ9EYjARYtthQZOUUjBw0vFstcVpvdszrsUfiNCJi95xf6kgp4EbzMV4=
X-Received: by 2002:a05:6902:161c:b0:e73:1b5a:940e with SMTP id
 3f1490d57ef6-e78fdc94c29mr3707287276.12.1746787057898; Fri, 09 May 2025
 03:37:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250507160056.11876-1-hiagofranco@gmail.com> <20250507160056.11876-4-hiagofranco@gmail.com>
 <CAPDyKFrHD1hVCfOK-JV5FJM+Cd9DoKKZGKcC94fxx6_9Bsri1g@mail.gmail.com> <20250508202826.33bke6atcvqdkfa4@hiago-nb>
In-Reply-To: <20250508202826.33bke6atcvqdkfa4@hiago-nb>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 9 May 2025 12:37:02 +0200
X-Gm-Features: ATxdqUFDC_Pl3jlEgS_HbLn5g6wqCpqO-dLCHrdHv6je6wX2F4IVnpafFiKhvog
Message-ID: <CAPDyKFr3yF=yYZ=Xo5FicvSbDPOTx7+fMwc8dMCLYKPBMEtCKA@mail.gmail.com>
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

On Thu, 8 May 2025 at 22:28, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> Hello,
>
> On Thu, May 08, 2025 at 12:03:33PM +0200, Ulf Hansson wrote:
> > On Wed, 7 May 2025 at 18:02, Hiago De Franco <hiagofranco@gmail.com> wrote:
> > >
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > >
> > > When the remote core is started before Linux boots (e.g., by the
> > > bootloader), the driver currently is not able to attach because it only
> > > checks for cores running in different partitions. If the core was kicked
> > > by the bootloader, it is in the same partition as Linux and it is
> > > already up and running.
> > >
> > > This adds power mode verification through the SCU interface, enabling
> > > the driver to detect when the remote core is already running and
> > > properly attach to it.
> > >
> > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > Suggested-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > > v2: Dropped unecessary include. Removed the imx_rproc_is_on function, as
> > > suggested.
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > >
> > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > index 627e57a88db2..9b6e9e41b7fc 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -949,6 +949,19 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
> > >                         if (of_property_read_u32(dev->of_node, "fsl,entry-address", &priv->entry))
> > >                                 return -EINVAL;
> > >
> > > +                       /*
> > > +                        * If remote core is already running (e.g. kicked by
> > > +                        * the bootloader), attach to it.
> > > +                        */
> > > +                       ret = imx_sc_pm_get_resource_power_mode(priv->ipc_handle,
> > > +                                                               priv->rsrc_id);
> > > +                       if (ret < 0)
> > > +                               dev_err(dev, "failed to get power resource %d mode, ret %d\n",
> > > +                                       priv->rsrc_id, ret);
> > > +
> > > +                       if (ret == IMX_SC_PM_PW_MODE_ON)
> > > +                               priv->rproc->state = RPROC_DETACHED;
> > > +
> > >                         return imx_rproc_attach_pd(priv);
> >
> > Why is it important to potentially set "priv->rproc->state =
> > RPROC_DETACHED" before calling imx_rproc_attach_pd()?
> >
> > Would it be possible to do it the other way around? First calling
> > imx_rproc_attach_pd() then get the power-mode to know if
> > RPROC_DETACHED should be set or not?
> >
> > The main reason why I ask, is because of how we handle the single PM
> > domain case. In that case, the PM domain has already been attached
> > (and powered-on) before we reach this point.
>
> I am not sure if I understood correcly, let me know if I missed
> something. From my understanding in this case it does not matter, since
> the RPROC_DETACHED will only be a flag to trigger the attach callback
> from rproc_validate(), when rproc_add() is called inside
> remoteproc_core.c.

Okay, I see.

To me, it sounds like we should introduce a new genpd helper function
instead. Something along the lines of this (drivers/pmdomain/core.c)

bool dev_pm_genpd_is_on(struct device *dev)
{
        struct generic_pm_domain *genpd;
        bool is_on;

        genpd = dev_to_genpd_safe(dev);
        if (!genpd)
                return false;

        genpd_lock(genpd);
        is_on = genpd_status_on(genpd);
        genpd_unlock(genpd);

        return is_on;
}

After imx_rproc_attach_pd() has run, we have the devices that
correspond to the genpd(s). Those can then be passed as in-parameters
to the above function to get the power-state of their PM domains
(genpds). Based on that, we can decide if priv->rproc->state should be
to RPROC_DETACHED or not. Right?

In this way we don't need to export unnecessary firmware functions
from firmware/imx/misc.c, as patch1/3 does.

If you think it can work, I can help to cook a formal patch for the
above helper that you can fold into your series. Let me know.

>
> With that we can correcly attach to the remote core running, which was
> not possible before, where the function returns at "return
> imx_rproc_attach_pd(priv);" with the RPROC_OFFLINE state to
> rproc_validate().

I see, thanks for clarifying!

Kind regards
Uffe
