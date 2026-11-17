Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952126;
	b=3YSi7R8Xt60vNhqhwk/Ax9nHE0dhA5udbst0sRO0eYz7cgEopGyyULN06oz7kXP6fnao
	 m78uvTMcRH2OVe6G4GUjueFYUKi94CAmVuMGQWtpvscY9ZxHVgsrb9789TNjg5B5xmBhz
	 y4SEu13oVjf5UOCVsrv6zaoRHI6DDkT0HOMEzbPw2NRvGB/4A8JGIj6J8vOcacBbc32Xy
	 /0HQOkHdfW9WXrc5lhIPEJh6o/nL+9HTPJ/MBvmG5hmH6ZYSC4xw/6etZxky67/s67h6d
	 7Yojl+KqY7OYqhZUYnWplLUTUYRjwf818VGDZs/EwmVFAHGIcyaxyaX0VGRbhUn1f2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952126;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=bmfQENYgWZpmGfv2io958u6QZxK/XN9a956gDJqvbJ4=;
	b=Qit4Dlgds+dH5FPFmiRmgTItUIwniizAl/hj8+Dr3KvQ4+xmxlAhxjmDOS8K0RUwOQF2
	 LSqE/FJNSl8B5IIa/Efn8KER6RkVOitPbSAVxowjBofpDdMX53ZFZLqwTfZBPtApFNeMO
	 e+bUjolmh0RtOwkCNaLVEC/3fp/gYi4UqjzhB1I3xujfINHKReJ/7dOKHs5zp3/xVvTxY
	 uKfBTkw7tUzTAa35xeEseGsap+qfOouh/rZRSXh2VBTgStGFWZzFhv4V2DNbk+WkBVWpz
	 4r0xWiFdgI7PnTXbcZUeC9ikVPEy7zk/9e/C1UC2X7JLN3jnIBU3kl+f7GFPj3z9WKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=DCbgpcrp;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B924606A31C
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 21:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B924606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=DCbgpcrp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794952123;
	bh=bmfQENYgWZpmGfv2io958u6QZxK/XN9a956gDJqvbJ4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=DCbgpcrpKbP9Wj0tG+57kXnefBUUMqgSXeCtWGCGDmBn112uhsB3BezV3aKZydZ+C
	 FwYCaUmXcIA8aLi3bzkR2VAN5cfAtIjjimu8aNj6h+oNKZTQocRCmAlKVsvqb7xH9Y
	 g2x7TOd3OsZ0Ai1q2hJLTeO1r9JTIzG4As7fMEJxDL1s3WFTUVYiQvvPXJR/ecO7nR
	 HZ7tbY+T0Kcx3n7BXG9mFqrN/mmrcrdKLvOTm8OQU8JSps6yljTMm3QcbQYuqmBECa
	 mSM2sxa06WF87psuqH0i4z2/YmpNnjtIYENsbWbnrdy7Cm+rPNh9h2IcqFsXNxuSbE
	 HsC8h2h/THBlw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1CF1417E02F2;
	Tue, 17 Nov 2026 22:48:41 +0100 (CET)
Message-ID: <a1aa59b44904a3b093ca02f86ee1a98f6c572583.camel@collabora.com>
Subject: Re: [PATCH 10/14] media: hantro: use hantro_decoded_buffer only for
 dst_vq
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
Date: Tue, 17 Nov 2026 16:48:40 -0500
In-Reply-To: <20260522101653.2565125-11-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
	 <20260522101653.2565125-11-paulk@sys-base.io>
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
	protocol="application/pgp-signature"; boundary="=-nLh/UB/KObZ+4VCcD/xs"
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

--=-nLh/UB/KObZ+4VCcD/xs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 22 mai 2026 =C3=A0 12:16 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> From: Marco Felsch <m.felsch@pengutronix.de>
>=20
> The dst_vq buffer size for encoders should not use the size of the
> 'hantro_decoded_buffer'. Make use of 'v4l2_m2m_buffer' instead till some
> encoder requires pre buffer extra data.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Its independent, so I picked it and added a Fixes tag.

cheers,
Nicolas

--=-nLh/UB/KObZ+4VCcD/xs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavzLuAAKCRDZQZRRKWBy
9HeFAP4oHdSCfI8KY84Av78wYv28NgXY9eBk1eY2xYRycAHPOwD/RnGf91mn/T5V
d3DQ6MjLkJ2QhoahVS6bvxw7omKvbAg=
=3IEk
-----END PGP SIGNATURE-----

--=-nLh/UB/KObZ+4VCcD/xs--
