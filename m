Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7833425B099
	for <imx@lists.linux.dev>; Wed,  2 Sep 2026 16:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788367852; cv=none; b=WFuJgn576GOvD3U1g1EquNsqxE45NnxdfWhrcWgSmoPZlQymI35xbqveA6/69BSYrvFS4O7+/4ALhmOOL9eJZgQRcaqrO9OVV8vqYUUHWW9Ynec0CaVBcB/XoxsIXV4E4FO+D7LcEIyndT1tlMAysSWmhZ3op/BaX8/GFMSOW9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788367852; c=relaxed/simple;
	bh=k5rRICqrRTgGgXTc3CHRsg0Ro1RiUscjPIEybIB//jU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k61mLkz6coYcXe2GzDFmvNsACwbRqMhPp9FfUc/xtAqs+Usq5IK8ZJRdO8B2525SqV1+Z5TP+rTdQ2Ejm/98/OccOzMfb61mKqhxEbzACRHSrxdaIoct3KosZMGRTksgqob8tGPpfLnW+5h8/SPuRDYNVDDfgiMtYX3JXUV/SZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bItuSnYr; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bItuSnYr"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-39266382df6so1191103a91.3
        for <imx@lists.linux.dev>; Wed, 02 Sep 2026 09:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788367851; x=1788972651; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wr9VDmGb5yutuZyn7tNWBbCb4I+bZ4roesyQfz760To=;
        b=bItuSnYrdwTpp92NhDrHYDu3hK9tbUSETBYZbEdE991Chbgp9EAZ6UWaBVOLlEXoXI
         ud3q7XAgir9fyUL0SFTYyIETMCQym7NgRa9G+yvrenLR2antPD2zX349WtAnBJ1rVz5p
         Ra1H5cc6ZYDkeAMw2mrgkFCe6vXD9u4tsFhDiuZmZxLRawzlQM7uhEmu6eGmm1BBny6U
         Hrz7hNvbpXOLytirdzrnCPoE4ziHmJ3Lf+oarfsOImM8vusQLcKNENsOMcg+us9HgWd7
         a+IcQXqJB7eVMi+X/4l1Pr5PmrZsHbmdF58YdrluXLPII9QQPfBNNwi+hpCBT1V5teEE
         6kBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367851; x=1788972651;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wr9VDmGb5yutuZyn7tNWBbCb4I+bZ4roesyQfz760To=;
        b=BgoS6HSnsPRyHXRJPDsFmuFrYkfjjtHGmB4fBX6kaWZkeMoa0/pBwjeDkOqz+ly/FR
         VGhm/YxlvBfS4aKfjdfSG0JGz3TtLlfMfcMjYAHNuHLE79c/pRb5yKcHuC/1Txbeqflz
         JAMp8xIY6Z2/ZVw/Nx0Q/OSDdGip52cp53IjkRBDRRvgMP6HIhA3phLYIl42yGcZlro0
         9qEFeHAwseBVG21m7ZnsAX2+XJn2kK7vv40CaA8cl1Psm7kLFmrsdzhkKUIL8kZZsb5C
         1zw70dk43OV1zmuLFOSVqCsWmypXFODYTMsdtMRf6zHKrgrIk8yjRrHRdJzQ4XRoEQKW
         /akA==
X-Forwarded-Encrypted: i=1; AKwUvBwTx7LPz55B2ydjq9PT502d3d5OV/0gA1VKiBwXSnmCZkl3QrkhOQrB3f+TkJvvMuqERZk=@lists.linux.dev
X-Gm-Message-State: AFuF++mTP5iw6fIlSbutgO+Rhp/eVqnW82jpDHUTtNmyLJVyBnWqrILi
	39FIbAu5xxNV80XvP0lBa7W6rvmULDQWGvm0Zx6oMtwnbXcBGCJ/lfDwHHgiuR1xrrA=
X-Gm-Gg: AYBFou0YLnEfl5Hv0RKEn6XnCiiXZ3vLHBjh0Cc6pe2xiXWaZIQ2RMs6eSySUxwPJxQ
	j3Ypc97njV2B7AEXrBP60SNIK2vnJnHWhsY0f2ZOR/FF2flhiFUwNbVNi8tKGktDILDeOMXxhDJ
	1YCs+wY5Pi0Iwg0bFMB181dPOh0RZflzmDCwe/Y101Ib0U2vNkPNwMdFQe71/WYRLMHzr0TUDYu
	+mgPq9ARSp3QOah+UdRU0MAqXqo+85aKal5jfj0o0qLE4XFTxbia1Bbqk1wJ3vn7aWbmfPjIItW
	0Fyvssr2mdsVGU3Pu7NiqPd0yDF4KJaRfrWrZySgR3bxA72ORfiZQtIANXrGyho2IrOBQG1P73Q
	VyrSczTeTYFC50rpxM1r8gQZMF5e6UY0TLLU/1mO9FdtJrdSK3rzlwM37PdDOWvqQTHDyHkGQ+X
	b/fuc444Lk06HXL6kz+rtuFIeZ3OdvWXeVK02hIF10zTZI0XjlbneFnrT2fP8Ha4xH
X-Received: by 2002:a17:90a:d604:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39aee16a169mr9561954a91.24.1788367850624;
        Wed, 02 Sep 2026 09:50:50 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:fff4:86c5:8d86:9e93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b07ac1174sm341938a91.0.2026.09.02.09.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 09:50:50 -0700 (PDT)
Date: Wed, 2 Sep 2026 10:50:47 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: imx_dsp: acquire runtime PM before adding
 carveouts
Message-ID: <aphT5wHTNcGvbkjq@p14s>
References: <20260830133310.6926-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830133310.6926-1-pengpeng@iscas.ac.cn>

On Sun, Aug 30, 2026 at 09:33:10PM +0800, Pengpeng Hou wrote:
> The prepare callback publishes DSP carveouts before acquiring the
> runtime-PM reference that establishes required clocks and mailbox state.
> A PM failure therefore leaves the prepare transaction partially
> published.
> 
> Acquire runtime PM first and drop that reference if carveout
> construction fails, so a failed prepare does not add resources before
> its hardware prerequisite.
> 
> Fixes: ec0e5549f358 ("remoteproc: imx_dsp_rproc: Add remoteproc driver for DSP on i.MX")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/remoteproc/imx_dsp_rproc.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index fd60c67ba8a9f..96d619daf3f5b 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -726,14 +726,17 @@ static int imx_dsp_rproc_prepare(struct rproc *rproc)
>  	struct device *dev = rproc->dev.parent;
>  	int ret;
>  
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret < 0)
> +		return ret;
> +
>  	ret = imx_dsp_rproc_add_carveout(priv);
>  	if (ret) {
>  		dev_err(dev, "failed on imx_dsp_rproc_add_carveout\n");
> +		pm_runtime_put_sync(dev);
>  		return ret;
>  	}
>  
> -	pm_runtime_get_sync(dev);
> -

Applied.

Thanks,
Mathieu

>  	return 0;
>  }
> 
> base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
> -- 
> 2.50.1
> 
