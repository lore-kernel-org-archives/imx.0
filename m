Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010069.outbound.protection.outlook.com [52.101.69.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A6430EF68
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 03:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787714797; cv=fail; b=lJEwwj939/0FzmmP6fJ32be2NbWnDgg3asclu6dmGz0ZLPYb7xhPWCYzo4MnycKk8EB9quIbNP7ciYk5dtVPMRH/Opt3FsL88CyjRnv4xFqU9XjzrxUz/To/PpyfgJjFw9vm1TRUEgvNvi5LuXk158GY2xjED5FJNmemYWMSR2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787714797; c=relaxed/simple;
	bh=oUcTiTzXml4tZ/RCFQEHvhy3zqqUAkPWjNY9sfuuy9Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bMGW8u0rDC6u4I5b8tqU8BfFFYJ5KPbU+48Mgj6omKANUCGW3iN7C+uOuvOAEkiISmUKNLqlXKkoD9Uqf6tObI3UF+pRk/oQS6DY9XdOcaIiO5yTpy7LQn6bXpPWT1jOONHae7iDC80e7d/ofu/iSKp7fTBrxkZgX3oWiXZRWAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GYx2hQZe; arc=fail smtp.client-ip=52.101.69.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GYx2hQZe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dcm3bC4lK7GXisOjCHoj3Qtfycvy6adpnCRdVjIWY8Yte/mCDxn4ByyzePBA/d1i4dru9H1KomIz5eIbgZlnJPsRjFN3ZJPxL5Duh7D1+HF9w20H5RuNHO7Ltgt2jhnQRwYzaziFt8QWx8FZiLOsQDo7FWpsGdXKSbohjIW78wTMOdO2HYBpbLh9AFtsirSrw4aLQ0HNOvV+7c9vPjEGLEdcXmjyUtqdGxCC70UhdTpy4/U9vvcOtde8c/wdOKjQLH3l0prcJtOn3rmayEBovSmIkNIrLl4OYuNLes4oha6LObL+uVPAfgcVi2IoqA5x9gOVpgRBmjBRJFtDGAwTmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUcTiTzXml4tZ/RCFQEHvhy3zqqUAkPWjNY9sfuuy9Y=;
 b=XRjGdFQrxt8zT2U/nL8CNnDSDepO4Zu9beWn3xr5z991x3t8yvsTojDtDBAuYlm7zmkBi2gMUbN+3AxH6ZEBa8JpV8MTSSoClm2KGckYqEjIIrQ+DdKR+ImdWEJMXlVWuVwbcmfCqZ6O6YPVtoepI7PwPg6EWB+Bl1mdRFB684SBFL5ldW1+QTmXKyKRWye4XR12Z9SoikYUbrpwHDwqlOVlEesbkDDLe6Bs9+O820BjzK5ubPRJbSeGWyPlGS7009rv3QWWP0kfTJWmlYESw+eB3Z4xGFsr4NWxAQY8tUCvAgH+8CesFPQY39I3Qbvj4tRq3OfcmUJ5budMBjL5xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUcTiTzXml4tZ/RCFQEHvhy3zqqUAkPWjNY9sfuuy9Y=;
 b=GYx2hQZeMAW5LrW2RCoDnLDvJiOOKfMgfkRx5G0auspDqz6QEFkT6A2EJMjwRDVxA3AuOWwjau22/M1o9p1cTzb3gFtXh/TtbVGrOnHEM2n6oDN9wOqZkPIixAoN86hDfxdRpbaixrBIo+ob+fNcmJCc5Tt2qzcWYvXjhkdVzXs6R98QQCtxNx1KI/INQVa1SYJwAmNS7SlwUi96k7n6UCF+29xbyy6h5HVsd3EQ8aTYPEUyUWdkFiH/75D8M8M5w2SLQanGrxDhgqWhHqT+5YdcrjjQzIRQ4uPKGMohxGrJ7VMEvmCxp1lnvVFN68g5NuXPCZ/iLsEaCQpU9SWQwg==
Received: from AMBPR04MB12334.eurprd04.prod.outlook.com (2603:10a6:20b:732::5)
 by PAXPR04MB8475.eurprd04.prod.outlook.com (2603:10a6:102:1de::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 03:26:30 +0000
Received: from AMBPR04MB12334.eurprd04.prod.outlook.com
 ([fe80::9b4f:ab4e:94c3:c457]) by AMBPR04MB12334.eurprd04.prod.outlook.com
 ([fe80::9b4f:ab4e:94c3:c457%4]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 03:26:30 +0000
From: "Zhipeng Wang (OSS)" <zhipeng.wang_1@oss.nxp.com>
To: Fabio Estevam <festevam@gmail.com>, "Zhipeng Wang (OSS)"
	<zhipeng.wang_1@oss.nxp.com>
CC: "Frank Li (OSS)" <frank.li@oss.nxp.com>, Thomas Gleixner
	<tglx@kernel.org>, Marc Zyngier <maz@kernel.org>, Frank Li
	<frank.li@nxp.com>, Radu Rendec <radu@rendec.net>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jindong Yue <jindong.yue@nxp.com>, Xuegang Liu <xuegang.liu@nxp.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v5 3/9] irqchip/imx-irqsteer: Validate IRQ count before
 creating domain
Thread-Topic: [PATCH v5 3/9] irqchip/imx-irqsteer: Validate IRQ count before
 creating domain
Thread-Index: AQHdMVVraEXmIS3CdUWUE9Py1IVZLLaojv0AgARlPOCAADc6AIAChlNg
Date: Wed, 26 Aug 2026 03:26:30 +0000
Message-ID:
 <AMBPR04MB123345E2C36D48C6E7E1CE4CAEBAE2@AMBPR04MB12334.eurprd04.prod.outlook.com>
References: <20260821101039.4037925-1-Zhipeng.wang_1@oss.nxp.com>
 <20260821101039.4037925-4-Zhipeng.wang_1@oss.nxp.com>
 <aohftK95_iDsTPPm@SMW015318>
 <AMBPR04MB12334D1C91BFC42AEDB26E7F2EBA02@AMBPR04MB12334.eurprd04.prod.outlook.com>
 <CAOMZO5CdZk3oyMpwPcTEeROBWBr70r9J7Vt-MiEA4+Y7abE5Sw@mail.gmail.com>
In-Reply-To:
 <CAOMZO5CdZk3oyMpwPcTEeROBWBr70r9J7Vt-MiEA4+Y7abE5Sw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBPR04MB12334:EE_|PAXPR04MB8475:EE_
x-ms-office365-filtering-correlation-id: 06954ec8-de2e-48f9-f587-08df0321d1f5
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|19092799006|38070700021|6133799003|56012099006|10067099003|11063799006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 Y1MngL+zK/D/8F8wjRLv6YAi4U8gfVz030Q2zHdA6oMRHVYV8rR2yPJah+wmRyb/vHlaiuEew5DXamBereNWIp8KvE4hZ4va5zO0kxtYxWNbodrK5kWsRphVcYsx3kvEy2a9OpKcNDnqDIGalz9is3GfRN8GWHACu2Wj6zPmyqZ5Tec71gF17KOgaXDxAJNHvxaJBo04Yvsujbohp7FIi11v4aKoTxu3OT1puQwQaI9h44Wkhz1cTRCi1+TfjdjhaaGoajnrWf702Sv3cI050fBFv2gW/BEcQRRV7qtTU7wxfqF2F0+3mh4Tn8ov/m1fEnMs5YLxva96dejBOBpPUkitjPJEXdfdpTlWL3/+fXxupr58SuAoGJ1TDd5xBOuUFB9IVv+HHDLmWQUvxnhfmRgWbUt3HE+G2n9XIHBH+JW/U8CXA3vgodGyI0DttFsAIu/69k/35fR7/+KPuSfo83sAb94O6QkCix0LPQzI4MMADJir4o7tAmk5msl3s6ySwJXpPFaUr109NBXzRw5xZm9VhnO84mGEbywtSINX0UoSPXGSzmuhel8d+BriJf7UYzkgypCcS7ihEv/o9Sd1L6jGvwv6peUqrODAPvh8GHcI+PFBK9BvRpod758PiFpP+LjyUeaEfUPxrkv9Zw9YrCAwQ9HiF915laWcq4QTS3TdiaXBXsIofs8bwEW58P3lXLGYX0kRtUWLK0bplb0tZxoJdrEyKe5eLqla9uZevTA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB12334.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(19092799006)(38070700021)(6133799003)(56012099006)(10067099003)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dWgyblNrRmZTdnhuNVJtbWFVdldWYi9PVFdpamJIT09IcUMrQ3VWRThnQ0R2?=
 =?utf-8?B?NEFybTZ1K2dFNEhsSTZ1UWF6ZUk1WWlIdXY1YzE2RUZURlZWVGhsVEZURUdD?=
 =?utf-8?B?M2ZydUdWOFNwVDdlbUZHTGVlQ0FpdDZZVnNCelBxd0JrZjcwUFJ6MVRQZUpz?=
 =?utf-8?B?cG5wMUNtdkZsL21tNjc3ZnFEUDZUeVJOdnhLVjFTWlZxWW9uVlVqdTdDQVQz?=
 =?utf-8?B?TTlVQ1VLYXlDbVM4YU5XWlVQMDJHQ1hoNm5HVHJ6UWlEUTIxOWlTR2o5VXFv?=
 =?utf-8?B?eXNTbmdlUG9ycWpzTC82UlEyK1ZmMG8zYWQ5WjZnWDRSa1gyV2RYNDhyVUpl?=
 =?utf-8?B?cno2dll0UXNBbVM1NFFBT0JyLzU3TURUbk1TcExOc3lpNFZXbzNZWWpKSzlZ?=
 =?utf-8?B?SnZJRTBGV0JBNkZvS294eDJJc2ErUTc3aGZIRU1WeW9uNCtmQmhlMDRUS1Jx?=
 =?utf-8?B?cUxaOEdIL0VSSmVxWnlQWnFnQ2w4ajI5MTF0cG8vdTJxejFYSkZGZ3BWWHQ2?=
 =?utf-8?B?NzZDeXR4VVdaVFZCWVlLY2M0WFptRjBEd1hsVDdhZS9yTktESGdLZUZBZ3k2?=
 =?utf-8?B?L0JlRGxFT3RTSTJNSjhiV0YyV0hYV0FXVXRJaTdCa1RMT1MzQzNvNCtiVjlY?=
 =?utf-8?B?NkRnSWFRR056VGtQWkx2N2ltenBKb1gweFg1ZGVNMllzZmxnanU4MUFaSms2?=
 =?utf-8?B?Ly8xdlozWWw1Y1ljb3ZtQnlmTHMyYnYrY0lsN1BuZ0gvdDBWTGRCL0VUQVFH?=
 =?utf-8?B?WFp0ai8yOFRDU280UjRrNHk5MnhpVHcxODUwZG9ORTBDYVFGbVQxVlFNcHQ1?=
 =?utf-8?B?Q3p6dFBGanFWcW1NcFdHcy95U1EycUh1UlZ5NC9UdTBVQWJQYlhvdE83Undm?=
 =?utf-8?B?QjRrM0xxRHo0WUtuUTgwU3RhcE91d3VDOXNKRUZYemp6WXdScXlwSmlNTHRO?=
 =?utf-8?B?Z0dqczc0bnFTWm01dElxaEN4UUtLSWlUQ0dxK3Jqam8vYzY2cmNSaDFORGlK?=
 =?utf-8?B?NnJwcUdxRi9hYkV4T3NROXBUTm5VZi81Wm9OTWx0V1FsRmRLS3hyc0ZTRzNq?=
 =?utf-8?B?ZVZpdTFCaThPYzcyWkFGK1NQTjJla3JMLzZyTWZWWWluMWV2M2tiWVZaenZk?=
 =?utf-8?B?b3JkWHJjRzlnVVByU3VZUE1LUDBsNVEwak01SDhpOG9JK1h6YkdwNlR0ZE82?=
 =?utf-8?B?SWdmSnNmZkJ3ZlJPSHhud1kwNGxoQ3FVMWdPM0dMODd4NjJhYW4yQXF4UTZF?=
 =?utf-8?B?UHcrQXFmQ1k0Q2tIblJrUlRhc1hmWGpFcUJxRnQ2TVBuLzJhSDk4cUR0V0Zv?=
 =?utf-8?B?VGtRNDllTTJqb203enE2UU10VXFQa2VyUzlkVWhVeWN4aHd5RjVPdVM1Q0Zm?=
 =?utf-8?B?ZEU5Zk93UzNqc0VPTGJxYlhPTmE0RjZNS244dWRwakdDY2picWhMNzhTYmdN?=
 =?utf-8?B?Qm5UMTNKd2ZJNE5uQTJaV3d1MHVlanc1eFMzUjRFUkZOK0ZOMDA4WWNvY0oy?=
 =?utf-8?B?VEU5QmtBNmxIVEVHbzc1NkUvVGk0NDRtZURZb2M2eUp0Z2V2UHZpYkp2Z0t1?=
 =?utf-8?B?RERoR3lSK0ZLNlJ0cndRWWdoa3FFZjduWnR5UURUdFFBamlwdStVQmhIRU0x?=
 =?utf-8?B?MFMxcXd5dHhRTmFYcFU1eUtkUDZlRDIyS3YwMWw5QnZxOXk1S1FyNENnWWdI?=
 =?utf-8?B?UStvUmdOZW9Wa0hQWlljckJubDJuaS9kR3F1QWVOdWpqbjd5dHJEaG1XbVZJ?=
 =?utf-8?B?VDFFMjRhWGVJNHY4WVNPSklmM2ZQZGtPMm5KUzBXOXI1VFo4Tkh2SC9LYzlp?=
 =?utf-8?B?dHRjd2piWXh6dWl3L1dhMmRnTjJ2TWZ2TG1wakJDeUdtdWRpT3hUcUIwZWxp?=
 =?utf-8?B?dWN2dHVJaEluQi9YRXZXNUp4a3B6TzNHSkN2N1FRS1NNOUpId3c3c2NHdWp5?=
 =?utf-8?B?bFllZWU3K0R5UWNKTFBqMm4yeVF4TnVzcmtnMHpvdmpsRDZMaVZmTWxZN0Uy?=
 =?utf-8?B?aTl5WFVBL1JkSXhlQXdFSmFsQ1dGcVJPNGJoZUhGWWJ1YUN0bmdheVMxTnRE?=
 =?utf-8?B?QXRzWVd2M3plcUZMZUl0NUpXaldJR1JUQ2h1dFlLRmFBaXZtSEZPZUpWWjBq?=
 =?utf-8?B?UVkyRklqOE9aMFBsaWFKWm1Jdy9KSTlybmxLUjNyd0Vsbkw3OVF4U21Kd1Ni?=
 =?utf-8?B?NmZZVVRVNThLN3RMdXo2ZlM5TllPYkdlalRNNHprQ2FmaVZnUlRTclZwMDRz?=
 =?utf-8?B?N2pJcENKWWNadzRyQ1RKVlUxWEcwYkxyZktFazFKOW5VYkZkRjYwMDQyUXFt?=
 =?utf-8?B?QXN4Q3RGWTI4OUtlSURUemVzUzJPcmVMQnVNQmZYU2ExZ0k2WmhpZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 06954ec8-de2e-48f9-f587-08df0321d1f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2026 03:26:30.1246
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: og+U+Svc+L//miaKTZETYIra78w+Q6ORxq3wgkUkhBZJhtu6UG5pTlb43IpU4Jww7TfsRX6ltXVO+I7NSgbhvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8475

PiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDMvOV0gaXJxY2hpcC9pbXgtaXJxc3RlZXI6IFZhbGlk
YXRlIElSUSBjb3VudCBiZWZvcmUNCj4gY3JlYXRpbmcgZG9tYWluDQo+IA0KPiBIaSBaaGlwZW5n
LA0KPiANCj4gT24gTW9uLCBBdWcgMjQsIDIwMjYgYXQgNjozOOKAr0FNIFpoaXBlbmcgV2FuZyAo
T1NTKQ0KPiA8emhpcGVuZy53YW5nXzFAb3NzLm54cC5jb20+IHdyb3RlOg0KPiANCj4gPiBIaSBG
cmFuaywNCj4gPg0KPiA+IE1ha2VzIHNlbnNlLCBJJ2xsIHJlc3RydWN0dXJlIGl0IHRoYXQgd2F5
IGZvciB0aGUgbmV4dCB2ZXJzaW9uOg0KPiA+DQo+ID4gIC0gTW92ZSBGYWJpbydzIElSUS1jb3Vu
dCB2YWxpZGF0aW9uIHVwIHNvIHRoZSBjb3VudCBpcyB2YWxpZGF0ZWQgYmVmb3JlDQo+ID4gICAg
dGhlIGRvbWFpbiBpcyBjcmVhdGVkLCBhbmQgYWRkIHByb3BlciBlcnJvciBoYW5kbGluZyB0aGVy
ZS4NCj4gPiAgLSBTaW5jZSB0aGUgaW52YWxpZCBjb3VudCBpcyB0aGVuIHJlamVjdGVkIGJlZm9y
ZSB0aGUgZG9tYWluIGV4aXN0cywNCj4gPiAgICB0aGUgZG9tYWluIGxlYWsgY2FuIG5vIGxvbmdl
ciBoYXBwZW4sIHNvIG1hbmFnaW5nIHRoZSBkb21haW4gd2l0aA0KPiA+ICAgIGRldm0gaXMgbm8g
bG9uZ2VyIGEgZml4LiBJJ2xsIGRyb3AgaXRzIEZpeGVzIHRhZyBhbmQgcmVmcmFtZSBpdCBhcyBh
bg0KPiA+ICAgIGltcHJvdmVtZW50Lg0KPiA+ICAtIE1vdmUgdGhhdCBkZXZtIGNvbnZlcnNpb24g
YWZ0ZXIgdGhlIG5ldw0KPiBkZXZtX2lycV9kb21haW5fY3JlYXRlX2xpbmVhcigpDQo+ID4gICAg
aGVscGVyLCB0b2dldGhlciB3aXRoIHRoZSBvdGhlciBjbGVhbnVwLg0KPiANCj4gTXkgbW90aXZh
dGlvbiBmb3Igc2VuZGluZyBbUEFUQ0ggdjQgMS8yXSBpcnFjaGlwL2lteC1pcnFzdGVlcjogQ29u
dmVydCB0bw0KPiBkZXZtX3BtX3J1bnRpbWVfZW5hYmxlKCkNCj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGttbC9hb1haZjJ6LTUwSDhyaW1JQGxpemhpLVByZWNpc2lvbi1Ub3dlci01ODEwLw0K
PiB3YXMgdGhlICJVbmJhbGFuY2VkIHBtX3J1bnRpbWVfZW5hYmxlISINCj4gZXJyb3IgZHVyaW5n
IGRyaXZlciB1bmJpbmRpbmcuDQo+IA0KPiBUaGlzIHdhcyBzZWVuIG9uIGtlcm5lbCA2LjE4LCBz
byBJIHdvdWxkIGxpa2UgdGhpcyBlcnJvciBmaXhlZCBpbiB5b3VyIHNlcmllcyB3aXRoDQo+IGEg
Rml4ZXMgdGFnLCBzbyBzdGFibGUga2VybmVscyBsaWtlIDYuMTggY2FuIGJlIGZpeGVkLg0KPiAN
Cj4gVGhhbmtzDQoNCkFncmVlZC4gRm9yIHY2IEkndmUgcHVsbGVkIHRoZSAiVW5iYWxhbmNlZCBw
bV9ydW50aW1lX2VuYWJsZSEiIGZpeCBvdXQNCmludG8gaXRzIG93biBwYXRjaCBzbyBpdCBjYW4g
YmUgYmFja3BvcnRlZCBvbiBpdHMgb3duOg0KDQogIGlycWNoaXAvaW14LWlycXN0ZWVyOiBDb252
ZXJ0IHRvIGRldm1fcG1fcnVudGltZV9zZXRfYWN0aXZlX2VuYWJsZWQoKQ0KICBGaXhlczogNDcz
MGQyMjMzMzExICgiaXJxY2hpcC9pbXgtaXJxc3RlZXI6IEFkZCBydW50aW1lIFBNIHN1cHBvcnQi
KQ0KDQpJdCBvbmx5IHRvdWNoZXMgcnVudGltZSBQTSAobm8gY2xvY2sgcmV3b3JrKSwgc28gaXQg
YXBwbGllcyBjbGVhbmx5IHRvDQo2LjE4LiBJdCB1c2VzIGRldm1fcG1fcnVudGltZV9zZXRfYWN0
aXZlX2VuYWJsZWQoKSB0byBkaXNhYmxlIHJ1bnRpbWUgUE0NCm9uIHVuYmluZCwgYW5kIGtlZXBz
IHRoZQ0KDQogIGlmICghcG1fcnVudGltZV9zdGF0dXNfc3VzcGVuZGVkKCZwZGV2LT5kZXYpKQ0K
ICAgICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKC4uLik7DQoNCmd1YXJkIGluIHJlbW92ZSgpIHNv
IHRoZSBjbG9jayByZWZlcmVuY2UgY291bnQgZG9lcyBub3QgdW5kZXJmbG93IHdoZW4NCnRoZSBk
ZXZpY2UgaXMgdW5ib3VuZCB3aGlsZSBydW50aW1lLXN1c3BlbmRlZCwgYXMgaW4geW91ciBwYXRj
aC4NCg0KVGhlIGNsb2NrIGRldnJlcyByZXdvcmsgKGRldm1fY2xrX2dldF9lbmFibGVkKCkgZXRj
LikgaXMgYSBzZXBhcmF0ZQ0KaW1wcm92ZW1lbnQgcGF0Y2ggbGF0ZXIgaW4gdGhlIHNlcmllcywg
c28gaXQgZG9lcyBub3QgZ2V0IGluIHRoZSB3YXkgb2YNCnRoZSBzdGFibGUgYmFja3BvcnQuDQoN
CkNvbXBhcmVkIHRvIHY1LCBJIGFsc28gbW92ZWQgZGV2bV9wbV9ydW50aW1lX3NldF9hY3RpdmVf
ZW5hYmxlZCgpIGJlZm9yZQ0KdGhlIElSUSBkb21haW4gaXMgY3JlYXRlZCwgc28gaXRzIGZhaWx1
cmUgcGF0aCBqdXN0IG5lZWRzIHRvIGJhaWwgb3V0DQppbnN0ZWFkIG9mIHVud2luZGluZyB0aGUg
ZG9tYWluIGFuZCB0aGUgcGFyZW50IElSUSBtYXBwaW5ncyBieSBoYW5kLg0KVGhpcyBkcm9wcyB0
aGUgZXJyX2lycSBsYWJlbCBhbmQga2VlcHMgdGhlIHBhdGNoIG1pbmltYWwsIG1hdGNoaW5nIHlv
dXINCm9yaWdpbmFsIHN0cnVjdHVyZS4NCg0KVGhhbmtzLA0KWmhpcGVuZw0K
