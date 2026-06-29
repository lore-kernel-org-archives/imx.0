Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631A9426D39
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 14:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782744289; cv=none; b=lx0poNLLVUZjPgxH43xx+U0TZKPjO60dpMOCqoMJX6RCJzxJBVqU30BSryaMzlKtguy+H6WcKX3Q6eJ5ilgrIXtgGu/Ug0EVKaCTtfABgj4+90m4JXI+MU+TrQ5cq44JgeMGOqhpVhT5VtUmBIVlGVQF3FXlNaF0pxKQoyPDnz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782744289; c=relaxed/simple;
	bh=rgpIHVCv/jG78fP6tu1dl2Qy9Ys1bGvoYAfVxN1Vrr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AwDy2+U6i2kBwT0xXIU+o83IZTpA42StSgfuZyBv4udCSFaLqT25jb/kBsz0OIoogKW3iykk+NJPAJqG/aw6edyQNtrBHOqrv6d0nRLCh7ZAbEEyA1/f8B5xDdYSt+a2AQPUAmF15uAV0CWV2matbWeOvwzac5bNkeDfKj88X6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gokLY0M0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gokLY0M0"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8DBE0E91;
	Mon, 29 Jun 2026 16:44:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782744241;
	bh=rgpIHVCv/jG78fP6tu1dl2Qy9Ys1bGvoYAfVxN1Vrr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gokLY0M0tPdapkigMuv4Uqg6nQoeAp9ooLReXpUXVg3B3IlLcUc15FrUa6tHeiqlN
	 XFFu3bImhumtdCJX1OIyNvqmI5cXpP+Vyu/8E7LiH3H7pl79GTXJAoWrYLIka2vje4
	 m2AGTwxSCKAcReaJbpW3lBv0zCLhNN5BQxEZwwZM=
Date: Mon, 29 Jun 2026 17:44:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hui Pu <Hui.Pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 05/37] drm/display: bridge-connector: split code creating
 the connector to a subfunction
Message-ID: <20260629144443.GA3106950@killaraus.ideasonboard.com>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-5-45e2bdb3dfb4@bootlin.com>
 <20260608-mindful-heavy-frigatebird-be9faf@houat>
 <DJ735MTNMYD1.3LPNV404V8PIU@bootlin.com>
 <20260624-proud-unbiased-pony-ecc3c3@houat>
 <DJHEAWSEZR79.19UFIKS8QJBQ7@bootlin.com>
 <20260626-polite-hairy-perch-25e1aa@houat>
 <DJJ1MPCEJGZD.UZM9183V6ZE5@bootlin.com>
 <20260626-classy-nightingale-of-romance-1cacad@houat>
 <DJJ4X22CJ3FG.5EYF84LVRNOG@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DJJ4X22CJ3FG.5EYF84LVRNOG@bootlin.com>

