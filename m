Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9951A840A
	for <imx@lists.linux.dev>; Wed, 16 Jul 2025 13:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752672363; cv=none; b=Ij9Hqo8+ghui8mzatcAwobYK6N6dj9PqBabwQVcH4LRc5NCwFqm4H35zv1kWXLazP1mteOdbb1ksT5oJS8FqoBJbO4NO9P1b0jOL6y5my5AP+pgBJgXwgvsTwADfu/H9X8vGeOxAuQ74MrjyJbzzCG5RFRjYJ7z6fwORRDFIHwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752672363; c=relaxed/simple;
	bh=dbxzvjuh8YM2u5ndqzlAhVP/gpf1B58HzI5D6CUG4TY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=QnewrVgLAZmT1yAjQrBpcwAF9tuYpIWsL2bHoeeuSN285FH5G48COypRR3S51dCl5umK0pJvjukOXnC9wX3IOkWfpL+zYOhIXzxdzL04mzBIXOZW04xOcBay+Qt9rBTSG/gOjRUlytNxrXbXIl64dJNDENhwRwfIoKdNbrNSQ+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4YzhW+M; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4YzhW+M"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-87f74a28a86so5617304241.2
        for <imx@lists.linux.dev>; Wed, 16 Jul 2025 06:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752672360; x=1753277160; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d6kfc10B6ok/s3QG/0BYXTIDoit26JaipG2QuAEmJ7I=;
        b=P4YzhW+MwgoMxKwSE/tGkgwVtePXANdui0rVTWlf5wnFgCGCFRl7hv8wC7n+8/iUKG
         XiSuuCp35Axlpe6nSdxecsBoFzGAuhVnVr+W0jaoyoYbnwjLZxiOMR9zFoJk+IIY5klq
         BquHpxc92BMzNTPUYRcS4bLLURAu18S2FOf6gTTrHlHJEdabxDeGeggcXL9somAodDa3
         yJ2oGcJiz31PiI3xge98lytIPmU3eUW3BZ2L5+cJOdLpKd2YBTduEWDycWpxTqVts3jB
         FaJkBKOKoTp6R3aZk7Of0cGx/0FRAfFF89KDk4mHJun62x93YPmPaYcj9/gjsTfpCp2q
         HsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752672360; x=1753277160;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6kfc10B6ok/s3QG/0BYXTIDoit26JaipG2QuAEmJ7I=;
        b=mWf1n/BXpavar/EHWYK/cai0nuYlWFdiXlrH2L2kEP8aZKA1rr00RZRhzs9f1O+/h0
         egauF/OogNGjZGLG1U5u17b1yS9NBT+GdYQl+S19MXr0nezh+5qQFisM7Ml8ROVTZjbU
         vblzkafBzcIZGtIfV6fJUmeHgkGoqtpZHtIq9spK2L38NRUi3mvQ/mJEueJzTzrb+wvw
         WeP+uNoeOVDQgeCySh6C+TN7h67uvdUse3y0ngzleB38OUNWASpdrm+Q36Z5p/pC0clx
         nR6N6cafnmnnV1vZ/5DU7OL+pYPD9PWuQGtPwfqFZrqhyqqqSrz3rGnepGZksfAINDGt
         ZOxw==
X-Forwarded-Encrypted: i=1; AJvYcCUiUJDySvsJYAYBbaQi7DDvRCPJIV9OvVcyV0Z/alz3KAwzjKzON8P4Cv7MS4oTbwSvhTg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxljF93evPvatSSbG0j/OzmN8F/RPt1NtORYztZg1jNj6n92x3f
	ERjoRT4Q734zz0fMIOqDJUXHfqDkR7ALUoczKd7o7opBULMgusn8HX1JFcnI9aM7
X-Gm-Gg: ASbGncuhkODSTBxG0Vmma6gdpkdDeSy02r/DkFgLN+1gfOJVK6zh+kUGBf8A9Iut3pG
	VmDqyV5knfZKTH7QRbZMj3cSYbY7aHIiFJDHOavhtzPmaqF7kGGdv3AFD7xt5v+Mo8ZmNxtleBh
	6Q13Oi2SUxsgRfUGvYtyd4hH4dMcCAUxn6JS0RU4iHrS0BQURMMK2t3Uzhe13v3xsytV8YnU7e5
	KGmVb4fsU8hKUYLeMqzQkbFwlLXfdJ2NWwacVxoBZZX0Zj00MC4+YrIWaXc7/J+XP3dxo+btTfo
	BnFUn/73E57E8zUeEA3rF4Lv03emimBRwGmCo/J+Nn6+xJ+UJEErAgqGW8Xv2qf5MHFt49pY+M2
	dsrq9MyogbbZgBeSeGkw=
