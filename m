Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CE524887A
	for <imx@lists.linux.dev>; Thu, 12 Jun 2025 17:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749747948; cv=none; b=AE+V+y63cRb82Q+epvZW0Bh+8vqurU0WRZ/VJIiWqre5/9YpmiumiVQWgc1qJ4JhPrym1+nPu2YDv7XqWF2NrIdDTLb/YhbYSCMiPPieCPpQebAy5raifdSKcIWfjaSc3n1V5jHgz/iESiYPDf/lX25rUXyjcfDykQnqPE0KodM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749747948; c=relaxed/simple;
	bh=kp7aEMPbUMSH2lMITFiFi7o0hezza70a/vEZP//T9Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+YadMxzfOvo9oXMAhgjyz9f9o2f09TXA/q0566SK5Ucbh1CQzpuKqrN82w7lXTsUpMwu3SmssLKZYD5nEL0t8uXSZyQWj6JP/rzQ9VwmQaPvf1w78l9mQzad6aVcP1s3SBt1X5nj3C2XMZAoVm4KuA3JnIrw9R7SkPlOT6swG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XYOO7PZl; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XYOO7PZl"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3121aed2435so1501405a91.2
        for <imx@lists.linux.dev>; Thu, 12 Jun 2025 10:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749747946; x=1750352746; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cNxFg8PxKyiuoizCWNy+6ACkP8PYHeNOWM+dAdRlSGg=;
        b=XYOO7PZlT958Gw1Ftten/GF5amFNwUn+4q6swqkcU6etyGc2Rn3LnrPc1uNg5DTbYj
         sw6wVeNM9GraQozbKmqhrqs1RYXGuSnJt+2vMVhkeoiXnOfsxeQjC7MOgwf85ad3GfV/
         3ODsUJbN+8qlyy7AkvMP3mG7SCuyyVB7nqtJro+SDkLMhYZKwjj3Fu3JQMhEm4XhaOml
         wv0FL1EZP2gW8EKpe2UhqvKgwVOKErYYlNXMeeKNZo0NiQGx0HLQSls6o334C3i+Po/4
         2nbDvJ3erKgKEzpVTSjP+YeO0bqtFS5A7gvEyRclQgTRojEQyvpkDVpXnXUuHy7/iO01
         g41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749747946; x=1750352746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNxFg8PxKyiuoizCWNy+6ACkP8PYHeNOWM+dAdRlSGg=;
        b=i6n0uf0AK4gnIX4pMHtjVSKpprwcIMhmAenjiBAe1bxnbW2YrkebAyciAiE16KmWTb
         R5oBRkZ8uxp+mUWupH7GNyZ1WuONLydjV9BtTGvzsONlnZqtFz4BgfnOzmDJBbDpFeB5
         Cq2P1XQVIP93SIP4AGOdiR7w7yjm4QscDtY+DDulgITHSBsqlvpiOPHaGXr15UOb4BuM
         mv3fOwtv53i9nh2Qjs5dxrpvDy1cz60mmggGerVUSSiUQvnTnoFRMSok4Ko759A78qFP
         KqtKMJJz+2zInSp+TlzEWVP/XeK7SX8ZHVaqXRWpsXyIf8MGlr/JnqRp/9MGqTlGYSQy
         EGsg==
X-Forwarded-Encrypted: i=1; AJvYcCX6E0ozpmwrdH09RzMvsjT6qokgpZVwNnywuF5nBigAo288Zoa3mHrqqj4yzNVPb1vrYq4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQksZcUPEUj+xyEUhhDs+ThI5kpTWazohziyOkqC19onoPsR2A
	ac4TLo/ybb7ta//TapgM8wWAb29FEXwDd6kmVJcpJBlvg3m2BHKz9kv2
X-Gm-Gg: ASbGncs74DCPwUd5SMX+bpPM+6mM5pInB3ZD93qsPkcRpvQy8ta130oUDpfIttx5uim
	hB6m/w6MFKfeAR0/9S4oVtwljY+5beuF0hD/pK1+32mI1N+4lrGSgxwzbkrXPUMhWhChAQgUFqW
	2VyQYV5qkPr8oPiEjoRZAtm9ItlnZIOqxCf0/V8ac4xK/sQyH8JGClsEMXXl4Z6RIVHrOX7ebPq
	oWDUhlSqaeEbT+LShmsHZx33znXepG8clRKphFmhwxQAQhOmHXoesYBgo+Fn5j1vE1fhx0A0rkj
	osD2Y/IiCrWZzwipM9JipmjDqo12zmLtvXcxL1jm2YlnckUno9/bESCRdafP
X-Google-Smtp-Source: AGHT+IHhknZBtS5YbF0CJppl2HUlNUSeEzsngrk+Z0OR6pwaGzvadi+iraIcZLg169ex6XW9Mg09aQ==
X-Received: by 2002:a17:90b:2704:b0:313:1e60:584d with SMTP id 98e67ed59e1d1-313af12a2bcmr13383532a91.11.1749747946385;
        Thu, 12 Jun 2025 10:05:46 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19d2dd0sm1760004a91.17.2025.06.12.10.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 10:05:45 -0700 (PDT)
