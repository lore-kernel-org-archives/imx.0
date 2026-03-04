Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013065.outbound.protection.outlook.com [52.101.83.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785C9342CA2
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 07:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772608957; cv=fail; b=uCnl51I2CkUm8TWXwTiKuNeE9qvo6XqAGM2fLDXBvxyK/ML6W2P+Ng91To+WQl472pStig4dMmDHvFXznNvPHMr7VRvEnt44gMjMX6EB8RfKUxpY5dyey+2zy7Dna1j1jWDEj/7uqoeGpTiznhrcQuIkyCCCb8uiYA+1NAQSTTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772608957; c=relaxed/simple;
	bh=XAtv9qKaK931wgIfNr1WfonS/IC4rdciheHV0qiMIms=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dkbRV6chPPAxENePSXtoeghRJeWfBSCSasCYqQtHQ/te7C8629nBtbdnlgkZmoaKbVu3KJG3eGiS406ARKAfzS5QJP04CCHX3XgbGWZJbabT3RcLfG3ly3B7fihMCEFNTheNL8bSVot1HR4XZLr9CFwRFnz+wiFbmCvNj1FuKqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GoxisNP0; arc=fail smtp.client-ip=52.101.83.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GoxisNP0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GpUjmPysYipMTjoGs2tvFT0s3KfA+BA6doPsX6KEWIlkrtBqTN8qIaRG0nabbzCP+iq1Of9Ip6G+lNbN2KVdgotFuJ05KqhJ7NV0wekoFNvTv9VbluE4nR41T/B/Wc85USL8xZHrwyHY/CHO+P9BQupLsv7Js3A6Xk2fmy5DPpF+nzWVOuBfS2DANwyYtURT+NoQBT0DyyU4psue7TTngPf0jIn0gzQdjEgavipF9mmopgqrqYUA05vM1c8UcNVoApbwy8HrRi3kxe7pQd77xMjCFjAu6ME0kQo73EZ/DyEIacYqwLbc4ou14pFuq/OOgYn7YT/xaZOENf7bIJ+3TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XAtv9qKaK931wgIfNr1WfonS/IC4rdciheHV0qiMIms=;
 b=eBvTx6qkMdTSZPrH9m7T3nfRWQ7BDK1mhJilw5MbVAjKn68qlMduuFiCJKITm6AOzHw1M1+7znB0mQk98HfA9qbFRUJC+eItFVlG5VOqBLz+DnUd8Qatcnm9lEKRPbG7O532lfny8NIUFPdUGwiddHMDIAgFhhfBPmA2Rr7hnHJI/Pbb3wsldrchyqHoRdtZsOrYEdiD/2A87DrcUlI5yTVerPnr2GN0NTIa0WiSHGg7Cjcg0HgJwN41qX/Zf9z1Xf1Ds+N/TIlY6YWBuEsjAolndbf6G/rdvk5dVLTsH3EifPg607OlgVQ+cee85J2QETHikZq2dtMP2TBBnmxBSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XAtv9qKaK931wgIfNr1WfonS/IC4rdciheHV0qiMIms=;
 b=GoxisNP0fRVGXs9+/QndSHbFAEUcRcGF/u7lNkBtKbCODDwotIbLaHnTu9fQ61Pq38nYa9/+dq+6drQFiQwKrL8mXEOeVtSfJqCkQCAtpvZDS1TZ1v+DYm+YENgjMfBRUDKMH68pef/JxmkqwD9xstI4apV5Lren3c/o0mjZk0abldUKhZvW21TWb70HBflPzvWQHnKWH+bQoygOhHexgFDWGrWNUpxbgJQ9JmG/ri8tcc7UkpNe77uqpBDxySFf24LWBGsumA87NqeTod/cUE1UkNyeP1RELs27Ivo+h1oyD7yZUBm9ENQuGas3aEGr3CuMjLwJM4NvPQtU6q+d3g==
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by PA2PR04MB10129.eurprd04.prod.outlook.com (2603:10a6:102:3ff::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 07:22:31 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 07:22:31 +0000
From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
To: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>,
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, "tglx@kernel.org"
	<tglx@kernel.org>
CC: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "chun-hung.wu@mediatek.com"
	<chun-hung.wu@mediatek.com>, "walter.chang@mediatek.com"
	<walter.chang@mediatek.com>, "jstultz@google.com" <jstultz@google.com>,
	"amergnat@baylibre.com" <amergnat@baylibre.com>, Aisheng Dong
	<aisheng.dong@nxp.com>, Jindong Yue <jindong.yue@nxp.com>, Xuegang Liu
	<xuegang.liu@nxp.com>
Subject: RE: [EXT] Re: [PATCH v3 0/4] clocksource: Add module support for
 timer drivers
Thread-Topic: [EXT] Re: [PATCH v3 0/4] clocksource: Add module support for
 timer drivers
Thread-Index: AQHcq4LAD60V7dO170ik839d3u3FI7Wd29WAgAAWQgA=
Date: Wed, 4 Mar 2026 07:22:31 +0000
Message-ID:
 <AS8PR04MB8420DC3D992C8966B5BA71FCEB7CA@AS8PR04MB8420.eurprd04.prod.outlook.com>
References: <20260304025720.2583655-1-zhipeng.wang_1@nxp.com>
 <2387f306-d7df-41a6-a526-d5bc56ae1c06@oss.qualcomm.com>
In-Reply-To: <2387f306-d7df-41a6-a526-d5bc56ae1c06@oss.qualcomm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8420:EE_|PA2PR04MB10129:EE_
x-ms-office365-filtering-correlation-id: cc9b4239-25f7-41bb-0195-08de79becc48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|366016|7053199007|38070700021;
x-microsoft-antispam-message-info:
 qw3zdP8hI648YULdKihB4ac0s3lRxpo9Hwv21LDMbd0Kmy23AzPrpifaSnykdPBoFCl5MSrKrUNruOEaLGf7TGm0AtOi0b5HizgfFsNjXhEs1uONobCNfLg5YH3cpqe2cwizmsuJJ89JQqcVp72/ksBCokNWCqVLBCJpFuTdwoVQKS53cbBA/ACbaM+uqsYJqp2aXNhkWO82waPbphlMarATiL2hbO6ZLILuktbG7UYYl5WLPp6U2OxCSXoSoolXWvK8qcB1bya2DYzKoYne0HYJorY/xDF5BOYfObDQGSs6gexiCXqppvUEMrBLjCqrh0iPRHiGg6kExRZlwOntsSY+TS7W0MIiDX6AYWlhSEbtR+tIVLMKHNJcXpuH4GpU/QemckkRZm8om5v8Mqc2Q6gDP62xdl1q4GaxXqFQ18H6HEdjvkIO1OnwILttQ7sHuDhZot2d0CKQ/aGEJv1SDFzKHdBjtoH1TRDYUUqqet2KhpZUzjJDSTKweMUfe50S2dfEHEpkmr3pPPG4VEQkEkeOGMZQ3Hs6MDm63+ph60MtWjRYECjKqF3osuMJ1UKfdY6ax+nlE0U4Y55dJa4UaPOb7o1H4ux/ldhn7R7LqrGLQphicyMqIfdrXqgM/tFhf7tDI+PYyyFphKdJF/+timirs3vpvmevi6Sxifms2F/Sb0Y9NJKWiTZmRH50pNM4UvVbbKv29FlqzEPSAP6FBO4RxvlpsRG96+XF7HslOUo8SUwMMeVnHDVeb5Oa5WtRrk2sSeLtVWRFqyyXkvUZ87DpoIifSJrb71MBQmioBac=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(366016)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?amVoYTZyMnk0dkYvVlVjd2tOYjVjWnZiYU51TjY3K0M5Y2dRR2VEcWNjNHNH?=
 =?gb2312?B?a3MzRlNieVlycGQzQ01aWURJOURldGFVa1p5MURSMUo1OXBxNzNXdGJyUWNM?=
 =?gb2312?B?R21uTXJyNFBRSEl3WnhHb2lCWEExTFczVVBFa2ZMbytPVW8yc2RzMVZmN1NS?=
 =?gb2312?B?S3VIdmV3VEo1bnJJTG5MTndmOEFEVnAyRkNySTJNMVFURExMamFkWGJDV3h0?=
 =?gb2312?B?ZHZBSmwyQ1RMZHc5OElrdjZOdjFuUWpwNTc1SmVoeUNFUVVQUG14YVU5cnla?=
 =?gb2312?B?b1RoSXVVN2xhL29PSlh2UEFEbGFuZzhoTmhqcUlIcjRIeEIyRjNuVUI2VnQz?=
 =?gb2312?B?Wi9iTXpsYzIzOUp4elBDWW1sKzVNTDZjcmNCVXNIbTAxZUNyMjVta1dJOVcx?=
 =?gb2312?B?dGZwUk4rWExiV3JJKzh4QUYraE5DN2xiaEhDQWtoYUNWUHZZYU51TGJZNTlj?=
 =?gb2312?B?OWpBbjY4M3NpYUo5NFMxR3luRzNqeVZRQXNocksxQnN5UGwzQWZEQTFWWnhL?=
 =?gb2312?B?YlFwOFRjY3dubmJpSkpFVmdrVzdXNE44T1BvTFMzQjhnbUV6Q0JNOUFJSm1x?=
 =?gb2312?B?UGRLa2pDdXc4dmdReWhKR0FSQ2pqMGtqNjMvc0QwZXNBTlR1TFoxakl5NzU2?=
 =?gb2312?B?VXhyL0UzRVFlUlEwQjdaendPb3pOaTVEV0oxcUIvM0RZSEwzZCtHYTlXMVQ5?=
 =?gb2312?B?SDliWk1MaC9jM0h1TTI2QjRvcmMxaElYTTR6cktxQStoRTRGcmVXNmJ3ek5Q?=
 =?gb2312?B?SEw3QnRndk5qVlRINytYdDV5UkIzT0tRS3BnbTNBbDkzTmg0RjlYR3FoaVFE?=
 =?gb2312?B?aWVzL0tLa3FoUndkb1ZXeXp4dmdWdEdhWmU2cHZzUFlPaHErTFZBdnhjTmRW?=
 =?gb2312?B?cVRDb0p3dUhaZnRUd2x2Qk5FUGw0bHM1ZEkyNTl1M09USWZJRVQyVTRxNVh5?=
 =?gb2312?B?TTNKYVpjYjRXanRCdFEwcXltR3AyaG05cWo1SUMzZmJFemRPY2NGVE14dklo?=
 =?gb2312?B?emlDalpoL0MyQVhqeXRpRHNZZ3hjVkk2d3RtUzJSeGxJeDUrS3dwQjc2Y2Vl?=
 =?gb2312?B?VWYxdmpvY0Q0bWFLY2EvRVFkWHBwVWJkWk9lZzI2ZWtIV3ErTnRDK1ljVU5m?=
 =?gb2312?B?eXZlVlQ5S2dmdWw0NXpxREx6aUlnTjZTTVVhZ1FMdFRTODNTcDlPVExBMEtq?=
 =?gb2312?B?MUJOaGZFb1dzTmZoMnp6RXBhc2QzWTRzTlFTc0dXdUtHMWk2bCtpV2U5WVZM?=
 =?gb2312?B?akZmZi9kYWc1Si8yaldacXdpamRHWnMrM1hCU0tXQUNlWkQzVVBGU285UVE4?=
 =?gb2312?B?OTNBOVFnNmYwZ0Q2eWhETVVoNkV6bExPREJVRzl5RnVVQlloRVNzRnZoV3RP?=
 =?gb2312?B?d3J3TDJyVWh6eHBuRWlWQ2o1ZE05RVVQU0FQSEJRNUlWb09GWWU0NEtQNmZT?=
 =?gb2312?B?U2VJc3grdmhSeTdFQUd4OEpDRGg3TFV3TkR4THp4cU01Umd6dmJqRWx1bWRM?=
 =?gb2312?B?a284TVhSMmh0dzdSd1VjYlRuMVByUXp3ZkpORmZEMC9QZHhnVnNiWmQ4M3Vh?=
 =?gb2312?B?alpXbFdnSGxPNkU2V0g0U291ZGJPTThkSUQ1eXBYNTYwaUs0SkdhWjV0MGlt?=
 =?gb2312?B?b0Y4R2d0SktJT0xObVVRcnBIUnhicHlQV2RkWDFzeUR2eVdaZ2FieG96L3Mr?=
 =?gb2312?B?d1M0OWVveXR5Qnc5RytTRlRUZlFnMWxUNlIzS3VYcytrR0lWdW9Tb2ROdjBj?=
 =?gb2312?B?cVJJTzZ3Qk82MlpySm9XcENpQVBIN0IvWFVRTHdDb0hUTDIzdDE5cG5vcEMy?=
 =?gb2312?B?S0FwNUhMQXVDWnlMMG5ZaFIrRVA2N0RCeHduajQ1SmhIVkZEYVRNc1BLNXBm?=
 =?gb2312?B?dksxT09ETlJzUFRVa05IbyswaDFrR0o1Tk5ON0lUM3ZXWTFTUklnWW5MbTk1?=
 =?gb2312?B?eEhTYlhlanhsdmFhS2trdXZleVJCWUExZlB0cHRRWnF0MnNEUS9PNlRLSDY4?=
 =?gb2312?B?QXFrc0x2T0FSdEpEWTBhRHVvSThoZ3NtQU9mbVRwZXJaeFpCeHdjNVl3UlY3?=
 =?gb2312?B?VmVGTGdJWGN5YUZwVGNkWTF1SGVna0QyTXI5dzNyRWtMWkYyeU00NWI0Nm9x?=
 =?gb2312?B?S3NNZnJFdGJnam53VnZPeml5bVE5ZzhhYU5YYnN2WG9qelZqQ2xhNjFSUG1X?=
 =?gb2312?B?MnhJTHZWZUkydzB5dmxvcER1NS9Ya05uZzdGaE9pUXNjOWFmTnp0aEQ3U0RD?=
 =?gb2312?B?ZWVNajQzb2FuNlhrajVoMVVIQ2lJbDQ2Qmpmcnl3V1QzNmduM3BZMU5GSFYw?=
 =?gb2312?B?L3ZkK2pYZHdDb09hdzlxOVBVT09PZjBKTUt1TzhEK2RjK2Y5Qjlkdz09?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8420.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9b4239-25f7-41bb-0195-08de79becc48
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 07:22:31.0992
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: olGeF94t5si1z4W9yd9hXOkjhziiu5+Fc0lfXa5eCl3snu9HClQMkKW+2idtWmAxtd3/z3gskqQLa734rb0ZAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10129

SGVsbG8gVHJpbG9rLA0KDQpUaGFuayB5b3UgZm9yIHRoZSBmZWVkYmFjay4NCg0KWWVzLCBNZWRp
YVRlayBTb0NzIGhhdmUgQVJNIGFyY2hpdGVjdHVyYWwgdGltZXJzLiBUaGUgdGltZXItbWVkaWF0
ZWsNCmRyaXZlciBwcm92aWRlcyBhbiBhbHdheXMtb24gc3lzdGVtIHRpbWVyIHRoYXQgY29tcGxl
bWVudHMsIHJhdGhlciB0aGFuDQpyZXBsYWNlcywgdGhlIEFSTSBhcmNoaXRlY3RlZCB0aW1lci4N
Cg0KSSB3aWxsIHNlbmQgdjQgd2l0aCBhbiB1cGRhdGVkIGNvdmVyIGxldHRlciB0byBjbGFyaWZ5
IHRoaXMuDQoNCkJScywNClpoaXBlbmcNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IFRyaWxvayBTb25pIDx0cmlsb2trdW1hci5zb25pQG9zcy5xdWFsY29tbS5jb20+
DQo+IFNlbnQ6IDIwMjbE6jPUwjTI1SAxMzo0MQ0KPiBUbzogWmhpcGVuZyBXYW5nIDx6aGlwZW5n
LndhbmdfMUBueHAuY29tPjsgZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZzsNCj4gdGdseEBrZXJu
ZWwub3JnDQo+IENjOiBzaGF3bmd1b0BrZXJuZWwub3JnOyBzLmhhdWVyQHBlbmd1dHJvbml4LmRl
OyBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7DQo+IGZlc3RldmFtQGdtYWlsLmNvbTsgbWF0dGhpYXMu
YmdnQGdtYWlsLmNvbTsNCj4gYW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29t
OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBpbXhAbGlzdHMubGludXguZGV2OyBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmc7IGNodW4taHVuZy53dUBtZWRpYXRlay5jb207DQo+IHdhbHRlci5j
aGFuZ0BtZWRpYXRlay5jb207IGpzdHVsdHpAZ29vZ2xlLmNvbTsgYW1lcmduYXRAYmF5bGlicmUu
Y29tOw0KPiBBaXNoZW5nIERvbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPjsgSmluZG9uZyBZdWUN
Cj4gPGppbmRvbmcueXVlQG54cC5jb20+OyBYdWVnYW5nIExpdSA8eHVlZ2FuZy5saXVAbnhwLmNv
bT4NCj4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSCB2MyAwLzRdIGNsb2Nrc291cmNlOiBBZGQg
bW9kdWxlIHN1cHBvcnQgZm9yIHRpbWVyDQo+IGRyaXZlcnMNCj4gDQo+IFtZb3UgZG9uJ3Qgb2Z0
ZW4gZ2V0IGVtYWlsIGZyb20gdHJpbG9ra3VtYXIuc29uaUBvc3MucXVhbGNvbW0uY29tLiBMZWFy
bg0KPiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNl
bmRlcklkZW50aWZpY2F0aW9uIF0NCj4gDQo+IENhdXRpb246IFRoaXMgaXMgYW4gZXh0ZXJuYWwg
ZW1haWwuIFBsZWFzZSB0YWtlIGNhcmUgd2hlbiBjbGlja2luZyBsaW5rcyBvcg0KPiBvcGVuaW5n
IGF0dGFjaG1lbnRzLiBXaGVuIGluIGRvdWJ0LCByZXBvcnQgdGhlIG1lc3NhZ2UgdXNpbmcgdGhl
ICdSZXBvcnQNCj4gdGhpcyBlbWFpbCcgYnV0dG9uDQo+IA0KPiANCj4gT24gMy8zLzIwMjYgNjo1
NyBQTSwgWmhpcGVuZyBXYW5nIHdyb3RlOg0KPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGVuYWJsZXMg
Y2xvY2tzb3VyY2UgdGltZXIgZHJpdmVycyB0byBiZSBidWlsdCBhcw0KPiA+IGxvYWRhYmxlIGtl
cm5lbCBtb2R1bGVzLCB3aGljaCBpcyBwYXJ0aWN1bGFybHkgdXNlZnVsIGZvciBHS0kgKEdlbmVy
aWMNCj4gPiBLZXJuZWwgSW1hZ2UpIGNvbmZpZ3VyYXRpb25zLg0KPiA+DQo+ID4gVGhpcyBzZXJp
ZXMgaXMgYmFzZWQgb24gdGhlIHByZXZpb3VzIE1lZGlhVGVrIHRpbWVyIG1vZHVsYXJpemF0aW9u
IHdvcms6DQo+ID4gTGluazoNCj4gPiBodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9u
Lm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsb3JlDQo+ID4gLmtlcm5lbC5vcmclMkZh
bGwlMkYyMDIzMDUxNzAyMjU1Ny4yNDM4OC0xLXdhbHRlci5jaGFuZyU0MG1lZGlhdGVrLmMNCj4g
b20NCj4gPiAlMkYmZGF0YT0wNSU3QzAyJTdDemhpcGVuZy53YW5nXzElNDBueHAuY29tJTdDM2M2
MDA1NjljZjJjNDVmDQo+IGU3NmQzMDhkZQ0KPiA+DQo+IDc5YjA5NDAxJTdDNjg2ZWExZDNiYzJi
NGM2ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzOTA4MTkNCj4gOTY0NjU2MDU2DQo+ID4N
Cj4gNjglN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKRmJYQjBlVTFoY0draU9uUnlkV1VzSWxZ
aU9pSXdMakENCj4gdU1EQXdNQ0kNCj4gPg0KPiBzSWxBaU9pSlhhVzR6TWlJc0lrRk9Jam9pVFdG
cGJDSXNJbGRVSWpveWZRJTNEJTNEJTdDMCU3QyU3QyU3QyZzZGENCj4gdGE9bA0KPiA+IFkwcGRU
eE15emJab3NwZ29XWkhiNHNPRlR3ZGw4NHBKWHh2UnQ0Zk4zSSUzRCZyZXNlcnZlZD0wDQo+IA0K
PiBZb3UgYXJlIG5vdCBleHBsYWluaW5nIGNsZWFybHkgb24gdGhlIHdoeSBwYXJ0PyBEb2VzIE1U
SyBkb2Vzbid0IGhhdmUgQVJNDQo+IGNvbXBsaWFudCB0aW1lcnMgYW5kIGR1ZSB0byB3aGljaCB5
b3UgaGF2ZSBzcGVjaWZpYyB0aW1lciBkcml2ZXI/DQo+IA0KPiBJdCBpcyBub3QgY2xlYXIuDQo+
IA0KPiANCj4gPg0KPiA+IFRoZSBzZXJpZXMgaW5jbHVkZXM6DQo+ID4gMS4gRXhwb3J0IG5lY2Vz
c2FyeSBmdW5jdGlvbnMgZnJvbSBjbG9ja3NvdXJjZS9tbWlvIDIuIFJlbW92ZSBfX2luaXQNCj4g
PiBtYXJraW5ncyBmcm9tIHRpbWVyLW9mIHRvIHN1cHBvcnQgbW9kdWxlcyAzLiBDb252ZXJ0IE1l
ZGlhVGVrIHRpbWVyDQo+ID4gZHJpdmVyIHRvIHN1cHBvcnQgbW9kdWxlIGJ1aWxkIDQuIENvbnZl
cnQgaS5NWCBUUE0gdGltZXIgZHJpdmVyIHRvDQo+ID4gc3VwcG9ydCBtb2R1bGUgYnVpbGQNCj4g
Pg0KPiA+IFRlc3RpbmcgcGVyZm9ybWVkOg0KPiA+IC0gQnVpbHQgYW5kIHRlc3RlZCBvbiBpLk1Y
OFVMUCBwbGF0Zm9ybQ0KPiA+IC0gQnVpbHQgYW5kIHRlc3RlZCBvbiBNZWRpYVRlayBwbGF0Zm9y
bQ0KPiA+IC0gVmVyaWZpZWQgYm90aCBidWlsdC1pbiBhbmQgbW9kdWxlIGNvbmZpZ3VyYXRpb25z
DQo+ID4gLSBDb25maXJtZWQgdGltZXIgZnVuY3Rpb25hbGl0eSBpbiBib3RoIGNvbmZpZ3VyYXRp
b25zDQo+ID4NCj4gPiBDaGFuZ2VzIGluIHYzOg0KPiA+IC0gUmV3b3JkZWQgc3VtbWFyeSBsaW5l
IGZvciB0aW1lci1tZWRpYXRlayBkcml2ZXIgYXMgc3VnZ2VzdGVkLg0KPiA+IC0gSW1wcm92ZWQg
Y29tbWl0IG1lc3NhZ2UgZm9ybWF0dGluZyAobGluZSB3cmFwcGluZykuDQo+ID4gLSBObyBmdW5j
dGlvbmFsIGNoYW5nZXMgdG8gdGhlIGNvZGUuDQo+ID4NCj4gPiBDaGFuZ2VzIGluIHYyOg0KPiA+
IC0gQWRkZWQgU2lnbmVkLW9mZi1ieSBmcm9tIHN1Ym1pdHRlciAoWmhpcGVuZyBXYW5nKSB0byBh
bGwgcGF0Y2hlcw0KPiA+ICAgYXMgcmVxdWVzdGVkIGJ5IHJldmlld2Vycw0KPiA+DQo+ID4gQ2hh
bmdlcyBpbiB2MToNCj4gPiAtIEZpeGVkICd1bnNpZ25lZCcgdG8gJ3Vuc2lnbmVkIGludCcgaW4g
Y2xvY2tzb3VyY2VfbW1pb19pbml0KCkNCj4gPiAtIENoYW5nZWQgTU9EVUxFX0xJQ0VOU0UgZnJv
bSAiR1BMIHYyIiB0byAiR1BMIiBmb3IgbWVkaWF0ZWsgZHJpdmVyDQo+ID4gLSBBZGRlZCBpLk1Y
IFRQTSB0aW1lciBkcml2ZXIgbW9kdWxlIHN1cHBvcnQNCj4gPg0KPiA+IENodW4tSHVuZyBXdSAo
Myk6DQo+ID4gICBjbG9ja3NvdXJjZS9kcml2ZXJzL21taW86IEV4cG9ydCBjbG9ja3NvdXJjZV9t
bWlvX2luaXQoKQ0KPiA+ICAgY2xvY2tzb3VyY2UvZHJpdmVycy90aW1lci1vZjogUmVtb3ZlIF9f
aW5pdCBtYXJraW5ncw0KPiA+ICAgY2xvY2tzb3VyY2UvZHJpdmVycy90aW1lci1tZWRpYXRlazog
Q29udmVydCB0aW1lci1tZWRpYXRlayB0byBhDQo+ID4gICAgIGxvYWRhYmxlIG1vZHVsZQ0KPiA+
DQo+ID4gSmluZG9uZyBZdWUgKDEpOg0KPiA+ICAgY2xvY2tzb3VyY2UvZHJpdmVycy9pbXgtdHBt
OiBTdXBwb3J0IGJ1aWxkaW5nIGlteC10cG0gZHJpdmVyIGFzDQo+ID4gbW9kdWxlDQo+ID4NCj4g
PiAgZHJpdmVycy9jbG9ja3NvdXJjZS9LY29uZmlnICAgICAgICAgIHwgIDQgKystLQ0KPiA+ICBk
cml2ZXJzL2Nsb2Nrc291cmNlL21taW8uYyAgICAgICAgICAgfCAgOCArKysrLS0tDQo+ID4gIGRy
aXZlcnMvY2xvY2tzb3VyY2UvdGltZXItaW14LXRwbS5jICB8IDM2DQo+ID4gKysrKysrKysrKysr
KysrKysrKysrKysrKy0tLSAgZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1tZWRpYXRlay5jIHwN
Cj4gMzMgKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+ICBkcml2ZXJzL2Nsb2Nrc291cmNl
L3RpbWVyLW9mLmMgICAgICAgfCAyMyArKysrKysrKystLS0tLS0tLS0NCj4gPiAgZHJpdmVycy9j
bG9ja3NvdXJjZS90aW1lci1vZi5oICAgICAgIHwgIDYgKystLS0NCj4gPiAgNiBmaWxlcyBjaGFu
Z2VkLCA4OCBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkNCj4gPg0KDQo=
