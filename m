Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6679D158870
	for <imx@lists.linux.dev>; Mon, 24 Feb 2025 13:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740404765; cv=none; b=HwCqFYzTSxcbVVKoDz9R9Fp0bOkQrY/GM4kO18eUr1Qso/7BlhCOEcknapX9BmET6vw3NQzN8TlCbx6XvQcnQGhbrlfj05E1UVqYkBHfc59g66Dzpa176bokv8BAWNDyPUFC6vojlcRhArZtRUsPoMbMwCq5RKrM2XikTsTn8Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740404765; c=relaxed/simple;
	bh=U54E3SdESm7dfYIQnckgPcM86HtTj/Q4chdE6jyHTM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ky5GLJ/hU3iJu0CVGNUdXSydQxISdhDsZj369MOkh9EN8SryhaNAE+/7QgvRMbgcK2+Fq814RXY8YmFxC0m4cmLAN3Laq8aWmt/vQTSxKoajVTtPze1f3/Cy8xFUbL29gexW9iS02INQHgsB57a0FXPidSZTNzzOfxqS/lKjkA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tmYmO-0007oj-Pq; Mon, 24 Feb 2025 14:45:52 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tmYmO-002bVW-12;
	Mon, 24 Feb 2025 14:45:52 +0100
Received: from pengutronix.de (p5b164285.dip0.t-ipconnect.de [91.22.66.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id E8E753CA816;
	Mon, 24 Feb 2025 13:45:51 +0000 (UTC)
Date: Mon, 24 Feb 2025 14:45:50 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	NXP S32 Linux <s32@nxp.com>, Enric Balletbo <eballetb@redhat.com>, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: s32g: add FlexCAN[0..3] support for s32g2
 and s32g3
Message-ID: <20250224-quizzical-tasteful-chupacabra-acf14d-mkl@pengutronix.de>
References: <20250224134016.3921196-1-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vdjp2jj2cgfxv3yv"
Content-Disposition: inline
In-Reply-To: <20250224134016.3921196-1-ciprianmarian.costea@oss.nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev


--vdjp2jj2cgfxv3yv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: dts: s32g: add FlexCAN[0..3] support for s32g2
 and s32g3
MIME-Version: 1.0

On 24.02.2025 15:40:16, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>=20
> Add FlexCAN[0..3] for S32G2 and S32G3 SoCs.

The dt-bindings patch that documents support for the S32G2/S32G3 is in
net-next/main: 51723790b718 ("dt-bindings: can: fsl,flexcan: add
S32G2/S32G3 SoC support")

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--vdjp2jj2cgfxv3yv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAme8eAsACgkQDHRl3/mQ
kZzAFwgAkC2NY97unwSJJHjQK4vv1/t6fMnSIY0SgTnQ8Ch+OBenrj0ykSdhSdB4
spt7Ly83UumxmXfGM/1IWobj4tyx63ryqWEztyV5WojY8I+VpN4BoVLY9q1U58oH
ia1Ns6+5XSh3cUacaMn4pCOf3gJbjlGZxy0Yomp9QiaSDondf/osnjCVVTA59Zjj
q7yGEuUT83Q877UM39YCc/h7z1qFnmJV8av6IyrQoZLn8oX3bx8HIILM1PIJ6D5M
eLhwB7Mr2Oh5G20vDoq+VYNVxn7Uuwzd9lzOcm3g7DoQ5l+iLsaxQG7+aXOAV4o+
5YZzZNaiLlbyD3ZjL59b3PFtRefIwQ==
=98NH
-----END PGP SIGNATURE-----

--vdjp2jj2cgfxv3yv--
