Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D14C3FCB10;
	Wed,  1 Apr 2026 12:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775047998; cv=none; b=VA5Vjk/OGIA1m+IQZwJhnbZvlsKnNI5pxmjJIsm1LiXk3f0GUuBDBPXkGtkp+LjCHUrGJ7aZUqbTVlq/E78o2ETMjs91OH0A/AIGtjExDCRliuXF+nK92A3y1EKRqtx8dNk/lcJUiFcamUgcA15DyQ2BI+4MMoEEELJniODuElI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775047998; c=relaxed/simple;
	bh=NhZ9Dfz82FMBwxsljQsgPH0vFz3iOT6rifZERR7g1HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lB3fxiJEpmOVVLdIVBVPRtIn34VXnuMcfBt5m3BVvarylK0Wt91v2GZQA6QKWsONRq7gfxca0+wbxUJAxe/myRItzxFwbj6+ECBYX7Y1gYZTq442rIZ+VqVe1D88ykD0YeN3MmA2Pdeum9bqyE1Lu1xZ9+qVn2e6oOatauN2xAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWXorNXu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWXorNXu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD7EFC4CEF7;
	Wed,  1 Apr 2026 12:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775047998;
	bh=NhZ9Dfz82FMBwxsljQsgPH0vFz3iOT6rifZERR7g1HQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MWXorNXuAglfn3NULlXkjKj7vf/JQXMQ3KCl6hSs7EAJwYJuuF7sqmVhM5z5mDytd
	 2rm+pbQeFimjMrsRfqUkGXkYxrzWzj6fbpnNU8ogvE0NFnLzJjPUsVZXSZsOGWUEfX
	 spOUEuRumLiBdVX5Bp8J8FUxyDtTHgFcUUKje3xn6OCfNpLHi69uPkpfatrbR+zVVy
	 522l4KSvQ7RuCvwtNo0Xc4dqYnYuER6sm2BsiTOtA8VH/tbBNKebOjg3QM0D9RlUWo
	 V52nT5X1Qva9139XnYn5rjmKSLoDiuKkqHUX9t53zi7zvzXc9RSW+5hQlCQUcXTGMt
	 8Fzc7tWP9kXiQ==
Date: Wed, 1 Apr 2026 13:53:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-sound@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: mxs-sgtl5000: disable MCLK on error paths of
 mxs_sgtl5000_probe()
Message-ID: <b2ed3765-e19e-4774-8563-120ffb65cddd@sirena.org.uk>
References: <20260401053051.586290-1-lihaoxiang@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BDU/dGlo8E/LbM+4"
Content-Disposition: inline
In-Reply-To: <20260401053051.586290-1-lihaoxiang@isrc.iscas.ac.cn>
X-Cookie: "Yo baby yo baby yo."


--BDU/dGlo8E/LbM+4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 01, 2026 at 01:30:51PM +0800, Haoxiang Li wrote:
> Call mxs_saif_put_mclk() to disable MCLK on error
> paths of mxs_sgtl5000_probe().

>  	ret = devm_snd_soc_register_card(&pdev->dev, card);
> -	if (ret)
> +	if (ret) {
> +		mxs_saif_put_mclk(0);
>  		return dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed\n");
> +	}

This fixes the leak here, however it does highlight that there's a
preexisting issue on remove where we disable the MCLK in remove() but
due to the use of devm_ above we're only unregistering the card after
that has returned.

--BDU/dGlo8E/LbM+4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnNFTgACgkQJNaLcl1U
h9DOXQf5AcbwFdz9apvNWirnYcrrWbyKumZoekQOCejHpmc7lXLVRNSu5jhIsr1I
5CGsvQg3lFDMM0hPcFhBQgJ50ifogQKw815Zof+igMFJQhfrEWsb0+H514cnZ2pR
tmZlYoy0cJfJqqhUSLo5Ue263Ba++w9P6f/ekBluPkLKp05dpF1kpJgCsjBPMpv3
lMS7ESfW6rVxCUtEYUkAoj8JT5tMCNPZ3h5/IxVT//mBe8AA3zn8UCxS7LjSgZRq
heEmkFq4jswsf04zdQ0VEqovHpWNUodaMJArBXVdzxnTkNTKurups4WSZxiJwSeY
YRO0sOdFBU9VFjsE2PEgKGJPpEIJkA==
=56IW
-----END PGP SIGNATURE-----

--BDU/dGlo8E/LbM+4--
