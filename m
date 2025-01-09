Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C8E21A457
	for <imx@lists.linux.dev>; Thu,  9 Jan 2025 14:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736433435; cv=none; b=L3YgFL1ltA/O8yfW1Mb9MvsPljZKTxm0UcI08fBIMN2LiOWFWW7eqOdisYrP5rgXkeEK7hvxbLY5atEZ3k8Bzc08w74rBKRJ/DtHxS1OWLeP8fGQwNbhspEMzO8KIg/UDZi5ALfZN2qyQpB9OqPKQ7v/Gp2LU3Jii+vy14nldK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736433435; c=relaxed/simple;
	bh=k9ZU2U4p5XuvziVR5uSHFYVltJ1IhGYYMGVoIiq9MHA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ISpvpp8Ezpdw4uW+U3GZHl+sR83tygL5AkMh00ShdDJuSTPAfXt4qZSjbWglsUNUuot/ISySVVrglX0SUjQy+yoHocZylmz+vcaM/m/g0tGF8h/7/yb9JAZecrW7Dnw+CrvPvcynbcWXdCPXvKJT96gQ0hKoVwqblVDhP0W1kfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=bXnEQ+r3; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="bXnEQ+r3"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 54FC110408FB6;
	Thu,  9 Jan 2025 15:37:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1736433425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=is0wzx5VfaQSS39zqezax6hpD2UoDB/5ZSK9ROPQWV4=;
	b=bXnEQ+r3aWt8kayLcG4mq6vJk5x/OzJlwKfDOKs5xgBItImGeL82S77YsUyZ34sEAF+aqB
	ffV/5Hi5Ty2KKupNvZ0Wz8uFqn6YBbF4l++7uaK2RrtOj2FGA3dfNCe6Dx0rT6uURjv95B
	N7/ndSXrr85RSHpONv9m20IUvNAqa6POq2KCLDjzqXu4IWcJy9SJDkTxd/p8VP9EKlbukR
	UhvYa1qh1OBbtm3iIQ3a2VRcWoJ44JqSkgExRA9AgINcxuFWWW9Rd+h9IrWEyyReluOZdK
	M8cQIpkf1EUsLQDuRZHJQ+2TDSPLyE6f+wqkXENJzWXWhe2pJ09o31tgvdhljw==
Date: Thu, 9 Jan 2025 15:37:02 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan
 Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v11 1/3] dt-bindings: display: Add
 powertip,{st7272|hx8238a} as DT Schema description
Message-ID: <20250109153702.2d149023@wsk>
In-Reply-To: <20241220112950.4673bb3f@wsk>
References: <20241107085705.490940-1-lukma@denx.de>
	<20241209105240.72d8d84a@wsk>
	<20241220112950.4673bb3f@wsk>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/zzrtl27UrGiMrDDp8vKZoSh";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3

--Sig_/zzrtl27UrGiMrDDp8vKZoSh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Dear Community,

> Dear Community,
>=20
> > Dear Community,
> >  =20
> > > This patch provides the DT Schema description of:
> > > - powertip,st7272  320 x 240 LCD display
> > > - powertip,hx8238a 320 x 240 LCD display
> > >=20
> > > Used with the different HW revisions of btt3 devices.
> > >=20
> > > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > > Reviewed-by: Rob Herring <robh@kernel.org>   =20
> >=20
> > Are there any more comments for this particular patch?
> >=20
> > If not - can it be applied as it prevents dts patchs to be pull by
> > Shawn. =20
>=20
> Gentle ping on this patch ...

Gentle ping on this patch ...

