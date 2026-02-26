Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427173C1960;
	Thu, 26 Feb 2026 18:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772130766; cv=none; b=DI0TRC1Utox7MubYli3hSjoUUMzz9s0ZBSxCdTZNNxKsGhn1kFQ7Nq2DZ+g1JOrCYA8aNwniiAznn5/qzShZ0kkUYHycVUg6klYqhWyAKlX0rfHzBjS6kjD/0d24GPp9bCzwBPOs3+a3uz2ErSIFvcNYE3eVCl3D6g3Sw1fRE94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772130766; c=relaxed/simple;
	bh=N8EvG1YDcXWDl3bwAN61yHEjOaLXvTjQ1QRf4EDRPdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lsTUnC0EYTJXlDIwnfXzemt7/PSjDxToCX978qaNJvMqr14C6Y3yxNun4WH9udmC6g+jS4CzhMDVWgbfstvDP0aYMTMLG24zCTHT7yrDDCqeltQrmsHlEEk33URzN1HFYWLWFNGoB91OEdFVZq1mxBDoD6OfqI3siLfiGguyzJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WiUe93PJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WiUe93PJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FEC9C19423;
	Thu, 26 Feb 2026 18:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772130765;
	bh=N8EvG1YDcXWDl3bwAN61yHEjOaLXvTjQ1QRf4EDRPdM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WiUe93PJUkT0DcKQB17DGQ+wENTIV524bzjtNztCz7F9LFfOTmHLCInzTCeA+KniW
	 +4srugdN39n9q4ldGRqGyxQqklT3ZwfP/yDnADnUbJmEsW0DPZwka3TZVYi9W8ofGw
	 jn0Inp3kCWk1wNWmGgUbXEMaxajYdsvW7S/OrAMUPtijXfnCfTvbL5UZKtsZxBI5FL
	 LHjPIlE8f3AnhtxQXGZLRXS2MUQVm9/SDCBR3l6XZPA3A+8/owFR4ztZVEqwBSQkYP
	 nhF8WjUJ4Hty8sRlW4qv89cwBMMcgaVDIAEnobM2zJpyfScepD5NhztYf6KVG9dc3U
	 VlWyOF6F/9lew==
Date: Thu, 26 Feb 2026 18:32:41 +0000
From: Conor Dooley <conor@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"A.s. Dong" <aisheng.dong@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/2] dt-bindings: fsl: fsl,imx7ulp-smc1: Add #clock-cells
Message-ID: <20260226-writing-deviation-183872d04d50@spud>
References: <20260226-imx7ulp-v1-0-3fd611ceb346@nxp.com>
 <20260226-imx7ulp-v1-1-3fd611ceb346@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OajtArW2knqHAoo7"
Content-Disposition: inline
In-Reply-To: <20260226-imx7ulp-v1-1-3fd611ceb346@nxp.com>


--OajtArW2knqHAoo7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 07:04:15PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> Add missing #clock-cells to make it work as a clock controller.

Yes, that is what adding #clock-cells would do, but why is it correct to
do? That's what your commit message needs to explain.

>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-pm.yaml | 5 =
+++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-=
pm.yaml b/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-pm.ya=
ml
> index 9d377e193c123c7de0ec4db4d4a649ed966b2d9a..7ad470260c0d08bd1e7146ef4=
9e5f60dd6c6d4d7 100644
> --- a/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-pm.yaml
> +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-pm.yaml
> @@ -28,6 +28,9 @@ properties:
>    reg:
>      maxItems: 1
> =20
> +  '#clock-cells':
> +    const: 1
> +
>    clocks:
>      maxItems: 2
> =20
> @@ -39,6 +42,7 @@ properties:
>  required:
>    - compatible
>    - reg
> +  - '#clock-cells'
> =20
>  additionalProperties: false
> =20
> @@ -47,4 +51,5 @@ examples:
>      smc1@40410000 {
>          compatible =3D "fsl,imx7ulp-smc1";
>          reg =3D <0x40410000 0x1000>;
> +        #clock-cells =3D <1>;
>      };
>=20
> --=20
> 2.37.1
>=20

--OajtArW2knqHAoo7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaCRyAAKCRB4tDGHoIJi
0v20AQC4sUG4JoVI3CpaoBHkbkr2YwTf5dR1LiB9S3tyVqo0nAEAh1D/G084CmKO
oddyy3pQD21ZktgbFlmi4PAuDbmBGw0=
=jjBH
-----END PGP SIGNATURE-----

--OajtArW2knqHAoo7--
