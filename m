Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F238E3CDBAA;
	Mon,  8 Jun 2026 17:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780938467; cv=none; b=DJNyPDorpHIIDF31UH9sqtGp1mU9Faz2gl7Be895lYcF9TNMwBkQIKUN9q6ZpglwAUVP3vOh0IzXcf8eXQemzEL78NhB9p/oXQP5dC3nMw17yT0Bwkj81VFJLEjIAoV5/XHk8eFxgKakOsaRIfzFW1SXi8yD27HMxxMRDrEZdUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780938467; c=relaxed/simple;
	bh=C7hx2doDWAY1iWzUZLQCnOGf9ISlINrxqo4MG3aJP0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L0aK6keQu0T1iJbA5Ht7+oKvozoYVQ+okXG52buDgH9fIqRbK3ZmatNX51VeBA+1P+XGwFl1ObdHJM4KeuIE5DDdmpgNB2cm42PE+8bnI191xfNoMbXt5SqRGInXzMJv2fiZaHVFFnaBf1uyJWXsQbti5XmhrZsb8ZDYroVg5s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZmpugfYm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZmpugfYm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F2151F00893;
	Mon,  8 Jun 2026 17:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780938466;
	bh=C7hx2doDWAY1iWzUZLQCnOGf9ISlINrxqo4MG3aJP0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZmpugfYmpCFnw75A3b3VgjxPivYQx2DrjYVU2ZVVMuJCs6H89wZnYF1hk+dUKCtVL
	 Bh9Jax5D1E5t99E3Ay5ct1ymEYeWiB4P0vZ2/uOT7u+WaoeS6P/Lcqj/9xvs+W7+XA
	 jlbWCs3FcHDTO46ufiVTMuAjkYHeKDomoLTbMzPTWOlIzxb7RmGY3QkHYq48IYAHoi
	 ht1gY3QloKTlB1/ZxicCyeYu34MH6NpIA+lvc7Z5s/flFGrlO55gOaA3BSajosGlv8
	 uhJiC3GXfhuuDzlz0B7URgU1Qb03rUG0EV+txmDIJMjm3UtdnWuJdOqLlMz2zM1ilS
	 F1qAU5aNnNL4A==
Date: Mon, 8 Jun 2026 18:07:40 +0100
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
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: fsl: add Variscite DART-MX8M
 PLUS Boards
Message-ID: <20260608-drove-surfacing-2464cbd7a3a1@spud>
References: <cover.1780912513.git.stefano.r@variscite.com>
 <c65129896fc6ce80044ee1d89e12dcdff34945be.1780912513.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ym6O7jMXSrjk7SMB"
Content-Disposition: inline
In-Reply-To: <c65129896fc6ce80044ee1d89e12dcdff34945be.1780912513.git.stefano.r@variscite.com>


--ym6O7jMXSrjk7SMB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--ym6O7jMXSrjk7SMB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaib23AAKCRB4tDGHoIJi
0sxUAQCrXXXe9qXqlNWTyoVvqN/TVTZrDplkAr4WeF+ipcSHXAD/T7eYEtsd5OXr
44pUA95istVRYx/h9iS3NYFr1c/Kggk=
=xGWi
-----END PGP SIGNATURE-----

--ym6O7jMXSrjk7SMB--
