Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E0E22259A;
	Thu,  5 Dec 2024 16:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733417918; cv=none; b=RMephJR7x5N51klpLtqouMf3MUKC0K2MXyvqyxrkfXD5ODZFGPZk8x4+G0/ZAx94wIXAeIsiDVdYDzxi2AmngU9JEwTZvZ52Urr7TRY7ososqMaZmZd2p1N4Ey9DqYlERBlJMDizxouIumXpv7bpOYsCeiJqK3t1AyEqxjBxQtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733417918; c=relaxed/simple;
	bh=nTRnH3LEvkzjiwoZZ3ih3yskW6g7MF8/Slf2mJenKdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QXoifLFDkeKzK+pyweZNc0DqLumib3cJFpLB/i0e7GoIw41QAtzdM1gbdtCnZyXCuJ+w3Mw1mNsZpFocFU8ihogLN1H8Gs99qhS6qEP4GRLiByVOfPiQ00rw1gXl4VadljPOuLszJHYhE9S4TF+0SPfll65CIZg6cpmCeoHrqcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ECHlgGIm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ECHlgGIm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B74AEC4CED1;
	Thu,  5 Dec 2024 16:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733417917;
	bh=nTRnH3LEvkzjiwoZZ3ih3yskW6g7MF8/Slf2mJenKdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ECHlgGImtotL50LXwi9oXB2Vy3NH00it6CMDrVvFBZ8yci1Mh+nPCt7GeY2te6fIl
	 33bCCvrecW8FFnbLz2CBzZJ2QKiKO+nJDywY2SqpTx1xnz0O6+qzgkqZGsB5jwtcW2
	 ZhTrfdVSbN37lriLFPIQXployevdgh5E070M/ehMf4YNeBICp+8vVUF3FS2eqnDHF3
	 u8QKCP4nbfoXxdm1JlG8TY8IQmMfI6Pz70dyIzk0HzU6sKDZpk+VJC1Jqdx1mKl1FH
	 eulnVP4i9+zYdjN9Z2sc4NCgLbSLLZjWnKJgcOo5JrYwEiETLkFACX6XhwzQ4tPOiE
	 JAdED9o/MRXVw==
Date: Thu, 5 Dec 2024 16:58:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Robin Gong <yibin.gong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev, joy.zou@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/5] arm64: dts: imx93: add pca9452 support
Message-ID: <b5b07f6f-a5c5-4b29-ada3-962dbbba42d4@sirena.org.uk>
References: <20241205-pca9450-v1-0-aab448b74e78@nxp.com>
 <20241205-pca9450-v1-5-aab448b74e78@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+N1E8Hjj5Y37D8a5"
Content-Disposition: inline
In-Reply-To: <20241205-pca9450-v1-5-aab448b74e78@nxp.com>
X-Cookie: System checkpoint complete.


--+N1E8Hjj5Y37D8a5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 05, 2024 at 11:51:13AM -0500, Frank Li wrote:

> +				regulator-name = "BUCK1";
> +				regulator-min-microvolt = <610000>;
> +				regulator-max-microvolt = <950000>;

> +				regulator-name = "BUCK4";
> +				regulator-min-microvolt = <1620000>;
> +				regulator-max-microvolt = <3400000>;

The regulators all have really wide ranges, especially with no obvious
consumers specified.  Are these actually valid for the board?

--+N1E8Hjj5Y37D8a5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdR27YACgkQJNaLcl1U
h9BM6wf9HQleDuZ4uYHDOaaCK09bL4yTR8x6i7YoMmnlls2srtzGMRGZZ1cb/sPr
a0RwpUShL14RqyuRYmEerOprPVYYLpvx+Poe70MiMG00p1c2wDbLrt2o3OYppkmh
9DXALyEsWkqnL6bzUD9T+m/zBfaIfUuO+ZY/IGiI+mVl0vzDEebE+hq9Jg4rvoNd
lN7951ImhymCfvRvkUM/RmjuLkijea9e00JW0Mqbai6WbhC5NYbo6Ya+inPKtkKX
+zuQQlnFcs93oqTJqtngequdn8bmyvjzHKmBXzS3kz1PmUUV69gXm2C7FbYOh88x
H0307QzEKgiy+Cugcn/uBhoFj41F3w==
=Ioa2
-----END PGP SIGNATURE-----

--+N1E8Hjj5Y37D8a5--
