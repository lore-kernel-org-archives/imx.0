Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E7C192580;
	Mon, 30 Sep 2024 14:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727708079; cv=none; b=rJ+rJ2gLJYCCAVF2cNNX0Htf5dPz1L+j7vbjvPThvXV2y4L3IPl5hoO/HLuG53vHKFFgIh0ho01K6iaKYGqBaMxFdAvVLsXFRkNm5VW7hbPQZH4H/hTyhh66WTc7jlbTi8JMHSp/wjDWaxxDR76mmkxhI0WcXjQslQF31SDLWLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727708079; c=relaxed/simple;
	bh=yHz+HqtCHC83WSkLLK6bPyeJEEQZt60aErkk1WVXJoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pS2sMAi045GYfoNY6wPLuRjDDlwUXDkKnem1I4dKoNjI4Ad9MkySuxpTqpDyvn7d9fqWzlzQbiglWq+HD+ETQj7YaOWC4aBLu3IGLaDW5fynmJVklStgrkF5gDb4t1j8o+q58nQcPBdyWg32gkJ2aXIluhshupAwMy0UpQK4I68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N45EoeQg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N45EoeQg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE236C4CEC7;
	Mon, 30 Sep 2024 14:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727708078;
	bh=yHz+HqtCHC83WSkLLK6bPyeJEEQZt60aErkk1WVXJoo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N45EoeQgaLTmd7WBql3abq8jJzFj75BYqMqlP4Qx0NgyEn8269WHt4HIMtaVMaAlr
	 dXwbuBuLajuuvKlfAhwVT2tuWQx3iNcq+7crYqxN6gRWMsGdhuTpqo9zhG/b9RZNpv
	 WrLBrVou3sCOHFMQGp/U+qKpaOMbO+fz9z6rV//9xJdXqdHF/eO8G5FHHfBgbIQ3Dd
	 JRq03vCpg3VX1yNsyD57i6sx6+mzoCB9JWA2V2/ukJloTUTZ3RhCQ22nSmdMaK78t+
	 kw2899YtsaKirzGLtXyE3Q37vbapA/663j4qpMjO4azjAoechFqoLZ3cotqVeg87F9
	 U5iRlGu7W0prQ==
Date: Mon, 30 Sep 2024 15:54:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, kernel@dh-electronics.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Document DH electronics
 i.MX8M Plus DHCOM PicoITX
Message-ID: <20240930-smokiness-tricolor-f649d01e7ec0@spud>
References: <20240928234949.357893-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uQ7vq3tWddTOPZN2"
Content-Disposition: inline
In-Reply-To: <20240928234949.357893-1-marex@denx.de>


--uQ7vq3tWddTOPZN2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 29, 2024 at 01:48:08AM +0200, Marek Vasut wrote:
> Document support for DH electronics i.MX8M Plus DHCOM SoM on PicoITX carr=
ier
> board. This system is populated with serial console, EQoS ethernet, eMMC,=
 SD,
> SPI NOR, LEDs and USB 3.0 host used in USB 2.0 mode on PicoITX.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--uQ7vq3tWddTOPZN2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvq7qAAKCRB4tDGHoIJi
0tuHAP411326zmUIUamXX8Tvex7dncg8LcBfKQcqgOIp/ASN5gD9HRr4avS4s+ZP
1HQwhxzv8oUsvMMVpmjKt232cZNw+QM=
=gfQ1
-----END PGP SIGNATURE-----

--uQ7vq3tWddTOPZN2--
