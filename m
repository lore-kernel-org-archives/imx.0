Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011042.outbound.protection.outlook.com [52.101.70.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A8D3C9886
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 07:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782717690; cv=fail; b=jDuJIxtKfrs6kJ/PWPVC13Arxu8GY0vBdPhljh5tUVYZTC+DaAiSokGUtGtP0D2XH7MC0TUDN/3QjES/Hs0kH13csI8soaQY73ybkcR3tMByWuhXBu32MHa8fvgZZwS6Yw9Ojp1VdpKrfTFpp4Ku9X/ohir0B/o2DrXHWkoDnUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782717690; c=relaxed/simple;
	bh=mANJnP6kOHzcntcNvX6miqQcJ9I5F0sL1VwwPsnlv2I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IAtw908W9YX3gZoolQW5Q+Kc4oDwKaqLy15oDtJZpyR6i2AOXeWp9PCpTQieuyFyzlTOeHlNx6KoNR2JDhU2yCsQRhhZfV8TBBKD80tRil+/BnSFOAzDQPoPTvhMr+XvjEr92CwM7LQ9Nhrj3vsHBOY4lMOsUf12IcZ8MVOYVEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=r0YrWYfx; arc=fail smtp.client-ip=52.101.70.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="r0YrWYfx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0pcd6oYW3KhmutHM7cMCsXh6SJhDgFfjBNyFMPrfhhA+RyuXSXueS+Vedg5WKonbniT7NWZbJ0IIHFiUVgUpw7ky4KHXwybK45dO/kOKel658Y9qfdHTHIgw0GImKMLup/WenQFZh7+8RbSKoi87QHEQJ6gYamr71SZOhRgAbdcimFQB9lIzSttMkYz45DzoabMBYsCiea/FobJsIjYTguJTjclLCJiayHwnN4694vJs/2qyBmzcEA90Jt1Kzxq4jI6sZvQGRShgE9msmjJcgvUDJqWMSDKXyYHTK0L0lSfKKfMzFxHnYlRmGVqB3UKuJVezr1ZvbOnnJMtdZ7+pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mANJnP6kOHzcntcNvX6miqQcJ9I5F0sL1VwwPsnlv2I=;
 b=QQO/gevEZZUdR3xmeFi/DBNR/Xh0cIFdz0kG4wLWcrUWfRs/W6qK/uin8kLwouAwY6QgXgA7IAlewFV/vCpJlNUjegrY6On06cGw+u1SsR+GzQhkdxN8tb1H7Yh+wlT7xJ7kMzKIKeTeM/7vT8+fiDAO2mzSILiEBmH5EIbzaVCXcI5L1oX6KFDlc7c/XnhzkSRJmTeJmu3QospUO94B/hEhKXWrAQanVK4fc5xns8ad883K4ZbHsfsUgBma2sVUs/590x5deiAj9eA1a6E6CZM8RlIkEcG46cde5IB26PgXX1icKTBd9V3+/dlYSBKoa6/sV8MRhk9eZ+q3rnAH1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mANJnP6kOHzcntcNvX6miqQcJ9I5F0sL1VwwPsnlv2I=;
 b=r0YrWYfxtGd2+vMBua5X6oNzDMIi2yVvzxCOJu2ZEuZ+B1iW1CcwhhpEfhXt37uEJwo6M5vfblTAaLnqQPOfiZNYiTPk7Sj5ZSaqKvCs+aFuglEUPrCtQxYa2RhQ0kTxx6htFPCfWJhHB166oB71xGZpgaQjh03q8J8tIwmnHWVDcWihbTHzLjxt4Ap2Fd/bT3+Q94uQrhPhrDiuWp7e/iH12HotXlI/h14ubkmZSLWMtWlRXc1fko4lZ7KQFKj5QKrfhmDOSiG3yWTPiKbX/oiJ7q7gEFArS0mDmwDFhzGmo8G3i3LP1Xl3fTPBj46HgxO8rUU+0HDP5RePpolEfQ==
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com (2603:10a6:501:7f::23)
 by GVXPR04MB10969.eurprd04.prod.outlook.com (2603:10a6:150:221::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 07:21:14 +0000
Received: from MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889]) by MRWPR04MB12330.eurprd04.prod.outlook.com
 ([fe80::ca22:f8c8:6aca:7889%6]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 07:21:12 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Felix Gu <ustc.gu@gmail.com>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] soc: imx8m: fix clock reference leak in
 imx8m_soc_prepare()
Thread-Topic: [PATCH] soc: imx8m: fix clock reference leak in
 imx8m_soc_prepare()
