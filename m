Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2C5279917;
	Wed, 24 Jun 2026 11:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782301737; cv=none; b=leQRAgNksz3RplbtELblQGTW88Q6a7b2R+oDRRr2c0BCCyfN797dCNpM+p3Ve0g95RPhRefWr5ICSQ8wdvtvKqEzPDCq40MlvUEEDOg+VAvGLG1/A10WD/CFHumgqZjWvJfYF0Hb39F8yJ1+zXRZfSWKwUnOeXdhJI+cSRWRV4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782301737; c=relaxed/simple;
	bh=8X17Ol5bpCcFtXQeSlgUZOKYG29Mg8WK+F8smzVTvso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJfBlZN+88Q50oG8Mx4oJv65dLOITQdxq11Acx5dDUD0JJ/YPD+VBKCfAUBYLfZhyy2lJpHdazZok/sg2BZfjlUZTdVbBACp+FPBXR/HOgUKHTVhbRVQs7zFK1FV0+dO1rYVa0anmWTjfTcEKcHXpnwAoFby4ZxSXkFkrO8Vy8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P9TX2/8J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P9TX2/8J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1CCB1F000E9;
	Wed, 24 Jun 2026 11:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782301736;
	bh=HvtRRLwB5nRGK6z7KOkjZragdUXab8f1dvYJB1vbLQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P9TX2/8JO3pJem0y/w8F3b3OVb59ZCN/A0wmXbugp9GUlJjVycnp3K6qkW5XOa0/O
	 jjSksdRrPefLjvpZh6FwS08cM1YwJueYh4Z+ZJsF0zPzgBvZYOLxbE4y+c7azRjoIp
	 KWjtV4YhlmZUon2UC0cnPNVimDZyQrNr8iwbobczz1ZyhP77eb3+ua+4hWbh772K93
	 ZMjfdHX/KcJlbiAaYUsp6lOOXBX/mctKtEA+cBKibNz9ytvHEMpJ408r286WFodVCx
	 LEIqKOCBPeue+FbgCVezsHMXtkxXuue73oPvPrwh3UNTkRy2gPrviLWreyI5ymXLnc
	 TY5jUNI2pIzPA==
Date: Wed, 24 Jun 2026 13:48:54 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 15/37] drm/display: bridge-connector: allocate the
 connector dynamically
Message-ID: <20260624-judicious-enigmatic-hippo-b13ffe@houat>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-15-45e2bdb3dfb4@bootlin.com>
 <20260608-rustling-infrared-turkey-e09af8@houat>
 <DJ72WOUW5FA2.G1MPCAHJQ13F@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="gyx3n54eiizonhu6"
Content-Disposition: inline
In-Reply-To: <DJ72WOUW5FA2.G1MPCAHJQ13F@bootlin.com>


--gyx3n54eiizonhu6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 15/37] drm/display: bridge-connector: allocate the
 connector dynamically
MIME-Version: 1.0

On Fri, Jun 12, 2026 at 02:44:43PM +0200, Luca Ceresoli wrote:
> On Mon Jun 8, 2026 at 1:46 PM CEST, Maxime Ripard wrote:
> > On Tue, May 19, 2026 at 12:37:32PM +0200, Luca Ceresoli wrote:
> >> Currently the drm_bridge_connector has an embedded drm_connector, so t=
heir
> >> allocation lifetimes are tied to each other. This is insufficient to
> >> support DRM bridge hotplugging, which requires the connector to be add=
ed
> >> and removed dynamically at runtime multiple times based on hotplug/unp=
lug
> >> events while the drm_bridge_connector is persistent.
> >>
> >> Moreover the drm_connector is exposed to user space and thus an ongoing
> >> operation (e.g. an ioctl) might last for an arbitrarily long time even
> >> after the hardware gets removed. This means a new connector might have=
 to
> >> be added when the previous one is still referenced by user space.
> >>
> >> In preparation to handle hotplug, allocate the drm-connector dynamical=
ly,
> >> to allow:
> >>
> >>  * creating and destroying a connector multiple times during a single
> >>    drm_bridge_connector lifetime
> >>  * creating a new connector even though the previous one is still in u=
se
> >>    and thus still refcounted and not yet freed
> >>
> >> This commit does not introduce the actions in the two bullets (it will
> >> happen in a later commit), it only moves to dynamic APIs for connector
> >> allocation and init.
> >>
> >> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> >
> > I think this patch should be split in half, with the switch to using
> > destroy first, and then the actual move to the dynamically allocated
> > connector API.
>=20
> Is it doable? drm_connector_dynamic_init() mandates a .destroy callback,
> drm_connector_init() forbids it.

drmm_connector_init forbids it. drm_connector_init mandates it.

Maxime

--gyx3n54eiizonhu6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCajvEJQAKCRAnX84Zoj2+
diY/AYD61uA2nIV5nv2saKAonASdA6xG5aMdfOpsdoDTfSXoIEmfuvVOSm9Strmc
XNUwH0ABgJ4zLMBRfrGdi32Zl2qPuAgiR2EeAI/luJ4I2OMIEfgM7nSUdQU2Dwv6
rqixHOXClA==
=lXQW
-----END PGP SIGNATURE-----

--gyx3n54eiizonhu6--
