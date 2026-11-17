Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951256;
	b=uOdQl5Xc9q4AG0EtScwKTOHf75VYhFnkwYt73E+SiUPQ7CBZGrKHAcr89xrlOVksQI49
	 F+3fXo5ZqWbzgXbymohk21J5xoC4d6BhdismUazbNaJkNrRFDnydn3l/+oTQaHXzjx2vS
	 Jl0da1lvO8pBOuzvOgRvzrofq/Bd59KLFgWSb7OehD5mbPYaTSyVzhJ1foH9pJzmlRcmO
	 Sg/5jqrEO901UxD34VcebW3DqhwHaDHpReWTdIxRW/eHt6s5h0NW9HwCi0u0hjLCU7UCx
	 9Cgl5+0v+Zi9azW88tVTYc0IaN1DLhyR0HaDZPC5P/U2UjQ2nhUmNZKO+gBhEU+1drQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951256;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=WHqfKSkp6wNUtO6H4jmQz6WHiqtvVsP+iPjkHYTZ39s=;
	b=RZAStglQIYFoCTxf4Om34R3WA0eKd7Y/UloAlmw2zFu9asdHZNvhgLD//w8P7JD/I1Cd
	 fhWOAQ9itqEztVpzVRUJJ6hDr+QdhvS7PQ6lY2qfBNixZoc17+kKhiqNQwR0vQroLkON7
	 5Fv+Ihu+3vLA4+aGMgx+c+KaVs+o8RGlds8/pYsnsOs/WSvud4CtreAdmIHbMbUAJDxAq
	 1h8vFoCaucp82PZKOzqu8kJUUxfjxSFEmRDiRa41c8VAGl2QNO6C/SFA883t7OyeImx1R
	 9+P0xXN0m5qJbyih5ronqrUWpfW1geMnwnsmnilB2ZjEjrisq9qeDhy+UubREvjLfPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=SxIYDHOk;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22532606A31C
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 21:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22532606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=SxIYDHOk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794951254;
	bh=WHqfKSkp6wNUtO6H4jmQz6WHiqtvVsP+iPjkHYTZ39s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=SxIYDHOkHhWEVdkJQno0c032wgCnau7T7WoU/qyfshGkKb3qpPwe0uOSEkxRqA2ey
	 tLmnSEKb9AJPZzAJ1CCFuezmUX9Ezus8bsvQagE8FWrIQ5zuKkrws94sgyylMxLMgh
	 V3O+kAtHc/lfYg8y3TisaGPNQq9CaJ5NsjWouhJqBeLv4oWDfS6hN0Km7GM65VucL8
	 hlQMvy0oIX4pJQ4Kl5CFGVcFS1pG2xxerH+isMmIEK8+ek3QJan5qdVoTg7iLfFcYh
	 Kt5pm4LRuDLcsYboYpIig0eYlDg4ERv7SvQXzMKzafz0fe694YWO+XdRhmNTl+gg4K
	 K0ayRxgYPEL8Q==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 376B417E0060;
	Tue, 17 Nov 2026 22:34:12 +0100 (CET)
Message-ID: <f2c679df52985a79ae065942f52020aec5951ea3.camel@collabora.com>
Subject: Re: [PATCH 03/14] media: h264: Add SPS video definitions
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
Date: Tue, 17 Nov 2026 16:34:11 -0500
In-Reply-To: <20260522101653.2565125-4-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
	 <20260522101653.2565125-4-paulk@sys-base.io>
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
	protocol="application/pgp-signature"; boundary="=-OS69ecpzncDB5QYJzY0O"
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

--=-OS69ecpzncDB5QYJzY0O
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 22 mai 2026 =C3=A0 12:16 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> +=09u32 frame_crop_left_offset;
> +=09u32 frame_crop_right_offset;
> +=09u32 frame_crop_top_offset;
> +=09u32 frame_crop_bottom_offset;

We may or may not prefer using SELECTION API? Similar generalization is use=
d in
Vulkan when I compare.

Nicolas

--=-OS69ecpzncDB5QYJzY0O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCavzIUwAKCRDZQZRRKWBy
9KRXAQCIwaVBW4yRzTOVa3oNy11vsVlDoNqA6Gn9Rm2TK2NJFAEAiof90F0QCybi
Kqv+NMU5yF4/x55xlKMMSmi3SsNIDAc=
=YJWK
-----END PGP SIGNATURE-----

--=-OS69ecpzncDB5QYJzY0O--
