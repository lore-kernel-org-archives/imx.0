Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A349039769E;
	Thu, 14 May 2026 18:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778782473; cv=none; b=ZnZ9pEDqS5vSHJ285eXl9s64gCpR7uxw4oB+y52/F3X0jZCOxfc/RzA80Rg8Yd6Nn4wMYGVv7cMHyA63tKwqOWZB5cmmK66RyqSuOS5slo22TE4Ax4/iQS87do2M9OHdwuVxe0MQe6jOu/7owUwD9AZDVSRa5CySqLKKPqHD5sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778782473; c=relaxed/simple;
	bh=uJ+OslMzGkZCCzZkBjIfav+BmWpyOjO8077z/eM7t/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I2CmxrcABecyWfkutFROGFo39HMZ3GZnE1fGANTQads41nGMU94xrnq/ewqU/O7nG7OsESHFnRtEbtTwXUYZu2PU508sHrVr45YUSW5R8a3ZTrxvtMjtyX+XzoplQV2hDx1K2Kfs4vYUyPwSm0ZW3cpPA2panG8wo2gCK7mexhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K1iZhv8n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K1iZhv8n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9E0C2BCFD;
	Thu, 14 May 2026 18:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778782473;
	bh=uJ+OslMzGkZCCzZkBjIfav+BmWpyOjO8077z/eM7t/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K1iZhv8n2vhLCyYDrIOoFYRJVaLKVZyJ07rcZ9+//ZJ+5w2J1zfWRqu0K8tv8Ys9T
	 RDcLHohpSIXSFOuCbFtYeXF2drvVfbOlukDdUnSPP/3yVKbzdvXW1ukjOq9KpM/yu5
	 bpNmY2IUNlaED4aeiOvdS8hJ0v0Dkfhd6JSFhTUf5dZA9Z/IXxAmrHbLpfeMpX46vN
	 Y5kPycRP6i7EUEUnku5piuOYJnJQXgSv+6eSjwOR0LJp+86Fm+zfAQHNVSnEMpeI5v
	 OENhrtenTVgWHflYw1lSQ68sDq8cYvxHHI50ue0iFC64ZYuuX3f3qpmcBpY3b5AnXH
	 CXzjL4BVOTs3A==
Date: Thu, 14 May 2026 19:14:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: Re: [PATCH 2/2] dt-bindings: timer: pit: add PIT node example for
 s32g2/3 platforms
Message-ID: <20260514-ovary-upload-469fb61d1c0b@spud>
References: <20260514070605.996462-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260514070605.996462-3-khristineandreea.barbulescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LPyhFypBzE8ZWWrK"
Content-Disposition: inline
In-Reply-To: <20260514070605.996462-3-khristineandreea.barbulescu@oss.nxp.com>


--LPyhFypBzE8ZWWrK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 09:06:05AM +0200, Khristine Andreea Barbulescu wrot=
e:
> Add devicetree binding example for the PIT timer as used on
> NXP S32G2 and S32G3 platforms.
>=20
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>

This doesn't add anything to the binding of value, all properties appear
the same as the existing example?
pw-bot: rejected

Cheers,
Conor.

> ---
>  .../devicetree/bindings/timer/fsl,vf610-pit.yaml          | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/timer/fsl,vf610-pit.yaml b=
/Documentation/devicetree/bindings/timer/fsl,vf610-pit.yaml
> index 42e130654d58..8696696776b3 100644
> --- a/Documentation/devicetree/bindings/timer/fsl,vf610-pit.yaml
> +++ b/Documentation/devicetree/bindings/timer/fsl,vf610-pit.yaml
> @@ -57,3 +57,11 @@ examples:
>          clocks =3D <&clks VF610_CLK_PIT>;
>          clock-names =3D "pit";
>      };
> +
> +    pit@40188000 {
> +        compatible =3D "nxp,s32g2-pit";
> +        reg =3D <0x40188000 0x3000>;
> +        interrupts =3D <53 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks =3D <&clks 61>;
> +        clock-names =3D "pit";
> +    };
> --=20
> 2.34.1
>=20

--LPyhFypBzE8ZWWrK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagYRAwAKCRB4tDGHoIJi
0qe2AP43Jcddsk1vQtUeGmyvuM1PQfpHSFt1zeVsEASRUQa5kAD/Xgyk9cfO4R8Z
nUQtK+g102NNkzpri5rVTmvq/L6CvA8=
=SD0V
-----END PGP SIGNATURE-----

--LPyhFypBzE8ZWWrK--
