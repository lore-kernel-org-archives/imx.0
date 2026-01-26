Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0704233D516;
	Mon, 26 Jan 2026 14:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769436977; cv=none; b=dVSkRcf/rhRCYdTEby4LVFb9ZWX5EoUdsGxsCf4I69OcBRpN8uQX7yWTJjc/NVUQppQ/CNICYAzEoA3s75YIptQSV5lrwegKSUnhPAEWkHo8pv1cHqbC1Xaf8O2GZJaaRRfmqcdW1QBCxenZMgMjMQ1R7rmC1Pb4+W226Esl7fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769436977; c=relaxed/simple;
	bh=NrBeDM+ppcoHiPudl8UfdzdUe82B0RRwN1UsSSpRbHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lo4RTXJLxsn73e5AhALEBP6kcQnq8rBWH7Q1O3Z2S2yFs5daYmJud35N0YGmwBr4AgSQqdSD0P0HJQNAvwJIIewPY2bPU1srjvRqYIKvwRZZvSfaDAV8qDd8mIB+kMOJ/6A5HutOZUvB/Amob2d2aVmBBxvBSUs16CwaINJUDuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dZ28naFq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dZ28naFq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538E8C116C6;
	Mon, 26 Jan 2026 14:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769436976;
	bh=NrBeDM+ppcoHiPudl8UfdzdUe82B0RRwN1UsSSpRbHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dZ28naFqf6Fb0vnJXI0iOMnLYrxLxIMuzzmpyiURmwgvXagyhT8gmCwuSBvEZz1h3
	 Xpke0mY4b8zxOrfDRyx7wyLrsbtn9R7kbAhFBapU0nQiDa+h9q4Ysa16z/tlehsIXK
	 VcTArGSh2VPqg5fw45cOJif+nSTbJde3ZRWlibnZ6lbeSNOcA5ee1+HdeVuYjwyvRw
	 e2ZjNtEQLmDLgFU+sJ1SEQs2aNqBn8n5yYZwHvmqjNZ7McX1rc7Hi+V85KR8NeJK+5
	 inDzVP3ser9rIqXbXB0GpzprNzg9I+VsGFEdFTMt7GWO1HYKDJV14vt8OCTHIDYPkD
	 x0grCAfM3kiRg==
Date: Mon, 26 Jan 2026 14:16:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl,mqs: make gpr optional for
 SM-based SoCs
Message-ID: <3d98306c-0e13-4bd9-9cfd-0a2ddcadef3e@sirena.org.uk>
References: <20260120150329.1486-1-laurentiumihalcea111@gmail.com>
 <20260120150329.1486-2-laurentiumihalcea111@gmail.com>
 <aW+q4lrdYJEciNS/@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s592SMWyYy/L1ikc"
Content-Disposition: inline
In-Reply-To: <aW+q4lrdYJEciNS/@lizhi-Precision-Tower-5810>
X-Cookie: Haste makes waste.


--s592SMWyYy/L1ikc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 11:18:42AM -0500, Frank Li wrote:
> On Tue, Jan 20, 2026 at 07:03:28AM -0800, Laurentiu Mihalcea wrote:
> > From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >
> > For SM-based SoCs (i.e. MX95, MX943), GPR configuration is performed by
> > the SM coprocessor. Thus, the programming model needs no handle to the
> > GPR node. Make it optional.
>=20
> "programming model" look like software configuration.
>=20
> Thus, GPR is transparent to software and does not need to be described in=
 the
> device tree. Make it optional.

I was expecting a new version of this with Frank's comments rolled in.

--s592SMWyYy/L1ikc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml3dykACgkQJNaLcl1U
h9DqHwf/W0vKTs+cwDArItwrD1Pg0wAd6A1I28PNegyipqSgXGweCyLNwcoaTH+k
1BcuFESVQFofoSRYbirsMze6LvUrJc6GfcDfQTu0QvHb30xhBPSCBBfNIlZqL0dk
SZm7EZIDmQl5HEJHs5m/sGRLy5LwlW2MDGPGUwSP4kEcoFOc3is5dNEtGKAKqYRq
UuOkeS5jCYp7idd76Nh6au1HzTV9v0GPzkIRywTJnF5AWpVXTY001TLVf8+InwAu
Yxez+C/UfZ3emSmA+yAiX5mZ9NLFX0iALUvUerax17akjOmgTAHOEr/1WEhRpzLD
Q70Q3FIlKsSfVeFfzrVtY8W0C2fvpg==
=UreY
-----END PGP SIGNATURE-----

--s592SMWyYy/L1ikc--
