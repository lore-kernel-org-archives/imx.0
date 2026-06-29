Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD343B71BC
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 08:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782722721; cv=none; b=c5biO422+4KcsPOzfKZy7tshxWnY5ildJY2UkwEoeVPIV8R6Ez5tJB1jRq+YyDTVxF08poUFTU3G20lwDrQZbCjJUX/LUAzzSFM4uxbdCld33ekYE8JLkS82nto0v6peFt6YuOLT1wASeoANuiCEj4ISzbDwYzufqT4XYk5HiJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782722721; c=relaxed/simple;
	bh=3mwpvD9m0LM0xROJVh89e4aig42l8CUBljGvEkPTYjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hYfqfg2LFwrhqvWJHymtv1yPzOBom3FV7dXttNe9Pg3OYBsQ0EuXAzKMHALCJ4EZ3b4NfoaxoSIt2K0sWgmrIGL71cuiZI2LjOTl9MN01ZrKyz8jBkCXpgrgLVQ5eCA2jpkLYoH9FU9LHBrcXXjU+lRvllZ8GB4xFA1lhQlJXwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VjWlPhJP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VjWlPhJP"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D69212F;
	Mon, 29 Jun 2026 10:44:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782722674;
	bh=3mwpvD9m0LM0xROJVh89e4aig42l8CUBljGvEkPTYjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VjWlPhJPzYIHg18PptzEGYwDvLtAzb2fUCkJiwnGIxi6hQOdv8wATBbgLDCU/oHu+
	 DsK53Q4xrldvi4EKioRYUSUeM6oqmPda9tImbR5UhFfFiwv82mWpoQQIKL7ubRDyKA
	 FaVUrcdkJXd3H1scI3qlVoHfhi40eyXHkTm4wAz4=
Date: Mon, 29 Jun 2026 11:45:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>, Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Guoniu Zhou <guoniu.zhou@nxp.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 1/9] media: mc-entity: Store parsed V4L2 fwnode
 endpoint in media_pad
Message-ID: <20260629084516.GA3054459@killaraus.ideasonboard.com>
References: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
 <20260624-imx8qxp_pcam-v6-1-4b3f45920d2f@nxp.com>
 <akGD3ZjW6GPHHI3D@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <akGD3ZjW6GPHHI3D@kekkonen.localdomain>

On Sun, Jun 28, 2026 at 11:28:13PM +0300, Sakari Ailus wrote:
> On Wed, Jun 24, 2026 at 04:37:48PM -0400, Frank.Li@oss.nxp.com wrote:
> > From: Frank Li <Frank.Li@nxp.com>
> > 
> > Each media pad is associated with a firmware node endpoint. Capture the
> > parsed V4L2 fwnode endpoint information in struct media_pad so it can be
> > reused by consumers.
> > 
> > This avoids reparsing firmware node endpoint data every time the endpoint
> > configuration is needed, reduces duplicate code, and provides a common
> > place to store endpoint properties associated with a pad.
> > 
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Assume 1 to 1 map between dt's endpoint to medie pad.
> > Change in v6
> > - new patch
> > ---
> >  include/media/media-entity.h | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> > index d9b72cd87d524..4a3785cd9f370 100644
> > --- a/include/media/media-entity.h
> > +++ b/include/media/media-entity.h
> > @@ -20,6 +20,8 @@
> >  #include <linux/minmax.h>
> >  #include <linux/types.h>
> >  
> > +#include <media/v4l2-fwnode.h>
> 
> We have dependencies from V4L2 to MC but not the other way around as MC is
> (or was?) intended for wider use then just V4L2. I'm thus more than a bit
> hesitant adding any references to V4L2 in MC.
> 
> I wonder what Hans and Laurent think.

I agree. Furthermore, this will significantly increase the size of the
media_pad structure, for all pads. That's not a good design.

> > +
> >  /* Enums used internally at the media controller to represent graphs */
> >  
> >  /**
> > @@ -230,6 +232,7 @@ enum media_pad_signal_type {
> >   * @flags:	Pad flags, as defined in
> >   *		:ref:`include/uapi/linux/media.h <media_header>`
> >   *		(seek for ``MEDIA_PAD_FL_*``)
> > + * @vep:	associated fwnode endpoint information
> >   * @pipe:	Pipeline this pad belongs to. Use media_entity_pipeline() to
> >   *		access this field.
> >   */
> > @@ -240,7 +243,7 @@ struct media_pad {
> >  	u16 num_links;
> >  	enum media_pad_signal_type sig_type;
> >  	unsigned long flags;
> > -
> > +	struct v4l2_fwnode_endpoint vep;
> >  	/*
> >  	 * The fields below are private, and should only be accessed via
> >  	 * appropriate functions.
> > 
> 
> -- 
> Regards,
> 
> Sakari Ailus

-- 
Regards,

Laurent Pinchart
