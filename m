Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.39.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675448;
	b=4IAGezpuhS+sZmVtwoFRhyhV20tmc0gozbEjDnh5ikVDxGRGCFVgCchlh/tCsmI9Akb+
	 KMV6/y9moBcdvcaYNjYdAH+BUgNqDewUeTuaTnpuNmP3R41e3mGti/nkVwPb+PQdsEXTA
	 R1OkKthitaOk4rG6JGYD034FNNUtORCjYy20S2sLsUI4zmRFs6g8htspv+xtirhuFDV/n
	 UXBz+SRiGLGZKfCbPGO/4hhAhBbAj6Y/j+uVWt+K/lXUlQJdRjYakh29TIOwUL3RA5Azd
	 Aa3AtvPCPKpcdEt9YF9XwzQ7pgVEbeB7DLt5j76OnWVcYCavbwpFUn7NCuwT7rOtcUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675448;
	h=DMARC-Filter:DKIM-Signature:X-secureTransport-forwarded:From:
	 Complaints-To:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=v05ZIqnku0GHaJKR3tI3adEDyHJ/1SXZvwlQME+SFNs=;
	b=fdIw7nztEaSg+k+CUUNu0A2XiJOOSNXkrA5nLzDzrbmmhl0fAd6xl3LI3fRyQDy2FUUI
	 LcAt26zUkMt/07aByby9CPcrG8Ikp/wOyk/2AnK/1fmbUfzYtIyBbJQ5I4UibNOMS2wM8
	 LL7Qkl+wzD+W9TpJ5z4OdTMJU4Vz0H18MGulTSgdsAA5IuepboOAhjm/eukq8zwtIjliq
	 EomokoahfhfI3dfDXx7iorkumAnFjkbIk9EHOq1lsFxGzhbF7MEluiCP13mQ7Txm9UucE
	 Ctnp2ksDBs0VmOE4Icbzlg0GKgs9ORVrDPM9ClwXN+6kUlcgURP9d40uYvfOoKhVkEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dh-electronics.com;
	spf=pass smtp.mailfrom=dh-electronics.com;
	dkim=pass header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b="ryxfwYS/";
	arc=none smtp.remote-ip=188.68.39.254
