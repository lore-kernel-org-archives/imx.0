Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA8615C15A
	for <imx@lists.linux.dev>; Mon, 19 Aug 2024 08:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.26.50.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724056982; cv=none; b=FRrpLymziIv4kzy1osvnl9uUjdnNWcc5FCkxUhf7C/VpGIU7gv8JOt18T6gq3oylB8JAAO7wkJQ8M2YMzd9fSlGVVpYh3Oe9fRK6rLOxlyEhDdNn7bTTskpTdPJWgceuP5Hmgk9ccdegDxw9SYPOCAOmd1S15YJ24IvgI+fI3DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724056982; c=relaxed/simple;
	bh=yX76NXD7yuwE5bpnIfI+VslIisBYeM6nlyWe5Ov1svg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DnOye3+/gRPzw3rZnKMmFWz3/j7g1SFpfDy+1jy9p08FroptFU6s02UiCn1+6Bc8ZTN/BO6LXbecrZmKLiaTOYEjnDyTqQ0DkJVQbGSdtgZ5vO14mSg9HGkKMKR5Mj+yvNhf6rpbpZ3VgdtVem9sQAJmObm6WM5/Bvm8rkdgHXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b=RSgQ9hzj; arc=none smtp.client-ip=91.26.50.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b="RSgQ9hzj"
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1724056979; x=1726648979;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yX76NXD7yuwE5bpnIfI+VslIisBYeM6nlyWe5Ov1svg=;
	b=RSgQ9hzjwUoUr0o4O7FXTz5Ur+Naj09agp93A0th2n28Wz7zdgRmCI19hzDkaH/o
	c6KnQne1FIHFaRDl07GRn+2yuHaIrjon3wWKBlMI95EFUF+EMzHdlja7f7q0EfyL
	H0IssnDt9+FxVWhA9CRkYdun99zN0Eos3ovimpxq5QM=;
X-AuditID: ac14000a-03e52700000021bc-96-66c3059315d8
Received: from florix.phytec.de (Unknown_Domain [172.25.0.13])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 09.37.08636.39503C66; Mon, 19 Aug 2024 10:42:59 +0200 (CEST)
Received: from Berlix.phytec.de (172.25.0.12) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 19 Aug
 2024 10:42:59 +0200
Received: from Berlix.phytec.de ([fe80::197e:d26b:2ca:c7b4]) by
 berlix.phytec.de ([fe80::197e:d26b:2ca:c7b4%4]) with mapi id 15.01.2507.006;
 Mon, 19 Aug 2024 10:42:59 +0200
From: Yannic Moog <Y.Moog@phytec.de>
To: "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"robh@kernel.org" <robh@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, Teresa Remmet
	<T.Remmet@phytec.de>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Benjamin Hahn <B.Hahn@phytec.de>, "Yashwanth
 Varakala" <Y.Varakala@phytec.de>, PHYTEC Upstream <upstream@lists.phytec.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/6] arm64: dts: imx8mp-phyboard-pollux: Assign regulator
 to EEPROM node
Thread-Topic: [PATCH 4/6] arm64: dts: imx8mp-phyboard-pollux: Assign regulator
 to EEPROM node
Thread-Index: AQHa7iwR+O1UuG2be0WJEm5w9TVm17IuKbYA
Date: Mon, 19 Aug 2024 08:42:59 +0000
Message-ID: <128d4c1adaf36b09f81a59b4605029b9ea388789.camel@phytec.de>
References: <20240814-b4-wip-t-remmet-phytec-de-bspimx8m-3392_upstream-v1-0-e2500950c632@phytec.de>
	 <20240814-b4-wip-t-remmet-phytec-de-bspimx8m-3392_upstream-v1-4-e2500950c632@phytec.de>
