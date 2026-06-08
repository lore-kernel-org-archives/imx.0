Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8F536E466;
	Mon,  8 Jun 2026 11:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780919395; cv=none; b=SCj4e0PETFI0yJw4GNZGLmfkXiHCgQ+pcTugPK2me4ZKpS8x3nio0JAK85s7wezQJ8QxpB7Wz/3pnqaFZQun6hY+S5J++3OLqLRZCkeosLxN5MHG1O2TF5MgkUpgu/D6QbGBlpk+W4rHuoP8zIjcyeP6q7tULdanblmt1lvp3n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780919395; c=relaxed/simple;
	bh=nFdNtghavPkO49U4EcRxEbi9WYJN1ii+kE+KtT1KUDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b0V0vPpcB5OeLOC0R0WanIDm/RSXlmH5/D/QnI3rV2BKkC/pQaA1WFqhT5m7nrjKaWS10t/gk7Zl9RxC6GZv5rRnKo0Uhc3J03thm3t7mSCpJsDQUbdN4DdyaoarMQ5T+rDgLQdh6q9jf+7dBKMoyhL01IxUAOYJnmke7PlzSok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dpOG3U1W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dpOG3U1W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DCBF1F00893;
	Mon,  8 Jun 2026 11:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780919394;
	bh=nFdNtghavPkO49U4EcRxEbi9WYJN1ii+kE+KtT1KUDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dpOG3U1WrRJeiBEqaBoJK36je8mdnnCEPNYgNwsk3ypzR9d118Pg52By0kVReAsKJ
	 SP6rM97MN12Tg2sbwATld2g51LadlEl5OJimZoNA22UIN46Mnf08ZIXDbfpVnoCm4c
	 gDpzP//WSERMh2R2LVBD8H2MsXJU6hdP08xn3sbV4GRL3ySjwTZ57FlXK99gO5DVvp
	 T6RQyBInrDQFcN9C2l6gDlSZkvqiiC/nbWmwl5APuCro4mczMRECEpLlNBHu2lZsNu
	 ByVJWycrq+jWp331wJcUcGCdEEIcbtkutwlHR/TwXEy4BubbNCOklDlrwKfTkj47LV
	 vGpIKAPhO/Zbw==
Date: Mon, 8 Jun 2026 13:49:52 +0200
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
Subject: Re: [PATCH 17/37] drm/display: bridge-connector: protect dynconn
 creation and destruction with a mutex
Message-ID: <20260608-garrulous-silver-junglefowl-ea4dbe@houat>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-17-45e2bdb3dfb4@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="kb6asce5vlt2wt5a"
Content-Disposition: inline
In-Reply-To: <20260519-drm-bridge-hotplug-v1-17-45e2bdb3dfb4@bootlin.com>


--kb6asce5vlt2wt5a
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 17/37] drm/display: bridge-connector: protect dynconn
 creation and destruction with a mutex
MIME-Version: 1.0

On Tue, May 19, 2026 at 12:37:34PM +0200, Luca Ceresoli wrote:
> Bridge hotplug will make the connector dynamically created and destroyed
> based on hotplug events.
>=20
> In preparation for that, add a mutex to mutually exclude connector creati=
on
> and destruction.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

What is the source of concurrency, and what are you protecting against
exactly with that lock?

Maxime

--kb6asce5vlt2wt5a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaiasYAAKCRAnX84Zoj2+
di0AAX94uaZTqhbNpAYeTc4Vd1ntkbdCQHqbZYJkthn3BeRq3wcJvTCqGg1cc9Po
0g1ku/wBgK/hpwhwYSxughYVr0Z1+OHBXDZmkL5Tj1C4A/UfnJ+5h2aBwHPGNxUV
LU1oJ0q/FQ==
=ZsK8
-----END PGP SIGNATURE-----

--kb6asce5vlt2wt5a--