X-Google-Smtp-Source: AGHT+IGLZtQSK5F5avY+4+/nRGti/F+DWgaDPqtV4DEb2TtE0xcBhcqnIWzqD/MfxQq4TFm15BZo2w==
X-Received: by 2002:a05:6102:808d:b0:4e5:fe5e:2be4 with SMTP id ada2fe7eead31-4f89999f155mr1651316137.22.1752672359482;
        Wed, 16 Jul 2025 06:25:59 -0700 (PDT)
Received: from hiagonb ([2804:1b3:a7c1:459e:e3dd:d2e:b1ee:b9ec])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-888ec44ad97sm3105837241.25.2025.07.16.06.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 06:25:58 -0700 (PDT)
Date: Wed, 16 Jul 2025 10:25:52 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
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
Message-ID: <20250716132552.bra37ucw4fcjwril@hiagonb>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHZ0nK4ZZShAr6Xz@p14s>
 <CAPDyKFrWng0CY-ayKoEbnS_yanghSqogxfuizxEVbVogJ4DT=g@mail.gmail.com>

Hi Mathieu, Ulf,

On Tue, Jul 15, 2025 at 09:32:44AM -0600, Mathieu Poirier wrote:
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
> >  	struct device *dev = priv->dev;
> > -	int ret;
> > -	struct dev_pm_domain_attach_data pd_data = {
> > -		.pd_flags = PD_FLAG_DEV_LINK_ON,
> > -	};
> > +	int ret, i;
> > +	bool detached = true;
> >  
> >  	/*
> >  	 * If there is only one power-domain entry, the platform driver framework
> > @@ -902,7 +901,22 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
> >  	if (dev->pm_domain)
> >  		return 0;
> >  
> > -	ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> > +	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> > +	/*
> > +	 * If all the power domain devices are already turned on, the remote
> > +	 * core is already powered up and running when the kernel booted (e.g.,
> > +	 * started by U-Boot's bootaux command). In this case attach to it.
> > +	 */
> > +	for (i = 0; i < ret; i++) {
> > +		if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> > +			detached = false;
> > +			break;
> > +		}
> > +	}
> 
> I was doing one final review of this work when I noticed the return code for
> dev_pm_domain_attach_list() is never checked for error.

As Ulf pointed out, the 'return' a few lines below will return the
negative value to the caller of 'imx_rproc_attach_pd', which ultimately
will fail 'imx_rproc_detect_mode' and fail the probe of imx_rproc.

Please notice that even tough 'dev_pm_domain_attach_list' fails, the
rproc->state will still be set as RPROC_DETACHED because we are starting
'detached' as true, but I am not seeing this as an issue because as
mentioned above the probe will fail anyway. Please let me know if you
see this as an issue.

> 
> Thanks,
> Mathieu
> 
> > +
> > +	if (detached)
> > +		priv->rproc->state = RPROC_DETACHED;
> > +
> >  	return ret < 0 ? ret : 0;
> >  }
> >  
> > @@ -1146,6 +1160,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
> >  		}
> >  	}
> >  
> > +	if (dcfg->method == IMX_RPROC_SCU_API) {
> > +		pm_runtime_enable(dev);
> > +		ret = pm_runtime_resume_and_get(dev);
> > +		if (ret) {
> > +			dev_err(dev, "pm_runtime get failed: %d\n", ret);
> > +			goto err_put_clk;
> > +		}
> > +	}
> > +
> >  	ret = rproc_add(rproc);
> >  	if (ret) {
> >  		dev_err(dev, "rproc_add failed\n");
> > @@ -1171,6 +1194,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
> >  	struct rproc *rproc = platform_get_drvdata(pdev);
> >  	struct imx_rproc *priv = rproc->priv;
> >  
> > +	if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> > +		pm_runtime_disable(priv->dev);
> > +		pm_runtime_put(priv->dev);
> > +	}
> >  	clk_disable_unprepare(priv->clk);
> >  	rproc_del(rproc);
> >  	imx_rproc_put_scu(rproc);
> > -- 
> > 2.39.5
> > 

