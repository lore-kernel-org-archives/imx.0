Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30563FF1;
	Thu, 26 Mar 2026 18:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774548786; cv=none; b=Rw9xUNdVqoVChJeW8ExLP5eEgk4xMVlVxtksGOXvG7T3mUomou5aUoo2PZtpbbPJ7P3PK0jVOg91csJfpGBkWuiOlGBBEz2JJbORnjDFry3IUt0sSu2OJPlsYxTY3KHgeXP+jBjC8ElhKMGpxnPJ84AgOBxwcHTiAzA1R4FevaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774548786; c=relaxed/simple;
	bh=onuRQkPmwCIpth/t55bBYnvpguxJISC6gk3ZFvsnTBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQHqba2bRgJdPtH7CmUEhTbuAiHtn6KKb9BE3CAQEoH+rka3nwqJmG+jYmzmu50YCxOrNX0PRvP6mXb7FpzwzO3bgi13rtlPVQ+d2YC1ZVEOqmqBufHqtbxWfKh4qWupuGsC6Nxbz4cp9jNldls6TwjGk7KoFPJQrBBc1MJ0pCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fbY1+q+f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fbY1+q+f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B3FC116C6;
	Thu, 26 Mar 2026 18:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774548785;
	bh=onuRQkPmwCIpth/t55bBYnvpguxJISC6gk3ZFvsnTBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fbY1+q+fVV90ac80mhG7oRHiW7dLVnAsaxYjEkvgg3RVEFRF0TOLP78UWAGX/SuY8
	 teiNxXthB5s/sZWS3Smp+uFCrPq8ojKuCHd8NSI3Gw4YlAJ0eZJCalsGxb3CQgKyNg
	 eE1dzIZBQ7wIPacSMEtjz+W167HfW4PRVMa7j/Xog/6vfBOIIivZ4ouauNxM2QC47I
	 V8TjpiElAs+ES082b9UBM/BR1qfqsoG8tHgWvKzeHPdndlCjEvTGLOOp1DWjDkuqao
	 +5JTscv4FhUOvc08NNBR3vGZ91/Sojk/EsyBrD3koapnBIgCwBcEVvr1IwUdOJJhsG
	 YevULXYCG6UrA==
Date: Thu, 26 Mar 2026 18:12:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Josua Mayer <josua@solid-run.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite DART-MX93
 Boards
Message-ID: <20260326-sizable-dance-78b73f70fac5@spud>
References: <cover.1774539301.git.stefano.r@variscite.com>
 <b7b243c9c3931e8d7ddd984b654e7ef493e84690.1774539301.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PLO7GUF6w8z+16Yd"
Content-Disposition: inline
In-Reply-To: <b7b243c9c3931e8d7ddd984b654e7ef493e84690.1774539301.git.stefano.r@variscite.com>


--PLO7GUF6w8z+16Yd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--PLO7GUF6w8z+16Yd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacV3KwAKCRB4tDGHoIJi
0owPAQD3E45ZJKFwFRvgLC7JzNAeyiR+9OmbwQ35jEMeSNonDQD1Gn84ysRfckCH
1VN+CjFscwhHyf6LfZt3azNzZtaVDg==
=NoRV
-----END PGP SIGNATURE-----

--PLO7GUF6w8z+16Yd--
