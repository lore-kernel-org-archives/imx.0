Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.39.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099833;
	b=PAgzGKK3ECPDhJ2T/Xe85ShmtamT7zvGMTndpddtRjqozXQFWDfZV3YwnnesBzvrQs7c
	 fMyoVgqlEkgMxahfiqh4XeKoq1JQT8S9OzQe7zKZzY2a4uZLwgiDgfGtnrOHw1sUkn6Hn
	 0i9GUe9sXCJxEcDJCjKIj0htM2Q7HDIHeCXHhuRzLsOJvnfgAZEYhOD55t30wNazh0hJQ
	 b9JoKsFVbdyRjj9SKopL03AlOyG011Jr9uvwWWYvHh76RZbzitQjCCOf0eSXuB72wGxaw
	 xwTEwG9rt7TQzJa+Swty+RsK0ShWB1/tFZw3rWxa3sA6YLlC27dpUeN7wcfF/YE7NVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099833;
	h=DMARC-Filter:DKIM-Signature:X-secureTransport-forwarded:From:
	 Complaints-To:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ZjK1vgESlI4vCfs31jSZGTJa+4SaOMucEG4B3RP35Z0=;
	b=L8IsQPwKQJCeUEJOvY/la/fMRph2KiqmDDrKP+5wDnWWKXjfBtoqNhE6NuAxT+s2lh+S
	 w9K4j/6TyB1p2/yLU11UFdUZNlSliuI6oUJJPQhefzpWkzy2VmEzKGxXO5Duhn6ypDw9q
	 ZR7YmP9g72YqWtVaJXoQviLAZQj9044My1HN8OHgu35Ndvow9uYNgmy7DUjRtX1bYiowl
	 nXYJ23d2VQY1rPgRG2KmGeooW3EBek777InZZpMeu4gbPu6SplFKOdcV+3SyLB8j8h07z
	 QRTUrmZF48+yxVRqqY4t7eDoi5ZyAQD7Fy/r0KD1/mBM/EwJemKM0wGajrnIH+WwtOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dh-electronics.com;
	spf=pass smtp.mailfrom=dh-electronics.com;
	dkim=pass header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=V5dpu8An;
	arc=none smtp.remote-ip=188.68.39.254
