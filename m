Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7983C35E959;
	Fri, 13 Mar 2026 17:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773422676; cv=none; b=k8jrQJxZ5H/vXzzpG6bXc94CJQZvuJgfmcRBrffvW/o1YQzb4yeONoKgWyoXnp5y/G4liC8piftgptkaWrOhm4YRIypbBcoNbE/uzIc1KR7YOTxSmP+xcAjSwsHE/3cPM/zrRNZl0kVncraIrYeduMYHtZENyoPO7H8LMJWVapU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773422676; c=relaxed/simple;
	bh=JiDYq8LT3b9KI3ntmOdqFZj+rDIk4U0n94b2PxVwQWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KNXoYLjIDSflLjVH0hkbdQCTEQzxdLXPTK7yDPxuBwTxeeM78g1BYmPv6JBmPv8772D7cpE1L2SVi0vxq/YGXgQLdVqHoJGa848A1ZJkc19iaaadDoX1qIZK7XIZDxmIyiLnZWkGsGfBehmj+XjCjs/TojmQfsr1bbT80mPecNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0uCBySa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0uCBySa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B736C19421;
	Fri, 13 Mar 2026 17:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773422676;
	bh=JiDYq8LT3b9KI3ntmOdqFZj+rDIk4U0n94b2PxVwQWk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z0uCBySaMhZuO2g463MumG9v93IBGoIYhkfsMRkGb4yJ93FHAAx9hJqYpW26Aitt5
	 Bw+Z60s/suqrHkCO+x/1ID/dXUJ13DD+WSHOh12QdHeYSVu2tRBGm6r0C/M9gRkNHw
	 CZqHVi+EmLcQrhkF0GjxGT35jh87zHp1BnWOCp4FszOaxTxDCv9xt94e/zPsRWq6C4
	 O1yvDK2NOpPWSKaei57HYYuR/OEkcDmvkbGiGn0JMYDnnxwZP7AA4iKeIlrtU1Ov/0
	 LmycrN02fCv/0ZHFFOKtmWV85wpzez7sBHxfqqgbVbKpww3XhEoER5G+RVyw4Qtm2k
	 lXZre2GyjEk8Q==
Date: Fri, 13 Mar 2026 17:24:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Robby Cai <robby.cai@nxp.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, andreas@kemnade.info,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v2 2/2] regulator: fp9931: Fix handling of mandatory
 "vin" supply
Message-ID: <20260313-antler-unburned-3af789df6085@spud>
References: <20260313133102.2749890-1-robby.cai@nxp.com>
 <20260313133102.2749890-3-robby.cai@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PkHPPXFUxUCGHfeP"
Content-Disposition: inline
In-Reply-To: <20260313133102.2749890-3-robby.cai@nxp.com>


--PkHPPXFUxUCGHfeP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 09:31:02PM +0800, Robby Cai wrote:
> The FP9931 requires a mandatory "vin" power supply to operate.
> Replace devm_regulator_get_optional() with devm_regulator_get() to
> enforce this mandatory dependency.
>=20
> Fixes: 12d821bd13d42 ("regulator: Add FP9931/JD9930 driver")
> Signed-off-by: Robby Cai <robby.cai@nxp.com>
> ---
>  drivers/regulator/fp9931.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/regulator/fp9931.c b/drivers/regulator/fp9931.c
> index 69b3c712e5d58..d4ba818ec2c15 100644
> --- a/drivers/regulator/fp9931.c
> +++ b/drivers/regulator/fp9931.c
> @@ -444,7 +444,7 @@ static int fp9931_probe(struct i2c_client *client)
>  		return dev_err_probe(&client->dev, PTR_ERR(data->regmap),
>  				     "failed to allocate regmap!\n");
> =20
> -	data->vin_reg =3D devm_regulator_get_optional(&client->dev, "vin");
> +	data->vin_reg =3D devm_regulator_get(&client->dev, "vin");

And this isn't an ABI break because the regulator core will invent a
dummy regulator?

What's the functional difference here?

>  	if (IS_ERR(data->vin_reg))
>  		return dev_err_probe(&client->dev, PTR_ERR(data->vin_reg),
>  				     "failed to get vin regulator\n");
> --=20
> 2.37.1
>=20

--PkHPPXFUxUCGHfeP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabRITwAKCRB4tDGHoIJi
0lPvAP4542JTsXMXATj3zp8RRXsNeI6wT84yahiMnPAL5vbwcQEA6pzT+LuF0npI
3fSMjC7omdzG3gaFiBj5DUOGohLK4Ak=
=lnP3
-----END PGP SIGNATURE-----

--PkHPPXFUxUCGHfeP--
