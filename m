Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4606529BD9A
	for <imx@lists.linux.dev>; Mon,  8 Dec 2025 09:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765185216; cv=none; b=tVVwgRDj4Ege0N0P7aYPcGhyMaPqIGP7lrHedjjvaQ/eH6dvcAy08E/f9CxWLJ+DbMPAYQS0tThkDFRGaLQ36Y6BPYFoNN5IRT0GUwMs9paLiz/QGqtNqNk1tGb/H5H8f3DX8EouTWhpPvAlg+/SVqvS20Nz99D6BT7SsVgRF8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765185216; c=relaxed/simple;
	bh=6NzNmchAWdB0rlZpmPyBksuHgILGdWQA+Z4Vy2+m+zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CFin+5NBi63kL/diiDqcEwYS7NEDyFS35GnENiQmzOo00sWzZlm8saSyAm4SqGX3NeLkIoja9+TRwQ6WXfFesDD24xAtzjtjIslQKlCpLsEi5s8/h9q+pZ9CBhkQFV3+n4pPDNAFeyDgkZSauQO+MjWfqFmIz5taa5SkAeNXfIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vSXIy-0002mw-PJ; Mon, 08 Dec 2025 10:13:16 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vSXIy-004aRk-0G;
	Mon, 08 Dec 2025 10:13:16 +0100
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id B75B04B0E81;
	Mon, 08 Dec 2025 09:13:15 +0000 (UTC)
Date: Mon, 8 Dec 2025 10:13:15 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: "Yanan.Yang" <yanan.yang@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, Lei Xu <lei.xu@nxp.com>, linux-kernel@vger.kernel.org, 
	qijian.guo@nxp.com, Xiaofeng Wei <xiaofeng.wei@nxp.com>, justin.jiang@nxp.com, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add NXP FRDM-IMX91S board
 support
Message-ID: <20251208-free-barracuda-of-strength-4f8c3f-mkl@pengutronix.de>
References: <20251205-imx91s-frdm-v1-0-afd6cd01c299@nxp.com>
 <20251205-imx91s-frdm-v1-2-afd6cd01c299@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lzcwykrisnlaz54e"
Content-Disposition: inline
In-Reply-To: <20251205-imx91s-frdm-v1-2-afd6cd01c299@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev


--lzcwykrisnlaz54e
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add NXP FRDM-IMX91S board
 support
MIME-Version: 1.0

On 05.12.2025 17:03:59, Yanan.Yang wrote:
> This DT enables:
[...]
> - FlexCAN

[...]

> +&flexcan1 {
> +	pinctrl-0 =3D <&pinctrl_flexcan1>;
> +	pinctrl-1 =3D <&pinctrl_flexcan1_sleep>;
> +	pinctrl-names =3D "default", "sleep";
> +	xceiver-supply =3D <&reg_can_stby>;

please use the "can-transceiver" instead of the "xceiver-supply"

> +	status =3D "okay";
> +};

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--lzcwykrisnlaz54e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmk2lqgACgkQDHRl3/mQ
kZwS1wf+K7LLtmt3oV4Qx3/qOJRv46Ok7N5R83QHG7iCNAsQ0guyYHnWYexNGxyu
eUWf+IHZRDU2x/RQI3IGK/OoMQ0XGsT6upxGe4WoAsTSvz41v+vx9HL/lON2BkDG
xjFLdgTvI9Z+S1DT0zvK7gE+DsWEgJUdQVsoPMyiINJki77bExjZSpkN4BZH7BGN
/b7qGyMuuyvH9hoDCY2iRkAKmacFYV4yjzSffg2jFeX8J7IuXy9oIxhoIz54Ueuz
jqufabNyMDrf3mNlYF/55ZoNr8Hz6Xxpl2mUrZXPHA/sJso1Ih5VOk8hKe/mcbmf
W2FmLc29ysE2RxYphUS3ftvcCw0pvw==
=XX8R
-----END PGP SIGNATURE-----

--lzcwykrisnlaz54e--