In-Reply-To: <20240814-b4-wip-t-remmet-phytec-de-bspimx8m-3392_upstream-v1-4-e2500950c632@phytec.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFB563D0710B10478B1D0DC0778DD285@phytec.de>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRmVeSWpSXmKPExsWyRpKBV3cy6+E0g62HhC3W7D3HZDH/yDlW
	i4dX/S1m3mtls1g1dSeLxctZ99gsNj2+xmpxedccNov/e3awW/zdvonF4sUWcYvud+oOPB47
	Z91l99i0qpPNY/OSeo8Xm2cyevR3t7B69P818Pi8SS6APYrLJiU1J7MstUjfLoErY+c6yYJl
	3BW3Zy9namBs4O5i5OSQEDCR6Dlzgq2LkYtDSGAJk0TDqxXMEM59RokpP6YxQTgbGCW633Qx
	g7SwCahInJxxiREkISLwkkli8dTvYA6zwF8miae/QBwODmGBOIkVtxRBTBGBeIk9u/VAekUE
	jCTWfoOYwyKgKjFvywtWEJtXwE3iyYV7YLaQwD5GiV07+UFaOQVSJG6ezAQJMwrISmzYcB6s
	lVlAXGLTs++sEB8ISCzZAxGXEBCVePn4H1RcXuLELZD7OYDqNSXW79KHaLWQuLWyhRHCVpSY
	0v2QHeICQYmTM5+wTGAUn4VkwyyE7llIumch6Z6FpHsBI+sqRqHczOTs1KLMbL2CjMqS1GS9
	lNRNjKB4F2Hg2sHYN8fjECMTB+MhRgkOZiUR3u6XB9OEeFMSK6tSi/Lji0pzUosPMUpzsCiJ
	867uCE4VEkhPLEnNTk0tSC2CyTJxcEo1MLZW+z2u//tn5tVzp59yespPefdnXr7fM7MP3FeS
	7A+9Yn003Uuq9fT+hMMJ5ceb7n3f9ME70fj3IgmZxTP3P/nR+HJV4X6f43G3/xYk1e1YxNPH
	xVpge+HLnR0qM28Y19yep9ETuCphWcLfJyLhJn9Sf/3+dmrKUrG4RxffT7cuTNFM/axiItiv
	xFKckWioxVxUnAgA3qE+4uUCAAA=

T24gV2VkLCAyMDI0LTA4LTE0IGF0IDExOjI2ICswMjAwLCBUZXJlc2EgUmVtbWV0IHdyb3RlOg0K
PiBGcm9tOiBZYXNod2FudGggVmFyYWthbGEgPHkudmFyYWthbGFAcGh5dGVjLmRlPg0KPiANCj4g
QWRkIFZDQ18zVjNfU1cgcmVndWxhdG9yIHJlZmVyZW5jZSB0byB0aGUgRUVQUk9NIG5vZGUgdG8g
cmVmbGVjdCB0aGUNCj4gc2NoZW1hdGljLiBUaGlzIGFsc28gc2lsZW5jZXMgdGhlIGZhbGxiYWNr
IGR1bW15IHJlZ3VsYXRvciB3YXJuaW5nLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWWFzaHdhbnRo
IFZhcmFrYWxhIDx5LnZhcmFrYWxhQHBoeXRlYy5kZT4NCj4gU2lnbmVkLW9mZi1ieTogVGVyZXNh
IFJlbW1ldCA8dC5yZW1tZXRAcGh5dGVjLmRlPg0KUmV2aWV3ZWQtYnk6IFlhbm5pYyBNb29nIDx5
Lm1vb2dAcGh5dGVjLmRlPg0KDQo+IC0tLQ0KPiDCoGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL2lteDhtcC1waHlib2FyZC1wb2xsdXgtcmRrLmR0cyB8IDEgKw0KPiDCoDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvZnJlZXNjYWxlL2lteDhtcC1waHlib2FyZC1wb2xsdXgtcmRrLmR0cw0KPiBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcC1waHlib2FyZC1wb2xsdXgtcmRrLmR0cw0KPiBp
bmRleCAzNDFiYWExNjcxOTEuLjRjZGIzYjlmZmYwOCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm02
NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1wLXBoeWJvYXJkLXBvbGx1eC1yZGsuZHRzDQo+ICsr
KyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcC1waHlib2FyZC1wb2xsdXgt
cmRrLmR0cw0KPiBAQCAtMTcxLDYgKzE3MSw3IEBAIGVlcHJvbUA1MSB7DQo+IMKgCQljb21wYXRp
YmxlID0gImF0bWVsLDI0YzAyIjsNCj4gwqAJCXJlZyA9IDwweDUxPjsNCj4gwqAJCXBhZ2VzaXpl
ID0gPDE2PjsNCj4gKwkJdmNjLXN1cHBseSA9IDwmcmVnX3ZjY18zdjNfc3c+Ow0KPiDCoAl9Ow0K
PiDCoA0KPiDCoAlsZWRzQDYyIHsNCj4gDQoNCg==
