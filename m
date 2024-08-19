Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F4315B125
	for <imx@lists.linux.dev>; Mon, 19 Aug 2024 08:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.26.50.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724056944; cv=none; b=OvAJGHxEVQPk46ngVYfdnp4f/jwTcqG5ypsDmcaAivZxm2Ddibz4eNwGC9cb8vC0DbgJvLUdOJBX1MS5YS2LOMfK4N6eXyErkY5Dn33OrDfurlCV5qx/Re8e4ehkGx/MLgXHNGt75k2aQwpfyCESL7t7tXDVtJhak6sszYvo1rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724056944; c=relaxed/simple;
	bh=smnp8xbRe+5tKLrQRtYAINGl8wvCt9JbQ/sh1hXBT30=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=S12Ox/C1eZVKw/+Qy1IIGP9JrtQbvpQDx8c3IIJiNt7PowdOyJgNezTgXV1PyDQ8XGwDsLimYriA6Ph+W8I8dedQ3cmjykxIsEQegeMgu1F/PsqLtc8Ik1bAUUBjW9hz3daV7z1dAOsgyy6/oTGnWHG2n9vH1fzcD+972uDqa7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b=b02lzLDm; arc=none smtp.client-ip=91.26.50.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b="b02lzLDm"
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1724056941; x=1726648941;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=smnp8xbRe+5tKLrQRtYAINGl8wvCt9JbQ/sh1hXBT30=;
	b=b02lzLDmb82ajLB+MPeiiHmmMd5y2dyAAgs799kjUzgo9ti0iCdp20/BFQwOnArE
	NMBzPnsTb73/xpGk4hcMEFbtsgV/gtmHMj9mBRyUjHx1GPW1o6uvIwSm5en17vUb
	QudqJYpRRgGeOtn7YH8kaIbExDa6o8BYWA2S/QHpGfU=;
X-AuditID: ac14000a-03251700000021bc-8b-66c3056c1437
Received: from florix.phytec.de (Unknown_Domain [172.25.0.13])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id A4.37.08636.C6503C66; Mon, 19 Aug 2024 10:42:20 +0200 (CEST)
Received: from Berlix.phytec.de (172.25.0.12) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 19 Aug
 2024 10:42:20 +0200
Received: from Berlix.phytec.de ([fe80::197e:d26b:2ca:c7b4]) by
 berlix.phytec.de ([fe80::197e:d26b:2ca:c7b4%4]) with mapi id 15.01.2507.006;
 Mon, 19 Aug 2024 10:42:20 +0200
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
Subject: Re: [PATCH 2/6] arm64: dts: imx8mp-phycore: Assign regulator to
 EEPROM node
Thread-Topic: [PATCH 2/6] arm64: dts: imx8mp-phycore: Assign regulator to
 EEPROM node
Thread-Index: AQHa7iwR3i1Kqy4U0EyH9p/VeKWPKbIuKYgA
Date: Mon, 19 Aug 2024 08:42:20 +0000
Message-ID: <ffebeeba9c19502ae73f1cdc521f408ac927b631.camel@phytec.de>
References: <20240814-b4-wip-t-remmet-phytec-de-bspimx8m-3392_upstream-v1-0-e2500950c632@phytec.de>
	 <20240814-b4-wip-t-remmet-phytec-de-bspimx8m-3392_upstream-v1-2-e2500950c632@phytec.de>
