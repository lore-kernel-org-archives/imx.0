Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011063.outbound.protection.outlook.com [40.107.130.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1D1372B2F
	for <imx@lists.linux.dev>; Tue, 13 Oct 2026 02:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791856886; cv=fail; b=kT730MxtcyEJqeFY/lNPOyrAgFOghNLpmk3bUw4BcXMrI6smCKYZctfKqE7QpuFhdVudoc2czgnfkoE1ZY/bTwLD6Cu9Xc3JPH5bpF9YFZ8VGLhgjd+1EqCowEIoBRhkI4U1eyRwFmqMzwHAask1W5W2nNSzZeP2nxTO38H/88w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791856886; c=relaxed/simple;
	bh=UAoQnitJCxgMsMLOVsfJUHQH5XajZB/7FK0o7FBCggE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SinAaUcvnxzC6LEgMaQ1yOazPcEcXr/dv8Z//8MN6LnBv5r6ZdSbA5lN3KSFk9UoLwk08V/zBMKn2kRTuJqyM6POpcsGVPtzGK4C5VIYnPauJul8yWxS9fL7oUZc+yx7zdnlZnvO21waS8JqiqF3279ohlM0InCjTV9YVxLGpqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nwb23pQR; arc=fail smtp.client-ip=40.107.130.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nwb23pQR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJ4EF5Fd1o02/Q46rsiTVfDe4KHsIAoBzlaA/cgD3loRx9Xi4DYHUNOLT4kTQU3Cz2SycG2aZN4Xo77Jl6uWrZc/gfMQ+5Hh3lToT+uRNcnzBYuoyKPOPyTLTDbQfTmwjraCQgbYCDHsTKyh7O2jAoUyhdUL/6qFZJhKNAOpiPS6bp1tOOVAcYAmONp4w0SRcmPi4W6GoIVwz3wBPI4n+OvOaerSzLuFk+RoR2F4M7uGV9/+JCdL774dX8reeCjPyq8uWN+IJWVFoLN42iID1pQYwY4Gc2cmqlAuea27XcoG0XNTe6q3hAzSgyvx2L0CuOwHGjNzQ6Mf67ot/O9goQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAoQnitJCxgMsMLOVsfJUHQH5XajZB/7FK0o7FBCggE=;
 b=xcM9YZUUw3hP226QHVi2jxfzM/lsiduAmw0fNr5TVBA6rJ2o0izFuDDZSj7Bf/rP4MBGdL50VwRJ4INerD3ZQddk5hxKt1ASEG7Cw//clbtwZxy5rTzNlywpLioZ8XT+BTVecaBLSgXbGDBQ/TvTq3sjcVviYrbmhMr4cme+GXwKHTLEoUKztZ8d+P0ltEIrYS280qOSo3VRbk64Upw6IVbpjaqkbJFhKFa5cRNUSRbHky5cDwWmN039le0/O0UBVC0YNWxukmhGInLGDftPsOsBsynh9l2hIqfsg/NZev05CCjbEttyiEaTufm8Ip41UhjTrnjbbdb5k0oFLiLRcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UAoQnitJCxgMsMLOVsfJUHQH5XajZB/7FK0o7FBCggE=;
 b=nwb23pQREtNm2aprs4eMSgQciIVtwAvLEwvw3/t8sowitJoBjH0n0e1NXreHFDnHnNfm/z2lbIi5HZvHB4aUN9tp5GRU2vw5OmTpZ8NIvBVecstpdpS+ETjPQkJ7FtNgNaW+va0YImSqbhF/zlI413VjDgyd0HxDUvU4EC9KI491GYXw9glZj67fgGEJUe11GDFYHr1stDTZei7aCWWp0qxHnPjU4UR/yRQV2gwBtG0kZsgE9Prnnzs+fdPF4VY6Zg9bs7IVWZPjvhTuyOPGAhekVX0j804npD8WP/3RXD1WNoUXi7MjEtpUA9ue8YZAMgfWzZqcxmkWcbppYa7N2A==
Received: from DB9PR04MB9791.eurprd04.prod.outlook.com (2603:10a6:10:4ce::9)
 by BR2PPF09C897791.eurprd04.prod.outlook.com (2603:10a6:2d0::c4) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 02:01:22 +0000
Received: from DB9PR04MB9791.eurprd04.prod.outlook.com
 ([fe80::806a:199b:49ec:b4f3]) by DB9PR04MB9791.eurprd04.prod.outlook.com
 ([fe80::806a:199b:49ec:b4f3%6]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 02:01:22 +0000
From: Ming Qian <ming.qian@nxp.com>
To: Avi Weiss <thnkslprpt@gmail.com>, Mirela Rabulea <mirela.rabulea@nxp.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: Hans Verkuil <hverkuil@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [EXT] [PATCH] media: imx-jpeg: propagate encoder command errors
Thread-Topic: [EXT] [PATCH] media: imx-jpeg: propagate encoder command errors
Thread-Index: AQHdWlSdykNW/J2hB0ybwJxDne3UJrb6uGbA
Date: Tue, 13 Oct 2026 02:01:21 +0000
Message-ID:
 <DB9PR04MB979186D592F056313CE59920E79E2@DB9PR04MB9791.eurprd04.prod.outlook.com>
References: <20261012141824.497906-1-thnkslprpt@gmail.com>
In-Reply-To: <20261012141824.497906-1-thnkslprpt@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-10-13T01:59:49.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB9791:EE_|BR2PPF09C897791:EE_
x-ms-office365-filtering-correlation-id: d0e3528f-ec42-4468-35e8-08df28cde123
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|19092799006|38070700021|56012099006|260925021311599003|260925022911599003|260925021911599003|11063799006|261009223027099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 Zzpd4Pba4NMoJEzgmmgAKEFFh2q5v08qtMAfiZzwOIcJh4uREAaulJPLrvZf7oQND1FxVY3J+WG3xxxODR1o8VKgNoohNmQyV7FGJ5yj+AUl9BZrgXq3mvo7xlhmm12L1l8pLQG3CiG/knH2okpXiUnfa9q7CyM6z8qwdiZyBXQS4o4SE8zAW7Q7hB9W6jShtPOiSF9J3SzcTwgsgyiX0u5z4SKKSJ4OMshhzOziOm0pDBxyHOFWiXATbz/26wdo1Dn7IL0fNAcgYoEHCMCpDGNCSjxWRPb6X8pKRO6V+QookcTO8/ody/omPivDKa83c2W7igojcWBh+5lNSEBX0KJR6E2gXTY6UNg4NdFS2tOTrawGU7YG3DtAYN9ZxE9sSi0m+YysLwuICRsGN0TnypEW1zMkb2MfvtMJxpdTLPe55wxqK6+PXyIJkkFIF/Gi2rIR0syEudtZoakTIqwf4mspMvR3Ywq2m3gMcdXFqu/rRZvgVsi/mi3sQX+enuTQEqPS+dXRwGZ460ouzoM+5qI7bNocRKSzjLr9TCrSB841+yxFs4rGSmJYVEUM8jZhZ7vCmKoavAHN9kVXbQe5GCdZeqHxH1KDbuAa91wv+qoBi2eay7CvpsAS8+Ifq+pCiDqqpiD6Rn+5xAhw69FY2WMYD4d6ayZDrG1PzME2xJXLyjVpekb3stifsKFNsZmMmX4fZFpAjJpJirL+pZMOMhmg240b3EzkmFR2vTDCEvg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(19092799006)(38070700021)(56012099006)(260925021311599003)(260925022911599003)(260925021911599003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?alpvTWdydHlVcTFheUdOM01qc290bzlhQU5PM3lCOEpMRGVCeFNBYVhkTkg5?=
 =?utf-8?B?NGt2bDRJb0owZkNxSDNXMkM4SDRXSW9wamw1RGN6ZnJENjcxWXZKb3djZ0x6?=
 =?utf-8?B?elEyLzlSMUZzL0hyWS9DN29XdEVFQVNjQUI5ZUlDK1hiU3lBWGFwTVNUNzY4?=
 =?utf-8?B?WkF4UjF5aXdKc09UMWJDUmVvT2xFeGc3dXBTTjAxSHh1cTcyelFqZE1kN1k5?=
 =?utf-8?B?N3BPSzdBNGNuUWtYdnZyVUhXZS9FK3VWdzlZU21lV2hUblh3OUNFcko2cjVl?=
 =?utf-8?B?Rnlmb2JWUnFicUN1ZS9qcE9WMXcydGpidVpNZFBCOHdqY2FCZ3lqQ3JneEFn?=
 =?utf-8?B?djJBQzhqNjNycllFalZ6a1diU09lTDlLZ0ErUEVTUGhtdU40WXFxQWVYbnEx?=
 =?utf-8?B?RENNVEtGN1RRR1pnMWNYa0J5dlpPYXdxVk42UXg2VDhNRmdkUmM2UysrSXNy?=
 =?utf-8?B?VVNBbDhmVFRzUVFmTWdPNnZ5dURxZngxTWtldWM2RnJ0ZUowc1BkdlFmalI5?=
 =?utf-8?B?cXpFaGt4WjNldTczeTRZcmhFYnQrdnhaT0dzbDRqQmpLN1NTZm9hNHZzbWZK?=
 =?utf-8?B?YzhWYUZISU44UWtlTmJ5RGFCK2l5TFU3ZklESHVYWDNhOHk4NGwwTGdTVTBk?=
 =?utf-8?B?WkJhS05sYXN6b0czOXRuODFFOHhKT05wSWVWemd5dmdoRGJ1cDJWcTNHUlVL?=
 =?utf-8?B?bFpmWEMyaENMbTFyWlhBZ1ZvN21WWEtFYko1dldmZG5jcytaUUpFcEI1c1JQ?=
 =?utf-8?B?dlVxS0VwOUlFRnFMUG1COEdrUG9aVE5uSnN5aTBvVGJtMkRxOVNhemk1Nzdj?=
 =?utf-8?B?LytIcDd5R3BuZ0syQngzSFV0MlBJZFNxMUhEOVhjYThtSytubGd5RFY2Q1o0?=
 =?utf-8?B?NmNvT0dtZmZoelRLbEl3Z0pic2VEZmtvOXNIWitQUWtiWnN1Nkwwdmh2bXkv?=
 =?utf-8?B?UlhaU1M3RmFoN2hqLzRoZ3ZYcE5paFdQRkxjRTRJbGJZRW5pMFc1MnlIOTc2?=
 =?utf-8?B?bWxzSWI0M1YwYWU1bUZ3dTNjM043V1Z4ZGVKQXpMUWxWUjNCV3NTcUtJS3BD?=
 =?utf-8?B?c24rV0I1NW95VisxS0ZyNzFWRUpacUFhd1RWRU02VEpHTWJFOXRMWDVoZm9x?=
 =?utf-8?B?eENHR1FML2gyZFVMKzNtZlR2OFN3OTg5Q2VRbTRsajhkYnpPUkdPU2Y2MWJH?=
 =?utf-8?B?Y01KNWdtRCtuamRpNjRpTVdoMWMwSkxwblFRakVTWDYzTVQ5SkNDdEt6bWc5?=
 =?utf-8?B?MEV6bDRyUGFqNDQ2NklEV3IxUDN4SEIwV0ZnZlNPMUEvZWVPOTB0S2txZFAv?=
 =?utf-8?B?am91OEVObnZNcFFkYUVxT3B0UGNqc1BWT3UzQXFLaGc4Rk5sQzF4bENER1Jv?=
 =?utf-8?B?SVluaEgrNGw1dnc4SlVIQXl1ZDZWSmlYU2dqWVJUbWhmbzE1R3JmSnFJeEtx?=
 =?utf-8?B?OExDdHZDL3Nhd1h0M1VwV3YyNkhrTHZocEwraE5FUksvR1hpQjZZampjZFJK?=
 =?utf-8?B?b2Y3c3RVcWpPaWtWa2FYVFczemJXZ3RDVG01STZ5bDhsamk0VnppWlJSSTVp?=
 =?utf-8?B?TEFUSHF5dzBUNkdpdlJGRURFVDFMZWlWTnRnaTdBNTZsWnpmQ0dqUHRHdnVD?=
 =?utf-8?B?Vk5pWEdRaXQxUEJrKzJVaDVTczAyeDdTNzR4cEFTQkJhMHZRZld2M0E2V2hj?=
 =?utf-8?B?TVFVYWtORFJmMEZVUGt5UERKSkFEZmxkc2liMTZEd1ZvNDZZZWM3SGhqTTRJ?=
 =?utf-8?B?VjBZOWdHNGRJVDh2L1lrMmRzOFJmTG5DM25RUHhaaGRMWkR4OHdoNEF3UVVO?=
 =?utf-8?B?eE9ySDNrbTQzVm9LTzFiNDRvRlIvRUhUUFY4alhBOVNBM1BLQXlQTHRFYXhE?=
 =?utf-8?B?NUpmaDhFVFErdlo2MHJhb3dXT2ZqUXhGbzRXSnFmamxwU0prMldLZFFuK0pP?=
 =?utf-8?B?WlBtTERZamw4cTJXbW9MZ3d2bGtsNG9wUjNha3k3VmlJL2lBd1gzZGRSQmw1?=
 =?utf-8?B?UElsK25mL1pJaS9nUERsYjlMdkk1TlJhb1JHeDhLU1pacFpXTHBDbnlLaENk?=
 =?utf-8?B?Y01pS0w0Y3pTZkZyRmpOTlc0bTYwVVZjbi91Q1VQbVdjN2lXQnBsblhZMVQr?=
 =?utf-8?B?QU1JcVJDT0pvQVpmNXR5YUV1ZnZEaFFLVUhFT2xxbGR6RnBicG5vU25IRnZw?=
 =?utf-8?B?cVk3VFY0aHhLTzVpU0hKdmZGQmx5bUQ0S2lkekQyaEJZc2ZwaTI5aGxGOXVR?=
 =?utf-8?B?Y25ZY2JIL0xDQisyNHhvSk5BTldaVDcxT0ZhY284bVBnZm1BT0xuSnVzSkZy?=
 =?utf-8?Q?nwWpjmf5wtnSz4fmpT?=
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
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e3528f-ec42-4468-35e8-08df28cde123
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 02:01:22.0290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OIDi93csPNQgxvOuaaz6qAl5AwxmVEa8uDLYFYLg6nZAUvSGTxeSVwnNtBAuGtCap9IKEfuuZdbXTg3EFd7Y3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PPF09C897791

DQoNCg0KTlhQIENvbmZpZGVudGlhbA0KPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJv
bTogQXZpIFdlaXNzIDx0aG5rc2xwcnB0QGdtYWlsLmNvbT4NCj5TZW50OiBNb25kYXksIE9jdG9i
ZXIgMTIsIDIwMjYgMTA6MTggUE0NCj5UbzogTWlyZWxhIFJhYnVsZWEgPG1pcmVsYS5yYWJ1bGVh
QG54cC5jb20+OyBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcNCj5DYzogTWluZyBRaWFuIDxt
aW5nLnFpYW5AbnhwLmNvbT47IEhhbnMgVmVya3VpbCA8aHZlcmt1aWxAa2VybmVsLm9yZz47DQo+
TWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiQGtlcm5lbC5vcmc+OyBpbXhAbGlzdHMubGlu
dXguZGV2OyBBdmkNCj5XZWlzcyA8dGhua3NscHJwdEBnbWFpbC5jb20+DQo+U3ViamVjdDogW0VY
VF0gW1BBVENIXSBtZWRpYTogaW14LWpwZWc6IHByb3BhZ2F0ZSBlbmNvZGVyIGNvbW1hbmQgZXJy
b3JzDQo+DQo+W1lvdSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSB0aG5rc2xwcnB0QGdtYWls
LmNvbS4gTGVhcm4gd2h5IHRoaXMgaXMNCj5pbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVh
cm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4NCj5DYXV0aW9uOiBUaGlzIGlzIGFuIGV4
dGVybmFsIGVtYWlsLiBQbGVhc2UgdGFrZSBjYXJlIHdoZW4gY2xpY2tpbmcgbGlua3Mgb3INCj5v
cGVuaW5nIGF0dGFjaG1lbnRzLiBXaGVuIGluIGRvdWJ0LCByZXBvcnQgdGhlIG1lc3NhZ2UgdXNp
bmcgdGhlICdSZXBvcnQNCj50aGlzIGVtYWlsJyBidXR0b24NCj4NCj4NCj5teGNfanBlZ19lbmNv
ZGVyX2NtZCgpIHJldHVybnMgc3VjY2VzcyB3aGVuDQo+djRsMl9tMm1faW9jdGxfZW5jb2Rlcl9j
bWQoKSBmYWlscy4gV2hlbiBhbiBlbmNvZGVyIGNvbW1hbmQgaXMgaXNzdWVkDQo+d2hpbGUgdGhl
IG1lbTJtZW0gY29udGV4dCBpcyBkcmFpbmluZywgdGhlIGhlbHBlciByZXR1cm5zIC1FQlVTWSwg
YnV0DQo+dXNlcnNwYWNlIHNlZXMgc3VjY2Vzcy4NCj4NCj5SZXR1cm4gdGhlIGhlbHBlciBlcnJv
ciwgYXMgbXhjX2pwZWdfZGVjb2Rlcl9jbWQoKSBhbHJlYWR5IGRvZXMuDQo+Tm8gb2J2aW91cyBy
ZWFzb24gdG8gY2xvYmJlciB0aGUgZXJyb3IgaGVyZS4NCj4NCj5GaXhlczogNDkxMWM1YWNmOTM1
ICgibWVkaWE6IGlteC1qcGVnOiBJbXBsZW1lbnQgZHJhaW4gdXNpbmcgdjRsMi1tZW0ybWVtDQo+
aGVscGVycyIpDQo+U2lnbmVkLW9mZi1ieTogQXZpIFdlaXNzIDx0aG5rc2xwcnB0QGdtYWlsLmNv
bT4NCg0KUmV2aWV3ZWQtYnk6IE1pbmcgUWlhbiA8bWluZy5xaWFuQG9zcy5ueHAuY29tPg0KDQo+
LS0tDQo+IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteC1qcGVnL214Yy1qcGVnLmMgfCAy
ICstDQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPg0K
PmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXgtanBlZy9teGMtanBl
Zy5jDQo+Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXgtanBlZy9teGMtanBlZy5jDQo+
aW5kZXggZTE3MDg1OTM1NDM1Li41ZTQ2NmVhNjVhOTIgMTAwNjQ0DQo+LS0tIGEvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9ueHAvaW14LWpwZWcvbXhjLWpwZWcuYw0KPisrKyBiL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbnhwL2lteC1qcGVnL214Yy1qcGVnLmMNCj5AQCAtMTcyNiw3ICsxNzI2LDcg
QEAgc3RhdGljIGludCBteGNfanBlZ19lbmNvZGVyX2NtZChzdHJ1Y3QgZmlsZSAqZmlsZSwNCj52
b2lkICpwcml2LA0KPiAgICAgICAgcmV0ID0gdjRsMl9tMm1faW9jdGxfZW5jb2Rlcl9jbWQoZmls
ZSwgZmgsIGNtZCk7DQo+ICAgICAgICBzcGluX3VubG9ja19pcnFyZXN0b3JlKCZjdHgtPm14Y19q
cGVnLT5od19sb2NrLCBmbGFncyk7DQo+ICAgICAgICBpZiAocmV0IDwgMCkNCj4tICAgICAgICAg
ICAgICAgcmV0dXJuIDA7DQo+KyAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+DQo+ICAgICAg
ICBpZiAoY21kLT5jbWQgPT0gVjRMMl9FTkNfQ01EX1NUT1AgJiYNCj4gICAgICAgICAgICB2NGwy
X20ybV9oYXNfc3RvcHBlZChmaC0+bTJtX2N0eCkpDQo+DQo+YmFzZS1jb21taXQ6IGQ3ZTdiY2E3
MTY5ODczYjQ2ZTg1N2MwMjVjMTBmMzMzNmMxMjU4ZDgNCj4tLQ0KPjIuNDMuMA0KDQo=
