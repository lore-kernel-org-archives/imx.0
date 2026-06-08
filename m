Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03E231F9AC;
	Mon,  8 Jun 2026 11:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780918470; cv=none; b=Yt7yBal7iDw2SWYnHbjVOQaH05iR6/1lqrT7VpCaN8gUIzZyOK3A/joNglO2vHoOE84W1iR1JgybIChqueOHEXY8pyTpK97mgYVDgh9ic8oYF0G77KsCgD+Pvb14xzZVYYiqj2mW9aDOnk5Yfbd7+A5qJ9PQYNEhjwki5FzY9yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780918470; c=relaxed/simple;
	bh=CQbC4MdU3rnYzPhxWOXzaUqq1e0lj3Ts2wN2tHiuJ4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g1093R/BBjsgvFZfTSfx9LSAFI/cSpt4SF6pna1EWxDogMZ5EDJFEy6XeaSneL+B+KLb5Q3/GDIyPjWLdH+kt5h5C/rteIzrxWLMI/KCkPJ69DLP9lzbgC+xbf9fOFNz/RjtAoQYta1nrDK2KoiR1kXNA6SuiwZmkT+AoPEIdj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aw7AcunF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aw7AcunF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0311F00893;
	Mon,  8 Jun 2026 11:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780918469;
	bh=WQWRh8p2h3NDFUSWN1Rhl+a0kriaz+3CZ0URUglMXpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Aw7AcunF/5f93ie/u3gMYvj6jISdYUw6DKg6ZFuhbRqfdV1mfisbKb0zmEAqMS15k
	 pPG5jKzDIJs3h+xaU1IS7UEoSi/ZWNq1sVtj5NW0Sn4MWnD+fxWK05TpBh3QVFR6n0
	 W/Ks/dmsjhEQh/Uo6h015Xp/cWmrcKtFFbUxUjuTAeIYPG8s95XKhA6ZBW9HWG5Pp+
	 n4FjOTqvXupLbst4pZvOxyQo97i1vUyYGiyQZ/sQs5Y1qd5Zu3qubah7KyNhbFZpvK
	 4Cyrkp5dtE1a2INg10y4im8nPs20kajr2/uKpuC9lVBwXOxVbBQM0OQWG7MD8t4nsf
	 f1xWD0u5VO54w==
Date: Mon, 8 Jun 2026 13:34:27 +0200
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
Subject: Re: [PATCH 04/37] drm/display: bridge-connector: store the
 drm_device pointer
Message-ID: <20260608-imposing-umber-tuatara-62daba@houat>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-4-45e2bdb3dfb4@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="rfvx3ud67pyds4m4"
Content-Disposition: inline
In-Reply-To: <20260519-drm-bridge-hotplug-v1-4-45e2bdb3dfb4@bootlin.com>


--rfvx3ud67pyds4m4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 04/37] drm/display: bridge-connector: store the
 drm_device pointer
MIME-Version: 1.0

Hi,

On Tue, May 19, 2026 at 12:37:21PM +0200, Luca Ceresoli wrote:
> Currently the struct drm_device pointer is only needed during the initial
> drm_bridge_connector_init() and in drm_bridge_connector_handle_hpd() which
> gets it from the struct drm_connector.
>=20
> This will be insufficient when introducing bridge hotplugging, because:
>=20
>  * some of the actions in drm_bridge_connector_init() will have to be
>    performed later on, when a bridge is hot(un)plugged
>  * the connector will be removed and re-added based on hotplug events,
>    so the drm_connector might just not exist or its content be cleared
>=20
> Store the drm_device pointer in struct drm_bridge_connector for any later
> needs. Also convert drm_bridge_connector_handle_hpd() to use the newly
> stored value.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

This is already accessible as drm_connector->dev and drm_bridge->dev. I
think it would be great to list why this is different, and how it is
different (ie, when it's set, unset).

Maxime

--rfvx3ud67pyds4m4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaiaovwAKCRAnX84Zoj2+
drmAAYDCTrp5B/3nwsHfwzJ3pjL6RsLximEIeguzyN2Zo/pXFeFBn/eqNiwdUNan
9v8iJgYBgIPGBwLE0HR3Dkk+PXB7EljJYW3UiA+uHKQJajC1OaBDZi/ukKG3oLzo
Oys6KnB6zA==
=K5mh
-----END PGP SIGNATURE-----

--rfvx3ud67pyds4m4--
