Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C9A2E36F1
	for <imx@lists.linux.dev>; Mon, 22 Sep 2025 16:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758557234; cv=none; b=IEo6y27cMLFc+IoNGi7Du5Ox21S+XjoxwKH5pijmyb6Oa4uz98b3jpLfr/MK5my5apE4PElHcG/GeXFLOcvjeL9fFnO7qYOdUn5TiCSiTXQ8WLaQaGeSYKkYKkKPbgXs2sfLG5iHSzsvjZFXontP6i/In3VI3Fdu/dZyDtJ5GIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758557234; c=relaxed/simple;
	bh=SGd/Y77sUXn6Zr/jkMncw9ZuF4nFQwtDQXKAhq+qfS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PoP4WNpR8K+2f2RslABDdwfI7mdPIuPHse970ff/+ssBcqdHMYI8UPHSBtNVEqmOaPHg73jCJYghnGlu12Wm8S2jxFKvJdh8TPFbS93/QAUWcvafseRj/H1tCX7idLxmA0lzaKNy+ZTTKj94yLT621wm622Zt0Ul44gKkEy1FR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VYqfr7Pq; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VYqfr7Pq"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b550eff972eso2669240a12.3
        for <imx@lists.linux.dev>; Mon, 22 Sep 2025 09:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758557232; x=1759162032; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fBIeGLBQwDo9z1+Bndm5UcTEHsot/RRojoQ38PoeRdg=;
        b=VYqfr7PqcsCeD/GV+XyvZnc9ZyX2G23cfRS/u5tg8hwireAOWyXTXnO1o91zBEG/fa
         MqHYAJgPf6RIYopaB7fjLpTautpcoPxCeKwhUtqkkSrQjHIVu00czlSY4mpvcLf4zvG7
         J9O6jp7VQLfQT1GMmotQJozQfS5PRAQnt0FIuk8gxcpKnVjS6XDRJQqmnQBmG7Z30snM
         8YgdcTiklBml4oLYSSNMAaybm0xgMOYuk907Q8y217jurFYWEjgrj8X2D+iRFmwBLD7Z
         zBdi6nkAc2T0c0ME80SvfEWUyj+06Xnc7YU6x5jaUO00GQlcH3lBIf//SrUmJKDYJiK8
         S9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758557232; x=1759162032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBIeGLBQwDo9z1+Bndm5UcTEHsot/RRojoQ38PoeRdg=;
        b=VR967LyYC8jgDA/oVXCaUSuYfRK8iSUIUGsqadIdAeAVTNSl3dZazrIXtlxRAFykx9
         e2jURnrVKdeLchosctDK5BqoczR81LG9CTveFb9LBI4s8jHZXR5cBqpYksi5HytvTzO0
         9mB2tqocLZlZPylo5eXezWV5QBFaZ3RcWyS38vmeTeyZ0G2cxw8VYix+A2whthjbCqLl
         vzRaBdkfc5t063VCR0NvxmshgR5eOxSQl/IBhF+USMImjWKO22kWsZI6gRpa9a2yy8O1
         /3gyEVdborwuaskgy9uW7o59Nqor2goOv4AGqiQZFWdxl/Anv1lMnFnQo2CorMsw1+u0
         LYRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjSwV4AXantChlj9NCBD+pMCcZnRpZNG11M9Ras8r3srI782yGtmqRC+ewYF1SK47p2Ko=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRHlKwaSgQZ+o0m310b0wp3PK7nzFylZEKV4VWr0Wmyb7PWz+L
	b677y+2JR63vcEOjgng+mKuLtT97Br7xRrBay7HkjOShA1SMqT1kcDbrB5j3cSq4tAM=
X-Gm-Gg: ASbGnctfsfS4vSWdKO8z8ISbVwuFG7XsVG5GL69jyNuoRb1uGcwXmuDED7w0/Lb5WyS
	PqfZKHdKR3BDsu4lt8MV6fln2G2yly4JeUUAZrZiBc5zLZfoAX4pXszJElQ1hwjdgBexvZoBEq/
	BQpqmThQI2DxmA7QnNWeByRiHXTkvOqzLhSFo4WjGTYyhA5OmrVy/QwbUYsbh+Go0zbCMktMqqo
	KJLNLMiFkqS+V1Wvsnufuq0eJCQvjoc+8SwH8aDuoNm9aApta6XQIhPdxTbieMQxH+GMIFqFt8W
	NeIxq/nKeFyTHIj5AxKj+dr+x1w05FsEQqOHzqsBRIZk7Vveg4BUZ4SWqh9S2aMWtcsmHxzUWn/
	+6l8UZK3eR0r2R0RhHTJWQt0N0MVMhxgh3A4g0jnMXGA9B5+I3T5tfeMkHkxRsRbq2g3FE/nkmg
	/+3Q80wd6cK2hL7FUVUwO/velOVxaBURVMU+E=
