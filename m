Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6339133ADB0;
	Thu, 18 Jun 2026 19:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781809908; cv=none; b=pGepBWJVLJgeougcLcZ9b1W9lIkrfowy9Qp5izNWp1nCX39PaoI7gyT9GoW0d54qK/k77Scxltx2GHMGUBwm99jvpafQ/8vkQfxdd+AVldWWzEhu4j5pqTRkB+Ja/cz1YiZqqir/HBfDC7Mzj24yQZJPiG0HEz33mCsRi1K50MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781809908; c=relaxed/simple;
	bh=Wkq/LPgJKtACXLfR1Mp3ujAhqAhjs6XDGaCfZtNMVVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IoV8OMMTQLpOq8OM2j/gUvBBj+aVxV00l4KCfEoRHsAtLbk23btfd2/ZpbVSfc9WVLZmllEQIcvYe5ZOy2CAEg3HlZbZAFZtxKSqR7XpD3q4+sPuuXveg629VtWKYAOZKnOlmzfrBwg5l3JSu22TXltU07Fh8kUquPtFc70RhRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=guFCwgS1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="guFCwgS1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F1E21F000E9;
	Thu, 18 Jun 2026 19:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781809907;
	bh=HyBJvK60ePnH7A+jzM90+juz3qfjBJtYj6EiAoXO7GI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=guFCwgS1/0nRRaHxBTxgi/0Cv4hcSqSTBV3ZYo5AC4sDBcflASZU6zH4JZNLEXKAr
	 SslN2b4jVyQJKr5dbJuOdPoanvbK45IZ93Nr/EwQQz/16XmtI0j1oqMhQx5+8fcM03
	 ROgr3jiKE5W8xxXJKpKB/icvP4upIq3uqn1xX6MBfjgLWSGkes0zZP9WmfIYXE7cjm
	 dqAEB3AmRb9kkIYXFV71GlDn1CDS16/h2LwcYL77xN5HockZheQ6naKarI+UgMVlu6
	 9rnA1Jb5wbwrWRFI0/S+dd19Na/r8pOVldiAdceSt/KoFhlzY2nOFbsZsMR9Trzijg
	 0y2VJSnEIUaRQ==
Date: Thu, 18 Jun 2026 20:11:42 +0100
From: Mark Brown <broonie@kernel.org>
To: joy.zou@oss.nxp.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Ye Li <ye.li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Joy Zou <joy.zou@nxp.com>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] regulator: pf0900: Modify volatile register range
 definition
Message-ID: <d528de33-eb1b-4c6d-bcb7-f8c8e6dcbe52@sirena.org.uk>
References: <20260618-b4-regulator-opt-v1-0-c43b1f62aaf6@oss.nxp.com>
 <20260618-b4-regulator-opt-v1-2-c43b1f62aaf6@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Vf+oW+UgmKaPR2OV"
Content-Disposition: inline
In-Reply-To: <20260618-b4-regulator-opt-v1-2-c43b1f62aaf6@oss.nxp.com>
X-Cookie: This unit... must... survive.


--Vf+oW+UgmKaPR2OV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 18, 2026 at 10:03:06AM +0800, joy.zou@oss.nxp.com wrote:

> -static const struct regmap_range pf0900_range = {
> -	.range_min = PF0900_REG_DEV_ID,
> -	.range_max = PF0900_REG_SYS_DIAG,
> +static const struct regmap_range pf0900_range[] = {
> +	regmap_reg_range(PF0900_REG_SYSTEM_INT, PF0900_REG_SYSTEM_INT),
> +	regmap_reg_range(PF0900_REG_STATUS1_SNS, PF0900_REG_STATUS1_SNS),
> +	regmap_reg_range(PF0900_REG_STATUS2_SNS, PF0900_REG_STATUS2_SNS),

It's a bit weird to have all these single register ranges, usually when
we have large blocks of single registers we specify them with a big
switch statement and let the compiler figure out optimising how to look
them up.  It also looks like this isn't joined up with the interrupt
handler code, regu_irqs[] lists _INT registers not _STS registers so
presumably both need to be volatile (I'm guessing _STS is live state and
_INT latched or similar).

This also omits PF0900_REG_STATUS[12]_{INT,STS}, while we don't seem
to handle these as interrupts (though we check STATUS1 during probe)
they look like they should be volatile too?

--Vf+oW+UgmKaPR2OV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo0Qu0ACgkQJNaLcl1U
h9Bv8Af/Q12z96HQzmo7shZwMQVkaJCzNH+L3ZxlOCLghye2Sbal+n7NehnM/5dX
KaKQ4NJzl+GqenCBJ9d91C0CqjVzdJFRaLfiaHxuQl9tWr3bFb6eof0AC74b/RiN
P59lD2mUO7f4Ps+44gK7XJV346SmE5p8oadMP5JHrEgSN4Ghi9WOTzVG7dq+IrCl
L8/fptNCojChJsQiCHdb6W5zQugJ7hquTe8n9njI2Frp5xXL3jZAy0NcsIbRAb7F
hQKNR1Bmu/0O7IpZyHoIviUeC9PA98EgqjzOLi6fF6JqBYvGBnKwi0973DV+tBsY
UgRuQYDYLXVp+zv9848s0476GMhJLA==
=usGf
-----END PGP SIGNATURE-----

--Vf+oW+UgmKaPR2OV--
