Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737064A00
	for <imx@lists.linux.dev>; Tue, 24 Jun 2025 16:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750781790; cv=none; b=dy5tBXBU24NU3JM9zx49LJ0C+IrCGMIbAuReK13KTkiJETpSqzGV5sy5a5jgY4I7ecljY4NnmvdquFVGig/3GaCAjQxSCxuZKrt6K6wWp5Cd4v/mqKcX4X5LHJpYXUK/bheUca7O5+CNh+nZVeImGo98HBFLlKdCSIUwfXzuOAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750781790; c=relaxed/simple;
	bh=Ful3X5gaG+VN/GcBJoWOhNCCpGbKmM2mX6QOM+vLVE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxkVzGe1wq0q9yBA2UoWtyd5EqnGRiG4nHe1plwEbV1VU0xCHqEaR6Z5IuBiWQLh0q017rmul1D/0dkp1RRvbNXyi0q0Slhf1tPVm+TAoo/yfttGs0koEEF0EnN+Fgu/F06LxQvawHZTnsuaJ7As2zRbdl4JUh4K1N0c9MnB1PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxHdtHqg; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxHdtHqg"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-235ea292956so60254445ad.1
        for <imx@lists.linux.dev>; Tue, 24 Jun 2025 09:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750781788; x=1751386588; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/870Boz396KhiKkW2Y/w4rRxMqu8ONnC6P23AzGhkmE=;
        b=BxHdtHqg8MrEu7N7U4hC0o5fDuLj23I8CJiutwHduvCvrRs2+TMMk2sZz3lnzJJZTh
         pxldXWTXrsgSeGYocO/1NSfHj1Ob8zn+4Ma38Ksd6iwFVRZ18EQZvtrJuoInJ1baf7eT
         nY4Xm44f7cB6Mna6pMyeDDVzA/t4Cj0F3ZoMLPN+JMYYfULX6PHilQMKC4zEJ8QVbP0y
         jU1XMp/mbX2GlDQ+mkqGlS6ngN11IX7dyq53R4/Erep2qeHSCNqoXLMLocj0fCj5oEmj
         Qo5zbTMyEUEUEAz0SEL3JeVG+zdufId7lx4Ts3aF3qhQ0MYDmL1LGpwGFgbqLatWOCjD
         /uQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750781788; x=1751386588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/870Boz396KhiKkW2Y/w4rRxMqu8ONnC6P23AzGhkmE=;
        b=Q4DvAEpPF1KVI3AgJu2Siy3Utxn+CEeL323tR9sJ4NZqUsI9L0RJGVKTVugT0ten3+
         TYcvQL1OndS4SIFxZcTSWoRvd0VeFAzW3/0vFzr5p3Lujxnez40Mm5jTH1QXlzDQQJsU
         rSgFrUC6zIdlYo6P8zFZPwcInKW/a4+mqkgGaxSLFwqmrDuaMF+ugvFqeatunzbu1/oa
         BEjLyPxfiB44NJcfR81xFXH7sLmS0zcOpu1WyH/yShryy1+/1GjRg7UJRfV/0Cf/pWGS
         TVrqr3L4rvJpx4eprEff885J3n2EiemZ6MKRjwhPc0GDMXwkRsZAK0q0jXN34LqBCWvT
         Vfbg==
X-Forwarded-Encrypted: i=1; AJvYcCXbP0DJkCT+PQnVBSynRLEeOrtCQ8uKrqQxmr1vNNUoOI1+kuJ+O+3e9w1EurzIn2QsQyU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGo1+AQ7C7I53/qtcnt0xGF3wm5DzRx1C/+mmn1V+expcKiDvv
	MJX53QY5DFs0p3/e4vvk+wAhQDjhBqilFCZtXgEb4FRVYdD920Fdh4sa
