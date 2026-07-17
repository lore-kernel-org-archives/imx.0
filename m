Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89979BA3D;
	Fri, 17 Jul 2026 13:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784294555; cv=none; b=bZcCtMmTV10z0nhdj5YV/XhmLArDbGG1zRu+Gt7B3T2gGzZQAgoIfhxfniB/z06Cr6ihvEqp1Qq24CzE74QV9PSLg/wse0Au966FABf5KO83v/OHrHiyL6NcH7BdYBV2q0MuBDwmgxWx40lo35lgr/VnQvE+O/Q0IbYprNJ+s24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784294555; c=relaxed/simple;
	bh=zxcd7xDhYTrpgS2ua0mC2OoU2E2wC9SDIPNvJVfqnuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRgFvrhv4Xelq928pME/Ruv9A1GUJJKCxqz32PnkK29TEBUy96KWYQJvzUl1PUyqTWpxSesRbza//cGpyaQeEcAKbb8BO+7WIGhQZO7bAxr4WKvrolAOvMEzsKI/CfG3YKvfyvRbnQNOyGDcW2+aXyIJjM2a23/GWvJHG/95Pa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OB4sFjOk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OB4sFjOk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437F81F000E9;
	Fri, 17 Jul 2026 13:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784294554;
	bh=1kOJD1kFJV3xUAdZQqjPuTblJam8XpEuYK8dAO5fXE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OB4sFjOkMLYMxOjflQc8muxxUs7V133H6x2O2zK7+3/xed0458zrQpJMT+12MhxY4
	 nKD+Cc9opUf7loxx6rwHFe4jJ8hBDuhqbv2/fj6MnZnCOoVQpq7gaX6zbcPnL9umQP
	 6soeO8bkJ9JInsJ7RhCPnxaQsYsegFkvffk1mHtCig7WaB50U0QzztYyJUGueA/tlF
	 TTuj3PJw/fHgmxJZ56T6MOGua/mXXxsDureJt/nzkgNNGQjg5ProYnI06dCLsFRZ/p
	 YPoJ/SIPW2ISEYtNm34v5SkEg2TJvt+TBpVpAA7Z+BlxTuT2BXIhUweT1BCmdJSpcg
	 S/cvLb5rIm6Lg==
Date: Fri, 17 Jul 2026 14:22:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Joy Zou <joy.zou@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] regulator: pfuze100: add set_suspend_disable for LDO
 ops
Message-ID: <ad97113a-0898-415e-83e9-0e5db54a30a3@sirena.org.uk>
References: <20260716-b4-regulator-pf01-v1-0-8c1519d54bd4@oss.nxp.com>
 <20260716-b4-regulator-pf01-v1-2-8c1519d54bd4@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uKYEymIBh1Me1XMm"
Content-Disposition: inline
In-Reply-To: <20260716-b4-regulator-pf01-v1-2-8c1519d54bd4@oss.nxp.com>
X-Cookie: Enjoy yourself while you're still old.


--uKYEymIBh1Me1XMm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 16, 2026 at 11:50:54AM +0800, Joy Zou wrote:
> Add set_suspend_disable callback to pfuze100_ldo_regulator_ops to
> support regulator-off-in-suspend DTS property for VGEN regulators.
> This allows unused LDO regulators to be properly disabled during
> system suspend, reducing power consumption.

> +static int pfuze100_set_suspend_disable(struct regulator_dev *rdev)

This looks to be only used for LDOs but is named like it applies to all
regulators the driver supports.

> +{
> +	struct pfuze_chip *pfuze100 = rdev_get_drvdata(rdev);
> +	int id = rdev_get_id(rdev);
> +
> +	/*
> +	 * Set VGENxSTBY and clear VGENxLPWR so that the LDO output is
> +	 * disabled when the PMIC receives a STANDBY event.
> +	 * EN=1, LPWR=0, STBY=1 results in output Off when STANDBY is asserted.
> +	 */
> +	return regmap_update_bits(pfuze100->regmap,
> +				  pfuze100->regulator_descs[id].stby_reg,
> +				  PFUZE100_VGENxSTBY | PFUZE100_VGENxLPWR,
> +				  PFUZE100_VGENxSTBY);
> +}

This is a fixed bit in the register, but I see other regulators have
_stby_mask configuration.  Are you sure that all the LDOs in all the
regulators covered by this driver have this feature with this exact
control bit?

--uKYEymIBh1Me1XMm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpaLJMACgkQJNaLcl1U
h9DJTwf+JXmWWGEhODznp7wN0yDnSK3YWvaKUh1/0xQaa0wJUAiNuME7187VMBmJ
Bv9HmnfG90F/7d6ZKZKzyF7yfYF4GdBMac9cUnb9g7hWg9fDe9nbWgKf7CTDhJzR
KfrE2QY62rkYYLXQ/87FFBjB6W8dEd1/yB4tkTsJ9ZdhaSckyNRSgwu9/0sWkGA2
1zvHyJQnDeLRGoQgYUrCzfGdwbGyMOgbn1mVrXJJHs7Mkg+t2v6+hBOYAbPVmwK9
bGGwI+GQMS5UrRVEgTOk4F6HkqQRnN7zO245kTV4dp+qeTZTo7UbPhV/6Ks69XYg
K6jZslVrBD6V8jlziX9iDCzADUhkHA==
=IpOL
-----END PGP SIGNATURE-----

--uKYEymIBh1Me1XMm--
