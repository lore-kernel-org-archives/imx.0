Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBD81F0E3E
	for <imx@lists.linux.dev>; Wed, 16 Jul 2025 17:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752686601; cv=none; b=ktrmfRCnPGAXNGHN4WzF9Xj13tJ58FA03P1xJq/MsDFmSBhMNUN/EEW8zAM3bLEl0oB9e94R9HJnwjXhXpyAgMgc/jRKGn33eC622z1q1UG8iN9Z/Hw0LkAjnFdu0QD210anHJ//KTNgMNGHVJTvq9eK+MnKZYhlifz6WRRj9s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752686601; c=relaxed/simple;
	bh=bJxiXdwctcFMQP5AgOq36xKafUcwzCVsY55BID2xUfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZcGHuJM4zUOr2WTMpSzlLvoPXgdurShfcc+AGuHUpIfCX9oaaggJ5wS26O6OnAFfOlHvA86eQI2GZAe5/3dF2hTaed3nzrprCPWN8BnFJLXnTlgqGBkE9o8neFM3cg0pDSQQclkpo7iDYj2nRzKxp4PgTMDHsa7QHHDA8Exw2B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QeOj6adt; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QeOj6adt"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-61598534619so27380eaf.2
        for <imx@lists.linux.dev>; Wed, 16 Jul 2025 10:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752686595; x=1753291395; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TYaF4rQQYYQxNckUKR5qLC2a/dsvjDTTBdvWeL+AwCI=;
        b=QeOj6adttUyRH09hXdAHju1P2c7qg+lPDSZklgO2TOYu+ued5bdeDOKitC9tOmMm4A
         qeB8k2jRfMhiubtXmaIFu+rCiVgApO+tfgW47YpPIXsQGdV1YNBSxvPSix2v8kXe0l2u
         6oVzQnYDQRlsKruBwocP7YfKX7x7CqlcosT4MI/qlkNICvvhcpwQw9x6l3jVsmYkXdMd
         Q5PAt2vKsGFwT2QLQIQ75C9Lb6DMe6JWf7YjemF5ANOeZRODuvZMlTcWqeoH2q8tm0un
         IegyrI9DxDLJmoaH2i1s8IaEPxKPolwSB0C5tFKNSyhHOUrvmTv3VD8RtMmOIsMDfvCQ
         P+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752686595; x=1753291395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TYaF4rQQYYQxNckUKR5qLC2a/dsvjDTTBdvWeL+AwCI=;
        b=rzkSf4PwwdI7Mx8Pqa51ZtmTIrDAYylc0+Hll3hgBzWc6UGgy+qizzZyH5G05JoviY
         I5byydGoLAsdJj+6LYBPL8W6x1vMIsMEtWNMNk1TdBSjGiGT0zH9SD5Z2gMAi9BHHp8Q
         fhmFmlGFlz/CUxKKfgvirGWCz+/oWcsoqNAYpEjkGqHD5U9hpp8K5P+f/fI3nEAJY8+x
         KbcDfDkxktZvjty9/JRIPigQ6CbtEtjWyi2yVuCsO5E/yNWJ9ocwiuiQ11N1yYe1u/pw
         WCT5RKVrSuGi2z5i4pln8EKbou3wTk7Zcs+7VyocLkor1qe1hIxGxLDMcX7/wA3/OK/t
         rPRg==
X-Forwarded-Encrypted: i=1; AJvYcCXhaQZEllEBMsjeXKs7rq3X/hfQ7qbgj30WtsyCCkKXEbzbabP2iS+QUh5bS6wOtlpOf5k=@lists.linux.dev
X-Gm-Message-State: AOJu0YweicqrpegS3jGw99REpVjjlT8pWw0LpE2xsUU+IGrAk+VodmsQ
	HdHAxWpMr0xQBUwoiwkNYa5XG8SmTzx+By9v0SnYZtGa11DgNUP6pL6z
