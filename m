Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7916233062
	for <imx@lists.linux.dev>; Mon, 27 Jan 2025 08:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737967581; cv=none; b=WN/QLdlDuvuisPLeEXGERuqFI21vU3VyXxQfq5mjfKDW8ptDZ4QxxzlrYHzZzbu479OW6KhBeWTr/6vPBuz67/eKmmH7D9Xd2hmL1xImsGxfBUSzrYTl54iTtW/u1WVXvR828Fx+cHkHwKQ+QmU4QO+VCkgSEp+etREAh/4n7uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737967581; c=relaxed/simple;
	bh=oflsJOOec4WWztBuFJpA8hs4acUDwTH5Ld1MJbbUHY0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SmmTmoPn6qe5uXsRN4yk284lTydYKSwQ0UnDB8x9DmGxG6npw1hUiDlFKlcszPzRMlEB8ZygBmWzFjSdz/H4tvnsNJxV3kJ8Bfx7MWAUlyNL/LmJgDZbFPLEHvjEeTwWthYgAMu0J2jfKhhhqXdd3jYRdLX4/ZqV+gJ1iOeqmBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Ncg/m0Uy; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Ncg/m0Uy"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 609D4103802C0;
	Mon, 27 Jan 2025 09:46:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1737967576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vu8WbV5HoQEeSN6onJ3P6ua3kZ0O/7C1HK5pPtVdu2o=;
	b=Ncg/m0Uyy+pp5ZYX852OvabB9aN7V44WCtmS/TFaQbhHP/VStPAkEF2IvYMuhbfneAYhTg
	ZhKVBe2gh/Dwj3gRGczXCf5uxmX5aA4IZBzeuykNPg2xmPDPYL1QM4K4tWE//gjY2BQSfz
	qeqTl2Fwr5yqzslrdq+3mzZR0NMaXHPdA+NEbP1J2o6/6EPsccwK3Glrj4T6GegdO6QQj9
	KKulvt/wxLQRGPWoJP3Jo6DdYIS9lATUHlMa7ci57JJDGLzBS2dyUxE5SPZ49h7Ub0Vkzo
	jlT+WKObUXoZzBjwykvRMHtfSihCXe4hscyDiEqTqBtd9Gi6vJzvXhC0EYyjJw==
Date: Mon, 27 Jan 2025 09:46:12 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan
 Wahren <wahrenst@gmx.net>
Subject: Re: [RESEND PATCH v11 1/3] dt-bindings: display: Add
 powertip,{st7272|hx8238a} as DT Schema description
Message-ID: <20250127094612.27f8fca3@wsk>
In-Reply-To: <1cde6d04-6fe9-4d09-a11e-26cef6bcf2af@kernel.org>
References: <20250109154149.1212631-1-lukma@denx.de>
	<20250120085724.5caf80af@wsk>
	<20250127091910.4184d9a0@wsk>
	<1cde6d04-6fe9-4d09-a11e-26cef6bcf2af@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/AIAMn5jyaeJmAnXYLmXxvJC";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3

--Sig_/AIAMn5jyaeJmAnXYLmXxvJC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

> On 27/01/2025 09:19, Lukasz Majewski wrote:
> > Dear Community,
> >  =20
> >> Dear Community,
> >> =20
> >>> This patch provides the DT Schema description of:
> >>> - powertip,st7272  320 x 240 LCD display
> >>> - powertip,hx8238a 320 x 240 LCD display
> >>>
> >>> Used with the different HW revisions of btt3 devices.
> >>>    =20
> >>
> >> Gentle ping on this patch... =20
>=20
>=20
> Merge window, not need to ping anyone, unless these are fixes. Are
> these? Do not look like.

Please correct me if I'm wring (or something has changed recently), but
wasn't there a policy that DTS bindings are allowed to be pulled no
matter if merge window is open or not?

>=20
> >> =20
> >=20
> > Gentle ping on this patch... =20
>=20
> Still merge window, really no need to ping twice.
>=20
> Best regards,
> Krzysztof




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/AIAMn5jyaeJmAnXYLmXxvJC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmeXR9QACgkQAR8vZIA0
zr30Wwf/aP+psctksxI1zRk+d4Tmnf6QH81RMXVaLB9Xc/VH2Aqui2i4f2zZURXF
NT9NVY+NZb5gzMzZNZlfILLqe5e7iMgVGvmHXBu/Fe83WERJhgMp6nKLjNO/QPLu
aYoMvJcXgB0ILb8U9bryTafgO8pVcc91wyts/w3xmwVqvrjjKAItyzey8g422agC
5DcfO/Pydc2+R7Z1GDemDyg2zm0OiHk/uR0CpZxLsHYJSFjR+VEbCrtlsbKNUufo
jAuJftrxfy9k0zWyN773HZVtluS18t8Sg9xS/MlV01+WZ/EYI8GqCJSKUbEFJr3Q
nZhmHmSe0vaMSTPfmPOTK0NDsj+0iQ==
=URYN
-----END PGP SIGNATURE-----

--Sig_/AIAMn5jyaeJmAnXYLmXxvJC--
