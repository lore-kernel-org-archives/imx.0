Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C5C219A8E
	for <imx@lists.linux.dev>; Mon,  9 Jun 2025 17:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749490286; cv=none; b=gJX1j7nta6+oWpJv8rcoZ4mbudyfMFKZxzTSV7tYWe73B6+Lb+KHlABWujpXkbSvTmL42AYosEM++mGwFy0XFunaeWltJgFEAZ477rlXAKFPKeAxBdhsoOALN/Qdk9tMHgpdt9xyWxql9LzcFSWwGaEAh2IZC2NiI/NXWWzbo2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749490286; c=relaxed/simple;
	bh=8LBJLyj0kgr4c05PRceO/pKC3cvZqpYuU4UKLWl6TZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kPkX9lp0PBDRv0isXnwsBibJ0WRw9ojgcDG4LbiGv9QcXE69hKmdgMK+HqaNjYnoKXvZhA1Atz3DnR/9YK38qJn9G0bgVXwUEq6X/q5XoV7PMerTSWpLt9WTjxZU+IEo23IG+9E8NstXHGUsoRO4FlEQCG0I220My1NqD+5VQY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cwt92llG; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cwt92llG"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5308d2d76f4so1529751e0c.0
        for <imx@lists.linux.dev>; Mon, 09 Jun 2025 10:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749490283; x=1750095083; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v0Qu66z7kDW3js03KQPZ0HZb8QpcE1+x1gXTQ8PQnaU=;
        b=Cwt92llGNOmrPHT0JfLnbgjAR0VbSfX+8Jqy6V/ctdFLz1avyfqaiviaZOdtrJCdRU
         QekMwvVt4n9lUQCOm+7AX/dJYaDpZqMvXl7IYGAd1LErmIT2eNrNi9jmfjoWxbC818gA
         VYbF0YQ7A+I1p+grYDY3Tbw6xsOjhn4pjuhkr7yCsQMidRHs0oM1NFBRQs9v8scFljDg
         qqdNsdwzcuBHkcVLpT/E9CmU8uZgPJ/buVCtlQgjBQi+JHUPmBRpLDfrGZMkQgGaWsmZ
         VSk76o8YKkxP6jxKtqmJf7BHIdcdhyMjGbVXBPQDkwK/ry8GslgEp6pvYytKfEBDtEay
         OEbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749490283; x=1750095083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0Qu66z7kDW3js03KQPZ0HZb8QpcE1+x1gXTQ8PQnaU=;
        b=pCpdDwEprX060k/fUxgJqs+sJUnCrE9w9RKckJyKRYMfpM3+2f+NI9/KcesY0h632j
         zpnVZAOinAr6OEASmAGy/oJovXcjQWsXEpGa7Qt7aQUILTaXqh1YT23dFVEqBytFzuZP
         OE2hfR3Yu9vVSaHAnn2I1fDj324+j5iMNnBbi+BV2cGfBaOnj8UhItD4/Hqq/4pdEjd0
         2rejOIH6j+ipo8nRnQ4/r+8lPayofT/Y0j3KcC+EZFc4o8dWI261TuUisl5RciNpVQcE
         x/b6bHrPzr8krl0r3PTmPkYcHeuUrnG62DivrNlKi1VeDJm45EiJdvibUlsJcaEHZs+l
         e1BA==
X-Forwarded-Encrypted: i=1; AJvYcCV3NfKVRWtABhdGF5gPFEi7KYHaHpskHaKwC0Ze14837z9NDJn67OxR5Q2cqC7lAZc/nL0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxxlMBCQDNoEBqsRx04ZvvnhgNQcm/JmxB02j2TlczE/g0UOBf1
	tlL3TGAQjIWhtoMSsHTnyqhErTzfcTXUjiKrgjDa1bApNDPMR39EXYXM
X-Gm-Gg: ASbGncuZvr1YqTpftiNTshUbREpqrHU+f307i0ezpObXNQNQ0DTM2+aGQWvwc17p6EF
	XPWsy9wuu95v6XofuIOs0TUgG83ArK3RPF8b5bES4xb+HBngx/9cEsviV6YMcvYhZB8L+Uhu1r5
	1qe3Osy/DEC5ZVBNb7f0NogvhUTob98oh2e+rYh/5QA3lL4k8MGpEHF+AsaImVYSEEoj+QOBKsH
	nMqlk8X2DpqWssbNULcy7KCsh4GJpVDgJlrG+V23IjMZ3R3BDKeuDYCRb1ndN4AH8dkbaEQUOPq
	c0HkNVvecyBF4CkZyAk6EfIU0sJoKEvifKqtmo9La+P40jTRvQ==
X-Google-Smtp-Source: AGHT+IGzoebj1QMPet5l8I9qWvt9vrbw2pGLKm4WGcWKCZt5wa18t6jdZYC5Lc1lX0z+RxP/znejvw==
X-Received: by 2002:a05:6122:8d1:b0:52b:789:2d0 with SMTP id 71dfb90a1353d-530e47ed0a2mr11738050e0c.5.1749490282233;
        Mon, 09 Jun 2025 10:31:22 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53113abd74bsm32564e0c.17.2025.06.09.10.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 10:31:21 -0700 (PDT)
