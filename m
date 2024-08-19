Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD0215B137
	for <imx@lists.linux.dev>; Mon, 19 Aug 2024 08:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.26.50.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724056965; cv=none; b=Xy1CWOMzgl1zj5jhJWveG3+WEkBuNiNjwn4qdvWwY5jU3/jf1A8FtxyS8KIyPyon78kWY858ghloepXl6j4Mhe4T3sbbQOYLvH6Yc54H/QHynmBS73fV9s5Jpe8oos9hDFDAi3mkwXKz3GQdvbIJWm7j4edUtOd3fdNqtUrLLFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724056965; c=relaxed/simple;
	bh=MaGOfuZj2IBvb0IsbGDgoNqa3AvCCOOhv4QBY1N9IVM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a5zNFsgGJR7J+NIlHGoC60I7mfJU2Eh9Cys2dZY8hzN+pW/7ox76R5cT0b4Kz+v96SsE+kcG8AmVwuBg/wfT8QfZtu2oVfe4wy27pinVLWYE550EuJuZkIEaLHpExsmKfDKYY0brrz6ToWkYKbXyKpOff0yCJGEx/QPi6Qhn2XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b=ORIiATEJ; arc=none smtp.client-ip=91.26.50.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b="ORIiATEJ"
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1724056962; x=1726648962;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MaGOfuZj2IBvb0IsbGDgoNqa3AvCCOOhv4QBY1N9IVM=;
	b=ORIiATEJefi0lu59o+SazVOXUAw75+ScXmPvm0J6GP26d+Q489MJktoyWbRuP76q
	zrwd9nPPPPgjlZ/HbZblPAv6tEDW/OYh1O1Vlie9U022GffB3UpV1Lo1mYkXhMq/
	5fpCq8HNCftWtm0/dgsKR1GHaDy/2WI1HSgsMSXeei8=;
X-AuditID: ac14000a-03251700000021bc-91-66c30582799b
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id D6.37.08636.28503C66; Mon, 19 Aug 2024 10:42:42 +0200 (CEST)
Received: from Berlix.phytec.de (172.25.0.12) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 19 Aug
 2024 10:42:42 +0200
Received: from Berlix.phytec.de ([fe80::197e:d26b:2ca:c7b4]) by
 berlix.phytec.de ([fe80::197e:d26b:2ca:c7b4%4]) with mapi id 15.01.2507.006;
 Mon, 19 Aug 2024 10:42:42 +0200
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
Subject: Re: [PATCH 3/6] arm64: dts: imx8mp-phyboard-pollux: Add SD-Card vqmmc
 supply
Thread-Topic: [PATCH 3/6] arm64: dts: imx8mp-phyboard-pollux: Add SD-Card
 vqmmc supply
Thread-Index: AQHa7iwRrFOtrj/64kiMzchT6L5e0bIuKaGA
Date: Mon, 19 Aug 2024 08:42:42 +0000
Message-ID: <21bd2960f35b89e1feffe2f7a23965ea97eb0f6b.camel@phytec.de>
References: <20240814-b4-wip-t-remmet-phytec-de-bspimx8m-3392_upstream-v1-0-e2500950c632@phytec.de>
	 <20240814-b4-wip-t-remmet-phytec-de-bspimx8m-3392_upstream-v1-3-e2500950c632@phytec.de>
