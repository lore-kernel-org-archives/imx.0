Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60E21B0137
	for <imx@lists.linux.dev>; Tue, 15 Oct 2024 09:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728984935; cv=none; b=m7x1y9rE3LLw7zr2E7I4NArzNhKpSHEWYKcsmw5kT7LJmA3FzdJO34DIv0jDEDL+2eFlVjJgW284s4YbGrE62hII0dLlXBU0IcFyQQ8CNc7M3p0jkKMbsA8iq9NkFlyqgDNHWeU6P/eUwu6eK24sOh61bA1rpBsBvWKBkgVyrrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728984935; c=relaxed/simple;
	bh=JheizOOh92xYasGYS1s6y2lJIToByxPQTHVdmHl+yA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R3udB0DM4vDkJNE8HkrJ+hbeZVWHZjyFXy+1h31VH0mNkRLuyzMWCN1PU2EjKbcYTdFKeF6M/eS96xYfVRXjRWZtbGTxYXtj5fSsGIkX0eJdDPWd3QvHbTu700W9L03UhFjPwU7keV4socQ20HHcjBZSfc03QCwc4zTXIXXuLn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1t0dxZ-0007gA-3y; Tue, 15 Oct 2024 11:35:21 +0200
Received: from [2a0a:edc0:0:b01:1d::7b] (helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mkl@pengutronix.de>)
	id 1t0dxY-00202N-Jj; Tue, 15 Oct 2024 11:35:20 +0200
Received: from pengutronix.de (pd9e595f8.dip0.t-ipconnect.de [217.229.149.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 3CFD5353187;
	Tue, 15 Oct 2024 09:35:20 +0000 (UTC)
Date: Tue, 15 Oct 2024 11:35:19 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v8 0/5] v8: firmware: imx: driver for NXP secure-enclave
Message-ID: <20241015-silky-mussel-of-tolerance-b3f5ba-mkl@pengutronix.de>
References: <20241015-imx-se-if-v8-0-915438e267d3@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ve7ngvhuovj33gje"
Content-Disposition: inline
In-Reply-To: <20241015-imx-se-if-v8-0-915438e267d3@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev


--ve7ngvhuovj33gje
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 15.10.2024 14:30:58, Pankaj Gupta wrote:
> base-commit: b63ff26648537a5600cf79bd62f916792c53e015

Where can I obtain the base-commit?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--ve7ngvhuovj33gje
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmcON1QACgkQKDiiPnot
vG9X2Af+J+xuxalOSQSQcrU4QulynDR7mUOqjhFSIuBwZ5BB56PMabTK88v+zwFW
HbNp07my5v/vfjTZMBHcnvgIhkDk2L3Ko90AaOU03GQgl4HDmFC1XfUITOVQt5Ke
JH5FOI9oCyhI0NsoKLnAhrL4Mf2LvU4suSgnEnGuIeQTqbZgfNJV/YiCx+WyJSpC
HpevZ+dv8eZ/8FUt33GIbOmu0rkSM9s5C5XSCCLaNEIyTFwTPpe7e6QsLWlSuh6U
zBybW65UpnnQVO4INSRsBENiOp7cMWkCwDcjaiQLRBSr75vp2xXLQMlTBZpXq4iC
4uw415bFodLqdtYaLHZYPlWee5IeDw==
=/T01
-----END PGP SIGNATURE-----

--ve7ngvhuovj33gje--
