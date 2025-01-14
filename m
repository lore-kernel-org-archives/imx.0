Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75951FCCF2;
	Tue, 14 Jan 2025 18:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736878725; cv=none; b=IKnyCAiIQ9TY3nmyTnJjbrq8HCecCuomfD001IFrWkpHD+EtCZV0+yTlG9EjC43AneUdwPlN7Eb52H1IfVG/h4pZ10+RaInunhSmLTII4DRO6fUWwVQK9H0Z9gi+g12UN2nGARdsVCr0zgOdTyosSrdqOY8HsP7H9trd4FAKbcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736878725; c=relaxed/simple;
	bh=5g/nAbMYMm2p9UdFeUmdEJe1r0jnPaHHIl/UszfI4Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LFPROgL11+Aori1QiXBhmWVjOje8d1sgAbDmJ/uoCubEGioCc/KDsPpA+Wvkk2sLCeeeSAdSZwhemnHwUfwvNvhU0JAhURK+XeoTYY7hKdr0lptsdpGSkyJAmsnKKz+9fXDMquLTx3QOBVyMPByQsTUMXjHG/hG3bL5YacA/MgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S5qEB74n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S5qEB74n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24DCFC4CEE5;
	Tue, 14 Jan 2025 18:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736878724;
	bh=5g/nAbMYMm2p9UdFeUmdEJe1r0jnPaHHIl/UszfI4Xg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S5qEB74nK4TX+OZ3IAzHA+hIuGqmcgZrVfnf0gDSRg4LCBlqUnFUAJWiVuD+VE2MG
	 Uo+pqf1xKMhzH/OwjvBqeF99EeQpZCHN8WHwQkfwVPucSN9Kc9gmzzFS1PjWTlk6lR
	 xNwiOBFnWGY7KXa8aHH/y7/4T0ufmy1YAA5IKef+dtC7n2fUAbkvFwNQtuxTMftyKQ
	 TBfjuZxCd28kC8yfSnorUB+4QdnP4Lv0aGjuf8+jw/38yf6vEJxfgOE2ktkAIB2y/I
	 Q07V3R35/9pOIn9cOV52anj9XzgcD3QihngfQHS6dL+L0RAWx4j+2zBTe+z/PrexZo
	 2LPz9GjJ7RRMQ==
Date: Tue, 14 Jan 2025 18:18:40 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: fsl: add i.MX95 15x15 EVK board
Message-ID: <20250114-imminent-spotted-f6775aa15df5@spud>
References: <20250114-imx95_15x15-v2-0-2457483bc99d@nxp.com>
 <20250114-imx95_15x15-v2-1-2457483bc99d@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pbVmwMD48O6xlCqG"
Content-Disposition: inline
In-Reply-To: <20250114-imx95_15x15-v2-1-2457483bc99d@nxp.com>


--pbVmwMD48O6xlCqG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 12:56:24PM -0500, Frank Li wrote:
> Add DT compatible string for NXP i.MX95 15x15 EVK board.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--pbVmwMD48O6xlCqG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4aqfwAKCRB4tDGHoIJi
0vDKAP4/yAJiBRrXaAjIEA6VGYcdE2/l5/vLI9j87t15CNSefgEA0UAdqPLPrB6b
vqycV/ej/KSaUuTkvsq8BvzMk6liMQo=
=5FUS
-----END PGP SIGNATURE-----

--pbVmwMD48O6xlCqG--
