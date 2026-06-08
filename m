Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DC336C9D0;
	Mon,  8 Jun 2026 11:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780919199; cv=none; b=gl9fQCjezmiJEZMaMPIKyFw7Huy2WHXzRuUa8aXLxa27E0r0v+HkDRWhYS2NbNX0lHKKvnndx6y5yc0N2FZ+fTLh0qUwlqR8B5+p1pkimt6/qzrf3Rg6YMugV4RA63OBxcSxLsMYAVZY5ePISCx5w7wIkXKn/s086UwkdkixD1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780919199; c=relaxed/simple;
	bh=RjYuQPXZZ3CI9ckIR7MENySoBAq6eWhaatzRgbNqQOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fAbykn22gL0GDZRdiLKtYOvAFDktZ2LxNdC0KQZDFtjgeFN+Y7HN1C3377wB9RSKPZtUCYaKNAAJaMPky7IE/yUJznIi2ZEOGfvJvcm2OrmU6V9THRcjZ++CQfdMngfzyVBrrmOadGoPqU4/34usA2Z4EtH2J8qc6hT4hGwVCCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ONBWUW40; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ONBWUW40"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB8721F00893;
	Mon,  8 Jun 2026 11:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780919198;
	bh=3YexfljBk8pDJLqWgaXTmVbxli8lauBy575LrntRJoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ONBWUW40Y5seSsPy9q5535x6baYwCnP1TPwi8HH8WEUynsXkJRghQY5BSDfWX8WGI
	 uSAvfQ+/Otoh4+3kSkVpUPHmeyEASP5pii3Z3i9bsf0tsxmAo6RAJMhBIB9jYxNWKD
	 QMZ7KSzR8r4BWITUE+DHn8IIY+A5BgWRkSETp/AUdsJT3qsLeYV6o7TXHKWemBTrb/
	 4Thajh7cN7hb+SvS7HKuUQ4gq0kmu35sLB/oaH96LdQEOidve8hyMclG7cQu5FhRVz
	 fia4BpSzdwju33pwbqfDhyyy2znt83HT6at1UWeMKbd8fYXOYmAyWYMxbQxYWILeqw
	 pij0H8I8mrXjw==
Date: Mon, 8 Jun 2026 13:46:36 +0200
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
Message-ID: <20260608-rustling-infrared-turkey-e09af8@houat>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-15-45e2bdb3dfb4@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="zkswocsay233wqed"
Content-Disposition: inline
In-Reply-To: <20260519-drm-bridge-hotplug-v1-15-45e2bdb3dfb4@bootlin.com>


--zkswocsay233wqed
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 15/37] drm/display: bridge-connector: allocate the
 connector dynamically
MIME-Version: 1.0

On Tue, May 19, 2026 at 12:37:32PM +0200, Luca Ceresoli wrote:
> Currently the drm_bridge_connector has an embedded drm_connector, so their
> allocation lifetimes are tied to each other. This is insufficient to
> support DRM bridge hotplugging, which requires the connector to be added
> and removed dynamically at runtime multiple times based on hotplug/unplug
> events while the drm_bridge_connector is persistent.
>=20
> Moreover the drm_connector is exposed to user space and thus an ongoing
> operation (e.g. an ioctl) might last for an arbitrarily long time even
> after the hardware gets removed. This means a new connector might have to
> be added when the previous one is still referenced by user space.
>=20
> In preparation to handle hotplug, allocate the drm-connector dynamically,
> to allow:
>=20
>  * creating and destroying a connector multiple times during a single
>    drm_bridge_connector lifetime
>  * creating a new connector even though the previous one is still in use
>    and thus still refcounted and not yet freed
>=20
> This commit does not introduce the actions in the two bullets (it will
> happen in a later commit), it only moves to dynamic APIs for connector
> allocation and init.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

I think this patch should be split in half, with the switch to using
destroy first, and then the actual move to the dynamically allocated
connector API.

Maxime

--zkswocsay233wqed
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaiarmwAKCRAnX84Zoj2+
dg4NAYCKBku1y1njVJbmc1N2fGvFbJXDz9zum9YGh3536/rvMj6YBYGDm1TRHrvz
kN0ddaUBfi2bAxpdRbhtOPcxlSyNG0d1CeAj8UGCNRBJC/7nUkheXU2p7eAEzNjJ
k3MlFuBocQ==
=ZnkV
-----END PGP SIGNATURE-----

--zkswocsay233wqed--
