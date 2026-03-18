Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BF8334C05;
	Wed, 18 Mar 2026 17:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773855713; cv=none; b=XArsLCDgVDZB+Q9EUKBYmPod27S3vHaHs/Yx28YZpVsJj8L+Bkenr0q6hCsgDJ3ZaNhrfGcCmxtgboKduXp6ekVlXAjcwzfhwkf78HslrhRYQKR+2rGUtPOl7vVsFqbMr6Q1mBiOdfER2y4qQOBVe7Ow4flni6/j1Uf65nRdVko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773855713; c=relaxed/simple;
	bh=yDnin5PIEgWDcaVrR5ixb+9wo6/QmHyvet070Cnr5go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CknsLuv8IZjRi31xE/JonAQM6AyjZaBLwGUMAmcielYXnOFK1Jy8FcftZlOYXWjVwhCMJKmVkEL1tqWAvGG/uQ9CsNMEGaSgvzc44xsz82JQjS0p7F8pEHDMYcipOunvfb1n5F0TczYLM4PGmv6rmz54z1yWY4BPjPBFChXlzcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rshza5X9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rshza5X9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFAEFC19421;
	Wed, 18 Mar 2026 17:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773855712;
	bh=yDnin5PIEgWDcaVrR5ixb+9wo6/QmHyvet070Cnr5go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rshza5X9hG75xKjS0ZAVmMNw9G83zG8xePF2WrsshrIF0xfBMiEhjYY12yyXO01Zc
	 Rw6uBfTrA13I8iLqZ+a44i70SCWmldHrY32Nkzx9GtffDcjaCwJSNL53Y5UKbTWX6/
	 0Pq8XYbWSx4Zj0EBCR4eqMFLB2wIK9CK3G1zyj/n3qzrDp2OldOTzaHoSpAS8C656t
	 YqcDUNVOrqmn9Gq6BoE3vswe/xPmqQffhfaSpHQGq6tY/LSOUFGzQ08PerpwiOxWp3
	 BuXaj13WsqK+7pwnDW5rce2US0m8yP6Ykw6W3ohZVKDxwsQ2fehgdYUwKyTz/K3f6D
	 EFD251j0ykjxA==
Date: Wed, 18 Mar 2026 17:41:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, xinyu.chen@nxp.com,
	qijian.guo@oss.nxp.com, justin.jiang@nxp.com
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX95 19x19 FRDM PRO
 board
Message-ID: <20260318-blaspheme-wipe-8719c19007b7@spud>
References: <20260318-imx95_frdm_pro-v1-0-8c00e59f0b1b@nxp.com>
 <20260318-imx95_frdm_pro-v1-1-8c00e59f0b1b@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wWcgIj8qfCugOwjO"
Content-Disposition: inline
In-Reply-To: <20260318-imx95_frdm_pro-v1-1-8c00e59f0b1b@nxp.com>


--wWcgIj8qfCugOwjO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--wWcgIj8qfCugOwjO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabrj2wAKCRB4tDGHoIJi
0sfzAQDnqZpou/DIpG1dQJ4XdSKe9/QnNu6UIKgK9PLQKeXgeQD+IX/0OMpx3M9y
1w/wCI3p1EALDrK62Gu+VHONpjkVJwI=
=AIgG
-----END PGP SIGNATURE-----

--wWcgIj8qfCugOwjO--
