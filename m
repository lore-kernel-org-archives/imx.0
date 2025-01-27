Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C61A15747C
	for <imx@lists.linux.dev>; Mon, 27 Jan 2025 08:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737965967; cv=none; b=hJtiRTcKLlVXfzuxQeOg/OwYqgpDkYH3Men/btxxC5ABYJpeSj/Lktdj1XbERW3SuYPC5HxdI/s+2DFc0uuMwDIX1fgpy7B+7vPwyJ3DG3KjP7j9VXXhUJpMCiv63+jmnq37qF3xJK1Ad5dI9ohllJ5WCx7UhzPfrgUg6j4rri4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737965967; c=relaxed/simple;
	bh=mFFIkyWYyZc3Hyi4Y0oYt1N2uuuB3kb8hUGM5QpIHJk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BwX2nwhCgGPWG/BwNiTfMAqDl9Z3PGNAw0OZgyEiYZ2H4h0yNCgfRWwfDP6TpGnKH7uBHg5q0DgiD2GwQiPAjT5RNh1e/8lqEWPzriIDQf274rRzhQeATrMHIVIf7a00aN0mq0Xi34FTtUU0fKjd9XlKvqanvE9IjoKGPAWxmy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=DhXpTVdz; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="DhXpTVdz"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7E18E103802C0;
	Mon, 27 Jan 2025 09:19:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1737965956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NCT04anDgidrJ2Slnl+cm4sx6kYglMx4fCsjq9WGLMo=;
	b=DhXpTVdzLbOQnFmcfSZxeBVJ4V6wrjZbNqNNNPIbYqQNoRDYV94fTRRPvFrcdOdhtj/xvb
	hR3dyNjSbZeahkvkWLQ4qZLhZUehJVl+GO8riGhK5j7k9lzdbhvtkxGp7kwlWcq7cBCZZb
	RYnmOtAx2ripiCDX5rKLqoD0dKJAAfzUItnSSUvj+LHjdFfAQNj3tmbIwvv34M5UDtxfmc
	YEudAYXbr6W1EsDLvgSIoU71As2RUpMV+9xS92G5HPu6jXN/FtA3J/x2ZYRaRQSnVbSnUg
	dKrDDl5S2kbYS1pCtJ/IZz4zyPQGSH2duBXRsKoKfQhzZ7UjNgIfOAQSdbP+4Q==
Date: Mon, 27 Jan 2025 09:19:10 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan
 Wahren <wahrenst@gmx.net>
Subject: Re: [RESEND PATCH v11 1/3] dt-bindings: display: Add
 powertip,{st7272|hx8238a} as DT Schema description
Message-ID: <20250127091910.4184d9a0@wsk>
In-Reply-To: <20250120085724.5caf80af@wsk>
References: <20250109154149.1212631-1-lukma@denx.de>
	<20250120085724.5caf80af@wsk>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/G/PBo.Dr_jQ5dzJPnc_toSO";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3

--Sig_/G/PBo.Dr_jQ5dzJPnc_toSO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Dear Community,

> Dear Community,
>=20
> > This patch provides the DT Schema description of:
> > - powertip,st7272  320 x 240 LCD display
> > - powertip,hx8238a 320 x 240 LCD display
> >=20
> > Used with the different HW revisions of btt3 devices.
> >  =20
>=20
> Gentle ping on this patch...
>=20

Gentle ping on this patch...

This patch is blocking adding DTS description for BTT3 device - as
Shawn shared that he will pull other patches from this patch set when
this one is in.

Thanks in advance for help.

> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >=20
> > Changes for v9:
> > - New patch
> >=20
> > Changes for v10:
> > - None
> >=20
> > Changes for v11:
> > - Combine both separate dt-bindings patches for powertip,st7272 and
> >   powertip,hx8238a into one
> > - Drop the quotes for in "title" entry of powertip*.yaml files
> > ---
> >  .../display/panel/powertip,hx8238a.yaml       | 29
> > +++++++++++++++++++ .../display/panel/powertip,st7272.yaml        |
> > 29 +++++++++++++++++++ 2 files changed, 58 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
> > create mode 100644
> > Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
> >=20
> > diff --git
> > a/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
> > b/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
> > new file mode 100644 index 000000000000..b7d74faeb5d5 --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
> > @@ -0,0 +1,29 @@ +# SPDX-License-Identifier: GPL-2.0-only OR
> > BSD-2-Clause +%YAML 1.2
> > +---
> > +$id:
> > http://devicetree.org/schemas/display/panel/powertip,hx8238a.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml# +
> > +title: Powertip Electronic Technology Co. 320 x 240 LCD panel
> > +
> > +maintainers:
> > +  - Lukasz Majewski <lukma@denx.de>
> > +
> > +allOf:
> > +  - $ref: panel-dpi.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: powertip,hx8238a
> > +      - {} # panel-dpi, but not listed here to avoid false select
> > +
> > +  height-mm: true
> > +  panel-timing: true
> > +  port: true
> > +  power-supply: true
> > +  width-mm: true
> > +
> > +additionalProperties: false
> > +
> > +...
> > diff --git
> > a/Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
> > b/Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
> > new file mode 100644 index 000000000000..f3622800f13f --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/panel/powertip,st7272.yaml
> > @@ -0,0 +1,29 @@ +# SPDX-License-Identifier: GPL-2.0-only OR
> > BSD-2-Clause +%YAML 1.2
> > +---
> > +$id:
> > http://devicetree.org/schemas/display/panel/powertip,st7272.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml# +
> > +title: Powertip Electronic Technology Co. 320 x 240 LCD panel
> > +
> > +maintainers:
> > +  - Lukasz Majewski <lukma@denx.de>
> > +
> > +allOf:
> > +  - $ref: panel-dpi.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: powertip,st7272
> > +      - {} # panel-dpi, but not listed here to avoid false select
> > +
> > +  height-mm: true
> > +  panel-timing: true
> > +  port: true
> > +  power-supply: true
> > +  width-mm: true
> > +
> > +additionalProperties: false
> > +
> > +... =20
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

--Sig_/G/PBo.Dr_jQ5dzJPnc_toSO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmeXQX4ACgkQAR8vZIA0
zr0WlAgA5K+fcR4Y0Nfs8bwh6939Z6/8F7YVza2aKhKiBdnn2Ii07rvD6bYxpOXt
HWyUIX9MazNNEaQFhK1fwXSOprsRJYN2+ihv3I9dGIK4qR9qLV9Z0RTb7JexykUJ
sfxqgQ3IVQRV4iEI6R/HE9zV56MFkBUa4km7BKTmp5ejkCwABl+1cNsBcHnzOQiM
pjiIUB7otxcE6KVJuXJHyVHQlNJdqrtPjprPcSOEXBQq1E41XDGiwHcQUAO9duT6
kiLSIvawGq2EkJwl+MwLIuf5IXSRedNRI/y9VIc6QHJfjzjZ450jCEamZL8S7Bh1
vA/aM5vQHS/9guw2v9ckYnUoYvsYtw==
=usBX
-----END PGP SIGNATURE-----

--Sig_/G/PBo.Dr_jQ5dzJPnc_toSO--
