Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5246121B91F
	for <imx@lists.linux.dev>; Fri,  7 Mar 2025 11:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741346552; cv=none; b=DBGQR4PoleRuOVRIapbm8i29v/wpjO79B86qcUT7s9NPJ+9jEPS2//wIL6ZSXYvBfShzX93MVB88ze2NubHBKxip+2tELC46V5EN5nYL2KC7ycjL6wAdA6k17xpfXwoGPtapTiKuHsKwZWxgOdDdPtzU+2/gRo4rhgOEWTY61oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741346552; c=relaxed/simple;
	bh=retfJEUproaIVtJ0aph8p5peNEwjzc8GVxcXOdXFmYs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W93aT6FismCJCQCBbTYO/YXuQRGrVpc6iiNgXA8VB8Y0mUiZ1jQ+9D44BiEYDtlosxiTOvllYnKy9Z7ZEt3y6dUIJwb0eTu2NqmoyfP8UA+24YerWE+Vpsk4yaGWTX0d3yuhQUjOjErLRL43c7GE6gylhkY+L3MekJ8zC39YEYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ETBkZftx; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ETBkZftx"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8EEB6204CF;
	Fri,  7 Mar 2025 11:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741346542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NxndagyuSyQnITMEU+TwaPzjTPF9RLgN9Xn4fVO+J9w=;
	b=ETBkZftxNSRbSCpnvNJLgZCm6uYH7wRURKZQ53twEq6VPZdqG0co4DxFgBVVPcF6BJlGvj
	bk7PB5Df6DrUhFLDgeLxBLR7A3/ZVV2rPzXRI8TTS+NQ+wL+lzhwXSPIGQfcUzpPiSK+BU
	s1cbWckhlm/xi9DsRcEhCXw40G/3A7vOfn3JHEhr+AE93+4yElMHjMAog7Vx+EsBHlWFrf
	bee6DHHWKcluIZe0gOIvaEPcYo515jiyku5XJhHEWRxvZlZp++XDi3fzwQsuc/m12TqZp9
	DeG189CBmwiN0m1y/nlP3+ZZMJ1AZi9cwnaUvr3L2+Sfu5MHaIycBDAVloJMzA==
Date: Fri, 7 Mar 2025 12:22:17 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/bridge: imx8qxp-ldb: cleanup return value
Message-ID: <20250307122217.158b24d6@booty>
In-Reply-To: <71c44221-b18b-4928-8faf-00893ec4a109@nxp.com>
References: <20250306-drm-two-ldb-improvements-v1-0-f139d768b92c@bootlin.com>
	<20250306-drm-two-ldb-improvements-v1-1-f139d768b92c@bootlin.com>
	<71c44221-b18b-4928-8faf-00893ec4a109@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduuddtheefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddupdhrtghpthhtohepvhhitghtohhrrdhlihhusehngihprdgtohhmpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrr
 hhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello Liu,

On Fri, 7 Mar 2025 14:42:12 +0800
Liu Ying <victor.liu@nxp.com> wrote:

> On 03/07/2025, Luca Ceresoli wrote:
> > 'ret' can only be 0 at this point, being preceded by a 'if (ret) return
> > ret;'. So return 0 for clarity.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > ---
> >  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> > index 7bce2305d676714cdec7ce085cb53b25ce42f8e7..bee1c6002d5f84dc33b6d5dc123726703baa427e 100644
> > --- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> > +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> > @@ -665,7 +665,7 @@ static int imx8qxp_ldb_probe(struct platform_device *pdev)
> >  
> >  	ldb_add_bridge_helper(ldb, &imx8qxp_ldb_bridge_funcs);
> >  
> > -	return ret;
> > +	return 0;  
> 
> I guess this is not the only place across the kernel tree where this cleanup
> could be done.  So, maybe use some tools to cleanup them all?

I had stumbled upon this as I was doing some changes to this function,
and needed to understand the code flow. Definitely 'ret 0' would have
made it  immediately clear that all the code between the last 'if (ret)
return ret;' and the final 'return ret' is not allowed to fail.

I think this change would (slightly, but still) improve future readers'
life.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