In-Reply-To: <20240814-b4-wip-t-remmet-phytec-de-bspimx8m-3392_upstream-v1-2-e2500950c632@phytec.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <09C64A4E9173304DBA9A5CB8150512E9@phytec.de>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRmVeSWpSXmKPExsWyRpKBVzeH9XCawbXtNhZr9p5jsph/5Byr
	xcOr/hYz77WyWayaupPF4uWse2wWmx5fY7W4vGsOm8X/PTvYLf5u38Ri8WKLuEX3O3UHHo+d
	s+6ye2xa1cnmsXlJvceLzTMZPfq7W1g9+v8aeHzeJBfAHsVlk5Kak1mWWqRvl8CV0TDtKFvB
	F66KptftbA2MF7i6GDk5JARMJF5OO8UMYgsJLGGSuPAwtouRC8i+zyjx4tFsRghnA6PEuql/
	WECq2ARUJE7OuASWEBF4ySSxeOp3MIdZ4C+TxNNfIA4nh7BAmMS9k4fYQGwRgXCJtktb2SFs
	I4nHE8+B7WMRUJWY/P4fWD2vgJvEwi/P2SHW7WOU6NmxGCzBKZAi8ebvbSYQm1FAVmLDhvNg
	zcwC4hKbnn1nhXhCQGLJHoi4hICoxMvH/6Di8hInbk0D6uUAqteUWL9LH8K0kHh2MhBiiqLE
	lO6H7BAnCEqcnPmEZQKj+CwkC2YhNM9CaJ6FpHkWkuYFjKyrGIVyM5OzU4sys/UKMipLUpP1
	UlI3MYJiXoSBawdj3xyPQ4xMHIyHGCU4mJVEeLtfHkwT4k1JrKxKLcqPLyrNSS0+xCjNwaIk
	zru6IzhVSCA9sSQ1OzW1ILUIJsvEwSnVwJi9jem04I3J17+o3tQPXy8tt1fj4flMMzHxpvcV
	Xxk/ztqUbTflmHPAlEVagaoXTf07ZcOft8UFSZZvvHnt/tK1txRO51bV/pinv8HVljNt8fPv
	dcwHbqnFNyxxPH9aYbbest9PJyhN/yTU+tLyh9SMsqDA+R/WsCldVvYU/yM/cdNHzskOb7qV
	WIozEg21mIuKEwF885ei5wIAAA==

T24gV2VkLCAyMDI0LTA4LTE0IGF0IDExOjI2ICswMjAwLCBUZXJlc2EgUmVtbWV0IHdyb3RlOg0K
PiBGcm9tOiBZYXNod2FudGggVmFyYWthbGEgPHkudmFyYWthbGFAcGh5dGVjLmRlPg0KPiANCj4g
QWRkIFZERF9JTyByZWd1bGF0b3IgcmVmZXJlbmNlIHRvIHRoZSBFRVBST00gbm9kZSB0byByZWZs
ZWN0IHRoZQ0KPiBzY2hlbWF0aWMuIFRoaXMgYWxzbyBzaWxlbmNlcyB0aGUgZmFsbGJhY2sgZHVt
bXkgcmVndWxhdG9yIHdhcm5pbmcuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBZYXNod2FudGggVmFy
YWthbGEgPHkudmFyYWthbGFAcGh5dGVjLmRlPg0KPiBTaWduZWQtb2ZmLWJ5OiBUZXJlc2EgUmVt
bWV0IDx0LnJlbW1ldEBwaHl0ZWMuZGU+DQpSZXZpZXdlZC1ieTogWWFubmljIE1vb2cgPHkubW9v
Z0BwaHl0ZWMuZGU+DQoNCj4gLS0tDQo+IMKgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUv
aW14OG1wLXBoeWNvcmUtc29tLmR0c2kgfCAxICsNCj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2Fs
ZS9pbXg4bXAtcGh5Y29yZS1zb20uZHRzaQ0KPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL2lteDhtcC1waHljb3JlLXNvbS5kdHNpDQo+IGluZGV4IDljNTI3MmM2OTMxYS4uYTVlY2Rj
YThiYzBlIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4
bXAtcGh5Y29yZS1zb20uZHRzaQ0KPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2Fs
ZS9pbXg4bXAtcGh5Y29yZS1zb20uZHRzaQ0KPiBAQCAtMTc5LDYgKzE3OSw3IEBAIGVlcHJvbUA1
MSB7DQo+IMKgCQljb21wYXRpYmxlID0gImF0bWVsLDI0YzMyIjsNCj4gwqAJCXJlZyA9IDwweDUx
PjsNCj4gwqAJCXBhZ2VzaXplID0gPDMyPjsNCj4gKwkJdmNjLXN1cHBseSA9IDwmcmVnX3ZkZF9p
bz47DQo+IMKgCX07DQo+IMKgDQo+IMKgCXJ2MzAyODogcnRjQDUyIHsNCj4gDQoNCg==
