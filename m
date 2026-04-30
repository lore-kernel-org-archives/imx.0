Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013071.outbound.protection.outlook.com [52.101.72.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9891E377EA4
	for <imx@lists.linux.dev>; Thu, 30 Apr 2026 06:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777531663; cv=fail; b=hDmDuKA9Wiaz4HkL+A7R4JYJ2nfcmr0M8cDTaYpPjBNp4LmVTW/A88htdPH/KnlpGQXFuG5CJN3NDcB0VR0DVSvZHpQpyp/knFtyiD3d000nyxg8J4tcgzdkvy7RKYLOC29LCT5qWMMmzRiCcHR1fI0peKxT1npxCNoHxabr8Mo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777531663; c=relaxed/simple;
	bh=S8PWZZEm6BJNwQGV7duzvDUNM9BFyNAjAk6Cbj0Jkds=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VcRoHhcuqSEiwDeSY6TMFVXhZ6z+jIV46MO1zwcGjgAJDvHMi6YF/ZXz4pFoyMoVacnr53kqaXw98LjtMRoSHHU/qPf1SLv27EZS/0pVy/xDDYJatdr/dFhrsyIlwuifJJejKgl2mUtTziT1UBuhH9WMn6GnhWV97c92jXqO87s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iGukcsKr; arc=fail smtp.client-ip=52.101.72.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iGukcsKr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cQan4YHbE+M1SdhP/+Oi3IlDk63QtEcYLLnR9wswPS39qFYi1aXKAWYn3sdUNodWnlAAu1vQpF8OQhUyeAYK2F4dclOU6RPnKJiwSaxFv8245hh3AZGCaBShzTmFJfuNt3M6jCfNkg6A6GSNlv+2ccH2T1KyXo/VmXXDethTCPH3xYlMGonQj2pmNhDt7C7zrzNnHlJ6jOD87TR9WGTZea+prm0HGnb+zv7cSn9x/Qt7DIfnlrfiPpEFhl0dzHvX/tjcr3K4gKHrE5YsRWZ4v1ndn3YeiY8dEPAkDefh1jD7ozAQWs+7Z2RZ8QNwY1zfsIXyFtTTiO45PoQetRB9Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8PWZZEm6BJNwQGV7duzvDUNM9BFyNAjAk6Cbj0Jkds=;
 b=X1P0q+Z8N7jQziEa4il3jJL55k2olzZ7Hb9IC1Lce6ae0oOH0v2YRgI1Mi/eB8BqXrxOdLEJQMV4sHGQeIJtBA2rUMKUnC9o8fHOzc77h6jiZNzZK/HbMbdCPZodK98SJyhdSqqcCI6RYr9UkBxRRu1kUqh3t9WaE2gZdSKGDnLLRIRB3gr6OAFmlcT449GfRSIGEpiA+Uen/FmbI7gSiAEYlQwkrGBfgQNBLpe56K6pXLa6HQMNmDzndqnAT6mR7ddM0nMYwio9kYzCETN9kFbJYYfSC8lfcwgcoQidP+KQZ8V4hqny1+KuQgS1BAsDjnu3oSUr32kZbreqwchCYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8PWZZEm6BJNwQGV7duzvDUNM9BFyNAjAk6Cbj0Jkds=;
 b=iGukcsKrTPaGnZFcBGiq+vbSSHf3klvKW3rU9vnZtrt9OdvAYnVeu3cq0bFvRM9gSUAI2RdGvcAIgBpaL6MBKRGeejHUJMSSv8q2igc8r9pa8rgH/0gCOAp3dEHBagvIK0cYl2fpEpcnQ+aTXfZT4BMYCogYUUNvbBH7I9gE1zFLQI4bF2OCSJ5Gd6WgHxOJuMp6lQxaOpkSTvUqErdDpOziVxnAblPmlVwUGyO9SbEw93goIemMq+8d9mt6+QUtP4DQO9uA0wqsK7ob9b02lI0TSCTwmeeYySbch6JrQZPp55KiPBYw5qW4q9beWANl+vdbsF/k0OPCPLMGFT6q+w==
Received: from AM9PR04MB8196.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::12)
 by AM0PR04MB11854.eurprd04.prod.outlook.com (2603:10a6:20b:6fc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 06:47:37 +0000
Received: from AM9PR04MB8196.eurprd04.prod.outlook.com
 ([fe80::fddb:8654:17a2:b4a1]) by AM9PR04MB8196.eurprd04.prod.outlook.com
 ([fe80::fddb:8654:17a2:b4a1%6]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 06:47:37 +0000
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
Subject: RE: [EXT] Re: [PATCH 2/5] drivers: remoteproc: imx: add support for
 Cortex-A Core
Thread-Topic: [EXT] Re: [PATCH 2/5] drivers: remoteproc: imx: add support for
 Cortex-A Core
Thread-Index: AQHc1u4vxO3HEmW+3kuE+V34hm7+drX1n1+AgAGNE8A=
Date: Thu, 30 Apr 2026 06:47:37 +0000
Message-ID:
 <AM9PR04MB81966CA1490D72FC8A67FAF18A352@AM9PR04MB8196.eurprd04.prod.outlook.com>
References: <20260428090819.17761-1-Jiafei.Pan@nxp.com>
 <20260428090819.17761-3-Jiafei.Pan@nxp.com>
 <3ddf533b-e023-4982-8ba0-0963b9d72c5c@kernel.org>
In-Reply-To: <3ddf533b-e023-4982-8ba0-0963b9d72c5c@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8196:EE_|AM0PR04MB11854:EE_
x-ms-office365-filtering-correlation-id: fb88998d-e3e1-4a5f-7a23-08dea6845e23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|10070799003|19092799006|18002099003|56012099003|22082099003|38070700021|921020;
x-microsoft-antispam-message-info:
 dQCJj0BV9t4MfKlgkNiGkc/hqKiUrk/enfeRAyBqGE60ZWNre5Xi/SWM/cZJnjT/8P5TOO1V5hLgpXbRnC253Lu8DwPFVMv5OV3ALBHCILc0/iv8LtmeAOFlcAVL86DRsipV5ldQqn2n2AGtguGP+hToCbBeTMTX+0MvUy4zDiMc8h1+iYtrgkdBZ+kD8ddPKj5MWpUHZ3o8PSKICbpB6XOWJex5L9+EVeDn4P7GCOTm2Fjo2XV/VfApeRHtuMNfk5qOULYU6IqyABKGFJ98/S101FhoXZt2v1HxnGTyRx/roTjcLxsSSSFQDXQ1nZJcxvkN5XJOsYgeIjeUNgvSevMfTYM+ZNuTxI92idQpnJCL9cBVUdm8WsGo6w+FOJeP/s+E6ShA4mhDNI3MfxsCuCftYAfGvYa5wsYSdVg9vnZ0WTN/LqhRKYTX5a8B//7xL7v7hyPUvi61TdHib/xN9BfHBJshSnEFMywcRQjlu3G3Bi0jKw8C+W6QNM4MyCr27wPutogby4PBRKJFtxK7aVv6ZfLu/9dNejPLstMFSzK3DedPSRD4zFWa/J+VjSkbUG72wNwy66xpeqLTYHb/2sLB0nAtRcOsLLqY7W+dh088lemw7SZZPpAwRkRL1JjiO/wbozk7lzph3pt3vWW76W2Z8MhNZn/WUL+6xS+WxRgWjyRhGRn9h6ClaNwoKZt4CO16lRa4MUaJd2tqFQoslleWSxRw9d6jfuVmXCn1lksu/955AS6+Sf8uCQ99r+pNX9kmbGmoqInpuZdBEiUOMaFsKGBjQZkXVUNLpWo2gIyifw/JZKgUuNrbkNgjd0jd
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8196.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003)(19092799006)(18002099003)(56012099003)(22082099003)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RFRyNVRMVng4dS82bXhjNjlVTFNzTkJodWhma1RvdUlmZ3FMMElMaE9IOGEz?=
 =?utf-8?B?a203bGVibk1sMGJRRlR1Qi9BMjJEZFNmZDlESUdBcTMwRy9vT3hxQmFtM1Qy?=
 =?utf-8?B?WkVWSm10NDdadGR4cGk1RjdjWVZsd0JDTkVLTDkzSUg0dTZPS0FmV2hqeHM1?=
 =?utf-8?B?M3FoNVJtYlU5ZkFSNVo5SEZHYWhuc3IvZFAreTY3eGFBc1RLRWgzVnNFaGdU?=
 =?utf-8?B?U01rNnZQVE5FZTdESWVlL0ZBU1lXaHpTU2dZQkVJRitHV1BxYWZaWlJFbFYy?=
 =?utf-8?B?TVRSWGE4Nk1YZDZseTMvcVhKcGZhbEVpWDU4UkpKQ3lIcW9pSDRmQTdDUmw3?=
 =?utf-8?B?by9YWTVmUURrYVZZbUlHNjZnN2g2RWxkV1RpVkVoTVppb0w2aTU2aWJEU2tQ?=
 =?utf-8?B?NCtIYjlrZGxCcXhkeTNCTVp1d1IzRmVJNHlqY2RVcmhZTVpkV2VlcWgzeFV4?=
 =?utf-8?B?dm9qR0pwKytFU3ZTVXJ3a04yZ3FHRDVWeTRxVjVid2dnSGh2aEw2eVM2OGJG?=
 =?utf-8?B?ZXhPV0RrcHFmUm1PcTBxM1EzK1h1UDBOeTgwb0xQU25SQmE1cWNaNHNPbGgx?=
 =?utf-8?B?UkZBcnVPbFhLTWZ5bUdKeFJsUUVFRkJSMUgvUTNvNHI4eXNSaUU2Y2tsaVhV?=
 =?utf-8?B?dklsK3NxQzNtUTZLSnFWTTVESG1QOU1MWGhQNFFwWmNWQ2pIQ2pLWGNzd1pv?=
 =?utf-8?B?emROWk1ia2NpcmtnOE5YaTNBR2VNdWlvaUE1aklxV1F2aVV2b1dXcWVNcThl?=
 =?utf-8?B?QWxzRis1ek0vNjF6MUljbk5ZWmJEaGRNdVlkWlFVMmpCUlZUTXE0Rm9qdkhD?=
 =?utf-8?B?S1lzV3BZVWU3M2ZLZ29wZ3F5ckZMT3NJUG5pZlZZNlFzYkVoTFNGYmtwK3lZ?=
 =?utf-8?B?RlpIbFlrcXg1dzJpTjhDUkdyY0tHSnA0dUd0UVBXaWRPQVdya05TTUNqSWVi?=
 =?utf-8?B?TGEyZDRjL2tRYnY2YjU3MVJ4TTZ2WVJzRUpPSnBKemJXbDcyTXBKSnQ2ZXIx?=
 =?utf-8?B?NzRwVmlpZGJBMmdWZFM1UGc5MWpHRWZFbkFQY21hT0MrSjVmZC9tN3B5Q0hQ?=
 =?utf-8?B?K05kL3ZrZzM1K2hzNzZobmhETHUwWE8zRUhaRE1XV2pnL0l3bHRkbytTMGFU?=
 =?utf-8?B?WEpTaVNSZ2hnbXk0ZlJZZGxxMTc2R3V6akNsN1hBb0ZBMHkyZmFXWklOR0lq?=
 =?utf-8?B?RFFyNEc4Rkl4M0ZvTzV5Rko0cVVId3JoWFZ3d0lrVUxSSUNNYUVFb0FERlo2?=
 =?utf-8?B?emMyUXFIVFpzZHJ4aUNHZ21jem16dUhpVTVqRFpUNWZhVXdnNWUvbEJJRWxO?=
 =?utf-8?B?bEpLTTh1elBNZHpIRUxBNHNMVzdZbFBTT3l3NjhTTXowZ0l1MnhjdDJ3aENI?=
 =?utf-8?B?MXQwakJWNW4xRW9mRFRQUFBYSTVSOFpTYVdLTVgxYXhsbGlXUnNIWG5KMStw?=
 =?utf-8?B?Y3B4Vm96OXZ3RWsxTlc3UzA0ZXBoU2E0dkF4dGdyWTJ0Y2J3RGZFYkErR2wx?=
 =?utf-8?B?Z1F0dCtXV1J4dE1IcWNNVHlUMm9mY0dibi9OTENaQTBRbzhWdzBMN1ZaaDhE?=
 =?utf-8?B?ejZRRmoxcDZMRjNHdmZwWllTM0doNk1lN3BjTFRJZ2hkc0lZYVlJMVNOYml5?=
 =?utf-8?B?U1k5bzM0R25NdGNiWnVYOTVKQ0YzTDVoWG1OcHlvaEtKTVRPYVV3NHMvOVc2?=
 =?utf-8?B?Z3BGeUNKcUJKYmxPcmFTbWlGMkxOZndsMWJKK2Z0djB6eHUvWG9haVp6VTJT?=
 =?utf-8?B?cjhaeEVOSkFUQWhoYjAyM0JhT0t6MHU2c1l0MWcvOHplOHY5M1R3WSt4OGxu?=
 =?utf-8?B?ZGIydEpPeTU0UzBPZURiOGIvbGVjQm8weUppUFVJcWd0SHJlUDBkQnJGZCtx?=
 =?utf-8?B?RHVoS09MQ045VWc5bUFIUENNbDBFY0hvVDk5MDhwVU9WT2hIdytYdC9YZXJI?=
 =?utf-8?B?bVE0TVBMcXhQWnhUeHRPSndiSC9qYlA2YWQ4ZTlxOFFWazhZeGt5bitPWWdB?=
 =?utf-8?B?UHNWRUN0STFmdXhWcW44bWljVkZDRlR2VS9YNU5KdUtNYjV6WTZaaXUwT0Vw?=
 =?utf-8?B?VjJ1TUw1QTJhRHB4VFFIa0UwdVhmNWdqZFFKcjZFRnJDK056cXkrK0JQRFJk?=
 =?utf-8?B?NnpoU29zOVhKNk5ZTWZHeXBSLzJXYllCOUNoSzc5MnFFc2VwT3VsSmRFUEsz?=
 =?utf-8?B?bjZvcG1Td3Z0ZmFUenNtM1lrbXhFY1ZCNEhmMXgzYVcyRUdPK0graG1ZZkd3?=
 =?utf-8?B?anpUYmlpZG95L00vZUNhZU9OYnlBY0hCVDRpdFlwVDlGamZxOUFPZUdpUElj?=
 =?utf-8?B?WEgrc1VSU3VLNnVhaUZzVkVudDV5RVBHVE9VRFI4ems4eGd6QnV5czhwVUMr?=
 =?utf-8?Q?kmgMF1Up5aDAiddffLq/zKkCYa0tWhEiTPPWp?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fb88998d-e3e1-4a5f-7a23-08dea6845e23
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2026 06:47:37.8336
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j3ZhDHh1sFZCwdvBFmDBaW/dqAGQ7ygJ9DGss2Z5jMcyoPNd8F/G13xHxB54slietnJw88hzi7FSkoADm9PcsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11854

PiANCj4gT24gMjgvMDQvMjAyNiAxMTowOCwgSmlhZmVpIFBhbiB3cm90ZToNCj4gPiBBZGQgQ29y
dGV4LUEgQ29yZSByZW1vdGVwcm9jIHN1cHBvcnQsIGl0IHVzZSBQU0NJIGFuZCBTSVAgU01DIGNh
bGwgdG8NCj4gPiBtYW5hZ2UgQ29ydGV4LUEgQ29yZSB0byBiZSBvbiBvciBvZmYuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBKaWFmZWkgUGFuIDxKaWFmZWkuUGFuQG54cC5jb20+DQo+IA0KPiAN
Cj4gV2h5IGRvIHlvdSB1c2Ugc3ViamVjdCBwcmVmaXggImRyaXZlcnM6Ij8NCj4gDQo+IEJlc3Qg
cmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCldpbGwgcmVtb3ZlIGl0LCB0aGFua3MuDQpKaWFmZWku
DQo=
