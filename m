Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16729376BC4
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 21:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773956916; cv=none; b=jEp3eXIo1iTuaNiAdJBmt0Gx3Qti0EEYzW+7ayM7UJn1JmLgxudUeOz+hFuQQpXQ93KkjPoGtASLRM2CltAtkjvcWAsRux39Snn5lsbBjm9nTSZ21bnfYWepwDoAzsaeezbVFwa8S/PH06e4/AKr4mZbdKELxgAPcpG23BOa1LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773956916; c=relaxed/simple;
	bh=A2biq4caq2/pSsQ/KuL6rT7TR2Y09X0AsHLcXBFJU6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tIAM1JqAYU3dW/iW6Y4oB4RctxVAeE1CnqdRmu9jDJS7KebbmDZpUX1AWVzjtQGJSIei+uZNQeQNLSVDuEVTWBuX0N3tuCdaeAkwb5qk+xCsr2/waF9faYQA+SPop89F8sTpjkT3TEVFmKDUufq7d360X6ZRCw786b11f1Xm6Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=A8+aNMGG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A8+aNMGG"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7BA61838;
	Thu, 19 Mar 2026 22:47:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773956839;
	bh=A2biq4caq2/pSsQ/KuL6rT7TR2Y09X0AsHLcXBFJU6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A8+aNMGGKEFufXx2QMHh/YxIv32y4Kq4tDsLyRV+MCbdcFRsftjdr78fe7tg1luQc
	 CnhxMP8z1yCYWPPREps6n94jPLqjmse8M9E10xALVFKFN6wnGmeeFpkxMWWegDzZYB
	 9swtfZ2DZmCdDyOidpW4PMsSLytgzGKyDxgfyC9U=
Date: Thu, 19 Mar 2026 23:48:31 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexi Birlinger <alexi.birlinger@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: nxp: imx8-isi: Reduce minimum queued
 buffers from 2 to 0
Message-ID: <20260319214831.GB950375@killaraus.ideasonboard.com>
References: <20260312-isi_min_buffers-v2-0-d5ea1c79ad81@nxp.com>
 <20260312-isi_min_buffers-v2-1-d5ea1c79ad81@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312-isi_min_buffers-v2-1-d5ea1c79ad81@nxp.com>

Hi Guoniu,

Thank you for the patch.

On Thu, Mar 12, 2026 at 11:12:34AM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> Fix a hang issue when capturing a single frame with applications like cam
> in libcamera. It would hang waiting for the driver to complete the buffer,
> but streaming never starts because min_queued_buffers was set to 2.
> 
> The ISI module uses a ping-pong buffer mechanism that requires two buffers
> to be programmed at all times. However, when fewer than 2 user buffers are
> available, the driver use internal discard buffers to fill the remaining
> slot(s). Reduce minimum queued buffers from 2 to 0 allows streaming to
> start without any queued buffers.
> 
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v2:
> - Reduce min_queued_buffers from 2 to 0 suggested by Jacopo Mondi
>   https://lore.kernel.org/linux-media/20260311-isi_min_buffers-v1-0-c9299d6e8ae6@nxp.com/T/#mcd4b7dcc218a02e2f218ba2c83b947ccefd9308b
> - Add fix tag
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index 13682bf6e9f8895bb9eb1f92d5f74b0d5968544e..1be3a728f32f89338a75ddcc4e96e7501ed954e1 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -1410,7 +1410,7 @@ int mxc_isi_video_register(struct mxc_isi_pipe *pipe,
>  	q->mem_ops = &vb2_dma_contig_memops;
>  	q->buf_struct_size = sizeof(struct mxc_isi_buffer);
>  	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> -	q->min_queued_buffers = 2;
> +	q->min_queued_buffers = 0;

A simple way to fix the issue, that's nice.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	q->lock = &video->lock;
>  	q->dev = pipe->isi->dev;
>  
> 

-- 
Regards,

Laurent Pinchart
