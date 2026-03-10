Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011051.outbound.protection.outlook.com [52.101.65.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01A71DC1AB
	for <imx@lists.linux.dev>; Tue, 10 Mar 2026 08:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132128; cv=fail; b=ENgvJbKNjz5TEjUUuh7/Q3gYtod2IMk9Yaxy2tb42wU35QFBXmjEBHzeeBJF2UnF7OM5yvxV0lilVJT/S1G0GaOOVgUgtIuKYTVGmmMDcbFwhR57oRd7y0fL7kZmlX4ScuVcM6UHY2GeDkWQj6HXVHbRRXUzNguYnzZnQLnL0nw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132128; c=relaxed/simple;
	bh=62tyjEpSzyaYX0oinpff5mIrvalyI4kr4yK/zSwwb80=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oZJtUkza+aPe68HwvUKGio/G2op60aiFJxcbHE5Kid4uNAeqTbAqe/wr6DSbE2QSINhdU4fZiEhr/Z+VhJpF4uYW/GN4+IiE3wOUpVS84WEnpZkFs32iZOKFxQiUMwUJYtXULAKi/pttem/snpRr0PvnEqhytXh+Cp1Ymv6McwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HIY1rEC+; arc=fail smtp.client-ip=52.101.65.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HIY1rEC+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f8NarGO8dyqQ64vsowC5fb2d+bZsscy/vGoqO+Xs+fm9jnftDmGwwvZOTv+c+b7amSX/0IxrtcMob3WA9BxtlGnWyfHlyQ0CHAgQYoR0UBc+itTppK/+Mk29pyA6/BKZqwKOajmAarQm30XuvurclqaE+9xP5C0y1erKi/ismxg0Q90mBfGoYx+NdaIqmhSkROehjAF6AT84Z9S2WEP7cNUyJTPsCPicru9Gg5qSA8bWNn5G6qiZC+3/VL49snCoZ5ny+K9t9y2gou6MhUHe00n3XZW2fdQd8n50HSt4M3xTB+nhriAmzikfFh7KnrWKDSKtsujWBeO9dsADKolthg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62tyjEpSzyaYX0oinpff5mIrvalyI4kr4yK/zSwwb80=;
 b=YVnBNnJbToqnTL3evPZTRv0BfHVUchWDdfDiOmBDi+8jGH3K5QvjZ+aj6Grqxfv2eEnlgnIHW1SgfOwtpmZoCHWkJTDeieU1UGv7L5ztaFzq37b8+lh95EFfW3baBgoXUPHFFbOo4UIHw5frNDt/YiOkyPNUiYNixzd6PO0bS0kU891G11r+9BVAU48g1jQ5hDCTerrm9MMzm+q5ZfUatgbRV7OTZF2J0Z+ih1HfdOp015yLaLhyLOJgWZwgm9joD5qQUhTAb5m9y2azqlfJzXkjfc9MeoJQslcLEbg6DDhzvkmAhOOE44pqi+7V8oGZGGydi8N8cgcD9IvZM7kEOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62tyjEpSzyaYX0oinpff5mIrvalyI4kr4yK/zSwwb80=;
 b=HIY1rEC+MlGIRMS5X9CI+V+8zEbLAuAynr/+CM0ouRWIztXIf3sfGICu+Jz8ss/N8WJYByz0NW3clTjBOp63TcAJ4brCt+i5zI5JGU3Kx3q2wrOxhbf75Rgw39H0/mFRdIFMkADISbT7N2hngRBBOIJK4u3pjo7LgwzWoVPFNZDPLe4BPpRXDGAgCioFu2XQ5H887QRP3qUE5TZ1u6erWTUbR7qtfFXTdVjNCAoPT9YiKr+3aoSdoqUWLwE+vWxRD5TjCC4uy7BKhdXukWryaQHV46rHixeZgrbE/36XIUenENP+2PMQuZFgFKWwi+OdiLI4/7Y58uptF/8KSkjMxw==
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by GV4PR04MB11450.eurprd04.prod.outlook.com (2603:10a6:150:296::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 08:42:00 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 08:41:59 +0000
From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
CC: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@kernel.org"
	<tglx@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "chun-hung.wu@mediatek.com"
	<chun-hung.wu@mediatek.com>, "walter.chang@mediatek.com"
	<walter.chang@mediatek.com>, "jstultz@google.com" <jstultz@google.com>,
	"amergnat@baylibre.com" <amergnat@baylibre.com>, Aisheng Dong
	<aisheng.dong@nxp.com>, Jindong Yue <jindong.yue@nxp.com>, Xuegang Liu
	<xuegang.liu@nxp.com>, Greg Kroah-Hartman <gregkh@google.com>
Subject: RE: [EXT] Re: [PATCH v4 3/4] clocksource/drivers/timer-mediatek:
 Convert timer-mediatek to a loadable module
Thread-Topic: [EXT] Re: [PATCH v4 3/4] clocksource/drivers/timer-mediatek:
 Convert timer-mediatek to a loadable module
Thread-Index:
 AQHcq67R/jfgdFFso0+2DI4r/Bm39LWeu40AgAI93KCABBkHAIAAaeuggAB9Y4CAAX1tIA==
Date: Tue, 10 Mar 2026 08:41:59 +0000
Message-ID:
 <AS8PR04MB84206959C00CFDC4C85B8BC2EB46A@AS8PR04MB8420.eurprd04.prod.outlook.com>
References: <20260304081207.4030882-1-zhipeng.wang_1@nxp.com>
 <20260304081207.4030882-4-zhipeng.wang_1@nxp.com>
 <aaiByowtXrTxPsd7@mai.linaro.org>
 <AS8PR04MB84206CF559371D3966653F8EEB7AA@AS8PR04MB8420.eurprd04.prod.outlook.com>
 <6255aa0f-529c-41cb-be32-e5d54a839125@oss.qualcomm.com>
 <AS8PR04MB84209F4103D8D4FD495F5B26EB79A@AS8PR04MB8420.eurprd04.prod.outlook.com>
 <019942a0-e9f2-45f1-8e04-26ecc9822705@oss.qualcomm.com>
In-Reply-To: <019942a0-e9f2-45f1-8e04-26ecc9822705@oss.qualcomm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8420:EE_|GV4PR04MB11450:EE_
x-ms-office365-filtering-correlation-id: 88f12b02-b948-42e8-eb8f-08de7e80e52e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|19092799006|7416014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 XLDuHqUxsXDCcIljkB0+RW7hm2BHFQlrLjG+UxHCMn1nr/QgT/4fWnOvh7r5NDs9yX6ezCO/LvfNAd+O4KXgSxW+FlNDZmpWC+wERfllEEwnGzTAnE0lx7TobSaeBM51Ct5HTUmz0JyNYTzThfCngQTlOiYgqY6Sz46yvys5f9p3o2LgPwk6cGAgYsNLeJU1uJmbQ3L8g0U8aMWa211WjrY4yP3WGXZyKxY9Xmckx9ELs+XFzkaYGrBBdbuImjI0pxka2iV4p2gVCRJsqlexVyoVUe3+2VZeGKKF9Y1vOnolrSnRIHYi66xvBiqAObUnsB1acsRIvjDGjL7z+xhQMC3QQQNaE6OAbxKMvK47jdlrTNz8zjZ5sqDHjO6jovIJux1wLzI35UJpvGAf8yLNe2WNrALRIkCgJDzWZ9JT7Wn/PogRnWgzXrAs+AlhuBto4+p12OqGXxQMrR/4Fs/b+voGbszxGRTFWt0kbJ+kJLNkq68gIzKxBE8P+tK0mEE/Yoq7hNsp0Qvuk4g5reUV8arOj2n2rTzpEwljIeQJdJwbdrbV2NDtNffg9w3veyarPPib5EALz1BxN78CylK9vXRgshFWalHSjPoX6Hw8isCMvJKhJCItm4wK6CO1iQPc9jdfxwFJSn7viw6IqpRT3/QaJIslGY9RGAs2Br83oVJ/cAkcz5nPi7XlRIwI9NBDz90hhofc+Q3buYsrhwkvf5UUrd/X64m7Jr6nkhOTyWrjftUP0rfu6cCrRkSZq1Ocr00bFmj8u+mBvoSFmaBdMYd6Pw8TAIHvA/NSmtdRGMM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(7416014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NkY1RllVd1ZxM29jQmQ4eC9KV1pla2NnWTdUVGxuUmRIV0IzOTFYZ0Z2UUJG?=
 =?utf-8?B?Y0JyWFg5anV6VGI3RFJMMVlacG0rUUdOQ3NnTEpneFNZSENpOCtYTVFuS1RI?=
 =?utf-8?B?SCtJbXNkWCtuUkFHbWxQKzJuOW1RZkpVMDBjYzNYcGh5aUZsOGlLVUpuUVpu?=
 =?utf-8?B?QUg4ZC80L1RyMTJiSWlPRW45ckpnNWFDTjI0R1VKVlB2cHFvZjg5OTJ4MTFx?=
 =?utf-8?B?VmxmNXJqbm9zS25lZTFVd1dNaS9BaEJkMWplQUlUNCs2S0dra2lad0wwcG0x?=
 =?utf-8?B?bFBOT2tDb0VqM29kR3FWV2ZqaUtNdnlhZTNLQkVXYm4xcERlOUtNaFVmNCtK?=
 =?utf-8?B?cmdzUnFjdDN3NGM2N2taRDhNbDE2WjRsUVdJSTJ1VHdGOUx1L1YwODJUcWd1?=
 =?utf-8?B?SDZRNkxiRXQwc1lNK0UyZHdrbkhqNExMd3FsVndzcHN3WTNKR0k5OFVBT0VC?=
 =?utf-8?B?cXMrUlFDVmppLzdqV1VVYllRRzQrclFQb09PSndWMmV4cFBEWWdrbCtMOFFn?=
 =?utf-8?B?OXI5WEdMMUpvK0FSL1hUaU1IWFY5UHljNUwvVXlGSFBBVkpYOENDYWVOSkJY?=
 =?utf-8?B?Z21LK1h2RDdJaG91U3NyWEdESUJtVVhJTGQzb0tYbnF4bS9wMnNsaEdHT0lp?=
 =?utf-8?B?TXJQOW5vRXdHM3hzdkthVHhyeTltNXJ0Y2xFLzRPQ2dIZzI5eG5CYXVjMWF4?=
 =?utf-8?B?S2d4ajA2WURvNlI2N0NqQUFsc01YTVhnVjc4cUlGUGdpNFp6ZzZiWk5KeTVu?=
 =?utf-8?B?WmlxRGUweHdMZ1pVWWx4aWw3OXRqMFAwWkVreHpMcWQ3OVlxU3BxRGR5Q2Vy?=
 =?utf-8?B?M1lTaytyeUZDWGZjT000WUYrQk02Wkg4dGtPNjcrZDh3WjNhbEJaRitiUU1u?=
 =?utf-8?B?dXhxT283bVppckdUUkZGS2g0bU8wQkxpajdxblRZenJPcVAyK3BjRGhHczNQ?=
 =?utf-8?B?MDNhdE44KzFFaXRQRHE5K2Q2UlROays0UUVIck9NenhmOERmMWg1akdJTWZ5?=
 =?utf-8?B?eWNoSE1SeC9IN3FiWUIxRm5zVFJGSDJwc3YvMlcxUDFESGRleGdCNHkrRkZC?=
 =?utf-8?B?QXJGOXp3ZTEvT2pvWEQ5Zkw5Zkw3djljWjhmQ0xXdDF1ZFRjamJucXVNcldx?=
 =?utf-8?B?R3Jkc3BTbno2bWdRU3BOaUVOMjdCVlNib1JXbUx4V3ZSZktTYmZOaTRSTXlT?=
 =?utf-8?B?RUU5MFc0WHlwK3ZqZ3VCRmdjSFRaT1J0bFY0bFJ6T2FxUlJYWE9ZaG8zdFlH?=
 =?utf-8?B?SUFaRHJCYXEzVzZoUVk4TnJCWTVCc3FwcFpmMVFVYlRGV1ptTUxNK0JQdlV2?=
 =?utf-8?B?SjJkdk85V2V4N3NCYVIycE56ZW03MCthSURvZ0dFWmtYWU9jZ1dzQmVmMmNQ?=
 =?utf-8?B?d1RvS1pqOW5GZ2I4WFZwYTk5VzBJRllZQitXRWM4ZDNqbXNvTkdOMHJzSDZQ?=
 =?utf-8?B?cHFYcmNKR3hMREhRZXBCVERBa0NyU2k4TTNWRDI0M0UyejhNT05QWmNsdG5a?=
 =?utf-8?B?ZW9TTkZreUpucVoyUWo1SVd2Q0FkMU1PK3hPL2tuSmh4Q2hKM0NkZ292MDh2?=
 =?utf-8?B?L3ljUmdaM1lNd01UZW1GUmZSbUVkODUrN3lLVkp2VmZEV3JzNUFKbjdmeXJV?=
 =?utf-8?B?SFNNaVRzSERtRU1hY0VPM0IxMmhqS0NnTDZHWm14Rjg4TjQzaHBneFFaandh?=
 =?utf-8?B?Mlp4VGgrVGJLb1Q2cjRjNi83QlduTzBoUHFpbjBJVXpHOEJBcHJnREhWNlFT?=
 =?utf-8?B?OGdJUWN2aUpmZHl6bW9ISkcvUXpRWnJYVE9qbXY5Q05uK0JtaW12cGpWT3Fm?=
 =?utf-8?B?b2hLdGtBVnFDY2ZuRTZ6eUc0Q0ZFRFRMYlpYNExWVDF4K284dkx6Nm10Qkx6?=
 =?utf-8?B?bGprOXVvVk90MXgzNXV1b0NCbThHRGhQbjFSTEREYUtzejFoSHFXZ21wVkZD?=
 =?utf-8?B?OWhkYTFBYW90bWI4V2xGYStYRGJwcmpZamQ4YnVYbGlVNEdpdEtsNDJHdWpk?=
 =?utf-8?B?WFk3NWl2UHVoNGlxWmRZZnpRdUhoNFErN2p1YWp2OWE2UTVrVVBSMnlzay8y?=
 =?utf-8?B?RjRDanQ0dWZ3SzBVaGdYOUJnWkpHb1A4T1pvOVpPMTBRVUVFWWdLSUhWbElX?=
 =?utf-8?B?MWRNZW1xNTFJU0FxL21yYi9wMlZybkVNdVhBUGRySDdDRW1nOWIyRFh0d0Zr?=
 =?utf-8?B?aUI2UXJFQmVvRElyMVVrS0JYQ3lIZitBdGxBS0YySlJSaUsxMzU3YlBJTVFC?=
 =?utf-8?B?Z0NldmlIdVAwOE8wR0JvbVNwdURDUDkyRUh5aENHRVVrWlpMOXBGL2gvQlBO?=
 =?utf-8?B?YWFwRUdpaTBsSnVLZDFpRE1kcWMzL1NGU3B2Rkd0ZEVxOU9FajJIZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f12b02-b948-42e8-eb8f-08de7e80e52e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 08:41:59.8595
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: izgXPUnbLJO0U6sMHBLaJX6fYrbV2aXq20NG3UmTua1mZdtV0JAcRZ6B0gywG9PWTXGdjR28PEQ/VfDbIAcp0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11450

PiANCj4gDQo+IEhpIFpoaXBlbmcsDQo+IA0KPiBPbiAzLzkvMjYgMDY6MzEsIFpoaXBlbmcgV2Fu
ZyB3cm90ZToNCj4gPiBIZWxsbyBEYW5pZWwsDQo+ID4NCj4gPiBJJ2QgYmUgdmVyeSBoYXBweSB0
byBjb2xsYWJvcmF0ZSBvbiB0aGlzIQ0KPiANCj4gR3JlYXQsIGxldCBtZSBzZWUgaWYgSSBjYW4g
Y29vayBhIHBhdGNoIGluIHRoZSBuZXh0IGRheXMNCj4gDQo+ID4gTXkgYXZhaWxhYmlsaXR5OiBJ
IGNhbiBkZWRpY2F0ZSB0aW1lIHRvIHdvcmsgb24gdGhpcyBvdmVyIHRoZSBuZXh0IGZldyB3ZWVr
cy4NCj4gSSdtIGhhcHB5IHRvIGhlbHAgd2l0aDoNCj4gPiAgICAgLSBUZXN0aW5nIHRoZSBuZXcg
bWFjcm9zIHdpdGggSU1YIHRpbWVyIGRyaXZlcnMNCj4gPiAgICAgLSBDb252ZXJ0aW5nIGV4aXN0
aW5nIGRyaXZlcnMgYXMgZXhhbXBsZXMNCj4gPiAgICAgLSBSZXZpZXdpbmcgYW5kIHRlc3Rpbmcg
cGF0Y2hlcw0KPiA+ICAgICAtIERvY3VtZW50YXRpb24NCj4gDQo+IFRoYXQncyBhd2Vzb21lLCB0
aGFua3MNCj4gDQo+ID4gTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0LCBiYXNlZCBvbiB5b3VyIFJG
Qywgd2Ugc2hvdWxkIHVzZSB0d28gbWFjcm9zIOKAlA0KPiBUSU1FUl9PRl9ERUNMQVJFX1BERVYg
YW5kIFRJTUVSX09GX0RFQ0xBUkVfUExBVEZPUk1fRFJJVkVSLg0KPiANCj4gWWVzLCBidXQgYWxz
byBzb3J0IG91dCB0aGUgZXhpc3RpbmcgVElNRVJfT0ZfREVDTEFSRSBtYWNybyB2cyBNT0RVTEUg
aW4NCj4gb3JkZXIgdG8gcHJldmVudCAjaWZkZWYgTU9EVUxFIGluIHRoZSBkcml2ZXJzDQo+IA0K
SGkgRGFuaWVsLA0KDQpZZXMsIHRoYXQncyBvdXIgZ29hbC4NCg0KSSdsbCB0ZXN0IHRoZSBuZXcg
bWFjcm9zIChUSU1FUl9PRl9ERUNMQVJFX1BMQVRGT1JNX0RSSVZFUiBhbmQgDQpUSU1FUl9PRl9E
RUNMQVJFX0VBUkxZX1BMQVRGT1JNX0RSSVZFUikgd2l0aCB0aGUgSU1YIHRpbWVyIGRyaXZlcnMg
DQpvbmNlIHRoZSBwYXRjaGVzIGFyZSBhdmFpbGFibGUuDQoNCkJlc3QgcmVnYXJkcywNClpoaXBl
bmcNCg0KPiBBIHNpZGUgbm90ZSwgYXMgVHJpbG9rIGNvbW1lbnRlZDoNCj4gDQo+ICAgLSB5b3Ug
c2hvdWxkIG5vdCBkbyB0b3AgcG9zdC4gS2VlcCBpbmxpbmUgY29tbWVudHMgd2l0aCB0aGUgcHJl
dmlvdXMgZW1haWxzDQo+IHNvIHdlIGNhbiBoYXZlIHRoZSBjb250ZXh0Lg0KPiANCj4gICAtIHRy
aW0gdGhlIGVtYWlscyB3aGVuIHBvc3NpYmxlLiBJT1cgcmVtb3ZlIHRleHQgbm90IHJlbGF0ZWQg
d2l0aCB0aGUNCj4gZGlzY3Vzc2lvbg0KPiANCj4gICAtIHVzZSB0ZXh0IG1vZGUgd2l0aCB0aGUg
bWFpbGVyLCBub3QgaHRtbCBvciB3aGF0ZXZlcg0KPiANCj4gICAtIGZvciBtb3JlIGluZm9ybWF0
aW9uIHJlZmVyIHRvIERvY3VtZW50YXRpb24vcHJvY2Vzcy9lbWFpbC1jbGllbnRzLnJzdA0KPiAN
Cj4gVGhhbmtzIGZvciB5b3VyIGhlbHANCj4gDQo+ICAgIC0tIERhbmllbA0KPiANCj4gDQoNCg==
