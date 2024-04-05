Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C255217167E
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 17:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712338443; cv=none; b=ZjCE2CAnsxZtJdRKLkCW3I+wXw1NljkLLpR22grynyAjPjUhxC2uELHb3tUjXVk5ck1GHN/xfPlnTuY28U84f3mUOk9GYESTRRcJmZrbmiHstSiKzoyKWHpRWmpylLQEswvfdhCDCiiVyPj+oX8eCwVGdcibNU1GVhR8p+WB7os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712338443; c=relaxed/simple;
	bh=yNKlQsRX9NX6jSUmt6M9DavRE3tT1/cEPwISWiiJF1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nHiMWD9t33wgECxHHEfsF/rUd83LK3AtIq2b1uZPvqnFD9vMwtgssqTvo+F1+xyO6VHDSl9YdnBZHYJxteKbcDW4nEtLxVLRfgWkFfk8LsECyHhyZOgRQNh5RDrB4h6pgSOB7fUKIST4WqWogkmoELvOdHgaLKOdBiCbqhoZ5iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1rsnRo-0006ax-55; Fri, 05 Apr 2024 19:33:52 +0200
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mkl@pengutronix.de>)
	id 1rsnRn-00AbC0-C5; Fri, 05 Apr 2024 19:33:51 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id F30542B2CB5;
	Fri,  5 Apr 2024 17:33:50 +0000 (UTC)
Date: Fri, 5 Apr 2024 19:33:50 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Esben Haabendal <esben@geanix.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] serial: imx: Introduce timeout when waiting on
 transmitter empty
Message-ID: <20240405-amused-cascade-0801f31c674a-mkl@pengutronix.de>
References: <76cf9ce9cbf9dcdf78bc00ce7a919db1776ebce1.1712309058.git.esben@geanix.com>
 <20240405-impurity-emerald-f67dc37adf9b-mkl@pengutronix.de>
 <874jcf67xm.fsf@geanix.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4bjqwdxylbl7erdi"
Content-Disposition: inline
In-Reply-To: <874jcf67xm.fsf@geanix.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev


--4bjqwdxylbl7erdi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05.04.2024 19:22:29, Esben Haabendal wrote:
> Marc Kleine-Budde <mkl@pengutronix.de> writes:
>=20
> > On 05.04.2024 11:25:13, Esben Haabendal wrote:
> >> By waiting at most 1 second for USR2_TXDC to be set, we avoid a potent=
ital
> >> deadlock.
> >>=20
> >> In case of the timeout, there is not much we can do, so we simply igno=
re
> >> the transmitter state and optimistically try to continue.
> >>=20
> >> Signed-off-by: Esben Haabendal <esben@geanix.com>
> >> Acked-by: Marc Kleine-Budde <mkl@pengutronix.de>
> >
> > Where's the cover letter and patch 2/2? Have a look at b4 [1], it's a
> > great tool to help you with sending git patch series.
>=20
> It is left out on purpose.
>=20
> This patch is a stand-alone patch as it is. The other part of the series
> you are talking about is not going to mainline for now. It needs still
> quite some work, and will only go in after all the other printk stuff.
>=20
> I hope we can merge this patch as it to mainline now, instead of piling
> up more than necessary in the rt tree.

Ok, then send it as patch 1/1.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--4bjqwdxylbl7erdi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmYQNfsACgkQKDiiPnot
vG9DAgf7BXuZetpPFhgqfRuDFXD45sY0bXSNzz+OUWMCPPyz3WmXU0+EV74/QMCU
un0y/QTd+SM5nYz4/hiRANBcDIXR71D0gDH1aNBNG6rpd3ZaZ/GnDfMmS6mj7MfJ
xYRaMZ0wlKbrueg3up5K24qKL8J+HDWCVtEF06htScqSA33Z/sWC6x6vJ21qhU13
KAYE8e+cy2QEcwUnBzxoYyNNS04hD1AyCGrtbJwyIwKJG7ZU8EqBsGZWGqyQDZCR
WmfJvQGSjY2HuB0vTQD9hidq4pt9PIR6s0tVd8FQR+Xif02BK31KOlzsdkm0QVp4
BimNplJFuQbXcL4cq8AW7EFuKkp9OQ==
=SQHg
-----END PGP SIGNATURE-----

--4bjqwdxylbl7erdi--
