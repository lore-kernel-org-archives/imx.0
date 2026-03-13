Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9DC33F5A5;
	Fri, 13 Mar 2026 16:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773419246; cv=none; b=GoJcXkDnCxm4xhgCeq7jd3Va84pOz7hMBF1vlBburpVnV9+YlfOv2cFqYkFBRzfpYxhf2rxbD6IkTdX4wEX6iS07iL0e5N+UKreXVID7SuZAgwwls5112girFB8GCWE6MQmozlqlr05J4RwY/02/T4z8a5LE0bCKLJZ/6IFwjas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773419246; c=relaxed/simple;
	bh=rZzbvmRRfr7z4op8g2eeCXvdL+0QnRmIRF9X2tyjp9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CH4f0bTRK0dunVdqXso177v1PLMjnFg6161qSLk5xNbUCbTSyumTsPUOJh7zNcKtYnBRfJDzISRDYUZTvZWQlAPZiUTMD8lME+RM7l6/mfK8wYf008dGLq8hqJQXdIPpKkntdt4mgGJLL97OCF9AuEfM6Joj75GaEXZVVZaLFYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQNWsBjO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQNWsBjO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE8FC19421;
	Fri, 13 Mar 2026 16:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773419245;
	bh=rZzbvmRRfr7z4op8g2eeCXvdL+0QnRmIRF9X2tyjp9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KQNWsBjO5sVbLbvHvQSoQ0chLN5czeI2lLsvYSXEBWlGatTmEnjkkMtA4WOIY+WiE
	 7o0ro+bjFekNfh10pi4XbxjF8WtSCE8EenAW512Hu5wQgvtZGB54SjLhGCAY/atFfO
	 leBHqaD8pxQ0rxDbAcwAJ/TPjWqDTVs2O4NmHToF5hz2LgGvDlkdJLttS1KjakYO9y
	 B6CkwpeBW+Y6Fc+fM76MaVqSkdQoTtusj84xhPkv+13Yo4654hAWolAvHjmRiswqT5
	 GA6i8LuuIDHK6LPLYlOXKe7W5USM5iSgypI4tyMFgZQsmmmoyTgIfLMO1FX1IyMZMn
	 1nQ5u8m2oA0sw==
Date: Fri, 13 Mar 2026 16:27:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Robby Cai <robby.cai@nxp.com>
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andreas@kemnade.info,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 0/2] regulator: fp9931: Make vin-supply mandatory
Message-ID: <d57d9f4d-098a-4663-aa72-4d3104451aae@sirena.org.uk>
References: <20260313133102.2749890-1-robby.cai@nxp.com>
 <f787e9c9-004b-4b34-a122-7b1cca3a2970@sirena.org.uk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6eb/clAo+lAlCyw1"
Content-Disposition: inline
In-Reply-To: <f787e9c9-004b-4b34-a122-7b1cca3a2970@sirena.org.uk>
X-Cookie: Monitor not included.


--6eb/clAo+lAlCyw1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 13, 2026 at 01:31:23PM +0000, Mark Brown wrote:
> On Fri, Mar 13, 2026 at 09:31:00PM +0800, Robby Cai wrote:
> > The FP9931 regulator requires a valid "vin" supply to operate correctly.
> > Therefore, the driver should treat "vin" as a mandatory supply.

> > This patchset updates the binding documentation to mark vin-supply as a
> > required property, and modifies the driver accordingly. As suggested in
> > the reviews from Andreas and Mark, v2 switches to using
> > devm_regulator_get() since the supply is mandatory.

> Please do not submit new versions of already applied patches, please
> submit incremental updates to the existing code.  Modifying existing
> commits creates problems for other users building on top of those
> commits so it's best practice to only change pubished git commits if
> absolutely essential.

Your v1 was at the tip of the branch so I did actually just drop it, but
please don't do this.

--6eb/clAo+lAlCyw1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm0OugACgkQJNaLcl1U
h9AW8Af+Lgmh9hupdJZQcf++Oi0JBM4H7Ns/6IdbZ+phDrh2OF66qeZaks925pMM
4BdEhQ/kVqTDlBBk267P2TKXlGUoSH+3GHhakjOH9JS3i2b+uYCO11pGORpcUJTE
zppSC7dq7ffVNkh0OhN6P/sxw4MyYCSdV8uENLPO8ziz2OQZQzimv45ePfvIyzZv
mYBpOAZG3cMiMl7rEUe/b7lCgd3W3Sc/P+J21WNm+6ZH/rd+XaXveOhSckpF47oP
e6TmlTYIZlIAnz3DH+saboia9GZSpkxWTHYcclyBd6Fs3BeVmCd0fooXcPgk2y17
m2wrVPN9ToanIUuZeT2WFlE2Ik1KHQ==
=/P5R
-----END PGP SIGNATURE-----

--6eb/clAo+lAlCyw1--
