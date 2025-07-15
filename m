Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7255C22068F
	for <imx@lists.linux.dev>; Tue, 15 Jul 2025 16:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752595463; cv=none; b=l4uadm2D6ujIpLNBDn2qAlmdnSKXTmq2kI0+N6ATsl9IA1jXpOhsmENteWw28I0qrWgtdWnr4ct1uT6UvOIJcpl6IgTIKbT2cEcg01p/i24pMYFP+jcX0Rkv2CNmYsJ2z8MwRkTVKWbxD01EMHY8BUiPgRrkTAIhXWU/1aIA7Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752595463; c=relaxed/simple;
	bh=TYSZRoXAo9rhsq/upQkr8hoyxLo7w7gQasAAjXS3CA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s+J5X0VuzaS22RcoByy6YvgLs6hTDzXh26NKfAJgDMcLe/nqL/5+l0Wk2TJ+RInaBsRZVwp+Jq3c/R3wWXbo5RSE6pR9zY1ZD09LpWIfv+MFt4hoIx0VCeJ/+Krx/xc5tR7SF5gOBOtN8F7ZFURHnynvuszp11YjOscpo6LbK6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=huScEOqP; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="huScEOqP"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-711756ae8c9so44919437b3.3
        for <imx@lists.linux.dev>; Tue, 15 Jul 2025 09:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752595460; x=1753200260; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G9+Gf6mbowZuZalonETpZ6jadnzxH+LjmxECpwT8Dno=;
        b=huScEOqPJo6Py8cEX+yAnWND69eATvBf5a2CR1yPGmu48ghs0QAgbTnNZmUc89XTBA
         ZIXwSgAjkbYpYkR9dR3wssFZDL18rO63NoLYov8WpDqr/60JEVGe1TK53UqGEquL4wKX
         8AnkXHgLhPWORTQkIfFa2QWPoEjbiHtYF5od09wmUTLHGt6fkiUnwT31U1zniauTUA4K
         X88Ui/62dUv6UTxm8DqUF7RPPi4Gq3Kt4mWINc4h37WnSrQRY0Z4jJeCQsT3D6yg2uCp
         bfAZx3trkdxHpOZDcJwW+60j4dY3G9kj6122FN4H80DDCS/80EjX429zQ3GsfVzMDKZ8
         gyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752595460; x=1753200260;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9+Gf6mbowZuZalonETpZ6jadnzxH+LjmxECpwT8Dno=;
        b=kjXnU7KJ6gjfsVh302wNUPF+QBFvG+TRDzqYpcGsc6Zn4i7lYFT/bmVssygEzu51+J
         TuY/akvvSRdYYKFcNzKKYN86h/5krHiW9rbewwzaw5Lbw5aD2tzARJMzNFtEJghnqGGV
         5zxg47rWrjpLPSY13FEJ5YxSkCN0c5ba/Zjj3/rsJPLRW3rT1iIISk3e9cIGcgq/vPLj
         sPdOgSv0VWNxWFk6wfUkEibNCRjE+tsJH60WJxGbPjM1OcQgoQViK4MVXLvwPcW/hOqw
         zvZutzCfARa4lsD3rpTvfHXGHjbeQ4fe040apwycEACVb3I50jehnnfjloAdT4HmTCqc
         JX7g==
X-Forwarded-Encrypted: i=1; AJvYcCV4JNCOKiFMBRLSK+bcblVFRXsYD+gpDqKNFydCHhQR2fUd+Zbca6OaaLtNj56Lkx14rOk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwHbj6NW33qrMfP3zLJxMzb5y/UAIhSdLP3PJYChj0kKSsuOlfa
	/QuxD7w0nCaYjc/5Yi8kf/EhBWWxPDbLYqXi50Qi1jpYxJXbol5Cixw7M5d4tWxjaE0OUt7o69M
	UqouKzsA7Kd4O//U9e2zcFXzK2ip7tiUY709q+bIEDw==
X-Gm-Gg: ASbGncs6mczBVAuEjrhlJ8aE2SFC0V/yHd2eFE02DWAi/hdnniCgYSmqgJIzpKjDjiU
	f/+XhfENf+y76BJFQEU6brqAtcYPVDgvZBG17oLSJHOFNhxPqf04DOjDUWnqSHg1Mx1KIEdXOrV
	c4q4dFXFEtKZeTbUiKZk0ii19TIBbH4K782WGAJUBWiFyej466b2ZRkWV8noJzacluPyOK+WnJ5
	9G6zsEL
X-Google-Smtp-Source: AGHT+IFBCmctpYQ4hpqmpVFpQIoEcYogmxduh959NmT/NLJBG7pellcNPOyp5tqRpcLBqr3/eauADU/Eyz78hUd2K6M=
X-Received: by 2002:a05:690c:628a:b0:70e:7ff6:9ff3 with SMTP id
 00721157ae682-717d5f3d391mr277841457b3.35.1752595460223; Tue, 15 Jul 2025
 09:04:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250629172512.14857-1-hiagofranco@gmail.com> <20250629172512.14857-4-hiagofranco@gmail.com>
 <aHZ0nK4ZZShAr6Xz@p14s>
