Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FF9219A63;
	Tue, 29 Apr 2025 15:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745939419; cv=none; b=qyfZQkv6un1Q5knfOmKJlGXCm79EEE0T9Y5d5VJUy9ItakEH68X3PMlANI6G6ngf247Iz6nlNfYvfMF5a36nxmtNPYf472YnNOVlybB9dsBFFm+5wJmCtTSCbx8px7cIIsZ+/3SM/FiW9jqQY3jpWNYvIqweTenOyUfOeKe93a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745939419; c=relaxed/simple;
	bh=tH/b0H08UXNUu6dgbm5YvkwLd90cHvKfu0wgbJrpW2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVJElpEB0kugpayb+q5muJYeH6YrM9qxR1mzTfk6AE+YQ50J6zioLpInxvVOZ0icxLazSRtiOS/IDsTWLk1JesH9sebhdbJoEpxH8jZHoFwqAUvF3NZsAsGKLV4hioMT6i7euqQ5tqJx5qf4wM3MtWtbYQzM6cWis1tlhExSG/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hy6OqaRB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hy6OqaRB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60BA3C4CEE3;
	Tue, 29 Apr 2025 15:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745939418;
	bh=tH/b0H08UXNUu6dgbm5YvkwLd90cHvKfu0wgbJrpW2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hy6OqaRBXW2VArQAk0HkFGDWr69g/SzJsfJZ8IPR1Da5ckDhHLpiiUjgvvbO+3d+z
	 x6OyY3irDdVMdsLz93UdVfUuXLXt9ZAbakYx2C+aZr4c4Ht9M7eKlJE18cZ4+e8PfM
	 GI/Msv6SpjxgBS/1192R8lJEg7LYJPB9EVTCaBdSJsWFgdI+zpB/1LQK/WjxeVTvQz
	 SySUAwMTrdZQPKibhIOSLjq/dlrplor/hJGnfSBtKUcau3TUy64Nah2sllXE3kGObb
	 IWFx+2ZIX4B3VrYYkYCvDyMsMz7FhOd7svLyuOj755afscDhWwYdztPQR0zDf6d9i4
	 uWJG6YYSthiuA==
Date: Tue, 29 Apr 2025 16:10:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	jun.li@nxp.com, alexander.stein@ew.tq-group.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: imx8mq-usb: improve some tuning
 properties
Message-ID: <20250429-charbroil-easing-04f579c68a2d@spud>
References: <20250429033009.2388291-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6fwPel+VdaSrAtp/"
Content-Disposition: inline
In-Reply-To: <20250429033009.2388291-1-xu.yang_2@nxp.com>


--6fwPel+VdaSrAtp/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 11:30:07AM +0800, Xu Yang wrote:
> Commit b2e75563dc39 ("dt-bindings: phy: imx8mq-usb: add phy tuning
> properties") add many tuning properties, but some parameter value doesn't
> match the register description. It made some changes based on the original
> value: add offset to a negative number so turn it to a non-negative numbe=
r.
> However, it's not easy to find an exact tuning value from register field
> with such conversion.
>=20
> Because device-tree supports negative parameter number, this will improve
> some propertie's parameter.
>=20
> Mainly include below properties:
>  - fsl,phy-tx-vref-tune-percent
>  - fsl,phy-tx-rise-tune-percent
>  - fsl,phy-comp-dis-tune-percent
>=20
> The parameter value of above 3 properties are USB PHY specific. i.MX8MP
> and i.MX95 USB PHY has different meanings. So this add restrictions for
> them.

It's hard for me to understand from this if you're actually changing the
meaning of the property. Will the current/old values continue to
function as they have been?

>=20
>  - fsl,phy-tx-vboost-level-microvolt
>=20
> For this property, the parameter value is wrong in register description.
> This will correct it according to true value.
>=20
> For detailed info, please refer to i.MX8MP and i.MX95 latest reference
> manual.
>=20
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>=20
> ---
> Changes in v2:
>  - keep widest constraints
>  - use multipleOf for some properties
> ---
>  .../bindings/phy/fsl,imx8mq-usb-phy.yaml      | 60 +++++++++++++++----
>  1 file changed, 49 insertions(+), 11 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yam=
l b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> index daee0c0fc915..71e5940ef4b8 100644
> --- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
> @@ -42,16 +42,17 @@ properties:
> =20
>    fsl,phy-tx-vref-tune-percent:
>      description:
> -      Tunes the HS DC level relative to the nominal level
> -    minimum: 94
> -    maximum: 124
> +      Tunes the HS DC level relative to the nominal level. It varies
> +      between different PHY versions
> +    minimum: -1000
> +    maximum: 875
> =20
>    fsl,phy-tx-rise-tune-percent:
>      description:
>        Adjusts the rise/fall time duration of the HS waveform relative to
> -      its nominal value
> -    minimum: 97
> -    maximum: 103
> +      its nominal value. It varies between different PHY versions
> +    minimum: -10
> +    maximum: 20
> =20
>    fsl,phy-tx-preemp-amp-tune-microamp:
>      description:
> @@ -63,15 +64,14 @@ properties:
>    fsl,phy-tx-vboost-level-microvolt:
>      description:
>        Adjust the boosted transmit launch pk-pk differential amplitude
> -    minimum: 880
> -    maximum: 1120
> +    enum: [844, 1008, 1156]
> =20
>    fsl,phy-comp-dis-tune-percent:
>      description:
>        Adjust the voltage level used to detect a disconnect event at the =
host
> -      relative to the nominal value
> -    minimum: 91
> -    maximum: 115
> +      relative to the nominal value. It varies between different PHY ver=
sions
> +    minimum: -60
> +    maximum: 45
> =20
>    fsl,phy-pcs-tx-deemph-3p5db-attenuation-db:
>      description:
> @@ -112,6 +112,44 @@ allOf:
>          reg:
>            maxItems: 1
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - fsl,imx8mq-usb-phy
> +            - fsl,imx8mp-usb-phy
> +    then:
> +      properties:
> +        fsl,phy-tx-vref-tune-percent:
> +          minimum: -6
> +          maximum: 24
> +          multipleOf: 2
> +        fsl,phy-tx-rise-tune-percent:
> +          enum: [-3, -1, 0, 3]
> +        fsl,phy-comp-dis-tune-percent:
> +          enum: [-9, -6, -3, 0, 4, 7, 11, 15]
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - fsl,imx95-usb-phy
> +    then:
> +      properties:
> +        fsl,phy-tx-vref-tune-percent:
> +          description: 100x the original
> +          minimum: -1000
> +          maximum: 875
> +          multipleOf: 125
> +        fsl,phy-tx-rise-tune-percent:
> +          enum: [-10, 0, 15, 20]
> +        fsl,phy-comp-dis-tune-percent:
> +          description: 10x the original
> +          minimum: -60
> +          maximum: 45
> +          multipleOf: 15
> +
>    - if:
>        required:
>          - orientation-switch
> --=20
> 2.34.1
>=20

--6fwPel+VdaSrAtp/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBDr1AAKCRB4tDGHoIJi
0ih9AQDT8xFlp6KhPojdSp42RYiUGcj8PdnHv9paubx+sFlINgEAwKSNVrFiQ6Z0
NamP3TPzHWAbYTYUyslHKxgpO109Kg0=
=5BX7
-----END PGP SIGNATURE-----

--6fwPel+VdaSrAtp/--
