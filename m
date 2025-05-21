Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A544238173
	for <imx@lists.linux.dev>; Wed, 21 May 2025 09:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747820129; cv=none; b=PmoZuwvBK7ux7CHtkGQ83kK0gHOzIH81iqgspWA6XpPPg0zytatA1h7OT9lIyBCOs/AlMJaKuUD77J9hZwArHVlskjJ4MGB9K3B5Hyp35/frkm98LVsjFATK/XrMhYedpHdhe/+ZG/LXGpXVTv/N1ZvGLmjsK2nQRyFTdVuqNhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747820129; c=relaxed/simple;
	bh=ldy3lqqkdQ8O42SSNi98DGRMwNCFB9KvnWLzokONCAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dhdjZ9r33i8NiFjwsxf9T717uzDS3m2qrkJxhFQAgTM58OpvfBHTC6XzGsuZK9DHA48hpwZvJGYqBtPSoMkkSnx7f4VljherV4Met+JP3+W0F/UQAVENPPaxD6uANRWp5AZzTfbr8e2k2VwKE1KUzXM1rd8Z3RFTZDdzfPBmwlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uHfr3-0001Lu-7G; Wed, 21 May 2025 11:35:17 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uHfr2-000YAT-34;
	Wed, 21 May 2025 11:35:16 +0200
Received: from pengutronix.de (unknown [IPv6:2a03:2260:2009:2000::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id F299741679B;
	Wed, 21 May 2025 09:35:15 +0000 (UTC)
Date: Wed, 21 May 2025 11:35:15 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, michael@amarulasolutions.com, Fabio Estevam <festevam@gmail.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] ARM: dts: mxs: support i.MX28 Amarula rmm board
Message-ID: <20250521-quizzical-tidy-worm-1fe67d-mkl@pengutronix.de>
References: <20250521092826.1035448-1-dario.binacchi@amarulasolutions.com>
 <20250521092826.1035448-4-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iltdsbk26xo7g47t"
Content-Disposition: inline
In-Reply-To: <20250521092826.1035448-4-dario.binacchi@amarulasolutions.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev


--iltdsbk26xo7g47t
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/3] ARM: dts: mxs: support i.MX28 Amarula rmm board
MIME-Version: 1.0

On 21.05.2025 11:28:22, Dario Binacchi wrote:
> The board includes the following resources:
>  - 256 Mbytes NAND Flash
>  - 256 Mbytes SRAM
>  - LCD-TFT controller
>  - CAN

[...]

> +&can0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&can0_pins_a>;
> +	xceiver-supply =3D <&reg_3v3>;

Since v6.15-rc1 (d80bfde3c57a ("can: flexcan: add transceiver
capabilities")), the flexcan driver supports CAN transceivers via the
phy framework, see drivers/phy/phy-can-transceiver.c. Can you make use
of it?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--iltdsbk26xo7g47t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmgtnlAACgkQDHRl3/mQ
kZxqfwgArcPARaZe5fCyem7ScC0CD03Xge91Id9cL6A9oCHQPIUaTJXStmGpgEPZ
p13vybE5uN1qhF25l4ALMsw76XVtydokAWgZ0/G2+tDVaP2BSfxJ+hwcfRmT4Mcc
n39D3dO/DWz1mFWJenJDMGrc0JUQVENF5ab4ixItQ0UtCb9QWffEv6iRDevafmJl
r+57pk+GzQkvauQLHelULhGlZeWTtfyTXSxUQwzEzXyhBRJ7RTCB3NjQUMvyRfRv
14tMcmQf3/5SzCScR2OaiPDrEUFLxv42y2W8UmU2swha32vvEq33ILw5bBTA+IW8
wKWmSI2jxnFb0dX2cNAoPq+8UYGv6w==
=1fHO
-----END PGP SIGNATURE-----

--iltdsbk26xo7g47t--
