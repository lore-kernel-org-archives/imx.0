Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF77185B62;
	Wed, 22 Jan 2025 18:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737570420; cv=none; b=XhorQTiOiSnCkH4uyM71EzlDru5Kd0qPIMBRkoqCZZSpZyDUqNyKLtGO1oGmhXeZsIrY5Ugvpul5nFVfzTo0qlFpFBr5kvUC4o6soeMvd5ss3X3FtDt9exkUSw6eQ+SJeP+O5a4DfvrtDt0g+ymQOs6GErhTw0DIKRAfeQzHL1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737570420; c=relaxed/simple;
	bh=Q+sJ40zBAhXNyM5+7H2SDONfRCEukX+la4Ys4RjzEr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXdlVl7kLja1/8q3p0wFCj24UHfK5zoTKO78ES2RgfQKh7MPLMGYfk8PRQOEdOKVHHzqNVNCePPoIgaKlXGVfdmbdZ4QBAjkdJeOiNt21tvwW0upUi3QMKr45gA/gFeg8ItIcuBEc4VoKmwjRfg/5t5ZtWZLa9Jb2pK48Y3h5rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pX5DCPAw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pX5DCPAw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E74CC4CED2;
	Wed, 22 Jan 2025 18:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737570420;
	bh=Q+sJ40zBAhXNyM5+7H2SDONfRCEukX+la4Ys4RjzEr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pX5DCPAwGd8XJlAcwCjZS7/TvZBiKO4OOj1cNFM+YP0iDnM9bgSH/FQE2nyR1c8qV
	 SoVFFzxNrRnJO+nIFJ7TzyDz8Fr9af7kwKiRgeqXB4OZBnkQ6U/WHr1Qd0jNi6Tb9t
	 efU68epX+//wQU/fqR32UVkdWBedD+Bngzhx9Xrrq4uy9ZBTJiB0vAk9/6P2fpmngV
	 oivqHn/8hLl8jy/vBhsyh1iTlVSRl1JQnSGxfgicHC6qLxjaS77tpNMKU4YHXgNePR
	 FIz46E+v7VxSSpaVcG0SVagOR+gMf8hDNUY8a6yc2F08J1C4fn98y9d2Z7w8863ev4
	 AvZUTNe+oP2qA==
Date: Wed, 22 Jan 2025 18:26:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [EXT] Re: [PATCH v12 2/5] dt-bindings: arm: fsl: add imx-se-fw
 binding doc
Message-ID: <20250122-feed-empathic-4954564d95ba@spud>
References: <20250120-imx-se-if-v12-0-c5ec9754570c@nxp.com>
 <20250120-imx-se-if-v12-2-c5ec9754570c@nxp.com>
 <6110fd00-c050-4bcf-8971-674bc8c0bfc7@kernel.org>
 <AM9PR04MB86049239156AC82F0AA4BCCA95E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <000e44f1-839e-4f43-9bb1-ae53d6826ff7@kernel.org>
 <11880309-5021-4038-a4eb-a3a80da71550@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AmcLC6ZH7ugu6oqW"
Content-Disposition: inline
In-Reply-To: <11880309-5021-4038-a4eb-a3a80da71550@kernel.org>


--AmcLC6ZH7ugu6oqW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 11:35:50AM +0100, Krzysztof Kozlowski wrote:
> On 20/01/2025 16:01, Krzysztof Kozlowski wrote:
> > On 20/01/2025 14:07, Pankaj Gupta wrote:
> >>> Driver configures multiple misc-device on the MU, for multiple
> >>> user-space applications, to be able to communicate over single MU.
> >>>
> >>> It exists on some i.MX processors. e.g. i.MX8ULP, i.MX93 etc.
> >>>
> >>> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
> >>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> >>> Reviewed-by: Conor Dooley <conor@kernel.org>
> >>
> >>> Where Conor's review tag was actually given?
> >> On v6.
> >=20
> > I already looked there. No trace for tag. Please point to the message.
>=20
>=20
> Still no answer from you, except that evading answer, so let's be clear:
> don't create fake tags.
>=20
> Clean your patchset from all fake tags and keep only the ones which were
> real.

Ye, I don't see that R-b given either. My guess is that somehow "go for
it :+1: was interpreted as one, but it certainly was not meant to be
one. Converting that to a tag is definitely not okay. Seems it appeared
in v9 after Rob prompted about /his/ missing review from v8. I never use
my k.org email in tags, so that is an immediate red flag. I think I never
re-opened this thread after seeing that Rob had approved it back in v8,
so I never noticed. Only by chance that I opened in now.

Thanks for spotting it :)

--AmcLC6ZH7ugu6oqW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ5E4bgAKCRB4tDGHoIJi
0v8/AQDUg11QxpssLFmCOzFjPrBV3rDvFSXKMi4tkZxmbAb1rgEA6rnCv9zbtejU
growuDDxx9odvXR3iA6s6XV+J3V9VAA=
=CXkd
-----END PGP SIGNATURE-----

--AmcLC6ZH7ugu6oqW--
