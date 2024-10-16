Received: from mx2.securetransport.de (mx2.securetransport.de [188.68.39.254])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0071D14E3
	for <imx@lists.linux.dev>; Wed, 16 Oct 2024 08:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.39.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729067348; cv=none; b=MdJn0ud4Q3b8PiOHLzdpZHbIhsaAVu45whvIHh2/KL509QW/K9en8vGMINKlEp1yXTswYBi71M+a+6QE3ISp1mbzzlDP+fg4o7nH2xeVuGMt2pLPwyh+GfmdnGOhqJxiY8CNTUKE6FZ1dhimCNY5syZY7WbZPRsbFACkp0xwen0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729067348; c=relaxed/simple;
	bh=YPCg5g13y42ht/3sW9miW8aU/7XPK0SieIvWxUTxjHg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Sbt5aq8iYWo3DWHOpqogWyR5l+UKh1dDPmsX4iiedG96r3D7AwzB2b13vF2sXgEYEsvWXLXhRAKcnUBchp1F92NrvQBDAP+69U7El7Atj34KXgOYmAck+ZTB1N+u25Bo+NVX06heWjR/E/hRv6yIGZYQX4gK73Sylj/9XKaY1AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com; spf=pass smtp.mailfrom=dh-electronics.com; dkim=pass (2048-bit key) header.d=dh-electronics.com header.i=@dh-electronics.com header.b=QMynq8d0; arc=none smtp.client-ip=188.68.39.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dh-electronics.com header.i=@dh-electronics.com header.b="QMynq8d0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1729067321;
	bh=YPCg5g13y42ht/3sW9miW8aU/7XPK0SieIvWxUTxjHg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=QMynq8d0vI9p3DtprOy/8pKNv11xLSXIEYRQI1cCRycXhNvzz9Oz5nBolEYkjJbJE
	 Xa4qXG0C4/Hi3vZ9KrRHWq3wGSykaCCFroF35acmnRYkzulxrk9rvdOe5mYq0ql/LZ
	 tKLAikxIuyQjdgcDVMmGPGEH2ZBpYDigEXwDXbnif4vjebXwR8CYv9wjgU6ByzkVTO
	 4xWtY7I0oy6AJJb1v9tSBwMsYGXzS51ahjF1RIIInLSBVJOReMMnRjVxuBk+YSPRFo
	 AqGO7QJobGS+s6sI60ZNk2oPG8cahGP3CI8DGz9De9IjmVSxMt1H2EvykbJzeS4ds+
	 9w45r9J2dcDvA==
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
Subject: RE: [PATCH] ARM: dts: imx6qdl-dhcom-pdk2: Drop incorrect size-cells
 in GPIO keys
Thread-Topic: [PATCH] ARM: dts: imx6qdl-dhcom-pdk2: Drop incorrect size-cells
 in GPIO keys
Thread-Index: AQHbH1PumK9xDnPhM0Kj/N8bhEPJlLKJC/pA
Date: Wed, 16 Oct 2024 08:28:40 +0000
Message-ID: <09ed8d5735494da487d1b0dc72395c1d@dh-electronics.com>
References: <20241015224505.94359-1-marex@denx.de>
In-Reply-To: <20241015224505.94359-1-marex@denx.de>
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
ZXIgMTYsIDIwMjQgMTI6NDUgQU0NCj4gQmluZGluZ3MgZG8gbm90IGFsbG93IGFkZHJlc3Mvc2l6
ZS1jZWxscyBpbiBHUElPIGtleXMgYW5kIHRoZSBHUElPIGtleXMNCj4gaXMgbm90IGEgYnVzLCBz
ZWUgZHRic19jaGVjayB3YXJuaW5nOg0KPiANCj4gIg0KPiBhcmNoL2FybS9ib290L2R0cy9ueHAv
aW14L2lteDZkbC1kaGNvbS1wZGsyLmR0YjogZ3Bpby1rZXlzOiAnI2FkZHJlc3MtY2VsbHMnLCAn
I3NpemUtDQo+IGNlbGxzJyBkbyBub3QgbWF0Y2ggYW55IG9mIHRoZSByZWdleGVzOg0KPiAnXihi
dXR0b258ZXZlbnR8a2V5fHN3aXRjaHwoYnV0dG9ufGV2ZW50fGtleXxzd2l0Y2gpLVthLXowLTkt
XSt8W2EtejAtOS1dKy0NCj4gKGJ1dHRvbnxldmVudHxrZXl8c3dpdGNoKSkkJywgJ3BpbmN0cmwt
WzAtOV0rJw0KPiAiDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVu
eC5kZT4NCj4gLS0tDQo+IENjOiBDaHJpc3RvcGggTmllZGVybWFpZXIgPGNuaWVkZXJtYWllckBk
aC1lbGVjdHJvbmljcy5jb20+DQo+IENjOiBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5v
cmc+DQo+IENjOiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+DQo+IENjOiBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+DQo+IENjOiBQZW5ndXRyb25peCBL
ZXJuZWwgVGVhbSA8a2VybmVsQHBlbmd1dHJvbml4LmRlPg0KPiBDYzogUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4NCj4gQ2M6IFNhc2NoYSBIYXVlciA8cy5oYXVlckBwZW5ndXRyb25peC5k
ZT4NCj4gQ2M6IFNoYXduIEd1byA8c2hhd25ndW9Aa2VybmVsLm9yZz4NCj4gQ2M6IGRldmljZXRy
ZWVAdmdlci5rZXJuZWwub3JnDQo+IENjOiBpbXhAbGlzdHMubGludXguZGV2DQo+IENjOiBrZXJu
ZWxAZGgtZWxlY3Ryb25pY3MuY29tDQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmcNCj4gLS0tDQo+ICBhcmNoL2FybS9ib290L2R0cy9ueHAvaW14L2lteDZxZGwtZGhj
b20tcGRrMi5kdHNpIHwgMSAtDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL254cC9pbXgvaW14NnFkbC1kaGNvbS1w
ZGsyLmR0c2kNCj4gYi9hcmNoL2FybS9ib290L2R0cy9ueHAvaW14L2lteDZxZGwtZGhjb20tcGRr
Mi5kdHNpDQo+IGluZGV4IDYyNDhiMTI2YjU1NzguLjc3M2ZkY2ZjZDAwMTUgMTAwNjQ0DQo+IC0t
LSBhL2FyY2gvYXJtL2Jvb3QvZHRzL254cC9pbXgvaW14NnFkbC1kaGNvbS1wZGsyLmR0c2kNCj4g
KysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvbnhwL2lteC9pbXg2cWRsLWRoY29tLXBkazIuZHRzaQ0K
PiBAQCAtNTYsNyArNTYsNiBAQCBsY2RfZGlzcGxheV9vdXQ6IGVuZHBvaW50IHsNCj4gICAgICAg
ICB9Ow0KPiANCj4gICAgICAgICBncGlvLWtleXMgew0KPiAtICAgICAgICAgICAgICAgI3NpemUt
Y2VsbHMgPSA8MD47DQo+ICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImdwaW8ta2V5cyI7
DQo+IA0KPiAgICAgICAgICAgICAgICAgYnV0dG9uLTAgew0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0
b3BoIE5pZWRlcm1haWVyIDxjbmllZGVybWFpZXJAZGgtZWxlY3Ryb25pY3MuY29tPg0K
