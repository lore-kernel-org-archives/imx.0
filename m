Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF6927281E;
	Fri, 12 Jun 2026 15:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781276712; cv=none; b=rnrEBvc1uwxkmbEdBaPmOfdXqAWegytCGbSURrv9+BBAu6Cux+ZduiZubEEKncWvla+iYip0wsIzwPs1UCQxg/QpXyN7td5LCgDS3wShPCNr7YjoYfMLqfgpJVoCgpp5DXUFKBXygUfIC7hdT4D43vOjZIAacXxFrHWKYaDO6n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781276712; c=relaxed/simple;
	bh=JvGpIQcD87cYqET0hiDZk+y9Tks+gFZgafXEmEFaMPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BBJ9kwtHlbAWlh6C7bKANgttKMI0fJ/idqRtp27vrfmbarQXhCg1LZQRpmBuxYSf3Gu5YjPcG9LU3R31sakYvbolAMfR3ZzNaE2nevuh+l5PZWZcg5+F0TQYw6OrX29uc2Ccs+3nsKr3R6HaFoZnYW/jfyQP4QFE1pucKMVWbpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BV3KTv5D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BV3KTv5D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72C8C1F000E9;
	Fri, 12 Jun 2026 15:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781276711;
	bh=9RAbFIw0jamNPl6PD31GkbyejBwj+MRucx19vqfzlvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BV3KTv5DAe7pofu/YoU+7QCEDYAss1lut0QgGf+ZAw/YLG+VjpmDtd+ZNmOg4aXrp
	 a8O4jgwr10lulxIMSmAu8QT3H/CREASd4ANPG2zE8sqdpMmQqerVn330n3jqfvJeHO
	 Csz4PW9uwgaInmQgdJr0TvRr6wWBGGnh2Rmu+PrO0JQ9GSD5dpWMrx71luE8HxJ1TF
	 MRuqUhd977WEf0QMV0/VksoJhILqD21C+qkSGjCnJ8iXYFReZxqSsGu9mZpmp7REnz
	 dVdywULgKQ0homL2sVlf0B3M9jWEmLG3mFfdjHg1qyimse6FfdTye6/HCpq5VNZb/w
	 ApMpj2vjiRfMQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 681511AC5ABF; Fri, 12 Jun 2026 16:05:06 +0100 (BST)
Date: Fri, 12 Jun 2026 16:05:06 +0100
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 11/11] ASoC: fsl: mpc5200_psc_ac97: Use guard() for mutex
 locks
Message-ID: <aiwgIjVqa4PeGjRQ@sirena.co.uk>
References: <20260612132639.78086-1-phucduc.bui@gmail.com>
 <20260612132639.78086-12-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="78eYuAPeqMdiQgRf"
Content-Disposition: inline
In-Reply-To: <20260612132639.78086-12-phucduc.bui@gmail.com>
X-Cookie: Nice guys get sick.


--78eYuAPeqMdiQgRf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 12, 2026 at 08:26:39PM +0700, phucduc.bui@gmail.com wrote:

> -	dev_dbg(psc_dma->dev, "cold reset\n");
> +	scoped_guard(mutex_lock, &psc_dma->mutex) {
> +		dev_dbg(psc_dma->dev, "cold reset\n");

mutex_lock not mutex?

--78eYuAPeqMdiQgRf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmosICEACgkQJNaLcl1U
h9BWkwgAhUG/BmHjT9vHm05/5/nin4LjC8fo8dB0dxAhqUOforJ+jokmjumsPz9h
2ZIsrszudxyiYPjue+UatceR/7Jjt3fAQSGKO5JeOPF+TWKW/O9LhpNPG0PFxoX3
6JIvxheh6qUaQgcu6I2opGcWRkNsUogX0ms9EqaKqMqdl9GsXaB+DsebpRpT+ig6
IesvG+gspxw6bxf0zQJ848CK2TDYnYC6pIeh1sfTTpOKXEq1cpiov+ub9GkmprH6
huycDqa5UDHqqRmfSaERRr0JO/dKd6OxYG5rLGFBT9c/te3hhgLDZcqFh2Czp5er
lBlS5G0zOAZKOmQW6E5Wxh3YgRh+0Q==
=f0Pg
-----END PGP SIGNATURE-----

--78eYuAPeqMdiQgRf--
