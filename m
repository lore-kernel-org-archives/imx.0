Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465549;
	b=dkiO6R7svnIxPAfBnLT0iHzvWOx/92Vy7XHpVXXsrwhIsGVN4OCMumCt1QpGkEq8feoy
	 Ezu2xs+JPHFDH0A5qMuK3E52WWbBQvz8xU6wP8ZPVlqPVv7ty6uHc269j4UqApXERkv9o
	 zny6ySJgRlQJweQvq0OYPAIPIbolEC8sJL41+BOgDqfhw3xRCZtEl9p3oAKz8FGxuCHOv
	 CVSnTMfoW9YztGYa63uHJBTLEUaMetP6QgjO4Gxde4AjLRPdhc/TXIGX+FoaPGdlOPfH8
	 opYSYkgcMyef+b2ScB0PGNt1wFufmCb2uvO5Ro14YRRNB8N3NCyhcS3AGo8FxftMR7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465549;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=MQ2RrQtG1OM0LiBJp2KbHu85/ogHhtSJ39duNkPwNTM=;
	b=XOxlHmQHdS22pidTsMDXehO5JjrtzdXG9nNGNIZOefaBRf0K/NwGrpGz/CC/sCqVf7a2
	 G6UGJ1RAdipg8qTkfWYSB3irGEmr2k0UmpTc/BluQBbRR30Py0Syvpuv6b2F8Sh1a6anh
	 wGD10yYRYxOIGr3nNC+929HPDb99UsU/GM7Mhp3NvsDglXPyHoQKIoaMNH6Kona0D7rLN
	 kVQMqS300mJWwlThedcWofCsVAmgx/wDbV2I6jWh9XbO8ML8aaB43IL7FhoI5is7z2Jez
	 MqfwTlJH1u5Wi7vzCbnLdt7YSE2nre8tPgWXBSpAW9DsvR8RwjQWfyKzFuxgK+WvNJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=gKiuorXW;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03191606A321
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 20:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03191606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=gKiuorXW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795465547;
	bh=MQ2RrQtG1OM0LiBJp2KbHu85/ogHhtSJ39duNkPwNTM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gKiuorXWWGlvRFndCd/W8ewTB3EtABWyQ6+hc877mXzlUNbbP4XJIBBMTvCVB+v/d
	 FFA3cvYHquUuQMM+nwqrclYAoq9XC+3Iov6VT/Xs6wpwBDT1fArFbYFwvhcUri2Mb7
	 zJBVnBdPSalWeUtd1c/2EPHlNCZSoXBFG5pXjoL3v8rW2fRawmhr9BtkOS89qfT3cb
	 wKSZbtFmJ+1mdXY4ngtB+hJjWgQsPWdDq6Ziw+qUmUjAgixAray1SiL3Su8RkHoakF
	 vY/h01988YIziDCHUmmbZVaWxzC6gWIrTLLk2YbStXFwJjNovyEriSgQzDoEDpW56a
	 FvBZeATeA93/w==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C701217E0CD7;
	Mon, 23 Nov 2026 21:25:44 +0100 (CET)
Message-ID: <8624fb6a39e5e13466882f01ea54842252f154af.camel@collabora.com>
Subject: Re: [PATCH v8 09/11] media: chips-media: wave6: Add performance
 profiling
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Nas Chung <nas.chung@chipsnmedia.com>, Frank Li <Frank.li@oss.nxp.com>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>, "hverkuil@kernel.org"	
 <hverkuil@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
 "krzk+dt@kernel.org"	 <krzk+dt@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>,  "Frank.Li@nxp.com"	 <Frank.Li@nxp.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
 "linux-media@vger.kernel.org"	 <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org"	 <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>, 
 "linux-arm-kernel@lists.infradead.org"	
 <linux-arm-kernel@lists.infradead.org>, "festevam@gmail.com"	
 <festevam@gmail.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
 "ming.qian@oss.nxp.com"	 <ming.qian@oss.nxp.com>, "marek.vasut@mailbox.org"
 <marek.vasut@mailbox.org>,  "jackson.lee" <jackson.lee@chipsnmedia.com>,
 "lafley.kim" <lafley.kim@chipsnmedia.com>
Date: Mon, 23 Nov 2026 15:25:43 -0500
In-Reply-To: <SL2P216MB244104B49860D6D6B3A92821FB452@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
	 <5702baa6ed97eb30dec14bddba2919252ec8f3c8.1795075582.git.nas.chung@chipsnmedia.com>
	 <av9iadpXveXGb0R0@SMW015318>
	 <SL2P216MB244104B49860D6D6B3A92821FB452@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
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
	protocol="application/pgp-signature"; boundary="=-hywlTlSbm67gmuaBuGD6"
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

--=-hywlTlSbm67gmuaBuGD6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 23 novembre 2026 =C3=A0 09:18 +0000, Nas Chung a =C3=A9crit=C2=A0:
> Hi, Frank.
>=20
> > -----Original Message-----
> > From: Frank Li <Frank.li@oss.nxp.com>
> > Sent: Friday, November 20, 2026 5:56 AM
> > To: Nas Chung <nas.chung@chipsnmedia.com>
> > Cc: mchehab@kernel.org; hverkuil@kernel.org; robh@kernel.org;
> > krzk+dt@kernel.org; conor+dt@kernel.org; Frank.Li@nxp.com;
> > s.hauer@pengutronix.de; linux-media@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
> > festevam@gmail.com; kernel@pengutronix.de; nicolas.dufresne@collabora.c=
om;
> > ming.qian@oss.nxp.com; marek.vasut@mailbox.org; jackson.lee
> > <jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>
> > Subject: Re: [PATCH v8 09/11] media: chips-media: wave6: Add performanc=
e
> > profiling
> >=20
> > On Thu, Nov 19, 2026 at 06:00:03PM +0900, Nas Chung wrote:
> > > Add per-instance performance profiling to help identify whether a
> > > throughput problem comes from the firmware or from the host side.
> >=20
> > why not register as perf interface?
>=20
> The numbers are kept per instance (per open file). Each instance has
> its own fps, latency and min/max frame time, and they are updated each
> time one of its frames is done.
>=20
> As far as I know, perf can only count per CPU or per task, and a device
> PMU usually counts for the whole system. So perf would only show the
> total of all instances, and we could not get the min/max frame time
> from it.

My preference would then go toward .fdinfo() then instead of custom debug f=
s. It
gives the FD owner the right to see the statistics and not just root. Here'=
s an
example of in progress attempt. The idea is that some key would be generali=
zed
and documented and some other key would be driver specific (e.g. wave6- pre=
fix).

https://lore.kernel.org/all/20260706-v4l2-add-fdinfo-v3-0-d556568cf38e@coll=
abora.com/

Then once we've upstream v4l2top, one can track the performance live, and y=
ou
can even add driver specific metrics.

Nicolas

>=20
> Thanks.
> Nas.
>=20
> >=20
> > Frank
> >=20

--=-hywlTlSbm67gmuaBuGD6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawShRwAKCRDZQZRRKWBy
9PT1APwIoRkl5PprFS3ATJ/OPwAb4iqJR1TdxwP7/noc44qDbAD+N7Yli8uqL8oV
LEytlo3i71WPvgSfaRViB9O04fQiyQw=
=qWVx
-----END PGP SIGNATURE-----

--=-hywlTlSbm67gmuaBuGD6--