X-Gm-Gg: ASbGncuNm5Ie+6pGMvpivxaSoxG1tKLpn5IzzWiVB7qs1SUtUEojZ2TLAyZAwJObZay
	lgsfH8CZ2l2yMRKwXzIJqiUJD/IyDFxfBROsN8wImsDOWKDkIkMLpXFd948jV5Tkpi4FKTxMOpt
	JQZz7iFdVizfn6IfsLfgpo9TVdDCAXoNDrXXfC559cSWi5Z2kQCZkYoyJ4WK19lB7/AhjvzbwMc
	XzkXpHAwcx2OvqR3gwNHLBAiRjja+C0Iw/zoRJv2Wi6aHB206Bif1WIgpwF0f4KmixZpxWaPF1k
	hq3/t94l6b2fPOP8oZeICphwbIvDg4YsxCt3xeoRX+uoUbXqEp497B6ary6XxhiwMebtwZTcKkb
	jAO+aNOwOJzVCYMjCX9k=
X-Google-Smtp-Source: AGHT+IG9SWP+MHsh8szcrl8wNTXVHhSFgBCOXHKMiWzbcl8aU95a6gY+Zlw34P4nvAj5tKAF9dH35A==
X-Received: by 2002:a05:6870:5b9e:b0:2e9:9e9:d94b with SMTP id 586e51a60fabf-2ffb257d356mr2547792fac.39.1752686595050;
        Wed, 16 Jul 2025 10:23:15 -0700 (PDT)
Received: from hiagonb ([2804:1b3:a7c1:459e:e3dd:d2e:b1ee:b9ec])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff8dea112bsm1724708fac.43.2025.07.16.10.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 10:23:14 -0700 (PDT)
Date: Wed, 16 Jul 2025 14:23:08 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v7 3/3] remoteproc: imx_rproc: detect and attach to
 pre-booted remote cores
Message-ID: <20250716172308.lzh3aak24d6mt4cs@hiagonb>
References: <aHZ0nK4ZZShAr6Xz@p14s>
 <CAPDyKFrWng0CY-ayKoEbnS_yanghSqogxfuizxEVbVogJ4DT=g@mail.gmail.com>
 <20250716132552.bra37ucw4fcjwril@hiagonb>
 <aHfYQFvkJcdfq9K_@p14s>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHfYQFvkJcdfq9K_@p14s>

