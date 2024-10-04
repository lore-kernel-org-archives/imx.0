Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5156715852F
	for <imx@lists.linux.dev>; Fri,  4 Oct 2024 12:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.26.50.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728043802; cv=none; b=Erknu2tV24TU4MS7LANXt7KClBVy4Zz8g2lKVphVvMw9/qYwQQerflR8yHY3fPREQHCugm9xuw+glx+ddZjOZjkkN/mAJnf6yJ40ic+JVEW4UjSSyPb6E3nhpR34B3DFjo606WDTroEHCkTDpvst9jLLtLTljLqABnb1NmnVnmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728043802; c=relaxed/simple;
	bh=tol3SGF63fynslz0m0LVJp1e//1F5yh+pt+8Joj/tLI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FnGewXSd6zzOyv/+xwEZ1RrFMcjBJC0FiVy3o0vbd0ixcx7LpWpHpzBEyk8JGTydHlpY7QAK1m3arB4ejQncohdKVqR6Gd/gcpm160U0C2e20IdCxDFvgk1I5IPv4eds7EIRfz3CSr/CDCcHgT2pgm11unoEL+0Yt2LfitJrMiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b=ifKkc3IR; arc=none smtp.client-ip=91.26.50.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=phytec.de header.i=@phytec.de header.b="ifKkc3IR"
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1728043789; x=1730635789;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tol3SGF63fynslz0m0LVJp1e//1F5yh+pt+8Joj/tLI=;
	b=ifKkc3IRakzq0iG9GmxdELXLsi1sfoRyB2KpSME7RTyevNNzCqdIQT7J3Pl94wZf
	j7OUtpx5MRHdMkKNqwcEu5rz9fM+RzarfhqWnSL+TlcXq2C4jupDscp/0nXuWQ6T
	7pCdVIjORhLYLUkpZrHB5WL1udT2fIst6cu/SVUah9o=;
X-AuditID: ac14000a-4637f70000004e2a-2f-66ffdb0d6fbf
Received: from florix.phytec.de (Unknown_Domain [172.25.0.13])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 18.E9.20010.D0BDFF66; Fri,  4 Oct 2024 14:09:49 +0200 (CEST)
Received: from Berlix.phytec.de (172.25.0.12) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 4 Oct 2024
 14:09:49 +0200
Received: from Berlix.phytec.de ([fe80::197e:d26b:2ca:c7b4]) by
 berlix.phytec.de ([fe80::197e:d26b:2ca:c7b4%4]) with mapi id 15.01.2507.006;
 Fri, 4 Oct 2024 14:09:49 +0200
From: Teresa Remmet <T.Remmet@phytec.de>
To: Benjamin Hahn <B.Hahn@phytec.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "robh@kernel.org"
	<robh@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, PHYTEC Upstream <upstream@lists.phytec.de>
Subject: Re: [PATCH] arm64: dts: imx8mp-phyboard-pollux-rdk: update
 gpio-line-names
Thread-Topic: [PATCH] arm64: dts: imx8mp-phyboard-pollux-rdk: update
 gpio-line-names
Thread-Index: AQHbENEzxNXYuGOyz0qCND/z9X2NzbJ2aXMA
Date: Fri, 4 Oct 2024 12:09:48 +0000
Message-ID: <4aad6c9e4dd74f4e7af437eed757cd74be44a325.camel@phytec.de>
References: <20240927-wip-bhahn-update_gpio_lines-v1-1-49aca212e25a@phytec.de>
In-Reply-To: <20240927-wip-bhahn-update_gpio_lines-v1-1-49aca212e25a@phytec.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <F3B862AB992CF54395DFBFEA68E2E194@phytec.de>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRmVeSWpSXmKPExsWyRpKBV5f39v80gzNTpS3W7D3HZDH/yDlW
	i4dX/S1m3mtls1g1dSeLxctZ99gsNj2+xmpxedccNov/e3awW/zdvonF4sUWcYvud+oOPB47
	Z91l99i0qpPNY/OSeo8Xm2cyevR3t7B69P818Pi8SS6APYrLJiU1J7MstUjfLoEr49UJu4JV
	ShUz3j9kbmDcodjFyMkhIWAi8fLOatYuRi4OIYElTBIXNt5hhnDuMUrsun+cBcJZzygx9+Z1
	RpAWNgENiZcnuplAEiICz5kkTn2+zAbiMAusYZJYN6WXBaRKWCBUYm3LIVYQW0QgTOJl0ytm
	CNtIovH2N7BJLAIqEit3rWIDsXkF3CQ233oMFhcS8JPo23qQCcTmFPCXaHn4GSzOKCArsWHD
	ebA5zALiEpuefWeFeEJAYskeiLiEgKjEy8f/oOLyEiduTQOawwFUrymxfpc+RKuFxOEVm9kg
	bEWJKd0P2SFOEJQ4OfMJywRG8VlINsxC6J6FpHsWku5ZSLoXMLKuYhTKzUzOTi3KzNYryKgs
	SU3WS0ndxAiKehEGrh2MfXM8DjEycTAeYpTgYFYS4Z23/W+aEG9KYmVValF+fFFpTmrxIUZp
	DhYlcd7VHcGpQgLpiSWp2ampBalFMFkmDk6pBsbkKg7Dq+uYr9idv2EkV/100bP90dk/jn3r
	2reGl6vr2B+/YwYvT1uXpTgonbZOeaha7+fzTVnRIHBCQ8Bpngm1W27tkvvIudjCSNVjxvoA
	zV1Wtt8a3ygk3pPpvPl48+fUfUqcUWsz92y7nRzwvzglkSd3weUnMR4PirZvONz6KufcD8/1
	TR5KLMUZiYZazEXFiQDCW5Eg6AIAAA==

