Received: from mx2.securetransport.de (mx2.securetransport.de [188.68.39.254])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEACD1FCC68
	for <imx@lists.linux.dev>; Wed, 16 Oct 2024 08:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.39.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729067901; cv=none; b=eAWe42oTytcqabzD6ZQAH0r+lNfT8rPo1WGiQoJdbd12KKCl1o85BtBdvfxpoyGwOcJlxZwsgM8nOYVJYEKhnfxte2fk6JtX+HxrSCTJ2yWlpZzzO3Zg7/oUQiN+yaODtfDKXtvDDhC9PZXAPwQgUDplqLxnPoJoctUG8CAkPok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729067901; c=relaxed/simple;
	bh=ewoe3vedlayS1xEi+v/MXlGCg/D0oEtfIAcvhqAp/W4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iQ+7z3eqvclSwKwfV9MShS3llj5XMLQeJnQIMu478MVNxsrOcWrWMBopkjt2Gw9M6qJ/8PnMCmEZN0VLUX7qXARDMC8SzPfeCOC765Db7ajwBgZGKnFWyxc7M/K7Q+nYZpSUDj6PucGIPHljsbRHojFnm8XTmCWa/AovojSwFaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com; spf=pass smtp.mailfrom=dh-electronics.com; dkim=pass (2048-bit key) header.d=dh-electronics.com header.i=@dh-electronics.com header.b=oVVbZI1m; arc=none smtp.client-ip=188.68.39.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dh-electronics.com header.i=@dh-electronics.com header.b="oVVbZI1m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1729067280;
	bh=ewoe3vedlayS1xEi+v/MXlGCg/D0oEtfIAcvhqAp/W4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=oVVbZI1mStK0sJhVws02cGYagr5a4BieIRVjDPK4z+jXQW19KLPeaWTd2URL8JSKx
	 h0BTZAG374fD86uZv4zNs/gDmXC+PDnbWS5idMmCZko3JLiBCRTl3nsyFw2n5s/9Vo
	 7NnO/SpD2iedh8PRM84swT3JtYKLtzaNckGwrebY3sZI2KFNg7ycZoOgpTopG1lxag
	 aRwUSvZX6BYUcVP6HwP2Pj7uGJTgwVebVX99ArkzzIm+znHAaVA2Ik5BEfWkINBgfF
	 OS4BCqbd6VNHFE/fj2qyQmkAiB+X9aHxVxgfcKAVZx1l9Wp77wCHX7NyGybA9TsTGD
	 ocUgq5/tcfUlg==
X-secureTransport-forwarded: yes
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: Marek Vasut <marex@denx.de>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
CC: Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, kernel
	<kernel@dh-electronics.com>
Subject: RE: [PATCH] ARM: dts: imx6qdl-dhcom-som: Drop bogus
 regulator-suspend-mem-microvolt
Thread-Topic: [PATCH] ARM: dts: imx6qdl-dhcom-som: Drop bogus
 regulator-suspend-mem-microvolt
Thread-Index: AQHbH1Pa5VAylNnm602N/DDrWsmwgrKJC7YQ
Date: Wed, 16 Oct 2024 08:27:54 +0000
Message-ID: <852fe9261ac941d29f691abcf3c5604b@dh-electronics.com>
References: <20241015224436.94334-1-marex@denx.de>
In-Reply-To: <20241015224436.94334-1-marex@denx.de>
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
ZXIgMTYsIDIwMjQgMTI6NDQgQU0NCj4gRHJvcCB1bnVzZWQgcmVndWxhdG9yLXN1c3BlbmQtbWVt
LW1pY3Jvdm9sdCBwcm9wZXJ0eSBmcm9tIFBNSUMgcmVndWxhdG9yIG5vZGVzLg0KPiBUaGlzIHBy
b3BlcnR5IGlzIG5vdCB1c2VkIGJ5IGVpdGhlciBVLUJvb3QsIExpbnV4LCBub3IgaXMgaXQgZG9j
dW1lbnRlZCBpbiB0aGUNCj4gRFQgYmluZGluZ3MsIHJlbW92ZSBpdC4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPg0KPiAtLS0NCj4gQ2M6IENocmlzdG9w
aCBOaWVkZXJtYWllciA8Y25pZWRlcm1haWVyQGRoLWVsZWN0cm9uaWNzLmNvbT4NCj4gQ2M6IENv
bm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz4NCj4gQ2M6IEZhYmlvIEVzdGV2YW0gPGZl
c3RldmFtQGdtYWlsLmNvbT4NCj4gQ2M6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemsrZHRAa2Vy
bmVsLm9yZz4NCj4gQ2M6IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtIDxrZXJuZWxAcGVuZ3V0cm9u
aXguZGU+DQo+IENjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KPiBDYzogU2FzY2hh
IEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPg0KPiBDYzogU2hhd24gR3VvIDxzaGF3bmd1
b0BrZXJuZWwub3JnPg0KPiBDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGlt
eEBsaXN0cy5saW51eC5kZXYNCj4gQ2M6IGtlcm5lbEBkaC1lbGVjdHJvbmljcy5jb20NCj4gQ2M6
IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiAtLS0NCj4gIGFyY2gvYXJt
L2Jvb3QvZHRzL254cC9pbXgvaW14NnFkbC1kaGNvbS1zb20uZHRzaSB8IDIgLS0NCj4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jv
b3QvZHRzL254cC9pbXgvaW14NnFkbC1kaGNvbS1zb20uZHRzaQ0KPiBiL2FyY2gvYXJtL2Jvb3Qv
ZHRzL254cC9pbXgvaW14NnFkbC1kaGNvbS1zb20uZHRzaQ0KPiBpbmRleCBlYWE4N2IzMzMxNjQ4
Li5hZjBkOTUzOTZjZDUxIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9ueHAvaW14
L2lteDZxZGwtZGhjb20tc29tLmR0c2kNCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvbnhwL2lt
eC9pbXg2cWRsLWRoY29tLXNvbS5kdHNpDQo+IEBAIC0yNTYsNyArMjU2LDYgQEAgc3cxX3JlZzog
c3cxIHsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWd1bGF0b3ItbWF4LW1p
Y3Jvdm9sdCA9IDwxNTI3MjcyPjsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBy
ZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9IDw3ODc1MDA+Ow0KPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJlZ3VsYXRvci1yYW1wLWRlbGF5ID0gPDcwMDA+Ow0KPiAtICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJlZ3VsYXRvci1zdXNwZW5kLW1lbS1taWNyb3ZvbHQgPSA8
MTA0MDAwMD47DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIH07DQo+IA0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICBzdzJfcmVnOiBzdzIgew0KPiBAQCAtMjc1LDcgKzI3NCw2IEBAIHN3M19y
ZWc6IHN3MyB7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVndWxhdG9yLW1h
eC1taWNyb3ZvbHQgPSA8MTUyNzI3Mj47DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcmVndWxhdG9yLW1pbi1taWNyb3ZvbHQgPSA8Nzg3NTAwPjsNCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICByZWd1bGF0b3ItcmFtcC1kZWxheSA9IDw3MDAwPjsNCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICByZWd1bGF0b3Itc3VzcGVuZC1tZW0tbWljcm92b2x0
ID0gPDk4MDAwMD47DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIH07DQo+IA0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICBzdzRfcmVnOiBzdzQgew0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0b3Bo
IE5pZWRlcm1haWVyIDxjbmllZGVybWFpZXJAZGgtZWxlY3Ryb25pY3MuY29tPg0K
