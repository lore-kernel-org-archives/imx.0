Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D136C23E334
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 12:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773233453; cv=none; b=HvX+/PvL/yEeXuBEhYjAEsiGC8W5UDmhstWhptQbvm91eXllwbDE3zGO6gfGU9FFaqtNkCVvXuFYguaQCbeU+5LIvQaimR0Hlruj931F+rH0TXkkNEsu+Zf9yWMiWMEpi+RT92DlObfT7OQeZx0ku6Ga/v8Jtb/W/XAKpsVIBVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773233453; c=relaxed/simple;
	bh=3hhQtJuyqLfFjdpmAoRFR4RP69ILCV1ozU6Cm359k30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7o1NYj7Ej1SRACPcnXtgxZ8Xv+OyZhf9L103klZrMK/+KmLcIkqlXYoS/UMik32PKZcncgaemkxbZyG2hEeRIJ9DQdS5oQJ9mAmq5XDYeWMpfenjtQYwqrAvNsnjYNpDgo9q4rszAcInQrmQDx1eeW1oZECsu8wV0BlAIZjtQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EHrIy0CR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EHrIy0CR"
Received: from ideasonboard.com (static.170.20.224.46.clients.your-server.de [46.224.20.170])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7DFB42D9;
	Wed, 11 Mar 2026 13:49:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773233382;
	bh=3hhQtJuyqLfFjdpmAoRFR4RP69ILCV1ozU6Cm359k30=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EHrIy0CR45EZlV1l5rTU+qJAHjLkLLzxBHX1/7bdAfKSMdurCcsSdm8exKTB5Cg7g
	 4T8bf5ab/el19dB+y+0N2VZtjdjoQlWvn+2qTg4rClIbcRw9AFOPKUSn9pFIMQtvtE
	 sYM8cBikFR0glniq+jgSZhqJUueoZYOqy8WeAGQI=
Date: Wed, 11 Mar 2026 13:50:46 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Alexi Birlinger <alexi.birlinger@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH 1/2] media: nxp: imx8-isi: Reduce minimum queued buffers
 from 2 to 1
Message-ID: <abFeguTCJQmoCLPK@zed>
References: <20260311-isi_min_buffers-v1-0-c9299d6e8ae6@nxp.com>
 <20260311-isi_min_buffers-v1-1-c9299d6e8ae6@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260311-isi_min_buffers-v1-1-c9299d6e8ae6@nxp.com>

Hello Guoniu

On Wed, Mar 11, 2026 at 04:02:58PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>
> Fix a hang issue when capturing a single frame with applications like cam
> in libcamera. It would hang waiting for the driver to complete the buffer,
> but streaming never starts because min_queued_buffers was set to 2.
>
> The ISI module uses a ping-pong buffer mechanism that requires two buffers
> to be programmed at all times. However, when fewer than 2 user buffers are
> available, the driver use internal discard buffers to fill the remaining
> slot(s). Reduce minimum queued buffers from 2 to 1 allows streaming to

Does it mean the ISI can use internal buffer discard for both buffer
slots ? Can we make min_queued_buffers == 0 ?

> start with a single buffer providing more flexibility for applications.
>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index 13682bf6e9f8895bb9eb1f92d5f74b0d5968544e..2405baf21594cd18cf2b349234313c5e103b7802 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -1410,7 +1410,7 @@ int mxc_isi_video_register(struct mxc_isi_pipe *pipe,
>  	q->mem_ops = &vb2_dma_contig_memops;
>  	q->buf_struct_size = sizeof(struct mxc_isi_buffer);
>  	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> -	q->min_queued_buffers = 2;
> +	q->min_queued_buffers = 1;
>  	q->lock = &video->lock;
>  	q->dev = pipe->isi->dev;
>
>
> --
> 2.34.1
>
>
