Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593803EBF07
	for <imx@lists.linux.dev>; Thu,  2 Apr 2026 16:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775146374; cv=none; b=YaHF5uSjZCZAGJvz9fdl7CWlhP/BSZqfUO1EnD6Dnu9gQED9ZllN4vlyeLkRLTDlk85zpWbtqh+rrx1DS7T8ct4SLKRRtsWNoPBpzHIfhDxQ/UYnXp5Wl9UGLBM8oqX1iDHL1Dfc7gbX+3Gl5mADzI/8f6/9LbmIl/Pqf+paSNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775146374; c=relaxed/simple;
	bh=cr763q7HWRQd1RAzs8+k64iP4tN+6dWIkpWk60kP0FU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h8Epqk68jmeD1DVUODtWZuNp41zFPneDgIXpiBfYj2A0xKDm7GejVihib1wLCDhA/P5lkw700MlpqkL6npXHrT0Z7IIqP9v2dlp7R0J5BbhLEv18UCMI46XOnX/2k3rSN2KLGnRIb7Z7c5S1p4dGh9uee+uQVopoOnaUl55Iohg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id C89E31F8005A
	for <imx@lists.linux.dev>; Thu,  2 Apr 2026 16:12:48 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 8F901B40121; Thu,  2 Apr 2026 16:12:47 +0000 (UTC)
X-Spam-Level: 
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id ABBCDB40114;
	Thu,  2 Apr 2026 16:12:46 +0000 (UTC)
Date: Thu, 2 Apr 2026 18:12:44 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Yannic Moog <Y.Moog@phytec.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-phyboard-pollux: Add HDMI support
Message-ID: <ac6VfJCKMZghi8My@shepard>
References: <20260330223712.2615273-1-paulk@sys-base.io>
 <573e4ebd9679517086a6b4acb162d72463429f35.camel@phytec.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1hlZwKtrqdPSeKCX"
Content-Disposition: inline
In-Reply-To: <573e4ebd9679517086a6b4acb162d72463429f35.camel@phytec.de>


--1hlZwKtrqdPSeKCX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Yannic,

On Wed 01 Apr 26, 12:06, Yannic Moog wrote:
> On Tue, 2026-03-31 at 00:37 +0200, Paul Kocialkowski wrote:
> > The PHYTEC phyBOARD Pollux comes with a HDMI port on the base board.
> > Add the required device-tree nodes to enable support for it.
>=20
> "Only" video is supported, but it does work. You could add that to the de=
scription since audio is
> also supported upstream and part of HDMI.

You're right, I didn't think about the audio part.
I'll add it in the next iteration.

All the best,

Paul
=20
> Yannic
>=20
> >=20
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
>=20
> Reviewed-by: Yannic Moog <y.moog@phytec.de>
> Tested-by: Yannic Moog <y.moog@phytec.de>
>=20
> > ---
> > =C2=A0.../freescale/imx8mp-phyboard-pollux-rdk.dts=C2=A0 | 47 +++++++++=
++++++++++
> > =C2=A01 file changed, 47 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.d=
ts
> > b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
> > index 0fe52c73fc8f..0d52f29813f1 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
> > @@ -38,6 +38,18 @@ fan0: fan {
> > =C2=A0		#cooling-cells =3D <2>;
> > =C2=A0	};
> > =C2=A0
> > +	hdmi-connector {
> > +		compatible =3D "hdmi-connector";
> > +		label =3D "hdmi";
> > +		type =3D "a";
> > +
> > +		port {
> > +			hdmi_connector_in: endpoint {
> > +				remote-endpoint =3D <&hdmi_tx_out>;
> > +			};
> > +		};
> > +	};
> > +
> > =C2=A0	panel_lvds1: panel-lvds1 {
> > =C2=A0		/* compatible panel in overlay */
> > =C2=A0		backlight =3D <&backlight_lvds1>;
> > @@ -201,6 +213,28 @@ &flexcan2 {
> > =C2=A0	status =3D "okay";
> > =C2=A0};
> > =C2=A0
> > +&hdmi_pvi {
> > +	status =3D "okay";
> > +};
> > +
> > +&hdmi_tx {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_hdmi>;
> > +	status =3D "okay";
> > +
> > +	ports {
> > +		port@1 {
> > +			hdmi_tx_out: endpoint {
> > +				remote-endpoint =3D <&hdmi_connector_in>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&hdmi_tx_phy {
> > +	status =3D "okay";
> > +};
> > +
> > =C2=A0&i2c2 {
> > =C2=A0	clock-frequency =3D <400000>;
> > =C2=A0	pinctrl-names =3D "default", "gpio";
> > @@ -244,6 +278,10 @@ &i2c3 {
> > =C2=A0	scl-gpios =3D <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > =C2=A0};
> > =C2=A0
> > +&lcdif3 {
> > +	status =3D "okay";
> > +};
> > +
> > =C2=A0&ldb_lvds_ch1 {
> > =C2=A0	remote-endpoint =3D <&panel1_in>;
> > =C2=A0};
> > @@ -444,6 +482,15 @@ MX8MP_IOMUXC_SAI5_RXD0__GPIO3_IO21	0x154
> > =C2=A0		>;
> > =C2=A0	};
> > =C2=A0
> > +	pinctrl_hdmi: hdmigrp {
> > +		fsl,pins =3D <
> > +			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c3
> > +			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA			0x1c3
> > +			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD				0
> > x19
> > +			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC				0
> > x19
> > +		>;
> > +	};
> > +
> > =C2=A0	pinctrl_i2c2: i2c2grp {
> > =C2=A0		fsl,pins =3D <
> > =C2=A0			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL		0x400001c2

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--1hlZwKtrqdPSeKCX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmnOlXwACgkQhP3B6o/u
lQykoBAAkQMdwVAx4iApkjsn7iiLIKHgM8rSRnLI9+6JuBEa1OG3dQLatwrrlUMq
xVCg0QnKlPG9nfAa8a+Lvu8AjvgkhWtH3hFWM2+Z+r4lEvn/zDlVYXnkhRmBD5q0
1Ce02KsovrQf3wQOZHDz59NqDo4Fl4XBTYy0BL/fch1FcxvHJS7u81C7hkk2jvbD
nkYb2HKtHb8vn+RUhJnuTIiRZlKuAi0K55Yll83ZiMjZ8rcgA3kLXjplcbv8TJek
CafJy0FowM7L1Op0PuctMc7UJVtzqo2NXYHNfTUrwEOu+0WI72zncRLJ3TcsMRYK
6Dq+mjJeh8pRRn7hW+tEHv3dqXYi+TzzLVKLNXTxDChGzuH/tSjuFVuJHZfEB7t8
PfNp3lGbjKJVDhoU65269u3pkhQx5lh649tC6OYZZQSuVYvj37bH6b6JopP6gwGX
8ELTqVxatgwKJ/oZ7U6pgvTzHAkXBzSZQKoOpw0ImRaT+WJO2hHk0WbkqUCltqcJ
XGAUkyaQwhnD6SC82jCrO3M4fjdx5VVvlFy62kOJx70V43Azh1oL3RgTIeP34hN6
TPF/xTXmnnf8vLJLTYMjJCfP/HvXkLmN5gJJJnL5Sj1xWlybN9Xr1nayj4LHOqcR
bqrhfWvNUH8rG2lqbRB0qgcvX6f6+aYxq3K5wyyW3VL+Fhgx92A=
=1jgm
-----END PGP SIGNATURE-----

--1hlZwKtrqdPSeKCX--
