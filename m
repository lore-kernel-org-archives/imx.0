Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EDB13E40A
	for <imx@lists.linux.dev>; Tue,  9 Apr 2024 16:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712680639; cv=none; b=fuTt5/Vk75XdLHh6DiAy7NHV4rLtVXdT/YzW2EzAJ8namvH1fVfDgkGwBMcGlJIcFmzZyei2DLoHIXePobRSKo8HaGxzTZdivQwYSYEPT8i2ysQLOofELJFxRzb+rtY410mJMR9q/2QRjUhCNw9d6cGKZdiL2dp7tnU4vyHOS8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712680639; c=relaxed/simple;
	bh=bvVcBwVPy/bUu2uL6v1OnViXZvzMnJPN0gItAWAXdEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DaXp6lyWZvtWd2SMQQTgeY94UVwEH0wOEN5czeB3APdDYVJt6H4WLLZOMUoASgCBECbWoEOSUWzcCe4HtEDOS3vKqDs8K/Yd3nYAzvwJGb+h7BwCcqb+shT+aSojZJUJAq84y14MUAXEiQ13m4xpByudfOf8fAvz/Vnn2x/ZyB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruET0-0006vo-QD; Tue, 09 Apr 2024 18:37:02 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruESz-00BKwZ-Ir; Tue, 09 Apr 2024 18:37:01 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1ruESz-00H4Aw-1W;
	Tue, 09 Apr 2024 18:37:01 +0200
Date: Tue, 9 Apr 2024 18:37:01 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, Liu Ying <victor.liu@nxp.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: imx@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	dri-devel@lists.freedesktop.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] drm/bridge: imx8mp-hdmi-pvi: Convert to platform remove
 callback returning void
Message-ID: <rpwa2oewdtgyzxfgvmmqfvl2qu7idsdblrr4evd4ll7e2gaqfc@5jzwwrvch2u4>
References: <20240304090555.716327-2-u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zr7iu2qou3775pw4"
Content-Disposition: inline
In-Reply-To: <20240304090555.716327-2-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev


--zr7iu2qou3775pw4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Mar 04, 2024 at 10:05:56AM +0100, Uwe Kleine-K=F6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>=20
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>=20
> note this driver is currently only available in next.

The driver made it into v6.9-rc1 as commit
059c53e877ca6e723e10490c27c1487a63e66efe. My change however didn't made
it into next yet. :-\

Who feels responsible here?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--zr7iu2qou3775pw4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYVbqwACgkQj4D7WH0S
/k5J1Af/UkSbAJLtIKFPTzIzulLmTkg5mo02Cc4MiI2gmRirMTlxnTofs9NG4S+t
vuEsLlL4caHtRMvSTFplFyZABKLDNgDiJR5xI7yGIBekp4qAWi33dWAd/H8jZlMA
oPIQO50cgwgrnlISt1JUHc5xfwazHL1r2wP7Q2OHHCdqU+Ati++NlY/dACqVhgmp
nJKLvJxFSBNlwMZSpnXatLN2m/exU7qgZH9ktbLRx5iJ/2yW+QVnmvnyXwPVkdnk
8w2UOYFAzgdf2S0B1O4Gz4h395fdUdy0hJPs2jenmxYkzGdqof3vXDG05fTR8hrg
dVKn8DMEIwUHFB0hvHh5jhfuI4l49A==
=AkcJ
-----END PGP SIGNATURE-----

--zr7iu2qou3775pw4--
