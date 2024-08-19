Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756742209F
	for <imx@lists.linux.dev>; Mon, 19 Aug 2024 11:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.26.50.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724065751; cv=none; b=VkHNxBoyOPb5sX7OQ6D8FpRcQi1q7YsK9ddSF/ZB2p0FV3pll6Tfxi/x8/p457OmOv6tNN45xO5SLyGPaZy2E/c4WndeBhT4BQm8xWVLf/bg/DDxTSZSX3ndOoNDo2+lfOT+LYs0CT7YgPjQA2T3bPaNtkhlswUEA3MRmdc03nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724065751; c=relaxed/simple;
	bh=EfVb4mXGL2tfcZQNgdqivZJw6gXbQlFFEZ1NTBQnbWE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Pxxhy/TZ0DKAX8tVKUQOVNgrPfcQ2KwhqvPLrsiHFZKC7uO+Ntl8QB+TrHqyWrf8yDFhW5RtrPTzCN3tIHtkj+NWUO+j6bZ6bCg4yN6D1zOFSGf77eLMuKyM73bsrIyaxEWgf15ZPCg4U2NfbLf/PGS9E5IEOxvnpIrvxyCNp1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b=g3f1krpU; arc=none smtp.client-ip=91.26.50.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b="g3f1krpU"
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1724065747; x=1726657747;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EfVb4mXGL2tfcZQNgdqivZJw6gXbQlFFEZ1NTBQnbWE=;
	b=g3f1krpUHNOdwTVWtbI0tLSOBAUPAXfpnEng297BDEJCCWvEVWfOJj5fN3bSlhOZ
	kQ+S8QHo6aySQyExqH+BnjvrIYoOPn55XlpNLGdv7Ox/V01KUMTm/qhlPhBAWlM5
	oT1j7rcTQLBF9/yUe0UviVXzyWU2e6vRXci0jU84I/E=;
X-AuditID: ac14000a-03e52700000021bc-6b-66c327d209f9
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 25.48.08636.2D723C66; Mon, 19 Aug 2024 13:09:06 +0200 (CEST)
Received: from Berlix.phytec.de (172.25.0.12) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Mon, 19 Aug
 2024 13:09:06 +0200
Received: from Berlix.phytec.de ([fe80::197e:d26b:2ca:c7b4]) by
 berlix.phytec.de ([fe80::197e:d26b:2ca:c7b4%4]) with mapi id 15.01.2507.006;
 Mon, 19 Aug 2024 13:09:06 +0200
From: Teresa Remmet <T.Remmet@phytec.de>
To: Yannic Moog <Y.Moog@phytec.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "robh@kernel.org"
	<robh@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
CC: PHYTEC Upstream <upstream@lists.phytec.de>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [Upstream] [PATCH 1/3] arm64: dts: imx8mp-phyboard-pollux: add
 rtc aux-voltage-chargeable
Thread-Topic: [Upstream] [PATCH 1/3] arm64: dts: imx8mp-phyboard-pollux: add
 rtc aux-voltage-chargeable
Thread-Index: AQHa7iwpZbf+09+33UOYETN7kQcH67IuUooA
Date: Mon, 19 Aug 2024 11:09:06 +0000
Message-ID: <9d06065202dee9139d6680de6d14989befc36332.camel@phytec.de>
References: <20240814-b4-phytec_imx8m_rtc_updates-v1-0-10f1afc1b3ad@phytec.de>
	 <20240814-b4-phytec_imx8m_rtc_updates-v1-1-10f1afc1b3ad@phytec.de>
In-Reply-To: <20240814-b4-phytec_imx8m_rtc_updates-v1-1-10f1afc1b3ad@phytec.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F50232424730843AF8F501295BB208A@phytec.de>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRmVeSWpSXmKPExsWyRpKBR/ey+uE0g8VXWSzW7D3HZDH/yDlW
	i4dX/S1m3mtls1g1dSeLxctZ99gsNj2+xmpxedccNov/e3awW/zdvonF4sUWcYvud+oOPB47
	Z91l99i0qpPNY/OSeo8Xm2cyevR3t7B69P818Pi8SS6APYrLJiU1J7MstUjfLoErY+bFe4wF
	C/gq3l/+yNzA+IG3i5GTQ0LAROLH4T5mEFtIYAmTxNQpCV2MXED2fUaJq5c3MkIkNjBKXG43
	ArHZBDQkXp7oZgIpEhF4yiTxv62RHcRhFljDJPF79k02kCphgQyJD6evgo0VEciUOLWmkw3C
	NpL4v38PE4jNIqAqseLedLAaXgE3if+rLzJBrJ7CKLFg0hVWkASngL/Eq4fTwJoZBWQlNmw4
	D9bALCAusenZd1aIHwQkluyBiEsIiEq8fPwPKi4vceLWNKChHED1mhLrd+lDtFpI/F2+AWqM
	osSU7ofsEDcISpyc+YRlAqP4LCQbZiF0z0LSPQtJ9ywk3QsYWVcxCuVmJmenFmVm6xVkVJak
	JuulpG5iBEW9CAPXDsa+OR6HGJk4GA8xSnAwK4nwdr88mCbEm5JYWZValB9fVJqTWnyIUZqD
	RUmcd3VHcKqQQHpiSWp2ampBahFMlomDU6qB0Xd67DpLkSOaL8O2NjWKL29dHsG7/GScw66N
	a7IO7J1R1/GFa7bJ7Pb0lATN6UymL9qf3b0mv04q823s1x/1fbMb2RmzeX89KEy0YFZXbpT7
	6rb23qfPW6LOmyt/q/86gSfgXbpmyJoHsZx3V/R7936S7V4vGctYYahtFse8e8q5dUZOqTpZ
	SizFGYmGWsxFxYkAGUKt5ugCAAA=