On Wed, Jul 16, 2025 at 10:50:08AM -0600, Mathieu Poirier wrote:
> On Wed, Jul 16, 2025 at 10:25:52AM -0300, Hiago De Franco wrote:
> > Hi Mathieu, Ulf,
> > 
> > On Tue, Jul 15, 2025 at 09:32:44AM -0600, Mathieu Poirier wrote:
> > > On Sun, Jun 29, 2025 at 02:25:12PM -0300, Hiago De Franco wrote:
> > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > > 
> > > > When the Cortex-M remote core is started and already running before
> > > > Linux boots (typically by the Cortex-A bootloader using a command like
> > > > bootaux), the current driver is unable to attach to it. This is because
> > > > the driver only checks for remote cores running in different SCFW
> > > > partitions. However in this case, the M-core is in the same partition as
> > > > Linux and is already powered up and running by the bootloader.
> > > > 
> > > > This patch adds a check using dev_pm_genpd_is_on() to verify whether the
> > > > M-core's power domains are already on. If all power domain devices are
> > > > on, the driver assumes the M-core is running and proceed to attach to
> > > > it.
> > > > 
> > > > To accomplish this, we need to avoid passing any attach_data or flags to
> > > > dev_pm_domain_attach_list(), allowing the platform device become a
> > > > consumer of the power domain provider without changing its current
> > > > state.
> > > > 
> > > > During probe, also enable and sync the device runtime PM to make sure
> > > > the power domains are correctly managed when the core is controlled by
> > > > the kernel.
> > > > 
> > > > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > > ---
> > > > v6 -> v7:
> > > >  - Added Peng reviewed-by.
> > > > v5 -> v6:
> > > >  - Commit description improved, as suggested. Added Ulf Hansson reviewed
> > > >    by. Comment on imx-rproc.c improved.
> > > > v4 -> v5:
> > > >  - pm_runtime_get_sync() removed in favor of
> > > >    pm_runtime_resume_and_get(). Now it also checks the return value of
> > > >    this function.
> > > >  - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove()
> > > >    function.
> > > > v3 -> v4:
> > > >  - Changed to use the new dev_pm_genpd_is_on() function instead, as
> > > >    suggested by Ulf. This will now get the power status of the two
> > > >    remote cores power domains to decided if imx_rpoc needs to attach or
> > > >    not. In order to do that, pm_runtime_enable() and
> > > >    pm_runtime_get_sync() were introduced and pd_data was removed.
> > > > v2 -> v3:
> > > >  - Unchanged.
> > > > v1 -> v2:
> > > >  - Dropped unecessary include. Removed the imx_rproc_is_on function, as
> > > >    suggested.
> > > > ---
> > > >  drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++++++++++-----
> > > >  1 file changed, 32 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > > index 627e57a88db2..24597b60c5b0 100644
> > > > --- a/drivers/remoteproc/imx_rproc.c
> > > > +++ b/drivers/remoteproc/imx_rproc.c
> > > > @@ -18,6 +18,7 @@
> > > >  #include <linux/of_reserved_mem.h>
> > > >  #include <linux/platform_device.h>
> > > >  #include <linux/pm_domain.h>
> > > > +#include <linux/pm_runtime.h>
> > > >  #include <linux/reboot.h>
> > > >  #include <linux/regmap.h>
> > > >  #include <linux/remoteproc.h>
> > > > @@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
> > > >  static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > > >  {
> > > >  	struct device *dev = priv->dev;
> > > > -	int ret;
> > > > -	struct dev_pm_domain_attach_data pd_data = {
> > > > -		.pd_flags = PD_FLAG_DEV_LINK_ON,
> > > > -	};
> > > > +	int ret, i;
> > > > +	bool detached = true;
> > > >  
> > > >  	/*
> > > >  	 * If there is only one power-domain entry, the platform driver framework
> > > > @@ -902,7 +901,22 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > > >  	if (dev->pm_domain)
> > > >  		return 0;
> > > >  
> > > > -	ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> > > > +	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> > > > +	/*
> > > > +	 * If all the power domain devices are already turned on, the remote
> > > > +	 * core is already powered up and running when the kernel booted (e.g.,
> > > > +	 * started by U-Boot's bootaux command). In this case attach to it.
> > > > +	 */
> > > > +	for (i = 0; i < ret; i++) {
> > > > +		if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> > > > +			detached = false;
> > > > +			break;
> > > > +		}
> > > > +	}
> > > 
> > > I was doing one final review of this work when I noticed the return code for
> > > dev_pm_domain_attach_list() is never checked for error.
> > 
> > As Ulf pointed out, the 'return' a few lines below will return the
> > negative value to the caller of 'imx_rproc_attach_pd', which ultimately
> > will fail 'imx_rproc_detect_mode' and fail the probe of imx_rproc.
> > 
> > Please notice that even tough 'dev_pm_domain_attach_list' fails, the
> > rproc->state will still be set as RPROC_DETACHED because we are starting
> > 'detached' as true, but I am not seeing this as an issue because as
> > mentioned above the probe will fail anyway. Please let me know if you
> > see this as an issue.
> 
> Two things to consider here: 
> 
> (1) It is only a matter of time before someone with a cleaver coccinelle script
> sends me a patch that adds the missing error check.
> 
> (2) I think that @rproc->state being changed on error conditions is a bug
> waiting to happen.  This kind of implicit error handling is difficult to
> maintain and even more difficult for people to make enhancements to the driver.
> 
> Adding a simple error check will make sure neither of the above will happen.  It
> is a simple change and we are at rc6 - this work can still go in the merge
> window.

Sure, I can submit a new revision with this error check. Sorry I did not
see this before, I only had a close look at this '->state' now that you
asked on the previous email.

Thanks,

Hiago.

