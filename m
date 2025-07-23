Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348601F8AD3
	for <imx@lists.linux.dev>; Wed, 23 Jul 2025 21:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753305117; cv=none; b=cijhNmKpfoahH6SX2W5uFadY1i04IjLI8eGVT0FDS7HeVKC9FftXbybzC4U/YNlVFcyPP65CbIsYd6ua6BmOIaZ66ojO6eRsUwvekfDgU28THLpRX1lj0j31bOsvpRg74OfqCQdlJmGfQpUGxm8SrzzHilYACU4tAwpLOZLfHWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753305117; c=relaxed/simple;
	bh=q0mE4UUBWfCV+wTusBCOf5CCslH2279SZu5XfCB7RLY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UXfi32LP2+H60u+VCrLiFvkoHdQiFJB/w7DH2Tc8ofLiUow/dPXeQo6CDk1lL6+O4KETU5wX5DeSeYLMFmZ5b9Z/egHj3UEX/vzWG0bHNniMKaPlXDvJ30cZEpTp4Q+XHyVH4vf1vQ7FISiB/HBU5VNMe/EzakZiPFwYLpDXKsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=fRMF/9wp; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="fRMF/9wp"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B4021026ADA7;
	Wed, 23 Jul 2025 23:11:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1753305113; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=q0mE4UUBWfCV+wTusBCOf5CCslH2279SZu5XfCB7RLY=;
	b=fRMF/9wp7KlMF/vwBka+uclAaSlW7YKY/JnQQJxJbt/Vy4/EXLXSlhWO8w3MOS08JzX0Yv
	34ERCNVYApCkC0605fFmqgxYmbl7Ss+2tbY14/xoT5syVwrDncCYVfoesmUeGXSmdxX4tm
	Jhz724Z9cn8fGKyPElCSDKu7KvVhWcKP1Tkio5QROCo1UlkZ7S2M7tOji0w/TWjMs3PU1F
	3x7fYX9RJcOuPfU//SvkYSk8N2659arFmkf8Rw80d7QlD9psltkXvneHbXWPb+sm27fYi9
	K6W+yWXFw1LUvPtxf6IUnTEr7jWpQ77DcceVACvs/FhOXalVjAEb0rC1azIfkQ==
Date: Wed, 23 Jul 2025 23:11:48 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>
Subject: Re: [net-next v15 06/12] net: mtip: Add net_device_ops functions to
 the L2 switch driver
Message-ID: <20250723231148.3c7448a5@wsk>
In-Reply-To: <20250723131704.1f16a13a@kernel.org>
References: <20250716214731.3384273-1-lukma@denx.de>
	<20250716214731.3384273-7-lukma@denx.de>
	<20250718182840.7ab7e202@kernel.org>
	<20250722111639.3a53b450@wsk>
	<20250723220517.063c204b@wsk>
	<20250723131704.1f16a13a@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/M8WPw5wCXj1LYwZ0GVHQLmu";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3

--Sig_/M8WPw5wCXj1LYwZ0GVHQLmu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

> On Wed, 23 Jul 2025 22:05:17 +0200 Lukasz Majewski wrote:
> > Do you have more comments and questions regarding this driver after
> > my explanation?
> >=20
> > Shall I do something more? =20
>=20
> Addressing the comments may be more useful than explaining them away.

As I've already described what are the issues I try to solve (and some
design decisions), I will correct them (where applicable) and prepare
next code version.


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH, Managing Director: Johanna Denk,
Tabea Lutz HRB 165235 Munich, Office: Kirchenstr.5, D-82194
Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/M8WPw5wCXj1LYwZ0GVHQLmu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmiBUBQACgkQAR8vZIA0
zr1uVwf/ZkcfzdhljMsZvGmXGsgINoyLcSM9aaTPSiBsJLo6kHbkhO5BQ45r7aFs
PAq5vR7/YlMNpmne5x86thl3jp7jjUobLRAee/jyLDCpsSWsC8P4Iq1ogX1J4GGY
YR+MYHjNWFsd8t/77fQA9NXYqf+EEay3tTgk8g72rftPmbOvR+JUSI+x2LFbZ3hd
lo14UI23C3C1QCfTMGtySwQDFAtve9Da/rBxhgkz2OVQs5z4tTeRl9NTCbyj/FEx
4bisM6SJrcKXKP7w3gOMdbu9XGmvOIzbd5tIhAY7W7l+ck7Izs6KwNRxcHMciDvT
2Ogt8uTTtktdP5xgf6bqBrlTDKYwlg==
=XciX
-----END PGP SIGNATURE-----

--Sig_/M8WPw5wCXj1LYwZ0GVHQLmu--
