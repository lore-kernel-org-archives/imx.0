Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838EC4315F
	for <imx@lists.linux.dev>; Mon, 14 Jul 2025 10:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752489174; cv=none; b=Z9al8Tm2OBy7dQFPwoTML+mzbJKgZd7iQov2B+vTtxREHqk8Ihipm/yYe7WPQPKiMBXmgdISkPEXvbgqE3iWTDiYHA81OvdKDcAyLJDfdQBFcjQ1bNOBf/4RrL8BWrqhbBRKBS95MZs5Wl3oKn3XaFX59UdEzJIPmish+u4gH3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752489174; c=relaxed/simple;
	bh=QffSL3TfF1zjaW22KH4kGBcPxS1hroQimLDvpcRqTkY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e8wocY6UcORbE2ookwb431iC/j+9ChFQwgvMmXOt9c8NUgnsa+gEX2VnLsYy1rITFv1a+cOI3yWm0odfIePYyAkzx+w9Qj9wzqO2RwQM028k8ibfYTky791yDlgSLfW1LTAYOTazUsWKT8rc6aRkl6LdqnVbcLW+7wpAzJ87b2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ptl6aTRU; arc=none smtp.client-ip=217.70.178.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ptl6aTRU"
Received: by mail.gandi.net (Postfix) with ESMTPSA id DF62543190;
	Mon, 14 Jul 2025 10:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752489165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VwUUlthEB0GL/tkuBikSXADM+QDOu8qT0EBANwcGFUY=;
	b=ptl6aTRU6q2sZbmunyCwSMALBSosgd8KoJVbC3EzqraKunIc8Bw4Tpl7qUSwGsyZvAJpaX
	nxMpym+ISlifa6M9yfjJNuBfLLdo8NnAo486ZnY4IyX534YPVR9/7GeHoutnlRUe8eCYoB
	xuOKJ8T3tP2c1OnpGLpDazsGB18BEKP0R0S1NdNt+nk8q7ZsE3QZ5jucNavPk/ZPUX1Yzi
	cyhzvnlezCJPyP3rz6Itw/IFMPyCvo9ivUjCAWMKzL+KgIdlSHKnXBbeUaOD7/p7zNvCWh
	KsDCZ4A9j6u5VXp4d0KbE/LFj1zKX/F4YKG3yWpau0gvUZeMVJ8cajQgbuMF/A==
Date: Mon, 14 Jul 2025 12:32:40 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Liu Ying <victor.liu@nxp.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Hui Pu <Hui.Pu@gehealthcare.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/9] drm/omapdrm: use drm_bridge_chain_get_last_bridge()
Message-ID: <20250714123240.16d8dcb1@booty>
In-Reply-To: <20250710-daffy-mini-booby-574fca@houat>
References: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-0-48920b9cf369@bootlin.com>
	<20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-4-48920b9cf369@bootlin.com>
	<20250710-daffy-mini-booby-574fca@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehudejvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvgedprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghro
 hdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhm

Hi Maxime,

On Thu, 10 Jul 2025 09:13:46 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> On Wed, Jul 09, 2025 at 06:48:03PM +0200, Luca Ceresoli wrote:
> > Use drm_bridge_chain_get_last_bridge() instead of open coding a loop with
> > two invocations of drm_bridge_get_next_bridge() per iteration.
> > 
> > Besides being cleaner and more efficient, this change is necessary in
> > preparation for drm_bridge_get_next_bridge() to get a reference to the
> > returned bridge.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> >  drivers/gpu/drm/omapdrm/omap_drv.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> > index 054b71dba6a75b8c42198c4b102a093f43a675a2..3bbcec01428a6f290afdfa40ef6f79629539a584 100644
> > --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> > +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> > @@ -378,12 +378,12 @@ static int omap_display_id(struct omap_dss_device *output)
> >  	struct device_node *node = NULL;
> >  
> >  	if (output->bridge) {
> > -		struct drm_bridge *bridge = output->bridge;
> > -
> > -		while (drm_bridge_get_next_bridge(bridge))
> > -			bridge = drm_bridge_get_next_bridge(bridge);
> > +		struct drm_bridge *bridge =
> > +			drm_bridge_chain_get_last_bridge(output->bridge->encoder);
> >  
> >  		node = bridge->of_node;
> > +
> > +		drm_bridge_put(bridge);  
> 
> Any reason you're not using __free(drm_bridge_put) here?

Just because the code is simple enough that an explicit
drm_bridge_put() is clearly sufficient.

Do you think __free() should be used even in such trivial cases?

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
