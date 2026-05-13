Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB4E372070;
	Wed, 13 May 2026 01:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778635709; cv=none; b=VrgRdbmenY9/vacvs43//Qmhm53P6zw9CINEexAtGnjZCEnhZ3iwUZiPo6oFg4QrIrhb8RVsd3iJKw4vxZZFCFVADJ03Gqo4al4rCUuzH/YdQy7lUUB+tQWRQ/S1bu3EtgiZ7MQIkSp9yh+A4L9ptvhnrmZay0Gcwu+s2rWBTUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778635709; c=relaxed/simple;
	bh=VwRmf6yHkU6JoKiELg98yCtWicqZA1yRP4ajE53wTbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GTdaGnMw1ObU6BNEpUZW69HjuCLHeusDPyZgxU0b7cdjAKS4s2A1h+iptC7yMKLczVeUFftlSmy6szjZZLWSb9ZcTSW3vdcdOdXnIE/RQXZp+fYIviZslANF+LBB3tVJAqMP3USyHrSqyTz4IRsCHulqb9oxm/vIjxpzg0NCbe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WHCu095Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WHCu095Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C27DC2BCB0;
	Wed, 13 May 2026 01:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778635708;
	bh=VwRmf6yHkU6JoKiELg98yCtWicqZA1yRP4ajE53wTbI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WHCu095QlTDRuHeEtR0WAZcs4LkI0b2+2scgYYj3Gwvkkxzxz2fAqw4POpJ5aZlNw
	 7CC13isgLxymBMezS3tQMVJehUOiMhZwIn0E2VNkvO/SjxvowipaMoOA2moo9JizWL
	 N/N5NQZYROnJMzQ5OT9h5/jVJ8aoj7qA7wNQUNxoaYsSRBTxDPEub1jNwKCvUJVTCn
	 OhCjbiv+MUpRR1la/13m7jrl8TFQMwwcu5GeJgM7AEEGIUCIRAhx010hryQCqDV09v
	 0oiuaAAKrj+twa/Q41pazi69xLemU2G/7QOfxcvJDj/q8pci4/kGeSp29d3eAajTzY
	 7GSLh3+BxvgiA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 0DBCD1AC58CB; Wed, 13 May 2026 02:28:26 +0100 (BST)
Date: Wed, 13 May 2026 10:28:25 +0900
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:VOLTAGE AND CURRENT REGULATOR FRAMEWORK" <linux-kernel@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: regulator: convert ltc3589 to yaml
 format
Message-ID: <agPTuWhZQa6V5h5l@sirena.co.uk>
References: <20260512224544.1223283-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P/xE2IxuFcOJjISa"
Content-Disposition: inline
In-Reply-To: <20260512224544.1223283-1-Frank.Li@nxp.com>
X-Cookie: Truckers welcome.


--P/xE2IxuFcOJjISa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 12, 2026 at 06:45:42PM -0400, Frank Li wrote:
> Convert the Linear Technology LTC3589/LTC3589-1/LTC3589-2 regulator
> binding from text to yaml format.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--P/xE2IxuFcOJjISa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoD07kACgkQJNaLcl1U
h9BWOQf/algNi1ADgjw7NpMC3NNpA3KqQGA5HLHwZYZE8wQ3PqhMlE4Gi2qGQ/vV
tq8gJBuCqEKak4ptf59km6d4B+uq2crUrHCVtqHG1cR82uZ7dMA+n8/1/E44NetI
htY6zfxsDG7nRkK5+zAOwlyn8jrkCR+41AyeSxzmzwCQUKY3jtlLagIsjH5Mqvhj
AndKJDE8KP8QvQySLANi5sp3dX0jpDdh2WiBXwKEXACFwh00RWwGJDbThZsEveUH
vqhnFNBxXpKmfaeVUcr5jDTx6P/aLXTsFwZNJXn10Av1JsYkCoeC88OJYRY5/WG5
kaZWhEjy4kdD8JJ1uq3UkcmjPlO6wg==
=mtWK
-----END PGP SIGNATURE-----

--P/xE2IxuFcOJjISa--