Received: from mx2.securetransport.de (mx2.securetransport.de [188.68.39.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917BE606A320
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 13:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 917BE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=ryxfwYS/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1792675417;
	bh=v05ZIqnku0GHaJKR3tI3adEDyHJ/1SXZvwlQME+SFNs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ryxfwYS/s+YzRNbUCr9JFnLUeC8x41M3pWi67C0Vp0cm2O7zhIaS0RY+oAdd/77lf
	 U7I+R8aVhAn2Q/qDqPT6EIl3AXfpgTKJmTnCx3et5aJpcamWV82UEN02Bjs3edcBXa
	 ZVMKm/SAyIPxBpH6B80fWQ0v7PxLYzMZROoSUl532EYH/Q6cAZbBQpNRbac2CRlHNC
	 CEyYS/ZoGsqFaE7xtEKRiphJF5t4Y/JOGjtJWA7nTqJ+wH/o/7Hxr2g2wZdeT5kL5D
	 bhkEauN0ElHtdyTzM43r77nQBs0RrCQlArdTI5iFXC3aiCpguH9UTmMfM6l6IfBKW9
	 MbpBuyPSSYBdw==
X-secureTransport-forwarded: yes
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: Marek Vasut <marex@nabladev.com>, Conor Dooley <conor@kernel.org>
CC: "Frank.Li@oss.nxp.com" <Frank.Li@oss.nxp.com>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron
	<jonathan.cameron@oss.qualcomm.com>, Frank Li <Frank.Li@nxp.com>, "Ashish
 Yadav" <ashish.yadav@infineon.com>, Colin Huang <u8813345@gmail.com>, "Sanman
 Pradhan" <psanman@juniper.net>, Thorsten Blum <blum@kernel.org>, Troy
 Mitchell <troy.mitchell@linux.dev>, Eddie James <eajames@linux.ibm.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>, "open list:SPI SUBSYSTEM"
	<linux-spi@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>, kernel
	<kernel@dh-electronics.com>, open list <linux-kernel@vger.kernel.org>, "Mark
 Brown" <broonie@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: RE: [PATCH 1/1] dt-bindings: spi: Add separate binding for
 dh,dhcom-board
Thread-Topic: [PATCH 1/1] dt-bindings: spi: Add separate binding for
 dh,dhcom-board
Thread-Index: AQHdXhJ4wetEp3c+RUWeUdg1WJlLHbcAlj2AgAL8T4CAACG3gIABW++AgAFa0RD///l1AIADLsHg
Date: Thu, 22 Oct 2026 13:23:33 +0000
Message-ID: <420d783dcdf44abf81d09931bd514b3f@dh-electronics.com>
References: <20261016205718.877668-1-Frank.Li@oss.nxp.com>
 <e7095176-44b8-4838-8443-2e515d34cb25@nabladev.com>
 <20261018-freeway-twitch-e813208aa9af@spud>
 <fd15f846-94d4-44d8-a42d-5f13a7b18794@nabladev.com>
 <20261019-cycling-unnatural-c1adbfb5c9d9@spud>
 <05e66d8f57a44c9aa87cac1c35e82184@dh-electronics.com>
 <087bdc09-cf57-444e-aa29-f977998b0024@nabladev.com>
In-Reply-To: <087bdc09-cf57-444e-aa29-f977998b0024@nabladev.com>
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

RnJvbTogTWFyZWsgVmFzdXQgPG1hcmV4QG5hYmxhZGV2LmNvbT4NClNlbnQ6IFR1ZXNkYXksIE9j
dG9iZXIgMjAsIDIwMjYgNDo0MSBQTQ0KPj4+Pj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc3BpL2RoLGRoY29tLWJvYXJkLnlhbWwNCj4+Pj4+Pj4gQEAgLTAsMCAr
MSw0NiBAQA0KPj4+Pj4+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vbmx5
IE9SIEJTRC0yLUNsYXVzZQ0KPj4+Pj4+PiArJVlBTUwgMS4yDQo+Pj4+Pj4+ICstLS0NCj4+Pj4+
Pj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvc3BpL2RoLGRoY29tLWJvYXJk
LnlhbWwjDQo+Pj4+Pj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hl
bWFzL2NvcmUueWFtbCMNCj4+Pj4+Pj4gKw0KPj4+Pj4+PiArdGl0bGU6IERIIGVsZWN0cm9uaWNz
IEdtYkggb24tYm9hcmQgQ1BMRCB0cml2aWFsIFNQSSBkZXZpY2UNCj4+Pj4+Pg0KPj4+Pj4+IFRo
aXMgZG9lcyBub3QgbG9vayBxdWl0ZSByaWdodCwgc2luY2UgY29tcGF0aWJsZSB0aGlzIGlzIHVz
ZWQgb25seSBvbjoNCj4+Pj4+Pg0KPj4+Pj4+IGFyY2gvYXJtL2Jvb3QvZHRzL2lteDZ1bGwtZGhj
b3ItbWF2ZW8tYm94LmR0cw0KPj4+Pj4+DQo+Pj4+Pj4gICAgICAgICAgbW9kZWwgPSAiREggZWxl
Y3Ryb25pY3MgaS5NWDZVTEwgREhDT1Igb24gbWF2ZW8gYm94IjsNCj4+Pj4+PiAgICAgICAgICBj
b21wYXRpYmxlID0gIm1hcmFudGVjLGlteDZ1bGwtZGhjb3ItbWF2ZW8tYm94IiwNCj4+Pj4+PiAi
ZGgsaW14NnVsbC1kaGNvci1zb20iLA0KPj4+Pj4+DQo+Pj4+Pj4gU28gdGhlIHdob2xlDQo+Pj4+
Pj4NCj4+Pj4+PiAgICAgICAgICBzcGlkZXZAMCB7DQo+Pj4+Pj4gICAgICAgICAgICAgICAgICBj
b21wYXRpYmxlID0gImRoLGRoY29tLWJvYXJkIjsNCj4+Pj4+PiAgICAgICAgICAgICAgICAgIHJl
ZyA9IDwwPjsNCj4+Pj4+PiAgICAgICAgICAgICAgICAgIHNwaS1jcGhhOw0KPj4+Pj4+ICAgICAg
ICAgICAgICAgICAgc3BpLWNwb2w7DQo+Pj4+Pj4gICAgICAgICAgICAgICAgICBzcGktbWF4LWZy
ZXF1ZW5jeSA9IDw1NDAwMDAwMD47DQo+Pj4+Pj4gICAgICAgICAgfTsNCj4+Pj4+Pg0KPj4+Pj4+
IFNob3VsZCBwcm9iYWJseSB1c2UgYSBkaWZmZXJlbnQgY29tcGF0aWJsZS4NCj4+Pj4+Pg0KPj4+
Pj4+IENocmlzdG9waCwgd2hhdCBkZXZpY2UgaXMgdGhpcyBvbiB0aGlzIGJvYXJkID8NCj4+DQo+
PiBUaGVyZSBpcyBubyBkZXZpY2UgY29ubmVjdGVkIHRvIHRoZXNlIHBpbnMsIG9ubHkgYW4gZXh0
ZW5zaW9uIGNvbm5lY3Rvci4NCj4+IFRoZSAiZGgsZGhjb20tYm9hcmQiIGRldmljZSB3YXMgdXNl
ZCBvbmx5IHRvIHRlc3QgdGhlIGhhcmR3YXJlIGFuZCB3YXMNCj4+IHVuZm9ydHVuYXRlbHkgZm9y
Z290dGVuIHRvIGJlIHJlbW92ZWQuIEluIHRoZSBwcm9kdWN0aW9uIHZlcnNpb24sIG5vDQo+PiBk
ZXZpY2UgaXMgY29ubmVjdGVkIHRvIHRoaXMgaW50ZXJmYWNlLiBJdCBzaG91bGQgYWN0dWFsbHkg
YmUgcmVtb3ZlZC4NCj4+IFNob3VsZCBJIGNyZWF0ZSBhIHBhdGNoIGZvciB0aGlzPw0KPiANCj4g
SW4gdGhhdCBjYXNlLCBJIHdvdWxkIHN1Z2dlc3QgdG8gcmVtb3ZlIHRoaXMgd2hvbGUgc3BpZGV2
QDAgZnJvbSB0aGlzIERUDQo+IHdpdGggcHJvcGVyIEZpeGVzOiB0YWcgLg0KPiANCj4gWy4uLl0N
Cj4gDQo+ID4+PiBCdXQgaW4gYW55IGNhc2UsIHRoZSBjb21wYXRpYmxlIHN0cmluZyBzaG91bGQg
bGlrZWx5IGJlIGZpeGVkIGhlcmUsIHRoaXMNCj4gPj4+IGRvZXMgbm90IHNlZW0gcmlnaHQuIFRo
ZSBkaCxkaGNvbS1ib2FyZCB3YXMgZGVzY3JpYmluZyBzb21lIENQTEQvRlBHQSBvbiBvbmUNCj4g
Pj4+IG9mIHRoZSBldmFsYm9hcmRzLg0KPiA+Pg0KPiA+PiBZZSBJIGRvbid0IGRpc2FncmVlIHRo
ZXJlLiAiZGhjb20tYm9hcmQiIHNlZW1zIG5vdCBuZWFybHkgc3BlY2lmaWMNCj4gPj4gZW5vdWdo
IGFib3V0IHdoYXQgdGhlIGRldmljZSBpcy4NCj4gPg0KPiA+IFRoZXJlIGlzbid0IGFjdHVhbGx5
IGEgdXNlciBmb3IgdGhpcyBkZXZpY2UsIHNlZSBhYm92ZS4gSXQncyBvbmx5IHVzZWQgZG93bnN0
cmVhbQ0KPiA+IGF0IERIIGVsZWN0cm9uaWNzIGZvciBhIGNvbm5lY3Rpb24gdG8gYSBQU29DIGNo
aXAuIEJ1dCBldmVuIGZvciB0aGlzIHB1cnBvc2UsIGl0J3MNCj4gPiBub3QgYmVpbmcgdXNlZCBj
b3JyZWN0bHkuIFdoYXQgc2hvdWxkIHdlIGRvIG5vdz8NCj4gSSB0aGluayB0aGlzIHBhdGNoIGNh
biBhbHNvIGJlIGRyb3BwZWQsIHRoZSBkaCxkaGNvbS1ib2FyZCB3b3VsZCBiZSBsZWZ0DQo+IGFz
IGEgbGVnYWN5IGNvbXBhdGlibGUgZm9yIHRoZSBDUExEL0ZQR0Egb24gdGhlIERIQ09NIFBESzIg
Ym9hcmQgKHdoZXJlDQo+IGl0IGlzIG5vdCBkZXNjcmliZWQgeWV0LCBidXQgc2hvdWxkIGJlKSAs
IGFuZCB0aGUgZGgtZGhjb20tYm9hcmQgc2hvdWxkDQo+IHJlbWFpbiBhIHRyaXZpYWwgZGV2aWNl
LCBzaW5jZSB0aGUgQ1BMRC9GUEdBIGlzIGNvbm5lY3RlZCB2aWEgc29tZQ0KPiBwYXJhbGxlbCBi
dXMgaWYgSSByZWNhbGwgaXQgcmlnaHQgPw0KDQpZZXMsIG9uIHRoZSBQREsyIHRoZSBDUExEL0ZQ
R0EgaXMgY29ubmVjdGVkIHZpYSBhIHBhcmFsbGVsIGJ1cy4NCg0KUmVnYXJkcw0KQ2hyaXN0b3Bo
DQo=
