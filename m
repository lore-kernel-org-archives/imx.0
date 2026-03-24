Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895373D333E
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 13:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774359987; cv=none; b=FOZBNXibtoojAfx+GPfn+ALXs77CreEyCS7fNuUhqH6qhLXH40O679/vU3+VPWA0Hh+HJ1+Gnp42Aq63ExWwXFNgqpS766P2jl7CGwvAzUenlf2xqfl6ytd3AOkWti9H6GoIcumSSn1utCs7dCzIajYx5sGeNJd0fqA1giMXsV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774359987; c=relaxed/simple;
	bh=fBXgWlUd0Q99UqszrP5931qrJggaKWXcXSZGkzoMk2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ueFY4QHhqKwAgVR3xfI6uHHGw3gijphAQBo9HE2/KLct/3lmqFGBaWrVdRc5YOPqaG1rwlXeil7fR4YfReZbvX76HQkEl+AaUXgUnYmTNFUmicVv3hluFktD4dZruzn/jUIF3d8QnG7r0gMiJn7YvU1DbCfrD9NWJsgrSiHvXbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1w525J-0000zN-Th; Tue, 24 Mar 2026 14:46:17 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1w525J-001uDV-1X;
	Tue, 24 Mar 2026 14:46:17 +0100
Received: from pengutronix.de (p4ffb2dc6.dip0.t-ipconnect.de [79.251.45.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 2235550BAFD;
	Tue, 24 Mar 2026 13:46:17 +0000 (UTC)
Date: Tue, 24 Mar 2026 14:46:16 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-can@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	NXP S32 Linux Team <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>, 
	Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>, 
	Eric Chanudet <echanude@redhat.com>
Subject: Re: [PATCH v3 0/6] can: flexcan: Add NXP S32N79 SoC support
Message-ID: <20260324-visionary-vigilant-alpaca-a492d8-mkl@pengutronix.de>
X-AI: stop_reason: "refusal"
References: <20260323135827.2129371-1-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sfvp3htsx73w2iwa"
Content-Disposition: inline
In-Reply-To: <20260323135827.2129371-1-ciprianmarian.costea@oss.nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev


--sfvp3htsx73w2iwa
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 0/6] can: flexcan: Add NXP S32N79 SoC support
MIME-Version: 1.0

On 23.03.2026 14:58:21, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> This patch series adds FlexCAN support for the NXP S32N79 SoC.
>
> The S32N79 is an automotive-grade processor from NXP with multiple
> FlexCAN instances. The FlexCAN IP integration on S32N79 differs from
> other SoCs in the interrupt routing - it uses two separate interrupt
> lines:
>   - one interrupt for mailboxes 0-127
>   - one interrupt for bus error detection and device state changes

Can you check if the S32N79 suffers from the

| /* No interrupt for error passive */
| #define FLEXCAN_QUIRK_BROKEN_PERR_STATE BIT(6)

problem? Maybe everyone just added the FLEXCAN_QUIRK_BROKEN_PERR_STATE
for the new SoC without actually testing it.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--sfvp3htsx73w2iwa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCacKVpgAKCRDMOmT6rpmt
0mvRAP9uJpqL920nvKePwYE/f3MF6bgHAVfPT9leEIrGPeVWrAEAycBuPGzDXtPX
Vo+/Cwt1tfC3N7rC7vFrvinAjPIWBQM=
=makj
-----END PGP SIGNATURE-----

--sfvp3htsx73w2iwa--
