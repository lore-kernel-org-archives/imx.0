Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A176A28D8CE
	for <imx@lists.linux.dev>; Mon, 23 Jun 2025 15:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750692593; cv=none; b=oY5HBxSzT4VHrcrtSMy29ntpixNgbxN9WNCkqyKpebwkQVCks6eN4OuqQDaiAx09/twB8j1CW659wpnDFQt7QrOHBa4l66EYw8trTSx9CPZVo8m5giNyjolGOsC0sLKqFx6s4b94xdg1gDDTc1+hAL0j6lKj65ISa2Fcs2sNL34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750692593; c=relaxed/simple;
	bh=rvlexOk2KxBUOGBjG89VU+HC4brRNmm9u14ZwZa9zuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GB0m0I8eKGvyxsSj1ML/69bo3n69WtEsi1K2nRgm89X7ralawcHFMQwrwQB06qIoPg3XH5XxKZz5p4FsIBvcWetkrRMmHyvJHUXZa5w4c3N2NJbf5I5QePdzG8k6mxd7WVir2EhKjdI3Qs0jK+4l9fJMrJLNDhH44Q/PJWQRRXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uxSLlvUY; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uxSLlvUY"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22c33677183so39170305ad.2
        for <imx@lists.linux.dev>; Mon, 23 Jun 2025 08:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750692591; x=1751297391; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+jAVqu/xxn5U99+rZ3TEpqjiwAM44h/eW9lw9VkDNhA=;
        b=uxSLlvUYEeFZOYyMJ+E10Xuo6z8e/peFx394UQjy+9J0cD+LOA8fbdSnroNcS4GKgc
         bCsSyXq4ibuLjT1CldwoWUWiXgo1VLLJM4iQNhxer+YDi54FUpgfb3+xwg0Ezo6+ATc3
         NRV/qiwO1MNlK3i/v+JZAwkrNt32bUkNY3DEQ/gFnsD6U57K/RWwUseEJdJhwV7RrKfG
         5u5sW/0x6wshi1XwmyTGacj3ZfJhWMOBB49EKoQZYLunZPcCBtvTuQ/AmbaR1t6WyyUZ
         iPf3mL+HENOjdjDHAPZOE5rI+72i+LtoP8uykHjU8W+qZl2UkGFYPCjNkQ3k4gW6hKFI
         UPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750692591; x=1751297391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+jAVqu/xxn5U99+rZ3TEpqjiwAM44h/eW9lw9VkDNhA=;
        b=fNXQno0A+mULAvK0C85qF+KCQB0HlLbyxbTUUChVqzDYpztK0NcQ/D3xH2Lh86uoP+
         mD5/kvdVl83puysHyvdTUh7NPcU4uwpyE04rpJikq+1YB1lmx+jV2Ah1tFcH3VFNY1jK
         xsL/MsHuRdVj539A6arcX5o/9NYXp/u+uFlrg5kVE651Z7mMleznnj1YjTiO9ioRnr2t
         rBz/in+0KOta+P35uNlJwFtDVJ8lL6h/FzA+xn+AvC/ggtDOkwoavvYFmrTVd0NlL7Il
         hyOQtddGYz7g1lysRsgqUgNYhLl0O1biLwVthV9s0eDzAuGv1l2UEDjY4QGE2A69I0C5
         /R6w==
X-Forwarded-Encrypted: i=1; AJvYcCVJYZh3yv/PPExbNv2cQ5iu7vb/mClg2ET4crHoaErr/jrAZwAEaA7J7z9SrGFNnZI13Fg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3Joq+KlVJkenicZb1BOktWCcPOKnxMlRIb3wBJB9FoNvSuZnO
	qqzUziCcHAkPr0mBrbBSmnKiavIBjngS+YD49I8X7vZ2HUYVHsA2SMTTR2r8qgdj7BE=
X-Gm-Gg: ASbGncvFS8tH5Qp/OFyfVdnXOet27i8Na3elLSEmhAwvzTuthtJTW9gm0sKJFeaiC/4
	4kfQYQ/0HB+umS82ESOo6Mq1ev6s3AJZYrhxdtwILfy/NIG823/oJxLeVmf1BOI0n3wp+7JLhXD
	BKZhs00z8LRDzRGIBpvLJXtK4KnG4b6erBv4QFJCjBA89PSQ8vGOi7RiAbMfBK979mezqSkVL9a
	oJfT/0Qirma9vRlEkmASrA9uuQtEQMPF0NJBwXGrG6KnaawXTT3JDW2aI3YGOErRivVzgUAth0h
	d29xX03m0rIdAzxgL9Tkef1rIqKXE6+uM1IzhlBUouaeCNxU1pX5/Fu6Cbvj8dR40sR0AE2lZKA
	=
