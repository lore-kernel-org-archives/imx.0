Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98E417C8B
	for <imx@lists.linux.dev>; Mon, 30 Sep 2024 09:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727688116; cv=none; b=uCP1N8Oo+HXslDEzMHs56RxIKcnVQXB3w75IOjT117hN1uKLY17uQ9kDWJ7nH/AEHcmiK7etxAq0fv9+1liI5hvxQELQCm6kcQXUkq6UxPnpoje6hPb1Zy68+zyNCcpP2h7bBKgfit/+Cm2OnPbeH8tYYiZQ/uLPg+qzVVqtSF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727688116; c=relaxed/simple;
	bh=BhD2kSrrhXn9dSQUUKAGRnvodBZRJ1oc5oUYhjr/Gf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ayTes47/53hRXCNollYWGuKjq+Olatz+fdqb5WtiVriWpiNiEKSuQD1sC69JAKd/FN8Jjus1sCjevCqwzk8w02HTlZLEPYsPKKGifHzOmR+kUCK77062KPIwVwP9z3fFESdfy0oeD9kGF9UrrdKo6N+o4MtwSH11/PyF83BJitc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1svCb0-0004O1-M0; Mon, 30 Sep 2024 11:21:34 +0200
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mkl@pengutronix.de>)
	id 1svCau-002bBg-7Q; Mon, 30 Sep 2024 11:21:28 +0200
Received: from pengutronix.de (pd9e595f8.dip0.t-ipconnect.de [217.229.149.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id CDE5A346819;
	Mon, 30 Sep 2024 09:21:27 +0000 (UTC)
Date: Mon, 30 Sep 2024 11:21:27 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] mtd: spi-nor: support vcc-supply regulator
Message-ID: <20240930-wonderful-wealthy-aardwolf-b455d6-mkl@pengutronix.de>
References: <20240930-spi-v2-0-ed7f6bcbe0df@nxp.com>
 <20240930-spi-v2-2-ed7f6bcbe0df@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mwv5x2hdeuwf3seu"
Content-Disposition: inline
In-Reply-To: <20240930-spi-v2-2-ed7f6bcbe0df@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev


--mwv5x2hdeuwf3seu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 30.09.2024 17:22:25, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> SPI NOR flashes needs power supply to work properly. The power supply
> maybe software controllable per board design. So add the support
> for an vcc-supply regulator.
>=20
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/mtd/spi-nor/core.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 9d6e85bf227b..5249c8b13916 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -17,6 +17,7 @@
>  #include <linux/mtd/spi-nor.h>
>  #include <linux/mutex.h>
>  #include <linux/of_platform.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/sched/task_stack.h>
>  #include <linux/sizes.h>
>  #include <linux/slab.h>
> @@ -3462,6 +3463,10 @@ int spi_nor_scan(struct spi_nor *nor, const char *=
name,
>  	if (!nor->bouncebuf)
>  		return -ENOMEM;
> =20
> +	ret =3D devm_regulator_get_enable(dev, "vcc");
> +	if (ret)
> +		return ret;
> +

What happens if the SPI-NOR doesn't have a "vcc" regulator?

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--mwv5x2hdeuwf3seu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmb6bZQACgkQKDiiPnot
vG8uiQf8DcseKRoAJiTxjtqWo2GwihpClJ843qTNRLCvPcW/ntH1rv1wiF0NXA4v
jtGOLCiSHCVHx5gV68zWvJTmT9ZeQ3O4z24KHsr7IF5Cbf9TOwq1YZCHXqFn4bOy
71CJ1ApXb776przvR2Foy9H33h8I5r+LUUIppdWo0IebOHVf4Ry+pDmEzffqS0Iu
HyCMaAo8x+q+t95WPWooRjlUmShpCQapdzRmNYtw5uxYtPSQ7r0HycSeIMZ6bsip
hHhkKwNeOSDZmeJwdPBXf2dwD4WcF6aIMe3O1MVZcHUIVNW/0V5FHjaAKCW/S26t
VrBSNtv3Sl8BilQiuIoQhYHm4PjLrw==
=LL2n
-----END PGP SIGNATURE-----

--mwv5x2hdeuwf3seu--
