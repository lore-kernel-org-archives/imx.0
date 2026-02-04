Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEDE428465;
	Wed,  4 Feb 2026 18:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770228333; cv=none; b=kBJnukgow6gOwcIJ+cTijw8slSDH4FULoc6LD7WqlL1jGm1TUBWdoNiqpctkWk3JcxzAhYdcs4bfvSX1LN8oUdNJVdX1brm3pq+N5W0enMYr2xIBYb6CjL7ysy4A7PKr1xM+YhmZS4efTzWVWaLsZ4zJExTSXY2y3p+YUW7HHvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770228333; c=relaxed/simple;
	bh=D53HBMSb8J3Sayv18SrM/DE9F0UmWk5h0fESWtISmGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7oYrYOuN2+vy2p6+SDcmH4i614k6ggaGzO0w3CGv49f/NdUcBYIcIil/0Ocaj6e25qHUVuPJ13vKUQOrvt7/r6cVwEuseZn7/h2ilyNxz76UC5VDXZIy9e8bMXju8ghQhRSRGAADlx/dwD270ka5nWQ4Co50mN3Zou3Ot4zcr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pOQQAbpb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pOQQAbpb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEEA5C4CEF7;
	Wed,  4 Feb 2026 18:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770228332;
	bh=D53HBMSb8J3Sayv18SrM/DE9F0UmWk5h0fESWtISmGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pOQQAbpbHHN5f/fj4I01Akhm1tnXd7hZcHsy+xPUcBhQqM9gyqJno5/f+Vhk2gQMj
	 hkrzVva5m7ye/mH8zCnMexlu3qedsbvICbo2Mt80cZPJfwE3F3K0HQjqoQTrfe6Lt2
	 iUuCctyQrJrcA0D8jpOe0qil8snJgwmCTHPTwcXfXZLupK4wzGvRnkTF70aLdUuwqe
	 kMrPR9X9H7XWn1h4YqPBSnrEwKvcaOzZazS0D3fjBo9FdqRq3BeNw8+djTogiDDobK
	 W0sBcL4I4R6Wo75++wYUT4ZyjbjAaaBaUC0LDEvm8qsCGsA0L5cjypWpFgmb7IH/fh
	 DG8vULMHH+5KQ==
Date: Wed, 4 Feb 2026 18:05:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	festevam@gmail.com, alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com, primoz.fiser@norik.com,
	Markus.Niebel@tq-group.com, y.moog@phytec.de, josua@solid-run.com,
	francesco.dolcini@toradex.com, maudspierings@gocontroll.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite DART-MX91
 Boards
Message-ID: <20260204-brute-daydream-871c0be53454@spud>
References: <20260204170356.35169-1-stefano.r@variscite.com>
 <20260204170356.35169-2-stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0sR0klTatUnpUM59"
Content-Disposition: inline
In-Reply-To: <20260204170356.35169-2-stefano.r@variscite.com>


--0sR0klTatUnpUM59
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--0sR0klTatUnpUM59
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYOKZgAKCRB4tDGHoIJi
0qetAQCq2VcboFqXT/rCNQlQcHVzPO2WoYqZa/iOZzp1ZmH/MQD/XUYg+z8frbj7
i+WGA6DX7wrdlLaJ7mRO90s8yYiYeAY=
=RrWE
-----END PGP SIGNATURE-----

--0sR0klTatUnpUM59--
