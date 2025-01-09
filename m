Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7BF219A68
	for <imx@lists.linux.dev>; Thu,  9 Jan 2025 15:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736436737; cv=none; b=fVCT5CJmlTXw6sEsUtXa6q4QL4LJ7F45krOxDTVwsx3l17zXYXlwZvVU1GrunGymFwNv0KuYmZMmeszrdTlsMmUYmuFjfMbl1d4jeTAQVWnvh5/bHt17I9LK8/KVO1MHE3gBO5TaAY40Wkk+66WO90cskL50WeuUhqKZEjDwZQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736436737; c=relaxed/simple;
	bh=JVDZ97GiaRCzRrAZe9qbKxP2mzrC+lSfFhTq0cnbnA4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nm491tJzgFualaHKJ4Q2KM3/yoQ3fW+J18nrRrqcLRVoo8KiLU1CncxM2rhMgurCqbnzY020taw1M575Sh+vKMJxy3zECPgbkrISFYO158Rl6kRLJBCw4IpJ0unBxjg7aH2rT+UHdLRaoi98SvdEpOLRzqrjtuTrSfrcKXZ157I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=drknysd0; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="drknysd0"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2900C1040DBDB;
	Thu,  9 Jan 2025 16:32:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1736436733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6qIQP4o8cPCcK84STUOS+5JskiZRRSumAKuNK/Xi2io=;
	b=drknysd0IoZnLaRgsToztlyqJxLx4IHPiJhqIK3UmFsqqzRZOkWOKFbRxN8iNWWLneD7om
	twjqlg62pARiKDodOxy7DMj5Gf9U7rP1B9YpjBdZyQwrvliKbbi9Ack8TUfL+ePJ7zrk1i
	JSJUxxYErz+Eg+Jc+7Z7UESVgib4BBN7eblcvPrYDPt1vBdLyrx1d7JLOTAuVwRZGDG4jR
	CWdlscCAMxYxUTLDohyFdAm68gRXqfBguMoHUfoa52FLxiIMl63VKN1RwbTiBgHtFJuMzm
	UxXT9klNMQcTBYCRn+0bQfx0l9PvuXjEhwVX01EZiSswQ4YH6B1s+6pe3XoiYQ==
Date: Thu, 9 Jan 2025 16:32:10 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stefan
 Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH v11 1/3] dt-bindings: display: Add
 powertip,{st7272|hx8238a} as DT Schema description
Message-ID: <20250109163210.4c547941@wsk>
In-Reply-To: <CAOMZO5ABPnB9ov7jtEmDSZ=efNh_yx3JcqqS_UMTXgie=8PcTA@mail.gmail.com>
References: <20241107085705.490940-1-lukma@denx.de>
	<20241209105240.72d8d84a@wsk>
	<20241220112950.4673bb3f@wsk>
	<20250109153702.2d149023@wsk>
	<CAOMZO5ABPnB9ov7jtEmDSZ=efNh_yx3JcqqS_UMTXgie=8PcTA@mail.gmail.com>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4jR4l4k1/ssXQBq5AITFnzz";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3

--Sig_/4jR4l4k1/ssXQBq5AITFnzz
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Fabio,

> Hi Lukasz,
>=20
> On Thu, Jan 9, 2025 at 11:37=E2=80=AFAM Lukasz Majewski <lukma@denx.de> w=
rote:
>=20
> > Gentle ping on this patch ... =20
>=20
> You missed copying the drm folks:
>=20

Ech....

Thanks for pointing it out...

> ./scripts/get_maintainer.pl
> Documentation/devicetree/bindings/display/panel Neil Armstrong
> <neil.armstrong@linaro.org> (maintainer:DRM PANEL DRIVERS) Jessica
> Zhang <quic_jesszhan@quicinc.com> (reviewer:DRM PANEL DRIVERS) David
> Airlie <airlied@gmail.com> (maintainer:DRM DRIVERS) Simona Vetter
> <simona@ffwll.ch> (maintainer:DRM DRIVERS) Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com> (maintainer:DRM DRIVERS AND MISC
> GPU PATCHES) Maxime Ripard <mripard@kernel.org> (maintainer:DRM
> DRIVERS AND MISC GPU PATCHES) Thomas Zimmermann <tzimmermann@suse.de>
> (maintainer:DRM DRIVERS AND MISC GPU PATCHES)
> Rob Herring <robh@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED
> DEVICE TREE BINDINGS)
> Krzysztof Kozlowski <krzk+dt@kernel.org> (maintainer:OPEN FIRMWARE AND
> FLATTENED DEVICE TREE BINDINGS)
> Conor Dooley <conor+dt@kernel.org> (maintainer:OPEN FIRMWARE AND
> FLATTENED DEVICE TREE BINDINGS)
> dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS)
> devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
> DEVICE TREE BINDINGS)
> linux-kernel@vger.kernel.org (open list)




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/4jR4l4k1/ssXQBq5AITFnzz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmd/6/oACgkQAR8vZIA0
zr0f4gf/f8yftAgVjy6z69N/UrrRfN2tMTztQtXrjdV0XCD5sm67rgsZL5NQKzet
2AzvICsWK+dZYUSRXnolPAKQEsOiRhBQskEi4q6GlmnHYQE7cIH8P9pTo01QXmYv
K6qYnujJDAD0sqB1cVPbRVcn0a4vKq3oQqJ8EkfZcJhmkZ90gbheaoYri5rcat3z
qw5UolyLN0xQ0WH49k2fWUDIVh5gwCdmrbOCfB8zi6rTjdbpAThRSim7ZVBqVblC
y4mT4zfG3xd2x71vvpNb95bcgfw5sG/slrQaZOU6W+BlmL3ov9MHBFOk1xdQIUEe
yIT60upWr2ovwklJlyeKFywq/99fwA==
=TdZH
-----END PGP SIGNATURE-----

--Sig_/4jR4l4k1/ssXQBq5AITFnzz--
