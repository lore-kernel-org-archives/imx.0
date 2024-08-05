Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF620376E0
	for <imx@lists.linux.dev>; Mon,  5 Aug 2024 15:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722871116; cv=none; b=FRuEv4V9fvoodVmRmoI2VaVg9OguH5vilWRZlXc99+YBtM2tnSL3GUOqXW1nJcyzarCvPEWqLbUSeYnf52xdcmo5s1tLUxvrvIGD+9gtORozA5Btczl5APrJDxN4e1Jz+yloSAMU2lrBP02h1qXXorR31UhBM3+cfJn6rXhtuZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722871116; c=relaxed/simple;
	bh=lvYPe5JkM3Jsviw05x2n8vRfc/U+/nszrW8Yv9RWPpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RPAqgDEo574dpNeB9cjEKAIXTJFxWFXbn7Ew/aqpZ0RX6mdSovlgKePNEmZYPa5DEzr8C1xivRsPuqxa23d9Am4muQxyLnq4J6XF4gP+ncleT8qOpd8x6iCPg1IpKDTetfcxcr1W7U2xqfLIgBsELYpQMADeLs0u43soV+hpzVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1sazTY-0000aP-8t; Mon, 05 Aug 2024 17:18:20 +0200
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mkl@pengutronix.de>)
	id 1sazTW-004k74-RH; Mon, 05 Aug 2024 17:18:18 +0200
Received: from pengutronix.de (p5de45302.dip0.t-ipconnect.de [93.228.83.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 4DF043172CF;
	Mon, 05 Aug 2024 14:48:16 +0000 (UTC)
Date: Mon, 5 Aug 2024 16:48:15 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>
Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-can@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	haibo.chen@nxp.com, imx@lists.linux.dev, han.xu@nxp.com
Subject: Re: [PATCH v4 0/2] can: fsl,flexcan: add imx95 wakeup
Message-ID: <20240805-succinct-didactic-vicugna-e5449a-mkl@pengutronix.de>
References: <20240731-flexcan-v4-0-82ece66e5a76@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i3ptc3rbvj5qf52i"
Content-Disposition: inline
In-Reply-To: <20240731-flexcan-v4-0-82ece66e5a76@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev


--i3ptc3rbvj5qf52i
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 31.07.2024 20:00:24, Frank Li wrote:
> To: Marc Kleine-Budde <mkl@pengutronix.de>
> To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
> To: David S. Miller <davem@davemloft.net>
> To: Eric Dumazet <edumazet@google.com>
> To: Jakub Kicinski <kuba@kernel.org>
> To: Paolo Abeni <pabeni@redhat.com>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> Cc: linux-can@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: haibo.chen@nxp.com
> Cc: imx@lists.linux.dev
> Cc: han.xu@nxp.com
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Added to linux-can-next.

Thanks,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--i3ptc3rbvj5qf52i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmaw5i0ACgkQKDiiPnot
vG820Af/YitgSU5McIXL4Xj9VvsbaznGIpvqeB/FJPifibKVNOxtEWHQGdKmrE04
p/AaYxH+d9pegXTCh4swRkcr1Z2xehUTRhH0Y+LksJpUTxcQZ3bgXXXkw820NcEx
cEyLB6FsX51oV2twn5Grryb46dY3pmN+sYbyoisYIftJNV+uguNmG4f4fRyyOob2
/vypmstlC6dRFy/QMud9wC57iRFkT4wv7sq1ZMe1cdNeW9U9FTXjoQkVqtzoZi6c
R+iU6RuSolTdSK+rgiatlOs1JihcMqoxKGtJ4bkeCJ79anBWNrpwFgI5o4N8ksYg
TShdt8HLpYWPFdsir/zyCdnSF869og==
=3OT+
-----END PGP SIGNATURE-----

--i3ptc3rbvj5qf52i--
