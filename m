Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E855D3382CB;
	Mon,  8 Jun 2026 11:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780918918; cv=none; b=pOG5w5yEx/2TgYQHjDrcUV07FDdRz6kuzfiFyE36I91d6oRs3Q2x1F0wpXUbJxLqp4Jsj5koW2wqruH4347WoOa9ZutqJgEvss+eNmOpYbrsOr8jccSzBLndMlfi6u+falx1BuWgvNfeqT3D2JMPy0+N5Mn0ERUf0JxyHlHqVzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780918918; c=relaxed/simple;
	bh=qMB7tWfV0C03DccxxFO+6RhLHPxbPH51bsQ2TVLSInY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kNMCrXS7VTTYR+pyA+q+Kmj9A6zCI3XJSZj6fsiSNvFUgTQB6yOrre2jUCSmyVnR5MAcB20gOtrh8YKhHsnMJdgsfkWqUYcV6Z880PrPi7heJ2bwUCITGghjGADn4rzQqrvu88m5Cr3ipokIoV1Nsp9Dpwyt8hnqQTwagmME/YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X4WIAWnI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X4WIAWnI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1131E1F00893;
	Mon,  8 Jun 2026 11:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780918917;
	bh=qMB7tWfV0C03DccxxFO+6RhLHPxbPH51bsQ2TVLSInY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X4WIAWnINCLKLyP5AFDRs7lj8iJxd2A5fuRlmE+r9q+6lYDGidYpPpbaAmSxa1S1W
	 KSq0anONPawIBT9vC5ZpvOE4iQ2r3rTw2mDNz97HFDXc9NSjF1Ja5zcE5VJ+X7LGrL
	 ECwGHVFYazggIaxx/s2mAi6z0Zei9oLEnpMdelvvRuEnNROsBaJGQQikNrQwzor7um
	 iyOjBEC8Nq/a1hkMLR3CqVc3CcPO967TAEZdf5g0J6tFd5PHiVXelGkNt44fv3361e
	 rHU/6SkNIyfBLj5W8gNREYXNFy7XPLzz2QJglKhoJk4RNswW6e5SUWqWANl9otfgJw
	 8PcJKGAq5o+Yg==
Date: Mon, 8 Jun 2026 13:41:55 +0200
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
Subject: Re: [PATCH 06/37] drm/display: bridge-connector: use a
 drm_bridge_connector internally, not a drm_connector
Message-ID: <20260608-little-lyrebird-of-competition-c25f7d@houat>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-6-45e2bdb3dfb4@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="fhyd5lz3ke6h65oh"
Content-Disposition: inline
In-Reply-To: <20260519-drm-bridge-hotplug-v1-6-45e2bdb3dfb4@bootlin.com>


--fhyd5lz3ke6h65oh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 06/37] drm/display: bridge-connector: use a
 drm_bridge_connector internally, not a drm_connector
MIME-Version: 1.0

On Tue, May 19, 2026 at 12:37:23PM +0200, Luca Ceresoli wrote:
> Currently drm_bridge_connector_init() always returns the added connector =
or
> errors out. When adding bridge hotplug the bridge-connector can be
> successfully initialized without creating a connector, which can be added
> later when the pipeline will be complete.
>=20
> For this the internal function drm_bridge_connector_add_connector() must =
be
> able to return a valid drm_bridge_connector even without any drm_connecto=
r.
>=20
> In preparation to support bridge hotplug, change its return value to be t=
he
> same drm_bridge_connector pointer it gets as input, or a PTR_ERR.
>=20
> No functional changes, just changing an internal API.
>=20
> Note the return value could now become an int (0 or negative error) becau=
se
> returning the same value received as input does not carry any added
> value. However this would be change a lot of lines, so leave such change =
as
> a future cleanup.

You just created that function and changed "a lot of lines" already, so
I'm not sure that argument holds.

Maxime

--fhyd5lz3ke6h65oh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaiaqggAKCRAnX84Zoj2+
dvlgAYD3UUr7c3goHHKtCxi2SQ81QH+lj0pgDu+t6mBYW/c8gJWsZHGcSUJhcB1b
D2OjIy4BgIyG6BehTdRWyVru5aHe/B51ZTvcYO++iqcsuVtE+c/aWp298FwVdKli
eZ1e6k1t7A==
=er1l
-----END PGP SIGNATURE-----

--fhyd5lz3ke6h65oh--