Date: Mon, 9 Jun 2025 14:31:15 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	"Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v4 3/3] remoteproc: imx_rproc: detect and attach to
 pre-booted remote cores
Message-ID: <20250609173115.qecc2noswkcgr3hm@hiago-nb>
References: <20250602131906.25751-1-hiagofranco@gmail.com>
 <20250602131906.25751-4-hiagofranco@gmail.com>
 <PAXPR04MB84594F9ABDF0728D9A71FAFE886CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB84594F9ABDF0728D9A71FAFE886CA@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Wed, Jun 04, 2025 at 03:19:52AM +0000, Peng Fan wrote:
> > Subject: [PATCH v4 3/3] remoteproc: imx_rproc: detect and attach to
> > pre-booted remote cores
> > 
> > From: Hiago De Franco <hiago.franco@toradex.com>
> > 
> > When the remote core is started before Linux boots (e.g., by the
> > bootloader), the driver currently is not able to attach because it only
> > checks for cores running in different partitions. If the core was kicked
> > by the bootloader, it is in the same partition as Linux and it is already
> > up and running.
> > 
> > This adds power mode verification through dev_pm_genpd_is_on(),
> > enabling the driver to detect when the remote core is already running
> > and properly attach to it if all the power domain devices are on.
> > 
> > To accomplish this, we need to avoid passing any attach_data or flags
> > to dev_pm_domain_attach_list(), letting the platform device become a
> > consumer of the power domain provider. With that the current power
> > state of the genpds will not change, allowing the detection of the
> > remote core power state.
> > 
> > We enable and sync the device runtime PM during probe to make sure
> > the power domains are correctly managed when the core is controlled
> > by the kernel.
> > 
> > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > ---
> > v4: Changed to use the new dev_pm_genpd_is_on() function instead,
> > as suggested by Ulf. This will now get the power status of the two
> > remote cores power domains to decided if imx_rpoc needs to attach or
> > not. In order to do that, pm_runtime_enable() and
> > pm_runtime_get_sync() were introduced and pd_data was removed.
> > v3: Unchanged.
> > v2: Dropped unecessary include. Removed the imx_rproc_is_on
> > function, as suggested.
> > v1:
> > ---
> >  drivers/remoteproc/imx_rproc.c | 29 ++++++++++++++++++++++++-----
> >  1 file changed, 24 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/imx_rproc.c
> > b/drivers/remoteproc/imx_rproc.c index
> > 627e57a88db2..6f9680142704 100644
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
> > @@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct
> > notifier_block *nb,  static int imx_rproc_attach_pd(struct imx_rproc
> > *priv)  {
> >  	struct device *dev = priv->dev;
> > -	int ret;
> > -	struct dev_pm_domain_attach_data pd_data = {
> > -		.pd_flags = PD_FLAG_DEV_LINK_ON,
> > -	};
> > +	int ret, i;
> > +	bool detached = true;
> > 
> >  	/*
> >  	 * If there is only one power-domain entry, the platform driver
> > framework @@ -902,7 +901,22 @@ static int
> > imx_rproc_attach_pd(struct imx_rproc *priv)
> >  	if (dev->pm_domain)
> >  		return 0;
> > 
> > -	ret = dev_pm_domain_attach_list(dev, &pd_data, &priv-
> > >pd_list);
> > +	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> > +	/*
> > +	 * If all the power domain devices are already turned on, the
> > remote
> > +	 * core is already up when the kernel booted (e.g. kicked by
> > the
> > +	 * bootloader). In this case attach to it.
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
> >  	return ret < 0 ? ret : 0;
> >  }
> > 
> > @@ -1146,6 +1160,11 @@ static int imx_rproc_probe(struct
> > platform_device *pdev)
> >  		}
> >  	}
> > 
> > +	if (dcfg->method == IMX_RPROC_SCU_API) {
> > +		pm_runtime_enable(dev);
> > +		pm_runtime_get_sync(dev);
> 
> Need put and disable in imx_rproc_remove.
> 
> BTW: Has this patchset tested with M4 in a separate partition,
> saying M4 image packed in flash.bin?

Sorry for the delay.

I tested it now and there must be something missing on my U-Boot:

Disable imx8x-cm4 rsrc 278 not owned
Disable imx8x-cm4 rsrc 297 not owned

It removes my nodes from the DT before starting the kernel, so I cannot
attach. Do you know what should I do in this case?

But apart from that, at least the imx-rproc does not crash or anything.

> 
> Regards,
> Peng
> > +	}
> > +
> >  	ret = rproc_add(rproc);
> >  	if (ret) {
> >  		dev_err(dev, "rproc_add failed\n");
> > --
> > 2.39.5
> > 
> 

Best Regards,
Hiago.
