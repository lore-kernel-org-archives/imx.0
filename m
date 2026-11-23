Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431281;
	b=dRfvGJLHr7ILb+tmG0qlVEtEkrA3H7e8nya4/Fn14JLffXNuO7zdHqtbkBwtCHtH7Z6D
	 xj+vaYenejJLpJ45GRIN9SCuFm/QFq8+iGLeqpWuKvbEHuoKdCwVfDtkhTYQrrFl/sOY9
	 mawK+FnoRfDBnTxU39Nk+f0Fi40DL4crFdv5meeWn447vaE2YbULIM97zsGmt/Ve6PVWg
	 t+TI+npn28cINOrFD/aKVQPOUxDW8SiJiXyXqTdgLcU+FBzQOHEgOcqp9uSn6gkLvv1xD
	 ydSiWm6nFFilqrRK3dnIQUxRzXdKi8pVCtbJAIWmMd+0wIGYB9V11yWDE7oNhX+eDAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431281;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nY4HpnOeJm9f7N0343VcVoNAFZl7ji0e8FhQZkE72C0=;
	b=MEAt+ay0HhRhA0Q8shYCViv0k6aABR5DiIwRsh96GtnFkCKBOgICg0e3Q2rrDuwxfr9s
	 7MOzIEb3LX3XRxa5h0IavwrVaDhfJxzkbmD4kLFE5Z8v+arA+PEw64MM/NO9RA678jHHN
	 mjCBKaez8HL/nLUK+MJEMe9c6EF6P6hU3+Vhjbw/0PCC2dj4Xo5YmaigC3nBr3jOTgdsx
	 k5/Q7LRks6bhB9RxajtCI+oQvUW9ur1Y3l1BWNVD9+urh+YnSke/gH6KgG8ngy4Bv03+o
	 KhcTvJb76y4/GvKjYys9bHTmabNCR+jldP1S6q7OHr1W6qh9gqjlKo+M3wH176LU+MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B+HkAfqI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18383606A321;
	Mon, 23 Nov 2026 10:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B+HkAfqI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1486F1F000C0;
	Mon, 23 Nov 2026 10:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795431280;
	bh=nY4HpnOeJm9f7N0343VcVoNAFZl7ji0e8FhQZkE72C0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B+HkAfqILuHNPPN8/Sl4DKazlQO7HO2ZNkxWWMZUr1/I933pYdwWHnYZ1ddjD9poe
	 kxphZOYC3znSesOtg5ths/CryB1n8gOfPlycOJQ11ozp3eb17wIHr7gjUCjZ3GzUpm
	 1guq7mm2+UF6rhgtLycU3L2TyR1oBK+ry9usuO87hAL8i7224GdmE0RIDRv38tLfby
	 XUUxFjYM6lThRtb8zH7xbkj6QOJLgckEO9WGvPAu5zgbTsN77jKZbB7MXKTDFiOlXH
	 V9smxi7ie+ZhzmK0nfA+KkSco7ZXhvBBShI5Dw7wIMWLX2LaeZjup3Ncr0+CUJ0DNM
	 F4SWSEp3l7B4A==
Date: Mon, 23 Nov 2026 11:54:37 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com, 
	David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Marek Vasut <marex@denx.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Simona Vetter <simona@ffwll.ch>, Stefan Agner <stefan@agner.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 4/8] drm/mxsfb: Switch to
 drm_mode_config_create_initial_state()
Message-ID: <awQbNQISBuGdJfP-@houat>
References: <20261122153032.2782768-1-dario.binacchi@amarulasolutions.com>
 <20261122153032.2782768-5-dario.binacchi@amarulasolutions.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="kjnzkckcgnomfnc3"
Content-Disposition: inline
In-Reply-To: <20261122153032.2782768-5-dario.binacchi@amarulasolutions.com>


--kjnzkckcgnomfnc3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 4/8] drm/mxsfb: Switch to
 drm_mode_config_create_initial_state()
MIME-Version: 1.0

On Sun, Nov 22, 2026 at 04:30:04PM +0100, Dario Binacchi wrote:
> The hardware state is read out only when the initial state is created
> with drm_mode_config_create_initial_state().
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

That's 99da25e15ccb in drm-misc-next

Maxime

--kjnzkckcgnomfnc3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCawQbbQAKCRAnX84Zoj2+
dsIGAYDAC2sZr5f+s2srMCKxcdwRZcoVK48DzCukP1fGlntM+89p1ItwoAcudHdj
iMXpmq4BgIB/NpvzxiPRHFHw2OVMyVyWgzN9Tw7rgLoOkxbZoaIlAi6Cyz8BxX8h
EDlPGGTJ/A==
=SNhV
-----END PGP SIGNATURE-----

--kjnzkckcgnomfnc3--
