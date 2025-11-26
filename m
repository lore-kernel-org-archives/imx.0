Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4E7168BD;
	Wed, 26 Nov 2025 17:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764178398; cv=none; b=qF43Yx5JSQb+L0u/hNZq/VqCYcBQ0kBbrOJ5kocIa1K56InLXH/uhqdhkOLJvHD4+97+CyhAgPewB27951Fcl12Y6KwhO+wSQgw+oZHtb5hDkXx5J1lSO44XWebAlBH4FmcKQS8JBx7qbchjmPBiVYOf28c+NZZDjr2mx5cqUnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764178398; c=relaxed/simple;
	bh=bcyzAwmdxnWy+UVULn96QrMVl71ckk1exPOcq3X4mbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glP4eo6HDc92PecJM5nz+Sq4+UFmIYP1y0ZZmi+BGnbO080/wFLkS65U3BzvXzEEs+Xj4uZQYBMlOsms7WBxht3eZ8zj0xGn6jRaYOuomGOhq9XTE0XiSAwll1tDQ4OtyFhgLR83zjbnqlFB7teqFX0NV3PVBjnVpsx+sOj/8Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DFGnnsA5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DFGnnsA5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0335DC4CEF7;
	Wed, 26 Nov 2025 17:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764178397;
	bh=bcyzAwmdxnWy+UVULn96QrMVl71ckk1exPOcq3X4mbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DFGnnsA5YUEL3FiD6yoOgaxPOShY5oWXs1z35b1435B5cdiB9cXufhIBG6XvajKDO
	 NyqeJAdT6yOkyjXGhLUHwMbY6adgyoKVhRKz0czDfjkE55NhqsMyjetlwNIWDKXaOL
	 Rw3QoY2cg1mBAxaJJWATL9wGYOFfS27exD+lDUKa88UYMlE0s9xgNIigkLTkIGVgUa
	 Pq154PlYf2GuTxPQSNCM7h/jdbw/CxUkCnvxtWsxYLjiK6mW7MvNuQVuk3fNX3sTeQ
	 2b2Gt+7Jh6MBlnOeYyuKswNVCcXatdgZ7CbsoN3JKDtzoUIQWFUPf+81KpAPD497g/
	 VbXoCvpyGTFRw==
Date: Wed, 26 Nov 2025 17:33:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Samuel Kayode <samkay014@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/8] regulator: Use container_of_const() when all types
 are const
Message-ID: <d01a19d7-598b-492d-83d4-587a36087971@sirena.org.uk>
References: <20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com>
 <20251126-container-of-const-regulator-v1-1-eeec378144d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EUvgKA/KNoLAmFYA"
Content-Disposition: inline
In-Reply-To: <20251126-container-of-const-regulator-v1-1-eeec378144d4@oss.qualcomm.com>
X-Cookie: One FISHWICH coming up!!


--EUvgKA/KNoLAmFYA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 26, 2025 at 05:58:44PM +0100, Krzysztof Kozlowski wrote:
> Use container_of_const(), which is preferred over container_of(), when
> the argument 'ptr' and returned pointer are already const, for better
> code safety and readability.

This doesn't apply against current code, please check and resend.

--EUvgKA/KNoLAmFYA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmknOdcACgkQJNaLcl1U
h9BNrgf9G3fagliSlzTowrVDUqWxcGYU7cQZPP9nGAGfPD/i+R6fl4OquNcow0L9
ysbIm6eDUtqQxdwJExlK2JXNNIN5acDeXyKa2GTrgqNkS/gg0N9jAWQytwpDalyD
FCWYZLLIz2HqdbnBCUQb9c4Mdd3Xq9W7/kdS4JVoqM+xGoH4n+2v+1pUb1LPiM+t
p7zojqHzjB3Gjdg7oFtPDEdsTTjq9ZG3BccgyQZpXOpOYdc1Hvc+SgPb0gb2ySMr
6nHqYeyrOMtxv757PCjoFo7k+0MF0F4darMITcn807Go7yfiuSJP2dar02xTpqup
OTGcqYKBSBovCNqy9xuNiutCu6xU1A==
=+YeG
-----END PGP SIGNATURE-----

--EUvgKA/KNoLAmFYA--
