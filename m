Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.39.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683150;
	b=ghug6e4kgLP49/KkQqrKbOYZ+RFB5EUlmuBpAf5DVXfI6stcaaJ3q4NntylRpUqFtNMF
	 GljXContmMOeV/BrVU3Wd7gzoHK/ojspIwRb/oQnvwtjitynps3liI3tu4VtKW2n1+qTH
	 feFd/Gp+Q9YpqvUdvpicWl25evtlo6JUp1C2vNaD8XQKXp/6vpUOK5YucJ0on7JD1mLXi
	 sWhPbbl9C+SnPrhSIyYq91sJ8RnocP9DKXbmkH0DHxOA30G13gwTnkufU3xJZBj567LXN
	 mKZcglyViZKQXyYVKLBt7wM/D/Y8nDGR88VypTTXU+bYvHdnBPfCgZ8i/1nHMR2JqyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683150;
	h=DMARC-Filter:DKIM-Signature:X-secureTransport-forwarded:From:
	 Complaints-To:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=JRdTm7MLn01nzpZdxxiuJqZxEVjGoxZUMxFX5IpmmAw=;
	b=jm/vYiSem2HfcFzURwPY2J+Zp0LoPCz13yS+4Btjg08TpbNQYBAgjcPB+39yc2v2CAkQ
	 e/MqMS+hSzBoUA8hlcy0S/Qc/iTEe3JjaaCY+Cqy72knstqB/ZVV+Q012wq6zf0AF4QYC
	 2jeC7CDJgf0tMjEaJTossvl6i9MzC6ghrkJyeyGA3bzV6XquVS7aQiEWnSn7uc+x051w+
	 cOkwDvllHJUqVztkRiNb+d54NcMfvJuBNx3O9+YN5XLEflPCQ6eG4hwTRRpVMQ9DtxJp0
	 gPtwaeDKq2otnmXyjNQ53WHP/EEJdUeElUKIcl/FR4+p2sahRJCPaa9FCXEtV5DIrvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dh-electronics.com;
	spf=pass smtp.mailfrom=dh-electronics.com;
	dkim=pass header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b="U1iz78/+";
	arc=none smtp.remote-ip=188.68.39.254
Received: from mx2.securetransport.de (mx2.securetransport.de [188.68.39.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A91606A31C
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 08:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8A91606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=U1iz78/+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1795683115;
	bh=JRdTm7MLn01nzpZdxxiuJqZxEVjGoxZUMxFX5IpmmAw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=U1iz78/+fyPLPWeC2+oR4S3SnaaBmqfe+WSxXzeN0L2hdHDTdBRhanRB1OTQvJLZd
	 xQzhWUpwaUoMnAXwscUUiVe7NsHQwV2KEM2V46gOHrOxtEpm3hP77PS48hYs8NQfKw
	 tEnSp8OECKDY/g0smgXwvMkL2L0rzWBaghBMHQ8Io5+yj1lNmQnjsUfZXEnxljIULc
	 Jhl9GRwjQYqHxCwmfIOLPnDPntApFtCXsCRnm4V9240f4z2rSugfwhJXonb7vUzg6U
	 6Xx/CnM/aB1cd7ZxPbfvEIuKyewNReJfgJ8GMyAhZFsjwgUADbN1MtgbtT8Wmi8wiO
	 Xpi+j1geuliww==
X-secureTransport-forwarded: yes
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: Marek Vasut <marex@nabladev.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
CC: Pascal Zimmermann <pzimmermann@dh-electronics.com>, Conor Dooley
	<conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Frank Li
	<Frank.Li@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring
	<robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, kernel
	<kernel@dh-electronics.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH V2] ARM: dts: imx6ull-dhcom: Change eMMC pin configuration
Thread-Topic: [PATCH V2] ARM: dts: imx6ull-dhcom: Change eMMC pin
 configuration
Thread-Index: AQHdfNxvka56chsGIUmKS9A5oSlWCbc+vxUAgAFGNICAAAaZYA==
Date: Thu, 26 Nov 2026 08:51:54 +0000
Message-ID: <5e607c068ea54d5a859e1de82c1574b7@dh-electronics.com>
References: <20261125125621.6734-1-cniedermaier@dh-electronics.com>
 <a57373f2-dfb2-4344-8e2c-6621a623d170@nabladev.com>
 <4ef4ff8128b049d59a0ab23bea906468@dh-electronics.com>
In-Reply-To: <4ef4ff8128b049d59a0ab23bea906468@dh-electronics.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

RnJvbTogQ2hyaXN0b3BoIE5pZWRlcm1haWVyIDxjbmllZGVybWFpZXJAZGgtZWxlY3Ryb25pY3Mu
Y29tPg0KU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDI2LCAyMDI2IDk6MjUgQU0NCj4+IE9uIDEx
LzI1LzI2IDE6NTYgUE0sIENocmlzdG9waCBOaWVkZXJtYWllciB3cm90ZToNCj4+PiBGcm9tOiBQ
YXNjYWwgWmltbWVybWFubiA8cHppbW1lcm1hbm5AZGgtZWxlY3Ryb25pY3MuY29tPg0KPj4+DQo+
Pj4gVGVzdHMgaGF2ZSBzaG93biB0aGF0LCB3aXRoIHRoZSBjdXJyZW50IHBpbiBjb25maWd1cmF0
aW9uIG9mIHRoZQ0KPj4+IGVNTUMgKHVzZGhjMiBpbnRlcmZhY2UpIHJlYWQgZXJyb3JzIGNhbiBv
Y2N1ciB3aXRoIGEgY2VydGFpbg0KPj4+IHR5cGUgb2YgZU1NQyBjaGlwcy4NCj4+DQo+PiBXaGlj
aCBjaGlwcyBhcmUgdGhvc2UgPw0KPiANCj4gVGhlIHByb2JsZW1zIG9jY3VycmVkIHdpdGggY2hp
cHMgZnJvbSBNYWNyb25peC4NCg0KVG8gYmUgbW9yZSBzcGVjaWZpYywgdGhlIG1vZGVsIHRoYXQn
cyBjYXVzaW5nIHByb2JsZW1zIGlzIGNhbGxlZA0KdGhlIE1hY3Jvbml4IE1YNTJMTTA0QTExWFZX
Lg0KDQpSZWdhcmRzDQpDaHJpc3RvcGgNCg==
