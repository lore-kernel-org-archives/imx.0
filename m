Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383EF16C86C
	for <imx@lists.linux.dev>; Wed, 10 Apr 2024 14:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712759771; cv=none; b=VYHw1iuo8NcgyKHzNgMA0pu7rRuDeasWwD4FFBCBL3idkCYouqmGJoYoBzFVmDuIi0yrkd9C81Y1HTpBsMBsdCBWTBmEVAYjTga4g8ojtI6mK4mSP995K2NJn0z1QfecUJqpRjB6mFwvfFp323GlY6mBYsXl5mlN763UK49A1RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712759771; c=relaxed/simple;
	bh=Wmkh8VmRpxwud1rEQxBWET9njgC8rAYCF4F1xSRXBAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyHVp404R8nf+57EOZMSZqsfDpl0aP4gLD+t5ZhpFnD0jk9FbFGWWA/KzNBkrG0mjvN+Uvn+vZBJ0TdOJxaX6/LMZ09rb2gH9BVeVwNWp2FtTjd/9renD0A9aU4fLFqwNfrBJvudlOsCI3LZtCLJUFVUn6zFbXEV0vbyCKsHlSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruZ3I-0002dX-5E; Wed, 10 Apr 2024 16:35:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruZ3G-00BVqF-1i; Wed, 10 Apr 2024 16:35:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruZ3F-00010D-34;
	Wed, 10 Apr 2024 16:35:49 +0200
Date: Wed, 10 Apr 2024 16:35:49 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Robert Foss <rfoss@kernel.org>
Cc: Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Liu Ying <victor.liu@nxp.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev, Jonas Karlman <jonas@kwiboo.se>, 
	dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/bridge: imx8mp-hdmi-tx: Convert to platform remove
 callback returning void
Message-ID: <i3expbg3whx3nbvmhcb66fxjs6dh6atmqzrg7xzilazhcnpmv2@kpxjzziasube>
References: <20240304091005.717012-2-u.kleine-koenig@pengutronix.de>
 <171275643072.2948280.4830683289450618114.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ih7btfnaphb76vfa"
Content-Disposition: inline
In-Reply-To: <171275643072.2948280.4830683289450618114.b4-ty@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev


--ih7btfnaphb76vfa
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Rob,

On Wed, Apr 10, 2024 at 03:40:30PM +0200, Robert Foss wrote:
> On Mon, 4 Mar 2024 10:10:06 +0100, Uwe Kleine-K=F6nig wrote:
> > The .remove() callback for a platform driver returns an int which makes
> > many driver authors wrongly assume it's possible to do error handling by
> > returning an error code. However the value returned is ignored (apart
> > from emitting a warning) and this typically results in resource leaks.
> >=20
> > To improve here there is a quest to make the remove callback return
> > void. In the first step of this quest all drivers are converted to
> > .remove_new(), which already returns void. Eventually after all drivers
> > are converted, .remove_new() will be renamed to .remove().
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [1/1] drm/bridge: imx8mp-hdmi-tx: Convert to platform remove callback ret=
urning void
>       https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D2caad4f7b024

Thank you, very appreciated!
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ih7btfnaphb76vfa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYWo8QACgkQj4D7WH0S
/k52pwf+Ixtq+qwtmOmlV3CDDI5xTkETuP2c8nM/eDLP6hsunsWYH+xOiYRQ4Dzm
d/a1NPAfxMFKgAv7EL5Wokn9k+dBEQNKUdyF4U5vlsDyKJPfAiP4pKAANrc1ujug
7oTRh3yDqwvAx/FrFB65OZzP3/CyaBPlnkZn1ZmNKduKYxv6R49VP9b4DRh+VOh+
/cb7+QvGx5pnSbXVheXHGqzxTmOMChvODeu4OL2BOUJgSzdcCwGvWsGFtYPMTjfA
wfhUKusiP3Lt6wKmjtmmrTnut8JLReFdAZcyKVITDsj5jfz9hgpXY7lDpsNmyRtn
LjsTAEX9Jwzo7KLWuEc4ukaydNmszQ==
=/J36
-----END PGP SIGNATURE-----

--ih7btfnaphb76vfa--
