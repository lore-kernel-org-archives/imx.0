Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C176A3DA5D1;
	Tue, 28 Jul 2026 18:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785262694; cv=none; b=Gw7ojc95RYAdg1oKVvxjK6SORNFgUNTyomxT+di7FWHa+pq/dCIThpVGP9pT4Ak48FpngqmStS1inTOfCoPnfEGWoE7MzTR10nQaVYbQPVOH2I7uX74a6S+5aYPnEqCM35NL+XFdhCJpbZGeqJQhD2ZgEJkJS4Btk2aNFbxdbz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785262694; c=relaxed/simple;
	bh=ptrtzQNyFp45Fqgu5UFx14/CruvvfMTO5V7TH1SvlbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PTXhnuIVaG2KBYv+QqwD/m9BPRHylgbFLmx2W1ts0qNp4Ziol9wDukx93ZP+pDg1GS8Yh7753HcRqEGy8LzWDylbZwqNu5DL9od528mGw8egaEzM2PGGBzqXKWo44KS7zQqLchGzu4G2g22RQjDCrhsFIKHAZih3IVfz27fcg/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RyyRcd1U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RyyRcd1U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ADFF1F000E9;
	Tue, 28 Jul 2026 18:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785262693;
	bh=8LxXKACwBLKlrE6bOQShx1bKAyg57mIaWoZen71fZPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RyyRcd1Umob9aNvg0n6JKmEUy2bmhkvRFWYgtC4tyGofsnxXyh2pwntWKOYthx+13
	 pDnfHwdo78pZfCWxwJiU68xYyFkC8QCrd4XGINf8E7glrGXEvjZOsCgqPxnnaONbfT
	 0PZUzugmCFslFMt+m1ICbHETnQ+3vdjYanfSP0ffaLwHqD3KJbc/paLfPUfao9FWRA
	 3halOIeTzVniiaCqPNPhFNHMT/nSZkI/MyEhBWK/YvS3ppWaqSkFnXq9BN7Gpy53If
	 pTcPWUW3PHPZJanGD9c+vd5chOkk2TisLe2lbL3B98wmXpM/jo1ZCYcH2HY8pP+sIg
	 4DGKy8nzM93gQ==
Date: Tue, 28 Jul 2026 19:18:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Fabio Estevam <festevam@nabladev.com>
Subject: Re: [PATCH] regulator: pca9450: Support regulator-off-in-suspend
Message-ID: <4f1a89b9-41bc-4837-a057-f0e67f745e37@sirena.org.uk>
References: <20260724201322.73937-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cmOIkxNy1o8AqOi7"
Content-Disposition: inline
In-Reply-To: <20260724201322.73937-1-festevam@gmail.com>
X-Cookie: Stop me, before I kill again!


--cmOIkxNy1o8AqOi7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 24, 2026 at 05:13:22PM -0300, Fabio Estevam wrote:

> The PCA9450 uses each regulator's ENMODE field to control whether the
> regulator remains enabled when the PMIC transitions from RUN to STANDBY
> mode.

> Implement set_suspend_disable() for the buck regulators and LDO3-LDO5
> by programming ENMODE to 10b. This keeps the regulator enabled in RUN
> mode, turns it off when PMIC_STBY_REQ is asserted, and enables it again
> when the PMIC returns to RUN mode.

> +static int pca9450_buck_set_suspend_disable(struct regulator_dev *rdev)
> +{
> +	return regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
> +				  rdev->desc->enable_mask,
> +				  BUCK_ENMODE_ONREQ_STBYREQ);
> +}
> +
> +static int pca9450_ldo_set_suspend_disable(struct regulator_dev *rdev)
> +{
> +	return regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
> +				  rdev->desc->enable_mask,
> +				  LDO_ENMODE_ONREQ_STBYREQ);
> +}

This is the same register that is used to control runtime enable, I
can't see how the runtime and suspend enable operations avoid corrupting
each other's state?

--cmOIkxNy1o8AqOi7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpo8mEACgkQJNaLcl1U
h9BCCAf6A5B9Y0xt7dLLL1mO+6SSb0uwdSJPLUUXKhHn8YFbjCqomnZ+8aHbRLVY
ytZChFWjk2DPh+Du+DtN01UPbURTHbs8Mw4hy7N0iLiRvpniRA/jxCAGDiCaaHFk
88T4L7Od6RTWN0uy124T8H/T8ezPnL/vMMXv9p0vXLtSXbC7xRrsowXTMwyF2WPq
Voyyfanr2N24hUR7VS1Td6x9zK5aESfoqm0J3YeRAUcmT1bsQoQSLoZ6KmN+hMSt
nwt8Dqjt2EqKPMy0PAihltKwx4xvjxj/oeJpFyqb1iQ0VOHyzUoDhTggBH11sRBG
s5dduD4jj7RTNX6U1QSWXphsjircCw==
=1p8F
-----END PGP SIGNATURE-----

--cmOIkxNy1o8AqOi7--
