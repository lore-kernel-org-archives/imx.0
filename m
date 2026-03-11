Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DFC1E4AF
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 19:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773258356; cv=none; b=OWNkkbpx3s9r75RdvRmXg/pYdcS4YbqtiVSui8Cu+c5mDrK22axC7B879edU/FqTF5SzPRwilEMkXDgqiboqugHBAtsadfp4oTXH5CfTlBsc4HHJtlwg8Jqap73yTkFrH8UqD0VtNrLGebamR3PZH5JBJLMCiTY7yf9LXS2RasY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773258356; c=relaxed/simple;
	bh=28bBRNfsyPKm+eji2CAGQaH32hvOKs3oH5Dmh4xphLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P68TPdktDfSbkudYa+XR543WD+Iup2vSIVKFbWCysE6uypSpFV2QBTLZj7Z8EqGDgsnqlY70lI08cC/1LVpFQijUjNtK5LDSjYo76UKNpCrlyV0DyqSVNxs7Yu+HkAeEf5nGMUTPFef/hgUUoqOVKPeYluunwXYFpLCyRd1tc2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1w0PUl-0003Gd-NH; Wed, 11 Mar 2026 20:45:27 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1w0PUi-004uHc-1s;
	Wed, 11 Mar 2026 20:45:25 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1w0PUj-0000000DVMM-3LA5;
	Wed, 11 Mar 2026 20:45:25 +0100
Date: Wed, 11 Mar 2026 20:45:25 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Liu Ying <victor.liu@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v11 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
Message-ID: <ot5qypkeirkiweicjijholt2hwfpnnfhrcm3d6euqfnupptsab@din4bkq2sh5h>
References: <20260303-v6-18-topic-imx93-parallel-display-v11-0-1b03733c8461@pengutronix.de>
 <20260303-v6-18-topic-imx93-parallel-display-v11-2-1b03733c8461@pengutronix.de>
 <33e09cc9-69bd-468b-8361-b92a50686f74@nxp.com>
 <DGZ2XYTVUR28.16ITKRM9S2ACV@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGZ2XYTVUR28.16ITKRM9S2ACV@bootlin.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Hi Liu, Luca,

sorry for the delayed response, I was at the EW26.

On 26-03-10, Luca Ceresoli wrote:
> Hi Liu, Marco,
> 
> On Tue Mar 10, 2026 at 3:57 AM CET, Liu Ying wrote:
> > Hi Marco, Luca,
> >
> > On Tue, Mar 03, 2026 at 11:34:27AM +0100, Marco Felsch wrote:
> >
> > [...]
> >
> >> +	next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> >> +	if (IS_ERR(next_bridge))
> >> +		return dev_err_probe(dev, PTR_ERR(next_bridge),
> >> +				     "failed to get next bridge\n");
> >> +	pdfc->dev = dev;
> >> +	pdfc->bridge.of_node = dev->of_node;
> >> +	pdfc->bridge.type = DRM_MODE_CONNECTOR_DPI;
> >> +	pdfc->bridge.next_bridge = next_bridge;
> >
> > When I was reviewing another patch[1], I was aware of the necessity of
> > calling drm_bridge_get() for next_bridge to balance the next bridge's
> > refcount put from __drm_bridge_free() for this bridge.  I'd be good if
> > Luca may confirm this is correct.  Sorry for bringing this up late.
> 
> Indeed you have a good point.

At which stage did you faced this issue? During driver probe, because of
EPROBE_DEFER?

That's the reason for having the local next_bridge variable since I
faced with the same issue. In other words this driver is correct and
it's on purpose to not assign it directly. Albeit I could/should have
added a comment.

> After re-checking devm_drm_of_get_bridge(), as I wrote on the other thread
> you pointed to, you should call drm_bridge_get():
> 
> -	pdfc->bridge.next_bridge = next_bridge;
> +	pdfc->bridge.next_bridge = drm_bridge_get(next_bridge);
>
> Marco, you can keep my R-by if you resend with just this change.
> 
> Sorry about the confusion here.
> 
> As mention on the other thread, devm_drm_of_get_bridge() is unable to
> support bridge hotplug. So it should be deprecated, but as of now there is
> no alternative.

Sorry I need a bit more context. What's the issue? How can I trigger the
issue? Why is bridge hotplug required at this stage? Why is only this
bridge affecte by the hotplug issue?

Regards,
  Marco



> 
> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
