Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952957;
	b=KTu8ITrXJQsxmsLZbIbnhpR6Z26z8aQaPTugfq3PPhBgjOvnEHvC0nTI9SiBab02+YvD
	 Wv40Tc5SgYUiKEnT+Vq2BFcCjP6y4YEEWMaVbmiO3iHZTtbobLPKaQ7aJH0VTHUMUcxYz
	 hj+1MGzN7HT1dv/FSsgziJYPMq8zGtslU+pxH2MAX+rHezNfMETc/0+N2HGyeTHuEGM0P
	 Ok8BLXg7YSFMx7kXXXKHE1WOvJJ57JGCkB+ozBJZd+8nVPVjxba3V0xzw1+0K+4qbTHS8
	 iFqpVWnGtC2SY5NzckCBuxiB8U8Z0H6HxhWWRVMYnHDG71Atg89Gp73swjLnS7a3PYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952957;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=cVJny626PSXTYXD7vVP1KvMetvjh73uNkOjbJXvYqI8=;
	b=ioiV19zik1QdZS4SmvzwATR+2RUM4fBbDQgXB6TaAS0LLuSNIefGJKod6fc7woYpe3GY
	 nuwAr1nYa+wiE6HH/ETwC5TPzV2t5dSM6djgsXj/ULAsqQgdClWqdGqcqgAo9smSs/WZK
	 PuKrt5zV8chD5VdqHRYtRPBkukujf8sfuF6P8tl0EkyfNBByNFzFCzB3bfx6UoFMQ/EKU
	 I3EoegvybfQ0sxkX6kPBCjNWiF4W6GtW/pqPmE3h0y/FDikInJim4nbjKHqusAhiBjP0a
	 MdQ/oxudeGRgPOyUML8ywu9XFvP3aWekhEpe+UtEfRnnZ5XB4/MxGLvZq4/cjkCOgkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=gHk8C3ZF;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6B6606A32C
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 22:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C6B6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=gHk8C3ZF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794952955;
	bh=rbe9bWmMLVa+J0dSsVuk7Oqfry0Nb3c6LzUf0izNtPY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gHk8C3ZFZGup291nOPsGvEuiekJqfUu0OA+z+BbbXpV5y7nQdwDjPxQ0st/JjbOFz
	 su9hsBAAvcXqBDACNNz17Q++iagWrr05wkdlz0DHZweYFXE1pmUeJQedwDauSA1qSR
	 4zhz++F2+NViVNhXaKjdYa5ZXcWO5p1s2xb+8KaOWh9e4SRkn1pWDps1Bp1N7aAvmp
	 6jVeIURtQichWCwEdNZP1g3OfQlAkGI/Y9h8K9pLtv4xW7Qf7T9CMieCvJ03jx4FA1
	 FPMtFe/pQuR+VwlAmr1inrphLuYpabTUZq8Y9dW/kl3dZ3JsHvGEd2FvKgwIvPEIOF
	 GoCh+ftCOK2Tw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 721FA17E02F2;
	Tue, 17 Nov 2026 23:02:33 +0100 (CET)
Message-ID: <77bea5a89914df70f38b7eb0d171ea116c1beb02.camel@collabora.com>
Subject: Re: [PATCH 14/14] arm64: dts: imx8mp: add VC8000E encoder node
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,  Pengutronix Kernel Team	
 <kernel@pengutronix.de>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>,  Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil	
 <hverkuil@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, Michael
 Tretter	 <m.tretter@pengutronix.de>
Date: Tue, 17 Nov 2026 17:02:32 -0500
In-Reply-To: <20260522101653.2565125-15-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
	 <20260522101653.2565125-15-paulk@sys-base.io>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-DrpxW1Rx3aNbkGs+KQT7"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

--=-DrpxW1Rx3aNbkGs+KQT7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 22 mai 2026 =C3=A0 12:16 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> From: Marco Felsch <m.felsch@pengutronix.de>
>=20
> Add support for the Versilicon VC8000E multi-codec stateless encoder.
> The IP integrated on the i.MX8MP supports H.264 and H.265 encoding.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index a3de6604e29f..4e63c2b16c1a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -2290,6 +2290,17 @@ vpu_g2: video-codec@38310000 {
>  =09=09=09power-domains =3D <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_G2>;
>  =09=09};
> =20
> +=09=09vpu_vc8000e: video-codec@38320000 {
> +=09=09=09compatible =3D "nxp,imx8mp-vpu-vc8000e";

Not in any binding.

Nicolas

> +=09=09=09reg =3D <0x38320000 0x10000>;
> +=09=09=09interrupts =3D <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> +=09=09=09clocks =3D <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
> +=09=09=09assigned-clocks =3D <&clk IMX8MP_CLK_VPU_VC8000E>;
> +=09=09=09assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL1_800M>;
> +=09=09=09assigned-clock-rates =3D <400000000>;
> +=09=09=09power-domains =3D <&vpumix_blk_ctrl IMX8MP_VPUBLK_PD_VC8000E>;
> +=09=09};
> +
>  =09=09vpumix_blk_ctrl: blk-ctrl@38330000 {
>  =09=09=09compatible =3D "fsl,imx8mp-vpu-blk-ctrl", "syscon";
>  =09=09=09reg =3D <0x38330000 0x100>;

--=-DrpxW1Rx3aNbkGs+KQT7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavzO+AAKCRDZQZRRKWBy
9JhuAQD0AfYjjgquoc8zWyxBBVWmufqqLsFrTzXcJNVEMypxtAD/cLq6GfuURHlt
do1wPhM9bKt6UrNP9Pvk2GYJtRFjEgY=
=L6LT
-----END PGP SIGNATURE-----

--=-DrpxW1Rx3aNbkGs+KQT7--
