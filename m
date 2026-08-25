Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E29633E36A;
	Tue, 25 Aug 2026 16:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787676687; cv=none; b=MePAVqCQCuTeIy9EScjaXITVSJU2glJSSZnBQoTRWz3q+1kepFpE5f+QsorKmnT9Ugpmb+0OLp+DINLfWYVV4oCX2mYbbXiBNsfpQKaqL5APF7fQQ9WkMaWhxQZqKoOVnh5j/ZioRUuS/LTDq+idGsGhobD1d3W72QpjD1Yq0Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787676687; c=relaxed/simple;
	bh=uj9WhkqkZdb3jP0eYrqc0Rs9Sev/2nJjaxalhss33qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z5pHbJFHH47dN5eW4xmyXJZdhsEjqqtv+72WNFdtrZvb/C1NPmctmlKgsWAtGzhtXiMJDWmx8mJ6/nX0+YQCS28mnklsMne39PXo8MqeBedYmToQ5Ee/go+DEq0edAKSAVavYW9kKJmXBAxyfVg//JydwIvcstM/9DyAKNoGRYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0UfYeBF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0UfYeBF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF461F000E9;
	Tue, 25 Aug 2026 16:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787676686;
	bh=uj9WhkqkZdb3jP0eYrqc0Rs9Sev/2nJjaxalhss33qs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m0UfYeBFq6LJSnyuICm7ghI6FTvFcSUB336zoKnLgEVcq1t7M13917xMX+2+NqijR
	 iBY8Lr2CqCEi8qovye0uCDx5yUpcimHnY1fUVXnQUdNsmfVwNpRCSII85miYDBBscS
	 Z6zHuToi8LupYVvMFPz/fE835Sud9/76cP6/X2KiSymr5RNulzF8dARWUbAN3wdLiE
	 ln65cpvGvNRz7lgyCxxjPv4NFeVGhEVCaC7eyFofwHqK8NoLDGrFgOTihjUcqLNHAp
	 Z6d2iC/BPJqIPUVxMcIOTEkSLwIcfVLRzFG3/VKgPL51P/y5yGfzYDRzmbsmUtVYD/
	 la4oVnjxr22NA==
Date: Tue, 25 Aug 2026 17:51:21 +0100
From: Conor Dooley <conor@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, elena.popa@nxp.com,
	cosmin.stoica@nxp.com,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: add MR-NAVQ95 board
Message-ID: <20260825-slighting-tweak-7edb9705411a@spud>
References: <20260825120812.2152-1-laurentiumihalcea111@gmail.com>
 <20260825120812.2152-2-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="thp85LlBU4kVyd6v"
Content-Disposition: inline
In-Reply-To: <20260825120812.2152-2-laurentiumihalcea111@gmail.com>

--thp85LlBU4kVyd6v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--thp85LlBU4kVyd6v
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCao3ICQAKCRB4tDGHoIJi
0q3LAP9eiNOKbeSHdVJaupRVPyTvh2tBUfSgxHD90LXQpr/7cwD9FY9qLM8PxlSn
hv40hzjuLm7uotv6kc2j2kEw+o2QygE=
=TJNO
-----END PGP SIGNATURE-----

--thp85LlBU4kVyd6v--
