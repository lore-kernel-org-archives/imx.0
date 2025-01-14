Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564311DFD8B;
	Tue, 14 Jan 2025 18:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736878379; cv=none; b=XP/WxIREWoa9KaAQ7dkj2rzrhZbXQMj2qudDuRq67iToE/k9vyt/4qsSp1Y/DM9EDAFZUkzN37WWMHps4ytP2LuCufVNOYUe2qXNcOE3KYafx96mDufRTdGGRmmVWhnr+xayDFeUWlp0kW5oZzIRB98th33s3tuaDZwq3/AhZu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736878379; c=relaxed/simple;
	bh=FZ0JYVdCbkB3X+LIyznCf/o5QfngqCx0aNGkx8ffvYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtKxeopRo9mb78ih+AdAOZyEq/e8N0fK+Tj4Nl7MN77KQDwtVOacCvSCNKUrR/SFcldOxuCThmu5g70z/2Icn4nZMyETVVgpWBj61yUttP9Ctgqc0OZsrYDW1hwKXRDnMmiDoD1fO48Ry3cv7SLz9ZW2CvJpfA7PVtWigZkWpSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aFfzljbs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aFfzljbs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C277C4CEDD;
	Tue, 14 Jan 2025 18:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736878378;
	bh=FZ0JYVdCbkB3X+LIyznCf/o5QfngqCx0aNGkx8ffvYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aFfzljbsUi3dbQQTqnFefJril2aJRmA/BMdF/t/kCM0K8Xr3LRoGob9nCaPm3DqCQ
	 SttcfzmfGC1h9guyFn7hjbSrvcJxulHLvMiugqkDz9bKfVxSR8u6R8xE4CDV12b5FO
	 T0PghZZegzCskJUPKRKtBoi7s+KL2JylRxh0WbPfNqKETLqSu61aungDGvwP2zi40G
	 fnBK7keiA0HOM2eVZ2v4gKdkcOO99YHNyvtvX+gvMAmWKh2WVG2c/XLc1Ou6IUay+n
	 69gGBvVs1RFtMrBfGyXSqvU5/z1Dho4RNgE5Wmud/eYMhZd14ErbRNBhMLXOBUNilH
	 CD7zRVRdYX90A==
Date: Tue, 14 Jan 2025 18:12:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/6] dt-bindings: arm: fsl: add more compatibles for Skov
 i.MX8MP variants
Message-ID: <20250114-porous-scarf-8f57cf59d2bc@spud>
References: <20250113-skov-imx8mp-new-boards-v1-0-75288def1271@pengutronix.de>
 <20250113-skov-imx8mp-new-boards-v1-1-75288def1271@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="67+ZtTgybKyBgflV"
Content-Disposition: inline
In-Reply-To: <20250113-skov-imx8mp-new-boards-v1-1-75288def1271@pengutronix.de>


--67+ZtTgybKyBgflV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 11:29:05PM +0100, Ahmad Fatoum wrote:
> The Skov i.MX8MP boards are a family of climate controllers.
>=20
> In preparation for adding device trees for three more variants,
> describe their DT compatible in the bindings.
>=20
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--67+ZtTgybKyBgflV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4apJgAKCRB4tDGHoIJi
0hESAP4kSZNl8bX508wWQ8RqKvF66vBP8r42Lh4HYi1CSHskOAEAg7bHJv0LRoXz
p+sQIz+Lq0HDIIwfYeWQosSbrGSP1wo=
=F2y6
-----END PGP SIGNATURE-----

--67+ZtTgybKyBgflV--
