Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177912376E1
	for <imx@lists.linux.dev>; Thu,  5 Jun 2025 13:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749129916; cv=none; b=bgNtok0pFUfXk1nbCDqNw3cenKiegdAPW2WVU/QSYEg8J0T8YCIYDe6fUVg2FX+NBrIaPpqFZIJQz4ThXQZyujdY80Rxv6nyfziLd7OA0DVYCXaA55eGnwPYIE0x/iWSdOyhTQJtH2c8sfqOpCU0nj2LSaRaE9xtf00amzSc1aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749129916; c=relaxed/simple;
	bh=XCqCr87fMiryN8wBVJwOIxfP6gD+dhX1Z/cb7SASagk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tl6tSrgTHSJgLb+18OVJbQlcMQum16mznZsyqYV/W7Zd/iwgDrD2/vl55DXHXfaCnW4JerGh6V3NufyjCXbF+iZsmHHujc0mqwGf5ErZa3fCrDtfQPPv5p3dNzaSkLXXAlp6ZyGEoCB5dIUAH/fwzACjZLskBE0ueZBkhMmj82I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ki72GuJN; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ki72GuJN"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so850835b3a.1
        for <imx@lists.linux.dev>; Thu, 05 Jun 2025 06:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749129913; x=1749734713; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FfxhwSOG/RM0gPvUyXeyOo3ZKbVYGqvyCyXESojdWoQ=;
        b=Ki72GuJN+/tNSioiiP23HDkDLxXKW0NkxirHLmMtvQVPph3CeDC+YxeNZElCyxcFvF
         bqJqpuVVWvpPB7Dg3Lw5IT+HfLqS8GmchOJsEnKIaddWhtsho8X9vPSESQRkGl1ByCn6
         Nesy0EI/tpemtB9tZymaUXNdvjriGAMDbXlC067/CSZrkRZdkoX4OkOjDSFG5TCFro83
         6ZweAybPYvB3lbpYI0lL29LpYJVAPatOof5raYkuaqpKgnopX5ree/JqhjSNhwU51sEQ
         KRQzfDn0Oy9uGsKliRY+ul7yLVEGyQ+1blyoOf+UA4Y2Mun9KujbiWT72oMPZy26ol6G
         NU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129913; x=1749734713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfxhwSOG/RM0gPvUyXeyOo3ZKbVYGqvyCyXESojdWoQ=;
        b=ivA7Gz78uadPTfaIX+4xPQCztDUtEDyPgwBQC3os750kT5022jo4QWOB3IdDPg/FaO
         e2UhieF6sEf3ZfAbqVzD3t8VK/kBJBSfdtR8zDUX8y+CzYHwXTB7LcmK0kRnJfBahcAi
         wfyVM23bzlhp9qC1ev4Dq+em+LC0DVPge7IFIjEqerFvAD8+v7BoRKf3gV9VdTKBgj0Y
         KUrPtD9FnVyi8uaGm3cfHT4Fk30wEwzHfd5SeniR9JjdfRCfbk4tEXxpBeX4NxOOy71A
         dDBZjP8wLkHvMGGGh3BPFtc4+xWRDqfZjen6vz1q2ehZLpy4viyhNL5Vqxx52xKGLrHQ
         4CIw==
X-Forwarded-Encrypted: i=1; AJvYcCVM8RsMMKVvWIs/qB4ciF8YvKbmlJAHXOf/Ki7G/01uVImX3Xo7AQPG3Inx/WKfUD4Qflo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwlqWBMT0o0k7ZL312knKis6HqpJPOEeSRAMxwla1oOBCa/qaZr
	kQl8TxvxRYIW7Ovj1j5AqFbmTNjSurZ8usdmj99HbZLWaeqsERIfI09Z
X-Gm-Gg: ASbGnct1l2LpYbPNWcqrOUWiCBTNtl/GtsHfdJxMmXyBYNgo94WeGgq4KplSzJSesMX
	n5rgwwxjj5t/ovHgQW+zI0y6vjfaCmJDiU1FbxzNQkjwQm7NkBJademOCMWYfuMahbVZEqL/yNf
	6/qSl5jcnvYjfY5ls27K5c/6BolXEFY3/u0NCKs48BTsc40mafVwOcCP4YX8EakLV4HMS8gOxux
	SobxmbVfuUE8wQJoWHvlqMCYIhXDqkn52CYRcvMqVt70AimC8W7MEKZvPLXnOvuHR0VHUEeRvjY
	R6i17ukAm9et9U9L32V5yWcobmOhuDwMQp9LWoiBdQTCB8yxqw==
X-Google-Smtp-Source: AGHT+IHQGzKHWpB4RSPbdx58AntCVZ2keB8gOeLail6WPggKiKp/eXtko5QLgS4IoilLjWPFK9AAoA==
X-Received: by 2002:a05:6a00:c83:b0:746:2ae9:fc49 with SMTP id d2e1a72fcca58-748184ab829mr4203417b3a.9.1749129913242;
        Thu, 05 Jun 2025 06:25:13 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeab79bsm13234842b3a.50.2025.06.05.06.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 06:25:12 -0700 (PDT)
Date: Thu, 5 Jun 2025 10:25:07 -0300
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
Message-ID: <20250605132507.2td5zlnlapraoggn@hiago-nb>
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

Hi Peng,

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

I will add it in a v5, thanks.

> 
> BTW: Has this patchset tested with M4 in a separate partition,
> saying M4 image packed in flash.bin?

Not yet, I will prepare this test today and let you know.

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
