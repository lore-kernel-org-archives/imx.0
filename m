Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F7230CED;
	Mon, 16 Oct 2023 17:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uWi5UtGL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9F00C433C7;
	Mon, 16 Oct 2023 17:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697477418;
	bh=GpeYS7W+QOHnKL9KvaNin7WOIs87VzXBHY68R4EuxOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uWi5UtGLX5OiupKPagSbadl9W/hpoMnJjLJpT39aTyFP1o6H3ZWHGfEx4sCsPYKg6
	 lff/tE1oun/D/dp8UONbZWMGioqvZMxPHa6PUGvd4kp2orzQ7qPb8fdBvQp/urPnwi
	 6ZrPMHAQWk4RdC2a/Nlh3y66MEgfdbXbMQr7F9Y8ep65UHJw0ff7Nv83jbqqK8XPVE
	 YvPUUtIHtsrzP3zbggjAPNLQW5DE+nE7tx/ydOVsYYDZi6TW1XDcM5tCatq/YpFNfG
	 +BO4kQ5ka5FCPGBWjWQ0XVU5hklssx5MfX1Qjcm90cCu+beoR+m2iFKx3lVpeHZP/9
	 hSdqs3y3MIIAA==
Date: Mon, 16 Oct 2023 18:30:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
	alexandre.belloni@bootlin.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, joe@perches.com,
	peng.fan@nxp.com, alexander.stein@ew.tq-group.com,
	haibo.chen@nxp.com, ping.bai@nxp.com, xiaoning.wang@nxp.com,
	sherry.sun@nxp.com, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: i3c: Fix silvaco,i3c-master compatible
 string
Message-ID: <20231016-chatroom-regulator-a75f1d8be809@spud>
References: <20231016152450.2850498-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8ov1p1bhS36bcpal"
Content-Disposition: inline
In-Reply-To: <20231016152450.2850498-1-Frank.Li@nxp.com>


--8ov1p1bhS36bcpal
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2023 at 11:24:49AM -0400, Frank Li wrote:
> In driver, compatible string is silvaco,i3c-master instead of
> silvaco,i3c-master-v1.

And what makes the driver right & the binding wrong? AFAICT, this is an
IP sold by silvaco & the -v1 suffix was explicitly requested during
review of the binding.

Thanks,
Conor.

>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yam=
l b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> index 133855f11b4f..19e3f75eb45c 100644
> --- a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> @@ -14,7 +14,7 @@ allOf:
> =20
>  properties:
>    compatible:
> -    const: silvaco,i3c-master-v1
> +    const: silvaco,i3c-master
> =20
>    reg:
>      maxItems: 1
> @@ -49,7 +49,7 @@ unevaluatedProperties: false
>  examples:
>    - |
>      i3c-master@a0000000 {
> -        compatible =3D "silvaco,i3c-master-v1";
> +        compatible =3D "silvaco,i3c-master";
>          clocks =3D <&zynqmp_clk 71>, <&fclk>, <&sclk>;
>          clock-names =3D "pclk", "fast_clk", "slow_clk";
>          interrupt-parent =3D <&gic>;
> --=20
> 2.34.1
>=20

--8ov1p1bhS36bcpal
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZS1zIwAKCRB4tDGHoIJi
0n52AP40LdahncQIBrlmquA9d27bYIZbq2UevD1+ijXUlaBdaAEAhYr4fgRjvJxx
Lr+TH3PlrbTOEzDsaF/mY4qqOSnkjgU=
=Nlun
-----END PGP SIGNATURE-----

--8ov1p1bhS36bcpal--
