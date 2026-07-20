Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058C23DCDAE;
	Mon, 20 Jul 2026 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784557724; cv=none; b=jw5wuo61x+cREx8Xblruh07Fe7GqGINbdiQppHJZqET5Cz4fpcfDvJelBA+I9UuZRXvbk+awB+AfrPMbQAl3OtZTiaf3h6qp21u/0KFfsAU0PZR7yR+UsyDaP263HftVfQsSNrxvY6PcmkSH/5rV6iysd9MKHiX6UdwW+LlkQlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784557724; c=relaxed/simple;
	bh=YGgq0kgANQfSfLYugyd1czX94b3DsWuJoJbSm/P4QPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Au057BJ9KgdYWd6Rm3WTXA3cIqZt2SHl1jM5pjzql1JwtLZjRxcWpGCwhaQtbzAv6Kd68I7j1g3/NiSAcpe/aSPpwooSaAxVXKOxkcP4w9fbCQwbIbOSVLmzkgZWwQvEBjqA9ysqwP7bv3yBxa69/XaBLiXu+6wUK4LaHB+akjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mmjA/ibQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mmjA/ibQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40541F000E9;
	Mon, 20 Jul 2026 14:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784557722;
	bh=YGgq0kgANQfSfLYugyd1czX94b3DsWuJoJbSm/P4QPY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mmjA/ibQFEKvbtDANfHjDwYzondvF8dCGbOlKvcYXhqfyoFvsJWBlVT3fMQ4CW2dV
	 EsVz1jSEX9nkyB2WD2Kp3gIZPs9paB0Ex9FU6eEBnLbe/2SYPmdcBX8juues0+1VNL
	 dMhG7MgxWgHpzUCpZQZlbgxXCNh3a5jbFg2UrmL4BDOwV1BKNxBAV0mHb5i2JqpxsF
	 QREQ1LPDXsK1d/CsVddkt39zQPKqPhUzNy+P9b+IpoZcw46UMTuiGuR+6xPoeKbed3
	 RSyVwbN5yXBs/7n0Ss5NcADewMl+VwdXAExwUvQ+oRbA71IAIlG/zoPt2nMGWzHetl
	 OVpuzQYTUwazw==
Date: Mon, 20 Jul 2026 15:28:36 +0100
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@oss.nxp.com
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz,
	tiwai@suse.com, linuxppc-dev@lists.ozlabs.org,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/4] dt-bindings: sound: fsl,imx-asrc: update port
 binding to support multiple pairs
Message-ID: <3ce4bfa8-b051-40af-9478-00540019680b@sirena.org.uk>
References: <20260720095450.1618747-1-shengjiu.wang@oss.nxp.com>
 <20260720095450.1618747-2-shengjiu.wang@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UXRfRhuyL0flFFDD"
Content-Disposition: inline
In-Reply-To: <20260720095450.1618747-2-shengjiu.wang@oss.nxp.com>
X-Cookie: Caution: Keep out of reach of children.


--UXRfRhuyL0flFFDD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 05:54:47PM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
>=20
> The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).
> The existing binding exposed only a single generic audio-graph port,
> which cannot represent the individual pair endpoints.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--UXRfRhuyL0flFFDD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpeMJMACgkQJNaLcl1U
h9Ctbgf/aH7yDt8XXrgvezUpFfpFQ5mZqqk3wPckaCo6daYpU4BG1u+NUAKBzvhl
muNUxzj7qKiFil/axJI6oSs/DwlazpzaLVOVlZI+GiLaec8Dv9QaKqpQFs7E4lAF
/V1cjx5SJ716WveCM914F7i8GWb8H2XLBo++jlEyTgOE3JRiiewPmrLl9HgSaA8B
ZxIIA+4GBGrmjPn22q4Sbs+orGPuVYBQuqyrsJYi5aGn6ANHdl/Qv2lEleJwqgWG
XcAMLGE16UceqIkZyJOQZf16dODg0S7zSLSJ8UuujFWFfxmDNuSs2Hm+X1eY7A4V
Sgyi6yiw5s3KskslFOtv5jPz7bNC1w==
=Nq5N
-----END PGP SIGNATURE-----

--UXRfRhuyL0flFFDD--
