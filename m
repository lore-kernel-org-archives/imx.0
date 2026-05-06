Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D19481224;
	Wed,  6 May 2026 16:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086150; cv=none; b=WucU1kxWL/9tQI6k1KvijqQO9MxreK6P+E1y7YPRnABH4Pi0QzA4VCtFWddY4TfsR81DyDwhXXRS3Dg+hNhFsGNX23JDRJeS6g9TClIyHIdunCCHDctXn7SWXBHvM9A4RCwn/DQ3lsU1ETEygjRU1eCFVldBrN2etXo6qbvrk8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086150; c=relaxed/simple;
	bh=LpmR9AFNLi59EffaTe/gPCFTZzey5PyTmgu1ydUeCYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkqZzfcLW8pDurG9rj/VvtSfuo/MfZVAXcLFdjz1rndWfAr5f+XlLF2P3+RT8tYqDgiL7k+A9+oeWjKwuOJ+CcxzC5tM7k+ZGbuVqHEhRvWYEaGii91wAD2E2QPlFjtCaiVv0yU8pgWiQYOVuuuIo7IzDLvnTMhJlBMcVIeEDcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LYc9q7pU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LYc9q7pU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA974C2BCB0;
	Wed,  6 May 2026 16:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778086150;
	bh=LpmR9AFNLi59EffaTe/gPCFTZzey5PyTmgu1ydUeCYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LYc9q7pURpzkQsrPDE6/qn0dzUe9BRF73KuvYzihczGQ3APxSBo/5KTgv4ynSpbZd
	 B3kiaEKujAl20u/qZgx5hbGyu3Epv7mGAmeD5AM7bSZYZ+HkD35I2MPsSJKEsbtSGu
	 32WLrWM8iDKbhqcnRdvumEfSWgnhh3U6kyoQprxqEkN5ot5X4/JWXThyzJuaX78eTp
	 5dwY26w3Eoi8PNn/r+5H7GkBCOecDi+gDjw0fwehbBrqPxqBGFnOkUEieL/+bfPzEK
	 aar/dJreAsP/0tCq5tHNGMyd54aO6jB30r+eOoKL4FgSvAlJvw66WUIkLLzX8DLKhS
	 xZgObms7FEcYA==
Date: Wed, 6 May 2026 17:49:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Franz Schnyder <fra.schnyder@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Franz Schnyder <franz.schnyder@toradex.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: fsl: add Aquila iMX95
Message-ID: <20260506-bonanza-filter-8277d26632b6@spud>
References: <20260506-add-aquila-imx95-v1-0-69c8ee1c5413@toradex.com>
 <20260506-add-aquila-imx95-v1-1-69c8ee1c5413@toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Yyv9Sjbrp17gVtko"
Content-Disposition: inline
In-Reply-To: <20260506-add-aquila-imx95-v1-1-69c8ee1c5413@toradex.com>


--Yyv9Sjbrp17gVtko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 06, 2026 at 03:01:55PM +0200, Franz Schnyder wrote:
> From: Franz Schnyder <franz.schnyder@toradex.com>
>=20
> Add DT compatible strings for the Aquila i.MX95 SoM and its supported
> carrier boards: the Aquila Development Board and the Clover carrier
> board.
>=20
> Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-i=
mx95
> Link: https://www.toradex.com/products/carrier-board/aquila-development-b=
oard-kit
> Link: https://www.toradex.com/products/carrier-board/clover
> Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Yyv9Sjbrp17gVtko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaftxAQAKCRB4tDGHoIJi
0gYDAQCoOkDa6HYxlnYVvMiZkqZ8BYpIA5UDBNrljTbPgLWv8wEAqE5T6yS34kGc
EfFQBlvn6rEZVTjD2qTFOLKKq8yP1gI=
=wHvP
-----END PGP SIGNATURE-----

--Yyv9Sjbrp17gVtko--