X-Google-Smtp-Source: AGHT+IE/tDEriXoZY84SIRgiQjRfx7Nqv/jCO1aRGKRzkXGAXMW0IvvtgLzNFd2r0jGkIlFdCJKogw==
X-Received: by 2002:a17:902:d501:b0:235:f3df:bc26 with SMTP id d9443c01a7336-237d976311fmr188832525ad.3.1750692590758;
        Mon, 23 Jun 2025 08:29:50 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:d145:b99:ea4b:a65f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f12427cdsm7052225a12.39.2025.06.23.08.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:29:50 -0700 (PDT)
Date: Mon, 23 Jun 2025 09:29:47 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Hiago De Franco <hiagofranco@gmail.com>
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
Message-ID: <aFly61yCMttkp12e@p14s>
References: <20250617193450.183889-1-hiagofranco@gmail.com>
 <20250617193450.183889-4-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617193450.183889-4-hiagofranco@gmail.com>

On Tue, Jun 17, 2025 at 04:34:50PM -0300, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> When the remote core is started before Linux boots (e.g., by the
> bootloader), the driver currently is not able to attach because it only
> checks for cores running in different partitions. If the core was kicked

Again, we have a nomenclature issue here with "If the core was kicked by the
bootloader".  What does "kicked" mean here?  Is it just powered and held in
reset or is it executing.  And are you referring to the A core or the M core?


> by the bootloader, it is in the same partition as Linux and it is
> already up and running.
> 
> This adds power mode verification through dev_pm_genpd_is_on(), enabling
> the driver to detect when the remote core is already running and
> properly attach to it if all the power domain devices are on.
> 
> To accomplish this, we need to avoid passing any attach_data or flags to
> dev_pm_domain_attach_list(), letting the platform device become a
> consumer of the power domain provider. With that the current power state
> of the genpds will not change, allowing the detection of the remote core
> power state.
> 
> We enable and sync the device runtime PM during probe to make sure the
> power domains are correctly managed when the core is controlled by the
> kernel.
> 
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---
> v4 -> v5:
>  - pm_runtime_get_sync() removed in favor of
>    pm_runtime_resume_and_get(). Now it also checks the return value of
>    this function.
>  - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove()
>    function.
> v3 -> v4:
>  - Changed to use the new dev_pm_genpd_is_on() function instead, as
>    suggested by Ulf. This will now get the power status of the two
>    remote cores power domains to decided if imx_rpoc needs to attach or
>    not. In order to do that, pm_runtime_enable() and
>    pm_runtime_get_sync() were introduced and pd_data was removed.
> v2 -> v3:
>  - Unchanged.
> v1 -> v2:
>  - Dropped unecessary include. Removed the imx_rproc_is_on function, as
>    suggested.
> ---
>  drivers/remoteproc/imx_rproc.c | 37 +++++++++++++++++++++++++++++-----
>  1 file changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 627e57a88db2..b53083f2553e 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -18,6 +18,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> @@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
>  static int imx_rproc_attach_pd(struct imx_rproc *priv)
>  {
>  	struct device *dev = priv->dev;
> -	int ret;
> -	struct dev_pm_domain_attach_data pd_data = {
> -		.pd_flags = PD_FLAG_DEV_LINK_ON,
> -	};
> +	int ret, i;
> +	bool detached = true;
>  
>  	/*
>  	 * If there is only one power-domain entry, the platform driver framework
> @@ -902,7 +901,22 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
>  	if (dev->pm_domain)
>  		return 0;
>  
> -	ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> +	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> +	/*
> +	 * If all the power domain devices are already turned on, the remote
> +	 * core is already up when the kernel booted (e.g. kicked by the
> +	 * bootloader). In this case attach to it.

Same comment as above.  What got kicked?  A core or M core.  And what does
"kicked" mean?  I can guess what is happening but guessing rarely leads to
anything positive.

In the next revision, please use other words than "kicked".


> +	 */
> +	for (i = 0; i < ret; i++) {
> +		if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> +			detached = false;
> +			break;
> +		}
> +	}
> +
> +	if (detached)
> +		priv->rproc->state = RPROC_DETACHED;
> +

Ok for the above.

>  	return ret < 0 ? ret : 0;
>  }
>  
> @@ -1146,6 +1160,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	if (dcfg->method == IMX_RPROC_SCU_API) {
> +		pm_runtime_enable(dev);
> +		ret = pm_runtime_resume_and_get(dev);
> +		if (ret) {
> +			dev_err(dev, "pm_runtime get failed: %d\n", ret);
> +			goto err_put_clk;
> +		}
> +	}
> +
>  	ret = rproc_add(rproc);
>  	if (ret) {
>  		dev_err(dev, "rproc_add failed\n");
> @@ -1171,6 +1194,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
>  	struct rproc *rproc = platform_get_drvdata(pdev);
>  	struct imx_rproc *priv = rproc->priv;
>  
> +	if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> +		pm_runtime_disable(priv->dev);
> +		pm_runtime_put(priv->dev);
> +	}
>  	clk_disable_unprepare(priv->clk);
>  	rproc_del(rproc);
>  	imx_rproc_put_scu(rproc);
> -- 
> 2.39.5
> 
