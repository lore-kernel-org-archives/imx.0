Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F171C84A8
	for <imx@lists.linux.dev>; Thu, 17 Jul 2025 14:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752763492; cv=none; b=VaTBscXERQgP/TROg6P05Amfe2V3Zz8x5AF7baaKpREZHn/+BLtOYhffzNroblvaogNRPsEVihkixOQ2tjSRNjlCAZymGqGm3IDLcGEaJpih85BtX1zKor5FMNRM62MTP4DTpuOh9rGt2iC+tZ9kskA07QucSYh65JSVZmf10CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752763492; c=relaxed/simple;
	bh=N7zNq45QUNdUpyjATamHndz1kMnW2ULq+Iir8spcIZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oYpLJwPff3BJGm4k35vSOvsdqrBnxNLrIfRBSUnM9MjkyEVmgej6sBRrfMp6U90MT4rb66ymHhTpl+8XR9+D73CYxfluvhpDlIkcOTdSECpRNA7BLi79qjGW6vnU6SsaJ8+h0mVji5qNdIZhHFisfABHmjfng76M09biuVFBsMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xi7wSKnb; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xi7wSKnb"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2363616a1a6so8855765ad.3
        for <imx@lists.linux.dev>; Thu, 17 Jul 2025 07:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752763488; x=1753368288; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HMki3EREzOkEdCOqJgQuxQoEpYrU9bwlyOJXDCisQCI=;
        b=Xi7wSKnbaphdd5m8UiMg1Adc1DrNOVBPSxZ394g1tyeJjxqRyKtsQxFPUCvN0vJVqv
         kZVlL+9u3bWPZLCgCcm0bll4g3dOXe4lKA+5f1ARaUFY5RzeUtm2fzZI1vYIuFwSrWLK
         /tJLndBH9Xdd9pVRtWKFxVc1ncDBlXZBbwmN2mB0QT0Xs51S09YF6DJ1IEUNIQy85UFn
         6H77MRqXqLXtuYs4mqmXdbrazrAZk3lwqWTimZ374ZpwT9VlfZDMlo4PBV1pW9ZEYpmK
         iHbn/SMW4AEBSc1B9PyXAhVWqE//kA6S/SYwzcEEDhmSbpKpYm6lV+G3tAUfHNv+QNb3
         5zKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752763488; x=1753368288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMki3EREzOkEdCOqJgQuxQoEpYrU9bwlyOJXDCisQCI=;
        b=ceCnAuCGYAQtn8D7LrWk8VTuanIHefwbJV8Xf6RQj/pIr6e24x6abC/JYfrL2je9U5
         2YDUiAwRNvVFQf/pAf3h/1v+wLhmXJdf9mdpqRZeTQb1gVS4rw+exIHc4DJa4y8JLQek
         JtZKxyfgSxRNZ8wVIv4htFWAnV+hNc4FCYOZDM8Nm5CXlBYYyGoHjxuxmvZBjfNf6H39
         IH/t0u5oZfE3o2y1eABpc4PZWV/J4RVV+8trV3CZcopgs+NonVD0M3Mu0gSCa8oxEPBz
         2wNzzIdAAJcqeEZDi9DbH406qE2DJr2LvxwyRwXOhALJFKHJd8DMCpslRHR0N8amSOdf
         PPkg==
X-Forwarded-Encrypted: i=1; AJvYcCUHdtzQEEaUTnBejlbdzANV7TOtwbwYb4qGm6KrFohkh5nTBp8LQYinOT+yHfuxT0JVvSU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2OXgBUOHXq1jsu+wg03a0q74f5WcZCcq/e7Pqcj2LqFf36VMA
	0MECmNcuRwJAJsKkpE74hPv5TLhf0yZHUDnU771YznkuFDo1bkeFnAf1JYPBr5oPBac=