QW0gRnJlaXRhZywgZGVtIDI3LjA5LjIwMjQgdW0gMTM6MzQgKzAyMDAgc2NocmllYiBCZW5qYW1p
biBIYWhuOgo+IFVwZGF0ZSBncGlvLWxpbmUtbmFtZXMuIEFkZCBtaXNzaW5nIGFuZCByZW1vdmUg
dW51c2VkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJlbmphbWluIEhhaG4gPEIuSGFobkBwaHl0ZWMu
ZGU+CgpSZXZpZXdlZC1ieTogVGVyZXNhIFJlbW1ldCA8dC5yZW1tZXRAcGh5dGVjLmRlPgoKPiAt
LS0KPiDCoC4uLi9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1wLXBoeWJvYXJkLXBvbGx1eC1yZGsu
ZHRzwqDCoMKgwqDCoCB8IDE0Cj4gKysrKysrKysrKy0tLS0KPiDCoGFyY2gvYXJtNjQvYm9vdC9k
dHMvZnJlZXNjYWxlL2lteDhtcC1waHljb3JlLXNvbS5kdHNpwqDCoMKgwqDCoCB8wqAgNCArLS0t
Cj4gwqAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcC1waHli
b2FyZC1wb2xsdXgtCj4gcmRrLmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lt
eDhtcC1waHlib2FyZC1wb2xsdXgtCj4gcmRrLmR0cwo+IGluZGV4IDUwZGViZTgyMWM0Mi4uY2Q4
NjQ1YmU3ZmZkIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lt
eDhtcC1waHlib2FyZC1wb2xsdXgtcmRrLmR0cwo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
ZnJlZXNjYWxlL2lteDhtcC1waHlib2FyZC1wb2xsdXgtcmRrLmR0cwo+IEBAIC0zMjIsMTUgKzMy
MiwxNiBAQCAmdXNkaGMyIHsKPiDCoAo+IMKgJmdwaW8xIHsKPiDCoMKgwqDCoMKgwqDCoMKgZ3Bp
by1saW5lLW5hbWVzID0gIiIsICIiLCAiWF9QTUlDX1dET0dfQiIsICIiLAo+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAiUE1JQ19TRF9WU0VMIiwgIiIsICIiLCAiIiwgIiIsICIiLAo+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAiIiwgIiIsICJVU0IxX09UR19QV1IiLCAi
IiwgIiIsICJYX25FVEhQSFlfSU5UIjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IlBNSUNfU0RfVlNFTCIsICIiLCAiIiwgIiIsICJQQ0llX25QRVJTVCIsCj4gIkxWRFMxUkVHX0VO
IiwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIlBDSWVfbldBS0UiLCAiUENJZV9u
Q0xLUkVRIiwgIlVTQjFfT1RHX1BXUiIsICIiLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAiUENJZV9uV19ESVNBQkxFIjsKPiDCoH07Cj4gwqAKPiDCoCZncGlvMiB7Cj4gwqDCoMKg
wqDCoMKgwqDCoGdwaW8tbGluZS1uYW1lcyA9ICIiLCAiIiwgIiIsICIiLAo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIiIsICIiLCAiIiwgIiIsICIiLCAiIiwKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCIiLCAiIiwgIlhfU0QyX0NEX0IiLCAiIiwgIiIsICIiLAo+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAiIiwgIiIsICIiLCAiU0QyX1JFU0VUX0Ii
Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAiIiwgIiIsICIiLCAiU0QyX1JFU0VU
X0IiLCAiTFZEUzFfQkxfRU4iOwo+IMKgfTsKPiDCoAo+IMKgJmdwaW8zIHsKPiBAQCAtMzQ0LDcg
KzM0NSwxMiBAQCAmZ3BpbzQgewo+IMKgwqDCoMKgwqDCoMKgwqBncGlvLWxpbmUtbmFtZXMgPSAi
IiwgIiIsICIiLCAiIiwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCIiLCAiIiwg
IiIsICIiLCAiIiwgIiIsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAiIiwgIiIs
ICIiLCAiIiwgIiIsICIiLAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAiIiwgIiIs
ICJYX1BNSUNfSVJRX0IiLCAiIiwgIm5FTkVUMF9JTlRfUFdETiI7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCIiLCAiIiwgIlhfUE1JQ19JUlFfQiIsICJuUlRDX0lOVCIsCj4gIm5F
TkVUMF9JTlRfUFdETiI7Cj4gK307Cj4gKwo+ICsmZ3BpbzUgewo+ICvCoMKgwqDCoMKgwqDCoGdw
aW8tbGluZS1uYW1lcyA9ICIiLCAiIiwgIiIsICIiLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAiIiwgIiIsICIiLCAiIiwgIiIsICJYX0VDU1BJMV9TU08iOwo+IMKgfTsKPiDCoAo+
IMKgJmlvbXV4YyB7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxl
L2lteDhtcC1waHljb3JlLXNvbS5kdHNpCj4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2Fs
ZS9pbXg4bXAtcGh5Y29yZS1zb20uZHRzaQo+IGluZGV4IGE1ZWNkY2E4YmMwZS4uMDRmNzI0YzZl
YzIxIDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcC1w
aHljb3JlLXNvbS5kdHNpCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14
OG1wLXBoeWNvcmUtc29tLmR0c2kKPiBAQCAtMjA5LDkgKzIwOSw3IEBAICZ3ZG9nMSB7Cj4gwqB9
Owo+IMKgCj4gwqAmZ3BpbzEgewo+IC3CoMKgwqDCoMKgwqDCoGdwaW8tbGluZS1uYW1lcyA9ICIi
LCAiIiwgIlhfUE1JQ19XRE9HX0IiLCAiIiwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIiIsICIiLCAiIiwgIiIsICIiLCAiIiwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIiIsICIiLCAiIiwgIiIsICIiLCAiWF9uRVRIUEhZX0lOVCI7Cj4gK8KgwqDCoMKgwqDCoMKg
Z3Bpby1saW5lLW5hbWVzID0gIiIsICIiLCAiWF9QTUlDX1dET0dfQiI7Cj4gwqB9Owo+IMKgCj4g
wqAmZ3BpbzQgewo+IAo+IC0tLQo+IGJhc2UtY29tbWl0OiBkZTVjYjBkY2I3NGMyOTRlYzUyN2Vk
ZGZlNTA5NGFjZmRiMjFmZjIxCj4gY2hhbmdlLWlkOiAyMDI0MDkyNS13aXAtYmhhaG4tdXBkYXRl
X2dwaW9fbGluZXMtMzg3ZmFjMDhlM2Q3Cj4gCj4gQmVzdCByZWdhcmRzLAoKLS0gClBIWVRFQyBN
ZXNzdGVjaG5payBHbWJIIHwgQmFyY2Vsb25hLUFsbGVlIDEgfCA1NTEyOSBNYWlueiwgR2VybWFu
eQoKR2VzY2jDpGZ0c2bDvGhyZXI6IERpcGwuLUluZy4gTWljaGFlbCBNaXRlemtpLCBEaXBsLi1J
bmcuIEJvZG8gSHViZXIsCkRpcGwuLUluZy4gKEZIKSBNYXJrdXMgTGlja2VzIHwgSGFuZGVsc3Jl
Z2lzdGVyIE1haW56IEhSQiA0NjU2IHwKRmluYW56YW10IE1haW56IHwgU3QuTnIuIDI2NjUwMDYw
OCwgREUgMTQ5MDU5ODU1Cg==