In-Reply-To: <20240814-b4-wip-t-remmet-phytec-de-bspimx8m-3392_upstream-v1-3-e2500950c632@phytec.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <D884B54CDA40954984B98070A5B10AAD@phytec.de>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRmVeSWpSXmKPExsWyRpKBR7eJ9XCawd370hZr9p5jsph/5Byr
	xcOr/hYz77WyWayaupPF4uWse2wWmx5fY7W4vGsOm8X/PTvYLf5u38Ri8WKLuEX3O3UHHo+d
	s+6ye2xa1cnmsXlJvceLzTMZPfq7W1g9+v8aeHzeJBfAHsVlk5Kak1mWWqRvl8CVMa3tHUvB
	Cc6KrYfOsDQwruDsYuTkkBAwkbi8bDFrFyMXh5DAEiaJN/vfsEM49xklnv7tZ4RwNjBKHHnY
	wQLSwiagInFyxiWwhIjASyaJxVO/gznMAn+ZJJ7+AnE4OYQFwiUWtO5gArFFBCIkpt1oZIew
	jSRe/t4EFmcRUJU49OEUUD0HB6+Am8S6J6EQ2/YxSryYuwNsDqdAisS3Ge3MIDajgKzEhg3n
	wWxmAXGJTc++s0I8ISCxZA9EXEJAVOLl439QcXmJE7emMYHMZxbQlFi/Sx+i1ULi9dVuJghb
	UWJK90Ow03gFBCVOznzCMoFRfBaSDbMQumch6Z6FpHsWku4FjKyrGIVyM5OzU4sys/UKMipL
	UpP1UlI3MYLiXoSBawdj3xyPQ4xMHIyHGCU4mJVEeLtfHkwT4k1JrKxKLcqPLyrNSS0+xCjN
	waIkzru6IzhVSCA9sSQ1OzW1ILUIJsvEwSnVwOi5ag+rkm5rWuN/t0VWGrM9slndJZIPv17v
	9cvCyyg7/fOegMebznqppAgez5B4bz/LJ6Rt+TXv7X8sQlYwMc7m+zrTIp8jNYE5TevM7ISt
	zsue/tsso3zq9I6a/lPZfssDb3wV87bJK1nbofj+SKnw639ySqYnNJblTY3OZn0oa8bqmNp+
	XomlOCPRUIu5qDgRAAc2SCrpAgAA

T24gV2VkLCAyMDI0LTA4LTE0IGF0IDExOjI2ICswMjAwLCBUZXJlc2EgUmVtbWV0IHdyb3RlOg0K
PiBBZGQgU0QtQ2FyZCBwcm9wZXJ0eSBmb3IgdGhlIGJ1cyBJTyBwb3dlciBmcm9tIHRoZSBQTUlD
Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGVyZXNhIFJlbW1ldCA8dC5yZW1tZXRAcGh5dGVjLmRl
Pg0KUmV2aWV3ZWQtYnk6IFlhbm5pYyBNb29nIDx5Lm1vb2dAcGh5dGVjLmRlPg0KDQo+IC0tLQ0K
PiDCoGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcC1waHlib2FyZC1wb2xsdXgt
cmRrLmR0cyB8IDEgKw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcC1waHlib2Fy
ZC1wb2xsdXgtcmRrLmR0cw0KPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDht
cC1waHlib2FyZC1wb2xsdXgtcmRrLmR0cw0KPiBpbmRleCAzNDI3OTM2ZjkwNDUuLjM0MWJhYTE2
NzE5MSAxMDA2NDQNCj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1w
LXBoeWJvYXJkLXBvbGx1eC1yZGsuZHRzDQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJl
ZXNjYWxlL2lteDhtcC1waHlib2FyZC1wb2xsdXgtcmRrLmR0cw0KPiBAQCAtMjg1LDYgKzI4NSw3
IEBAICZ1c2RoYzIgew0KPiDCoAljZC1ncGlvcyA9IDwmZ3BpbzIgMTIgR1BJT19BQ1RJVkVfTE9X
PjsNCj4gwqAJZGlzYWJsZS13cDsNCj4gwqAJdm1tYy1zdXBwbHkgPSA8JnJlZ191c2RoYzJfdm1t
Yz47DQo+ICsJdnFtbWMtc3VwcGx5ID0gPCZsZG81PjsNCj4gwqAJYnVzLXdpZHRoID0gPDQ+Ow0K
PiDCoAlzdGF0dXMgPSAib2theSI7DQo+IMKgfTsNCj4gDQoNCg==
