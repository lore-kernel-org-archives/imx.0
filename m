Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F2423BD1D
	for <imx@lists.linux.dev>; Thu, 19 Feb 2026 11:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771499158; cv=none; b=BSx3Gr7uLOxsyiwFqJvFY5L4Ok0fhXiRAOXgVgiCA69tQB6ZChltheyidMWNkuk70X2pADpKLW5HCgsclxCk7BKzYgoTfRM+gUuRtWOADj3J4X0sZURbblAyT+z0FPyUxvtrXnm1HJnJNTwfI9BRzUyjlblQnb73cL0OWaOLcQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771499158; c=relaxed/simple;
	bh=Gp0NksRTUHqq1A5SBK6N5M8M7nX6mOeMXc9iOk5fz1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RcrSgXGeNKdcB83zr1MlYZZxUS52aMr00YO9HHLXpifdtmcDGa2A+fqPtztdGp9H5T8N/SbDo9bITkQmQdV5MuMZ+43vnAi9c399nmUdMgQNZEUYGEKLjqdDwttG/7sP8viSo5/5huGWYWL1/zZ/mL40mGy5RALY50aTGSRBEFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vt1qm-0002ZD-RQ; Thu, 19 Feb 2026 12:05:40 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vt1qk-001Z64-1w;
	Thu, 19 Feb 2026 12:05:39 +0100
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vt1ql-0000000BNhf-3WRj;
	Thu, 19 Feb 2026 12:05:39 +0100
Date: Thu, 19 Feb 2026 12:05:39 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] drm/imx: ipuv3-plane: support underlay plane
Message-ID: <aZbug8wq4NKOAhIe@pengutronix.de>
References: <20260216-drm-imx-underlay-plane-v1-0-2dcbd1fd4ef5@pengutronix.de>
 <20260216-drm-imx-underlay-plane-v1-2-2dcbd1fd4ef5@pengutronix.de>
 <0b980d087bfe54262cef61821cbd70f5b71fc592.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0b980d087bfe54262cef61821cbd70f5b71fc592.camel@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On Mon, 16 Feb 2026 14:18:41 +0100, Philipp Zabel wrote:
> On Mo, 2026-02-16 at 13:44 +0100, Michael Tretter wrote:
> > The IPUv3 overlay plane may be placed over or under the primary plane.
> > Use an immutable position of 1 for the primary plane and a mutable
> > position including 0 and 2 for the overlay plane, to allow placing the
> > overlay plane over and under the primary plane.
> > 
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > ---
> >  drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
> > index dfd036f3195e..ddad5ea92aad 100644
> > --- a/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
> > +++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c
> > @@ -890,7 +890,7 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
> >  {
> >  	struct ipu_plane *ipu_plane;
> >  	const uint64_t *modifiers = ipu_format_modifiers;
> > -	unsigned int zpos = (type == DRM_PLANE_TYPE_PRIMARY) ? 0 : 1;
> > +	unsigned int primary_zpos = 1;
> >  	unsigned int format_count;
> >  	const uint32_t *formats;
> >  	int ret;
> > @@ -928,12 +928,14 @@ struct ipu_plane *ipu_plane_init(struct drm_device *dev, struct ipu_soc *ipu,
> >  	else
> >  		drm_plane_helper_add(&ipu_plane->base, &ipu_plane_helper_funcs);
> >  
> > -	if (dp == IPU_DP_FLOW_SYNC_BG || dp == IPU_DP_FLOW_SYNC_FG)
> > -		ret = drm_plane_create_zpos_property(&ipu_plane->base, zpos, 0,
> > -						     1);
> > +	if ((dp == IPU_DP_FLOW_SYNC_BG || dp == IPU_DP_FLOW_SYNC_FG) &&
> 
> These checks is not necessary anymore. The only overlay plane is (dp ==
> IPU_DP_FLOW_SYNC_FG).

Thanks! That's even better. I'll simplify the check in v2.

Michael
