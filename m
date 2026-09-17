Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A7B4CDDCE
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 20:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789677451; cv=none; b=KSw4ccuc4+bWiGpnlsAHPas7HrJS9igjNPPbjwtUICTcHyVxoerek7jb8YrxB7o7jms06KKWatWKyS4e8U+lkHQA6v+MeF+Ec/iOj4I4Iv+x5ckA2RxVpD8PDQ+pOs39etJ3etVa6SmaC4bL3qVxcS9PCeYr9sAkyGceLTyh1jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789677451; c=relaxed/simple;
	bh=Su6Xr4aruy1yatXoxrDqVBZImuLQIc/z1W7Wnsg0pXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmqB41aV5a+keMbBiuseJ113WNG/khhjqK9IHMqresbloXX2ukNapnvVtUXbcolSCAGhbfc97W3gp6QeQ8OU2djg+tbVFvjTqLnT4c+/opTEivctVZ4eyyis6y7XU5IXlo0wt09+HsXr+R/Audhwt5/Lqw83108TpIkdFRRzfVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SPTjsIT8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SPTjsIT8"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 530AA2C6;
	Thu, 17 Sep 2026 22:35:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789677344;
	bh=Su6Xr4aruy1yatXoxrDqVBZImuLQIc/z1W7Wnsg0pXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SPTjsIT84F9kPdVkSHRwwGsKbKl9TtBbgUGN4XKZzFkYajdAdzqmqa8m+yih5+t0O
	 cSP7bYYGGHWg/nGG8q/rGXEGK1FOq2FxfKbQOgf8jAYvxA05vuasPGRxEyVgrSQrPX
	 Ms1gqLZgbZhyXTqgvYiLbV75mJtzeAXGZr3l9HeM=
Date: Thu, 17 Sep 2026 23:37:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>, Xu Rao <raoxu@uniontech.com>,
	Kees Cook <kees@kernel.org>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev,
	vkoul@kernel.org
Subject: Re: [PATCH 1/1] media: m2m-deinterlace: replace direct
 ->device_prep*() calls with standard DMA engine API
Message-ID: <20260917203725.GB59058@killaraus.ideasonboard.com>
References: <20260917190420.1189246-1-Frank.Li@oss.nxp.com>
 <20260917202931.GA59058@killaraus.ideasonboard.com>
 <aqxOtZdsNR03qmqN@SMW015318>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aqxOtZdsNR03qmqN@SMW015318>

On Thu, Sep 17, 2026 at 03:33:57PM -0500, Frank Li wrote:
> On Thu, Sep 17, 2026 at 11:29:31PM +0300, Laurent Pinchart wrote:
> > On Thu, Sep 17, 2026 at 03:04:16PM -0400, Frank.Li@oss.nxp.com wrote:
> > > From: Frank Li <Frank.Li@nxp.com>
> > >
> > > DMA engine consumers must not call the channel's device_prep_*() function
> > > pointers directly. Use the standard dmaengine wrapper APIs instead.
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > I've checked the other DMA operations, and there are a few direct
> > callers of .device_prep_dma_memcpy() and .device_prep_slave_sg(). The
> > former should be easy to address, as the dmaengine_prep_dma_memcpy()
> > wrapper is a drop-in replacement. The latter may be a bit more
> > complicated.
> >
> > Any volunteer to send patches ? :-)
> 
> I already sent out and try to cleanup all.

Thank you. A patch for checkpatch.pl to warn about new callers may also
be interesting.

> > > ---
> > >  drivers/media/platform/m2m-deinterlace.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/platform/m2m-deinterlace.c b/drivers/media/platform/m2m-deinterlace.c
> > > index 9dcc4bd6cbdd5..57a91ff2269f2 100644
> > > --- a/drivers/media/platform/m2m-deinterlace.c
> > > +++ b/drivers/media/platform/m2m-deinterlace.c
> > > @@ -330,7 +330,7 @@ static void deinterlace_issue_dma(struct deinterlace_ctx *ctx, int op,
> > >  	ctx->xt->dst_sgl = true;
> > >  	flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
> > >
> > > -	tx = dmadev->device_prep_interleaved_dma(chan, ctx->xt, flags);
> > > +	tx = dmaengine_prep_interleaved_dma(chan, ctx->xt, flags);
> > >  	if (tx == NULL) {
> > >  		v4l2_warn(&pcdev->v4l2_dev, "DMA interleaved prep error\n");
> > >  		return;

-- 
Regards,

Laurent Pinchart
