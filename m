Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013022.outbound.protection.outlook.com [40.107.159.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D15B2D593E
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 09:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787130174; cv=fail; b=K2RcjcFxGgZl6apxIorCWnfEnhk6wCIQ2CnqZtfLCQNwFKnXwnJz7WG/QsvuWyRNl7D02LcUQE9THIZoW97fD2ZwP6DVfnDt9G4uizhP1cZFleyrLvsCbhzLho5jr771Vsro8F1AfRR31893EMpjucpAtHDocl1SMVonAv6ev8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787130174; c=relaxed/simple;
	bh=JJtE2joP0Jrjw6LBSLGU+rhWP4VL0lDo17rPuP36wXo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BPqzvqv7r5R3N/ePB8+vSH7dDpGDc6k1/gDGqAeoURdTr9MrYy5RWMWq/Xt21sTceC+od17mRH7+WL/EUsgyt8NmV/v0zz8kziR2y7umyscFQis3rgeNUvciqAy264Vvao2a1v1FMoJBe7KWioVaYtQiDo0Pb+C52MlHTUsKV1I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=p0KbcXCk; arc=fail smtp.client-ip=40.107.159.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="p0KbcXCk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r9Te3t+W0RxW38c0c8N7rbzw9Am+MS82h7JbBAsyzjO90cj0X9J6xx5dOGI5dOPTfE/gtHNEBJLb97bhBP7+6Y9fGoiQH6mKN0pig70O7v6MTnXSDZnMhAuQjWFEz5aSBTRvnqeNrYFkL/u+PYKaYb+SElzgepLj9+eS7tPUzN7oHvbcyHut+MdE237qDzvO76v0EP9tnef8ZBe+82sPYDGn7h7RY1NtG6qk62DULyqFCd/0tnKgzm7HHQ7zivy45RESMAfE0o0HJ2T6reDsLeMKfOjW76kBPW30RMyeqnBF3xFXZg4aocqZNjvI0zIGmnDjZ9TftsWkDobEv1WUww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJtE2joP0Jrjw6LBSLGU+rhWP4VL0lDo17rPuP36wXo=;
 b=j9fcFMuPYjynGoFDNj050lYcplKSgtpV/E2anPv/druxJW/CKDSmf3V8PRqSJtKuifpBdOXLf56nmkrxrS0V7hHInSri4ddvW9Vj3p/jwqYH2qy0hl7YEG9H9C6deMlyqeQkVpt6oIobLXsSYMwPmrYL57mabdethy8zt648YC1ZAE6t1QFpv7SXb+kSmRGs6Z6fhvGtmwFiEk1WDrte8HK/6yg0IDMdhoAQ2/NmwdddHYLXMZ/l8OivUcH0xV3DdoSOUW8fJ3dS5WNPRK3IyrRrTsXFy2WEBCDgJFT4Iead0MUYroHTpbiyqQja7KCdGQc846zD5xCbJM3nXN+1Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJtE2joP0Jrjw6LBSLGU+rhWP4VL0lDo17rPuP36wXo=;
 b=p0KbcXCkCQSWQuVAN2yghg3EhWRbB7zu2XWgHjAqLImOrUC21CouvUbaMArs9gzWf57tiRYF32FDcm19mJbBnCxp93rBdpm8WxZwgOuXezZn2sJtZHWwoE9gI6f+wHadM5gemoip7so8kxmEB1Y6KSrbjmzQ2Tj4j6V+EnRvyHXA3f738OSy9miI/ntQjnKbnVh7bzWC9UKQR59Q33HPzoQl2eYeLQCb9hhJvmShm8Zj1fdMZf9icXaAaN1YQUaDh99QHvmimC3IaucVjSncRSlQkr7Zgw2XNFB6SQNTYz7uO7ppQoLPvus7bDiKYzTDKu8rS92VM+NJlz8SZAHT/w==
Received: from AMBPR04MB12334.eurprd04.prod.outlook.com (2603:10a6:20b:732::5)
 by AM9PR04MB8827.eurprd04.prod.outlook.com (2603:10a6:20b:40a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 09:02:48 +0000
Received: from AMBPR04MB12334.eurprd04.prod.outlook.com
 ([fe80::9b4f:ab4e:94c3:c457]) by AMBPR04MB12334.eurprd04.prod.outlook.com
 ([fe80::9b4f:ab4e:94c3:c457%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 09:02:48 +0000
From: "Zhipeng Wang (OSS)" <zhipeng.wang_1@oss.nxp.com>
To: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "Zhipeng Wang (OSS)"
	<zhipeng.wang_1@oss.nxp.com>
CC: Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>, Frank Li
	<frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel
 Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jindong Yue
	<jindong.yue@nxp.com>, Xuegang Liu <xuegang.liu@nxp.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v3 3/4] irqchip/imx-irqsteer: Mask all interrupts in
 probe() and remove()
Thread-Topic: [PATCH v3 3/4] irqchip/imx-irqsteer: Mask all interrupts in
 probe() and remove()
Thread-Index: AQHdJj3QWu4viJ6YXk+nCTattssYXraS9WiAgBIxBRA=
Date: Wed, 19 Aug 2026 09:02:48 +0000
Message-ID:
 <AMBPR04MB123341AB132950F3E6961953AEBA52@AMBPR04MB12334.eurprd04.prod.outlook.com>
References: <20260807072346.1222389-1-Zhipeng.wang_1@oss.nxp.com>
 <20260807072346.1222389-4-Zhipeng.wang_1@oss.nxp.com>
 <anYui4Xjc1iphPL4@SMW015318>
In-Reply-To: <anYui4Xjc1iphPL4@SMW015318>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-08-19T09:02:26.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBPR04MB12334:EE_|AM9PR04MB8827:EE_
x-ms-office365-filtering-correlation-id: 09da5024-3d00-4caf-b4de-08defdd0a44e
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|19092799006|38070700021|56012099006|10067099003|4143699003|22082099003|18002099003|11063799006;
x-microsoft-antispam-message-info:
 +t2rrAF2F2Yq7eVHx+hEztxaCM3G4AWAYvzYP1F1altHWiaz+w/npjZrWxSuRnrTKbBKWMsmV/RffMb3JWZoKnUC+SJZuDQSL8QsYB97Xxf9KO7kTY2wdpDDQIForsCHXmENtBBhJIONwVe6d+V8cREN6Nx6EOYrdVywoajsr7FQ3a/xclh+dX3JyxE6RgToalJBqoo/nTVvWzUqzvpATy5CgA1JZ94HVUnMoXK7zg2btgcGuwZRb+TL+ZQXhAUr0d2vuajt8RFqTdnwMjzjbJc8PgZxbbi1nzGEzUyAald2jFnrCs4eMx1Vzl3mquEIdboLJ1Div0Aoj36G0wQnj4HO6duKDPu+EQ38Otxq7YAO+n9nJ+Ish72nePq0uk+y5wTxhuoJuxWtsJhxFfO5owaOBu6sM1JnIjHQFD6Y/ar6dMejFSAwi7k2IIiSRE3+EN97iaEHJ1ZsOJLMXQrzaVeM9g958Zsp4Df77HsBMyVU3erBIRRxMXFjEHjW/TF88bat9vULKKqT84jLhLxpO6aRWrg5qBQaCZdqr2uIhiRoilkNWYUTnYZf+x0zfAjQCEQ1m89XKfApZb1NaSMBzVd+dCYASio8PGTYL7VV+1tunfiMYXZtlsLRr/PQ51nfBm1IR2PNZkYUElJFkNiOf3sQTsqH6SPI79rFR+IzHq70OE5aQkR0lqlDNiifkHIx321KggQ/uTYpWLdr8L+0gw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12334.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(19092799006)(38070700021)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bGc4VlFBVklLZW13cTBXVU1hczFkdEZheTBhZmpLVVNkU1lOcUl0TzIwTXZZ?=
 =?utf-8?B?YkZ6WHJJaEZoZVNXWU9xb2QxbGM2YlF5Ry9TczJKTEkzYUJEd2tQT3hMWkln?=
 =?utf-8?B?SjBzL0E4SU5uS0owRWJ6SUwzLzlzd2xKTFRadzc4NDJTWlFCakpvaE9xOTlz?=
 =?utf-8?B?aC9DNXVqLzU2dE1pVnYxbXhJelowa3JDMEFCYnFCbVMyVlNyQnRYeFd1QWJS?=
 =?utf-8?B?MG85SnlCWTU2ZTVIZkdScHRMai82ZldScmNxTnNyZysyR1VQRGYreC93b3dS?=
 =?utf-8?B?d0FWUFovRDY3WmlRbVVXN09vZ01ibUE1MlY3S25laVRHcUx6Q1FwaHVCRXJ6?=
 =?utf-8?B?V0NaUWtpZG43Z3lMN2RNZTdlRzZYTURUYUkyR2gyRGhQYk02SVYxY2d3cC93?=
 =?utf-8?B?ekw1TXBtQU5YNXdlNXI3MUVMKyt4QVV1MnJuVkNFY2R5VzRLTjM5ZWZleCtk?=
 =?utf-8?B?U2ZDeFhiT2E4SGd0SWFtSG85ZG9vbFBMdnp2MUdwS1o4UnJvZ2swN3UwRXV1?=
 =?utf-8?B?aXJ2dmhYNzJ2anRqVlIzd1FOZ2Y2L0oxRmx1aWJEMGVwUVBldFVhQ2ZWdmVw?=
 =?utf-8?B?bDl2MDB2d3gwcEpJRldBSmhVbVJ4Smh0cHB0T1gyQXl2VnBvbG0wODlEYjJF?=
 =?utf-8?B?SE9sei9ON0EvbVlTcFNQWjhjY3lxQU5reGtIY1c2MGpvcUNhQUtzSXVpeUJs?=
 =?utf-8?B?dnZnNnc5Z21yMnVIUlpXdWpqTk9nQlNLaVZyU3prWEJPM2Z3Sm5ZNm1SNS9L?=
 =?utf-8?B?bVVqMWdBZW5HM1BjNnAwSVpUY3VOa0xqdjBUZWVBemZ2ZWJETmJTbVlnTmIw?=
 =?utf-8?B?c21VcmpTSFBBbWViQ1BSa05mNE5rM2tqWVlMSW5MSjdFRTh3UkxtdjNZNEVu?=
 =?utf-8?B?UnRFNWJoWEpaK3Zha2VTMExsZjRvcXA5UnZ0YUNzQ1UweE1NY2FGR21OMFlX?=
 =?utf-8?B?dHR3YmxPUmRFR1VOV1Qzdmk5d1NObTZOcTBXTEx4cnhqTWFteGd4RWdrZHQ2?=
 =?utf-8?B?QjQ0RW1qYk9JKytoenNvOVlUVXVISjVveTZkdk00QmdEUnBuYXJmaUN5dDhI?=
 =?utf-8?B?Rzl0VUJ1M1lhNUZYQmpxUEpheStMK0Q1Y25wdWwrcy9PYlZPaUhnbkg1K24v?=
 =?utf-8?B?aDBLUi9sbnpFMldlNGI0clE2d3ZmMWFaaEtnS1ZaVVFEalM4OUNqaDN2UkZI?=
 =?utf-8?B?em55bXVJQzlKYnRZSUpuUDQ0cEI0VjYyM0JqZXozenR4aVFpV3RVY0JTRVJG?=
 =?utf-8?B?YkpYUDhVVWZvdENSNXFtajF6bkVGc05GSkJnY1RpczFwS0N1UVFpYkk3Zy9t?=
 =?utf-8?B?UzdMcHVndDJlTHp6cUhxcmdDczY2NFVpV1M3ajlVNnAvbGpvWGVZRjdBYWhN?=
 =?utf-8?B?L2FPZXk1bGRzNjVhQVpCSzUvaWRISTdpS281SFlYVGdtY3hnaUE4bjhZZ2xp?=
 =?utf-8?B?MUJnaThmZ0VjVjFpUUhGbnJrNmt5aUdlWGtWaFQ1bWIyQmxVZVZKUDJaM3Bt?=
 =?utf-8?B?U3B0cGJyYWs4SFNMdmM4TkpEdC9YK1A3NVA2bDMxcHp6eGNmUFV0OW93Y3BG?=
 =?utf-8?B?UDU4RXNiK2NwNk04US95T0wxY2pGQ1dXZnZTMm5kdnN3dXJtbjdCZ3dTTThl?=
 =?utf-8?B?NzZxTHpWMExjN212VlR6K2hxUEdMbjJYOXRvZDFNWVlMUFk3U0JVZHlFdXR4?=
 =?utf-8?B?SUx6ZEpZbXIxdC9RMWc5T0NIK0JVU0VjUjJyQlR5eFF0N3JvbkI2ZW1uL1lj?=
 =?utf-8?B?djhnVzRTZnBtNzVmVGJnT3BSVjV3MTBOT0Z6cnlRWUEzSzVTc08rdUJucnhE?=
 =?utf-8?B?VDg4RWVTY1htYkpHWTlYcmVYbFJ3czUySU16bFoyc3VQZlRxT3hGOGs2OVZt?=
 =?utf-8?B?V0NBcGtxcVpTWWNNeGZJd2tMUkdKTUtvVDlpajgyaGMwRlljMVRtaTgwUHhn?=
 =?utf-8?B?cXF6NWJsL2JpYU5MbVhGRWxTS1EvNG9GVWx0YURnQ0RnMmM4R0s0NFRNdmVO?=
 =?utf-8?B?Y2ZhLzJXalY1TytBTEt0ck5IVUszK2hkMmxoZC9UNnBkOHZtWHUzMVAvZy9i?=
 =?utf-8?B?ekhrclBOZVlGUDhUVk5PbE9McFFlNi8yclY3b0EvZjRKQ3ZBaThnNTRSdUlL?=
 =?utf-8?B?OFJZbE1YQkpnZ1hwbjJwcTJ3MEdsbkhRY0J4MHVFWkxOak9qejRPaFpmSysy?=
 =?utf-8?B?cFRWV003OWRxSHJTSmtxcWZ0c1hEa0Y3ZUdqWmNCYmdWd3B5N0F1bDdZdTBN?=
 =?utf-8?B?eVNTREY1M1BYT0pXbjlrcy9XY3NMNkNkdk1TYlhHb01MS3FGR1ZCbnF2YmZS?=
 =?utf-8?B?VlpvMHJ1eVdYeGtIS1ZDRTJybmtoWVpSaWZuNC9HV0Qwem56TUY4dz09?=
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
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB12334.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09da5024-3d00-4caf-b4de-08defdd0a44e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2026 09:02:48.4456
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Hs07/0GakjN4E0KPfMmT+txjJvP5tJyqYMUeKW64n6L7ce33qbgdjJK7IoxWfTynZFerDZiitbfNHtPxPicuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8827

DQoNCg0KTlhQIENvbmZpZGVudGlhbA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBGcmFuayBMaSAoT1NTKSA8ZnJhbmsubGlAb3NzLm54cC5jb20+DQo+IFNlbnQ6IDIwMjbl
ubQ45pyIOOaXpSAzOjE0DQo+IFRvOiBaaGlwZW5nIFdhbmcgKE9TUykgPHpoaXBlbmcud2FuZ18x
QG9zcy5ueHAuY29tPg0KPiBDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGtlcm5lbC5vcmc+OyBN
YXJjIFp5bmdpZXIgPG1hekBrZXJuZWwub3JnPjsNCj4gRnJhbmsgTGkgPGZyYW5rLmxpQG54cC5j
b20+OyBTYXNjaGEgSGF1ZXIgPHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU+Ow0KPiBQZW5ndXRyb25p
eCBLZXJuZWwgVGVhbSA8a2VybmVsQHBlbmd1dHJvbml4LmRlPjsgRmFiaW8gRXN0ZXZhbQ0KPiA8
ZmVzdGV2YW1AZ21haWwuY29tPjsgSmluZG9uZyBZdWUgPGppbmRvbmcueXVlQG54cC5jb20+OyBY
dWVnYW5nIExpdQ0KPiA8eHVlZ2FuZy5saXVAbnhwLmNvbT47IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc7IGlteEBsaXN0cy5saW51eC5kZXY7DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDMvNF0gaXJxY2hpcC9pbXgt
aXJxc3RlZXI6IE1hc2sgYWxsIGludGVycnVwdHMgaW4gcHJvYmUoKQ0KPiBhbmQgcmVtb3ZlKCkN
Cj4NCj4gT24gRnJpLCBBdWcgMDcsIDIwMjYgYXQgMDQ6MjM6NDVQTSArMDkwMCwgWmhpcGVuZy53
YW5nXzFAb3NzLm54cC5jb20NCj4gd3JvdGU6DQo+ID4gRnJvbTogWmhpcGVuZyBXYW5nIDx6aGlw
ZW5nLndhbmdfMUBueHAuY29tPg0KPiA+DQo+ID4gcHJvYmUoKSBzZXRzIHVwIHRoZSBjaGFpbmVk
IGhhbmRsZXJzIHdpdGhvdXQgZmlyc3QgbWFza2luZyB0aGUgaW5wdXQNCj4gPiBpbnRlcnJ1cHRz
LCBhbmQgcmVtb3ZlKCkgbGVhdmVzIHRoZSBDSEFOTUFTSyByZWdpc3RlcnMgdW50b3VjaGVkLiBG
b3INCj4gPiBhIGJ1aWx0LWluIGRyaXZlciB0aGlzIGhhcHBlbmVkIHRvIGJlIGhhcm1sZXNzIGJl
Y2F1c2UgQ0hBTk1BU0sgcmVzZXRzDQo+ID4gdG8gYWxsLW1hc2tlZCwgYnV0IG9uY2UgdGhlIGRy
aXZlciBjYW4gYmUgdW5sb2FkZWQgYW5kIHJlbG9hZGVkIGENCj4gPiBjaGlsZCBpbnRlcnJ1cHQg
bGVmdCB1bm1hc2tlZCBhdCB1bmxvYWQgdGltZSBzdXJ2aXZlcyBpbiBoYXJkd2FyZS4gT24NCj4g
PiB0aGUgbmV4dA0KPiA+IHByb2JlKCkgdGhlIHBhcmVudCBpbnRlcnJ1cHRzIGFyZSByZS1tYXBw
ZWQgYW5kIHVubWFza2VkIGJlZm9yZSB0aGUNCj4gPiBuZXcgZG9tYWluIGlzIHJlYWR5LCBzbyBh
IHN0aWxsLWFzc2VydGVkIGxpbmUgaW1tZWRpYXRlbHkgc3Rvcm1zIHRoZQ0KPiA+IHBhcmVudCB3
aXRoIG5vIGhhbmRsZXIgdG8gc2VydmljZSBpdC4NCj4gPg0KPiA+IE1hc2sgYWxsIGludGVycnVw
dHMgaW4gcHJvYmUoKSBiZWZvcmUgd2lyaW5nIHVwIHRoZSBjaGFpbmVkIGhhbmRsZXJzLA0KPiA+
IGFuZCBhZ2FpbiBpbiByZW1vdmUoKSBzbyB0aGUgaGFyZHdhcmUgaXMgbGVmdCBxdWllc2NlZCBm
b3IgdGhlIG5leHQgcHJvYmUoKS4NCj4gPiBOb3RlIENIQU5NQVNLIHVzZXMgaW52ZXJ0ZWQgcG9s
YXJpdHkgKGEgc2V0IGJpdCBlbmFibGVzIHRoZQ0KPiA+IGludGVycnVwdCksIHNvIG1hc2tpbmcg
bWVhbnMgd3JpdGluZyB6ZXJvLiBUaGlzIG1pcnJvcnMgdGhlIHNpYmxpbmcNCj4gPiBOWFAgY2hh
aW5lZCBtdXggaXJxLWlteC1pbnRtdXguYywgd2hpY2ggaGFzIG1hc2tlZCBhbGwgc291cmNlcyBp
biBib3RoDQo+ID4gcHJvYmUoKSBhbmQgcmVtb3ZlKCkgc2luY2UgY29tbWl0IDJmYmIxMzk2MWU3
NCAoImlycWNoaXA6IEFkZCBOWFANCj4gPiBJTlRNVVggaW50ZXJydXB0IG11bHRpcGxleGVyIHN1
cHBvcnQiKS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFpoaXBlbmcgV2FuZyA8emhpcGVuZy53
YW5nXzFAbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiBDaGFuZ2VzIGluIHYzOg0KPiA+ICAtIE5ldyBw
YXRjaC4gTWFza3MgYWxsIENIQU5NQVNLIGludGVycnVwdHMgaW4gcHJvYmUoKSBhbmQgcmVtb3Zl
KCkgdG8NCj4gPiAgICBwcmV2ZW50IHRoZSBpbnRlcnJ1cHQgc3Rvcm0gb24gbW9kdWxlIHJlbG9h
ZCByZXBvcnRlZCBieSBTYXNoaWtvIEFJDQo+ID4gICAgb24gdjIuDQo+ID4NCj4gPiAgZHJpdmVy
cy9pcnFjaGlwL2lycS1pbXgtaXJxc3RlZXIuYyB8IDkgKysrKysrKysrDQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2ly
cWNoaXAvaXJxLWlteC1pcnFzdGVlci5jDQo+ID4gYi9kcml2ZXJzL2lycWNoaXAvaXJxLWlteC1p
cnFzdGVlci5jDQo+ID4gaW5kZXggNGEyZmU4YmE5N2Y1Li4wYzljOTlmMTE0MWEgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1pbXgtaXJxc3RlZXIuYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvaXJxY2hpcC9pcnEtaW14LWlycXN0ZWVyLmMNCj4gPiBAQCAtMjM2LDYgKzIzNiwxMCBA
QCBzdGF0aWMgaW50IGlteF9pcnFzdGVlcl9wcm9iZShzdHJ1Y3QNCj4gcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KPiA+ICAgICBpZiAoaXJxc3RlZXJfaGFzX2NoYW5jdHJsKGRhdGEtPmRldnR5cGVf
ZGF0YSkpDQo+ID4gICAgICAgICAgICAgd3JpdGVsX3JlbGF4ZWQoQklUKGRhdGEtPmNoYW5uZWwp
LCBkYXRhLT5yZWdzICsgQ0hBTkNUUkwpOw0KPiA+DQo+ID4gKyAgIC8qIG1hc2sgYWxsIGludGVy
cnVwdHMgYmVmb3JlIHNldHRpbmcgdXAgdGhlIGNoYWluZWQgaGFuZGxlcnMgKi8NCj4gPiArICAg
Zm9yIChpID0gMDsgaSA8IGRhdGEtPnJlZ19udW07IGkrKykNCj4gPiArICAgICAgICAgICB3cml0
ZWxfcmVsYXhlZCgwLCBkYXRhLT5yZWdzICsgQ0hBTk1BU0soaSwgZGF0YS0+cmVnX251bSkpOw0K
PiA+ICsNCj4gPiAgICAgZGF0YS0+ZG9tYWluID0gaXJxX2RvbWFpbl9jcmVhdGVfbGluZWFyKGRl
dl9md25vZGUoJnBkZXYtPmRldiksDQo+IGRhdGEtPnJlZ19udW0gKiAzMiwNCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZpbXhfaXJxc3RlZXJfZG9tYWlu
X29wcywgZGF0YSk7DQo+ID4gICAgIGlmICghZGF0YS0+ZG9tYWluKSB7DQo+ID4gQEAgLTI3OSw2
ICsyODMsMTEgQEAgc3RhdGljIHZvaWQgaW14X2lycXN0ZWVyX3JlbW92ZShzdHJ1Y3QNCj4gcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAgICBzdHJ1Y3QgaXJxc3RlZXJfZGF0YSAqaXJxc3Rl
ZXJfZGF0YSA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOw0KPiA+ICAgICBpbnQgaHdpcnEs
IGk7DQo+ID4NCj4gPiArICAgLyogbWFzayBhbGwgaW50ZXJydXB0cyBzbyBhIHN0YWxlIGxpbmUg
Y2Fubm90IHN0b3JtIG9uIHRoZSBuZXh0IHByb2JlICovDQo+ID4gKyAgIGZvciAoaSA9IDA7IGkg
PCBpcnFzdGVlcl9kYXRhLT5yZWdfbnVtOyBpKyspDQo+ID4gKyAgICAgICAgICAgd3JpdGVsX3Jl
bGF4ZWQoMCwgaXJxc3RlZXJfZGF0YS0+cmVncyArDQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgQ0hBTk1BU0soaSwgaXJxc3RlZXJfZGF0YS0+cmVnX251bSkpOw0KPiA+ICsNCj4NCj4g
WW91IGFjY2VzcyByZWdpc3RlciBoZXJlLCBkbyB5b3UgbmVlZCBjYWxsIHJ1bnRpbWUgcG0gZ2V0
IHRvIGVuYWJsZSBjbG9jayBmaXJzdD8NCj4NCj4gRnJhbmsNCj4NCg0KR29vZCBjYXRjaC4gUmF0
aGVyIHRoYW4gYWRkaW5nIGEgcnVudGltZSBQTSBnZXQvcHV0IGFyb3VuZCB0aGUgcmVnaXN0ZXIN
CmFjY2VzcywgSSBkcm9wcGVkIHRoZSBtYXNraW5nIGluIHJlbW92ZSgpIGVudGlyZWx5ICh2NCBw
YXRjaCA0LzUpLg0KDQpUaGUgcmVtb3ZlKCktdGltZSBtYXNraW5nIHdhcyB1bm5lY2Vzc2FyeTog
dGhlIG5leHQgcHJvYmUoKSBtYXNrcyBhbGwNCnNvdXJjZXMgYmVmb3JlIGl0IHJlLW1hcHMgYW5k
IHVubWFza3MgdGhlIHBhcmVudCBpbnRlcnJ1cHRzLCB3aGljaCBpcw0KdGhlIG9ubHkgd2luZG93
IGluIHdoaWNoIGEgc3RhbGUgbGluZSBjb3VsZCBzdG9ybS4gTWFza2luZyBpbiByZW1vdmUoKQ0K
d291bGQgYWxzbyBtZWFuIHRvdWNoaW5nIENIQU5NQVNLIHdoaWxlIHRoZSBkZXZpY2UgbWF5IGFs
cmVhZHkgYmUNCnJ1bnRpbWUtc3VzcGVuZGVkIHdpdGggdGhlIGNsb2NrIGdhdGVkIC0gZXhhY3Rs
eSB0aGUgcHJvYmxlbSB5b3UgcG9pbnQNCm91dC4gU28gdjQgbWFza3Mgb25seSBpbiBwcm9iZSgp
Lg0KDQpCUnMsDQpaaGlwZW5nDQoNCj4gPiAgICAgZm9yIChpID0gMDsgaSA8IGlycXN0ZWVyX2Rh
dGEtPmlycV9jb3VudDsgaSsrKSB7DQo+ID4gICAgICAgICAgICAgaWYgKCFpcnFzdGVlcl9kYXRh
LT5pcnFbaV0pDQo+ID4gICAgICAgICAgICAgICAgICAgICBicmVhazsNCj4gPiAtLQ0KPiA+IDIu
MzQuMQ0KPiA+DQo+ID4NCg==