On Tue, Jul 15, 2025 at 06:03:44PM +0200, Ulf Hansson wrote:
> On Tue, 15 Jul 2025 at 17:32, Mathieu Poirier
> <mathieu.poirier@linaro.org> wrote:
> >
> > On Sun, Jun 29, 2025 at 02:25:12PM -0300, Hiago De Franco wrote:
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > >
> > > When the Cortex-M remote core is started and already running before
> > > Linux boots (typically by the Cortex-A bootloader using a command like
> > > bootaux), the current driver is unable to attach to it. This is because
> > > the driver only checks for remote cores running in different SCFW
> > > partitions. However in this case, the M-core is in the same partition as
> > > Linux and is already powered up and running by the bootloader.
> > >
> > > This patch adds a check using dev_pm_genpd_is_on() to verify whether the
> > > M-core's power domains are already on. If all power domain devices are
> > > on, the driver assumes the M-core is running and proceed to attach to
> > > it.
> > >
> > > To accomplish this, we need to avoid passing any attach_data or flags to
> > > dev_pm_domain_attach_list(), allowing the platform device become a
> > > consumer of the power domain provider without changing its current
> > > state.
> > >
> > > During probe, also enable and sync the device runtime PM to make sure
> > > the power domains are correctly managed when the core is controlled by
> > > the kernel.
> > >
> > > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > ---
> > > v6 -> v7:
> > >  - Added Peng reviewed-by.
> > > v5 -> v6:
> > >  - Commit description improved, as suggested. Added Ulf Hansson reviewed
> > >    by. Comment on imx-rproc.c improved.
> > > v4 -> v5:
> > >  - pm_runtime_get_sync() removed in favor of
> > >    pm_runtime_resume_and_get(). Now it also checks the return value of
> > >    this function.
> > >  - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove()
> > >    function.
> > > v3 -> v4:
> > >  - Changed to use the new dev_pm_genpd_is_on() function instead, as
> > >    suggested by Ulf. This will now get the power status of the two
> > >    remote cores power domains to decided if imx_rpoc needs to attach or
> > >    not. In order to do that, pm_runtime_enable() and
> > >    pm_runtime_get_sync() were introduced and pd_data was removed.
> > > v2 -> v3:
> > >  - Unchanged.
> > > v1 -> v2:
> > >  - Dropped unecessary include. Removed the imx_rproc_is_on function, as
> > >    suggested.
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++++++++++-----
> > >  1 file changed, 32 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > index 627e57a88db2..24597b60c5b0 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -18,6 +18,7 @@
> > >  #include <linux/of_reserved_mem.h>
> > >  #include <linux/platform_device.h>
> > >  #include <linux/pm_domain.h>
> > > +#include <linux/pm_runtime.h>
> > >  #include <linux/reboot.h>
> > >  #include <linux/regmap.h>
> > >  #include <linux/remoteproc.h>
> > > @@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
> > >  static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > >  {
> > >       struct device *dev = priv->dev;
> > > -     int ret;
> > > -     struct dev_pm_domain_attach_data pd_data = {
> > > -             .pd_flags = PD_FLAG_DEV_LINK_ON,
> > > -     };
> > > +     int ret, i;
> > > +     bool detached = true;
> > >
> > >       /*
> > >        * If there is only one power-domain entry, the platform driver framework
> > > @@ -902,7 +901,22 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
> > >       if (dev->pm_domain)
> > >               return 0;
> > >
> > > -     ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> > > +     ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> > > +     /*
> > > +      * If all the power domain devices are already turned on, the remote
> > > +      * core is already powered up and running when the kernel booted (e.g.,
> > > +      * started by U-Boot's bootaux command). In this case attach to it.
> > > +      */
> > > +     for (i = 0; i < ret; i++) {
> > > +             if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> > > +                     detached = false;
> > > +                     break;
> > > +             }
> > > +     }
> >
> > I was doing one final review of this work when I noticed the return code for
> > dev_pm_domain_attach_list() is never checked for error.
> 
> The for loop covers the error condition correctly, I think. It's only
> when ret >=1 when the loop should be started - and ret is propagated
> to the caller a few lines below.
> 
> >
> > Thanks,
> > Mathieu
> >
> 
> Kind regards
> Uffe
> 
> > > +
> > > +     if (detached)
> > > +             priv->rproc->state = RPROC_DETACHED;
> > > +
> > >       return ret < 0 ? ret : 0;
> > >  }
> > >
> > > @@ -1146,6 +1160,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
> > >               }
> > >       }
> > >
> > > +     if (dcfg->method == IMX_RPROC_SCU_API) {
> > > +             pm_runtime_enable(dev);
> > > +             ret = pm_runtime_resume_and_get(dev);
> > > +             if (ret) {
> > > +                     dev_err(dev, "pm_runtime get failed: %d\n", ret);
> > > +                     goto err_put_clk;
> > > +             }
> > > +     }
> > > +
> > >       ret = rproc_add(rproc);
> > >       if (ret) {
> > >               dev_err(dev, "rproc_add failed\n");
> > > @@ -1171,6 +1194,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
> > >       struct rproc *rproc = platform_get_drvdata(pdev);
> > >       struct imx_rproc *priv = rproc->priv;
> > >
> > > +     if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> > > +             pm_runtime_disable(priv->dev);
> > > +             pm_runtime_put(priv->dev);
> > > +     }
> > >       clk_disable_unprepare(priv->clk);
> > >       rproc_del(rproc);
> > >       imx_rproc_put_scu(rproc);
> > > --
> > > 2.39.5
> > >

Best Regards,

Hiago.