Thread-Index: AQHdBXlaaIjSStSllkesDxC57IFG0rZVJJEw
Date: Mon, 29 Jun 2026 07:21:12 +0000
Message-ID:
 <MRWPR04MB12330BE6893CE9A0F6702ABD188E82@MRWPR04MB12330.eurprd04.prod.outlook.com>
References: <20260626-soc-imx8m-v1-1-62657e3376dc@gmail.com>
In-Reply-To: <20260626-soc-imx8m-v1-1-62657e3376dc@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRWPR04MB12330:EE_|GVXPR04MB10969:EE_
x-ms-office365-filtering-correlation-id: f7872b3d-c86f-4b1d-b300-08ded5aeffe0
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|19092799006|23010399003|1800799024|18002099003|22082099003|38070700021|11063799006|56012099006;
x-microsoft-antispam-message-info:
 wT66/P/GgOy02zVg/aQHKEqB0i8XOn/EKq7pV6zkNlIBdn1IZ4OElwBTaE3NllLP6bTKRbkXPU5hbttRn5XU7MLR0uceghdR1ddDGajc0DIEQqcPhQSnOkNVI5y7+WYVZwzjpkjaXnAjNjVkiM16QdjuByOavzqH3Bpmd7QtikXeOEu6GLmiVaJDKpVLDJhccMCw9RQ9YSs9kmmM0okgStcPkJrPKa0L42qSZ6x3Y/TQm6hwfSpPqjDQcFiSVJJl8Lssg3hLiXiLj0QSjy4PNGBO+XRb0u3vm3wgkUCHfjQ9CCHx7hecJ6qx+0X7tQPL3ZNc6AEFpYYLlEH3ZE2tiKqya+CKedCjxAzVncIppt1FIdjb1mgWQ+5UxGSz9NI549UA2rDlyVX8oiIxL9cEmCNgSU6M2ypSOxDlUn1uJ/PIT5v3d7/jU1ZRlIdMeBWvEaYDisVTz9bhbBtBRtJfpLmCTlTUwIq4MLtsKFDjT2TfMwB8e/BQQ01eknP+UBDkQbpsu6ZmoHUovrKDYisQn21RhGDP06rmWCF7iHbom4zGFNvwMRPNjaMbqD7T/wf277xxrpnaFtbMNnCMDtCm/kpcC4cbnsoAmcAALvqJ51PX0Wh5Jjfr6MYzCvh5wl7yqQ08hkR7gyR5ZYqJFZn2eAQkz2eHYsH22uzN1N2FfrW5Mw4fxXSMWs26n5IbH7lOR4tCcIaA9LljOHrvVyFEQ50e/QCJVnf2TZtp3uyr52A=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12330.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(23010399003)(1800799024)(18002099003)(22082099003)(38070700021)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b1JNeGptbHVlUnk3UEZsemk5MURQV0VlanFvU3k1RWF3SXF3U3FJVkl3QXMx?=
 =?utf-8?B?SVQrYk9MTDNDYmhqWGc3WE16bkxhUVU3bHNSaldBdnMxVVlFYW9jamFhNE9n?=
 =?utf-8?B?NGYyc2VCWE9Qck0rclkrTE1mdjR1ZHJUZVdPVWRKc0hJdjFyUlFyZGIvanFi?=
 =?utf-8?B?d1M2TGZyZnlLRFBhem5JQlFtOXdSSnB1VFpnbzdQbWJnVTRCMEEvQUJ4ZDN5?=
 =?utf-8?B?V1pSSEtCVTFxVmwzVHpmdHlIQ0tXYmtROGUxeW53amdWRXduNTQ5dUdXNHlt?=
 =?utf-8?B?UVAxdzhiSkNSV2VIcXcyZ21KY1dwS29LY0dWZEpjVnVyTlFoRU9OVUhxd2g1?=
 =?utf-8?B?MGpFL0d2RUVITzRqQS9idDB6ZHdWSEdNZjB4V0N5cGo0dFRNK1QrMmxjRGlH?=
 =?utf-8?B?MVNVK1AydDBCK1czcXFoYXRCYm1Kb1VwWlFmaUZKS2dVMUxqazJzNzFPNGlJ?=
 =?utf-8?B?RWNsZEN0dzkySVljNGowUGRPR1FqNFRiVEdGb2dDNi8wMGNpSmU1Wm1vaFRK?=
 =?utf-8?B?d2dpTmQ3MHVjNUlSQ2NnenRoeG43TjQ0S1MwaEJHYytWSFpDSnFMb1ZhbXcr?=
 =?utf-8?B?d1o2b0swVXFtVUpUTEJDTVpvMGFPZGt4eGk5ZWdOMFdMVUZjckN1RHgxZ3Vl?=
 =?utf-8?B?NURBdmpLYTEyN250UWFoVzdtRE4wWi9tT0k1RjJ3UHl2dmMwa0o3NW1ieDRB?=
 =?utf-8?B?SkUyczRrajg1Z0J4SWx5N3daTXNFelVrb0ZqVFdCV2VBL2tSQXNPMUoraWth?=
 =?utf-8?B?STRydFR3OWZyOU43NnFwSWV0alV1cE5nWS9FaWFnU0FsMU9ZMnpiM1JFbngy?=
 =?utf-8?B?YlRoL0thR09CV2hNNm96VzNqSGxkTkVPUUtWczM3VHU1OUZLclBKNU1sQk1Q?=
 =?utf-8?B?NFdJMVBQa3g0ZTRUdmhiVzArTUNDTnFLSDkwOFR6blF0V2Z5QXhwRTBTbCtx?=
 =?utf-8?B?NU1aZW1vTTNVUzBMcVNmMDBYRllKc1l0QktJSUhxS0NhbjZHdnlxbXpnR1dN?=
 =?utf-8?B?MU4wY1lLeUpFYk9jSEdiWUJoRFcrbXJyMDVwRHJHWTU3QUZ2emVKMm1NcXg3?=
 =?utf-8?B?T3VBZ0tGMUZOa24zbVIybUd5Mml1anJ1a3EwOXlsRHlpeUdhZWxla0lyejhW?=
 =?utf-8?B?UVM1c2d4SG1ZVThZajNlUWtJSzZVN3daK1ZYZ2RLbmpvRE5tbzhubVNaU2tJ?=
 =?utf-8?B?NHF4eTJ3ZkFiRXRJQ0xIcW0yZVpCaFprMFQwR2d0R3hja2Q4YWY3L1ljR1ZH?=
 =?utf-8?B?RVNrejRuTUVKSXV0SDFwcHZrcFJNVmhLM2VDNzJBSUE1VWp2Mnd2YzUrK25B?=
 =?utf-8?B?K2ZqWGw3L0RCWW1IdG0vY0RwNDh3dmdteXFZeXVyQi9NaHJBeFVaZHNvNE56?=
 =?utf-8?B?VVFLb0VlQ291Vit5bWVlTW4wcHUwaDB2dTdodk5aSXQ5Z21qT2RzWWxhUDVZ?=
 =?utf-8?B?ak5rSzYwVDhjUHNhaytSSWoxaXhNZzhqRG92d2FSQ3U1U2dGQ0ZGYnJuUDhM?=
 =?utf-8?B?V0xmeDJHb0VkamJoMmQrL2c5MkkyeFVwZUNHWmZZblRVeS8rRkxrbjBOZmhj?=
 =?utf-8?B?RUFSbVhXdzhvRVlHN25IODZFclh4WGRLY2NnUm56Y2plQ0VhUnBsTWM1eXVF?=
 =?utf-8?B?UVFOZDRYeTNzVTNGS3J1cTVRSUVUMmhhYlMreDMvQWw0Q2VybUNuRmY0eGdX?=
 =?utf-8?B?a3p3S1FIOTFWRG5pbERoU3FpTDllVUhOcGhZYUdmQVFCTFd4UUUxaDBRTWMz?=
 =?utf-8?B?Z3pNNVgweElnc2NwQ1pFdEJMZEtROXNvNW5CY0Vka2NnWkV0dEtidnFOVXMz?=
 =?utf-8?B?Q0o2ZldlbTVmbWNqNVpYT0k0UjVkejMvTXowTStjR2hndGRUMHE0eFZPcXZC?=
 =?utf-8?B?V05rcFFvRlkxc041dXZ2RDZMTFNQeWkzNmZvRCtidlVCU0hBSU9GTnA1Rjl6?=
 =?utf-8?B?Ukl3OFBHNlUrV3VISVpGMVNacXpRMzNnQUpudnAwZHFvRVNVcTdIOHEyMk51?=
 =?utf-8?B?UjA5aDgvNjQxNGUrZmF3YXI3OHBJWXUwUXp5UU1oWUc5c0NTVVhsRHFWNk5x?=
 =?utf-8?B?WUc4R2RxdWR2QjhxdDh5UVJ3clV4dFFSS25YZS82WGZud0tpYUdLODcrNFQ4?=
 =?utf-8?B?UVdvNStSeVlOZ1ljUEp3SmVvVHFDeEphVWNzS1lXRk96VjYyUW9MSUV1UHhn?=
 =?utf-8?B?QnhwaW1sKzgyZGtTU0pLM210WGJSdWNwRzVjcXhCZFlYRHB3Z3dwbUFTRjVi?=
 =?utf-8?B?T293YWtQOEFlSDZmYnBOZlZhWklObzhBN1ZwRnJaNEZjZXdOODQrWEViNlpk?=
 =?utf-8?Q?z0JWMoSspetTZP9p38?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12330.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7872b3d-c86f-4b1d-b300-08ded5aeffe0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2026 07:21:12.6537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KYNxqLFztUpY0pqkGpjNc+HcYNRI3ETIVF7ZcDH9VFmnrbTWH73Kgljz6Uw69n2YnQ8zOACFPZ8RM1yNwqtZ0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10969

