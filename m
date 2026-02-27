Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B921A9F97;
	Fri, 27 Feb 2026 17:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772213228; cv=none; b=sn2Ow3eMAdkeprfdpZntR6/svQVctjFpI3wPsosfpZ9UWeuHIpPs1Omr81gGrrJ+v0IpomkGu0p3YDKOfh88HufDrvRd4dCWzYU2mOBJZQ1AI/DFUvbPK0slFRKZxO35xVfDmf6Djq/AkR1vjVz0OPJbldiux8Qz9vHNhqvNx2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772213228; c=relaxed/simple;
	bh=bcn5wFs5m7gWhDJikEy9bDKmimvddmJAKhotMLmplJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOprXNBKOsk7YtmodMNVP1vHdMhf958NJrz15JKvZwyHIsfA5mMibD+neZFCvgN+i+/3ouWXHAanrnvoiDGPLoY57NS8gOusooBMJlRgHmoxfJCCnOSVSkCNnl//d9Km5s25HoF8qjkNfFwCKoli1El0kLJPoWdLn/HAQhFT4JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dw+P43iu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dw+P43iu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E94F3C116C6;
	Fri, 27 Feb 2026 17:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772213228;
	bh=bcn5wFs5m7gWhDJikEy9bDKmimvddmJAKhotMLmplJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dw+P43iuJSpMOKl89mCuzmauarmiMeQfZPNq6LPHLN9RXMWEuF2J4UHcpUcXOJ3rt
	 x5RpaJ7Sst6lMgQSeGssl+HcrPqfcVm2b+bZZTujano+MTrhfZXRcq417YCsXkoFxj
	 uhECvtjj4BGkWXubWLQ7XpdkL8GTQKVUQGe6yt6dM4qMDIpuHWs1NhHhHGp/h8/mC5
	 u0Ywjt/UPiT0KRgC5e0Iyj2ZcZqMmMss85VEhZFJgmoy8TJ3+pUQynIleb17VoZXLb
	 vBQ13huzPtgEBtrYbSXiFYLPsEnk3kzS1ZXnCvYzvDowZ6P8eiNoZre+eBVkDxTF08
	 cTxvGYERvrtkg==
Date: Fri, 27 Feb 2026 17:27:03 +0000
From: Conor Dooley <conor@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, Robin van der Gracht <robin@protonic.nl>,
	Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: auxdisplay: Use
 unevaluatedProperties to fix common property warning
Message-ID: <20260227-recolor-eel-d252ce0ca1f1@spud>
References: <20260227165836.3445577-1-Frank.Li@nxp.com>
 <CAOMZO5AGwAAU3j0t62CaqNZF7tmyKoWv38ymB1i5i+xnprwJWQ@mail.gmail.com>
 <20260227-overplay-preacher-d6ed143edc5f@spud>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4iPMDdASslo7GJvP"
Content-Disposition: inline
In-Reply-To: <20260227-overplay-preacher-d6ed143edc5f@spud>


--4iPMDdASslo7GJvP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 05:26:09PM +0000, Conor Dooley wrote:
> On Fri, Feb 27, 2026 at 02:05:23PM -0300, Fabio Estevam wrote:
> > On Fri, Feb 27, 2026 at 1:59=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wro=
te:
> > >
> > > Change additionalProperties to unevaluatedProperties because it refs =
to
> > > /schemas/input/matrix-keymap.yaml.
> > >
> > > Fix below CHECK_DTBS warnings:
> > > arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dtb: keypad@70 (holtek,ht16k3=
3): 'keypad,num-columns', 'keypad,num-rows' do not match any of the regexes=
: '^pinctrl-[0-9]+$'
> > >         from schema $id: http://devicetree.org/schemas/auxdisplay/hol=
tek,ht16k33.yaml#
> > >
> > > Fixes: f12b457c6b25c ("dt-bindings: auxdisplay: ht16k33: Convert to j=
son-schema")
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > Change in v2
> > >         - Add Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > >         - Add fixes tags
> > >
> > > Resend include Rob's Ack tag:
> > >         Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > > Rob's Acked at
> > > https://lore.kernel.org/imx/175796984570.3379405.7210704746413204244.=
robh@kernel.org/
> >=20
> > Rob's Ack is still missing.
>=20
> How do you get this wrong multiple times? Just use b4 to get your tags
> Frank.

Also, I complained about the subject not citing the specific binding
IIRC on the previous version and that wasn't fixed either.

--4iPMDdASslo7GJvP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaaHT5wAKCRB4tDGHoIJi
0u/HAQCd43YsXdc9BsBp8h3SJ2TDHh5mEf7TsaxAISZRGB/pRgEAyJwGBm5yo7mL
Y1tX++S8k1/KSo0481Rlh9uayvhPxA8=
=B64b
-----END PGP SIGNATURE-----

--4iPMDdASslo7GJvP--
