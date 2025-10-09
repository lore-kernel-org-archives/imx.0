Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0327A38D;
	Thu,  9 Oct 2025 18:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760034383; cv=none; b=t9zbjDEwzCBjT/F0d/pdYEUZ2boafH92a2Zy5v8fFyfNqRyNtnMeXyL1XBaOEz3n3yPWm/YS2Y6a1tF1w8JRVpwHlSsClFwvPnmkdR6Axx834Ay8VywKtCd/2hubcmFtBRz3PgGxJwZ0vi+feNaSraItzCAwXvT7OVoltZW0k+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760034383; c=relaxed/simple;
	bh=JWAhSnRiE8GPAZSm4oQQtqwekOOMPU0V6QfkW4vSi3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rPKieVWcAi0b/7BZDo8euM1EgukprB234n42hZTiXeNvrM/C8eFrmvebPDteXf+Kr4tu69iZUcQXxHJWXbdw+SX5eBIQSdhqteF8uxH4hHFKNljpxVehT/mBqZa60k4qMAtO9pZP1zazW5Lv7f0EJ74bzOj6kjEozTUpoGsdXfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LW9FQA/t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LW9FQA/t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E19AC4CEE7;
	Thu,  9 Oct 2025 18:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760034382;
	bh=JWAhSnRiE8GPAZSm4oQQtqwekOOMPU0V6QfkW4vSi3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LW9FQA/t/VZ2QlytcYC19B7HGRg5novCD/Vl51YJWjjfz65BQozCs18mPZHmPYO/2
	 EyxqhWZ7DHoXdqqsAZ1dqQjUnUSJ/I68qzv9/wABk8nMjbmx1ALvGHQALkpj+qUTSI
	 2n0XbkngP28f80RwpbnPsYQ3zVyDgYV0ffyCPLc2lNbT960sPe4cn6jN/7g3GNErNf
	 jVDPEj1tnnTmCPo43m57PIJSTMQJTchLP7tubHzm0u800U6/GRT3FlA8Gchpy6KaEV
	 nCLB0yvyEF7jLIEzMeFaipLsfsn+QxhYpUv5cv2WvV3L/kBVSXBINvUtrYKywJ4dKD
	 zDv7JZqT5TZfg==
Date: Thu, 9 Oct 2025 19:26:18 +0100
From: Conor Dooley <conor@kernel.org>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: fsl: Add GOcontroll Moduline
 IV/Mini
Message-ID: <20251009-june-greasily-3b7315339c94@spud>
References: <20251009-mini_iv-v1-0-f3889c492457@gocontroll.com>
 <20251009-mini_iv-v1-1-f3889c492457@gocontroll.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lfuq9rSWFptVSRA3"
Content-Disposition: inline
In-Reply-To: <20251009-mini_iv-v1-1-f3889c492457@gocontroll.com>


--lfuq9rSWFptVSRA3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--lfuq9rSWFptVSRA3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaOf+SgAKCRB4tDGHoIJi
0pjkAQC9hkkb+EqvQuGO93dBxS/UYEXTZKdiGAckdllZ4l3NAQEAz15iBgfNIgV0
nj7aKLkyVW135fPNT6jo9WLpCE4+IQ4=
=8DJS
-----END PGP SIGNATURE-----

--lfuq9rSWFptVSRA3--
