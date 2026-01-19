Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011002.outbound.protection.outlook.com [52.101.65.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E48527055D
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 10:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816803; cv=fail; b=r8MM31aAcpyfKnCDFwB2P36r3btm45uCPDzxG+iiYtQddrpJ2C+K6eVCV1/H86NftLsi2NWPIG4mbgBVzS7lU1qOEPN3XTRI/Y4PooK56zKxyHyR79ZVGZCG/SKaGCCRbbAkekMtqOqqB+L3wkebwh6ehXf5ggRmx05d+72DNio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816803; c=relaxed/simple;
	bh=zbAqS5GKMPZTgKHpUrXJIEKjQvazaOohZlyEeozbCGE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tcEGsh76wbMxXZ/IiYDtYOsRXiGMS/DqUjaxUA+/6rY+tMHMHHCK8LMdnE3dfS5UF55S1X2wrE1JPi4yHIwgq8/I/J76NRv98M2ZKgyTeutZJriLhtl2bL0D8J0OgPcFZzs8aAWG0i0QQtw3auf521YwfvlEsvMkzteUQbkS53k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hSvFj9y6; arc=fail smtp.client-ip=52.101.65.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hSvFj9y6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZFPAHDj3iE0QhCJ+5/KbPlWDp2zK3GMRRPqs83iKY9YGJMyASHCmm2dG8Fe27xCqfklg0giGMLWiR1F8gMRXCh7qAzv9Sx+TM8MwzLeUa0xnDfx2I/y4W368VO9JgdWCamq1siLQCGwLwSv/vMUL/tgp77q7ZSLsMdjPCcP8aP5m6kclaqFtgYzwG81z9BFoI720rdc/YL4cm7wUOOS0ONsXbStBE8EmIwYDomKBRSO7A3LUi7J7kwSZqLi6cZ0Sq1qmzpyAppb/1cKcFt/+kk0FWGqTbR6Of8iy5g0aUMxCBmY6xTBIyUYtbHxniTCAylMI4NL8FapgX2qykS+0BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbAqS5GKMPZTgKHpUrXJIEKjQvazaOohZlyEeozbCGE=;
 b=fgt+sXYtWGDmYyzkjxRDucWuBLXs3RyhRH/knf8lyoRUHuFTSVEIoMVyLuzoGyLSoi3x+hGPtSVik8rsRfjPMTzgm+62cYIvU0D2ez7n9ch0kLq+xrNUgHhtL85ULsIIt3mTG2cB+fqBfhozq6xnGiuMmDA3DN+SNfiQxdp+7KvJzB+tXvexaFlKBzTyeBJJKVYRCc5ZRFEqume/tIFX0/u6LzSNHSWodFPN7aVPPlCseahmVCnZHAlKFB3DXGlXqtJLiEWjkP84b1dBoAaMWDusKXAPCqkL6A1W6NxtfFgOT7pNQI1houyP8grocCHvo0lY0g276aYfwElCL6tlOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbAqS5GKMPZTgKHpUrXJIEKjQvazaOohZlyEeozbCGE=;
 b=hSvFj9y6mWaIomIQPQS4spXJaXO+/xLjQGOhK+70XL69tifkU3OWAvc8P89tQPCDmQb/fO7I+n+pY5Yis9y8p6+nRKk+U33ojjO2DTsUOSk37rvdBdB70GJp3pa6kDuAN7b9W8bivgiVY/ncw5WL6lZHpeehhPOiGNoSmQuKhwkLyEXDOhlED4Ra10bSb21NLrmBTdVfUV4iMY4dVAe1D2ipfUy9Iyr7k2edNJ7pherQ74oo/b7kK0Regink+EB/e/ID4nB3psWuX86kKeCpFSTYUEyujFfO+7vZ260tCYibshHt8zQFRWYehT3R6MWZE8R4qAagL16mcnsOZWG1og==
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by AS8PR04MB7893.eurprd04.prod.outlook.com (2603:10a6:20b:2ab::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 09:59:58 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 09:59:58 +0000
From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
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
	<xuegang.liu@nxp.com>
Subject: RE: [EXT] Re: [PATCH v1 1/4] clocksource/drivers/mmio: Export
 clocksource_mmio_init()
Thread-Topic: [EXT] Re: [PATCH v1 1/4] clocksource/drivers/mmio: Export
 clocksource_mmio_init()
Thread-Index: AQHciQ7SkFtag632wkigBCWWnmdG3rVZKJqAgAAZXcA=
Date: Mon, 19 Jan 2026 09:59:58 +0000
Message-ID:
 <AS8PR04MB84209D17F429C1F18C1726EEEB88A@AS8PR04MB8420.eurprd04.prod.outlook.com>
References: <20260119064118.2493736-1-zhipeng.wang_1@nxp.com>
 <20260119064118.2493736-2-zhipeng.wang_1@nxp.com>
 <CAEnQRZCaAp-nUEd8NnQmT7MU-Kx=usV1OSx8xtiQB3aWUFzYAw@mail.gmail.com>
In-Reply-To:
 <CAEnQRZCaAp-nUEd8NnQmT7MU-Kx=usV1OSx8xtiQB3aWUFzYAw@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8420:EE_|AS8PR04MB7893:EE_
x-ms-office365-filtering-correlation-id: a8089be5-9eeb-4696-9231-08de57418102
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|19092799006|7416014|7053199007|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?MDdUVzlyTDhQazVuYUtqYlEvZW9lVTZWYSs1UE5ONFJRMlU2Z0Qwc1BHQlYv?=
 =?utf-8?B?RVVHNldGY1ZYY2ZZSyt5NGc4cUtxcTB6SmhSR1VEY3hqODdaS0c3TGUyQWJh?=
 =?utf-8?B?dmRaMnkwVnhUNzRxSmdVNU9BQXVsZ0xqMFhFLzJCY1cydHR2NVE4Z2djUTc2?=
 =?utf-8?B?dGN0Yk1BUVhzbnNBMkJQcFI3dm50V2hUYm5ra1k1TWpnTktiQUJrU0dVUUVZ?=
 =?utf-8?B?RFlXSkRVWmc5VS9Jd1FRaUNpQWtHQTdvQWFyWEdiTWpFaWgxbmwrQXdBOEtV?=
 =?utf-8?B?YlJrZStETmRFSkFJR0Y5Z3Iwbnp3akdLN2dBb29oYmgvanFXU0s2aWtRQVBm?=
 =?utf-8?B?ZXJBWElkK3o4dTZTWTRKdGdmRXRWR0l2SGJTL2dkTGVTckRYNU16RlRNVjJq?=
 =?utf-8?B?ZlZxRTBGbWEzMjhRQm5CMjRiT0tkd0dHL2NubXB2RGNpV0JGSnRwTjVjN25t?=
 =?utf-8?B?cTlHcFhSQXB4MkUxTU5mZjJWYkdhNVh0QlpDWTlkTkxYRXBMVmpGNnpvR3lG?=
 =?utf-8?B?Y2dJR1RLc2VITFJXbDJhR1V6MWFFQllsTGNpLzJibjRPWlRnUFdnMlJVckVJ?=
 =?utf-8?B?VVBJVTRNeUduMWFzU3hQK1BOZEs3b2tIZmJoekdiWDFlN0FaWnMrUlZqSTEx?=
 =?utf-8?B?UjJKZ25UVHVwdE9SYzRpcmlneTh4aDRodVBlUVZMQzJabVNXWkFGR2M1eVgx?=
 =?utf-8?B?cHFsTW9CbkhMV1djelpJdWFncHpKV3prTTJ1elZFY2QrRkxvNlQ1WkRWQnY4?=
 =?utf-8?B?UjNmSGtPWTZtVWNIMmM4MVZkWWpxN0djQ3BwenIwRmhva1ZhQi9Qb1c0cHhh?=
 =?utf-8?B?NHo0Uy9IQ0dBQytRR2hyN3pZSi9sc1ZYaXVKWmdHL042bWZveTltd3gvV25J?=
 =?utf-8?B?dTlJRTNXbEMyZGQrM0tEemJ5c2M2UDB4aGt5SDFDdDBxOGM3US9wMnFaY09j?=
 =?utf-8?B?WnJoc0ZXMkJLbGM2bW11cndKdUpodlJyYm0rTXhkb24wYm1jVkpOeHNaM1NS?=
 =?utf-8?B?UDdaSnIvQU9xc2wrbkgycy9pbG9VOU9ETkNubVBMZm9FVHczT3BLZzRvMjFy?=
 =?utf-8?B?UEFTMzRBN1U2UlluZjROSktsSFY5TjlkU0hXR0pHSi8rUm56b0RCQlV3TnNj?=
 =?utf-8?B?eFI5eThYNitvUnpvclVxbUFYd1BTMkFCd2pqYUlONjY3d3A3ZmJnWHFUTHB1?=
 =?utf-8?B?R21KTFJWdWhyeVYybEx0Rm82b2dUQjNFUnlpTUhBRWxRcmNBcnYyVXc3OWg0?=
 =?utf-8?B?TmV5aGtTd1drRW93OEUwK09lLzhtaU5BM2RmMWdLdHdIaUhmNlFyZ0l2RjdE?=
 =?utf-8?B?R0NUOFV0WWFlcGVFVWl1VDZaVGJScWtFUkViYTVzMzNmdWFzM25WZFFoeE1C?=
 =?utf-8?B?UlJLUDlBeDlxYnYwem01Y0ZmdUJOT1phM05mL1NLdGhTdEZFeVlmRS9KVkt6?=
 =?utf-8?B?bnlHc25POUFjTXNQaFFpMHRhZGhkSUJTTU9pQ202c3JVRmQzQVBYSWpBL0ZU?=
 =?utf-8?B?YVh1NjRIRVNtSWtaQ2U4TkxFZFFEQ05UWmFsOEQ2bXFGanN5cWtpamZuOWt3?=
 =?utf-8?B?SFlIeXZPbFh4ckg2a0xaNDZtWS84cWNoV0p0VUswZ3F1dG9hSTdlKzZGeFZN?=
 =?utf-8?B?SytVdnlIL0E2b2x4Q2dlc0NNaHVNOHFCMjFMYU1VZnl3ZGMwUW10bmp1UXRP?=
 =?utf-8?B?NTRnTm1wSmRNV1Q0U3dQVHFJTDdEenFoZ1hlUTBEMzI4T0dpbHVsYmdDQjVG?=
 =?utf-8?B?a0V2MG5Ja3ZNcHJ5a1BXWGdoT3N6ekxLWmVrUXQ0cHBCeGNhOUl2Q1NrcGFK?=
 =?utf-8?B?dmlDYjRlYnJJZDByUkMvaHVOckhEYkFDbU03b044aVJQak5veE93cCs1T1Yv?=
 =?utf-8?B?SVRnZXIvZ2RWT1lDKy9IOUZWOWlzQWxJbEZEaDY5QXZLMElCRC9RQjJvV2d6?=
 =?utf-8?B?QllhNGd2K0ROVmRjS0NxZXVhdDEwdWUrbGZCZ3lPL3RXcS9RYWh0anN5d0dt?=
 =?utf-8?B?eXYvck1OR0RsMEt4NkdGWVFoYXRHUGI5Rm1PM0JYMFNnNmw2RkRtYzVVVlVr?=
 =?utf-8?B?bVpwR1IyVlFvOE5FNytERDZZYWxINWNBZHliVzNrN1NqNEFWaDlENnB5VGVG?=
 =?utf-8?B?T3FqTlNNQnVtd2wvZmEvQWxMNllyUkpqZXRNK1l0cHpYallJWHMvQUo3bWNJ?=
 =?utf-8?Q?AqoDLkxfkv755SpIvVprppQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(19092799006)(7416014)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UG1ITmVicTYrWlc3SjIrMFpBWUFHQ2o2WXlDZEk2cGhHWDVQUCs0bm4ydmJn?=
 =?utf-8?B?NDNsbTh2RElLV3MwUStuODhhd1V4eWpyMUYrVUJENTh4dGs5TEpYMjBRdUg0?=
 =?utf-8?B?Q2F5NDkvZnFEYkVQVDdQR2RvNytleWZtbjBHN3k2Ukg2T3V3YkUrd1pQSDJH?=
 =?utf-8?B?b25oaHMyMFdTWXV5S0MvZko0SWZjWGVLZWdIclpSaTFrN210UXhCY0lzYlEy?=
 =?utf-8?B?NmlJd2hjVkw0RCtRWVQyU0xUdjBKU3hBd2tQWEFjVFYzR0xKNUNhK1l5Zy92?=
 =?utf-8?B?UlZ6bnRDZkJwQVlYR2JrakxVYVJyZDlyUkRENWZkYUlGejNkWG85MDUxbDc3?=
 =?utf-8?B?bmZPVWE0UUxoRmF3UmY0azBVYWhnbFBza2JOaFAzc3RFbWRLdktoTGMzOU91?=
 =?utf-8?B?RzRYcDJNVXk2RHdsSkg3YTl4cldkS245b2FTZGF0eWhGdzdEbXViZVpZL1NY?=
 =?utf-8?B?MGMyUGF4eXVMK2o2WHVZVHgwT2dOMzFrTUFzWERjeHl6NWZQL2RDUFBpNDhq?=
 =?utf-8?B?aTJ4dzVKNFlCOE1RQUJtdldhSzg0OEFkU2h5b0tEU05saVF2YXdQRHA2a1NK?=
 =?utf-8?B?elA2K05RaFI3cXcydVVNNzlwV0ZKRlRHN2hrbWN0MnpLME9ZOHJXVGduWFZC?=
 =?utf-8?B?Zm12SU1zdGh5Z0ZGVXV4b1VhUHpGaC9WalVIdlNUcGw1bC96cGExODR2d1dY?=
 =?utf-8?B?RU1DTzNHSlk4aHVkRzBNemFReU1nUHFRdTQrODlWaC9iY2lnYm40RWw4MW5p?=
 =?utf-8?B?K3k3NytyallhVVNkNXdGS3VhNk42RmF3ek9GVnp4VmpnQXhSR0swQ0pHOFdv?=
 =?utf-8?B?UnVTSVBlYlhRMVo3RW5OVzlndnpDM2RyV2hsT1ZkY3N5YSswNVRTMFNuUVNR?=
 =?utf-8?B?NnFpNnROdG9KRzNRK0VpbXdzclk2aURjb2szQ0ZmWDVjdWVScm5Kdko0M2VD?=
 =?utf-8?B?NlJJMFVQTm9uUVZUTlhmNHdOeXJsbmo5ak5ra1dzWW9acERuRmk3MHJma0Np?=
 =?utf-8?B?L0FzbE5wa0FCV2pOSU1aUFRqOHhqTkRXRVp5VEdqakZIbnBwQ2tkNWNwNjEz?=
 =?utf-8?B?L2VUOUROYXlld3FheVJ3ZWhnSFpvRWNJVDdoZkxJeUswazVFSTJKS1pMZnk5?=
 =?utf-8?B?NlRzV1hVcGIxUUIzT3hseUVBY2xHanNiY3pTT3VPS1NVWGhxZWx6TUJBZitS?=
 =?utf-8?B?RGE2aGtpZGh1S1ZnaHpET2o2VjFaSzRrd1FhK1lyVHZxRWRMOTRMakRGemZH?=
 =?utf-8?B?YkMrUGlYWFJPeGhFbnVpeEp6WEdoZVo0bXFkK0NudmZjZWxKM0hRakp2RkJr?=
 =?utf-8?B?U3ZvNlVxREtqaDNzc05JblBvSWNuRldiZXpTbFRmRC84Z0dQeGU2UnhyOTVL?=
 =?utf-8?B?L0RXOXFrT0FUbUZhbjNKRzRlZnhvNy9tVXF2UzZYaThFQlR2bmkwY2lEU2s1?=
 =?utf-8?B?QXhxR2dVcTNvYnlmdTFydmpKdUUwaDVVVzJ3RVRuZ0d0U1BLMWpaRkZBTko5?=
 =?utf-8?B?dzNNNm1DZHhUcG1xYTkxR3dpR3pZT0JkdkVNbDNaWDdxOTg5OEJ1RVZUNlZX?=
 =?utf-8?B?WVRMZ2tuM29EQ3JpSnJaTS93dXN5SFFNTjM3dlFrTGdxWlQ4bEh5KzhTVFpO?=
 =?utf-8?B?dzJIdmhySGlVbWNnbk5IaExGS0gyOFRvUFhnR0RlTVZ4dm1nUGV1SkVtWG1H?=
 =?utf-8?B?dTVyR0hieHJ5R3publQ3cHlleENSTXp2cjExK1d2YkJ3VmNhYSt3VjR5dTFr?=
 =?utf-8?B?TkZOV2lueEMrWnMrbHRXeElmVmt0QnRRTit6YkRmNjY0RkpYTTRrRGVVSzg4?=
 =?utf-8?B?bjdsQy9iUkVmVHExMEpKd0FNWURUeE1QZUZyWUZVTE9QSDY2QlQrU3Y0SjhC?=
 =?utf-8?B?TFUvajVxc1hOZkZieDJ6TzNZRGx5K0F1ak1PK2pDdFNXYjZYUE1XbWZGdEEw?=
 =?utf-8?B?Sk5ONzZ5b2JuZGViTXBuOEJpcUt2M0pRRHRXa05IV2RkRE5XY1M1cnhmbDlw?=
 =?utf-8?B?Wk9DYXFTRThrLytMZzNHVmFweEI5TjFtenlvNHBrcW1QaWQxOXhRbWkyano1?=
 =?utf-8?B?WjAxODhuSmFrOXVyUGFuMDhFWWhTazVJc05sa3hjSkwwQnJYRHE0YzlORUhC?=
 =?utf-8?B?N3ExSXpTOTRSYVNIRzl3WFp1MUM5Q0ZtZlhiTUJoUG10Tmc0RzdnZ04veVk3?=
 =?utf-8?B?cTJrd29GWWlEaTYzSnhTVjBWWVdJMWhHd0JxYkNEcmNQNHo4bTgyckJ6MWxL?=
 =?utf-8?B?QmRpQWZzNU9GUUoxajBIbHdXZEtWUTUyOFZ4YzduTWd0NjgxMm9SMkRRc2N2?=
 =?utf-8?B?UUZ1ZGRMNGYwUllQck4xSWs5YzlUWmhKdnRxNmFiWHc1MTNqOXI5QT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a8089be5-9eeb-4696-9231-08de57418102
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2026 09:59:58.1468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ACvskbnjyp5Uj7PDo0ckKRkk71KmqmMHi3dXK0FcxYxFwzrAvB70YCQlVlWIRKGRRO8Sh0UUME+1JRvltydsBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7893

SGkgRGFuaWVsLA0KDQpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuIEkgaGF2ZSBhZGRlZCBteSBT
aWduZWQtb2ZmLWJ5IHRvIGFsbCBwYXRjaGVzDQppbiB0aGUgc2VyaWVzIGFuZCBzZW50IG91dCB2
Mi4NCg0KDQpCZXN0IHJlZ2FyZHMsDQpaaGlwZW5nIFdhbmcNCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBEYW5pZWwgQmFsdXRhIDxkYW5pZWwuYmFsdXRhQGdtYWlsLmNv
bT4NCj4gU2VudDogMjAyNuW5tDHmnIgxOeaXpSAxNjoyNw0KPiBUbzogWmhpcGVuZyBXYW5nIDx6
aGlwZW5nLndhbmdfMUBueHAuY29tPg0KPiBDYzogZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZzsg
dGdseEBrZXJuZWwub3JnOyBzaGF3bmd1b0BrZXJuZWwub3JnOw0KPiBzLmhhdWVyQHBlbmd1dHJv
bml4LmRlOyBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IGZlc3RldmFtQGdtYWlsLmNvbTsNCj4gbWF0
dGhpYXMuYmdnQGdtYWlsLmNvbTsgYW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEu
Y29tOw0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBpbXhAbGlzdHMubGludXguZGV2
Ow0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGNodW4taHVuZy53dUBtZWRpYXRlay5jb207IHdhbHRl
ci5jaGFuZ0BtZWRpYXRlay5jb207DQo+IGpzdHVsdHpAZ29vZ2xlLmNvbTsgYW1lcmduYXRAYmF5
bGlicmUuY29tOyBBaXNoZW5nIERvbmcNCj4gPGFpc2hlbmcuZG9uZ0BueHAuY29tPjsgSmluZG9u
ZyBZdWUgPGppbmRvbmcueXVlQG54cC5jb20+OyBYdWVnYW5nIExpdQ0KPiA8eHVlZ2FuZy5saXVA
bnhwLmNvbT4NCj4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSCB2MSAxLzRdIGNsb2Nrc291cmNl
L2RyaXZlcnMvbW1pbzogRXhwb3J0DQo+IGNsb2Nrc291cmNlX21taW9faW5pdCgpDQo+IA0KPiBb
WW91IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIGRhbmllbC5iYWx1dGFAZ21haWwuY29tLiBM
ZWFybiB3aHkgdGhpcyBpcw0KPiBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91
dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4gDQo+IENhdXRpb246IFRoaXMgaXMgYW4gZXh0ZXJu
YWwgZW1haWwuIFBsZWFzZSB0YWtlIGNhcmUgd2hlbiBjbGlja2luZyBsaW5rcyBvcg0KPiBvcGVu
aW5nIGF0dGFjaG1lbnRzLiBXaGVuIGluIGRvdWJ0LCByZXBvcnQgdGhlIG1lc3NhZ2UgdXNpbmcg
dGhlICdSZXBvcnQgdGhpcw0KPiBlbWFpbCcgYnV0dG9uDQo+IA0KPiANCj4gT24gTW9uLCBKYW4g
MTksIDIwMjYgYXQgODo0MuKAr0FNIFpoaXBlbmcgV2FuZyA8emhpcGVuZy53YW5nXzFAbnhwLmNv
bT4NCj4gd3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBDaHVuLUh1bmcgV3UgPGNodW4taHVuZy53dUBt
ZWRpYXRlay5jb20+DQo+ID4NCj4gPiBFeHBvcnQgY2xvY2tzb3VyY2VfbW1pb19pbml0KCkgYW5k
IGNsb2Nrc291cmNlX21taW9fcmVhZGxfdXAoKSB0bw0KPiA+IHN1cHBvcnQgYnVpbGRpbmcgY2xv
Y2tzb3VyY2UgZHJpdmVyIGFzIG1vZHVsZSwgc3VjaCBhcw0KPiA+IHRpbWVyLW1lZGlhdGVrLmMu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHVuLUh1bmcgV3UgPGNodW4taHVuZy53dUBtZWRp
YXRlay5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogV2FsdGVyIENoYW5nIDx3YWx0ZXIuY2hhbmdA
bWVkaWF0ZWsuY29tPg0KPiA+IEFja2VkLWJ5OiBKb2huIFN0dWx0eiA8anN0dWx0ekBnb29nbGUu
Y29tPg0KPiANCj4gSGkgWmhpcGVuZywNCj4gDQo+IFBsZWFzZSBhZGQgeW91ciBTaWduZWQtb2Zm
LWJ5IHRhZyAoZXZlbiBpZiB5b3UganVzdCBwdWxsZWQgdGhpcyBwYXRjaCBmcm9tDQo+IGFub3Ro
ZXIgdHJlZSkgVGhpcyBjb21tZW50IGFwcGxpZXMgdG8gYWxsIHBhdGNoZXMgaW4gdGhlIHNlcmll
cy4NCg==
