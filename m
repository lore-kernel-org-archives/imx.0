Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34B5171066
	for <imx@lists.linux.dev>; Fri, 12 Jul 2024 13:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720792672; cv=none; b=U5QRR5NeT2ibzv3ZAaXpaLRinCnUZKuE9TrWMb0L+8QT4KO7AoKA64z52053YfqRyx6SJSiTL/JkzeWhKdVxnRGyH4xKpSLrrPz3OQIlHo8nEeh3izHFRu1Zdo4nebKl62TLns6nL/gmFUr10r6oul3aOit8vZOF4vx5Ydsam+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720792672; c=relaxed/simple;
	bh=VwmcOFQa6+zLy28MNBBHf0p+J5lgD6t6G0cBronB+vc=;
	h=Content-Type:MIME-Version:Content-Disposition:From:To:Subject:Cc:
	 Date:Message-ID; b=d51kAlW2GX27oOnKWYO9RKpI7u+2EbmJ5T6xf36GvZ8kC5tPIw9NBKw8+QOeVIiuVg+ckHTBoqar+NOZDRQyjcyfFmhhOVtyccfoAu8ELU0f+orHnC8i3I7mHc31CkC+kVdX4CKJnk5w4NDE8oAEUiYzP9c+4Vcb9nho/4+BT4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=O/tw71X+; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="O/tw71X+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Message-ID:Date:Cc:Subject:To:From:
	MIME-Version:Content-Type:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=cyzZqWwRyvsBEnNWCbMBuygBvQCg75ywBkylgPd8fW0=; b=O/tw71X+zi3BRzUMpUZ/M818lY
	gpkCCOxRuj4Fs5Oo/8XcCDGBJ77v+nLDjjQwAkL+th+aurKd6hqADyr2oNiw2h09uyjBcnhFB75r0
	6XIK9CqKp2X36IIkz130yaHzTjTgywSXkEONIfquvtE73rzCWIJPHYSFcy8DEf3sU9sM+s/X9PTpu
	Z4RbO1+2zQXMPKlTBWeomu7KdpRoRDwZ6uqkFIkMTdGIsuzderJwE/JPmwhU1l95BRIxUVbcl4c+3
	MKfzGTsEEYB5O50I9NE+/qD3V6Qo/MeRreJH0Tm5QvatmuDHb1n1R9Vo6y8/7CymchPHokSKAV9+a
	EdBTXfqQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <josch@debian.org>)
	id 1sSGmS-00BQvM-4y; Fri, 12 Jul 2024 13:57:48 +0000
Content-Type: multipart/signed; micalg="pgp-sha512"; protocol="application/pgp-signature"; boundary="===============7771091298551443791=="
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
From: Johannes Schauer Marin Rodrigues <josch@debian.org>
To: imx@lists.linux.dev
Subject: Distributing NXP i.MX 8 firmware blobs in Debian
Cc: Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Date: Fri, 12 Jul 2024 15:57:47 +0200
Message-ID: <172079266731.2928366.7031846226118749814@localhost>
User-Agent: alot/0.10
X-Debian-User: josch

--===============7771091298551443791==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Dear NXP team,

I'm writing you as a member of the Debian project. I am trying to add suppo=
rt
for platforms like the NXP i.MX8MQ to the debian-installer disk images. The=
se
images need to (for example) contain the DDR training blobs which can be
downloaded from
https://www.nxp.com/lgfiles/NMG/MAD/YOCTO/firmware-imx-8.24-fbe0a4c.bin

Unfortunately, the NXP Software License Agreement states:

> 2.3. [..] If expressly authorized in the
> Software Content Register, subject to the terms and conditions of this
> Agreement, NXP grants you a [...] license solely in connection with your
> manufacturing and distribution of an Authorized System:
> [...]
> (b)	to copy and distribute as needed, solely in connection with an
> Authorized System and for use in combination with a NXP Product,

My reading of that agreement is, that Debian is not permitted to redistribu=
te
these blobs. But this in turn means that our disk images will not work
out-of-the box with NXP platforms that require these blobs to be loaded ear=
ly
during boot to function.

Could you assist me in connecting with the appropriate person who can help
resolve this issue? Maybe there is a possibility for the Debian project to =
be
allowed to distribute these blobs in its repositories?

Thanks a lot in advance and have a nice weekend!

Johannes Schauer Marin Rodrigues
--===============7771091298551443791==
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Description: signature
Content-Type: application/pgp-signature; name="signature.asc"; charset="us-ascii"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEElFhU6KL81LF4wVq58sulx4+9g+EFAmaRNlcACgkQ8sulx4+9
g+H4CBAAnQBl/7kHKkGSg+YsVIgwEm+jNR7PRAvKul+oEKOTyyyqQLwb0JfEc5k6
de3L+UFHnjMdutB9ODEmin5XLiW+38Cjni0+JZc9tpBkD61WVdo919N7in9f3GPA
w8GJv7KgiOyDDwed32XDheDb8BG762fJQM1XgEZQkSFT2PD9XJ4XIJ+Ts4EsOhs+
tu3+At86x2SWse9jhsFuOQuTwQblT0EFq2XGFvcymlMLevnzvjcPvgChoQs6uDdU
qr+oZQBgDUi5gGe63Q2Cv6zMR0iJ6y8YJSGFxteC9JMszzVreV0HeHxBQOTnliZx
6Mvm+Xcm80oQBoO3PaBVXxZ/oAgyM8DGa+LpI3fgGQN6rv3OWe6CRCFtHQ0sHp63
NZ7JyW0KxI8wSSMI8d438CfcU1poEO2dU5zN2oQZN/pGUaBMweJ+WaMW1PkS3SzF
ks+XTofoU0FPWlrwEDE8ZrapChxFH3HAd7qDcmptesU2hQspTWYmqp2x5ICnhYVO
nVfCl8IvNmj9fhA81l0ci7X36rNmzIXkGmJqTWu08DXBgXgRzwNd5Xj6RWhasUyB
rYMDlCJCZKqzwCrcUxJvEBN9No4trYQs9x6MMFX0MQdCJZUMZc2fgtEEiZNoVHDS
1Uf9y0TsOOZl1Ufmpisc2MY2qcRdBybxPcdbSGtCnxmNzf6a6FU=
=JgnZ
-----END PGP SIGNATURE-----

--===============7771091298551443791==--
