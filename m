Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F173A7F5F;
	Fri, 13 Mar 2026 13:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408683; cv=none; b=Wd262fh5D7YCVWhp3aa53JwXtpId0V9UYywkauqyizHEemLTH5WTatSeN0ulXaHXhwHhhZwCC7FkWpTCkogDkptRTsUobitVhyYkT1PZShRG+85D3d7bsN2Nqroz/1exveRbCk3sbrJmTzRS9lLybQ1depLW8USr+YyBH7OBONc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408683; c=relaxed/simple;
	bh=G8/BpQP5yJXGiyBwTyqaKNBdQS3fSnvCOg9Z0oOSZ78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0VOMJUpW5dzIEHpjV4GbXdDp+1zfEzIDMWIm8/Mh2xjs6hAa8azjlZlPRyoxOlH67WvTza8awlWWNXIsf+8QKuCybNrHjnC+msN+6H9mAAyQdtJ1ge1KmBjtwvVY8DCWpk3xOrtIogSQZaFguqvUKDm9rIvNwz21JHVqduV3Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ccsQ6kWm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ccsQ6kWm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC90C19421;
	Fri, 13 Mar 2026 13:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773408682;
	bh=G8/BpQP5yJXGiyBwTyqaKNBdQS3fSnvCOg9Z0oOSZ78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ccsQ6kWmBeKXLGQnKOJP8sJv2s6/AP6taMj81rjdQLQZNwWifcAiSySIpxEVzh5SI
	 kXWWn6M21juWjtMQt2njU+AaWuQzP+mrv7MZsE/t4fmGjApXvI3QGvbNqClq+nY8xT
	 8ca8CgOL4GHJsC1Jr2PzmFIeFY/3KuwJvSvxvQhVkA7ZdqFUO6mxRI/cb+iq6n/zid
	 nF5+/ORgMQsyMkUV72gMxv2tg519pgCpbkFmiFfmfdPrtQOFBHs2lKExynZqCgzB18
	 cg88Ws9hdVz6pRMLiqPXc6e0H4oNuY3T3Eo7Qzq6HLO7GwT8YQUYzQKtEtmH6JgIbU
	 1l1mTotzMRJeA==
Date: Fri, 13 Mar 2026 13:31:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Robby Cai <robby.cai@nxp.com>
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andreas@kemnade.info,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 0/2] regulator: fp9931: Make vin-supply mandatory
Message-ID: <f787e9c9-004b-4b34-a122-7b1cca3a2970@sirena.org.uk>
References: <20260313133102.2749890-1-robby.cai@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oMdb2S2Ey2e+Jv+k"
Content-Disposition: inline
In-Reply-To: <20260313133102.2749890-1-robby.cai@nxp.com>
X-Cookie: Monitor not included.


--oMdb2S2Ey2e+Jv+k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 09:31:00PM +0800, Robby Cai wrote:
> The FP9931 regulator requires a valid "vin" supply to operate correctly.
> Therefore, the driver should treat "vin" as a mandatory supply.
>=20
> This patchset updates the binding documentation to mark vin-supply as a
> required property, and modifies the driver accordingly. As suggested in
> the reviews from Andreas and Mark, v2 switches to using
> devm_regulator_get() since the supply is mandatory.

Please do not submit new versions of already applied patches, please
submit incremental updates to the existing code.  Modifying existing
commits creates problems for other users building on top of those
commits so it's best practice to only change pubished git commits if
absolutely essential.

--oMdb2S2Ey2e+Jv+k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm0EaUACgkQJNaLcl1U
h9Ao+Af+IbWGXO0MjZtbbP9qem0Wy2zI7PKW+5z79F6V2BgfwBv6+1m/DC4h9fmZ
YRiA5gf7Olk5sOnM/MrWWzjtjIrGjq613rb1tEZYBaL9yvWmQoYBn4DBw3MwJHlx
0l1uPuhkbdMcSHnMB9qM/SFuQX9/Z8XyGDyhBeQacw4inoC/md2a8Mq4r7MxsB+1
2v0YGykUJK4ehYoPpHQUWcJZExoqLECmxX96Rsfx8wrQ7C958zq2vxVScXHMxoxI
peZlXveYPmIpwQtj4UO2krHm5EQMdJ0wypjKSojYoTYJqLtQgos6IVVnwPBh6ksw
I0bWKfIMojdAKskdKMTBmPIU5k8mrQ==
=pGeM
-----END PGP SIGNATURE-----

--oMdb2S2Ey2e+Jv+k--
