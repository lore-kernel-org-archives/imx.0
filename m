Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757A71D5170;
	Wed, 26 Nov 2025 18:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764182709; cv=none; b=WFxnCQvmk4c8XnV4Byq1yPWfQKbLvOxdXtzH2pOLQtIRttt4oO2G5Y6rJabsg3r41NFlEIF8+jnYKYZItysZYCNK6taBdEHm0PRH1z5Wnj43uPKvRhnIxpB1krpPHtm3gnjFiH1d3DX0hwCb/I7g0pbfEjTbXKKGpM3Binxdmcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764182709; c=relaxed/simple;
	bh=7WEZWZo65qTMkzmbLTM8AGcXWJudyd2lttyy7OqktQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I0+Dd2GyPBiUjyKW+nvxYGdEkuCRN/iUslPuZJU5LAZTT1pAwOiciGsFgX3+LsEJsVmaOuGSAEMgA2ypfEy8k0O+LarHsDNXC4XJT2lg4Bk1o5xjDIsdBltS2wZ8V5GeFGqDO8ngDoyWjV1CKgkJxIS0GeETyNM2jTK+jOhZ2Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTsx/adO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTsx/adO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6013C4CEF7;
	Wed, 26 Nov 2025 18:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764182709;
	bh=7WEZWZo65qTMkzmbLTM8AGcXWJudyd2lttyy7OqktQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bTsx/adOwxo7RJaLk5rIJr1AMuA9Sf8IchqWZCqoUNDgaulraw1YiVO5rax9tlCEK
	 HuW1T8Iv6jkyteWNx4xm8NxHv2bhy3IAANhfeqURoCtyyLAjDLM0Y3KM3oJLKGHSmQ
	 f0ey1Vlu3RkkCpzgj8GPb/73Ss2QOcYICgi+dQMxnC4UvVOeIVoKXFYaWmNw7c5tt0
	 lQsw9IrJw4iNLJA+oIj9KpCzMaDU6qtI02s8uNaFvWK9proRhqRZEX368wfhCNM1Rx
	 UDDsyXlqHZzCKarIUssbYP6WNYaE0Q9Lfla05jJ2JYaVv/eGMsEO4F/XGp/ps5SR56
	 XAOlhREOaWNFg==
Date: Wed, 26 Nov 2025 18:45:03 +0000
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
Message-ID: <ba86ea0e-7c39-42a7-a203-89eeabd2c911@sirena.org.uk>
References: <20251126-container-of-const-regulator-v1-0-eeec378144d4@oss.qualcomm.com>
 <20251126-container-of-const-regulator-v1-1-eeec378144d4@oss.qualcomm.com>
 <d01a19d7-598b-492d-83d4-587a36087971@sirena.org.uk>
 <29ca0d4d-69b2-4b61-bf81-40ce87789428@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4YwFcyBe8r3semI5"
Content-Disposition: inline
In-Reply-To: <29ca0d4d-69b2-4b61-bf81-40ce87789428@oss.qualcomm.com>
X-Cookie: Murphy was an optimist.


--4YwFcyBe8r3semI5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 26, 2025 at 06:37:49PM +0100, Krzysztof Kozlowski wrote:
> On 26/11/2025 18:33, Mark Brown wrote:

> > This doesn't apply against current code, please check and resend.

> Apologies, I will rebase and send v2 today.

> The files having trouble are I think in this pull:
> https://lore.kernel.org/all/20251021172543.GL475031@google.com/

Ah, no - that's it exactly.  I've grabbed that PR and thrown your v1
into CI, I usually hold off on PRs until they're needed but there's no
problem with using them.

--4YwFcyBe8r3semI5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmknSq8ACgkQJNaLcl1U
h9Chqgf/bo2C94GSgD5UWDq0zbNlouJSdCurjNKDobyJkGFwv0xgJgJ43szCp9fZ
YE2mVNZk62XZcr67x8VoB4khFBvz/TLMgQtThQ2L3fW878l0ivT/kFTMe0jketjz
bCtxUSTicnP+r7/EyLB0mlnj6t2MD1TCDtxXsUYtR1LN8ml7tHBq8Nqn2JcvVZvo
4zKNe2feP9bT/Suox/f07OSSWuQPhRFs5T9msFBMPxhIzyfM2wcjKPcwbemeo7yp
x/rOZ6G+61ecHHyebeTyw1P6ndOZDMYutTarWwWHs9/ss2fE2DdPssTDB8ISFE/L
CLsKbASuh/n4JMo96N1xlfe+Nmckzw==
=cjBv
-----END PGP SIGNATURE-----

--4YwFcyBe8r3semI5--