QW0gTWl0dHdvY2gsIGRlbSAxNC4wOC4yMDI0IHVtIDExOjI2ICswMjAwIHNjaHJpZWIgWWFubmlj
IE1vb2c6DQo+IHBoeWJvYXJkLXBvbGx1eCBoYXMgYSBjaGFyZ2FibGUgY2FwYWNpdG9yIHBvcHVs
YXRlZCwgcnRjIHN1cHBvcnRzDQo+IGNoYXJnaW5nIGl0LiBBZGQgcHJvcGVydHkgaW5kaWNhdGlu
ZyB0aGlzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWWFubmljIE1vb2cgPHkubW9vZ0BwaHl0ZWMu
ZGU+DQoNClJldmlld2VkLWJ5OiBUZXJlc2EgUmVtbWV0IDx0LnJlbW1ldEBwaHl0ZWMuZGU+DQoN
Cj4gLS0tDQo+IMKgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1wLXBoeWJvYXJk
LXBvbGx1eC1yZGsuZHRzIHwgMSArDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1w
LXBoeWJvYXJkLXBvbGx1eC0NCj4gcmRrLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL2lteDhtcC1waHlib2FyZC1wb2xsdXgtDQo+IHJkay5kdHMNCj4gaW5kZXggMzQyNzkzNmY5
MDQ1Li42MzQ3YjQ2OWZjOTkgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJl
ZXNjYWxlL2lteDhtcC1waHlib2FyZC1wb2xsdXgtcmRrLmR0cw0KPiArKysgYi9hcmNoL2FybTY0
L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bXAtcGh5Ym9hcmQtcG9sbHV4LXJkay5kdHMNCj4gQEAg
LTIyMiw2ICsyMjIsNyBAQCAmcnYzMDI4IHsNCj4gwqDCoMKgwqDCoMKgwqDCoHBpbmN0cmwtMCA9
IDwmcGluY3RybF9ydGM+Ow0KPiDCoMKgwqDCoMKgwqDCoMKgaW50ZXJydXB0LXBhcmVudCA9IDwm
Z3BpbzQ+Ow0KPiDCoMKgwqDCoMKgwqDCoMKgaW50ZXJydXB0cyA9IDwxOSBJUlFfVFlQRV9MRVZF
TF9MT1c+Ow0KPiArwqDCoMKgwqDCoMKgwqBhdXgtdm9sdGFnZS1jaGFyZ2VhYmxlID0gPDE+Ow0K
PiDCoMKgwqDCoMKgwqDCoMKgd2FrZXVwLXNvdXJjZTsNCj4gwqDCoMKgwqDCoMKgwqDCoHRyaWNr
bGUtcmVzaXN0b3Itb2htcyA9IDwzMDAwPjsNCj4gwqB9Ow0KPiANCg0KLS0gDQpQSFlURUMgTWVz
c3RlY2huaWsgR21iSCB8IEJhcmNlbG9uYS1BbGxlZSAxIHwgNTUxMjkgTWFpbnosIEdlcm1hbnkN
Cg0KR2VzY2jDpGZ0c2bDvGhyZXI6IERpcGwuLUluZy4gTWljaGFlbCBNaXRlemtpLCBEaXBsLi1J
bmcuIEJvZG8gSHViZXIsDQpEaXBsLi1JbmcuIChGSCkgTWFya3VzIExpY2tlcyB8IEhhbmRlbHNy
ZWdpc3RlciBNYWlueiBIUkIgNDY1NiB8DQpGaW5hbnphbXQgTWFpbnogfCBTdC5Oci4gMjY2NTAw
NjA4LCBERSAxNDkwNTk4NTUNCg==
