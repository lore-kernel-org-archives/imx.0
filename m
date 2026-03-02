Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531C5375AD2
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 10:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772447064; cv=none; b=JTvdkqc9U5964IVenqJZZj/HWqpqpUY5nbepw7lZkgp+MW7MxezaMzcjAsUePoeanPo9YyBS1yLeGSPnYu9zTVAIJ7qoYRt77MVYaz0cY3G9zdNwAFxmnwYLim1yZWWoERyXOSSE2D9KF80Z0Fer4uTyPX/LQ26xQHQ5oK41w4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772447064; c=relaxed/simple;
	bh=x/JPmKMpl9B76cHoeYrYmU9vcZQiUMxDoJ1jEnJhn+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KfUJFsSPn727pN0YO6aAOVC3hycHQW/2qOPZTRe7CSUqXPzVNkWMWomMxhmOqJw2y1ZMAb6hHnSZTHbmQWC5DXx1QoJvK48MGpSS6bVvppr8mycG6UBV48lYnwyEoVs2o45Clg9vh7HzLQifYRGQHsSMbhRxEFZ/UQgKt8ZxPAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vx0Rk-0003LN-I6; Mon, 02 Mar 2026 11:24:16 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vx0Ri-003MZu-2o;
	Mon, 02 Mar 2026 11:24:16 +0100
Received: from pengutronix.de (p4ffb2dc6.dip0.t-ipconnect.de [79.251.45.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id BD6624F5071;
	Mon, 02 Mar 2026 10:24:15 +0000 (UTC)
Date: Mon, 2 Mar 2026 11:24:15 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>
Cc: Vincent Mailhol <mailhol@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wolfgang Grandegger <wg@grandegger.com>, "open list:CAN NETWORK DRIVERS" <linux-can@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: net: can: nxp,sja1000: add reference
 to mc-peripheral-props.yaml
Message-ID: <20260302-didactic-neon-ara-91dabe-mkl@pengutronix.de>
X-AI: stop_reason: "refusal"
References: <20260212163000.1195586-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3xheu2vifpjpnbcm"
Content-Disposition: inline
In-Reply-To: <20260212163000.1195586-1-Frank.Li@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev


--3xheu2vifpjpnbcm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/1] dt-bindings: net: can: nxp,sja1000: add reference
 to mc-peripheral-props.yaml
MIME-Version: 1.0

On 12.02.2026 11:30:00, Frank Li wrote:
> Add a reference to mc-peripheral-props.yaml to allow vendor-specific
> properties for memory access timings.
>
> Fix below CHECK_DTBS warings:
> arch/arm/boot/dts/nxp/imx/imx27-phytec-phycore-rdk.dtb: can@4,0 (nxp,sja1=
000): Unevaluated properties are not allowed ('fsl,weim-cs-timing' was unex=
pected)
>         from schema $id: http://devicetree.org/schemas/net/can/nxp,sja100=
0.yaml
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied to linux-can.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--3xheu2vifpjpnbcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCaaVlTQAKCRDMOmT6rpmt
0hV8AQDLbjBMOU3liC2+KNR/C1BDNT2Yf0FVuMUud3z5t4H+FgEAtLu6taoyRf/I
vHxV2hgCJE4w5SqT3nANcwejnBwvBAQ=
=7CYj
-----END PGP SIGNATURE-----

--3xheu2vifpjpnbcm--
