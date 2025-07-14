Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBA21FBE87
	for <imx@lists.linux.dev>; Mon, 14 Jul 2025 10:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752487738; cv=none; b=ZKkbGQaBTiIX9bK+SIxfWCFb+sKbxWE93fRqkT+2W5AOHFzAiNvAe2n0at7QZW43i/9dBCTybKCr8gxkFfRxO/P1erAB40aR9Vs7LYDBL8/8nRGa9q9KEjSamw1AMwThr9iMKbJsdeBrTGIPyzsk264jfNrEFEP2y2p2Q3GLG+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752487738; c=relaxed/simple;
	bh=sUbfXG/kIveTshOzurB1Oe+PyDBe1n88waGVjM3wNbY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PXrvyttPAF6rozmznpejCAWKox/TYOEEkyxtHo2IBqDgToTJV6q8ZziudrmMPVPloKVxaChSGEEfuPNECSddBBi/TiSPO1ZHpcL5/vRQteoM08MPmv4ME2HEMrt405f8ihCNyXsRDSd+QeJoD2AaGYoJi1F4CU16fyTwPvyLWsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FndN3beY; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FndN3beY"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1CF1B43185;
	Mon, 14 Jul 2025 10:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752487727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xgutdRjLLdQi2RnkqaGrlwK27BoBj8ki0FopHfGLe9A=;
	b=FndN3beY+pz3fPT55Ct9FIe1LlXQ/Q/0trzzGTE7v8shKaH6N8hB6rSUm5xc18XaWT6uXM
	WBa/3dW/YemVx5qHH4SV+U/urhVy7ebch00KZ+tby7S8Jz1aQKkhH1coLFGtqkFDqsTFnR
	IJBGe8FLiHYPZSFtmB/Zj4h0Mos6wc5s2K/U5FWZ/Af3yzyKzsXaHtz6v3j6EK6YY1/ECn
	+El+AYDpTXnPJ1wT1dWQPHgw1g6eRf+aod4AHiIhqPlbv3nQAkC9dSfImFuSsIrwO1JTvC
	Fyhg88E/VCE50CEOgXoHYDUA2Z8lLgF7W9haRc3nM0OMYJ8u/iK8d2o1dg+Npw==
Date: Mon, 14 Jul 2025 12:08:42 +0200
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
Subject: Re: [PATCH 8/9] drm/bridge: put the bridge returned by
 drm_bridge_get_next_bridge()
Message-ID: <20250714120842.3b336998@booty>
In-Reply-To: <20250710-classic-bouncy-caiman-8e2045@houat>
References: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-0-48920b9cf369@bootlin.com>
	<20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-8-48920b9cf369@bootlin.com>
	<20250710-classic-bouncy-caiman-8e2045@houat>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehudeijecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeglefffefghefhtddvfeeufeeiveekgffgleekieduteekkeetvdehudekgfdvvdenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghlohepsghoohhthidpmhgrihhlfhhrohhmpehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvgedprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghro
 hdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopefnrghurhgvnhhtrdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhm
X-GND-Sasl: luca.ceresoli@bootlin.com

Hi Maxime,

On Thu, 10 Jul 2025 09:27:09 +0200
Maxime Ripard <mripard@kernel.org> wrote:

> Hi,
> 
> On Wed, Jul 09, 2025 at 06:48:07PM +0200, Luca Ceresoli wrote:
> > The bridge returned by drm_bridge_get_next_bridge() is refcounted. Put it
> > when done.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>  
> 
> You should really expand a bit more your commit logs, and provide the
> context of why you think putting drm_bridge_put where you do is a good idea.
> 
> > ---
> >  drivers/gpu/drm/drm_bridge.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > index 0b450b334afd82e0460f18fdd248f79d0a2b153d..05e85457099ab1e0a23ea7842c9654c9a6881dfb 100644
> > --- a/drivers/gpu/drm/drm_bridge.c
> > +++ b/drivers/gpu/drm/drm_bridge.c
> > @@ -1147,6 +1147,8 @@ drm_atomic_bridge_propagate_bus_flags(struct drm_bridge *bridge,
> >  	} else {
> >  		next_bridge_state = drm_atomic_get_new_bridge_state(state,
> >  								next_bridge);
> > +		drm_bridge_put(next_bridge);
> > +
> >  		/*
> >  		 * No bridge state attached to the next bridge, just leave the
> >  		 * flags to 0.  
> 
> In particular, I don't think it is here.
> 
> You still have a variable in scope after that branch that you would have
> given up the reference for, which is pretty dangerous.
> 
> Also, the bridge state lifetime is shorter than the bridge lifetime
> itself, so we probably want to have the drm_bridge_put after we're done
> with next_bridge_state too.

Totally agree about this.

I theory moving the _put just after the last usage of next_bridge_state
would be enough. However...

> Overall, I think using __free here is probably the most robust solution.

...I'm OK with using use __free here, even though it doesn't look
strictly necessary. However for patch 9 the code path is slightly more
complex, so I'll use __free for both.

With this change, this patch would become:

@@ -1121,7 +1121,6 @@ drm_atomic_bridge_propagate_bus_flags(struct drm_bridge *bridge,
                                      struct drm_atomic_state *state)
 {
        struct drm_bridge_state *bridge_state, *next_bridge_state;
-       struct drm_bridge *next_bridge;
        u32 output_flags = 0;
 
        bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
@@ -1130,7 +1129,7 @@ drm_atomic_bridge_propagate_bus_flags(struct drm_bridge *bridge,
        if (!bridge_state)
                return;
 
-       next_bridge = drm_bridge_get_next_bridge(bridge);
+       struct drm_bridge *next_bridge __free(drm_bridge_put) = drm_bridge_get_next_bridge(bridge);
 
        /*
         * Let's try to apply the most common case here, that is, propagate

And a tentative commit message body is:

  The bridge returned by drm_bridge_get_next_bridge() is refcounted. Put
  it when done. We need to ensure it is not put before either
  next_bridge or next_bridge_state is in use, thus for simplicity use a
  cleanup action.

I'll resend with the above changes (unless you have more improvements to
suggest) in a few days, to wait for any feedback on patch 1.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