X-Google-Smtp-Source: AGHT+IH2NzERQbi1RoTQELtlO5ZOlqSD7C5iySM5N99gbWGr6H6ojxxoxB4xZsUBWMUxh34xDnn+dA==
X-Received: by 2002:a17:902:ccd2:b0:267:99bf:6724 with SMTP id d9443c01a7336-269ba50876fmr165383605ad.31.1758557232460;
        Mon, 22 Sep 2025 09:07:12 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:4631:7929:7e95:6485])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269803184d3sm133896545ad.116.2025.09.22.09.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 09:07:11 -0700 (PDT)
Date: Mon, 22 Sep 2025 10:07:08 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] remoteproc: imx_rproc: Fix runtime PM cleanup order
 and error handling
Message-ID: <aNF0LFkuS_hADmrz@p14s>
References: <20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com>
 <20250917-imx_rproc_c2-v1-1-00ce23dc9c6e@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-imx_rproc_c2-v1-1-00ce23dc9c6e@nxp.com>

On Wed, Sep 17, 2025 at 09:19:13PM +0800, Peng Fan wrote:
> The order of runtime PM API calls in the remove path is wrong.
> pm_runtime_put() should be called before pm_runtime_disable(), per the
> runtime PM guidelines.

Where is this mentioned?  I have looked in [1] and couldn't find anything.

[1]. Documentation/power/runtime_pm.rst

> Calling pm_runtime_disable() prematurely can
> lead to incorrect reference counting and improper device suspend behavior.
> 
> Additionally, proper cleanup should be done when rproc_add() fails by
> invoking both pm_runtime_put() and pm_runtime_disable() to avoid leaving
> the device in an inconsistent power state.
> 
> With using devm_pm_runtime_enable() for automatic resource management and
> introducing a devres-managed cleanup action imx_rproc_pm_runtime_put() to
> enforce correct PM API usage and simplify error paths, the upper two
> issues could be fixed. Also print out error log in case of error.
> 
> Fixes: a876a3aacc43 ("remoteproc: imx_rproc: detect and attach to pre-booted remote cores")
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Hiago De Franco <hiago.franco@toradex.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index bb25221a4a8987ff427d68e2a5535f0e156b0097..12305f36552fb5265b0953a099ea0d561880e3ff 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1046,6 +1046,13 @@ static int imx_rproc_sys_off_handler(struct sys_off_data *data)
>  	return NOTIFY_DONE;
>  }
>  
> +static void imx_rproc_pm_runtime_put(void *data)
> +{
> +	struct device *dev = data;
> +
> +	pm_runtime_put(dev);
> +}
> +
>  static int imx_rproc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1125,12 +1132,23 @@ static int imx_rproc_probe(struct platform_device *pdev)
>  	}
>  
>  	if (dcfg->method == IMX_RPROC_SCU_API) {
> -		pm_runtime_enable(dev);
> +		ret = devm_pm_runtime_enable(dev);
> +		if (ret) {
> +			dev_err(dev, "Failed to enable runtime PM, %d\n", ret);
> +			goto err_put_clk;
> +		}
> +
>  		ret = pm_runtime_resume_and_get(dev);
>  		if (ret) {
>  			dev_err(dev, "pm_runtime get failed: %d\n", ret);
>  			goto err_put_clk;
>  		}
> +
> +		ret = devm_add_action_or_reset(dev, imx_rproc_pm_runtime_put, dev);
> +		if (ret) {
> +			dev_err(dev, "Failed to add devm disable pm action: %d\n", ret);
> +			goto err_put_clk;
> +		}
>  	}
>  
>  	ret = rproc_add(rproc);
> @@ -1158,10 +1176,6 @@ static void imx_rproc_remove(struct platform_device *pdev)
>  	struct rproc *rproc = platform_get_drvdata(pdev);
>  	struct imx_rproc *priv = rproc->priv;
>  
> -	if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> -		pm_runtime_disable(priv->dev);
> -		pm_runtime_put(priv->dev);
> -	}
>  	clk_disable_unprepare(priv->clk);
>  	rproc_del(rproc);
>  	imx_rproc_put_scu(rproc);
> 
> -- 
> 2.37.1
> 
