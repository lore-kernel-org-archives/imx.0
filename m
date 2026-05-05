Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCCF3921EC;
	Tue,  5 May 2026 02:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777947682; cv=none; b=Kz5XbkDkZintn4CIwFQeWqm1YOvyNs6kednrRRJ8EFg1uasqqRZsslF98NFjfrvgbY+Mu75GFVGqbQ3ClGwXFL6ELU/+6t1rL8NwpiEUFlbFu0tsVOXL+d5+Rept0gHnBmZNGmG7ddGafYXLplDio6u+JG85FT2nC4giBInvFMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777947682; c=relaxed/simple;
	bh=JO2IMv4fsRX0ZcyGTHisLvXxtyNEwmC3NfmP+6npWNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HIqVi/iLRhjRkfOF3fxuDAMrgaLalKqhZcHhk7gb/g2Q3p8rYOR4oWXCR2g1nZKVWNBOwKH1BRFZO5QxEhhkEIhRXu0Y9uTtlsHyrEniMmAW+I47nOEiODGXjisH9IGhNQsF7c79MGN7po5hyUZitvpn+F5hWDtCma5FX9nWtIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YhViaJCn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YhViaJCn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86AE0C2BCB8;
	Tue,  5 May 2026 02:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777947681;
	bh=JO2IMv4fsRX0ZcyGTHisLvXxtyNEwmC3NfmP+6npWNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YhViaJCnZ9Iqwy4eVh+l7NLp5EUAgIDkA7qwztzRtOqY3Ju4IaOnqMoidw5NLSn8q
	 6m6WfGoxc/ZpKHOWKBmFoSq9bV3nbO3t7ikomujp8b+jM8QkXUH9Db16fgn3PTpJ8P
	 7g4k1zRU0ITLxxrrM1x5rUpU1p6uI68qWt4lZtASPF7ruQUc8Xu7buLCt7kXCXGNQy
	 tbbHU3DWLoalLFOKt+jB4jn3Tt9L6g/fq+bERDHLb+1IeeFHXDk4r+M2B1jQwCpdmV
	 ke79exptDwH95rFi/UDlLZS+/+7unvKCTRc8+XmouyppdN0nPVHg+Lum2/drHPxY+N
	 LYw3CMXgAjU3g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 6D4FE1AC5871; Tue, 05 May 2026 03:21:19 +0100 (BST)
Date: Tue, 5 May 2026 11:21:19 +0900
From: Mark Brown <broonie@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, Frank.Li@nxp.com, s.hauer@pengutronix.de,
	kernel@pengutronix.de, shumingf@realtek.com,
	rander.wang@linux.intel.com, pierre-louis.bossart@linux.dev,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] ASoC: dapm: Fix widget lookup with
 snd_soc_dapm_widget_name_cmp()
Message-ID: <aflUH_mk3i_IDkac@sirena.co.uk>
References: <20260429021252.691263-1-chancel.liu@nxp.com>
 <20260429021252.691263-2-chancel.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H51FCLIJf4TpdLl7"
Content-Disposition: inline
In-Reply-To: <20260429021252.691263-2-chancel.liu@nxp.com>
X-Cookie: Alex Haley was adopted!


--H51FCLIJf4TpdLl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 29, 2026 at 11:12:50AM +0900, Chancel Liu wrote:
> Currently dapm_find_widget() manually constructs a prefixed widget name
> based on the provided DAPM context and compares it using strcmp(). This
> happens to work in most cases because callers usually know which DAPM
> context the target widget belongs to and pass in the matching DAPM
> context.

> -	if (prefix) {
> -		snprintf(prefixed_pin, sizeof(prefixed_pin), "%s %s",
> -			 prefix, pin);
> -		pin_name =3D prefixed_pin;
> -	} else {
> -		pin_name =3D pin;
> -	}
> =20
>  	for_each_card_widgets(dapm->card, w) {
> -		if (!strcmp(w->name, pin_name)) {
> +		if (!snd_soc_dapm_widget_name_cmp(w, pin)) {
>  			if (w->dapm =3D=3D dapm)
>  				return w;
>  			else

This means we can't use the prefix to disambiguate any more -
snd_soc_dapm_widget_name_cmp() will strip the prefix off.  We want the
prefix in contexts where the name is specified by the user since the
prefix is there to provide for disambiguation.  The prefix addition
logic is a bit weird and I'm not sure it makes sense, but the search
based on the fully specified name we got is something we want.

--H51FCLIJf4TpdLl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmn5VB4ACgkQJNaLcl1U
h9CupAf+MGqhy9yn/GtWv68HU9M+CSI26hbO/33u6YCfbI8rVD5r3sVvsPny+nIS
Hjcpp4SW27502ByKDEE/6t2CNSBpJS0Z3YbgVr/nlsyhs9zVFbvBb3W0BTO10USD
1cZyS1qeifNAglMYVM8zaR0YIHll+5NWVR4kQr2mVyOt6rOlfa6gVQWBpl5QlJbY
327ly0J96cBfeR/Irzq0/ya89I4HPIJuCRuIpn8MJBWY/cvQl6l87qWAVoDpk0wX
RTTkhF/PhREqDYMSDame5+VnaEqr2PJXZgu/MJlpOOgAHWaApnmfnVM62sUZXfkg
POV16q9CbmYfk2lJbW1huCz+h5xygg==
=YkxC
-----END PGP SIGNATURE-----

--H51FCLIJf4TpdLl7--
