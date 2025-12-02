Received: from mx2.securetransport.de (mx2.securetransport.de [188.68.39.254])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19BE21FF5B
	for <imx@lists.linux.dev>; Tue,  2 Dec 2025 14:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.39.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764686415; cv=none; b=CYJychw/FUBB9FjlpGz3fWc7f1KgHf4AkRCXj5aWBJfiY8Ow4yoks0T9uOlUkOgf+BitEqsTrwfftH16yDq5e6ghvND+Ni1bwK+izZeRIyUcTgYHktU+b8SAGCrrSI2mdGpmXVQh0AC5+1C1T7kZMSdvNDw4Gq1Un8eAL+Lzygw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764686415; c=relaxed/simple;
	bh=aswFcthnfv2rmWTg22G0hBTDeuWReucnE/3ZxaWwGJo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=O2DfmT3WNL4af0VbMWD+AMPlB9ZALDKuWDWA9fdp+LV2aItJay1IPP/ZajEdhL8rPxg+/V+A4/FZthGh74JVMF+mUf6mNUHVoFkixmUByn5NHi8sK1ZWFg9ngdSGziLSJkHJtgNaeZZoRx4PhwrJNNrpoYeuXTLAIDSmCh9OHug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com; spf=pass smtp.mailfrom=dh-electronics.com; dkim=pass (2048-bit key) header.d=dh-electronics.com header.i=@dh-electronics.com header.b=YRqP8cL3; arc=none smtp.client-ip=188.68.39.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dh-electronics.com header.i=@dh-electronics.com header.b="YRqP8cL3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1764685962;
	bh=aswFcthnfv2rmWTg22G0hBTDeuWReucnE/3ZxaWwGJo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=YRqP8cL3tTx9QHaZ8qTclZJmQ2Fv9LLk/4XIxJmCQWxN3L5gKO/TbqcuFlaIJahLZ
	 4qOY7hHGC7HIWHPH+R6R7PRTcqUvpslXYo4g6VwnJyNJNHrqoRuodm/2MvvlhOeU4f
	 NvrXESxKiP3tI7XfUAot4KCpGOyx0jQ9FX1Vo7lor9za73y1ghDtuU8N0ss/pCoEDx
	 kyOflZoCuxWlyvBKdfBu/ZhuJ2JDepng02IwO+Ga9z9OHsG30Rrq5h2OoX1tMoMQoM
	 Q6Fc622OdSUoqmcLLxC2TZHReXjQbRAWS3lmexWSvIGLbGWhOgyNoL6VVuTdtAHc7e
	 Ka6XtUbJhl6wg==
X-secureTransport-forwarded: yes
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: Marek Vasut <marek.vasut@mailbox.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, kernel
	<kernel@dh-electronics.com>
Subject: RE: [PATCH] arm64: dts: imx8mp: Fix LAN8740Ai PHY reference clock on
 DH electronics i.MX8M Plus DHCOM
Thread-Topic: [PATCH] arm64: dts: imx8mp: Fix LAN8740Ai PHY reference clock on
 DH electronics i.MX8M Plus DHCOM
Thread-Index: AQHcY5F4pbnyemf+0kevbalLqYn3ELUOaJJQ
Date: Tue, 2 Dec 2025 14:32:38 +0000
Message-ID: <12d58795b3664ff08e509f0a0929d1b9@dh-electronics.com>
References: <20251202134200.8397-1-marek.vasut@mailbox.org>
In-Reply-To: <20251202134200.8397-1-marek.vasut@mailbox.org>
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

