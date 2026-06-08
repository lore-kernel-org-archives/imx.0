Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ADD322B72;
	Mon,  8 Jun 2026 11:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780918677; cv=none; b=pfOLHL1lLcIT9inM/9EH3tiI3aK8o0WqjQZnSGSCbHq6kPuAI9JrCMMOrAXKtb9IUcOQVoeiXb6jd0TBLDxtw5V6NXp3ezyOtdSN/sracIhfd4xJDosPuX0O9lQyWDsYFBw8NQpJkW0KUYGgtoVagacW8GDMXMscsJoy3q6NOVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780918677; c=relaxed/simple;
	bh=jI5UNeyiPu8cRXZFcSVbigtiK7cN7muchUni/GIRSWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pWhnwpRUR2dszw/iUcND9qiyDYMLuxXzE+4Zp3DNSKqiZmVWLUNsyzKaTquRQoKMqhviZgIVXaVS/gx4bgT591F37IqT/+ss6EnjPNWfbieS8IUUfSGThlTrT+6orIN0QJsWod1q8ccrcWQ9096y2lKR1fO7Y9ww5D7vt7RJIHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mevlGVYe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mevlGVYe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570801F00893;
	Mon,  8 Jun 2026 11:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780918676;
	bh=uDnJszeMpHdvvPPU3R801JdC/j6cKxC3OiP8T8t7XdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mevlGVYehUQUDoVS07MJ/Nec+me3pE5pN0bY3V9f9HJKwsCgWklGL/lF/0nOCe8+w
	 n43BaopwvETjXNOdDTZhqylU46Y6LvIdYqlL2vpwP06JubjFYvaLU2CBYuBSaRwSGl
	 /IBakOt0u3np59wb5dfhSxkzcc2XTHDDKK2HjUbppqKR2HxOXi6iG7pP0jrSx9SVHV
	 qrBFfnKgd8l6os5wubHUjTl1OKA3j8A+F+k1mkP7tdsUIkAe2zHLVlU8+W70x6j/M7
	 WXS7yo2ujqCwSlKtnB56YyQJFP7pI6wPixaHBmqwWBjLH+Fd00RJp7w5XrvI4t6ogO
	 q0EWTWfG/NZUA==
Date: Mon, 8 Jun 2026 13:37:54 +0200
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
Subject: Re: [PATCH 01/37] drm/connector: split drmm_connector_hdmi_init() in
 3 parts
Message-ID: <20260608-brave-private-quokka-f67fb1@houat>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-1-45e2bdb3dfb4@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="6v4dtzt3jeuv5xzs"
Content-Disposition: inline
In-Reply-To: <20260519-drm-bridge-hotplug-v1-1-45e2bdb3dfb4@bootlin.com>


--6v4dtzt3jeuv5xzs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 01/37] drm/connector: split drmm_connector_hdmi_init() in
 3 parts
MIME-Version: 1.0

On Tue, May 19, 2026 at 12:37:18PM +0200, Luca Ceresoli wrote:
> In preparation for adding a dynamic variant of drmm_connector_hdmi_init(),
> split reusable parts of the code to subfunctions.
>=20
> drmm_connector_hdmi_init() currently has 3 sections:
>  1. sanity checks
>  2. call drmm_connector_init()
>  3. initialize HDMI-specific fields not initialized at step 2
>=20
> Split 1 and 3 to new functions, reusable independently.
>=20
> No functional changes. Just moving code around.

Explaining what you need later on, and why these three functions help in
particular, would be nice.

Maxime

--6v4dtzt3jeuv5xzs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaiapkgAKCRAnX84Zoj2+
duf/AYDpipIWLfk+fdFB3ag3RZt6/l4Ldt2Q7sSM0cWR+5PFEIvnVO13qdZZ91HU
87IMGGABgKgJmw/zzJy36JG+OWXkIXlRjNm5occH4w/GMV8y4BCXcOmxyHeuLI3n
vO/GxTh2qw==
=NILv
-----END PGP SIGNATURE-----

--6v4dtzt3jeuv5xzs--
