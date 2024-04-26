Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42AF208D6
	for <imx@lists.linux.dev>; Fri, 26 Apr 2024 19:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714160445; cv=none; b=DFZS7/kP+gjXUE9bmi5AiesDVRSu6nNFUvoXRokXhxjBR7nm8XKXD3Bn9zyDolu7q6mPMz5ISYbq+gA72xgyZtfU/KphhoaZBvizot2ku+BvAak3tV3NtSn4ikcpzzrviJUPBfdjPHSyGdas0f6949oYrWmkYufJmycWGfJiuxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714160445; c=relaxed/simple;
	bh=MJhoBOcKvcAfCqXZ27Dow0kPxI2bLjrCHZ1BhmTfiUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qk8LNZ3DXEx65CO7HYF3iOpZKFuoj3+dfx5QZ9sIHUSx7Wl2VOVYo7PYILjHV3F3mNvh+lGvCBGpjRJBwYT5+iO7V2GEe9G7K8pp6JNQvrYQkuEKZgw2Xo8TL3dhImXGC0Gl8irxvm/OazNIcqt0gPyDQYQQoq0QW9oAGiC4uxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1s0RQo-0006P0-27; Fri, 26 Apr 2024 21:40:26 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1s0RQn-00EV0n-4J; Fri, 26 Apr 2024 21:40:25 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1s0RQn-009ZX2-08;
	Fri, 26 Apr 2024 21:40:25 +0200
Date: Fri, 26 Apr 2024 21:40:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-kernel@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 00/49] ARM: dts: imx: Use #pwm-cells = <3> for
 imx27-pwm device
Message-ID: <oy4mnbkskyrw5dwkq3rebe2yh4i3fy44rubhvesug7pedzws46@472pzktn5t22>
References: <cover.1712352665.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6qlyaxmagn4lyfzd"
Content-Disposition: inline
In-Reply-To: <cover.1712352665.git.u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev


--6qlyaxmagn4lyfzd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Apr 05, 2024 at 11:41:47PM +0200, Uwe Kleine-K=F6nig wrote:
> this series addresses many warnings of the type:
>=20
> 	arch/arm/boot/dts/nxp/imx/imx6ul-pico-dwarf.dtb: pwm@2088000: #pwm-cells=
:0:0: 3 was expected
> 	        from schema : http://devicetree.org/schemas/pwm/imx-pwm.yaml#
>=20
> that is emitted when building with CHECK_DTBS=3D1.
>=20
> This completes the conversion started with
>=20
> 	fa28d8212ede ("ARM: dts: imx: default to #pwm-cells =3D <3> in the SoC d=
tsi files")
> 	4c6f19ab2aed ("dt-bindings: pwm: imx-pwm: Unify #pwm-cells for all compa=
tibles")

Gentle ping! I would expect that Shawn picks up this series.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--6qlyaxmagn4lyfzd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYsAycACgkQj4D7WH0S
/k76+gf/RTd50w5R0hfdfG8xkZOBeH3rPK6SXQs8zpgJ+/lgFxqquJi95MpCrQiG
3JRo4kCmPkPbUNjhTGORzRBeh9Gi8uI7FZ1TFEMgiytsVDuJV/lC/CbWAhI/BebL
N+vBHG3188lpfsfzgbuUnCQk1TxLEeyWrdV/sG5pGR1JaalCudQxwTVODqvRX8T3
qiuNqZmHG3HWkGVZ21ibdkdfVcArWphKeB2GUpss3MQJDNR8zYPkMgFYWYy3TYie
ic2z6+LEP/9IA2E5eKz6prVC/zgOjsUMktzs5aNy01uRxiUe1iQ3IPhPuBu/qner
qlkpR97+TFM8ZGuypO4fRp0bVIG3Aw==
=sPqb
-----END PGP SIGNATURE-----

--6qlyaxmagn4lyfzd--
