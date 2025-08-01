Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E551F2C45
	for <imx@lists.linux.dev>; Fri,  1 Aug 2025 17:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754068001; cv=none; b=nTJGJpsvTTSg5IWPFVOEakHGFKBWQo9TEbzFakcxgEHgN4XdygoN8PtDYvWCR1MVrkvZaXHJaHhJN+UYlEV0CeS1XWm/p91aiHFVPdslXBM3FSXpF74/CO6Z7QAwvNoL4SemJK7/nC6gOPj4LN+w9GRcJHgLayvFmzR63M8Lmao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754068001; c=relaxed/simple;
	bh=/ry80e1TzhBi4seREQPK0ZDEO5mEi4VXxq7163G7wco=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dyr1V3xJWxj0MyPM3Fpifd1DNFEqvbezSOfDb6ze8iFi7bi56+Mt6r4761Gx7ij9AxbvrnzvmoRNnWv5iYnWG9Wg/XIVhPB0Z44KObO3J3LAtY+8TA+pXJctHQsQeHnbLLMdjQVxgLddZNiaVCZrPqeMtS4Bn7kDhr8KA4uc1sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kVsDcI8t; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kVsDcI8t"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B36341C7B;
	Fri,  1 Aug 2025 17:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754067992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+DtLqWt0RH6iO3+9BYod+1Nz6NKvB/x/ipIsyCwJyeM=;
	b=kVsDcI8tVIZ9az8Z9IFImwbP5Qu3o6qq2cTADnSkorOVDY4EngMnIk4bFJ2a9/spFrA5E0
	+iC+/G8ADzx+FgI+CJTm+qRQ2GLSFSCjI3wR42jdEJwlrRFmhGI6ARYvaK+V+cN8Lhm4c6
	RVqpldFYVspDn8ra5DPAh2rdDBr+IHifVzakXLZns3yAk/brFZEzbiN/4Rv94f/4DedQ66
	CsRYU91YPB2tzxkfPpfbkNcyOU0wbONthpqD0gQ/yB1Xhqu0v8sE2V+wyCK/t6xRMsY2g5
	Mc8kAZa1+1nIBviTXmz+nyv+Xyo5PCaZ7tmZYRzYBlIO+Lf89Jo8811+aeiziw==
Date: Fri, 1 Aug 2025 19:06:25 +0200
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
Message-ID: <20250801190625.7b9f5f50@booty>
In-Reply-To: <20250725-holistic-ambrosial-jellyfish-f41f6b@houat>
References: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-0-48920b9cf369@bootlin.com>
	<20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-4-48920b9cf369@bootlin.com>
	<20250710-daffy-mini-booby-574fca@houat>
	<20250714123240.16d8dcb1@booty>
	<20250725-holistic-ambrosial-jellyfish-f41f6b@houat>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdegvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdegpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrr
 hhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com

Hi Maxime,

On Fri, 25 Jul 2025 16:15:23 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> On Mon, Jul 14, 2025 at 12:32:40PM +0200, Luca Ceresoli wrote:
> > Hi Maxime,
> > 
> > On Thu, 10 Jul 2025 09:13:46 +0200
> > Maxime Ripard <mripard@kernel.org> wrote:
> >   
> > > On Wed, Jul 09, 2025 at 06:48:03PM +0200, Luca Ceresoli wrote:  
> > > > Use drm_bridge_chain_get_last_bridge() instead of open coding a loop with
> > > > two invocations of drm_bridge_get_next_bridge() per iteration.
> > > > 
> > > > Besides being cleaner and more efficient, this change is necessary in
> > > > preparation for drm_bridge_get_next_bridge() to get a reference to the
> > > > returned bridge.
> > > > 
> > > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > > ---
> > > >  drivers/gpu/drm/omapdrm/omap_drv.c | 8 ++++----
> > > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
> > > > index 054b71dba6a75b8c42198c4b102a093f43a675a2..3bbcec01428a6f290afdfa40ef6f79629539a584 100644
> > > > --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> > > > +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> > > > @@ -378,12 +378,12 @@ static int omap_display_id(struct omap_dss_device *output)
> > > >  	struct device_node *node = NULL;
> > > >  
> > > >  	if (output->bridge) {
> > > > -		struct drm_bridge *bridge = output->bridge;
> > > > -
> > > > -		while (drm_bridge_get_next_bridge(bridge))
> > > > -			bridge = drm_bridge_get_next_bridge(bridge);
> > > > +		struct drm_bridge *bridge =
> > > > +			drm_bridge_chain_get_last_bridge(output->bridge->encoder);
> > > >  
> > > >  		node = bridge->of_node;
> > > > +
> > > > +		drm_bridge_put(bridge);    
> > > 
> > > Any reason you're not using __free(drm_bridge_put) here?  
> > 
> > Just because the code is simple enough that an explicit
> > drm_bridge_put() is clearly sufficient.
> > 
> > Do you think __free() should be used even in such trivial cases?  
> 
> It's a matter of opinion at this point :)
> 
> It' makes it a bit easier and consistent so that's why I raised it, but
> if you feel like it's too much, that's fine by me as well.

In the end I chose to use __free here as well for v2, for consistency
over the series.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
