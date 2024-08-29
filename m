Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237DC18E021
	for <imx@lists.linux.dev>; Thu, 29 Aug 2024 10:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724925727; cv=none; b=fnu0eDNm/eIIdY+580PGBKb8kGRqp1EN6MVe0O3Oufi8+pXFhjzIy+D4z0IcB0TIMomUVSG20d4+R4JI6t59Z6LgCsqOMu6nv/EYXranvyAbrw0rR8qcXXSpULKiokEPgT+FdWGTYqdTZC441nxz+rxLVXno6+vZo2Kwch0colk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724925727; c=relaxed/simple;
	bh=wUHWqhlxskG37GHnrSGRWcm8JrIsxzmU4fREj8ADUVA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k6P0AnbVcyOBqqEpRsiq9r+JErR7yeTVWXsIm/jWOmcNtpW76lmis9xlkO0cY6h3buB9d640sR5+uQqUVTcIQ553UWM5Vflu69lST02y+WIOW2onZttGs3hus40EQdsSnl/qYc+rLNC/WgNTcAoyeS5goLzYM9Qma/yyT3X0Jxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=elVgCjnU; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="elVgCjnU"
Received: from wsk (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B5D1C87DC7;
	Thu, 29 Aug 2024 12:02:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1724925723;
	bh=xthEvjklyi0tldf0RzO+cBlxZDiIDe0pmHoD56I97AY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=elVgCjnUjFPI4y42KRlcYzWDBiojtmbyFpMeHoHSMPrAw6iFw/qn8MuTPdPXJExrd
	 KyNXT8wU2YaDGSUUuHj6OAFnqQ7ACyRxkQP4sVHy8U2HiTe98XnnGsj2yzKT8da/Yk
	 9Hp8uCl3qfDKgKbpMRsN1IAa6739MMXWUzR6AvApz1T7izpZVvFN8l/r+OsMPv/zOY
	 JxgdaeCt1xWPutL3hW11YJDG5BZ9vcbzklbJA1lTzukCiU64cB+Ql0PxW+OU5w9nNH
	 /jC0SaGxtueGfEaYeKbf6WTYj5+M/918R6DvWSEKo2YNIgNcBqsNuP4SEPzoYtUVvE
	 KoPFqb1lSAfHA==
Date: Thu, 29 Aug 2024 12:02:01 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Rob Herring <robh@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Conor Dooley
 <conor+dt@kernel.org>, imx@lists.linux.dev, Shawn Guo
 <shawnguo@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] dts: nxp: mxs: Add descriptions for imx287 based
 btt3-[012] devices
Message-ID: <20240829120201.1c6b97a8@wsk>
In-Reply-To: <CAL_JsqJ4+=L4hOYWKUBRTHpSMfMNaNvEy0xcjX=fZ4r4KP8x3Q@mail.gmail.com>
References: <20240828112139.2665814-1-lukma@denx.de>
	<172484936571.3462707.10762753590627002293.robh@kernel.org>
	<20240828160553.53e164c3@wsk>
	<CAL_JsqJ4+=L4hOYWKUBRTHpSMfMNaNvEy0xcjX=fZ4r4KP8x3Q@mail.gmail.com>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ggFtdIXYD1S_KQtz.lDs_tT";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

--Sig_/ggFtdIXYD1S_KQtz.lDs_tT
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Rob,

