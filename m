Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0DB1D517D
	for <imx@lists.linux.dev>; Thu, 17 Oct 2024 12:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729167505; cv=none; b=jpe5y+DC279GTBW5SJkfIVAWTLImhIYnWhy3iP1Gzw/juyE34LFCeYpRRC7NWACO2En8gXjx54d0yaCOLTZaDkUArG4+I7l2MEObUkC2FYCB4xJZEDfGzaA90uMKs+Ugs1s1XJBS6dLQxvJQdeu5Ewdolha+q8g6WzGpUrEXh08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729167505; c=relaxed/simple;
	bh=gt8gvpe6J2AdHwJ+LUNpkrX8JWv+1a66G9T6SpCOtLA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gdmh8vOlhq9CRN+95/XNVzzHRzFh82MnARTtUuhc5B9FXQg1oOylvkPvGX4zAKCn5W2Ao89x/azofaZmJDINSFMSxmaYy3rBCgW6dTCgn1hTirOeJr2u4kddMttM++7nUEkNlIRqJti8Lq4w0H7yO/xcWTxwY/Hy72zEUm1MHNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=q74oSr2O; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="q74oSr2O"
Received: from wsk (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id DEEC288B0C;
	Thu, 17 Oct 2024 14:18:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729167500;
	bh=pVUgWkPelntpCEb7Gok5hnVy4nS3JZLLW/8rBG0KN2I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=q74oSr2OPreCTa+OV9WA3F1v4onZTttSfbgIuzwylZRRdDkFpXYw2no75iEuMs2ZN
	 6mBoYNmLP/tn6SAmATsJv7KfGXQF0x2pAGB+Q0rWVS99YU4/FmpFBBDdhyIOFy1pe/
	 x1pra9iI57+Gkn0OPTKDtEwUCXYs0B7ojs318dRTk1xtOvVCXmK1hRs0N/znVLgUuZ
	 o/JZwZGiD9ffzqfCfl/Qt9IVTIYDG1JRzfu4uuHu+37bIdK7dVvMkHZvncZXVr/N8c
	 Wp46fVG/IpqzakpfsPm7he3HXoClJ4DmlQmUUmfBWHzYQuwFzzvDjUeFCAYeIMfYYd
	 SC1P+5j0M6Mlg==
Date: Thu, 17 Oct 2024 14:18:18 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Stefan Wahren <wahrenst@gmx.net>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/2] ARM: dts: mxs: Add descriptions for imx287 based
 btt3-[012] devices
Message-ID: <20241017141818.2cf462ce@wsk>
In-Reply-To: <CAOMZO5DkmU4C0YQoVwCbHTBo=DTRGcz+9K1qHY=3V29eWAfEKQ@mail.gmail.com>
References: <20241010081719.2993296-1-lukma@denx.de>
	<20241010081719.2993296-2-lukma@denx.de>
	<20241017103534.259584f6@wsk>
	<CAOMZO5DkmU4C0YQoVwCbHTBo=DTRGcz+9K1qHY=3V29eWAfEKQ@mail.gmail.com>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JwpjArDAe6QUo9hHvQoT_3b";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

--Sig_/JwpjArDAe6QUo9hHvQoT_3b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Fabio,

> Hi Lukasz,
>=20
> On Thu, Oct 17, 2024 at 5:35=E2=80=AFAM Lukasz Majewski <lukma@denx.de> w=
rote:
>=20
> > Stefan, do you have comments for this version? =20
>=20
> Rob's bot reported new warnings after applying your series:
>=20
>         from schema $id:
> http://devicetree.org/schemas/display/panel/panel-dpi.yaml#
> arch/arm/boot/dts/nxp/mxs/imx28-btt3-2.dtb: panel: compatible:
> ['panel-dpi'] is too short
>         from schema $id:
> http://devicetree.org/schemas/display/panel/panel-dpi.yaml#
> arch/arm/boot/dts/nxp/mxs/imx28-btt3-1.dtb: panel: compatible:
> ['panel-dpi'] is too short
>         from schema $id:
> http://devicetree.org/schemas/display/panel/panel-dpi.yaml#
>=20
> Please address it.

The problem is that I don't know the name of the display itself
(different vendors) [*].

Schema requires following syntax:
arch/arm/boot/dts/ti/omap/am437x-gp-evm.dts:89:         compatible =3D
"osddisplays,osd070t1718-19ts", "panel-dpi";

arch/arm/boot/dts/ti/omap/omap3-thunder.dts:86:         compatible =3D
"samsung,lte430wq-f0c", "panel-dpi";

which require two compatible entries - one specific type of the display
(e.g. "samsung,lte430wq-f0c") and the second one generic ("panel-dpi").

As I don't know what is the manufacturer of it - I can add:

 compatible =3D "foo", "panel-dpi";

and then Schema and Rob's scripts would be happy...


Another option is to adjust the
Documentation/devicetree/bindings/display/panel/panel-dpi.yaml to allow
only single entry.


[*] maybe I can obtain the info regarding at least one vendor ...

Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/JwpjArDAe6QUo9hHvQoT_3b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmcRAIoACgkQAR8vZIA0
zr1NHwf9EZhOkrZrNMYoRDxZ9kwVP/qQ8IcrI4dlPE+B2zHqZNUIecNWsoTdeasW
83zprstpywZTQvmkC5Np4qFQTNvFsdDPFXK9IgEnoJnHGlqFWF2YETLRFmE73cCK
wzXpipCZcM9N14gByMrctugXelTRPos6Wxfg5JTBCqi/6MZKVM4I0kf4xlbxWqO6
68uqCSF7eAfzsWrkC8+JRQm5GNuJ8mnMWrsbaq82i4t6wmYFyMByobXPO3D9LAZj
7i7jEknC1TrGAvF9x2c6/I/5X1oCUylWKe85xnHr0MAokKV91TWOiJHEv13y+DOj
lTDYew5AUH05crsTgunWSE8645E07A==
=x9MY
-----END PGP SIGNATURE-----

--Sig_/JwpjArDAe6QUo9hHvQoT_3b--
