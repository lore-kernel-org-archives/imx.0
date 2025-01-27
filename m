Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774B66AAD
	for <imx@lists.linux.dev>; Mon, 27 Jan 2025 14:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737989585; cv=none; b=bhNqro7Aozea5am8sHjjKy52VunDGSlR8AAufjEkzvQtmYTDwADxVRC3uJ+lNUs9+Nw9jr2j6xML9FuTxutXZDHGu6To/5tPflcn3eEO7x9F7o3lRQNW6GWkZ92/TSsyUXBTzLa+HjzJcTL+SlcuLwhQvaKlQyU7E5i5XP8vS9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737989585; c=relaxed/simple;
	bh=JXIqoskXtxrkv2wUzb2QizyfvVbz4svASpayt5b6hjg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M60NTLi85a88R6Yn9VW+8Q779mbUpyrWFAazPYMVNQWckfnhMu0skg0FjKRXOUJBZ3ZPRSwweOP1nshBEVcCNv+ADC3UcggwA/D5TuRqv9McGd7Vbb/TiDH/WKwyDDEnfedld7Fi9OG88S5CO/sbWqbpdutLLdhSZCM6hdFKuGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=acxnt8HH; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="acxnt8HH"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 80AD6103802C0;
	Mon, 27 Jan 2025 15:52:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1737989580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CdF28R0lwLtzzeK4zWjgs0IHh1lVP07gYZEhtv8/W2w=;
	b=acxnt8HHx9qxDj4qWZ9eqLBAB9Cod/FYJYF7OYV7gALS4SJ29uquaXrbvJ3VyDVPeQUSGH
	NrBFhpWV5vnbCFV7WXQ3cZre5PA5bBUoQZG41kS95rmUW8ae1aWKaLCIRrTm9SVAUN/sCH
	/UsBye8DcK3JO8ajd6BOgdigawIUp1Ss7go6/kSmdhu2o5B3xw7fGxpYpPDK4+VxdNCRYK
	cqa3zNw4bqG/rpTvO2HbT03HTB/atu5SZoIsFf4vKpwGelgRYDX/0tXkjvVZktYBEYZ5rK
	t3sjZ/xW3SiKa9793jMHO87kamhBsHYeRIC+S3jOJg9nmDvEGcJMh82GqcZb+A==
Date: Mon, 27 Jan 2025 15:52:53 +0100
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
Message-ID: <20250127155253.06937c28@wsk>
In-Reply-To: <ebd9f9e2-3d8c-4deb-9962-5694cadec090@kernel.org>
References: <20250109154149.1212631-1-lukma@denx.de>
	<20250120085724.5caf80af@wsk>
	<20250127091910.4184d9a0@wsk>
	<1cde6d04-6fe9-4d09-a11e-26cef6bcf2af@kernel.org>
	<20250127094612.27f8fca3@wsk>
	<ebd9f9e2-3d8c-4deb-9962-5694cadec090@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/h/ql_liqhaaB_oe78.1H=Ly";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3

--Sig_/h/ql_liqhaaB_oe78.1H=Ly
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

> On 27/01/2025 09:46, Lukasz Majewski wrote:
> > Hi Krzysztof,
> >  =20
> >> On 27/01/2025 09:19, Lukasz Majewski wrote: =20
> >>> Dear Community,
> >>>    =20
> >>>> Dear Community,
> >>>>   =20
> >>>>> This patch provides the DT Schema description of:
> >>>>> - powertip,st7272  320 x 240 LCD display
> >>>>> - powertip,hx8238a 320 x 240 LCD display
> >>>>>
> >>>>> Used with the different HW revisions of btt3 devices.
> >>>>>      =20
> >>>>
> >>>> Gentle ping on this patch...   =20
> >>
> >>
> >> Merge window, not need to ping anyone, unless these are fixes. Are
> >> these? Do not look like. =20
> >=20
> > Please correct me if I'm wring (or something has changed recently),
> > but wasn't there a policy that DTS bindings are allowed to be
> > pulled no matter if merge window is open or not? =20
>=20
>=20
> Bindings? No such rule, no difference between bindings and any other
> thing. No non-fix patches are taken by maintainers during merge
> window, with some exceptions. There is a difference in DRM, though,
> because it follows a bit different cycle schedule, but you pinged us
> all, not only DRM folks.

Thanks for explanation - I've been mistaken...

>=20
> So was the ping towards DRM? Is their tree now open?
>=20

You mean https://cgit.freedesktop.org/drm/drm ?

Some work (i.e. code is pull) is done there.

> Best regards,
> Krzysztof




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/h/ql_liqhaaB_oe78.1H=Ly
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmeXncUACgkQAR8vZIA0
zr1jeggAn52s3WruRvdZ2n6gQj3Z4b2iDp63vBcu9ur9KYn4Zw3VWPuKH09ktc71
2zr0fZMg/Tp3ssOMjYknbeJok9X2pFMVnZMWnmfm/wEaHGfZOppJlA5vk1Eprq7M
yGsRTrwA9EMu+WophtwKDIkNJ68/Nr5t646H4EAYhybvBCMeQkEDSJu1K4tEDM0C
ZTG8aRsdZV/F4h+9O4hfRU4c8hew05PSySw+ZLIjAd0wp7OK6VPOtjqLCaqeJmUz
MsnnBqqM4WfHMZDkFN58p57A8ZJYzl29UVjiQ1eXsJjLxxskXNOneXJx+mMt0J6Q
yDP5qf3i0uzYIll0yNnkFXh4n0pz0w==
=bWIG
-----END PGP SIGNATURE-----

--Sig_/h/ql_liqhaaB_oe78.1H=Ly--
