Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262C41B2520
	for <imx@lists.linux.dev>; Wed, 21 Aug 2024 14:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724250478; cv=none; b=MQRtJ0ktmmnMy9xSh08ARk/NZyT54HBbZYyPTOpoypWtC9BlF7pcADoYGjUNVcbPstBQrDefXgj2XxxHsWJz3QCfsvirzB2BZ3lo4RxEgvM9el45H54f0iX98Ne1TVOSAJj1fhBAMAHeXT/Z/NS4s18tJZH2FeXkh2xarJvqoKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724250478; c=relaxed/simple;
	bh=+3V3liN9o5xUSGvb4I3hdd3xhlvmE8GVnevNEzazxiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+vKkx3ILdCJJP8wq+/GPkHvjOsVlJwTVzX850raB5sdoIiNiiYVCDNbsleVYryOUCSklO4E1Lth7PKfuMOBVdEnfACTrD78SEpLiLUdtUvFwWOLesPvlQQJ/tcLkVbuXczD8XC5C/ibfPYMe5YAmQBjRUtKybPchkc9eBANA0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1sgmJP-0000Rx-VA; Wed, 21 Aug 2024 16:27:47 +0200
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mkl@pengutronix.de>)
	id 1sgmJP-0021zk-6L; Wed, 21 Aug 2024 16:27:47 +0200
Received: from pengutronix.de (pd9e5994e.dip0.t-ipconnect.de [217.229.153.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id AED4D322E38;
	Wed, 21 Aug 2024 14:27:46 +0000 (UTC)
Date: Wed, 21 Aug 2024 16:27:46 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: krzk+dt@kernel.org, festevam@gmail.com, shawnguo@kernel.org, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: imx8mm-emtop-baseboard: Add Peripherals
 Support
Message-ID: <20240821-cute-cougar-of-atheism-3a9121-mkl@pengutronix.de>
References: <20240821135817.56393-1-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s4574m763spmal7o"
Content-Disposition: inline
In-Reply-To: <20240821135817.56393-1-tarang.raval@siliconsignals.io>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev


--s4574m763spmal7o
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 21.08.2024 19:28:17, Tarang Raval wrote:
> Add following peripherals support for the Emtop i.MX8M Mini Baseboard
>=20
>     * Wi-Fi
>     * Audio
>     * SD card
>     * RTC
>     * CAN bus
>     * USB OTG
>=20
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>=20
> Changes in v2:
>=20
> 1. Updated the node name and pinctrl name
> 2. Removed the 'regulators' container
> 3. Removed a stray blank line
> 4. Removed non-existent properties
> 5. Removed unused node and pinctrl
>    - modem-reset
>    - pinctrl_uart1
> 6. Defined the CAN transceiver reset GPIO separately
> ---
>  .../dts/freescale/imx8mm-emtop-baseboard.dts  | 323 ++++++++++++++++++
>  1 file changed, 323 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts b/a=
rch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts
> index 7d2cb74c64ee..322338e626ce 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-emtop-baseboard.dts
> @@ -11,6 +11,113 @@ / {

[...]

> +	can-control {
> +	        pinctrl-names =3D "default";
> +	        pinctrl-0 =3D <&pinctrl_cancontrol>;
> +	        reset-gpios =3D <&gpio1 15 GPIO_ACTIVE_HIGH>;

I don't see a compatible here.

[...]

> +/* CAN BUS */
> +&ecspi2 {
> +        pinctrl-names =3D "default";
> +        pinctrl-0 =3D <&pinctrl_ecspi2>;
> +        status =3D "okay";
> +
> +        can: can@0 {
> +                compatible =3D "microchip,mcp2515";
> +                pinctrl-names =3D "default";
> +                pinctrl-0 =3D <&pinctrl_canbus>;
> +                reg =3D <0>;
> +                clocks =3D <&osc_can>;
> +                interrupt-parent =3D <&gpio1>;
> +                interrupts =3D <14 IRQ_TYPE_EDGE_FALLING>;

Don't use edge triggered interrupts, use level triggered ones.

> +                spi-max-frequency =3D <10000000>;
> +        };
>  };

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--s4574m763spmal7o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmbF+V8ACgkQKDiiPnot
vG84dQf+NtKb5I7wO4FQLgmJn0O4ZzCjW1wMRLwLjXI61NhTFnmVfovpUvSS3Qgi
HdRM+0sXZjI+jAHAt6QaklRaPydz+jEZA15VOp3q1mEb6W39BWWT86fKC7X935jn
uXcDYFqPPSOUy/0oP19hm1tiopSItsDFqpqrYHiF20mfw5Zb8wUJWFLsh91FjQCU
MxN1xFeI5+yOTCUtpA3cUH9qGKucHlvCtxenlzUWjzP2731IXZCh+VLYftPASC5W
eiSHyjAGsWN4ELWPjS2ezfmDIPSz2MbBeNzh+0gKRM6H/j/Z96QqivJCmmymrOvA
dWtK4N3yrCLC4OmXBr7+pcgO4HEgIQ==
=JMKz
-----END PGP SIGNATURE-----

--s4574m763spmal7o--
