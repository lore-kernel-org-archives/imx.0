Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013071.outbound.protection.outlook.com [52.101.83.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE18F28853A
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 07:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773043159; cv=fail; b=aTaOR4q8jWlNwNMJM7v1/EzchTOwPhmfZWkCuYkxbwN2QV72VgBu2HbsnlYJ7/64wdlJX1RU78uN2ald7pCyz+UTXHSBeVxBzAh8C3maGAfNwT2q9ywWF4yTSLwtS+46cdATnmwIUqslWcocy+tNGm8g+5csK5kumMrRU6VKNwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773043159; c=relaxed/simple;
	bh=Xnch59qUBE8BqPvzziFJd0/ZgiiPy61TLBGUazj1dyQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B5YdOSg9YzqLBdmamHmJADKYbGd+jqvvJ9CZOYyTxl9v3JKHlZlrUgVYTXVJ6zu+4d4C6y0HfhY8ZI9lLXfgztvuzc0PAqDiXfzerQBxpkcsC8P0Scn/5CpsTEbQXoj76rBjfgZGQgVqA3rhkH9sWZsqQL7vesx7KrEX3d/usks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jhS/RyZb; arc=fail smtp.client-ip=52.101.83.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jhS/RyZb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrQ73zqHY4FnHMVwlgG+mv0W4pik7I21L57YobW+vKy7RadnVT7sPMyvkGLGde2qFtjtcBLO3vCchVwg61i6j3cTYg96QnarntcN8kpIU60GTxnuVvrINrDrXu0odRNYTcPhPzgXmqPcYABsTZaDXrxT7g+XvA8DnBwD7/BLX+3gw1HOlF7CABHDMjarP9seHEAd6o+JZDAO2jQnz4sgDq8OBJVk87hTVQ/3Bx0SQE5xiJiEBrHEY+XIdXNXK6NG0ub2mniaW/x9s6PwSOU9f4WzRVamxgEvvnA5UPF+h14jLNpaZeO9wT5GliI5+wbQ57ZTSWs6jUGFcGYNTqjdSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xnch59qUBE8BqPvzziFJd0/ZgiiPy61TLBGUazj1dyQ=;
 b=Q2i95i81Tt5vF+65dlpo7wWO3+J3Kv3OAK4RG/L6SvriG60BR8qZYLmhXfNxEowBqFlZOmG9GAMQ+8Lm1PeWnFo8HzCKTmGLUtWTPK0bkvVBH8VIWTaRWujoh3BnKD23QGbL2p9Q+EB6nvSP2eD/Wlb1Mc+R8mttJbwqS52ssYWqdnKnGr3k/biEVJsF3gmvCoOP0VLSVnVJKw+/1UbpRAmeX89HMNjzrbK7xezHRsNdYRx47xXNcpHjGopLBbb51AA14oXSUQ+o+MKlMGSbOiI1gdkwrXiufBWfI+ZeOtul2OdX4H/1hbbb75AYngzKvwEIcX+7groLM+oTAkrKcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xnch59qUBE8BqPvzziFJd0/ZgiiPy61TLBGUazj1dyQ=;
 b=jhS/RyZbI6/8nlUYc6kcmKPzJU9qdLv9HOq6uHsyiiejJmVe+acLnydJ0IyjOTIC+dlQX4z6nFB6qT+GUS/rLRe9af/Ma3qQIPbJQYVihT38goII2S6Ti6Y0pazfPq5J+ew6Ft5VqBNGan5jGg2qoBL+FX8HH+5Ge8VraFi/JsfrKPo+/5pbmlWw1Lqv2puqC+9pPehnViNvIAXT0J+m+Bp7ef7tWvW/9sXfCAHjmSaL0vwFTqxvZk7PfieTtYvdZiXtmzL4HiDbcAfV5RmAeG+cDlwU62IubFvRWpurd4ehPUzh3tV2alaM6WKPZYfL0ES8FXVV1nIg5EJYmJCqGA==
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com (2603:10a6:20b:42c::19)
 by AS8PR04MB7942.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Mon, 9 Mar
 2026 07:59:13 +0000
Received: from AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86]) by AS8PR04MB8833.eurprd04.prod.outlook.com
 ([fe80::209c:44e4:a205:8e86%3]) with mapi id 15.20.9678.024; Mon, 9 Mar 2026
 07:59:13 +0000
