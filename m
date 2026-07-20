Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB25419FBD
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 17:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784568736; cv=none; b=Eo7Vhv/UopfRK/1zRU2GctoyLNEDIeGMmbILgxQfRCgX+QzViWPfBNGAkZgW2UX5H14dZSFBj9jdn/Np3HzxJOQDkodL5QeyBLh5+z9RrrEkxXIqRLFhjHGOgGswp+E/XvjN1LWE0NcWgKUsDqsnZ2EGfbrdOoX9Sw5z9zId5xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784568736; c=relaxed/simple;
	bh=cYGNX9mRpVXFAQsh4CySThVivtxoWoVmU2ZjBC7rjd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DafwXfjXaeY7XbAYTW+Ai98js+wh7km2XPxnh4M9zOQIBKrqyw7sarxCxNH3TAChGueIUvnj8Nfi0v5KyzOKCT6iwTylnTBAIOuf43VY9lL7SGiyG9P8d4CRppw3hq8MUT7+slCvVzsb+j8O7t2wrQoCjdUG/GCihF/WmE7X+OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EW7Zrizv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EW7Zrizv"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16120289;
	Mon, 20 Jul 2026 19:31:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784568672;
	bh=cYGNX9mRpVXFAQsh4CySThVivtxoWoVmU2ZjBC7rjd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EW7Zrizv8m+gSZXtFawFuU/ZOIyv2wPIARm92Y3ILP94dmnEfJuP8oVd8kJh/89Vz
	 alQy/wSGeEx5o5h2U5EC8d0h3OqtYGdGD0oqHae8A+7A4Xq1pzw1vzMJ2TYdc+K8Rj
	 vjIJNV4G3i8okkI5uD/Ao7CniMG8AHPV+68Xx+qc=
Date: Mon, 20 Jul 2026 20:32:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christian Hemp <c.hemp@phytec.de>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] media: nxp: imx8-isi: Add stream ID validation
 for crossbar routing
Message-ID: <20260720173209.GB50424@killaraus.ideasonboard.com>
References: <20260720-isi-v2-0-45845bc5d4fa@oss.nxp.com>
 <20260720-isi-v2-2-45845bc5d4fa@oss.nxp.com>
 <al46mfiUE5lr8rRF@SMW015318>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <al46mfiUE5lr8rRF@SMW015318>

On Mon, Jul 20, 2026 at 10:11:21AM -0500, Frank Li wrote:
> On Mon, Jul 20, 2026 at 11:34:04AM +0800, Guoniu Zhou wrote:
> > Add validation to enforce hardware constraints that were previously
> > missing in the crossbar routing configuration:
> >
> > - SOURCE stream must be 0 (ISI pipes are hardcoded to stream 0)
> >
> > This check complements the existing memory input validation and ensures
> > that all routing configurations respect hardware limitations.
> >
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> > ---
> > Changes in v2:
> > - New patch split from v1 1/5: adds stream ID validation on top of
> >   for_each_active_route() fix (Frank Li)
> > - Remove incorrect sink_stream validation
> > ---
> >  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > index 84871bceb31d..328d08a278ea 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> > @@ -106,8 +106,20 @@ static int __mxc_isi_crossbar_set_routing(struct v4l2_subdev *sd,
> >  	if (ret)
> >  		return ret;
> >
> > -	/* The memory input can be routed to the first pipeline only. */
> > +	/*
> > +	 * Validate routes against hardware constraints:
> > +	 * - SOURCE stream must be 0 (pipes are hardcoded to stream 0)
> > +	 * - Memory input can only route to the first pipeline
> > +	 */
> >  	for_each_active_route(routing, route) {
> > +		if (route->source_stream != 0) {
> > +			dev_dbg(xbar->isi->dev,
> 
> it is one error, should be dev_err()?

As this is an error that can be triggered by userspace, we prefer
dev_dbg() to avoid giving unpriviledge userspace a way to flood the
kernel log.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> > +				"route to pipe %u must use source_stream=0, got %u\n",
> > +				route->source_pad - xbar->num_sinks,
> > +				route->source_stream);
> > +			return -ENXIO;
> > +		}
> > +
> >  		if (route->sink_pad == xbar->num_sinks - 1 &&
> >  		    route->source_pad != xbar->num_sinks) {
> >  			dev_dbg(xbar->isi->dev,

-- 
Regards,

Laurent Pinchart
