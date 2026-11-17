Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952264;
	b=XR1dUSIe/JkTb5D748z2uj1TdJg01a+YRTDAWVed5xFPg9OqX0pC6Vnwq68+tywPo1oM
	 w51kHbzt73pmD1L8ZA0zb73xZB0jlQzc5eKyIeMyNo6Rb16+TARRcpF9XsArbiqfX5Nqa
	 agtwy7OSKHILJ7S4QYPWkP8wngwvVii6lKxNFKAptGBMOduKTLhEpUK1NGkfkyQMoplyl
	 qAbJ+H8nfI++LdE7cPjck3KaYq0ceSac72PhVscQFx2sKiv/AzqGYdDPjm3RY+P9Y3NxS
	 k5+mCLs6T/oCa1iFrWUXv3q+SmVnj/BiDEl/LLXVE1SrDDNvC3A5sf5650cLqENIH7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952264;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=uOYZ3YUnApgAE+Wv9P1FnmCQYiPIee7XKpJASXihcf4=;
	b=ZxnQBnzNjZcJkKAgrqpVKu/7aMKDWp26e1ATYnNQbEMwkbOgyYYEAwgctJXeY7MLUCGi
	 E8RRKzRxVMu63x56RTpqeX2E2i274MDYnn9igYYxuSMLkolVKUHhN/Uumh8it62fB+/Vn
	 zgLosbu0swFU7A8jKbJQflXC/CYZ/tyNzjlenbKUmCOYxAOTT8wana9+dLGho+3bvL30Q
	 lCxbCqFANnRQp8kueQauP/3Lcuza195aDc3LmUWtChXhsRwBMdBKuJDhH9JzqrZzrfwK4
	 gMFbqLNnFu6xIufo3ZzhVEaHY7wJb8QKewFPuGY5H8/YUorm+04j1FIAcM+gvRB7OgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=bW1WtPPL;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8163606A31C
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 21:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8163606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=bW1WtPPL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794952261;
	bh=uOYZ3YUnApgAE+Wv9P1FnmCQYiPIee7XKpJASXihcf4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=bW1WtPPLvbXoAYI3Ztps0gKSqqfIfW3pUSLErv0E8g8kaRAGtFdC9xepCppn68AFz
	 GTUTZXSICFEdDvY7Bxs++Ns1CjPqcjqYeFAJhg6Fdz6/L5Q8jlozmokrAVCaO4ix1k
	 4vGv74cipL6KA07OmJidjxGkTh1sPmCoCKj+XIHUITFn/onmTVshGAVXXaKH8Iourv
	 WIvRnzN9pa6GiCDqjV9JsWlGICiS0j1b3dVY5ls/LLFOxkTEg4h6Cr5VKaW8Ozmdku
	 mVW6NYKdNU04yzdFfAUwm2b/+hlo2yTIEmBQf5oJPSQZ5NLos3XygCViplSvrkhEXX
	 wwxP8dWnfZpRg==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BD5D717E02F2;
	Tue, 17 Nov 2026 22:50:59 +0100 (CET)
Message-ID: <632f258f80a3b20d6edda600772e95a5c7735735.camel@collabora.com>
Subject: Re: [PATCH 11/14] media: verisilicon: Add common encoder parm and
 frameintervals ioctls
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
Date: Tue, 17 Nov 2026 16:50:58 -0500
In-Reply-To: <20260522101653.2565125-12-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
	 <20260522101653.2565125-12-paulk@sys-base.io>
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
	protocol="application/pgp-signature"; boundary="=-31nN73e0jiIWmYgoHCNh"
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

--=-31nN73e0jiIWmYgoHCNh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 22 mai 2026 =C3=A0 12:16 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> This introduces the required encoder ioctls for configuring the
> frame rate (via the parm timeperframe field) and enumerating available
> frame rates (via enum_frameintervals) for the encoder.
>=20
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

Perhaps add a word or two about what it is used for (rate control right?).

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

--=-31nN73e0jiIWmYgoHCNh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavzMQgAKCRDZQZRRKWBy
9DylAQDgvmfKrtRkUANNPHiNDtUyH56zB5LxGC+9R+k4oMPkYQD+N5a2pBuwNnUX
LTCWo+50B8YJ+2lyaFgk6ENf7j4GEgM=
=X2W/
-----END PGP SIGNATURE-----

--=-31nN73e0jiIWmYgoHCNh--
