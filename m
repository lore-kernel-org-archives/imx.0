Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F07256C6C
	for <imx@lists.linux.dev>; Fri, 19 Sep 2025 19:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758309526; cv=none; b=Ps0NQTeYjcvMjkociJrvsUeNTy9GPgJT3SjUx6wGr0wGIix+yoexHXaeWkUR48oQIMIINtrdTp1rWnWahBDYZMvjXWOo048D5olU1bJFQgxS7hSxzNh/yxVq6Pp8W1suIqWs6A9AQnJQy1dAFT6CDeUbv8uo/NeyQA34Ru/+854=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758309526; c=relaxed/simple;
	bh=Nm+atkHlX329nBUD+ou4VUp5OVx7b5SAjbLtVdyGzew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y+v6ltyXRJPGaWbfJl/6Sz7OkgcJ9wDR03d++V6utDKPVpDqyksaxFqC1kJVgMJBEjyB4jtB0kh1egrEYyDGPjtm4TM64xWKOoDlaKnYJ0Ovc/A9APVuj2y5JWJ4v+k8tFIbM4rudFdzd+3o49C2ZHzUdylSCnZpNIyFK43rs7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1uzgcr-0004Qj-VG; Fri, 19 Sep 2025 21:18:33 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1uzgcq-0029eE-2e;
	Fri, 19 Sep 2025 21:18:32 +0200
Received: from pengutronix.de (ip-185-104-138-125.ptr.icomera.net [185.104.138.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id B75A847520E;
	Fri, 19 Sep 2025 19:18:29 +0000 (UTC)
Date: Fri, 19 Sep 2025 21:18:21 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Peng Fan <peng.fan@nxp.com>
Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Aswath Govindraju <a-govindraju@ti.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Haibo Chen <haibo.chen@nxp.com>, linux-can@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 5/9] phy: phy-can-transceiver: Propagate return value
 of gpiod_set_value_cansleep
Message-ID: <20250919-lovely-amethyst-bullmastiff-5cef8b-mkl@pengutronix.de>
References: <20250909-can-v6-0-1cc30715224c@nxp.com>
 <20250909-can-v6-5-1cc30715224c@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t6u4zda4cx5kdnck"
Content-Disposition: inline
In-Reply-To: <20250909-can-v6-5-1cc30715224c@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev


--t6u4zda4cx5kdnck
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 5/9] phy: phy-can-transceiver: Propagate return value
 of gpiod_set_value_cansleep
MIME-Version: 1.0

On 09.09.2025 13:40:15, Peng Fan wrote:
> gpiod_set_value_cansleep might return failure, propagate the return value
> of gpiod_set_value_cansleep to parent.

Are there any expectations of the phy framework from the driver if the
switch on or off fails? Do you have to roll back any changes in case of
an error?

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--t6u4zda4cx5kdnck
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmjNrHoACgkQDHRl3/mQ
kZwqYQf/c1/IXd7aRBuqdaMALPyXhUQLb5zDa8xv15HZudLAlb4N3ZCTwnOa8WuR
6C1PiBoxg6JPbbcgfCADKc3ADq/+nxjr8fk1rU3bPf/9t3p+BNJFfX8jiwL7B42w
X/Yt9MEtmxWaOBWeNXedyM4pFB2qT+GJncKrl6lBIjyjIRkhABKaiNyt/M/DFenK
rA+xEFrZVljI5iLMktjI92K1FlNaRiaEyOvCSYrM33pHz8RQWPECEF0T4D9z9siI
XPy/dP9YRUkUszZ1kp+vh//bd2I8Z1R7fwNBWZf+ZwLMISDDx/lt06ohQQwTcLgs
fHVzHn541sJjrfMO6kikrs8r0W3FQg==
=qpEC
-----END PGP SIGNATURE-----

--t6u4zda4cx5kdnck--