Received: from mx2.securetransport.de (mx2.securetransport.de [188.68.39.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E245606A31A
	for <imx@lists.linux.dev>; Tue, 27 Oct 2026 11:17:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E245606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=V5dpu8An
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1793099796;
	bh=ZjK1vgESlI4vCfs31jSZGTJa+4SaOMucEG4B3RP35Z0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=V5dpu8AnUorH811a5/mQlFL2sNkquv2ahWWbkvYMLoiZPwYpKN6R2qJSUsoIaZ99g
	 C2hmuDjkfTgZ2alVLwGokB2HhWBveKSqB58N/Pe0OH2FYr2FV8LQO9GxBlacUgEYdn
	 A+yzQiW3PVvZniIxBNVsbHZ01wYjUO9uHTj3BasKMfQ3VGD4UVgYwO3vv90zy5n2Ig
	 NX/b55q3o4hVUgJ6e1enxtTDNv2PoIAbK7tAjZJz9gvChlAUAbFMa3E4MzYg/2GzDG
	 BllIdjer4xJ8K7iphitrWZk4UcPFYK4/91WGkMg3Mn6Uf3FTTrYki5dSvYirBI5dwV
	 yNBa4t8K4Fozg==
X-secureTransport-forwarded: yes
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: Marek Vasut <marex@nabladev.com>, Francesco Dolcini <francesco@dolcini.it>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	kernel <kernel@dh-electronics.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] ARM: dts: imx6ull-dhcor-maveo-box: Remove unused SPI
 device
Thread-Topic: [PATCH 1/2] ARM: dts: imx6ull-dhcor-maveo-box: Remove unused SPI
 device
Thread-Index: AQHdYWJZTE2xKAx+vUqMiv2pzw4VvLcIHF4AgAAVrACAAAUxgIABDqQA///kbACAADcugP//7M4AgAf3puA=
Date: Tue, 27 Oct 2026 11:16:33 +0000
Message-ID: <ba292bb3688545aab7cb46cca5d58fe6@dh-electronics.com>
References: <20261021134435.17350-1-cniedermaier@dh-electronics.com>
 <1073daf0-3676-4123-9ca4-c182ea5883a3@nabladev.com>
 <20261021183704.GA1116319@francesco-nb>
 <d4b9c444-a848-4b4f-9273-1c832db45fc8@nabladev.com>
 <71d725ee47804205826bdda322fdfdb6@dh-electronics.com>
 <20261022092536.GA232648@francesco-nb>
 <794745ff1c484257bef4f17917f3cf0e@dh-electronics.com>
 <948d901e-ee1c-45f3-9946-30cea28a6128@nabladev.com>
In-Reply-To: <948d901e-ee1c-45f3-9946-30cea28a6128@nabladev.com>
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

RnJvbTogTWFyZWsgVmFzdXQgPG1hcmV4QG5hYmxhZGV2LmNvbT4NClNlbnQ6IFRodXJzZGF5LCBP
Y3RvYmVyIDIyLCAyMDI2IDE6MzQgUE0NCj4gT24gMTAvMjIvMjYgMTI6NTggUE0sIENocmlzdG9w
aCBOaWVkZXJtYWllciB3cm90ZToNCj4gDQo+IEhlbGxvIENocmlzdG9waCwNCj4gDQo+Pj4+Pj4+
PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9ueHAvaW14L2lteDZ1bGwtZGhjb3ItbWF2ZW8tYm94
LmR0cw0KPj4+Pj4+Pj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvbnhwL2lteC9pbXg2dWxsLWRo
Y29yLW1hdmVvLWJveC5kdHMNCj4+Pj4+Pj4+IEBAIC02MCwxNCArNjAsNiBAQCAmZWNzcGk0IHsN
Cj4+Pj4+Pj4+ICAgICAgcGluY3RybC0wID0gPCZwaW5jdHJsX2Vjc3BpND47DQo+Pj4+Pj4+PiAg
ICAgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+Pj4+Pj4+PiAgICAgIHN0YXR1cyA9ICJv
a2F5IjsNCj4+Pj4+Pj4NCj4+Pj4+Pj4gRHJvcCAic3RhdHVzID0gIm9rYXkiIiB0b28gLCBzaW5j
ZSB0aGlzIGNvbnRyb2xsZXIgd2lsbCBiZSB1bnVzZWQgPw0KPj4+Pj4+DQo+Pj4+Pj4geW91IGNh
biBpbnN0YW50aWF0ZSBhIG5ldyBkZXZpY2Ugb24gdGhlIFNQSSBidXMgZnJvbSB1c2Vyc3BhY2Uu
IHVwIHRvDQo+Pj4+Pj4geW91LCBidXQgaWYgSSB3YXMgYSB1c2VyIEkgd291bGQgYXBwcmVjaWF0
ZSB0byBoYXZlIGl0IGVuYWJsZWQuDQo+Pj4+PiBHb29kIHBvaW50IC0tIENocmlzdG9waCwgaXMg
dGhpcyB0aGUgKHVzZSljYXNlIGhlcmUgLCBjYW4gdGhlIHVzZXIgZG8gdGhhdD8NCj4+Pj4NCj4+
Pj4gSSBkb24ndCB0aGluayB0aGF0J3MgdGhlIGNhc2UsIHNpbmNlIHRoZXJlIGlzbid0IGN1cnJl
bnRseSBhbiBTUEkgZGV2aWNlDQo+Pj4+IGNvbm5lY3RlZCB0byB0aGlzIGludGVyZmFjZS4gTmV2
ZXJ0aGVsZXNzLCBJJ2QgYmUgaW50ZXJlc3RlZCB0byBrbm93IGhvdw0KPj4+PiB0byBpbnN0YW50
aWF0ZSBhIG5ldyBkZXZpY2UgZnJvbSB1c2VyIHNwYWNlLg0KPj4+DQo+Pj4gRG9jdW1lbnRhdGlv
bi9zcGkvaW5zdGFudGlhdGluZy1kZXZpY2VzLnJzdA0KPj4NCj4+IFRoaXMgaXMgYSByZWxhdGl2
ZWx5IG5ldyBkb2N1bWVudCwgSSBoYXZlbid0IHNlZW4gaXQgeWV0LiBUaGFuayB5b3UgdmVyeSBt
dWNoLg0KPj4NCj4+IEknbSBub3cgbGVhbmluZyB0b3dhcmQgbGVhdmluZyB0aGUgaW50ZXJmYWNl
IHNldCB0byDigJxva2F54oCdIHNvIHRoYXQgdGhlIGV4aXN0aW5nDQo+PiBTUEkgcGlucyBvbiBY
MTAgY29ubmVjdG9yIGNhbiBlYXNpbHkgYWNjZXNzZWQgaW4gdGhlIGZ1dHVyZS4NCj4gDQo+IElm
IHlvdSBjb25uZWN0IGFueXRoaW5nIG1vcmUgY29tcGxleCB0aGFuIGEgc2ltcGxlIGRldmljZSwg
eW91IHdvdWxkDQo+IGFueXdheSBuZWVkIGEgRFQgb3ZlcmxheSBmb3IgdGhpcy4NCj4gDQo+PiBA
TWFyZWs6IElmIHlvdSBpbnNpc3QsIEkgY2FuIGFsc28gcmVtb3ZlIHRoZSBzdGF0dXMgbGluZS4N
Cj4gRWl0aGVyIHdheSBpcyBmaW5lIGJ5IG1lLCBidXQgY29uc2lkZXIgdGhlIGFib3ZlLg0KDQpJ
IHdpbGwgcmVtb3ZlIHRoZSBva2F5IHN0YXR1cyBpbiB2ZXJzaW9uIDIuDQoNClJlZ2FyZHMNCkNo
cmlzdG9waA0K