> 
> > 
> > > 
> > > Thanks,
> > > Mathieu
> > > 
> > > > +
> > > > +	if (detached)
> > > > +		priv->rproc->state = RPROC_DETACHED;
> > > > +
> > > >  	return ret < 0 ? ret : 0;
> > > >  }
> > > >  
> > > > @@ -1146,6 +1160,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
> > > >  		}
> > > >  	}
> > > >  
> > > > +	if (dcfg->method == IMX_RPROC_SCU_API) {
> > > > +		pm_runtime_enable(dev);
> > > > +		ret = pm_runtime_resume_and_get(dev);
> > > > +		if (ret) {
> > > > +			dev_err(dev, "pm_runtime get failed: %d\n", ret);
> > > > +			goto err_put_clk;
> > > > +		}
> > > > +	}
> > > > +
> > > >  	ret = rproc_add(rproc);
> > > >  	if (ret) {
> > > >  		dev_err(dev, "rproc_add failed\n");
> > > > @@ -1171,6 +1194,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
> > > >  	struct rproc *rproc = platform_get_drvdata(pdev);
> > > >  	struct imx_rproc *priv = rproc->priv;
> > > >  
> > > > +	if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> > > > +		pm_runtime_disable(priv->dev);
> > > > +		pm_runtime_put(priv->dev);
> > > > +	}
> > > >  	clk_disable_unprepare(priv->clk);
> > > >  	rproc_del(rproc);
> > > >  	imx_rproc_put_scu(rproc);
> > > > -- 
> > > > 2.39.5
> > > > 
> > 
> > On Tue, Jul 15, 2025 at 06:03:44PM +0200, Ulf Hansson wrote:
> > > On Tue, 15 Jul 2025 at 17:32, Mathieu Poirier
> > > <mathieu.poirier@linaro.org> wrote:
> > > >
> > > > On Sun, Jun 29, 2025 at 02:25:12PM -0300, Hiago De Franco wrote:
> > > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > > >
> > > > > When the Cortex-M remote core is started and already running before
> > > > > Linux boots (typically by the Cortex-A bootloader using a command like
> > > > > bootaux), the current driver is unable to attach to it. This is because
> > > > > the driver only checks for remote cores running in different SCFW
> > > > > partitions. However in this case, the M-core is in the same partition as
> > > > > Linux and is already powered up and running by the bootloader.
> > > > >
> > > > > This patch adds a check using dev_pm_genpd_is_on() to verify whether the
> > > > > M-core's power domains are already on. If all power domain devices are
> > > > > on, the driver assumes the M-core is running and proceed to attach to
> > > > > it.
> > > > >
> > > > > To accomplish this, we need to avoid passing any attach_data or flags to
> > > > > dev_pm_domain_attach_list(), allowing the platform device become a
> > > > > consumer of the power domain provider without changing its current
> > > > > state.
> > > > >
> > > > > During probe, also enable and sync the device runtime PM to make sure
> > > > > the power domains are correctly managed when the core is controlled by
> > > > > the kernel.
> > > > >
> > > > > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > > > ---
> > > > > v6 -> v7:
> > > > >  - Added Peng reviewed-by.
> > > > > v5 -> v6:
> > > > >  - Commit description improved, as suggested. Added Ulf Hansson reviewed
> > > > >    by. Comment on imx-rproc.c improved.
> > > > > v4 -> v5:
> > > > >  - pm_runtime_get_sync() removed in favor of
> > > > >    pm_runtime_resume_and_get(). Now it also checks the return value of
> > > > >    this function.
> > > > >  - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove()
> > > > >    function.
> > > > > v3 -> v4:
> > > > >  - Changed to use the new dev_pm_genpd_is_on() function instead, as
> > > > >    suggested by Ulf. This will now get the power status of the two
> > > > >    remote cores power domains to decided if imx_rpoc needs to attach or
> > > > >    not. In order to do that, pm_runtime_enable() and
> > > > >    pm_runtime_get_sync() were introduced and pd_data was removed.
> > > > > v2 -> v3:
> > > > >  - Unchanged.
> > > > > v1 -> v2:
> > > > >  - Dropped unecessary include. Removed the imx_rproc_is_on function, as
> > > > >    suggested.
> > > > > ---
> > > > >  drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++++++++++-----
> > > > >  1 file changed, 32 insertions(+), 5 deletions(-)
> > > > >
> > > > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > > > index 627e57a88db2..24597b60c5b0 100644
> > > > > --- a/drivers/remoteproc/imx_rproc.c
> > > > > +++ b/drivers/remoteproc/imx_rproc.c
> > > > > @@ -18,6 +18,7 @@
> > > > >  #include <linux/of_reserved_mem.h>
> > > > >  #include <linux/platform_device.h>
> > > > >  #include <linux/pm_domain.h>
> > > > > +#include <linux/pm_runtime.h>
> > > > >  #include <linux/reboot.h>
> > > > >  #include <linux/regmap.h>
> > > > >  #include <linux/remoteproc.h>
> > > > > @@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
> > > > >  static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > > > >  {
> > > > >       struct device *dev = priv->dev;
> > > > > -     int ret;
> > > > > -     struct dev_pm_domain_attach_data pd_data = {
> > > > > -             .pd_flags = PD_FLAG_DEV_LINK_ON,
> > > > > -     };
> > > > > +     int ret, i;
> > > > > +     bool detached = true;
> > > > >
> > > > >       /*
> > > > >        * If there is only one power-domain entry, the platform driver framework
> > > > > @@ -902,7 +901,22 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > > > >       if (dev->pm_domain)
> > > > >               return 0;
> > > > >
> > > > > -     ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> > > > > +     ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> > > > > +     /*
> > > > > +      * If all the power domain devices are already turned on, the remote
> > > > > +      * core is already powered up and running when the kernel booted (e.g.,
> > > > > +      * started by U-Boot's bootaux command). In this case attach to it.
> > > > > +      */
> > > > > +     for (i = 0; i < ret; i++) {
> > > > > +             if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> > > > > +                     detached = false;
> > > > > +                     break;
> > > > > +             }
> > > > > +     }
> > > >
> > > > I was doing one final review of this work when I noticed the return code for
> > > > dev_pm_domain_attach_list() is never checked for error.
> > > 
> > > The for loop covers the error condition correctly, I think. It's only
> > > when ret >=1 when the loop should be started - and ret is propagated
> > > to the caller a few lines below.
> > > 
> > > >
> > > > Thanks,
> > > > Mathieu
> > > >
> > > 
> > > Kind regards
> > > Uffe
> > > 
> > > > > +
> > > > > +     if (detached)
> > > > > +             priv->rproc->state = RPROC_DETACHED;
> > > > > +
> > > > >       return ret < 0 ? ret : 0;
> > > > >  }
> > > > >
> > > > > @@ -1146,6 +1160,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
> > > > >               }
> > > > >       }
> > > > >
> > > > > +     if (dcfg->method == IMX_RPROC_SCU_API) {
> > > > > +             pm_runtime_enable(dev);
> > > > > +             ret = pm_runtime_resume_and_get(dev);
> > > > > +             if (ret) {
> > > > > +                     dev_err(dev, "pm_runtime get failed: %d\n", ret);
> > > > > +                     goto err_put_clk;
> > > > > +             }
> > > > > +     }
> > > > > +
> > > > >       ret = rproc_add(rproc);
> > > > >       if (ret) {
> > > > >               dev_err(dev, "rproc_add failed\n");
> > > > > @@ -1171,6 +1194,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
> > > > >       struct rproc *rproc = platform_get_drvdata(pdev);
> > > > >       struct imx_rproc *priv = rproc->priv;
> > > > >
> > > > > +     if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> > > > > +             pm_runtime_disable(priv->dev);
> > > > > +             pm_runtime_put(priv->dev);
> > > > > +     }
> > > > >       clk_disable_unprepare(priv->clk);
> > > > >       rproc_del(rproc);
> > > > >       imx_rproc_put_scu(rproc);
> > > > > --
> > > > > 2.39.5
> > > > >
> > 
> > Best Regards,
> > 
> > Hiago.
