Received: from mx2.securetransport.de (mx2.securetransport.de [188.68.39.254])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9D01FCC63
	for <imx@lists.linux.dev>; Wed, 16 Oct 2024 08:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.39.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729067783; cv=none; b=XVcgLTwGcpw4eJqmB31xk3dBfKn2xag9VP6jr5v+2McHPI9PmxsEqdGxZMOTc7R8kgaEw7uH2/W3Zyf0lfh0y8RneC1U4XiERZo/8EgwMl7QFevU8RnlT/o/y4ktXjVPfQGfSfKoJrIYf8v6xUHGYP7k0P+U0JsBlPjmu11aeIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729067783; c=relaxed/simple;
	bh=IwP04WKBaCP21en/MlLDdR9XF2WptB09LVN1jFJ0wcs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AXOG6BnYg6+boSokNsZWnMWHO9/mIYS2gnOo03b73oeLuAKDrTZ5ZZb0VFtLPzV5L+305/HSl45/E3YCQiwZORfmgJhS1/Nru4cnWhuPeLViTb+KZIeD9JFu3Den1qOcZLq+9EsTtS0vAtcDsCR2bFfcijOROhqo+1JO16KbB1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com; spf=pass smtp.mailfrom=dh-electronics.com; dkim=pass (2048-bit key) header.d=dh-electronics.com header.i=@dh-electronics.com header.b=mqCQhPKl; arc=none smtp.client-ip=188.68.39.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dh-electronics.com header.i=@dh-electronics.com header.b="mqCQhPKl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1729067614;
	bh=IwP04WKBaCP21en/MlLDdR9XF2WptB09LVN1jFJ0wcs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=mqCQhPKlM9pxgugBrxlrGanrVgjCUDh9OgF0YxCtV4pL25KQyltq8AWHsimRLEFNA
	 yLkrxnm+XLDsdHidT06SsE/pm++IS+yrsu6ZBlIJPgJqIpuzgyPnHjCdq7UJX6x87u
	 UjfNK2IplpO6Arv+WjTVAoiYnZxd6QquJbpoTNRdB5pSQrL/AGgLGj1R2PeImHojRd
	 XQxB5DokCLsAjxJOUpM4HNepaP6PZl2Y23MT6s1EXpv0g2hOnqN4aYPclnqbxhKtSn
	 iJGJSupUeN+CBzefrcf6jcasKdMPc2BHlHqgWWK3angw2rwHKC6u5mG6xDyQKOWGs4
	 oJYkIRJ6FYkAg==
X-secureTransport-forwarded: yes
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: Marek Vasut <marex@denx.de>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
CC: Alexander Stein <alexander.stein@ew.tq-group.com>, Conor Dooley
	<conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Gregor Herburger
	<gregor.herburger@ew.tq-group.com>, Hiago De Franco
	<hiago.franco@toradex.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, "Joao
 Paulo Goncalves" <joao.goncalves@toradex.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Mathieu Othacehe <m.othacehe@gmail.com>, Max Merchel
	<Max.Merchel@ew.tq-group.com>, Michael Walle <mwalle@kernel.org>, "Parthiban
 Nallathambi" <parthiban@linumiz.com>, Peng Fan <peng.fan@nxp.com>,
	"Pengutronix Kernel Team" <kernel@pengutronix.de>, Rob Herring
	<robh@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, Shawn Guo
	<shawnguo@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	kernel <kernel@dh-electronics.com>
Subject: RE: [PATCH 2/2] ARM: dts: imx6dl: Add support for i.MX6DL DHCOM SoM
 on PDK2 carrier board
Thread-Topic: [PATCH 2/2] ARM: dts: imx6dl: Add support for i.MX6DL DHCOM SoM
 on PDK2 carrier board
Thread-Index: AQHbH15Xo7DcQ/Ms30iV0KSi5xSbHrKJDUUw
Date: Wed, 16 Oct 2024 08:33:31 +0000
Message-ID: <2f78b2c77c5f4876824759b6210874d7@dh-electronics.com>
References: <20241015235926.168582-1-marex@denx.de>
 <20241015235926.168582-2-marex@denx.de>
In-Reply-To: <20241015235926.168582-2-marex@denx.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

RnJvbTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+DQpTZW50OiBXZWRuZXNkYXksIE9jdG9i
ZXIgMTYsIDIwMjQgMTo1OSBBTQ0KPiBBZGQgc3VwcG9ydCBmb3IgdGhlIERIIGVsZWN0cm9uaWNz
IGkuTVg2REwgREhDT00gU29NIGFuZCBhIFBESzIgZXZhbHVhdGlvbg0KPiBib2FyZC4gVGhlIGV2
YWx1YXRpb24gYm9hcmQgZmVhdHVyZXMgdGhyZWUgc2VyaWFsIHBvcnRzLCBVU0IgT1RHLCBVU0Ig
aG9zdA0KPiB3aXRoIGFuIFVTQiBodWIsIEZhc3Qgb3IgR2lnYWJpdCBldGhlcm5ldCwgZU1NQywg
dVNELCBTRCwgYW5hbG9nIGF1ZGlvLA0KPiBQQ0llIGFuZCBIRE1JIHZpZGVvIG91dHB1dC4NCj4g
DQo+IEFsbCBvZiB0aGUgYWZvcmVtZW50aW9uZWQgZmVhdHVyZXMgZXhjZXB0IGZvciBtU0FUQSBh
cmUgc3VwcG9ydGVkLCBtU0FUQQ0KPiBpcyBub3QgYXZhaWxhYmxlIG9uIGkuTVg2REwgYW5kIGlz
IG9ubHkgYXZhaWxhYmxlIG9uIERIQ09NIHBvcHVsYXRlZCB3aXRoDQo+IGkuTVg2USBTb0Mgd2hp
Y2ggaXMgYWxyZWFkeSBzdXBwb3J0ZWQgdXBzdHJlYW0uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBN
YXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4NCj4gLS0tDQo+IENjOiBBbGV4YW5kZXIgU3RlaW4g
PGFsZXhhbmRlci5zdGVpbkBldy50cS1ncm91cC5jb20+DQo+IENjOiBDaHJpc3RvcGggTmllZGVy
bWFpZXIgPGNuaWVkZXJtYWllckBkaC1lbGVjdHJvbmljcy5jb20+DQo+IENjOiBDb25vciBEb29s
ZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+DQo+IENjOiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBn
bWFpbC5jb20+DQo+IENjOiBHcmVnb3IgSGVyYnVyZ2VyIDxncmVnb3IuaGVyYnVyZ2VyQGV3LnRx
LWdyb3VwLmNvbT4NCj4gQ2M6IEhpYWdvIERlIEZyYW5jbyA8aGlhZ28uZnJhbmNvQHRvcmFkZXgu
Y29tPg0KPiBDYzogSHVnbyBWaWxsZW5ldXZlIDxodmlsbGVuZXV2ZUBkaW1vbm9mZi5jb20+DQo+
IENjOiBKb2FvIFBhdWxvIEdvbmNhbHZlcyA8am9hby5nb25jYWx2ZXNAdG9yYWRleC5jb20+DQo+
IENjOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+DQo+IENjOiBNYXJl
ayBWYXN1dCA8bWFyZXhAZGVueC5kZT4NCj4gQ2M6IE1hdGhpZXUgT3RoYWNlaGUgPG0ub3RoYWNl
aGVAZ21haWwuY29tPg0KPiBDYzogTWF4IE1lcmNoZWwgPE1heC5NZXJjaGVsQGV3LnRxLWdyb3Vw
LmNvbT4NCj4gQ2M6IE1pY2hhZWwgV2FsbGUgPG13YWxsZUBrZXJuZWwub3JnPg0KPiBDYzogUGFy
dGhpYmFuIE5hbGxhdGhhbWJpIDxwYXJ0aGliYW5AbGludW1pei5jb20+DQo+IENjOiBQZW5nIEZh
biA8cGVuZy5mYW5AbnhwLmNvbT4NCj4gQ2M6IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtIDxrZXJu
ZWxAcGVuZ3V0cm9uaXguZGU+DQo+IENjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0K
PiBDYzogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPg0KPiBDYzogU2hhd24g
R3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPg0KPiBDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5v
cmcNCj4gQ2M6IGlteEBsaXN0cy5saW51eC5kZXYNCj4gQ2M6IGtlcm5lbEBkaC1lbGVjdHJvbmlj
cy5jb20NCj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiAtLS0N
Cj4gIGFyY2gvYXJtL2Jvb3QvZHRzL254cC9pbXgvTWFrZWZpbGUgICAgICAgICAgICB8ICAxICsN
Cj4gIC4uLi9ib290L2R0cy9ueHAvaW14L2lteDZkbC1kaGNvbS1wZGsyLmR0cyAgICB8IDIwICsr
KysrKysrKysrKysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQ0K
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL254cC9pbXgvaW14NmRsLWRo
Y29tLXBkazIuZHRzDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvbnhwL2lt
eC9NYWtlZmlsZSBiL2FyY2gvYXJtL2Jvb3QvZHRzL254cC9pbXgvTWFrZWZpbGUNCj4gaW5kZXgg
OTJlMjkxNjAzZWExMy4uNTQxZWViYjk2OGNmNCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm0vYm9v
dC9kdHMvbnhwL2lteC9NYWtlZmlsZQ0KPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9ueHAvaW14
L01ha2VmaWxlDQo+IEBAIC03Myw2ICs3Myw3IEBAIGR0Yi0kKENPTkZJR19TT0NfSU1YNlEpICs9
IFwNCj4gICAgICAgICBpbXg2ZGwtY3Vib3gtaS1lbW1jLXNvbS12MTUuZHRiIFwNCj4gICAgICAg
ICBpbXg2ZGwtY3Vib3gtaS1zb20tdjE1LmR0YiBcDQo+ICAgICAgICAgaW14NmRsLWRmaS1mczcw
MC1tNjAuZHRiIFwNCj4gKyAgICAgICBpbXg2ZGwtZGhjb20tcGRrMi5kdGIgXA0KPiAgICAgICAg
IGlteDZkbC1kaGNvbS1waWNvaXR4LmR0YiBcDQo+ICAgICAgICAgaW14NmRsLWVja2VsbWFubi1j
aTR4MTAuZHRiIFwNCj4gICAgICAgICBpbXg2ZGwtZW1jb24tYXZhcmkuZHRiIFwNCj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL254cC9pbXgvaW14NmRsLWRoY29tLXBkazIuZHRzDQo+
IGIvYXJjaC9hcm0vYm9vdC9kdHMvbnhwL2lteC9pbXg2ZGwtZGhjb20tcGRrMi5kdHMNCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwMC4uMzgyMzU5MjUyNTdhNw0K
PiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL254cC9pbXgvaW14NmRs
LWRoY29tLXBkazIuZHRzDQo+IEBAIC0wLDAgKzEsMjAgQEANCj4gKy8vIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wKw0KPiArLyoNCj4gKyAqIENvcHlyaWdodCAoQykgMjAyNCBNYXJl
ayBWYXN1dCA8bWFyZXhAZGVueC5kZT4NCj4gKyAqDQo+ICsgKiBESENPTSBpTVg2IHZhcmlhbnQ6
DQo+ICsgKiBESENNLWlNWDZETC1DMDgwLVIxMDItRjA4MTktRS1TRC1SVEMtVC1IUy1JLTAxRDIN
Cj4gKyAqIERIQ09NIFBDQiBudW1iZXI6IDQ5My00MDAgb3IgbmV3ZXINCj4gKyAqIFBESzIgUENC
IG51bWJlcjogNTE2LTQwMCBvciBuZXdlcg0KPiArICovDQo+ICsvZHRzLXYxLzsNCj4gKw0KPiAr
I2luY2x1ZGUgImlteDZkbC5kdHNpIg0KPiArI2luY2x1ZGUgImlteDZxZGwtZGhjb20tc29tLmR0
c2kiDQo+ICsjaW5jbHVkZSAiaW14NnFkbC1kaGNvbS1wZGsyLmR0c2kiDQo+ICsNCj4gKy8gew0K
PiArICAgICAgIG1vZGVsID0gIkRIIGVsZWN0cm9uaWNzIGkuTVg2REwgREhDT00gb24gUHJlbWl1
bSBEZXZlbG9wZXIgS2l0ICgyKSI7DQo+ICsgICAgICAgY29tcGF0aWJsZSA9ICJkaCxpbXg2ZGwt
ZGhjb20tcGRrMiIsICJkaCxpbXg2ZGwtZGhjb20tc29tIiwNCj4gKyAgICAgICAgICAgICAgICAg
ICAgImZzbCxpbXg2ZGwiOw0KPiArfTsNCg0KUmV2aWV3ZWQtYnk6IENocmlzdG9waCBOaWVkZXJt
YWllciA8Y25pZWRlcm1haWVyQGRoLWVsZWN0cm9uaWNzLmNvbT4NCg==