On Fri, Jun 26, 2026 at 06:51:14PM +0200, Luca Ceresoli wrote:
> On Fri Jun 26, 2026 at 4:38 PM CEST, Maxime Ripard wrote:
> > On Fri, Jun 26, 2026 at 04:16:39PM +0200, Luca Ceresoli wrote:
> >> On Fri Jun 26, 2026 at 12:09 PM CEST, Maxime Ripard wrote:
> >> > On Wed, Jun 24, 2026 at 05:47:10PM +0200, Luca Ceresoli wrote:
> >> >> On Wed Jun 24, 2026 at 1:41 PM CEST, Maxime Ripard wrote:
> >> >> > On Fri, Jun 12, 2026 at 02:56:24PM +0200, Luca Ceresoli wrote:
> >> >> >> On Mon Jun 8, 2026 at 1:40 PM CEST, Maxime Ripard wrote:
> >> >> >> > On Tue, May 19, 2026 at 12:37:22PM +0200, Luca Ceresoli wrote:
> >> >> >> >> In preparation to introduce bridge hotplug, split out from
> >> >> >> >> drm_bridge_connector_init() the code adding the drm_connector into a
> >> >> >> >> dedicated function. This will be needed to be able to add (and re-add) the
> >> >> >> >> connector from different code paths.
> >> >> >> >
> >> >> >> > Same story here, explaining what you need later on that calls for that
> >> >> >> > change would be nice.
> >> >> >>
> >> >> >> Here's a more verbose version:
> >> >> >>
> >> >> >>     Currently drm_bridge_connector_init() does two things:
> >> >> >>
> >> >> >>      * allocate and initialize the drm_bridge_connector
> >> >> >>        (which embeds a drm_connector)
> >> >> >>      * initialize and register the embedded drm_connector
> >> >> >>
> >> >> >>     For bridge hotplug we need to separate these two actions:
> >> >> >>
> >> >> >>      * the drm_connector needs to be added and removed at any time based on
> >> >> >>        hotplug events
> >> >> >>      * the drm_bridge_connector is designated to create and remove the
> >> >> >>        drm_connector, so it must be persistent for the card lifetime
> >> >> >>
> >> >> >>     As the lifetimes of drm_bridge_connector and drm_connector become
> >> >> >>     different, we need to create them in different moments.
> >> >> >>
> >> >> >>     In preparation to support that, split out from
> >> >> >>     drm_bridge_connector_init() the code adding the drm_connector into a
> >> >> >>     dedicated function. No functional changes, just moving code around for
> >> >> >>     now. A future commit will make the drm_connector be created based on
> >> >> >>     hotplug events.
> >> >> >>
> >> >> >> Looks good?
> >> >> >
> >> >> > The message itself, yes, thanks.
> >> >> >
> >> >> > However, I have questions now :)
> >> >> >
> >> >> > Do we really expect drm_bridge_connector to stick around when a bridge
> >> >> > gets unplugged? If so, how does it cope with having, say, an HDMI
> >> >> > connector, and then swapping out the hotplugged part for an LVDS one?
> >> >> > Does the HDMI connector sticks around indefinitely?
> >> >>
> >> >> In your example, the HDMI drm_connector would be unregistered and put on
> >> >> hotunplug. Its allocation will stick around until the last put but that's
> >> >> quite irrelevant. Then, on plugging the LVDS addon, a new LVDS
> >> >> drm_connector will be created and registered.
> >> >>
> >> >> > *Especially* if we're using overlays for this, I'd expect everything
> >> >> >  after the first hotplugged bridge to be destroyed, no?
> >> >>
> >> >> As said, it would be unregistered immediately but might be freed later on
> >> >> if still refcounted.
> >> >>
> >> >> This is visible in patches 36+15, the path to follow is:
> >> >>
> >> >>  drm_bridge_connector_handle_event(event = DRM_BRIDGE_DETACHED) [patch 36]
> >> >>  -> drm_bridge_connector_dynconn_release()                      [patch 15]
> >> >>
> >> >> Does this solve your concern?
> >> >
> >> > Not really, I'm talking about drm_bridge_connector. The fact that
> >> > bridges are destroyed make sense to me. The fact that
> >> > drm_bridge_connector sticks around doesn't. It's supposed to be a
> >> > connector for bridges. If you don't have bridges because they got
> >> > destroyed, and connector, drm_bridge_connector doesn't have a reason to
> >> > exist anymore, unless it's drm_bridge_hotplug in a trench coat :)
> >>
> >> It is not a hotplug-bridge in a trench coat, no :) The code is clear about
> >> this.
> >>
> >> I'd say with this series a "drm_bridge_connector" is just becoming
> >> something more (perhaps something else too). Somewhat as "a drm_bridge is
> >> either a bridge or something else". :)
> >>
> >>
> >> But let's leave names aside for a moment. If just looking at the current
> >> code, the drm_bridge_connector is "a handler, owned by the card/encoder and
> >> having the same lifetime, which takes care of drm_connector
> >> creation/destruction at card probe/removal".
> >>
> >> What we need now is just the same plug " and on hotplug events" appended.
> >>
> >> So in both cases there needs to be "a handler persitent with the card".
> >>
> >> Do we agree so far?
> >
> > Ish. If we go for that, then we need to update the name.
> 
> drm_connector_manager?
> drm_bridge_connector_manager?

I'm fine with a rename. When developing drm_bridge_connector I've always
envisioned it as code that manages the creation of a connector for a
chain of bridges. In particular, the drm_bridge_connector object is
*not* and has never been a bridge.

Ideally all this should move to the DRM core and be transparent to
drivers. Drivers could set a flag somewhere to opt-in for connectors
managed by the DRM core.

> > drm_bridge_connector for something that is neither a bridge or a
> > connector is not great.
> >
> > But even then, I'm not even sure why we need to have that "manager" in
> > the first place. You want to make bridges be aware if they are the last
> > in the chain or not.

I don't think bridges should be aware of whether or not they're the last
one in the chain.

> > Use that property in attach to either create a
> > drm_bridge_connector instance if you're last, or attach the next bridge
> > if you aren't.
> 
> What? o_O
> 
> Several encoder drivers have been painfully converted to create a
> drm_bridge_connector. Now if the bridges start doing it themselves we
> should go back to those encoder drivers and ditch all the
> drm_bridge_connector from there?
> 
> I must be missing something. Can you elaborate on this?

-- 
Regards,

Laurent Pinchart