Date: Thu, 12 Jun 2025 14:05:40 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Peng Fan <peng.fan@nxp.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
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
Message-ID: <20250612170540.ulflkvws4nty5vz5@hiago-nb>
References: <20250602131906.25751-1-hiagofranco@gmail.com>
 <20250602131906.25751-4-hiagofranco@gmail.com>
 <PAXPR04MB84594F9ABDF0728D9A71FAFE886CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <wlcbd6tgwptv25ms2xfpqo5xkfoczg3l5kr6jae6qamdevmvbt@3ikiy7i53qy2>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wlcbd6tgwptv25ms2xfpqo5xkfoczg3l5kr6jae6qamdevmvbt@3ikiy7i53qy2>

Hi Bjorn,

On Wed, Jun 11, 2025 at 10:36:33AM -0500, Bjorn Andersson wrote:
> On Wed, Jun 04, 2025 at 03:19:52AM +0000, Peng Fan wrote:
> > > Subject: [PATCH v4 3/3] remoteproc: imx_rproc: detect and attach to
> > > pre-booted remote cores
> > > 
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > 
> > > When the remote core is started before Linux boots (e.g., by the
> > > bootloader), the driver currently is not able to attach because it only
> > > checks for cores running in different partitions. If the core was kicked
> > > by the bootloader, it is in the same partition as Linux and it is already
> > > up and running.
> > > 
> > > This adds power mode verification through dev_pm_genpd_is_on(),
> > > enabling the driver to detect when the remote core is already running
> > > and properly attach to it if all the power domain devices are on.
> > > 
> > > To accomplish this, we need to avoid passing any attach_data or flags
> > > to dev_pm_domain_attach_list(), letting the platform device become a
> > > consumer of the power domain provider. With that the current power
> > > state of the genpds will not change, allowing the detection of the
> > > remote core power state.
> > > 
> > > We enable and sync the device runtime PM during probe to make sure
> > > the power domains are correctly managed when the core is controlled
> > > by the kernel.
> > > 
> > > Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > ---
> > > v4: Changed to use the new dev_pm_genpd_is_on() function instead,
> > > as suggested by Ulf. This will now get the power status of the two
> > > remote cores power domains to decided if imx_rpoc needs to attach or
> > > not. In order to do that, pm_runtime_enable() and
> > > pm_runtime_get_sync() were introduced and pd_data was removed.
> > > v3: Unchanged.
> > > v2: Dropped unecessary include. Removed the imx_rproc_is_on
> > > function, as suggested.
> > > v1:
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 29 ++++++++++++++++++++++++-----
> > >  1 file changed, 24 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/imx_rproc.c
> > > b/drivers/remoteproc/imx_rproc.c index
> > > 627e57a88db2..6f9680142704 100644
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
> > > @@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct
> > > notifier_block *nb,  static int imx_rproc_attach_pd(struct imx_rproc
> > > *priv)  {
> > >  	struct device *dev = priv->dev;
> > > -	int ret;
> > > -	struct dev_pm_domain_attach_data pd_data = {
> > > -		.pd_flags = PD_FLAG_DEV_LINK_ON,
> > > -	};
> > > +	int ret, i;
> > > +	bool detached = true;
> > > 
> > >  	/*
> > >  	 * If there is only one power-domain entry, the platform driver
> > > framework @@ -902,7 +901,22 @@ static int
> > > imx_rproc_attach_pd(struct imx_rproc *priv)
> > >  	if (dev->pm_domain)
> > >  		return 0;
> > > 
> > > -	ret = dev_pm_domain_attach_list(dev, &pd_data, &priv-
> > > >pd_list);
> > > +	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> > > +	/*
> > > +	 * If all the power domain devices are already turned on, the
> > > remote
> > > +	 * core is already up when the kernel booted (e.g. kicked by
> > > the
> > > +	 * bootloader). In this case attach to it.
> > > +	 */
> > > +	for (i = 0; i < ret; i++) {
> > > +		if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> > > +			detached = false;
> > > +			break;
> > > +		}
> > > +	}
> > > +
> > > +	if (detached)
> > > +		priv->rproc->state = RPROC_DETACHED;
> > > +
> > >  	return ret < 0 ? ret : 0;
> > >  }
> > > 
> > > @@ -1146,6 +1160,11 @@ static int imx_rproc_probe(struct
> > > platform_device *pdev)
> > >  		}
> > >  	}
> > > 
> > > +	if (dcfg->method == IMX_RPROC_SCU_API) {
> > > +		pm_runtime_enable(dev);
> > > +		pm_runtime_get_sync(dev);
> > 
> > Need put and disable in imx_rproc_remove.
> > 
> 
> Note that you also need to pm_runtime_put() if pm_runtime_get_sync()
> returns an error. So the suggestion is to use the convenience helper
> pm_runtime_resume_and_get() to handle this for you.
> 
> Probably a good idea to check the return value regardless.

Thanks for the review, noted, I can include this in the next version.

> 
> Regards,
> Bjorn
> 
> > BTW: Has this patchset tested with M4 in a separate partition,
> > saying M4 image packed in flash.bin?
> > 
> > Regards,
> > Peng
> > > +	}
> > > +
> > >  	ret = rproc_add(rproc);
> > >  	if (ret) {
> > >  		dev_err(dev, "rproc_add failed\n");
> > > --
> > > 2.39.5
> > > 
> >

Best Regards,
Hiago.
