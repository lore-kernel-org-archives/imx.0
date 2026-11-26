Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=116.203.31.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681553;
	b=QGMzqJCR4umBx0lL306fcgH1o4ULxAcRKwNtVdqEzhamo66eVghJAsynWFQGzKemmnqC
	 2loO5mFGWtzZcsJtv5dxLPG9MgbVHAj4n2YoUD16hfaVBNjAJj4xdTEdp3rmAifb1GyNR
	 nYXDw/7N+fGeh+nsdVvn45L+80m96tjbw66j1G7V4RRWtY0v91nFDTDurc4biue/GKs5x
	 5FxKOBYabDZ8On2KGYw/lhn3ovhzq+Raa8JcirhjvVNI82bYyqOBZcB2HgKzSED7Habhv
	 cvQvc7NDfY7ZCDQL2iXjFALsW/PPEO4uvyWp3RMT5HscBuwq7xd5biFBxPRjdmPtJRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681553;
	h=DMARC-Filter:DKIM-Signature:X-secureTransport-forwarded:From:
	 Complaints-To:To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:
	 References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=GhXefzmZY9gWz2XO5wKueke+JFfkFr9M9YsFaTjCOvU=;
	b=wRA/68JtViIOVVGTbmLsy3bLY7r9DjNnNKHxiK0/4s6SghjBElQu8AdtnMz7wcCT8p+L
	 DCHZJnJKQLgQYAMNmcVaHrOmML7rkdOlVyCVUAMssJfcMaIKcHsb3l/HwShB17rvURLo5
	 G7/Pg+V1VFW+ZJz5M8cvDqT/MaqfY3cvq/wtwu5wcRYbTC9xDyMdt3aJEXDsLfkHwhu3s
	 yJLprVf6P6SOleN1YdfjffosirtSf/Ul9OZ2v1b3jr/kyJ55FP5lwVoER4Kl4LtHUFNdP
	 X1SpdceoNoRvdaS21bNIZn3xlXbJYKkblB66hgPciVD6axwWQMRryNKno3EKryAR8Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dh-electronics.com;
	spf=pass smtp.mailfrom=dh-electronics.com;
	dkim=pass header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=KRftRRxu;
	arc=none smtp.remote-ip=116.203.31.6
Received: from mx3.securetransport.de (mx3.securetransport.de [116.203.31.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7583F606A33A
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 08:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7583F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=KRftRRxu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1795681531;
	bh=GhXefzmZY9gWz2XO5wKueke+JFfkFr9M9YsFaTjCOvU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=KRftRRxuzHKoEGcsihtRYRfYTQ6HNy40Yr3998Pnsqg9qdd/TxNAIGeNHnXkPCiKf
	 XrsxZ/yuPY4TwPRukW/voTuKw/ZcmGOZjm3LeDb6kMj5MdiJ1sJHNXdAivn0QsRLBy
	 vJeRHR/jzwmZbS7MKCy5O2zycaHaNrqk5y+5DExOoEqPs5Kk54XhiEel1WLBBY5A6m
	 rYh9nznVIWPmBWlyGM9K/JkFHc4/GFz1b7iL2+j7UsvNnpL7jcyiBz2lXAc4bpL5tQ
	 9h2K7teuffOQwg6Pq4gTogXckCFK7fnYdiDb54hQnTkY1V9MtI1C7Et+heExTUOyjb
	 FJE6kftpUt5jQ==
X-secureTransport-forwarded: yes
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: Marek Vasut <marex@nabladev.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
CC: Pascal Zimmermann <pzimmermann@dh-electronics.com>, Conor Dooley
	<conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Frank Li
	<Frank.Li@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring
	<robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, kernel
	<kernel@dh-electronics.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH V2] ARM: dts: imx6ull-dhcom: Change eMMC pin configuration
Thread-Topic: [PATCH V2] ARM: dts: imx6ull-dhcom: Change eMMC pin
 configuration
Thread-Index: AQHdfNxvka56chsGIUmKS9A5oSlWCbc+vxUAgAFGNIA=
Date: Thu, 26 Nov 2026 08:25:29 +0000
Message-ID: <4ef4ff8128b049d59a0ab23bea906468@dh-electronics.com>
References: <20261125125621.6734-1-cniedermaier@dh-electronics.com>
 <a57373f2-dfb2-4344-8e2c-6621a623d170@nabladev.com>
In-Reply-To: <a57373f2-dfb2-4344-8e2c-6621a623d170@nabladev.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

RnJvbTogTWFyZWsgVmFzdXQgPG1hcmV4QG5hYmxhZGV2LmNvbT4NClNlbnQ6IFdlZG5lc2RheSwg
Tm92ZW1iZXIgMjUsIDIwMjYgMjo1NyBQTQ0KPiBPbiAxMS8yNS8yNiAxOjU2IFBNLCBDaHJpc3Rv
cGggTmllZGVybWFpZXIgd3JvdGU6DQo+PiBGcm9tOiBQYXNjYWwgWmltbWVybWFubiA8cHppbW1l
cm1hbm5AZGgtZWxlY3Ryb25pY3MuY29tPg0KPj4NCj4+IFRlc3RzIGhhdmUgc2hvd24gdGhhdCwg
d2l0aCB0aGUgY3VycmVudCBwaW4gY29uZmlndXJhdGlvbiBvZiB0aGUNCj4+IGVNTUMgKHVzZGhj
MiBpbnRlcmZhY2UpIHJlYWQgZXJyb3JzIGNhbiBvY2N1ciB3aXRoIGEgY2VydGFpbg0KPj4gdHlw
ZSBvZiBlTU1DIGNoaXBzLg0KPiANCj4gV2hpY2ggY2hpcHMgYXJlIHRob3NlID8NCg0KVGhlIHBy
b2JsZW1zIG9jY3VycmVkIHdpdGggY2hpcHMgZnJvbSBNYWNyb25peC4NCg0KUmVnYXJkcw0KQ2hy
aXN0b3BoDQo=
