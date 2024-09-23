Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941A53D967
	for <imx@lists.linux.dev>; Mon, 23 Sep 2024 09:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727084837; cv=none; b=tfYUpfskUUWaxrA6rodypDFA/w5KhIyq34IrIRGzsX0MJXkFFLARpsIJ7v8wH4qBgknTEdbvedYTtGkj4ENP5VMA+yMnjHRubJptImnJh8rKHDYERqEYzo3pUpJIwdyvb/akAqt8mKQyXM/72HaRHR9XO5rdpl/SxYef2PAJpFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727084837; c=relaxed/simple;
	bh=hwk0tBbzwWGtPFcWvfrxbwwiC1zX13mWQ0fZaRHWdro=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M5aZ88Y94Q03Y3LCdTleleQy96zwYJyIAmzJz28mS4gkwUwbdhkCIt4a6Pyv+UI+uc8SG2DMIyAXCgDObLicvx+LC2iAfQmJnfouYpYnUyQ3YY5oNQKiki+OTpk1O2YIOYTQlbVwL5A4MNLrBRsHbBTgvN1rFHSwVoCcR1Kei8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=bepTSk1d; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="bepTSk1d"
Received: from wsk (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id D98378862E;
	Mon, 23 Sep 2024 11:47:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1727084833;
	bh=+tppFS2oLuaEwqRTzj9fnAMiRlSoieCQHR+Y3pC9ZME=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bepTSk1dhA43opvHvQDdQq2JunFcLNitxrJMiNQIJvlZqAKqIvMToMQEyUbLBbV4J
	 Nf//FDNv7PWTI1xjLkoCqdjTckEYHWmYHNzmpW8F0YauKur/OuQYbAVt51NuRaKedT
	 Rg6mKqgZLsiJjxttUHrPHzjRih8tMSJ41vG6f21j78+coggQqW/1clpWyQrcLDFnCk
	 yAaMgOMjuzyZrIbLZfK/B603LeSpa1ku9vMhpf2UQ/g/h3GeVyJhdExR9J8kz7Y/lz
	 6sRzIsnZZnKBVuePzUt9O/ZWSD0u0QleaDIMAnJisVyoktRw7yG3E/+POJb0kqJax8
	 Ss0YAjLW8Bivw==
Date: Mon, 23 Sep 2024 11:47:11 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] dts: nxp: mxs: Add descriptions for imx287 based
 btt3-[012] devices
Message-ID: <20240923114711.1c294b6b@wsk>
In-Reply-To: <CAOMZO5DJ4=ARZEcq+vbisA4kJBg+WFkH3G8-hYDkL82GQBEPBw@mail.gmail.com>
References: <20240912124825.2528984-1-lukma@denx.de>
	<20240912124825.2528984-2-lukma@denx.de>
	<CAOMZO5DJ4=ARZEcq+vbisA4kJBg+WFkH3G8-hYDkL82GQBEPBw@mail.gmail.com>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ilu4b09qMfQa=FASJqP83n=";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

--Sig_/Ilu4b09qMfQa=FASJqP83n=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Fabio,

> Hi Lukasz,
>=20
> On Thu, Sep 12, 2024 at 9:48=E2=80=AFAM Lukasz Majewski <lukma@denx.de> w=
rote:
>=20
> > +&lcdif {
> > +       pinctrl-names =3D "default";
> > +       pinctrl-0 =3D <&lcdif_24bit_pins_a>, <&lcdif_sync_pins_bttc>,
> > +                   <&lcdif_reset_pins_bttc>;
> > +       lcd-supply =3D <&reg_3v3>;
> > +       display =3D <&display0>;
> > +       status =3D "okay";
> > +       display0: display0 {
> > +               bits-per-pixel =3D <32>;
> > +               bus-width =3D <24>;
> > +               display-timings {
> > +                       native-mode =3D <&timing0>;
> > +                       timing0: timing0 {
> > +                               clock-frequency =3D <6500000>;
> > +                               hactive =3D <320>;
> > +                               vactive =3D <240>;
> > +                               hfront-porch =3D <20>;
> > +                               hback-porch =3D <38>;
> > +                               hsync-len =3D <30>;
> > +                               vfront-porch =3D <4>;
> > +                               vback-porch =3D <14>;
> > +                               vsync-len =3D <4>;
> > +                               hsync-active =3D <0>;
> > +                               vsync-active =3D <0>;
> > +                               de-active =3D <0>;
> > +                               pixelclk-active =3D <1>; =20
>=20
> According to fsl,lcdif.yaml, a remote-endpoint to the display is
> needed.
>=20
> See imx28-evk.dts for an example.

This file has the:
	panel {
		compatible =3D "sii,43wvf1g";

Whereas in those devices (i.e. btt3) - I don't know the names of the
displays - manufacturer buys them according to the timing properties.

Hence the question - how shall I proceed?

IMHO the most straightforward way is to modify fsl,lcdif.yaml to
not require "port" and "remote-endpoint" and instead add support for
"display-timings" and "timingX"

Especially that
Documentation/devicetree/bindings/display/panel/display-timings.yaml

are already defined and used by many imx boards (from imx25 to imx6q)
- git grep -n "display-timings"

Even the imx28-m28evk.dts is using the "display-timings" and not
"remote-endpoint" approach.


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/Ilu4b09qMfQa=FASJqP83n=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmbxOR8ACgkQAR8vZIA0
zr0RMAf+P+IBxVFol0awhUrlSAa6pvq0jmSf8oazCU+VunQD0ICMJEQBpxVd4jTN
Iz7ov8d6CQ1A2e5uJnG+O3va0aZ8mqmwQ6B1wosg+GtUJtQVpOkadJRx7uYs/JQf
L7ymVrgGQ7vC2xof5qG2mFKHK5AbjNAZNsThXUc8Nfo2wniCcene2bOMzykUfisN
cav071REJJVVkZ39RAhLy5mv9R61VQaLMgBPWQ+0Ps7xEr50w+er5qspcW+FQBMP
CVcfZ3VwQ8WYUGuyHzialbpTUcmJAM3MVb+9SdSxGYohjgyHsJpNhNcuHMBu4fET
1PyLx4J4PqB07xcRnKKymE7dsL5ZEg==
=BLj/
-----END PGP SIGNATURE-----

--Sig_/Ilu4b09qMfQa=FASJqP83n=--
