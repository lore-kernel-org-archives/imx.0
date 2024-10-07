Received: from mx2.securetransport.de (mx2.securetransport.de [188.68.39.254])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C4818BB90
	for <imx@lists.linux.dev>; Mon,  7 Oct 2024 16:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.39.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728318043; cv=none; b=OuYFxemahOmQvKEOwUsf47cij8Plh1Uflw3ii23uOSvvpkS5uwtLdebcf1IB791HGiUnHjeMapqkWbyR9ZXVHjWDqPWJqfOW5HqhRtgC218fI73ormqRn8RGQz0C/nGxq7iNoBS69AkyRFDekrKtNwJXGdUg8z6cjetIw6WLjis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728318043; c=relaxed/simple;
	bh=6vWo/MQth2mZuBYTIpvrvVLTZuXMkh4qjqUf6cBMcZQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GfNxR0CcinhQiy22rMrwMmzzv0of+aphDIWzKDYC5GQqbYlbOz9kuLxTWFQoMnMw9nsAWf4UunvaZ3uotMxJdas+6T5GAmcSOmrrYeab/jtF41cRq9X7AB4+tGQSDY7Kh0dssXDEGVzl3OHwzzE6191be/YHet37jkc+CT3/aT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com; spf=pass smtp.mailfrom=dh-electronics.com; dkim=pass (2048-bit key) header.d=dh-electronics.com header.i=@dh-electronics.com header.b=lS//OwmS; arc=none smtp.client-ip=188.68.39.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dh-electronics.com header.i=@dh-electronics.com header.b="lS//OwmS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1728315272;
	bh=6vWo/MQth2mZuBYTIpvrvVLTZuXMkh4qjqUf6cBMcZQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=lS//OwmSs++MhLUA7JEqmBOlIKnPrW1zFbhjThPb2jMfjiqyyXd1xwvJDaDxt947Y
	 ljy3qMZPiUYBGKo6mD28Ldqr3YRHIrC5fnEYZyk9sxwJ8FNBSPaZ1L9+8CnUu3j9/M
	 HykKZpx9sDVsIw1p2h0jvuvzpoBa5AyfF4Op7jha7nRM83hgyapBqDPzZWyGRzRf8v
	 9da7vRGt/pnLeQ6Hn/z9dEXJAwvhxetIFzvyOAD3lTjUMd0Kl9mXa6azxkJXV/ER7K
	 ql5m58Sr/k1GQOGxhnNzNbtUvCPYsSWpwuW6RCHMKNWMzAvdHUOyuOLALc0E6Xmbqs
	 eEK6M2z8yo8vw==
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
Subject: RE: [PATCH] ARM: dts: imx6qdl-dhcom: Fix model typo for i.MX6 DHSOM
Thread-Topic: [PATCH] ARM: dts: imx6qdl-dhcom: Fix model typo for i.MX6 DHSOM
Thread-Index: AQHbGL/rOI8LNNQHi02wF8XxMS3Xh7J7amhw
Date: Mon, 7 Oct 2024 15:34:24 +0000
Message-ID: <a5abf828a25b48cf91577aa324813c8f@dh-electronics.com>
References: <20241007135030.30559-1-marex@denx.de>
In-Reply-To: <20241007135030.30559-1-marex@denx.de>
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

RnJvbTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+DQpTZW50OiBNb25kYXksIE9jdG9iZXIg
NywgMjAyNCAzOjUwIFBNDQo+IEVhY2ggREhTT00gdXNlcyB0aHJlZSBkaWdpdHMgaW4gdGhlIENu
bm4gcGFydCwgZHJvcCB0aGUgdHJhaWxpbmcgemVyby4NCj4gVGhpcyBpcyBhIGNoYW5nZSBpbiBj
b21tZW50LCBubyBmdW5jdGlvbmFsIGNoYW5nZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hcmVr
IFZhc3V0IDxtYXJleEBkZW54LmRlPg0KPiAtLS0NCj4gQ2M6IENocmlzdG9waCBOaWVkZXJtYWll
ciA8Y25pZWRlcm1haWVyQGRoLWVsZWN0cm9uaWNzLmNvbT4NCj4gQ2M6IENvbm9yIERvb2xleSA8
Y29ub3IrZHRAa2VybmVsLm9yZz4NCj4gQ2M6IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWls
LmNvbT4NCj4gQ2M6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz4NCj4g
Q2M6IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtIDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+DQo+IENj
OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KPiBDYzogU2FzY2hhIEhhdWVyIDxzLmhh
dWVyQHBlbmd1dHJvbml4LmRlPg0KPiBDYzogU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3Jn
Pg0KPiBDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcNCj4gQ2M6IGlteEBsaXN0cy5saW51
eC5kZXYNCj4gQ2M6IGtlcm5lbEBkaC1lbGVjdHJvbmljcy5jb20NCj4gQ2M6IGxpbnV4LWFybS1r
ZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiAtLS0NCj4gIGFyY2gvYXJtL2Jvb3QvZHRzL254
cC9pbXgvaW14NmRsLWRoY29tLXBpY29pdHguZHRzIHwgMiArLQ0KPiAgYXJjaC9hcm0vYm9vdC9k
dHMvbnhwL2lteC9pbXg2cS1kaGNvbS1wZGsyLmR0cyAgICAgfCAyICstDQo+ICBhcmNoL2FybS9i
b290L2R0cy9ueHAvaW14L2lteDZzLWRoY29tLWRyYzAyLmR0cyAgICB8IDIgKy0NCj4gIDMgZmls
ZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL254cC9pbXgvaW14NmRsLWRoY29tLXBpY29pdHguZHRz
DQo+IGIvYXJjaC9hcm0vYm9vdC9kdHMvbnhwL2lteC9pbXg2ZGwtZGhjb20tcGljb2l0eC5kdHMN
Cj4gaW5kZXggMDM4YmIwMDI1NTU2Ny4uNzc1Y2FmODIwOGM1YiAxMDA2NDQNCj4gLS0tIGEvYXJj
aC9hcm0vYm9vdC9kdHMvbnhwL2lteC9pbXg2ZGwtZGhjb20tcGljb2l0eC5kdHMNCj4gKysrIGIv
YXJjaC9hcm0vYm9vdC9kdHMvbnhwL2lteC9pbXg2ZGwtZGhjb20tcGljb2l0eC5kdHMNCj4gQEAg
LTMsNyArMyw3IEBADQo+ICAgKiBDb3B5cmlnaHQgKEMpIDIwMjEgREggZWxlY3Ryb25pY3MgR21i
SA0KPiAgICoNCj4gICAqIERIQ09NIGlNWDYgdmFyaWFudDoNCj4gLSAqIERIQ00taU1YNkRMLUMw
ODAwLVIxMDItRjA4MTktRS1TRC1SVEMtVC1IUy1JLTAxRDINCj4gKyAqIERIQ00taU1YNkRMLUMw
ODAtUjEwMi1GMDgxOS1FLVNELVJUQy1ULUhTLUktMDFEMg0KPiAgICogREhDT00gUENCIG51bWJl
cjogNDkzLTMwMCBvciBuZXdlcg0KPiAgICogUGljb0lUWCBQQ0IgbnVtYmVyOiA0ODctNjAwIG9y
IG5ld2VyDQo+ICAgKi8NCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL254cC9pbXgv
aW14NnEtZGhjb20tcGRrMi5kdHMNCj4gYi9hcmNoL2FybS9ib290L2R0cy9ueHAvaW14L2lteDZx
LWRoY29tLXBkazIuZHRzDQo+IGluZGV4IGQ0ZDU3MzcwNjE1ZDguLjZlZmQ3ZTlmYzFiMTggMTAw
NjQ0DQo+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL254cC9pbXgvaW14NnEtZGhjb20tcGRrMi5k
dHMNCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvbnhwL2lteC9pbXg2cS1kaGNvbS1wZGsyLmR0
cw0KPiBAQCAtNCw3ICs0LDcgQEANCj4gICAqIENvcHlyaWdodCAoQykgMjAxOCBNYXJlayBWYXN1
dCA8bWFyZXhAZGVueC5kZT4NCj4gICAqDQo+ICAgKiBESENPTSBpTVg2IHZhcmlhbnQ6DQo+IC0g
KiBESENNLWlNWDZRLUMwODAwLVIxMDItRjA4MTktRS1TRC1SVEMtVC1IUy1JLTAxRDINCj4gKyAq
IERIQ00taU1YNlEtQzA4MC1SMTAyLUYwODE5LUUtU0QtUlRDLVQtSFMtSS0wMUQyDQo+ICAgKiBE
SENPTSBQQ0IgbnVtYmVyOiA0OTMtMzAwIG9yIG5ld2VyDQo+ICAgKiBQREsyIFBDQiBudW1iZXI6
IDUxNi00MDAgb3IgbmV3ZXINCj4gICAqLw0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9k
dHMvbnhwL2lteC9pbXg2cy1kaGNvbS1kcmMwMi5kdHMNCj4gYi9hcmNoL2FybS9ib290L2R0cy9u
eHAvaW14L2lteDZzLWRoY29tLWRyYzAyLmR0cw0KPiBpbmRleCA0MDc3YjYwN2MyOWVhLi5lNDJj
Mjc0YTkwMTRlIDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9ueHAvaW14L2lteDZz
LWRoY29tLWRyYzAyLmR0cw0KPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9ueHAvaW14L2lteDZz
LWRoY29tLWRyYzAyLmR0cw0KPiBAQCAtMyw3ICszLDcgQEANCj4gICAqIENvcHlyaWdodCAoQykg
MjAyMSBESCBlbGVjdHJvbmljcyBHbWJIDQo+ICAgKg0KPiAgICogREhDT00gaU1YNiB2YXJpYW50
Og0KPiAtICogREhDTS1pTVg2Uy1DMDgwMC1SMTAyLUYwNDA5LUUtQ0FOMi1SVEMtSS0wMUQyDQo+
ICsgKiBESENNLWlNWDZTLUMwODAtUjEwMi1GMDQwOS1FLUNBTjItUlRDLUktMDFEMg0KPiAgICog
REhDT00gUENCIG51bWJlcjogNDkzLTQwMCBvciBuZXdlcg0KPiAgICogRFJDMDIgUENCIG51bWJl
cjogNTY4LTEwMCBvciBuZXdlcg0KPiAgICovDQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGggTmll
ZGVybWFpZXIgPGNuaWVkZXJtYWllckBkaC1lbGVjdHJvbmljcy5jb20+DQo=
