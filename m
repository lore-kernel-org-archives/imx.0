Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011002.outbound.protection.outlook.com [52.101.70.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E243750D5
	for <imx@lists.linux.dev>; Thu, 30 Apr 2026 06:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777530111; cv=fail; b=h4puIHzSim9kYSFpl6XGJNAkQRfqg7u+YKuv0uGA5XG4bEbhEqVlQs48CMT7A9yBQZKI8I2+HMvy+AiX0ShHnV30kPCkgvl9/1aFgmvZwedvsnorQ8bl/J4nIeXZh6da5tHs2Ep1XyfcQiFIaHV435HTk1JedrhO5vW4ZiZwj6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777530111; c=relaxed/simple;
	bh=7EwlGZC5xNFTXUGcF4LrAyTu4iT7cZPYrZvlyfJhKv0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AyvTFv5fK+fyimbrBPS/60+NLVntrO6TeJPnm3g5gFYUOIsOLzrH9t8SYrEscrKFoooJYzYqQ6NyjB2ceNFdGUzNzPNmZETMMKSGXLPq7R3jV13tD76zBwyR5j6nZosWcUWdkE/8p0Kuuj3h41y/YypxUJsqKzP5VG2likZpVZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=c9PSUN8b; arc=fail smtp.client-ip=52.101.70.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="c9PSUN8b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRU5hwpnw33DPc608nIbVpCsomN2dNj9JF6V4PkJ99siogTP3MEViEVykRTyIEcyeZt3FgGN4mjRumuGNlsq7dlIYtMuKcpt6s06+d7ZrNkPPX/G7YMsgTaQa2GaSQwn+9aro9WzP12eLV5BDLMts3fxtb9gkjkN+t+7VWCAu6fWAtNWMPOYrKye0oafpw4Bd1+4UaRrPKq2ERFr8JIHt4GPge8uf9wcfBoXqiF1/9KRtuEptNWOPxbwcNkEDTRX1KYfQ87LF4nT+kQqIFZq3BLihRn92SfzxfVG9LHHlgkyZqgUxuX9lRbEKT2YklZW4oBP7qIS3UxA1y3qyrb+rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7EwlGZC5xNFTXUGcF4LrAyTu4iT7cZPYrZvlyfJhKv0=;
 b=fCGCXK197Mu2elYwTa7+WvHYq2bQgfqsglWztExnO3aoOwwfjzvMbaUpRfjGIZeiRtO5nUqJOCFkH26ZTDo+Jjuxr9D/JUt/2dje85Ko5T2iLXPlY27Rh9QuFHeSPZoWB3ZE/o9HrJ35qWbu09yrv/+pG49A7NzzJiz0Rw057QN9YB4HM8rwE6wNhWP0dSNSKU0vAkrdoh/0KMNzBiiOd3SLakm9UMMKMinwr1auSgojWZuRBQMLmozntSGgTXTLyfpu64CyTtQbM6dPE1l+ZEYB7KGIVy1Ll7MTW7bRE6cddO5jepYtEcTAExEFpGLys8k/p+0aNPQiaKcgBOu58Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7EwlGZC5xNFTXUGcF4LrAyTu4iT7cZPYrZvlyfJhKv0=;
 b=c9PSUN8bmbV1WShnacteo55m43ZUciSpH5SbE8L522NKQJUWYWJpft0dVkT1B5pZBT7vHQq3XjQ5hSPCn49YDPeiyJI1fFkkKqUBt2cNF3ow63ngiW2bydoaSVv0jaFIjcSQoXcPqnYZ87bO/rGQkL42vxhuadpPS9Dmi/RFW2/agD/coGHgkwgjNeN9CGocJHql0L9wxpHKRbmbeJhFDKPyTwOW8KqkTlBIMlVVv30VVprGxt87/A9nGm5eu0VLyJqGF5P0x7ZPI1by2/AkVcMyV6fv6Tg6jM0UPuGw6sLjf1inGeAA3tcztFplvxW5dm6CVeILXciqxo1KLcoo5Q==
Received: from AM9PR04MB8196.eurprd04.prod.outlook.com (2603:10a6:20b:3e9::12)
 by GV2PR04MB12102.eurprd04.prod.outlook.com (2603:10a6:150:30c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 06:21:44 +0000
Received: from AM9PR04MB8196.eurprd04.prod.outlook.com
 ([fe80::fddb:8654:17a2:b4a1]) by AM9PR04MB8196.eurprd04.prod.outlook.com
 ([fe80::fddb:8654:17a2:b4a1%6]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 06:21:44 +0000
From: Jiafei Pan <jiafei.pan@nxp.com>
To: "Daniel Baluta (OSS)" <daniel.baluta@oss.nxp.com>, "andersson@kernel.org"
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
Subject: RE: [PATCH 5/5] remoteproc: imx: use device node name as processor
 name
Thread-Topic: [PATCH 5/5] remoteproc: imx: use device node name as processor
 name
Thread-Index: AQHc1u4zv6UcP0NXfkKqHmqUUgzjPbX0ejIAgAKqfNA=
Date: Thu, 30 Apr 2026 06:21:44 +0000
Message-ID:
 <AM9PR04MB819642AF80277CF6EB28262C8A352@AM9PR04MB8196.eurprd04.prod.outlook.com>
References: <20260428090819.17761-1-Jiafei.Pan@nxp.com>
 <20260428090819.17761-6-Jiafei.Pan@nxp.com>
 <685ed732-fe54-4d2b-b2e9-6bfd10d67b82@oss.nxp.com>
In-Reply-To: <685ed732-fe54-4d2b-b2e9-6bfd10d67b82@oss.nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR04MB8196:EE_|GV2PR04MB12102:EE_
x-ms-office365-filtering-correlation-id: 3f7ef123-f0c5-42c8-14bb-08dea680c030
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|10070799003|1800799024|19092799006|366016|38070700021|921020|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 PMVzonEZ1U4QF88/q8o2gDw8OjTEsWMrP2siqbgKn/1BVfMczFZCdso07tciqZERHIMkDzMi6rOLFjBpM1jLPAS+5C0SnO8mU3egwLxeFt76rollk9WZLmfe10cxpYwR51Zj6wA3UshkBD9uSb5qfDt6KEA0UUtBwY4+VhtqMvdyaCKi5RfhEh7GDzlPxQK0KBKa/XJ2Ie4awsvfajSWvff7i3Yf7DA6ZjSmQSQHAz8usfaHr5qAcw0vXIbr+ZxFoSZY2QUNF/+o8VMkrbX0NiO7nsunDs462rqfrtI3ZhGNN5+hVjhWgR2WfPnsm4FlCPW6fK28z5F/QZO/Ce/edRGFf4G0ELMPmAWEgHhNr9yVzTkSO2LaKcXmosURYeimA2tWCAWvvcGhdz7tvyaNc1ovYEIU4F2vtd+jMgbajv5H6dzkNQGoh+kB6viGeokvKf2aHMzT06AwiYrIVeOJxVqPP3jRNgFjNfYrLNQesWeFSuRMvKUw57w7LAkN+0p7yUUlggo9ec7/M1c60B3NJ8RhBDfumeogRXXGsg7XLQnjilZgR+eDU2i4S0NrQ4C83E607ApPIde3CYA4VjyoQceTMLMFReotVOq91G6xdPKRJYZrsQhEacNaLFdbOK6lIDL2ex7v4BBi4es0n6A+ie+hU2wwJJ5oYK6BVnfxujY/IwRJMm2h1G+L6kWOHgFKIfW5wi+MC4DdTk9NSiQZf/6jO38UegdQhVPxSlk0/eWXd14lnApuyiS/iikAWQ51C9BsB5bT3h5mDev4bfylNA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8196.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(19092799006)(366016)(38070700021)(921020)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VDh2V0dYOUJ6cFR0WXpKcTFGWmtRUC9vL0p0aVAyWXl2VU1KeSt1UDFheUVj?=
 =?utf-8?B?dHM2cHhZYUYrY0x6LzgwTXRzV1JoN0RyT3p3SDZ6RThDdFp3TThkOFloUEpE?=
 =?utf-8?B?S3RoQWhaQ01xK210cWd5ampueEZxUUJseVBtdzdtT1J4TStpQ09NNFBvbHFk?=
 =?utf-8?B?ZzNFdE1GT0NJbEthWVJwQTgwYW9BWHN4L1RzaU5GUkN0ZmhhcThiYlJqS0dN?=
 =?utf-8?B?Y0p6YnBJeDhjb1RLdGNoWlU2RU5qTmZjY0JOdzRRMzFFOU1oL3NjTm1pUFZL?=
 =?utf-8?B?c2ppTDZDZVNFQzBabU1GWWVva1RjTTBpdiswa0RlS29VWDlxdDRWN1UvMHJI?=
 =?utf-8?B?STRsWUlKQW1TaTQzS1lsdGxnTkYxVWRkcmFqbHlBeWRVY09UbEtWSk8xbU9z?=
 =?utf-8?B?QlRNTHZuVVhMbldWUEI4RytFcmdzSmN5QUVmWlpTbVFOcFFMSmU1WlFiSFRI?=
 =?utf-8?B?VUhZbDRxdW5kVlp6dS9Iay8wUHdzMmovbHo1VXRJdzZFZ2RWQ1dIUjFUN3I5?=
 =?utf-8?B?YlQ3M2VFdmpzNEwxckR3RjUveHhjYitrd0g5cm9EQWthZ3NTVDc2NDhzRUJS?=
 =?utf-8?B?eWJjN1F5VGFwZ2cwZ2Q2THNGeWdSaHhvd0w0RDRLRTcraEN0bGx5RmlxNGlX?=
 =?utf-8?B?a25aa1B6N2I5YWVYYVBYUDJPZ3dkUCtxdXVOajNwbHpkNHBoREhqT2JjeElV?=
 =?utf-8?B?ZU83MUh5RG1LSkZEeVFFTU5RNUs2YmtFdGY1ZjJZNTV1amFyNzMrbkJ3RnFu?=
 =?utf-8?B?YkorbnFHRVlzNE1kWk5ZOUNGZnRrNHRCNjM5N2lweDRRUGZ3TzYxMHFDOE16?=
 =?utf-8?B?ZGtSd2xrd08yQTVXaVpOdGpMeHRpY2Y5eVYraDBXanFPYnJnWlBkSkhQYlFW?=
 =?utf-8?B?UUk1bnlrRDd2ek4vUTVwODZyOEN4M1V3aWs5eTduWEZMamFBOC9pcDRpb3Vr?=
 =?utf-8?B?bEJlK3hLRlpRSDFkYTE4bG5sSXlKSjlFc2kxMUlLbWd1WlBsakkvdjB1OTRL?=
 =?utf-8?B?ZGREVU8rUUJsYm5hY3FFaTJnVWVTeDcvWE1kOStvekFWU1pBQmlwRC9pWUlB?=
 =?utf-8?B?V3dseW5KQ2VtUit6Zm1Pc2ZKMnF1OUFNdnhyMDFjZzZNSGlPTEtqMU5OajdG?=
 =?utf-8?B?UXZ2djN1VlBONUgxZ0JWcm1iYXdJR2hlWldSLytuendHdGJDWWs2UjlRVU85?=
 =?utf-8?B?dG5xUnJ2eHVYRm5pT1p0VEkvZk14Wi9OSUhjT3dCMXRhYWhoaW44ZEp0Skh5?=
 =?utf-8?B?VjhsZEY0cmMyaERHNWJzZUJPb0hiemNuODBaZk5SdERpeGFxQkZ2dy9xRXJZ?=
 =?utf-8?B?Q3ZRWm5vMVUxNkd1N0NLMmpHek9MakRKc1FvM0RNaHJOSVF3NmpmWFNtamtM?=
 =?utf-8?B?bjdRdEMzNkliUXJGL1pweHhFblpNclUrN1R5NlJqbFBIRzYxNzlveWZwVTYv?=
 =?utf-8?B?RjAyaGhEQjg0MDNkM0VXZGV3U1NNOW9NQjNCTlBoUGZINzVQYkt0YlI2STRj?=
 =?utf-8?B?WEkyL0F4cDlrbUQ0Yk5pQmlxTnpHUzRYMmJUSXJMd3RkSWJRRVhqZEVtTDZI?=
 =?utf-8?B?SzVMdStEc3JiVkc4UHpKMGdyZzZiRHNKRXRDN2xlcUVWd0V5bHNVMGxad0hI?=
 =?utf-8?B?SkxvV3Frb2hCbEdHbUhjUXVBRnUrR1VmQmxmb0RqaVNDZit2b0NZY1BSV2Za?=
 =?utf-8?B?Wm5ldEhMdHFKYUZkMm9haWNWYjh3QTlDRzl3dUNJbzNRRFBuZ0lEUmVrOFZl?=
 =?utf-8?B?UDhYRGFneTBzbjE5bG0wTWJVNXNEY2dUbzJjUEMxNzd0L05lMUpnTjRVUDJh?=
 =?utf-8?B?bm5ycTJuZy9KL1NzdnNseVhOMy9ZZTBRK2ROOS9tWDlSWVl4OC9ienQ0ZDdD?=
 =?utf-8?B?VW11TzErNzN4cjVCejl2eGNWNWdBa1BTZDNrWHRpN1pTNEkyVjlGd1BnTmFx?=
 =?utf-8?B?dmZKbTNrSjBwc2hrYmtDb29jUERLZXM4c3g0TDZKNGxRQTJFMjBiZ0V5R0RV?=
 =?utf-8?B?N1FTaDlvdjBHT2V4N3ZQbE1IU0hVMGU5NXVEbzZwc01meEU5THRUd2FGazFM?=
 =?utf-8?B?Q1lLMTNHYVRqcnpiWTJpVHhXaDFWemczT01sL1c4UlljZFBMc3hWTmd0TkVj?=
 =?utf-8?B?Ykhha3Rwc3pSMDludFh3MGdOT1VKTUNZcGQ2MmdLUEhmNWlIMjgwZWlCYzFr?=
 =?utf-8?B?MnNhZk11SVNRYjVCNURVbFZ5NHJheGtXdEF5Znk0c0FBaGV6M1dYQ3R1b0tU?=
 =?utf-8?B?QkdWanA0OW0xSnUweUNIVEhjUnluSnRGaitXTTlQOTl5VkVwazJYTmlrNCtw?=
 =?utf-8?B?TmlTWEtwbG1IeUVXeGxRNHd6c00wcnU5OG5iL3FQTUZISWhRUUY0SVBBWHVp?=
 =?utf-8?Q?F+qGKa3Aa87ujR8JDXawa37Wybbwgcf2P+Jt0?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7ef123-f0c5-42c8-14bb-08dea680c030
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2026 06:21:44.2993
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f7EVWLP6sWiIsrpdwIoxccxG398iByXr0/udkFPbA4ZuJ4TDklR9TG2w8pW77UM7HsfAKKrqQoIO1NHJJVxiaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12102

T24gNC8yOC8yNiAxMjowOCwgSmlhZmVpIFBhbiB3cm90ZToNCj4gW1lvdSBkb24ndCBvZnRlbiBn
ZXQgZW1haWwgZnJvbSBqaWFmZWkucGFuQG54cC5jb20uIExlYXJuIHdoeSB0aGlzIGlzIA0KPiBp
bXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9u
IF0NCj4gDQo+IEFzIGN1cnJlbnRseSB0aGVyZSBhcmUgbWF5YmUgbXVsdGlwbGUgcmVtb3RlIHBy
b2Nlc3NvcnMsIHNvIGNoYW5nZSANCj4gZnJvbSB1c2luZyBmaXhlZCBuYW1lIHRvIHVzaW5nIGRl
dmljZSBub2RlIG5hbWUgYXMgcmVtb3RlIHByb2Nlc3NvciANCj4gbmFtZSBpbiBvcmRlciB0byBt
YWtlIHRoZW0gY2FuIGJlIGRpc3Rpbmd1aXNoZWQgYnkgdGhyb3VnaCBvZiBuYW1lIGluIA0KPiBz
eXMgZmlsZXN5c3RlbS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEppYWZlaSBQYW4gPEppYWZlaS5Q
YW5AbnhwLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3JlbW90ZXByb2MvaW14X3Jwcm9jLmMgfCAy
ICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3JlbW90ZXByb2MvaW14X3Jwcm9jLmMgDQo+IGIvZHJp
dmVycy9yZW1vdGVwcm9jL2lteF9ycHJvYy5jIGluZGV4IGU4ZDIzOWJlZjVjOS4uMTcwMjZlMzkw
ZTg4IA0KPiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9yZW1vdGVwcm9jL2lteF9ycHJvYy5jDQo+
ICsrKyBiL2RyaXZlcnMvcmVtb3RlcHJvYy9pbXhfcnByb2MuYw0KPiBAQCAtMTM1Nyw3ICsxMzU3
LDcgQEAgc3RhdGljIGludCBpbXhfcnByb2NfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCj4gICAgICAgICBpbnQgcmV0Ow0KPiANCj4gICAgICAgICAvKiBzZXQgc29tZSBvdGhl
ciBuYW1lIHRoZW4gaW14ICovDQoNCj4gSSB0aGluayB5b3UgY2FuIGFsc28gcmVtb3ZlIHRoZSBj
b21tZW50IGFib3ZlLg0KDQpVcGRhdGVkIGFuZCBzZW5kIHRoaXMgcGF0Y2ggaW4gYSBzZXBhcmF0
ZSB0aHJlYWQgYXMgaXQgaGFzIGxlc3MgcmVsYXRpb24gd2l0aCBBLWNvcmUgcmVtb3RlcHJvYywg
dGhhbmtzLg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNDMwMDYxNzAxLjI3Mjcw
LTEtSmlhZmVpLlBhbkBueHAuY29tL1QvI3UNCg0KSmlhZmVpLg0KDQo+IC0gICAgICAgcnByb2Mg
PSBkZXZtX3Jwcm9jX2FsbG9jKGRldiwgImlteC1ycHJvYyIsICZpbXhfcnByb2Nfb3BzLA0KPiAr
ICAgICAgIHJwcm9jID0gZGV2bV9ycHJvY19hbGxvYyhkZXYsIG5wLT5uYW1lLCAmaW14X3Jwcm9j
X29wcywNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTlVMTCwgc2l6ZW9mKCpw
cml2KSk7DQo+ICAgICAgICAgaWYgKCFycHJvYykNCj4gICAgICAgICAgICAgICAgIHJldHVybiAt
RU5PTUVNOw0KPiAtLQ0KPiAyLjQzLjANCj4gDQo+IA0KDQo=
