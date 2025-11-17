Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F073358BD
	for <imx@lists.linux.dev>; Mon, 17 Nov 2025 14:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763390888; cv=none; b=GaggzR+J4S95kUnZycafzJlmmdeZQgaC84hPrUS+Fw5PWcRNjsmLRkp0rHBIZF3zn1sA1B1CjRXUnMw66/5seR8L4JlcfwmDazVFgHJePKdbTaMPgnxk4/DvX6c00dtXi6g5BYHNjDupR8Ig/F7iwKzXyCYZiisjzEkod0VfZ60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763390888; c=relaxed/simple;
	bh=D9nYDeSuoyP05Nfo2zsp7FNfWn2gaxIgUsgfMm8ot/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hDx6p2LAINL+vvJWdgMMYcgmm+m3D16XF1wEucZQiuTRrE9Txa40RogOObVz4dwpNE2NRCCydm/7f+UjzpeJNIcebMDMGIMuR9y7caU7CVRLpADTs71tLBDnk2H4vlRvaasl2LkSzhUJtO7ND9luchx+CbAtNsxnVBgTlgVjA6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vL0WL-0007T9-DB; Mon, 17 Nov 2025 15:47:57 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vL0WL-000vdw-0M;
	Mon, 17 Nov 2025 15:47:57 +0100
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id CF7314A1637;
	Mon, 17 Nov 2025 14:47:56 +0000 (UTC)
Date: Mon, 17 Nov 2025 15:47:56 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/2] Add support for NXP XSPI
Message-ID: <20251117-logical-benevolent-penguin-29b355-mkl@pengutronix.de>
References: <20251117-xspi-v2-0-e651323993fe@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pmc26wvviv3xdq35"
Content-Disposition: inline
In-Reply-To: <20251117-xspi-v2-0-e651323993fe@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev


--pmc26wvviv3xdq35
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/2] Add support for NXP XSPI
MIME-Version: 1.0

On 17.11.2025 19:04:23, Haibo Chen wrote:
> XSPI is a flexsible SPI host controller which supports up to
                ^
typo: flexible

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--pmc26wvviv3xdq35
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmkbNZkACgkQDHRl3/mQ
kZxTEwf8Dh+HeIttfhkyysWoTAFq92mdf9BiCYI1kuIrjU0h2Yxpz/hAOVwRwRlu
Ujp+UzgTNHQgGpWrygiWLOJ+5NZmxiF9RN241sOy5hYGWp7kZlk+p50Ncu5NSBi4
VD02SwnihSie7MXXJgNrCYoLVLzYZ4AdrGPklom4PK23ZfCC1PuS8CY5YT+G0Fgr
si/FJQBbT+Sh16H/jgJ8fx2DfcJtxZAkRkrGUkjyy0jix7PAIyUTcczZj9d/7PSF
wDMmTOHlBPAGI9tOxci/nQqnDE037lgsCdy/4TeC8mFloLgN4gaPkOfUpvVEc4eE
PchF3+FZJB16HlBLNVqQ8QViBK69JA==
=NcxV
-----END PGP SIGNATURE-----

--pmc26wvviv3xdq35--