PiBTdWJqZWN0OiBbUEFUQ0hdIHNvYzogaW14OG06IGZpeCBjbG9jayByZWZlcmVuY2UgbGVhayBp
bg0KPiBpbXg4bV9zb2NfcHJlcGFyZSgpDQo+IA0KPiBXaGVuIGNsa19wcmVwYXJlX2VuYWJsZSgp
IGZhaWxzLCB0aGUgZXJyb3IgcGF0aCBkb2VzIG5vdCByZWxlYXNlIHRoZQ0KPiBjbG9jayByZWZl
cmVuY2Ugb2J0YWluZWQgYnkgb2ZfY2xrX2dldF9ieV9uYW1lKCkuIEFkZCBjbGtfcHV0KCkgdG8N
Cj4gdGhlIGVycm9yIHBhdGggYmVmb3JlIGlvdW5tYXAoKS4NCj4gDQo+IEZpeGVzOiAzOTBjMDEw
NzNmNWQgKCJzb2M6IGlteDhtOiBDbGVhbnVwIHdpdGggYWRkaW5nDQo+IGlteDhtX3NvY19bdW5d
cHJlcGFyZSIpDQo+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEd1IDx1c3RjLmd1QGdtYWlsLmNvbT4N
Cj4gLS0tDQo+ICBkcml2ZXJzL3NvYy9pbXgvc29jLWlteDhtLmMgfCA0ICsrKy0NCj4gIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3NvYy9pbXgvc29jLWlteDhtLmMgYi9kcml2ZXJzL3NvYy9pbXgvc29jLQ0K
PiBpbXg4bS5jIGluZGV4IGZjMDgwZTU2ZjUwZC4uZGUxOTk3MjQzNWY5IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL3NvYy9pbXgvc29jLWlteDhtLmMNCj4gKysrIGIvZHJpdmVycy9zb2MvaW14L3Nv
Yy1pbXg4bS5jDQo+IEBAIC0xNTAsMTAgKzE1MCwxMiBAQCBzdGF0aWMgaW50IGlteDhtX3NvY19w
cmVwYXJlKHN0cnVjdA0KPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsIGNvbnN0IGNoYXIgKm9jb3Rw
X2NvbQ0KPiANCj4gIAlyZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoZHJ2ZGF0YS0+Y2xrKTsNCj4g
IAlpZiAocmV0KQ0KPiAtCQlnb3RvIGVycl9jbGs7DQo+ICsJCWdvdG8gcHV0X2NsazsNCj4gDQo+
ICAJcmV0dXJuIDA7DQo+IA0KPiArcHV0X2NsazoNCj4gKwljbGtfcHV0KGRydmRhdGEtPmNsayk7
DQo+ICBlcnJfY2xrOg0KDQpJdCBzaG91bGQgYmUgc2FmZSB0byBkaXJlY3RseSBwdXQgImNsa19w
dXQiIGhlcmUsIG5vDQpuZWVkIGV4dHJhIGxhYmVsLg0KDQpSZWdhcmRzDQpQZW5nLg0KDQo+ICAJ
aW91bm1hcChkcnZkYXRhLT5vY290cF9iYXNlKTsNCj4gIAlyZXR1cm4gcmV0Ow0KPiANCj4gLS0t
DQo+IGJhc2UtY29tbWl0OiAzMGZmYThkZTU0ZTVjYzgwZDkzZmQyMTFjYTEzNGQxNzY0YTcwMTFm
DQo+IGNoYW5nZS1pZDogMjAyNjA2MjYtc29jLWlteDhtLTkzOGU4OTEwNDA0NA0KPiANCj4gQmVz
dCByZWdhcmRzLA0KPiAtLQ0KPiBGZWxpeCBHdSA8dXN0Yy5ndUBnbWFpbC5jb20+DQoNCg==
