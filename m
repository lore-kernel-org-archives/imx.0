Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820D323ED74
	for <imx@lists.linux.dev>; Mon, 17 Mar 2025 14:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742223460; cv=none; b=mcXyO4QjVZFxKuwnOhZnsY2oAzyvCLBzf0yAKhd1nh4Ht/ee+wd/F55dJijkZM8FZ7yWmOzO2D1nBM0PF2PKBs5nSNWjwM0+WUkkCE5j1VfuloZTErOVsIj59eWa1oZvYf0ks3hTRDlu1LytE/v518FWCprIGE7zCgmYUm26SYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742223460; c=relaxed/simple;
	bh=25KeBO3LinajIWSHJvuhTdoZgOpkTKqjJjTe7DGfM8A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mc8c/C06TL0wLItvWb5EuGM6RvPajXOfyWULtZw6lyaTXPJ0/XzrXlvhet1zWKDj/zX8mpCX2HI1l8XMbaXtlSgrrlNNFdNLb92395ks3LDpNFw8zAx9gzs1sOOvZ+MKvulx4vDG49W7Uzon9XlQvTrIK2Kxdbr95hEMm1+q9uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=X29XjBsF; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="X29XjBsF"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7619344392;
	Mon, 17 Mar 2025 14:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742223455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qkuh0DXp7wkpHA4U/hr9xccHxf9FKIYItr2z+4BB6U4=;
	b=X29XjBsFlNR58JFDPaXDWBtoy2+6wpXwLjV2W3cfhdB4282VWXOG529KYxBPs5pWRmlIIW
	u/TrZ78MytSw6ORQc1VrhWz/rwOCPypN7pYhSWRQXfLcBmgdwSiaQTe82xL1ENk6vJqJR7
	xS8abVRKrgePsPb37BG29GSWoGqMwFUvCaPKoQ8OaCTAyC3aXqgElZNlyKvCr96YaLBpdN
	xf/4Rl0IBl37YG6Y1bYieiEolFgJPieiJx8Hn9rEA7m3d2XezvYu1AzLmfBJagrJUDinJ3
	uRIQQhiNfFAEZV4sKFhKazELb0EAvzIrVrlu1pJaKi30UdKV84cTb1+gwQxzBg==
Date: Mon, 17 Mar 2025 15:57:30 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Marek Vasut <marex@denx.de>, Stefan Agner
 <stefan@agner.ch>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, Jagan
 Teki <jagan@amarulasolutions.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Anusha Srivatsa <asrivats@redhat.com>, Paul
 Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>,
 =?UTF-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Hui Pu
 <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 06/11] drm/bridge: get the bridge returned by
 drm_bridge_chain_get_first_bridge()
Message-ID: <20250317155730.4a328641@booty>
In-Reply-To: <20250314-aspiring-myrtle-husky-a5f4ac@houat>
References: <20250314-drm-bridge-refcount-v7-0-152571f8c694@bootlin.com>
	<20250314-drm-bridge-refcount-v7-6-152571f8c694@bootlin.com>
	<20250314-aspiring-myrtle-husky-a5f4ac@houat>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeelkeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeelffefgfehhfdtvdefueefieevkefggfelkeeiudetkeektedvhedukefgvddvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrr
 hhordhorhhgpdhrtghpthhtoheprhhfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjohhnrghssehkfihisghoohdrshgvpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com

On Fri, 14 Mar 2025 19:10:41 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> On Fri, Mar 14, 2025 at 11:31:19AM +0100, Luca Ceresoli wrote:
> > drm_bridge_chain_get_first_bridge() returns a bridge pointer that the
> > caller could hold for a long time. Increment the refcount of the returned
> > bridge and document it must be put by the caller.
> > 
> > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

...

> > @@ -1112,8 +1115,8 @@ drm_bridge_get_prev_bridge(struct drm_bridge *bridge)
> >  static inline struct drm_bridge *
> >  drm_bridge_chain_get_first_bridge(struct drm_encoder *encoder)
> >  {
> > -	return list_first_entry_or_null(&encoder->bridge_chain,
> > -					struct drm_bridge, chain_node);
> > +	return drm_bridge_get(list_first_entry_or_null(&encoder->bridge_chain,
> > +						       struct drm_bridge, chain_node));
> >  }  
> 
> We'll need to modify drm_bridge_get_next_bridge, drm_bridge_get_prev_bridge, and
> drm_for_each_bridge_in_chain in a similar manner, but for this one

Sure. I'm discussing this in the cover letter.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
