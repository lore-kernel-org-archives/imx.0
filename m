Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAF0392836;
	Mon, 22 Jun 2026 09:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782121103; cv=none; b=BnaGXi4Aoj9g3O1dxKljO1l8Q+FhxCNxafhuW3el0DXlv/TPlewea5BC++3TCPbRN2UWXCvUTQVNTEZNtti7EQCtMTkNJ086fyOnIqs/frNenIdEpqhSPYsHY+9rn7v5521iBMQB5TLZHc9+9Fa3savgueGK9wxRmVlRpxvTkZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782121103; c=relaxed/simple;
	bh=k5bmfAswHzUJczKuUi8yMWW+AYHssZGN+QoFP0C2pN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TbaBf8sy1H3LivUxBhXcV96DXhVWqAOz2kZwl/6FT+xU5rf+pZ6WuT5M3bDYZtpHeeUsuan08u0f6YQip4qHCBsIlMMVmaichJ65+PS+n1yTSCw96vj5wu4J855TMh+dh8mebOptMgFbdycUozxBRi+GSLh7xEkOn0g6FKpDYJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UivVNvOI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UivVNvOI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE1E1F000E9;
	Mon, 22 Jun 2026 09:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782121101;
	bh=Id1aDwPwK65QrmbSsCVlm+KO6gNxO+F+f3OzjJRBAxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UivVNvOI86fO3Vaefe/GUWz88xuXnRdNYaaWQLdEsoNSFypwCKYXuNJVcagOuDOx9
	 TSV6S3lGifHWeD0qo9ZmWqPwQSmjcQxg7qqd6NLdWFjY5b/0WY0XbkCuwC0UyKKp/q
	 KoAIaHbIR66kyUVpbt6nEcZaGjpUrfjALA2lB8pbW/QfSh8RnXlqXJsasmbB238gso
	 Zs5bMkElZKP8UrdYZzKIhFDXxBrks5EiLX81hgtSFpbHRrXe6Pr5LVmh5rxc1X3StG
	 pWiXgpm+/xRigUqHnic1l3JxDJMkUQUs4oTL3SkBZBOA4hrL6tP3ad1EF1kZAvKu4Z
	 TwF8kY1u/Ac6g==
Date: Mon, 22 Jun 2026 11:38:19 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/bridge: imx93-mipi-dsi: Fix mode validation
Message-ID: <20260622-strong-messy-hare-2372cd@houat>
References: <20260515-imx93-mipi-dsi-fix-mode-validation-v3-1-91f7d22b2fe4@nxp.com>
 <DJD6I8NMLN3W.3LVT4L17HT5TU@bootlin.com>
 <ajjpuroFPI_U2Fw6@raspi>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="4lki2wyprf2do7cs"
Content-Disposition: inline
In-Reply-To: <ajjpuroFPI_U2Fw6@raspi>


--4lki2wyprf2do7cs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] drm/bridge: imx93-mipi-dsi: Fix mode validation
MIME-Version: 1.0

On Mon, Jun 22, 2026 at 03:52:26PM +0800, Liu Ying wrote:
> > Finally, out of my utter ignorance on the subject, is the VESA +/-0.5%
> > margin generic enough that this driver can always rely on it?
>=20
> I see several upstream drivers rely on it, see "git grep '0.5%' drivers/g=
pu/"
> output.  And every display mode allows -/+ 0.5% pixel clock rate deviation
> according to VESA Display Monitor Timing Standard [1], though [1] is a fo=
und
> by a random Google search.

Yes, it's what we've been using for some time now. Is there any
particular concern about it?

Maxime

--4lki2wyprf2do7cs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCajkCiwAKCRAnX84Zoj2+
dn2NAYCjusnaBSXQclXmwY3AEMzqqxTj1CmUJL+6wWsRE+k9k0v5r5ASO8HI/G/s
MkWnjsQBf0BXjCandzhPC/6y7PGfq8bZ3ikevTtkM3UEjBFpirFQ9TqRTn+EDC0T
FJqJLbn8zg==
=h4Vk
-----END PGP SIGNATURE-----

--4lki2wyprf2do7cs--
