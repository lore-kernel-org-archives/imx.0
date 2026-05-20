Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D78372B58
	for <imx@lists.linux.dev>; Wed, 20 May 2026 17:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779297508; cv=none; b=g3lveFUe0TnMVGLXFWcx85GNtNpLmHxumejvwXtL0uslwHZWFPGjDjEFdKo6he53wcof4SnOFee9z6vDwAbp944A6CnTO9wbUD3KkCXyb6Y9qvOpSd4936nI1Zi6lS8HbvHUL+PAEmAeHLlkpGk+fmRKCN0NKwsimSQEhtEQao4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779297508; c=relaxed/simple;
	bh=SdNwW88iWi7AkoXwYX3WeYLuqlhdDa8lx65aFipphKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pw4tKSIIsGU79niKITfF02KNj72kBYV0fdYBXUqoSpwgSjG/zI1E7+sAduNlR1bE+IHSLGuRSHvAH+chedi1XYuWtcsbjH4JvR1ASLwOD5RnTH64JJUm/qCqBQfrc1ldWTWsWPRBdlPaj6969VAJs4dLWIVMRmh2TozaYPT/jYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TlsYqd9Y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TlsYqd9Y"
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a01:cb1d:8f2:800:42d6:38fa:3bdf:70df])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 19607268;
	Wed, 20 May 2026 19:18:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779297491;
	bh=SdNwW88iWi7AkoXwYX3WeYLuqlhdDa8lx65aFipphKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TlsYqd9YSr97W1ZxJoABG3NCW9hUFMFVYwQfvfVK2kRyYKn6QgU57KXe5k4mlTeOE
	 4DBAw1VtQGX/z5GZtAXODtan8MRRuFT/9N7Rc2pbJHMtpooPNfA9hpVin4mnBq7NQ8
	 OJ7Ec3FttM3MJI1O2TEf6il/hgoQEaBZEzhgrUCk=
Date: Wed, 20 May 2026 19:18:23 +0200
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
Subject: Re: [PATCH v3 2/2] media: nxp: imx8-isi: Prioritize pending buffers
 over discard buffers
Message-ID: <20260520171823.GA11968@killaraus.ideasonboard.com>
References: <20260320-isi_min_buffers-v3-0-66e0fabccca3@oss.nxp.com>
 <20260320-isi_min_buffers-v3-2-66e0fabccca3@oss.nxp.com>
 <20260520171026.GA10336@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260520171026.GA10336@killaraus.ideasonboard.com>

On Wed, May 20, 2026 at 07:10:27PM +0200, Laurent Pinchart wrote:
> Hello Guoniu,
> 
> Thank you for the patch.
> 
> On Fri, Mar 20, 2026 at 02:42:02PM +0800, Guoniu Zhou wrote:
> > From: Guoniu Zhou <guoniu.zhou@nxp.com>
> > 
> > The number of times to use the discard buffer is determined by the
> > out_pending list size:
> > 
> >   discard = list_empty(&video->out_pending) ? 2
> >             : list_is_singular(&video->out_pending) ? 1
> > 	    : 0;
> > 
> > In the current buffer selection logic, when both discard and pending
> > buffers are available, the driver fills hardware slots with discard
> > buffers first which results in an unnecessary frame drop even though
> > a user buffer was queued and ready.
> > 
> > Change the buffer selection logic to use pending buffers first (up to
> > the number available), and only use discard buffers to fill remaining
> > slots when insufficient pending buffers are queued.
> > 
> > This improves behavior by:
> > - Reducing discarded frames at stream start when user buffers are ready
> > - Decreasing latency in delivering captured frames to user-space
> > - Ensuring user buffers are utilized as soon as they are queued
> > - Improving overall buffer utilization efficiency
> 
> There's a bit of repeat here, but that's OK.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > ---
> > Changes in v3:
> > - Expanded commit message to explain the problem in current driver and the
> >   benefits gained from this change
> > - No code changes
> > 
> > Changes in v2:
> > - Replace "This ensures" with "ensure"
> > - Put example from commit message to comment in driver suggested by Frank
> >   https://lore.kernel.org/linux-media/20260311-isi_min_buffers-v1-0-c9299d6e8ae6@nxp.com/T/#m2774912ed31553ef1fdcc840bd6eae53a03ecccd
> > ---
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > index 1be3a728f32f..77ebff03323a 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> > @@ -792,7 +792,14 @@ static void mxc_isi_video_queue_first_buffers(struct mxc_isi_video *video)
> >  		struct mxc_isi_buffer *buf;
> >  		struct list_head *list;
> >  
> > -		list = i < discard ? &video->out_discard : &video->out_pending;
> > +		/*
> > +		 * Queue buffers: prioritize pending buffers, then discard buffers
> > +		 * For example:
> > +		 * - 2 pending buffers: both slots use pending buffers
> > +		 * - 1 pending buffer: first slot uses pending, second uses discard
> > +		 * - 0 pending buffers: both slots use discard buffers
> > +		 */

Having a second look, I think this is a bit too verbose. Unless you
object, I'll write

		 * Queue buffers: prioritize pending buffers, then discard
		 * buffers.

No need to submit a new version.

> > +		list = (i < 2 - discard) ? &video->out_pending : &video->out_discard;
> >  		buf = list_first_entry(list, struct mxc_isi_buffer, list);
> >  
> >  		mxc_isi_channel_set_outbuf(video->pipe, buf->dma_addrs, buf_id);

-- 
Regards,

Laurent Pinchart