RnJvbTogTWFyZWsgVmFzdXQgPG1hcmVrLnZhc3V0QG1haWxib3gub3JnPg0KU2VudDogVHVlc2Rh
eSwgRGVjZW1iZXIgMiwgMjAyNSAyOjQyIFBNDQo+IEFkZCBtaXNzaW5nICdjbG9ja3MnIHByb3Bl
cnR5IHRvIExBTjg3NDBBaSBQSFkgbm9kZSwgdG8gYWxsb3cgdGhlIFBIWSBkcml2ZXINCj4gdG8g
bWFuYWdlIExBTjg3NDBBaSBDTEtJTiByZWZlcmVuY2UgY2xvY2sgc3VwcGx5LiBUaGlzIGZpeGVz
IHNwb3JhZGljIGxpbmsNCj4gYm91bmNpbmcgY2F1c2VkIGJ5IGludGVycnVwdGlvbnMgb24gdGhl
IFBIWSByZWZlcmVuY2UgY2xvY2ssIGJ5IGxldHRpbmcgdGhlDQo+IFBIWSBkcml2ZXIgbWFuYWdl
IHRoZSByZWZlcmVuY2UgY2xvY2sgYW5kIGFzc3VyZSB0aGVyZSBhcmUgbm8gaW50ZXJydXB0aW9u
cy4NCj4gDQo+IFRoaXMgZm9sbG93cyB0aGUgbWF0Y2hpbmcgUEhZIGRyaXZlciByZWNvbW1lbmRh
dGlvbiBkZXNjcmliZWQgaW4gY29tbWl0DQo+IGJlZGQ4ZDc4YWJhMyAoIm5ldDogcGh5OiBzbXNj
OiBMQU44NzEwLzIwOiBhZGQgcGh5IHJlZmNsayBpbiBzdXBwb3J0IikNCj4gDQo+IEZpeGVzOiA4
ZDY3MTI2OTViYzggKCJhcm02NDogZHRzOiBpbXg4bXA6IEFkZCBzdXBwb3J0IGZvciBESCBlbGVj
dHJvbmljcyBpLk1YOE0gUGx1cyBESENPTQ0KPiBhbmQgUERLMiIpDQo+IFNpZ25lZC1vZmYtYnk6
IE1hcmVrIFZhc3V0IDxtYXJlay52YXN1dEBtYWlsYm94Lm9yZz4NCj4gLS0tDQo+IENjOiBDaHJp
c3RvcGggTmllZGVybWFpZXIgPGNuaWVkZXJtYWllckBkaC1lbGVjdHJvbmljcy5jb20+DQo+IENj
OiBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+DQo+IENjOiBGYWJpbyBFc3RldmFt
IDxmZXN0ZXZhbUBnbWFpbC5jb20+DQo+IENjOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0
QGtlcm5lbC5vcmc+DQo+IENjOiBQZW5ndXRyb25peCBLZXJuZWwgVGVhbSA8a2VybmVsQHBlbmd1
dHJvbml4LmRlPg0KPiBDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4NCj4gQ2M6IFNh
c2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5kZT4NCj4gQ2M6IFNoYXduIEd1byA8c2hh
d25ndW9Aa2VybmVsLm9yZz4NCj4gQ2M6IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnDQo+IENj
OiBpbXhAbGlzdHMubGludXguZGV2DQo+IENjOiBrZXJuZWxAZGgtZWxlY3Ryb25pY3MuY29tDQo+
IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gLS0tDQo+ICBhcmNo
L2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXAtZGhjb20tc29tLmR0c2kgfCAxICsNCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcC1kaGNvbS1zb20uZHRzaQ0KPiBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcC1kaGNvbS1zb20uZHRzaQ0KPiBpbmRleCA2
OGMyZTAxNTZhNWM4Li5mODMwM2I3ZTJiZDIyIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXAtZGhjb20tc29tLmR0c2kNCj4gKysrIGIvYXJjaC9hcm02
NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1wLWRoY29tLXNvbS5kdHNpDQo+IEBAIC0xMTMsNiAr
MTEzLDcgQEAgbWRpbyB7DQo+ICAgICAgICAgICAgICAgICBldGhwaHkwZjogZXRoZXJuZXQtcGh5
QDEgeyAvKiBTTVNDIExBTjg3NDBBaSAqLw0KPiAgICAgICAgICAgICAgICAgICAgICAgICBjb21w
YXRpYmxlID0gImV0aGVybmV0LXBoeS1pZDAwMDcuYzExMCIsDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAiZXRoZXJuZXQtcGh5LWllZWU4MDIuMy1jMjIiOw0KPiArICAg
ICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JmNsayBJTVg4TVBfQ0xLX0VORVRfUU9TPjsN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwmZ3BpbzM+Ow0K
PiAgICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPDE5IElSUV9UWVBFX0xFVkVM
X0xPVz47DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHBpbmN0cmwtMCA9IDwmcGluY3RybF9l
dGhwaHkwPjsNCg0KVGVzdGVkLWJ5OiBDaHJpc3RvcGggTmllZGVybWFpZXIgPGNuaWVkZXJtYWll
ckBkaC1lbGVjdHJvbmljcy5jb20+DQoNClJlZ2FyZHMNCkNocmlzdG9waA0K
