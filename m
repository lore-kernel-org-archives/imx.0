Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034C91C28E;
	Sun, 26 Jul 2026 15:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785080623; cv=none; b=LNhD2/EemGjGfGF7laLneaEBVHe58Sh75gqn3QPf4zpoFaDdu2mqMEmaKeocUNYgmAlBbKuKQ0tmbF6jvZ5BO7zP6tMYTTc/f/vP0hF8xwlUiJOlREz6OhXjSu60nmQUGD62uRNf7PaMcLERLpetNrnvQG6DB0Y5+jZ6ZCAHguU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785080623; c=relaxed/simple;
	bh=HfWouBJ45JcKoonkm5wKscCyFgUtTG9uLeejihJLY/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7vXYM9geG1xX4B0wyBk0qY8JneVp1lT5SM8kjNkWmf5D8MIhha6FLLM3GBm96Wog6clzAWmRFIbLwenvpKhpdD7hCZi8NRoeJDk+h4SchQzq3igLtk7O//7KJu0GqzLqTl1zhUTZlv04J60oGTSLa88YcrXl2oi6UcjU8Vlz6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gXXyZMiv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gXXyZMiv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11151F000E9;
	Sun, 26 Jul 2026 15:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785080621;
	bh=sUGyuvkqlkCeQ2rdEHqB67jDU1QL7EaM+9mVgGsuwU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gXXyZMivBRBXbL5BMd6fV6TgXKUkF1o+9DknaYH0lmKcNEK+Ny1S+scazmDG7wiPT
	 lYc6EQnzDos5H0uQ90tKSpk+HZL5XPB/S7VT3jmE9aLY2Bz0aSAqEnQ8/qFxoxnVwx
	 Wz/FFX5KEwrRUwjbJfN7HrMnuHOVzr2HEM0pUYkDFrTrzc6pLmP4E0rlAePyIGar/H
	 sYpv11m3rWOkZ1Qlh7fo65pFxBSfyS83OIff1yaR8sXyvgf6S78Vy4JZVhIMmnaLS1
	 UW/YNdddoDUxvP89qDSVnXVZ3wz1dXQqS5E8bsDaYRHiOmQJ6WUY1nNjo61hh+Yr9O
	 q9GK4fzyxJ3+w==
Date: Sun, 26 Jul 2026 16:43:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v4 1/1] ASoC: dt-bindings: Convert eukrea-tlv320.txt to
 yaml
Message-ID: <0cc181a1-de0b-47cc-a46d-1219c273a14b@sirena.org.uk>
References: <20260515145205.1696584-1-Frank.Li@oss.nxp.com>
 <amPA3hHmTQm42PP9@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JVqT6bc2U12RTO70"
Content-Disposition: inline
In-Reply-To: <amPA3hHmTQm42PP9@lizhi-Precision-Tower-5810>
X-Cookie: Necessity is a mother.


--JVqT6bc2U12RTO70
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 03:45:34PM -0400, Frank Li wrote:

> 	Can you help to pick up this one?, Rob already acked.


Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--JVqT6bc2U12RTO70
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpmKyYACgkQJNaLcl1U
h9BoEQf9EjChwXEjc0OcuLtfDE4HzeMOTZMpJw9a9BlWVDFXcJKmn1v8dYQQ0ufm
6d5Y6cS9VSp6M9QuFXHUEPwBBt+IdWFORIaogzOYTdSnEkvy2AJ6XMh6E1ua44ep
XNvnjfWpYO9UAC/E8wH+EKSTWQkOi9ttJ067+/etSD/F9pYP6VCeHKAPw0QX4O/r
22IQ3sYdNynJ/NdZiXIwQIbem+H2I9+kaAj3UlcdPP8n5c4G0Dnk83OEtvAc1fDA
/MeVoDNjmyG0KPluar+MlOa4FyUuthLny+ewvn6kwKzOuALiXeXG3ldZNyQfmgQh
mI1Rwv0MnvXnmlJgx572RSmrzmZXJA==
=eE9L
-----END PGP SIGNATURE-----

--JVqT6bc2U12RTO70--
