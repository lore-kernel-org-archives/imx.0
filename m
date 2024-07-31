Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D10161339
	for <imx@lists.linux.dev>; Wed, 31 Jul 2024 06:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722406297; cv=none; b=Y17YiqCz/wrUct7kV/WwIcR/OS5px8A2npxQ+CQ9Bk/BX9dAigP9WrCdk9rPUf9FHslaF9Pv62ETG2iqYQVpV4bAPsEJjGo0xYZ0NbsfIwacn6KJJzHAXhkoQDOiJ4G9gigBX4fRJBMoF7OrYeYEj+UpNZNDz/gIX67D2CiPNx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722406297; c=relaxed/simple;
	bh=HM/PNjDwStd+QZL8YNQOqRwjwHWb9vzI34hWlvpWHdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mcmUmOifdrWtNgQyEptMNP8LMbJLwKa30NlAvNOPUh5MEOt2W6YsR7jbKCuWG6IH+rJ+4DwSWbqNv/nBX8VSnlDeEBqwg1wXcdGlm+kwCvInTE+otGmEHYuAh2+WSE33GLK7kcgGc2Nqx5DMYMcy+WL7Eo9caDn+pRlra2BgXJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1sZ2YX-0001Ht-4a; Wed, 31 Jul 2024 08:11:25 +0200
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mkl@pengutronix.de>)
	id 1sZ2YV-003SUS-Oc; Wed, 31 Jul 2024 08:11:23 +0200
Received: from pengutronix.de (unknown [IPv6:2a01:4f8:1c1c:29e9:22:41ff:fe00:1400])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id E4FA1312332;
	Wed, 31 Jul 2024 06:11:22 +0000 (UTC)
Date: Wed, 31 Jul 2024 08:11:21 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Fabio Estevam <festevam@gmail.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: spi-fsl-lpspi: No effective_speed_hz support yet
Message-ID: <20240731-vigorous-kagu-of-masquerade-45655d-mkl@pengutronix.de>
References: <0848d006-092a-45fe-a1fb-949b55a3177a@gmx.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xktflcv6wbiez2aq"
Content-Disposition: inline
In-Reply-To: <0848d006-092a-45fe-a1fb-949b55a3177a@gmx.net>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev


--xktflcv6wbiez2aq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 30.07.2024 19:47:17, Stefan Wahren wrote:
> I want to use a Vertexcom MSE1021 SPI device with the i.MX93. This chip
> is a little bit special, because it must be operated within the range of
> 6 and 7 MHz. That's why the mse102x driver provides debugfs output of
> effective_speed_hz. But I noticed that the spi-fsl-lpspi driver doesn't
> support the calculation of this, that's why effective_speed_hz is always =
0.
>=20
> Are there plans to implement this?

At least from my side not. At least for the spi-imx the change was not
that complicated: bf253e6bf6b8 ("spi: spi-imx: spi_imx_transfer(): add
support for effective_speed_hz").

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--xktflcv6wbiez2aq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmap1YYACgkQKDiiPnot
vG+T1Qf7Bu32N0myWl1h2m24Cju7EGU0vK18vQD/JafRFCQ3tRloqHDLNRN32rLa
xYbS3aKehR0rqM+tiK03XPrlZsJR5YCHlz26wm3m7C5Mz1s3LMrnBdQ/mAEAWAZy
0sbIAs9exhF1OpqQpTPeJb5ZEzXfLthIrAwa2R9Vx9x91rr8uQP0OcJihEZn907S
bcdV1z1j8P1vhCNui687MT7soRWJKihZsBU/DZAyzuJJleFgWpmBRYJ89wNuIW9P
yHD+ftBt2HLD2ArT1Z/O71qsGX47M71u62PDKxW+oJmcqYJlfs3YmEyAokV5aKkR
gdlzE/Uu3i4j9RgcrajKcaKCVDseXw==
=1wWI
-----END PGP SIGNATURE-----

--xktflcv6wbiez2aq--
