Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA904070F3
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 21:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773957566; cv=none; b=BfpSuyO55o1ea1usMOoqCzezBKubV/tV33R7dZxwwJEONcpo7ZhGHxzjFp6MelyO868GDdBg3c86MvG1FnnvaY2cmHrnvjmflhRA0yzKV5blIPzcu360dhvTYwvY6GxwjjUCPDzBiIMfsYF0WXT65x/hZE5FJAhiVYiwTiVJ/Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773957566; c=relaxed/simple;
	bh=aC0FGWPPla4uf7rNFOUmz6zWZ0rXHirwJjooLiRgQ7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKdvfJXDaNv4FbEl+xvqSAkGa+gJhn6TebB9ELaIQfu/VpmzMrIcV4jOpKBnWIdk6gAGSwRZFDLwYHpkdvexv0GFvIcT4HhnRJr1crp/E1oowcH2g4GsANbm5PhXnoANbFQeOLDcxq84OAZrPmxw6/rwCuHCXw/WVWiVZUdvRxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=obuvIyhk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="obuvIyhk"
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 74D46838;
	Thu, 19 Mar 2026 22:58:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773957489;
	bh=aC0FGWPPla4uf7rNFOUmz6zWZ0rXHirwJjooLiRgQ7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=obuvIyhkR0pIYx2XtVAcWsfn/dLXstgLlMwkLvZaKkdXaUb8ZnZLmZHN5F+GNL45R
	 8TcnOwEkgR0E+33XoDdrx2XINH9i1+GQNMY70QxlIYECP3W5Bg8uziNzR/OO2hNNvu
	 /9wCKqtvupxHZB6l26TnCMWJ04PfilA6Qct330m4=
Date: Thu, 19 Mar 2026 23:59:21 +0200
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
	Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v2 2/2] media: nxp: imx8-isi: Prioritize pending buffers
 over discard buffers
Message-ID: <20260319215921.GC950375@killaraus.ideasonboard.com>
References: <20260312-isi_min_buffers-v2-0-d5ea1c79ad81@nxp.com>
 <20260312-isi_min_buffers-v2-2-d5ea1c79ad81@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312-isi_min_buffers-v2-2-d5ea1c79ad81@nxp.com>

Hi Guoniu,

Thank you for the patch.

On Thu, Mar 12, 2026 at 11:12:35AM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> Change the buffer selection logic to use pending buffers first (up to the
> number available), and only use discard buffers to fill remaining slots
> when insufficient pending buffers are queued. Ensure user buffers are
> utilized as soon as possible, improving efficiency and reducing the number
> of discarded frames at stream start.

The commit message should explain *why* the change is good. How does
this improve the behaviour ?

I'll queue 1/2 in my tree already.

> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v2:
> - Replace "This ensures" with "ensure"
> - Put example from commit message to comment in driver suggested by Frank
>   https://lore.kernel.org/linux-media/20260311-isi_min_buffers-v1-0-c9299d6e8ae6@nxp.com/T/#m2774912ed31553ef1fdcc840bd6eae53a03ecccd
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index 1be3a728f32f89338a75ddcc4e96e7501ed954e1..77ebff03323ace50ff039c8333d25a9c3dd44880 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -792,7 +792,14 @@ static void mxc_isi_video_queue_first_buffers(struct mxc_isi_video *video)
>  		struct mxc_isi_buffer *buf;
>  		struct list_head *list;
>  
> -		list = i < discard ? &video->out_discard : &video->out_pending;
> +		/*
> +		 * Queue buffers: prioritize pending buffers, then discard buffers
> +		 * For example:
> +		 * - 2 pending buffers: both slots use pending buffers
> +		 * - 1 pending buffer: first slot uses pending, second uses discard
> +		 * - 0 pending buffers: both slots use discard buffers
> +		 */
> +		list = (i < 2 - discard) ? &video->out_pending : &video->out_discard;
>  		buf = list_first_entry(list, struct mxc_isi_buffer, list);
>  
>  		mxc_isi_channel_set_outbuf(video->pipe, buf->dma_addrs, buf_id);
> 

-- 
Regards,

Laurent Pinchart