In-Reply-To: <aHZ0nK4ZZShAr6Xz@p14s>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 15 Jul 2025 18:03:44 +0200
X-Gm-Features: Ac12FXwY6h_tcywiVOBNLJxHQ4w9f0nkEbd-hKtDCoysqSLCUbGs7tyoy-l-SHk
Message-ID: <CAPDyKFrWng0CY-ayKoEbnS_yanghSqogxfuizxEVbVogJ4DT=g@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] remoteproc: imx_rproc: detect and attach to
 pre-booted remote cores
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Hiago De Franco <hiagofranco@gmail.com>, linux-pm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Jul 2025 at 17:32, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
>
> On Sun, Jun 29, 2025 at 02:25:12PM -0300, Hiago De Franco wrote:
> > From: Hiago De Franco <hiago.franco@toradex.com>
> >
> > When the Cortex-M remote core is started and already running before
> > Linux boots (typically by the Cortex-A bootloader using a command like
> > bootaux), the current driver is unable to attach to it. This is because
> > the driver only checks for remote cores running in different SCFW
> > partitions. However in this case, the M-core is in the same partition as
> > Linux and is already powered up and running by the bootloader.
> >
> > This patch adds a check using dev_pm_genpd_is_on() to verify whether the
> > M-core's power domains are already on. If all power domain devices are
> > on, the driver assumes the M-core is running and proceed to attach to
> > it.
> >
> > To accomplish this, we need to avoid passing any attach_data or flags to
> > dev_pm_domain_attach_list(), allowing the platform device become a
> > consumer of the power domain provider without changing its current
> > state.
> >
> > During probe, also enable and sync the device runtime PM to make sure
> > the power domains are correctly managed when the core is controlled by
> > the kernel.
> >
> > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > ---
> > v6 -> v7:
> >  - Added Peng reviewed-by.
> > v5 -> v6:
> >  - Commit description improved, as suggested. Added Ulf Hansson reviewed
> >    by. Comment on imx-rproc.c improved.
> > v4 -> v5:
> >  - pm_runtime_get_sync() removed in favor of
> >    pm_runtime_resume_and_get(). Now it also checks the return value of
> >    this function.
> >  - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove()
> >    function.
> > v3 -> v4:
> >  - Changed to use the new dev_pm_genpd_is_on() function instead, as
> >    suggested by Ulf. This will now get the power status of the two
> >    remote cores power domains to decided if imx_rpoc needs to attach or
> >    not. In order to do that, pm_runtime_enable() and
> >    pm_runtime_get_sync() were introduced and pd_data was removed.
> > v2 -> v3:
> >  - Unchanged.
> > v1 -> v2:
> >  - Dropped unecessary include. Removed the imx_rproc_is_on function, as
> >    suggested.
> > ---
> >  drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++++++++++-----
> >  1 file changed, 32 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > index 627e57a88db2..24597b60c5b0 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -18,6 +18,7 @@
> >  #include <linux/of_reserved_mem.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_domain.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/reboot.h>
> >  #include <linux/regmap.h>
> >  #include <linux/remoteproc.h>
> > @@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
> >  static int imx_rproc_attach_pd(struct imx_rproc *priv)
> >  {
> >       struct device *dev = priv->dev;
> > -     int ret;
> > -     struct dev_pm_domain_attach_data pd_data = {
> > -             .pd_flags = PD_FLAG_DEV_LINK_ON,
> > -     };
> > +     int ret, i;
> > +     bool detached = true;
> >
> >       /*
> >        * If there is only one power-domain entry, the platform driver framework
> > @@ -902,7 +901,22 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
> >       if (dev->pm_domain)
> >               return 0;
> >
> > -     ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> > +     ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> > +     /*
> > +      * If all the power domain devices are already turned on, the remote
> > +      * core is already powered up and running when the kernel booted (e.g.,
> > +      * started by U-Boot's bootaux command). In this case attach to it.
> > +      */
> > +     for (i = 0; i < ret; i++) {
> > +             if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> > +                     detached = false;
> > +                     break;
> > +             }
> > +     }
>
> I was doing one final review of this work when I noticed the return code for
> dev_pm_domain_attach_list() is never checked for error.

The for loop covers the error condition correctly, I think. It's only
when ret >=1 when the loop should be started - and ret is propagated
to the caller a few lines below.

>
> Thanks,
> Mathieu
>

Kind regards
Uffe

> > +
> > +     if (detached)
> > +             priv->rproc->state = RPROC_DETACHED;
> > +
> >       return ret < 0 ? ret : 0;
> >  }
> >
> > @@ -1146,6 +1160,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
> >               }
> >       }
> >
> > +     if (dcfg->method == IMX_RPROC_SCU_API) {
> > +             pm_runtime_enable(dev);
> > +             ret = pm_runtime_resume_and_get(dev);
> > +             if (ret) {
> > +                     dev_err(dev, "pm_runtime get failed: %d\n", ret);
> > +                     goto err_put_clk;
> > +             }
> > +     }
> > +
> >       ret = rproc_add(rproc);
> >       if (ret) {
> >               dev_err(dev, "rproc_add failed\n");
> > @@ -1171,6 +1194,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
> >       struct rproc *rproc = platform_get_drvdata(pdev);
> >       struct imx_rproc *priv = rproc->priv;
> >
> > +     if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> > +             pm_runtime_disable(priv->dev);
> > +             pm_runtime_put(priv->dev);
> > +     }
> >       clk_disable_unprepare(priv->clk);
> >       rproc_del(rproc);
> >       imx_rproc_put_scu(rproc);
> > --
> > 2.39.5
> >
