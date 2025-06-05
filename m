Received: from mail.actia.se (mail.actia.se [212.181.117.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8208623313E
	for <imx@lists.linux.dev>; Thu,  5 Jun 2025 13:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.181.117.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749130093; cv=none; b=ZHTuWh/AZamM5aGpn6UnKbcngJekcONDgljSr6daxjjPyyem/W9d9J27OOQxJ/bUHTpruAPMCAEKGTbWHWxv8cS8lSu4+mwAE/8PZ8IwozbBt6qrsUNWzjW5GEBidGB78gCtzBotXXNL0hBOFV8OYyP1sSzZISTCPvWslZEj0dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749130093; c=relaxed/simple;
	bh=f1andkWVSBI72uYY9GTzzp+Z35hpcWoDV3yz7imaRHA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=d8N91CN4L2edXGx+TdJCzOAq49ivEHzMcTHGCNAvINjNey2wZzPDzQJABurM5snVp5OmzVkWKlp9R2HtURZHrzGBSUBl4oqK6jmuxQ3zZNTuCdFkPlPPW/s0hC6obG2LjDXwV7s8KAxIKG3dS7d1t1PTLn3hvsTl6w9cd1u3gaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=actia.se; spf=pass smtp.mailfrom=actia.se; arc=none smtp.client-ip=212.181.117.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=actia.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=actia.se
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 15:28:01 +0200
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.2507.039; Thu, 5 Jun 2025 15:28:01 +0200
From: John Ernberg <john.ernberg@actia.se>
To: =?utf-8?B?SG9yaWEgR2VhbnTEgw==?= <horia.geanta@nxp.com>, Pankaj Gupta
	<pankaj.gupta@nxp.com>, Gaurav Jain <gaurav.jain@nxp.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>
CC: Frank Li <Frank.li@nxp.com>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, John Ernberg <john.ernberg@actia.se>
Subject: [PATCH v4 0/4] crypto: caam - iMX8QXP support (and related fixes)
Thread-Topic: [PATCH v4 0/4] crypto: caam - iMX8QXP support (and related
 fixes)
Thread-Index: AQHb1h2pouM9yuOYnE+5OxMC9E/dlw==
Date: Thu, 5 Jun 2025 13:28:01 +0000
Message-ID: <20250605132754.1771368-1-john.ernberg@actia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.49.0
x-esetresult: clean, is OK
x-esetid: 37303A2955B1445363726A
Content-Type: text/plain; charset="utf-8"
Content-ID: <B519CDE65672574BA3CA98973B5E72A9@actia.se>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

VGhpcyBzZXJpZXMgZW5hYmxlcyB0aGUgdXNlIG9mIHRoZSBDQUFNIChDcnlwdG9ncmFwaGljIEFj
Y2VsZXJhdGlvbiBhbmQNCkFzc3VyYW5jZSBNb2R1bGUpIG9uIHRoZSBpTVg4UVhQIChhbmQgaXRz
IHZhcmlhbnRzKS4NCg0KdjQ6IChkZXRhaWxlZCBjaGFuZ2Vsb2cgaW4gZWFjaCBwYXRjaCkNCiAt
IERlY2xhcmUgbW9yZSBjb21wYXRpYmxlcyBpbiBiaW5kaW5ncyAoRnJhbmsgTGkpDQogLSBNb3Zl
IGpvYi1yaW5nIGNvbXBhdCBjaGVjayB1bmRlciB0aGUgam9iLXJpbmcgc3Vic2NoZW1hIChSb2Ig
SGVycmluZykNCg0KdjM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWNyeXB0by8yMDI1
MDUyODE0NDI1OS4yNjAzOTE0LTEtam9obi5lcm5iZXJnQGFjdGlhLnNlL1QNCiAtIEZpeCBkZXZp
Y2V0cmVlIENJIGRldGVjdGVkIGVycm9ycyAoUm9iIEhlcnJpbmcncyBib3QpDQogLSBEZWNsYXJl
IHRoZSBjb21wYXRpYmxlcyBjb3JyZWN0bHkgaW4gYmluZGluZ3MgKEtyenlzenRvZiBLb3psb3dz
a2kpDQoNCnYyOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jcnlwdG8vMjAyNTA1Mjcw
NzE1NTIuMTQyNDk5Ny0xLWpvaG4uZXJuYmVyZ0BhY3RpYS5zZS9UDQogLSBDbGFyaWZ5IGluIHRo
ZSBjb21taXQgbWVzc2FnZSBob3cgdGhlIGNyYXNoIGZpeCB3b3JrcyAoRnJhbmsgTGkpDQogLSBS
ZXN0cmljdCBwb3dlci1kb21haW5zIG9ubHkgZm9yIGlNWDhRKiBTb0NzIGluIGJpbmRpbmdzIChG
cmFuayBMaSkNCiAtIENvbGxlY3QgdGFncw0KDQp2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtY3J5cHRvLzIwMjUwNTIzMTMxODE0LjEwNDc2NjItMS1qb2huLmVybmJlcmdAYWN0aWEu
c2UvVA0KDQpIb3JpYSBHZWFudMSDICgxKToNCiAgYXJtNjQ6IGR0czogZnJlZXNjYWxlOiBpbXg4
cXhwL2lteDhxbTogQWRkIENBQU0gc3VwcG9ydA0KDQpKb2huIEVybmJlcmcgKDMpOg0KICBjcnlw
dG86IGNhYW0gLSBQcmV2ZW50IGNyYXNoIG9uIHN1c3BlbmQgd2l0aCBpTVg4UU0gLyBpTVg4VUxQ
DQogIGNyeXB0bzogY2FhbSAtIFN1cHBvcnQgaU1YOFFYUCBhbmQgdmFyaWFudHMgdGhlcmVvZg0K
ICBkdC1iaW5kaW5nczogY3J5cHRvOiBmc2wsc2VjLXY0LjA6IEFkZCBwb3dlciBkb21haW5zIGZv
ciBpTVg4UU0gYW5kDQogICAgaU1YOFFYUA0KDQogLi4uL2JpbmRpbmdzL2NyeXB0by9mc2wsc2Vj
LXY0LjAueWFtbCAgICAgICAgIHwgNDEgKysrKysrKysrKysrKysrKysrLQ0KIC4uLi9ib290L2R0
cy9mcmVlc2NhbGUvaW14OC1zcy1zZWN1cml0eS5kdHNpICB8IDM4ICsrKysrKysrKysrKysrKysr
DQogYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHFtLmR0c2kgICAgIHwgIDEgKw0K
IC4uLi9kdHMvZnJlZXNjYWxlL2lteDhxeHAtc3Mtc2VjdXJpdHkuZHRzaSAgICB8IDE2ICsrKysr
KysrDQogYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OHF4cC5kdHNpICAgIHwgIDIg
Kw0KIGRyaXZlcnMvY3J5cHRvL2NhYW0vY3RybC5jICAgICAgICAgICAgICAgICAgICB8ICA3ICsr
LS0NCiBkcml2ZXJzL2NyeXB0by9jYWFtL2ludGVybi5oICAgICAgICAgICAgICAgICAgfCAgMSAr
DQogNyBmaWxlcyBjaGFuZ2VkLCAxMDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCiBj
cmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OC1zcy1z
ZWN1cml0eS5kdHNpDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJl
ZXNjYWxlL2lteDhxeHAtc3Mtc2VjdXJpdHkuZHRzaQ0KDQotLSANCjIuNDkuMA0K