X-Gm-Gg: ASbGncvqFB0AsuQS0tRYRGMtz1wj/k55DYOVH/AVu2QWamvcmdCXOOQX2GvVDTHqzt2
	5KFu5YVXAJCwVPH3ahOMmNqr4lqHWhiZ74BDf9PgcEtPdXYvTLNQFsezDnRYVF4jIGWPCsHlbEm
	dKBecJA15n9GY5AXttORjzOFsKh7L/yG6ClJDf/eaf/HIKtkRPXEQ+t6r2ZV6CWbnYO4mJRSp11
	IsKPFVdFcLumaoHApRf6Cim6aqfBUog/y61k8SzF8N6srekytB5TonzXgpbiXvw0WqLsfgNAmwC
	KhYQpfxN78i8Twf4zJ1CTILGDHOSG6G5/vIkZe6b9vUX9EVLmsyzYk+ETKA=
X-Google-Smtp-Source: AGHT+IEB7+JGugYqV5zduLPORaFjWnC/NvHOQ1eCIFSqcy93HLbICht89vczTaXjsuDyhkTFRVgqjQ==
X-Received: by 2002:a17:902:ce8c:b0:235:880:cf8a with SMTP id d9443c01a7336-237d97fbc21mr269719685ad.15.1750781787597;
        Tue, 24 Jun 2025 09:16:27 -0700 (PDT)
Received: from hiagonb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23809a8ee2esm16496185ad.227.2025.06.24.09.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 09:16:26 -0700 (PDT)
Date: Tue, 24 Jun 2025 13:16:21 -0300
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
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v5 3/3] remoteproc: imx_rproc: detect and attach to
 pre-booted remote cores
Message-ID: <20250624161621.fezba5p3dmecnor6@hiagonb>
References: <20250617193450.183889-1-hiagofranco@gmail.com>
 <20250617193450.183889-4-hiagofranco@gmail.com>
 <aFly61yCMttkp12e@p14s>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFly61yCMttkp12e@p14s>

On Mon, Jun 23, 2025 at 09:29:47AM -0600, Mathieu Poirier wrote:
> On Tue, Jun 17, 2025 at 04:34:50PM -0300, Hiago De Franco wrote:
> > From: Hiago De Franco <hiago.franco@toradex.com>
> > 
> > When the remote core is started before Linux boots (e.g., by the
> > bootloader), the driver currently is not able to attach because it only
> > checks for cores running in different partitions. If the core was kicked
> 
> Again, we have a nomenclature issue here with "If the core was kicked by the
> bootloader".  What does "kicked" mean here?  Is it just powered and held in
> reset or is it executing.  And are you referring to the A core or the M core?

Ok, same here, I will improve this in the next revision. Thanks.

> 
> 
> > by the bootloader, it is in the same partition as Linux and it is
> > already up and running.
> > 
> > This adds power mode verification through dev_pm_genpd_is_on(), enabling
> > the driver to detect when the remote core is already running and
> > properly attach to it if all the power domain devices are on.
> > 
> > To accomplish this, we need to avoid passing any attach_data or flags to
> > dev_pm_domain_attach_list(), letting the platform device become a
> > consumer of the power domain provider. With that the current power state
> > of the genpds will not change, allowing the detection of the remote core
> > power state.
> > 
> > We enable and sync the device runtime PM during probe to make sure the
> > power domains are correctly managed when the core is controlled by the
> > kernel.
> > 
> > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > ---
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
> > index 627e57a88db2..b53083f2553e 100644
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
> > +	 * core is already up when the kernel booted (e.g. kicked by the
> > +	 * bootloader). In this case attach to it.
> 
> Same comment as above.  What got kicked?  A core or M core.  And what does
> "kicked" mean?  I can guess what is happening but guessing rarely leads to
> anything positive.
> 
> In the next revision, please use other words than "kicked".

Noted, thanks.

> 
> 
> > +	 */
> > +	for (i = 0; i < ret; i++) {
> > +		if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> > +			detached = false;
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (detached)
> > +		priv->rproc->state = RPROC_DETACHED;
> > +
> 
> Ok for the above.
> 
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