From: Hongxing Zhu <hongxing.zhu@nxp.com>
To: Frank Li <frank.li@nxp.com>, Sherry Sun <sherry.sun@nxp.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 0/3] Add i.MX943 PCIe supports
Thread-Topic: [PATCH v2 0/3] Add i.MX943 PCIe supports
Thread-Index: AQHcmYjr1fUptLG7ykuDuH9U5UEg4rWbkXeAgABEFgCACiwzwA==
Date: Mon, 9 Mar 2026 07:59:12 +0000
Message-ID:
 <AS8PR04MB8833DD161CBB7A5B82E34F7C8C79A@AS8PR04MB8833.eurprd04.prod.outlook.com>
References: <20260209055745.1545129-1-hongxing.zhu@nxp.com>
 <177246919562.2086883.17926195087426226216.b4-ty@nxp.com>
 <aaX06NS_XpPYYHlc@lizhi-Precision-Tower-5810>
In-Reply-To: <aaX06NS_XpPYYHlc@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8833:EE_|AS8PR04MB7942:EE_
x-ms-office365-filtering-correlation-id: 1ce69ae4-800d-43af-c149-08de7db1c06f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|376014|7416014|366016|1800799024|7053199007|38070700021;
x-microsoft-antispam-message-info:
 RIDVy+Bddf5QVmg/SH8bwBIgvFECuDgd2IgoOsNCDTZKPNrFxrKWh2quCADL4zUd4CzDgAsYi/AVLriAyrFZSv3Wpsy3Cau/+25ZwIy7qbH2t6Ozn8AWH8eIFc/6KgHICj/ZzNRv4bW6nTBSb2yi/8VJnLTlqKK1vkEM6Z9N6nLZdJ6qZnoC9hpnRJRYiI9Wxmk0IMzX/D3dCv6dYtoK/+HN0cAZctz9SSK4jeK404ZP5fFXgBAxJ5mrBtl0DA0L2/LPqp4XM72mUsa0krNctrr8G/qi4+vtZ84eyRKPPM+V9BW2p1fl0k6XPmu3Pj5oW8VCaAd/0hYRsuiP+4czxJR2N6TKUu1hVkv+4lUy4ehFFIMmFN9nyuszjKLr/ytUV0mKOCi2T9KMeppPDT+HiA4lus3WrIQx+IMzgbrluBz3EuwsaSkMrHolwlTzrdjIecGFhxU0aDvGTQNKHPF797E5nC+X8LpFwovd/FdGyEyv5yQciZMPws0+2n6/I8wjjm4TuclNeypa1IwWuYg+yLSvc46a2AIM5H8yA23x0V1Un1hriTfxodfucw7zWY41oQHPXpKKx6pZxUFM5DuCYWmLpjWOg66oNQ6NKDic3idxoesU8S81mIw6aRCNnb6hQpJwqfqaNkRaPHFFQDT84d6A70D4EujH1JsfcQhAyacYSy55CIlr3CK07XkumUrks8H3a22GBpxSv/BlM1XU+EC3il3kVhmPYi/LslYrfqeaf1wE+r+xdzPVcrUuVGqs
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8833.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(366016)(1800799024)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?cXVxTDU4QXovR1M3T0VEeUkxMldscy9mdkc1WHcxSWUwREsvMm5IZWl0VlRH?=
 =?gb2312?B?Y0JaREY0RnNaUElCWlVIaGlqb3k2dHRTSUw1d0VFRDQ1dUJTQ203SGdMZ3Z5?=
 =?gb2312?B?ZzhuL0hiTUhLL3ZZbWQ2bC9mSGtyTHVDa1BKRXV0Yk8zeGJOKy85SDdXbzZv?=
 =?gb2312?B?Y3c0aUtjWTlLTTAzNHVSdXFPbUxDR1ZxQlZVNzMwR3R2Q2RSSWZTeWpnZVVm?=
 =?gb2312?B?VFdISUpjQnFna2krZ202bnRLK3hYZ3I5UE5nc1R6WGg5SWdzazA0VFNnRGY2?=
 =?gb2312?B?bFdMMDZ3YUc5bUJobXRSVFlFdWlvTk1mQWFveUtDZ2lGZkRCczRLZmM4OXNS?=
 =?gb2312?B?Y1hNZWhYdUVqUi9VYzkwTldySU5wTFFSdGJxWmZES0hXMU1od3M2blJwclRI?=
 =?gb2312?B?NGRuQVYrNGUxQmFScnlnc1BtdHRDZU9nSk5icnVDWW81eDdFNW1seE8wMDNU?=
 =?gb2312?B?bS9IR3l4S3d3WlBHUitUODdsbGxUYlpldjhwS2VhcXMxL1I2V25IWnRrMFlx?=
 =?gb2312?B?SWVVemVzL2V6djlDMUthMkw5aEdvYUNiS0FBWDlVaHY1VDFwL2xFb1FxZ0tv?=
 =?gb2312?B?dmljZjdSS2dnTUVLUkcrZ3JEMjhVYlR5WVZVQnpISnZpYVlIUE1sekg2bnBF?=
 =?gb2312?B?KzNDZzlpREs5NnNqOEFnR2QxVXdLUFE4czVVL2gyQ0JxQkFRVnJmdkh3VU9I?=
 =?gb2312?B?VEw0WVpyMjFZbzhFMTk3L3dKazExRFdXQXVyTWIreTQ5VUpzdm5SNzlwS0gy?=
 =?gb2312?B?OGwzd09XMGNOcjJuWFhCTU9VS2JsMC85V3o2SE8vQzRwYkRnVUl5Y0dnSmcx?=
 =?gb2312?B?OWJYdGM1MkIzdG1CNlhlYVRtaVd0TXF4SFB6OUpRc2lkVjEyR2ZJMEhwcnZ2?=
 =?gb2312?B?bHA5VGF6c096Yk5CUjZHQVQ0MllRZXh3Zk1vakFaTGUxblBydWo5dDBvUmw0?=
 =?gb2312?B?S3ZuZWpxbytLZUQ3bk1HZHV5SzZHcmcvcXlwMUtzcUJ6cUFBWStwSXBOSmJu?=
 =?gb2312?B?V3c3V2hvelFNVUJvSFlPT1J0Mi9GZ05hQjE1YndQOFpLeVRYbi9OU0JQck13?=
 =?gb2312?B?c0FIdHc0a0RoU0txSERHNTd3cS9YemRFeDlDcmpoUFdKWlY1Ni9nTmVITnNt?=
 =?gb2312?B?clRRaTQ0cnJGVnIrcy9HVENHYXZrTms2RzVTaDBhUHFaTSt4UGVSOWtkZUJW?=
 =?gb2312?B?SGlIdlEyVUR3eVZsVGZkRmZTdU1LelpwRytpUGwrL1V2UDhyWjF0b2VhaDQ5?=
 =?gb2312?B?UHhaaTBoRlhncVJKZ3VQOEJQMlh6Nmxja2JGV3lRM0dEcmEyYm40VFhtTGJK?=
 =?gb2312?B?b0ZISU9OYnI1SjZocGZCYk1FUVNPdjVTTVRVMEt1MFkxK3hQbkRTOTU4T3Y3?=
 =?gb2312?B?dEllZ0toNmtWQStBYWhHOUNYNGwxaTV1RjdKa3d5NTVrdWQ1ci9OKzdsOEZW?=
 =?gb2312?B?RUZKRUNkNTRUamljZlZVTUppdkM1RmRNYTMzajhTTUZST0tVZjFMczI4dGdn?=
 =?gb2312?B?eVgrdUFNS1B2Qnk0ZDJyT2hjSmoyV2g3dlpmYW8yc09nSmtZQ3RpYVo3Um9F?=
 =?gb2312?B?c0lMQ0s5b0R1ZW50YnNHTTZCbW9CM0xYQlBXR1kvZG1JdTlvQzNpQzJiYkwx?=
 =?gb2312?B?K2hxWnJYaFZhSW5lZFlpSTUxckdxSzdWRkFwWVdmekRzcHNDRjdJb0lYS1lF?=
 =?gb2312?B?SWZ3M2YxVEdNOUFEUHd3Mjk0Mjk1MURSSEk5MHhKM2sraVJkNXVyM0FKSUZG?=
 =?gb2312?B?cHhWTi9DT0ZQQjBnSks5V1dTelNDSVZRb3crazN4OUM5d2pGUmhpYzZpR1VR?=
 =?gb2312?B?VVNQNFV1dHBIdSszRW0yb21qWTByZWRaV2FaSXE3SDN3VFJsdHdFSW43a3dp?=
 =?gb2312?B?WHh1a2hUeDRzMG1vQ0FqTkZnOEZVcEIzazZSdkx2YlduS0dpMFMyaXgydkpi?=
 =?gb2312?B?RllId216ZXpJM2Q4eDJ4aW1xbVJEQjZybGVCM3NZOHNjcU1tdWFUV3dJM2ov?=
 =?gb2312?B?NGsyaXlvK1NxOEhzUFVzOFZKcC9RL0NJTjZvMXdNNEExSUM1UnZPTXJDTERv?=
 =?gb2312?B?TDVJSTMvQmx2cmc2QXladkZ3MU1MaXZnSjhpTm5mZFgzcE9pLzJua1F6dTht?=
 =?gb2312?B?QVhFTElhWW5mNkxPc3dWSnl3WmJiWkRyVHBaeUo1RnJIYmVrS29NYnFVMVd6?=
 =?gb2312?B?dEYzTkRGWGNvLzNoSWV4bE52RHg0U3ZyTFB0b3dyR0hrNTBPOHFvNFZwbGh5?=
 =?gb2312?B?UWR4TVlhVHJzaGNLSTdwSWFwT0NaZTI3eE9aVktLRDAyd2JIY05aZnlIQzBL?=
 =?gb2312?Q?qc25qmERQDTzzY//UD?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8833.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ce69ae4-800d-43af-c149-08de7db1c06f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 07:59:12.4086
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8MSthfnbVo0gEt9cfhH3oy0rbdIXGDFdwLPrk9ColACm+DDxLzQEYs+C280Cr6MrDat1o5SOVfQNDbKO3x0CSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7942

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBGcmFuayBMaSA8ZnJhbmsubGlA
bnhwLmNvbT4NCj4gU2VudDogMjAyNsTqM9TCM8jVIDQ6MzcNCj4gVG86IFNoZXJyeSBTdW4gPHNo
ZXJyeS5zdW5AbnhwLmNvbT47IHJvYmhAa2VybmVsLm9yZzsga3J6aytkdEBrZXJuZWwub3JnOw0K
PiBjb25vcitkdEBrZXJuZWwub3JnOyBzaGF3bmd1b0BrZXJuZWwub3JnOyBzLmhhdWVyQHBlbmd1
dHJvbml4LmRlOw0KPiBmZXN0ZXZhbUBnbWFpbC5jb207IEhvbmd4aW5nIFpodSA8aG9uZ3hpbmcu
emh1QG54cC5jb20+DQo+IENjOiBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IGRldmljZXRyZWVAdmdl
ci5rZXJuZWwub3JnOyBpbXhAbGlzdHMubGludXguZGV2Ow0KPiBsaW51eC1hcm0ta2VybmVsQGxp
c3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2MiAwLzNdIEFkZCBpLk1YOTQzIFBDSWUgc3VwcG9ydHMNCj4gDQo+IE9u
IE1vbiwgTWFyIDAyLCAyMDI2IGF0IDExOjMzOjE1QU0gLTA1MDAsIEZyYW5rIExpIHdyb3RlOg0K
PiA+DQo+ID4gT24gTW9uLCAwOSBGZWIgMjAyNiAxMzo1Nzo0MiArMDgwMCwgUmljaGFyZCBaaHUg
d3JvdGU6DQo+ID4gPiBUaGlzIHBhdGNoLXNldCBhZGRzIGkuTVg5NDMgUENJZSBzdXBwb3J0cyBv
biBFVksgYm9hcmQuIFBsZWFzZSBwYXkNCj4gPiA+IGF0dGVudGlvbiB0byB0aGF0IGl0IHJlbGll
cyBvbiB0aGUgcGF0Y2gtc2V0WzFdLCBhbmQgdGhlIFBDSWUxIHBvcnQNCj4gPiA+IG9uIHRoZSBF
VksgYm9hcmQgcmVsaWVzIG9uIHRoZSB7Ml0uDQo+ID4gPg0KPiA+ID4gQm90aCBvZiB0aGVtIGFy
ZSBxdWV1aW5nIHVwIHRvIGJlIGluY2x1ZGVkIGluIHRoZSBjb21pbmcgNi4yMCBrZXJuZWwuDQo+
ID4gPiBbMV0NCj4gPiA+DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2lteC8xNzY2NDkzMzEw
NjYuNTIzNTA2Ljk0NDM4NjQxMTIwNDQ2OTkzNTAuDQo+ID4gPiBiNC10eUBrZXJuZWwub3JnLyBb
Ml0NCj4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2lteC9pbnpnNDZ0YzJmd3NhanhxNHZ6
ZHl1aXE3a3J6eTZ4dGNnMm1qYWllDQo+ID4gPiBuaW56N3pzbWdtQG10ZGpyNHR1ZWdwcS8NCj4g
PiA+DQo+ID4gPiBbLi4uXQ0KPiA+DQo+ID4gQXBwbGllZCwgdGhhbmtzIQ0KPiA+DQo+ID4gWzEv
M10gYXJtNjQ6IGR0czogaW14OTQ6IGFkZCBwY2llMCBhbmQgcGNpZTAtZXAgc3VwcG9ydHMNCj4g
PiAgICAgICAobm8gY29tbWl0IGluZm8pDQo+ID4gWzIvM10gYXJtNjQ6IGR0czogaW14OTQzOiBh
ZGQgcGNpZTEgYW5kIHBjaWUxLWVwIHN1cHBvcnRzDQo+ID4gICAgICAgKG5vIGNvbW1pdCBpbmZv
KQ0KPiA+IFszLzNdIGFybTY0OiBkdHM6IGlteDk0My1ldms6IEFkZCBwY2llWzAsMV0gYW5kIHBj
aWUtZXBbMCwxXSBzdXBwb3J0DQo+ID4gICAgICAgKG5vIGNvbW1pdCBpbmZvKQ0KPiANCj4gU29y
cnksIEkgZHJvcHBlZCB0aGVzZSAzIHBhdGNoIGJlY2F1c2UgdGhlcmUgYXJlIERUQl9DSEVDSyB3
YXJuaW5ncy4gSWYNCj4gdGhlcmUgYXJlIGV4dHJhIGR0X2JpbmRpbmcgZGVwZW5kZW5jZSwgbGV0
IG1lIGtub3cuDQpJdCdzIG15IGJhZC4gU29ycnkgdG8gYnJpbmcgaW5jb252ZW5pZW5jZSB0byB5
b3UuDQpJIHdvdWxkIHNlbmQgdGhlIHYzIHBhdGNoLXNldCBhZnRlciByZXNvbHZpbmcgdGhlIGlz
c3Vlcy4NCg0KQmVzdCBSZWdhcmRzDQpSaWNoYXJkIFpodQ0KPiANCj4gRnJhbmsNCj4gDQo+ID4N
Cj4gPiBCZXN0IHJlZ2FyZHMsDQo+ID4gLS0NCj4gPiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNv
bT4NCj4gPg0K