>=20
> >  =20
> > > ---
> > >=20
> > > Changes for v9:
> > > - New patch
> > >=20
> > > Changes for v10:
> > > - None
> > >=20
> > > Changes for v11:
> > > - Combine both separate dt-bindings patches for powertip,st7272
> > > and powertip,hx8238a into one
> > > - Drop the quotes for in "title" entry of powertip*.yaml files
> > > ---
> > >  .../display/panel/powertip,hx8238a.yaml       | 29
> > > +++++++++++++++++++ .../display/panel/powertip,st7272.yaml
> > > | 29 +++++++++++++++++++ 2 files changed, 58 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
> > > create mode 100644
> > > Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
> > >=20
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.ya=
ml
> > > b/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.ya=
ml
> > > new file mode 100644 index 000000000000..b7d74faeb5d5 ---
> > > /dev/null +++
> > > b/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.ya=
ml
> > > @@ -0,0 +1,29 @@ +# SPDX-License-Identifier: GPL-2.0-only OR
> > > BSD-2-Clause +%YAML 1.2
> > > +---
> > > +$id:
> > > http://devicetree.org/schemas/display/panel/powertip,hx8238a.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml# +
> > > +title: Powertip Electronic Technology Co. 320 x 240 LCD panel
> > > +
> > > +maintainers:
> > > +  - Lukasz Majewski <lukma@denx.de>
> > > +
> > > +allOf:
> > > +  - $ref: panel-dpi.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - const: powertip,hx8238a
> > > +      - {} # panel-dpi, but not listed here to avoid false select
> > > +
> > > +  height-mm: true
> > > +  panel-timing: true
> > > +  port: true
> > > +  power-supply: true
> > > +  width-mm: true
> > > +
> > > +additionalProperties: false
> > > +
> > > +...
> > > diff --git
> > > a/Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
> > > b/Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
> > > new file mode 100644 index 000000000000..f3622800f13f ---
> > > /dev/null +++
> > > b/Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
> > > @@ -0,0 +1,29 @@ +# SPDX-License-Identifier: GPL-2.0-only OR
> > > BSD-2-Clause +%YAML 1.2
> > > +---
> > > +$id:
> > > http://devicetree.org/schemas/display/panel/powertip,st7272.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml# +
> > > +title: Powertip Electronic Technology Co. 320 x 240 LCD panel
> > > +
> > > +maintainers:
> > > +  - Lukasz Majewski <lukma@denx.de>
> > > +
> > > +allOf:
> > > +  - $ref: panel-dpi.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - const: powertip,st7272
> > > +      - {} # panel-dpi, but not listed here to avoid false select
> > > +
> > > +  height-mm: true
> > > +  panel-timing: true
> > > +  port: true
> > > +  power-supply: true
> > > +  width-mm: true
> > > +
> > > +additionalProperties: false
> > > +
> > > +...   =20
> >=20
> >=20
> >=20
> >=20
> > Best regards,
> >=20
> > Lukasz Majewski
> >=20
> > --
> >=20
> > DENX Software Engineering GmbH,      Managing Director: Erika Unter
> > HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell,
> > Germany Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email:
> > lukma@denx.de =20
>=20
>=20
>=20
>=20
> Best regards,
>=20
> Lukasz Majewski
>=20
> --
>=20
> DENX Software Engineering GmbH,      Managing Director: Erika Unter
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email:
> lukma@denx.de




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/zzrtl27UrGiMrDDp8vKZoSh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmd/3w4ACgkQAR8vZIA0
zr1Jfwf/XyJG7WjdWC+SAb10s3s+rrOoXQCD+ORWLwk/26QdW4FdjElnNmXlEVgz
o/yvu1+OE3UFXmX/LNrwLaZB5NtA+qK57AMIAKg+ukxoft5Qa3bHrq2H/N5Usyew
lIwUKJzsibEbzfRlPJzltIKJ5k+303iwBE4BRa6FHHrtpVoPkEIx2HUJ0YVVfZa7
nIke3BNs3MlseuZh0LHY2344IWZcBaifpiaokADVsoCME2mQtdmguIGBNpZmSv3P
Xf0dylY/DV0BcHR698IZGJYVmW7+sryhWfM1l0MeSaZ5vW+WR2SiZ0vfHM5mEntD
bCh5eRq/Png33nWF5TMyi/+ZjPk1dA==
=dl+C
-----END PGP SIGNATURE-----

--Sig_/zzrtl27UrGiMrDDp8vKZoSh--