> On Wed, Aug 28, 2024 at 9:12=E2=80=AFAM Lukasz Majewski <lukma@denx.de> w=
rote:
> >
> > Hi Rob,
> > =20
> > > On Wed, 28 Aug 2024 13:21:39 +0200, Lukasz Majewski wrote: =20
> > > > The btt3 device' HW revisions from 0 to 2 use imx287 SoC and
> > > > are to some extend similar to already upstreamed XEA devices,
> > > > hence are using common imx28-lwe.dtsi file.
> > > >
> > > > New, btt3.dtsi has been added to embrace common DTS properties
> > > > for different HW revisions for this device.
> > > >
> > > > As a result - changes introduced in btt3-[012].dts are minimal.
> > > >
> > > > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > > > ---
> > > >  arch/arm/boot/dts/nxp/mxs/Makefile   |   3 +
> > > >  arch/arm/boot/dts/nxp/mxs/btt3-0.dts |  12 +
> > > >  arch/arm/boot/dts/nxp/mxs/btt3-1.dts |   8 +
> > > >  arch/arm/boot/dts/nxp/mxs/btt3-2.dts |  12 +
> > > >  arch/arm/boot/dts/nxp/mxs/btt3.dtsi  | 320
> > > > +++++++++++++++++++++++++++ 5 files changed, 355 insertions(+)
> > > >  create mode 100644 arch/arm/boot/dts/nxp/mxs/btt3-0.dts
> > > >  create mode 100644 arch/arm/boot/dts/nxp/mxs/btt3-1.dts
> > > >  create mode 100644 arch/arm/boot/dts/nxp/mxs/btt3-2.dts
> > > >  create mode 100644 arch/arm/boot/dts/nxp/mxs/btt3.dtsi
> > > > =20
> > >
> > >
> > > My bot found new DTB warnings on the .dts files added or changed
> > > in this series.
> > >
> > > Some warnings may be from an existing SoC .dtsi. Or perhaps the
> > > warnings are fixed by another series. Ultimately, it is up to the
> > > platform maintainer whether these warnings are acceptable or not.
> > > No need to reply unless the platform maintainer has comments.
> > > =20
> >
> > There a few things to clarify after:
> > CROSS_COMPILE=3D"arm-none-linux-gnueabihf-"
> > ARCH=3Darm make -j4 CHECK_DTBS=3Dy nxp/mxs/btt3-0.dtb
> >
> > 1. mxs-spi.yaml vs mxs-mmc.yaml -> both refer to the same set of HW
> > - as those IP blocks can work as both mmc and SPI. =20
>=20
> Sounds like there should be 1 binding then.

I also think so - one binding with two compatibles.

>=20
> >
> > 2. For the sound codec:
> >  codec@1a: compatible: ['wlf,wm8940', 'wlf,wm8974'] is too long
> >
> > This is a bit problematic as well - as WM8974 doesn't have ANY ID
> > register, so it needs to be probed manually and decided which module
> > with sound codec needs to be inserted. The WM8940 is the pin
> > compatible replacement. =20
>=20
> So if the OS has 2 drivers for these 2 devices, which one does it
> pick?

(For now) user space assess if the correct codec is inserted as a
module.

> The answer for Linux is it is undefined. The expectation is if
> there are multiple options, the firmware figures out which one is
> present and adjusts the DT.

So then, only the newest one would be used, and then I would move
detection to u-boot and use overlays.

>=20
> > 3. The simple-bus.yaml seems to be missing in the Linux kernel tree
> > - problem is that imx28 has 'apbx' bus. =20
>=20
> simple-bus.yaml lives in dtschema repo.
>=20

Yes, I've just noticed that.

> Node names should be generic, not named for the implementation/type.
> The binding is fairly flexible in allowing ".*-bus".

Fabio has just prepared and shared proper patch.

>=20
> > 4. The fsl,lcdif.yaml doesn't allow the situation when one specify
> > by hand (in DTS) display parameters (as different ones can be used
> > by the manufacturing site). =20
>=20
> Shrug. At the end of the day, the binding and dts have to match. One
> (or both) has to be adjusted.

Ok.

>=20
> Rob


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/ggFtdIXYD1S_KQtz.lDs_tT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmbQRxkACgkQAR8vZIA0
zr0QzwgAwJdeGp91k9muym0KIPV9AcUJwVRNO8xcaTnGoTlhtepdDSVIOXuxGvqu
8rdTTMTqkxcZrdRpoe8F8cMfhAJLie+x9/E+OP3M/b02AdpYSZQEQ3IUYkckt5ra
1xFA8dJXvj/j+QP8v+k6IUBXmAdawntgEiGDlJeb7v9fUf9DMcb2bDDBPJPKLA+b
SuyAAToBp0yKMkXvS33XO+uTfyGbSf5c06/cormBdhbcJZg+dBjCFdcPpDS+J+RI
BiAiiwv1HWms2QKfE24mqEvi5Tubs6LRX4RzoMnCH1qEr+OJ+hud6/SwZAh+sTH3
rNtLOdm94OAKngc92Z6xg5G5FdkK5w==
=zHNm
-----END PGP SIGNATURE-----

--Sig_/ggFtdIXYD1S_KQtz.lDs_tT--
