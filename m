Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4152147FA
	for <imx@lists.linux.dev>; Thu,  9 Jan 2025 07:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736408612; cv=none; b=Go7gcEHiklr1YuKRGMYta1pKnq6X9aCET+A//MLU25gQeEJ6beCm1XrLwn8mCDkJsbt4wFIjvVtPwPfhZ5O0kCYeGR+OUDlIFb680Rwxzy105cCFqXd+jDVbtBO2WFeOD4wr34xCRifCa3ea9VQCtqEAQfuWD/v6lU7Vwk3cveA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736408612; c=relaxed/simple;
	bh=AujPO41+pvB1tomJV777Px8OTr25nzkE1wIQmICTRJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtUcmRFITxQMZ3Qv4NbMRDGY8u4ZJFfFSKH1vSc16D429XgidDn74fZhsS22tYS1yY6NL/DwY6ZaD3gqHVeMCE36ylhWMSWGAw2MCwRGKxTAQDp9ImgO55FGIYzV3WUBDzwoL+vfyEV5SIeutOmh2aQj8h/+DDUn/Z1xF2rNGns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BePfcLIn; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BePfcLIn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=AujP
	O41+pvB1tomJV777Px8OTr25nzkE1wIQmICTRJE=; b=BePfcLIn4IrZAAS5tCo/
	hDYoIDd9VmOD+b08gXsBBL9sWQIggG1+/hDk91d6l9b7XqGFS0Nzw3AO4mByhHKQ
	Xi0UaZ8WQgrDbNzIPQUYYxvSiUIwZmJeVRQr7fWIzfsvdvcWeiPO2u5j96PSg42D
	b60JubSJKzkwxgZVh+1ITYU38vu9ePJ4E8LAHvz4zZl4r2kzkBrI55UrWhoKk7QM
	T4au+2HUpHb9I6H9YQ+FgeydQdP7UM5saiyxqE8JM28O1rZDeT21m5DYaDO3JjDm
	YUGe0eToaVA6/2bMm5EGhDAicNRW11ttIboIhflqsq+D6Og2OqmTaGUFTOzHc32j
	tQ==
Received: (qmail 2820930 invoked from network); 9 Jan 2025 08:43:25 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jan 2025 08:43:25 +0100
X-UD-Smtp-Session: l3s3148p1@ucoRIkErIs0gAwDPXw20AOMQ2KO98fSH
Date: Thu, 9 Jan 2025 08:43:24 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Carlos Song <carlos.song@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	"moderated list:I3C SUBSYSTEM" <linux-i3c@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] i3c: master: Fix missing 'ret' assignment in
 set_speed()
Message-ID: <Z39-HEG6AaAFvDk6@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Li <Frank.Li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Carlos Song <carlos.song@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	"moderated list:I3C SUBSYSTEM" <linux-i3c@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
References: <20250108225533.915334-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GJgCYyWEeZ2zf4nQ"
Content-Disposition: inline
In-Reply-To: <20250108225533.915334-1-Frank.Li@nxp.com>


--GJgCYyWEeZ2zf4nQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 08, 2025 at 05:55:33PM -0500, Frank Li wrote:
> Fix a probe failure in the i3c master driver that occurs when no i3c
> devices are connected to the bus.
>=20
> The issue arises in `i3c_master_bus_init()` where the `ret` value is not
> updated after calling `master->ops->set_speed()`. If no devices are
> present, `ret` remains set to `I3C_ERROR_M2`, causing the code to
> incorrectly proceed to `err_bus_cleanup`.
>=20
> Cc: stable@vger.kernel.org
> Fixes: aef79e189ba2 ("i3c: master: support to adjust first broadcast addr=
ess speed")
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Precisely.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Tested with a Renesas RZ/G3S-SMARC board with some test code added to
the still under-development controller driver:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--GJgCYyWEeZ2zf4nQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd/fhwACgkQFA3kzBSg
KbakZxAArGY+//Z1bYxaZ81h2Z2Hd4yIU7OPjrtwT+JboeOO3tUXG9nkNWUr8+y5
JS4vJPJNZJggTvZgz6xwY5IG4UwHxxwPpaDm7dv3SJZ1eu7YuRLzvCpYlNCsRDu3
ysgtx0u6gTkbrEAQ82m/1XVhIs/TtwGOUpgkgAlP1VIb5U/fT6/FPi/Sd94oPYu0
QeG5AqsFyXtRVtHgJi1HS0zdBuHdteaXmp6qKhJ+lPEyNnEaBSFFBXrw1qANUqJv
0USsr7O8XlbINBm7ivQ+JmvWqti1e+eW6FuJFMPbyE37GLSM4CU2KpvBMoTZ4eYf
uTHoZIuDpK9I57AbC5UQZs9+VJIEjel6H2sHxzCOnTZjrLrHPugyzZzzCqd+PKvK
l3SYoVmgaXP8NwZal5IvNGpxmXQ94yR/rtbhzGHvIIdRZ6TNJjd6prYcEfducTWV
NbLxT8393G+OPlbcknUmkI67udrAl7JwQ+/T9uyt7wKUaEZKXOddqeZCXTsogfoo
ucpue1T0ZWShkcP8C0obanBzEFL8NCo2JvwNg2gveYeYnFkv6STqCMf+VXEh0LKC
KUuhiQ69UmT6VoLFEYsTJ+Q2xsyzWI5dS6oVYf93KgTzMlbqn+JvhBEbbPYczJnf
Xn4cGw8hGUQZoeipKWE/qHMqVkLIt+Tm7u4WzdWg2HMZ1D0nsEk=
=ibUC
-----END PGP SIGNATURE-----

--GJgCYyWEeZ2zf4nQ--