X-Gm-Gg: ASbGnct2Zl/1mchs97HgsOyZtbtgoaMLcJRnuX2Ww6FXTJ8/orv15o6ua6uYF7vVibW
	UgPiLi3jDDO7GiiSZw2JrtxkI3zMJwAdvugtGhIFu3oUYoZrvz+BVMmmSfi/ieSrAiobjzwDh1j
	pi+A71VEVvqB2YNaU/f4zb8Nh6xNk3DWioyrTqT6i6czNa/Jc9fQc3jv1qV/Yd7bhECFVwEAmLq
	sIKuaddXYNRLet3Elib3/yTK+GE/FxmYfLypn/BUFqPXa4gFFbxQF5nWyRch2YmRwvzPzMhK3wr
	dQlgaMI7lcKRnGTbCt/8O8nFENfQDpsxKI7CYPITaDU7+RyfVLU0YwAKIw8ab/Ska04nFG3Iriu
	wxaR1FI3BBlSdRn71/f05mW+r
X-Google-Smtp-Source: AGHT+IFxbtqBAGkJym8+VFRPzdrsyZhZt1QmNmPClKyw9FUHG1z6ALCqHlkDrXho3ZJx8sxkci5pug==
X-Received: by 2002:a17:903:1ac8:b0:234:d431:ec6e with SMTP id d9443c01a7336-23e256849dfmr104855025ad.3.1752763488194;
        Thu, 17 Jul 2025 07:44:48 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:e0c8:a1e8:3882:b37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4322b2dsm145347495ad.92.2025.07.17.07.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:44:47 -0700 (PDT)
Date: Thu, 17 Jul 2025 08:44:45 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-remoteproc@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v8] remoteproc: imx_rproc: detect and attach to
 pre-booted remote cores
Message-ID: <aHkMXWfs0iXqFTbw@p14s>
References: <20250716194638.113115-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716194638.113115-1-hiagofranco@gmail.com>

On Wed, Jul 16, 2025 at 04:46:38PM -0300, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> When the Cortex-M remote core is started and already running before
> Linux boots (typically by the Cortex-A bootloader using a command like
> bootaux), the current driver is unable to attach to it. This is because
> the driver only checks for remote cores running in different SCU
> partitions. However in this case, the M-core is in the same partition as
> Linux and is already powered up and running by the bootloader.
> 
> This patch adds a check using dev_pm_genpd_is_on() to verify whether the
> M-core's power domains are already on. If all power domain devices are
> on, the driver assumes the M-core is running and proceed to attach to
> it.
> 
> To accomplish this, we need to avoid passing any attach_data or flags to
> dev_pm_domain_attach_list(), allowing the platform device become a
> consumer of the power domain provider without changing its current
> state.
> 
> During probe, also enable and sync the device runtime PM to make sure
> the power domains are correctly managed when the core is controlled by
> the kernel.
> 
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
> Hi Mathieu, Ulf,
> 
> This is the v8 of patch3 from the patch series:
> https://lore.kernel.org/all/20250629172512.14857-1-hiagofranco@gmail.com/
> 
> As patches 1 and 2 are already applied on Ulf's next branch, as
> requested I am sending now only the v8 of patch 3.
> 
> I made a small correction into the commit description, s/SCFW
> partitions/SCU partitions/g and updated with the check for the return
> value.
> 
> I hope this is ok.
> 
> Thanks!
> 
> Hiago.
> 
> v7 -> v8:
>     - Added return error check for dev_pm_domain_attach_list().
>     - Commit description: changed to use "SCU partitions" instead of
>       "SCFW partitions". This is more accurate since these are hardware
>       enforced partitions.
> v6 -> v7:
>  - Added Peng reviewed-by.
> v5 -> v6:
>  - Commit description improved, as suggested. Added Ulf Hansson reviewed
>    by. Comment on imx-rproc.c improved.
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
> ---
>  drivers/remoteproc/imx_rproc.c | 41 +++++++++++++++++++++++++++++-----
>  1 file changed, 35 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 627e57a88db2..a6eef0080ca9 100644
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
> @@ -902,8 +901,25 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
>  	if (dev->pm_domain)
>  		return 0;
>  
> -	ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> -	return ret < 0 ? ret : 0;
> +	ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> +	if (ret < 0)
> +		return ret;
> +	/*
> +	 * If all the power domain devices are already turned on, the remote
> +	 * core is already powered up and running when the kernel booted (e.g.,
> +	 * started by U-Boot's bootaux command). In this case attach to it.
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
> +	return 0;
>  }
>  
>  static int imx_rproc_detect_mode(struct imx_rproc *priv)
> @@ -1146,6 +1162,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
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
> @@ -1171,6 +1196,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
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
