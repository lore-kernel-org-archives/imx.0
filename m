Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013071.outbound.protection.outlook.com [52.101.72.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F76637881D
	for <imx@lists.linux.dev>; Thu, 30 Apr 2026 06:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777531881; cv=fail; b=n5VKic8oxFVbXF/AIxDBBSB3E+nboEXRbEZofB8uzDi0tsFtSczFl1PY8LCMJImQRD+53wymMe3DcY1ssLMMYWiPIHmpPKTbdWgfciT9m5nrP4CNkZl+a8BjZU9AtLERjdNPJZCSRj1ogKVNqIWDULiW7F14ab6D6ABF+m8Z/K8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777531881; c=relaxed/simple;
	bh=eda+IDz+1xeEHE3p1cdd8dv8278ByuDkXfSFBUX+zmg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=q+XKcDJ0ASkA8Ap/lga8vkK3SnrmmUyqkAhfSz4PRE9n16W3ZoIEo9M4N6zKXQUcuYGS4tGG255dyY6g109YYLPlMcwBvFZfVCNETj2ZB+tOza+6HII+4HLpzorTS9mf5KwseCuoE+EhbKAL3F4T76MYcmS08v5Gm9bjb9ZYuas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nH1oYWwY; arc=fail smtp.client-ip=52.101.72.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nH1oYWwY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t66rpoRjYFwKF984AzOT1cbeUjTtNZAlQ8eT4EBmY7ziVBy8pdJy5BkbQ39o/oczmhXxCWPxoJRZNamyXj1djptTtbWAKth4k1Z2i1PuzPktE2c+WTY1vXLVrb+jT2xFs91lkvOLb0ONxnGpILo3U9EpqgUXmATZrwm9kit9fW1h86cfDVwVmFWuS1pt5sCCkw7MrPljQgLRMpGpF19Vb7J05b7XXULnl5TbnMOtieXi99iBKbNnv+anri/9I0XdfM+/4F3/fgEoag9sLaADJaQAgtPuIvPWdYptB6PoL1uYLNnattDKdCL0siwJRiM2wfZraCUg/ycocXSHfSunkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eda+IDz+1xeEHE3p1cdd8dv8278ByuDkXfSFBUX+zmg=;
 b=GYgmV9rSTNcsIP6i+sr9tBHNe3DSR+hPRZfCNA8IP2RNNi4UdOJBO4B5eSJvMsTjS3T0+ozunzywNCdOL5ROk8tJxWntrqJOIF/isGXM6EglVuuMZr++at8+8Woe2gqFN5lwpgIaR7BC2Sagxg4Y61u+03zbB/Lrld4TufFnWIrFdjrFYmV0uKm2DnHJ+zRaMFsmRZvWxFfhr7OrZRh3LU7WksLiRxMAdbAXmJwPywE/p36af7gkK5sNUSpwlNLQONQLZbS6QrJDX+mZbf/Ios85sfT5lkh68PjKiaJ7y3NobYwmwFYYK/6s/NKGZuqtwcFu09zV6HXJvcj+bl2lKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eda+IDz+1xeEHE3p1cdd8dv8278ByuDkXfSFBUX+zmg=;
 b=nH1oYWwYi+lX5eKeAHfg02ziP1CPQXYLzFcMhrhzB1BnWmQlxZO6gZn7tNA5FyHmAMSp/yX/diNNXT+c1pJl7OTQnvUQFUyeitSj9c/imY4whTsWlOnCs0c68pGZdawTiAYl/+/eItuzESfUeITGO7HXuOb/MzfwmMvhUMED37gA42KMKKZhy9dCP4oIdSLTVs6/Q6qiR8R15rwXcTF6jQuUBjoMx+chModYgNaSzJyH1R9/eeMyVq/ES49yWtNAPaEHRtiFuTt5jAPhkBOy2xWWP0Z7pjtmPDWKiyzRcYwIDxdvBxlzE6hvqNNO66eviz4xqsKDnklrkqnahzcKpg==
Received: from AM9PR04MB8196.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::12)
 by AM8PR04MB7954.eurprd04.prod.outlook.com (2603:10a6:20b:237::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.19; Thu, 30 Apr
 2026 06:51:16 +0000
Received: from AM9PR04MB8196.eurprd04.prod.outlook.com
 ([fe80::fddb:8654:17a2:b4a1]) by AM9PR04MB8196.eurprd04.prod.outlook.com
 ([fe80::fddb:8654:17a2:b4a1%6]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 06:51:16 +0000
From: Jiafei Pan <jiafei.pan@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "andersson@kernel.org"
	<andersson@kernel.org>, "mathieu.poirier@linaro.org"
	<mathieu.poirier@linaro.org>, Peng Fan <peng.fan@nxp.com>, Frank Li
	<frank.li@nxp.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "Z.Q. Hou" <zhiqiang.hou@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Jiafei
 Pan <jiafei.pan@nxp.com>
Subject: RE: [EXT] Re: [PATCH 4/5] arm64: dts: imx93: Cortex-A Core remoteproc
 device node
Thread-Topic: [EXT] Re: [PATCH 4/5] arm64: dts: imx93: Cortex-A Core
 remoteproc device node
Thread-Index: AQHc1u4xDe0vifmR5ECaaBPWQfkD6LX1n+eAgAGMxJA=
Date: Thu, 30 Apr 2026 06:51:16 +0000
Message-ID:
 <AM9PR04MB8196E13EA80CA4319EA17E828A352@AM9PR04MB8196.eurprd04.prod.outlook.com>
References: <20260428090819.17761-1-Jiafei.Pan@nxp.com>
 <20260428090819.17761-5-Jiafei.Pan@nxp.com>
 <b7e93b01-39aa-4a9f-9927-6c634a6c727c@kernel.org>
In-Reply-To: <b7e93b01-39aa-4a9f-9927-6c634a6c727c@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8196:EE_|AM8PR04MB7954:EE_
x-ms-office365-filtering-correlation-id: c75f0ced-b521-4a0b-5155-08dea684e04e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|19092799006|38070700021|921020|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 rzZBlRpA1wKQfRNvnKGFN2ZtQRORKz0aWQyB+4c+BAbKvt4k5BwNIpVhmbTB6Ig7Lrza/6SuAU7y0mxHHI2KJrZsPa0Qx2vnBPIgF5E6/Q3Ai1wbepdUi2zhwoZVA0op8o1payrVNe0SNmAIyA10rZLjOxEmnJFSbxIQdFLu4Ku1rLIqvERG7CWcwgdvGFroDKKQkMGSdv+kt0TiOgo0ugrAinp4PxY8Ct05+bw3WzTAidQb++d9sfaJv9innCbi27psePO7Y27Dn/SDbq6PAjwyPNzTV1dXQiRJy2OjvRypyYYD1+nuMtK0GPzPDuGxJb6WPWQpEZiKu9/eOu/y3HCrrSvukUUWUjMCLp0A8kmlwXEVsOFOcR0dN/r9v5hlGcwE/SLqvD7ddg4STl3+pvWEqDHCfFN0WW45j6A/V8UWDyE81iX1loJlQadQqog/YCrfR1BDUkYFTQ9RRLqVz/zqUByszzBU4MuS1p6/vcta92IjaVvUgD6zYujxtfHzn3jPVidKicsvdDo65wASaRfDwQET4LrXStIzkcHqw2weT24DAbm5qt6UuaN+gE9SRG0kZD67rYTzaL1vakFCPJ9HkG36z3Di7MEJ+TYaQOxZc+A/jnJzSTy6QeIs8KUCEjn69Kw13MXzHQq8/3By4tspxkX2SzhQX6c83h46z5ArqhtaZDyL+wYZCmLTfMcX1bthcm7ub2XuCx4OULAwnqUUOoKQ6K5mvypm6GVVUxM92ZmAXsRiwi0nGy3J5rnWjDsUDIxYwLyChmloJjltC2+6WzJjByh0EfAkQMQEGbhJRrJpEPhvyZH5Wa/oxV6m
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8196.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(19092799006)(38070700021)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZS9oRHhPblBha0drTERtdlRpK3JnMUdyL3FZQXEzRWlhcHVETG02cm9jZnNy?=
 =?utf-8?B?d2VseHM1NjloVzRIakV1eUtGN0gwMng1RFJBcnpFV2ErblZIMXBiS01EbXpa?=
 =?utf-8?B?RXB3bHpmUWx1dXBvMGtOYlJTQ3ArcGhTOFB5cTNSUXVKd1ZCZFdNSmtQaExp?=
 =?utf-8?B?Mnl5ckFiYlFNeTYrN0RPOXYzeUFidjdRY0srNGt4YkprdnZyRDYvY01neHVH?=
 =?utf-8?B?bmQvbEdtZ3ZvaEdwUU1IdkgxbEZLS2RlN2VURmpiL2p6ZktEd3Z1UTV3SkdO?=
 =?utf-8?B?YXZaOGMyaUppRXNSWUFOM0h1RGEvaTVXQlBkZEJubG1oQ2xidGx0eWE3T3BR?=
 =?utf-8?B?bkYySlBNMVovV25yS1BhbUZoNTJFNFVTRkwyc1JhU0FtclN3ajI4azJKKzNu?=
 =?utf-8?B?MDBmdUdUdTVhMytmQytFL3c4RENrL0QzVk9uVnlWc1dGN0VoQ3ZNT0IvRGxM?=
 =?utf-8?B?eFVWQWVpWEZUcVZNb0RBajBNTG00R3J6R3lpODBRQjdpLzVjQUQyeDJuSG9x?=
 =?utf-8?B?YnVIdDVENjY3ZS9RL3F5NkkxNktBeGUwR2w1dXJVc0pudGxpSEVDa05yQ2ht?=
 =?utf-8?B?QWhxeU4wa0I2cDc5UFdXRWMvdnE2UXZxT1g5VFVGMW45TEM2U2paYVBNcFRy?=
 =?utf-8?B?L1ZUVXh1ZGh1RGN0UTRCcVlKelF2QmJKV1QxMmJsdFpsK0EySjlTYUQ1YlZk?=
 =?utf-8?B?d2k3eG1xdktkSUtCMHF2SEtHVUNTNWxhQ0crL3RzZWRxQ3lRZWZKWkdDWlUw?=
 =?utf-8?B?Q0RMSDVaSXBFQUR1N2lRNE1ITGl3SEpIdVVPRnVGazJUaUNxN2MrSlJpNm1q?=
 =?utf-8?B?Um9iQUNrYStValFQcUVRTmJtUi9CeFVLcjFFTkpsbmhHUjB6eGNldWZESGtR?=
 =?utf-8?B?QzVTRXlyZWRJRDR3QWkzSDdKTDlabWxMNGJDdlNqdDN3K3BSK0VkRk02dmxU?=
 =?utf-8?B?emY0WVpENHdER3cyYk9QWERmQUM0cllnY0JRQmIxQ2F5K3NzV0RZUTNCRWcv?=
 =?utf-8?B?ZnQ5V1FpbHMwTU5KbUlFeHJLeFgxMGQwLzM4ZHR2SlZuWGlLZHFCZHRKa3NE?=
 =?utf-8?B?MDdwaVpEWk5xNnhNTjB1Vnp6ZFBtdGdsclpDdlZiWEs1N0JJdEtuL25TTlQz?=
 =?utf-8?B?bGphOW5EZ2NlMFpyVnR1aWNtbzdZMWNDcjJMVVhJM2ZNYllPWWlqd0VsNWFq?=
 =?utf-8?B?MGVBQVd6ZFEwV0xQM0FuQUtrdk1FZU81QWdLRWtQT0gzRjdVbG5RVm54WG4z?=
 =?utf-8?B?elFVc0llMEwyRk9nYjIvZnJHZ0pGUjVkeDB6eHdZMk04Qm16Y2FzQ2h2ci9m?=
 =?utf-8?B?SVpOS1htUW80ZmY1MzFFWkx5dDRrcGVETVZwL0xvcURUcy9YSkhFK3JmOEtk?=
 =?utf-8?B?QmFrbVlEZlp6T0RGLzR3dmt3L013SU90b1dsL0hsbHBoditZRGRzUlF4TjJM?=
 =?utf-8?B?VjhFTTd2ZVpJd1YyV3A4VXQ2VUdnWkdHM1ZmZVpMMk9kSjluQ0JteXp5ZlZu?=
 =?utf-8?B?NG1vTVdjQzZReW1xTlNXeUNCVXNZcUMwa2Q3OFpkY3cwYkFRYXZVMEtPQm0y?=
 =?utf-8?B?ZlFEbHB0QWtpL2FGd3I3SG01VlFlRzlPUjFtOEdEWDJnUmpFYzdYK2oraURj?=
 =?utf-8?B?WUFSTENpcWNKMU1uSVBNVzlpUE1MZUhFQk9uMHU2cVplRUhMSDB1YnQxdCtX?=
 =?utf-8?B?NUhveHVxYUpYMGF0QVd2UEpjOHNwTXFudEhqV0VWeUpYK2kxVjJIbnBmc1lP?=
 =?utf-8?B?VTlVdDZXaU1DWEx4T3RRSU00dm1sYnRhZW1KV2g0VUZRc2M0L2lodVNrR2Ry?=
 =?utf-8?B?ZmUyQVBBaE5DaGRZeWd2ZnIyWDl5cXVONk5ic3RCRnhQQTRiS1h2MkM5d3ZV?=
 =?utf-8?B?TFdUQ2RDN3F3RmVGNXVEcUkzMGYzNzY2L3J1SnFkd3pNY3dCWG1qMklsS1py?=
 =?utf-8?B?MmVJc2tHeVhOWXU4MTRGZzRwdFlDNnRFSTZYZmZBNURON1htMkJaa1dXZFpG?=
 =?utf-8?B?a2NLa3RWc3dYZnBnb1M4TW9NN2xmTXZVaUJFWkdCa1FKakpiSXc4T0lyK1Mx?=
 =?utf-8?B?VEtFcGYwU0dXS0dUclZmWmNXSjVWMUkxb3VuZ0dlTXdLeC9nc0FXUjJMSWs5?=
 =?utf-8?B?cks4VVR6WnlZcENQdzJqWGhrY0EraEd5bzVWbHA0cE5BazFRVXZEcGwwQm94?=
 =?utf-8?B?VUJvekxyeHB4S3k4THh3SENBUzJ5RnYxcGVnOVdkS3gyVjRsMVVWTmVNTURX?=
 =?utf-8?B?KzFWUjlhMGloQUZIdG9XeGZGSDRQSXFraHBKazJzdGdNWGwwdjQ3eGhvUWxI?=
 =?utf-8?B?SWJmZTA1cWsrd3Q5aXVwL090MGNhZzQ4cGltdHBhaFQxNGNzdDRkYmZOWlBu?=
 =?utf-8?Q?/3yY9pnpnSm9jhwi+F8fyow3e/dQyueuFYhre?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8196.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c75f0ced-b521-4a0b-5155-08dea684e04e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2026 06:51:16.2194
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m7b1Kk4lLbQlsHqi/AV5P0jrfInwwWlzFiiRMG1Kdcnu6tNwwP59L57dIlJ2RidAiqPcmrkBq4n+y02fqv0KXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7954

PiBPbiAyOC8wNC8yMDI2IDExOjA4LCBKaWFmZWkgUGFuIHdyb3RlOg0KPiA+ICsgICAgIGluaXQt
b24tYXJyYXkgPSA8SU1YOTNfQ0xLX0xQVUFSVDJfR0FURT47IH07DQo+ID4gZGlmZiAtLWdpdCBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDkzLXJwcm9jLWNhNTUuZHRzaQ0KPiA+
IGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OTMtcnByb2MtY2E1NS5kdHNpDQo+
ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLjlkOWE2MDQw
NGQyYg0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2Zy
ZWVzY2FsZS9pbXg5My1ycHJvYy1jYTU1LmR0c2kNCj4gDQo+IEhlaD8gQSBEVFNJIGZpbGUgZm9y
IG9uZSBkZXZpY2Ugbm9kZT8NCj4gDQo+IFRoaXMgbG9va3MgYSBsb3QgbGlrZSBkb3duc3RyZWFt
IGFwcHJvYWNoLg0KVXNlIGEgZHRzaSBmaWxlIHdoaWNoIGNvdWxkIGJlIGxldmVyYWdlZCBieSBt
dWx0aXBsZSBib2FyZHMsIG90aGVyd2lzZSB3aGF0J3MgeW91ciBzdWdnZXN0aW9uPyBUaGFua3Mu
DQoNCkppYWZlaS4NCj4gDQo+ID4gQEAgLTAsMCArMSwxNCBAQA0KPiA+ICsvLyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgTUlUKQ0KPiA+ICsvKg0KPiA+ICsgKiBDb3B5cmln
aHQgMjAyNC0yMDI2IE5YUA0KPiA+ICsgKi8NCj4gPiArDQo+ID4gKy8gew0KPiA+ICsgICAgIGNh
NTVfMTogcmVtb3RlcHJvYy1jYTU1LTEgew0KPiA+ICsgICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJmc2wsaW14LXJwcm9jLXBzY2kiOw0KPiANCj4gQWxzbywgeW91IGNhbm5vdCBoYXZlIG5vbi1T
b0MgY29tcGF0aWJsZXMgZm9yIFNvQyBjb21wb25lbnQuIE5vdGhpbmcgaGVyZSwNCj4gbm9yIGlu
IHRoZSBiaW5kaW5nIHBhdGNoLCBleHBsYWlucyB0aGF0Lg0KPiANCj4gPg0KPiBCZXN0IHJlZ2Fy
ZHMsDQo+IEtyenlzenRvZg0KQWN0dWFsbHkgaXQgaXMgQ1BVIENvcmUgcmVsYXRlZCBkdHMgbm9k
ZXMsIHNvIEkgcHV0IGl0IGluIFNvQy4NCkppYWZlaS4NCg==
