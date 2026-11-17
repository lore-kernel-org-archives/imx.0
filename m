Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951454;
	b=pCHrgu6WF/SMagryMFQV6+axTyK6P795SYlVv+AY3DU2BhpMFpuL95jiq45S26JTBtQW
	 X4jqQCo0sRa1/ByuuHwYQn9Glp3srrzss5dXda94b/QT+6JYkLomjBTft3foAwBlJ5p/5
	 09e5SWztzyOXysIzU1fZOcqAWOxSzUOpaGCRvHbeD9GSWnwAl+stwIUo+57IKHKIB3MNW
	 UhKWlzBXVK2j17RNDjEjVqTB8ZXBWBeS6a30Q2PEpQx/hPwqn/XYtaX3wYQ1Ekha3vxit
	 sQpdeH0tHXsRQt0VhDjGOlha7oGq6ASVIEPhArJCG6WQ07xMZzOt32syjl392CmVItA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951454;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=ygKYZry/mgTJ8Ux3xVDDIBzUq7PHZRHgltKgNh3f8Dk=;
	b=wF5mKWbn6cl8TaxffJ4bLXHlV0Q5ryVPeaJayh/KiMMsi0+yMLM3/lndbqp4J4jwkPuQ
	 /K0Pjdh6NomqzxwsPgEW6Ca2aUXl1G/NXz1NGWZptsghMFmiXg6J3KC+vvQCxApRdcQMa
	 4d44d0peuWAPPWCYhM7xefK6fK7aLhkhOhfh5m+5hsz+MO2oVUvVHuCMXN0CYoNP4vKJy
	 KukjCk6AOCpGE+pFpn27itrSx53fOs7JMtssVlqGOeovEl0MxzyIXphM0IBPcCzNyYbYT
	 xMtT32ZzKGrEAsiJcp1nJ12bnHWDIbneKtE+itL0kwO0PE6wZjk1ZjksYs8GZdD3QEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=YeYL+y8S;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B041606A31C
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 21:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B041606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=YeYL+y8S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794951451;
	bh=ygKYZry/mgTJ8Ux3xVDDIBzUq7PHZRHgltKgNh3f8Dk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YeYL+y8SX0DkRGM6v9vLMmoWcwtW56CzTuoynO304mG8A51GWEs7VMRXqjsJfiT4A
	 RG4cjK66UJ77m2sFCTrHJK6RX11LvOuYSpuU15CbSzXjzYFt7A+wABCLqj8vD+aJce
	 67WftusWpAkqPM56lmKDwmAcVkL01YIfjF4sh/BP7QDyF7HP4Y0VXPuhq5FPEjZqNn
	 DZpCyaRHVZGVlqN5DiDmq9uac6evGRTjETHaU9okAnxY2I+BEFBR/l1/o7a4dfKgM8
	 A3hXbP0sOWGmlje0ErQV8RewM+9YVMXXiPzYPmiSS0zt7HV2YRYLIDbgn38hvDBS0f
	 vLVjBi7O3jY6A==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 60A3917E0060;
	Tue, 17 Nov 2026 22:37:29 +0100 (CET)
Message-ID: <a76b1b218499f3291e7002c88543a2a5b6d80b35.camel@collabora.com>
Subject: Re: [PATCH 04/14] media: h264: Add stateless encode core
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
Date: Tue, 17 Nov 2026 16:37:28 -0500
In-Reply-To: <20260522101653.2565125-5-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
	 <20260522101653.2565125-5-paulk@sys-base.io>
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
	protocol="application/pgp-signature"; boundary="=-2P2I9QJtqzO7EfgJcWa+"
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

--=-2P2I9QJtqzO7EfgJcWa+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 22 mai 2026 =C3=A0 12:16 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> The H.264 stateless encode core is the common implementation called by
> drivers to coordinate stateless encoding. It provides all the relevant
> configuration parameters to drivers, through a state mechanism.
>=20
> States are built from controls (some of which are optional) with various
> inter-control checks along the way. A state can be constrained by the
> driver through a dedicated operation callback in order to disable
> unsupported features that may have been requested by userspace.
> The general philosophy is to adapt parameters provided by userspace to
> reach a state that can be handled by the hardware and bail out if no
> such accommodation can be made.
>=20
> Adapted parameters are returned to userspace by updating the controls.
> This is currently not attached to the inbound media request but should
> be when support for it becomes available.
>=20
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
>=20

Nice idea.

> +
> +static void state_debug(struct v4l2_h264_enc *enc)
> +{
> +=09struct v4l2_h264_enc_state *state =3D &enc->state_active;
> +=09struct v4l2_ctrl_h264_sps *sps =3D &state->sps;
> +=09struct v4l2_ctrl_h264_pps *pps =3D &state->pps;
> +=09struct v4l2_ctrl_h264_encode_params *encode =3D &state->encode;
> +
> +=09pr_debug("+ v4l2-h264-enc: state");

Imagine you get two of these concurrently tracing, it will be hard to see w=
hat
is what, consider combining like we do for ref list.

Nicolas

--=-2P2I9QJtqzO7EfgJcWa+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavzJGAAKCRDZQZRRKWBy
9PbjAP4ttGXHg2EkS1E5U7RZSbVfuNggh9s1884q2eh4ebMppwD7BUpl0tXn5dOK
UJls3iR5RZGcFTO9/LhVB2lmk8gWEgQ=
=ahIs
-----END PGP SIGNATURE-----

--=-2P2I9QJtqzO7EfgJcWa+--
