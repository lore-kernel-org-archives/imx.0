Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8085337C0ED
	for <imx@lists.linux.dev>; Thu,  7 May 2026 08:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143047; cv=none; b=d8egLIFhz3qWizL4/EPcyzi54PNEir36FfF2YGhIxCzaZ0EA4IA0aNrOm/G1TOCr7gOl59//fpJcb5AlYOw37i8o2go6w6LBS/KeyVVEapwhM/HXsKs9heIEumTpDKdZgv+hc2eGUHZu2boADx5ouk7AbSvA2vBHCbM9gBDjq4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143047; c=relaxed/simple;
	bh=yRFEhZivggtsy1WIFd6s2+6wukdiSm1BWUEOTkcdLww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2hDaDYPO9Lp2ZRj+AwSpJoWn7eSocIEue8ETEO05QNiY9MJI6OMBnZ95Jpx81HqIopYcCr9hx0MuAwBkM+iGuZS+cdvPv7Wyy53JmUP/O+mk01mjIoukMdfF7R7qK3U7IwOD1SRmQpYhd7EjtWY/6BsVxUeBc3Aqodn0q3YDZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oKycNdg5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oKycNdg5"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57D9E664;
	Thu,  7 May 2026 10:37:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778143035;
	bh=yRFEhZivggtsy1WIFd6s2+6wukdiSm1BWUEOTkcdLww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oKycNdg59d7OwdoyMEAlp+6nNCTsV+oTKqmePm/AglampNq+MeTusQ8o2Qh2JiLrH
	 iplD8fALtVKRbIXEOsWsS1zi44JawHQy32wTmkRWPyHwqWisAcKlVxnRrRs7J37S1q
	 j7M7LegsLVeuWMI0blp6aZuSObq0z0jTSHTDGpFM=
Date: Thu, 7 May 2026 11:37:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: mchehab@kernel.org, Frank.li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
	jacopo@jmondi.org, guoniu.zhou@nxp.com, s.riedmueller@phytec.de,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 3/4] media: nxp: imx8-isi: Fix missing
 v4l2_subdev_cleanup() in pipe init error path
Message-ID: <20260507083717.GH1778786@killaraus.ideasonboard.com>
References: <20260507041318.491594-1-xiaolei.wang@windriver.com>
 <20260507041318.491594-4-xiaolei.wang@windriver.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260507041318.491594-4-xiaolei.wang@windriver.com>

On Thu, May 07, 2026 at 12:13:17PM +0800, Xiaolei Wang wrote:
> After v4l2_subdev_init_finalize() succeeds in mxc_isi_pipe_init(), if
> platform_get_irq() or devm_request_irq() fails, the error path jumps to
> a label that only calls media_entity_cleanup() and mutex_destroy(),
> missing the v4l2_subdev_cleanup() call needed to free the subdev active
> state allocated by v4l2_subdev_init_finalize().
> 
> Add an error_subdev label that calls v4l2_subdev_cleanup() before
> falling through to the existing error cleanup.
> 
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index cb50af2270f6..a59b9456b590 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -796,18 +796,20 @@ int mxc_isi_pipe_init(struct mxc_isi_dev *isi, unsigned int id)
>  	irq = platform_get_irq(to_platform_device(isi->dev), id);
>  	if (irq < 0) {
>  		ret = irq;
> -		goto error;
> +		goto error_subdev;
>  	}
>  
>  	ret = devm_request_irq(isi->dev, irq, mxc_isi_pipe_irq_handler,
>  			       0, dev_name(isi->dev), pipe);
>  	if (ret < 0) {
>  		dev_err(isi->dev, "failed to request IRQ (%d)\n", ret);
> -		goto error;
> +		goto error_subdev;
>  	}
>  
>  	return 0;
>  
> +error_subdev:
> +	v4l2_subdev_cleanup(sd);
>  error:
>  	media_entity_cleanup(&sd->entity);
>  	mutex_destroy(&pipe->lock);

-- 
Regards,

Laurent Pinchart
