Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012005.outbound.protection.outlook.com [52.101.66.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611343CBE85
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 10:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774521287; cv=fail; b=SA6XXel4Gjpet1YQD8D5AR7itYoFmR0g+3osN5MrMgN/4IhyOMnNYKW0oHSepqDIiU2nxSZoFxHyLzbn23ohJ8jAg3pftY8AfmyHZGnKt5f9jrBdsDynUadUPqiPHnBReiRwtRwYrrtEREZNBWG6pLOMozih9SwcAn97D3aTd3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774521287; c=relaxed/simple;
	bh=rhKfeQu1kN+wOryQtD+cHSfWcnzBJf3MCBhwnbrcNEw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C6BG8nYf9Q8/LnXKaI+v0gUhBxXOyy12qrerWKwUQylOTApsLCowhiRFCaf4Wa97Sov99NDWKReq4KT+Zk6vu+ePFHa2ISQPSJfNKp5yoYuP69/uFDQ/GtGrP5A3a1JV3KgLv2/7jAwW99hXsM4SZryBS2nagZ3g7jKINhxJ+R0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=P/iQ2PCb; arc=fail smtp.client-ip=52.101.66.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="P/iQ2PCb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qUwPLntY0Nl58VZu9wYRxeYvM64SKm2ImcjebfdjVfj2Qn4gJ1pfHGmpK1Dikg9OvOL9OEJYCSy/NngnY5ayAi0F4v9aMG5TjMqGAogu3ukQHsBLWF3MsBHDqWUFTODyoxygVlHZEcbEa8WA8RIyWP7e3mFv6lK1So0BKw0a9GuGU/Mzeymgwc+zUO5cqxC6vSmERmHPzrymgG9UcTfOL5yga71AyVuLOD7463kFDlF4Qw3eVwT3kC1t3ZtS8X09zX/FucifHUaVZ0tkWMuITwGcnzIhHpB32qfvClsfwGTfJz2r2BppWMyhfnEeajs0PIs4JJFYPmBbNlLVXG3UlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rhKfeQu1kN+wOryQtD+cHSfWcnzBJf3MCBhwnbrcNEw=;
 b=SB4lCM3rQWqhx6KeTxlKnie3uj3QptTcF0hlx0eEyRV5YSZQXXv8lVkA3Rz3cVNcm/WGCAZF18vkGs+YM+OBd5IBYulpVn7kCwlYTd5jkA73opCJQuCBzDccj/42R1RmUImP6z61HjXOtLfgWOb4YzErqkkdDOm+0eyFV85rhoCLZghxLOWtOrFt14RWrXdCVeUPxHOWrs+xgrndtyE8ZdacS9e8cQ2q/35FktAZOte7d6KOLgCrPcg/MbDDGBUixMS8cZXIiwu0+DEzHbSr2i9ZAaJxsp38k21jtp1vkuLl4bncdLcPTXdVHPvIuzv6tp0ESRZ2Bnj2hASjD2v9CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhKfeQu1kN+wOryQtD+cHSfWcnzBJf3MCBhwnbrcNEw=;
 b=P/iQ2PCblfYzIfXkx43MkvuixH3zkKo7Ym9Fu7VpdRY2xh72W7AHfifK/1j+uMVj6tVpaYTvSeXHA9SgFjmSoACc2uDNrSk3MQN9vhiY2PE9gsQwtPYEhSKj9pmCm1l7QEqzBl6rSddIFUe43T9Tbvi1fHYs2itXF5H804J6Wxn+y71j7fbwfUZeFP0ejcnEpTWmyFlbB0Dv1J2wCokKUgs/Kd61efEieI8IHfZQmycCiBm3JUfhkHdpvVqa9KK1znlBob5pBeosTC9jkjgJ23VfEAYRu+hSB83xd8xbwrGqkK+KKYgWejcP/1+KSqOASJGn5rlQ0uID08BhB7I1oA==
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::16)
 by AS8PR04MB8756.eurprd04.prod.outlook.com (2603:10a6:20b:42f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Thu, 26 Mar
 2026 10:34:42 +0000
Received: from AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f]) by AS8PR04MB8420.eurprd04.prod.outlook.com
 ([fe80::3f0f:857:96a5:17f%3]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 10:34:42 +0000
From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
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
	<xuegang.liu@nxp.com>, Greg Kroah-Hartman <gregkh@google.com>
Subject: RE: [EXT] Re: [PATCH v4 3/4] clocksource/drivers/timer-mediatek:
 Convert timer-mediatek to a loadable module
Thread-Topic: [EXT] Re: [PATCH v4 3/4] clocksource/drivers/timer-mediatek:
 Convert timer-mediatek to a loadable module
Thread-Index:
 AQHcq67R/jfgdFFso0+2DI4r/Bm39LWeu40AgAI93KCABBkHAIAAaeuggAB9Y4CAAX1tIIAX/M6AgAFIjMA=
Date: Thu, 26 Mar 2026 10:34:42 +0000
Message-ID:
 <AS8PR04MB8420888626CC3D44BF7130C4EB56A@AS8PR04MB8420.eurprd04.prod.outlook.com>
References: <20260304081207.4030882-1-zhipeng.wang_1@nxp.com>
 <20260304081207.4030882-4-zhipeng.wang_1@nxp.com>
 <aaiByowtXrTxPsd7@mai.linaro.org>
 <AS8PR04MB84206CF559371D3966653F8EEB7AA@AS8PR04MB8420.eurprd04.prod.outlook.com>
 <6255aa0f-529c-41cb-be32-e5d54a839125@oss.qualcomm.com>
 <AS8PR04MB84209F4103D8D4FD495F5B26EB79A@AS8PR04MB8420.eurprd04.prod.outlook.com>
 <019942a0-e9f2-45f1-8e04-26ecc9822705@oss.qualcomm.com>
 <AS8PR04MB84206959C00CFDC4C85B8BC2EB46A@AS8PR04MB8420.eurprd04.prod.outlook.com>
 <28a09389-9fdf-49d8-84a6-4e68c40b5224@oss.qualcomm.com>
In-Reply-To: <28a09389-9fdf-49d8-84a6-4e68c40b5224@oss.qualcomm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8420:EE_|AS8PR04MB8756:EE_
x-ms-office365-filtering-correlation-id: 6d7e216b-dc50-48b9-fc92-08de8b234a73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|19092799006|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 58UE1451Tws5yMdex23orlxF9nC60cwvbmnwwJjQ+YbFlNnh6QVzVc1srXP99Z232oIgrmxsE0T9NHVopd7ZYmUtN70EeN24Z//qhbTwg9/B3ZlEKlj7wzbhwhaFEc0ZHC1m77FdLNJTEepPn+y/PBaAmCgV6j5w71+YEyJvIiPbe2JEO9mVqOt3NiVCYvk4JEONjnge9585W76b5H9DEByB5wz5peKBR4DIJpnTXyb1FjwOwx7PDaXfnHQmzzkBt3l+8+xp+gvCAp8H5+et10+sM+flHcLjD+j5m7lkmnm5xiI5Xp4LkvumoISMge+DyZB/oaIXim0xyT4VNFNjjRP7A4NYIXUj+ZLZ/KfeikzKaRIoFNLdll5Yd7MijFcLF/JIUsFU7bjnrANqaDDQMpMOtsL9qExj7BkFbhG9uAhasrJAZ7f3xoHqfWR1pwLML6KSTRh1M2w+csQPOUtW8eD6nJifO2qKreNQ0H4Go1SYqKOgwgD5F04PMPhBmO+1uzAHl8G5wkLewN0Y4C4g4zBQzS6DKhai75SXdXvoR+/0UQBzybNjsgMpIOH19RG2oqnPu9sw7M3/nMckRo4bixTxp6x9ZdstGazTXT1eW3yLlmxwHi95BoZ6TjLx+qYmk39CkcfU2VfiMbwRtOMsZrF4nPIi1dZjDCEwvDDyoU5KlkwE4r20AwYdzGalwLUmO0kK83/Cdn6+duhrbfE+EQJNKQ+uXSzykRuBCiGcBjb+J3c8oV3ZVGnGl0kP2Dbx29mBcZWC0M60qapsspRHUrJDWwt4j3YHUr4BlI7fuGI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8420.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ckx5aUttZGoxQXh3ZGk0RGFGRVpSclM4VVpsclJxSi8zeVRwRHVKTGZML2Jq?=
 =?utf-8?B?eHkxWnBrdkdiMGp6eDZOeFJuczhSTUh6R2J4cXZ4SFVZa2JCRy9QUlhlL1Jx?=
 =?utf-8?B?MUN4bEp1Q2RKa1l2OUNRUWxaeGJCR1NCaDVWNW5JN1EyQVJDdGtTOVJuZG1i?=
 =?utf-8?B?alVRM2F4ZXRGR1BEajFjc1RhYVV4bFVrdDZPcmh1alF4OThpUXhxWVVWMVha?=
 =?utf-8?B?aTBFOHJQdzBabmhoY3IvU1FPVHl2TlJ3bHpLV0NBQ1IrR3pJWWVnV3EyMGE3?=
 =?utf-8?B?eTFnWml6anIzQjdTMTE2MjFJbzBsK1RzeksrTFpPank4eG1YMU5ncVVmd2I0?=
 =?utf-8?B?bGhTSTVUTHJlOUY5bnZIaEwvWXNWY2Fub0U2SEU0dXppZ3Y2a3Q3Q2RjYjN5?=
 =?utf-8?B?TzUxMTBieVBtNGtGSXI0VEZKK0kxSlJvVElqTjNyaGV5UXlxREdYa29wY3JG?=
 =?utf-8?B?aVpLbFNvTnFHYnlscVBYa2h0VFZFTVlUbTRjNmNFTTdKdnJFeTVUYmNZWFh1?=
 =?utf-8?B?akhsNkZlcDUvZTZQRXBTWnYvcUpNTG9rdnpJQWRKbjR1c2hjQS9GYjNJNXBJ?=
 =?utf-8?B?MEhndTRaNGIzRmZQRkVXVzRGNjhSaTVSMGJCMzNjVTJCMVlmRGFBckd3LzNM?=
 =?utf-8?B?L0JOZ2xieUVjeFNJVjluc2k0YkFMSFdkcVpPb1pmeVVtbFNrVU9sZHB6K3Y4?=
 =?utf-8?B?Q2N6WFBTUFpwRkRVclZrZXpWSWRhUUxxUlUzU1hMMkhIZ3ZnUkk0dVRQeXhx?=
 =?utf-8?B?bWlMK082TU4vQXNRUmRscWxHcmdJYUpOV1d4Uy92R1hPbndSbStGNzB6ZGJQ?=
 =?utf-8?B?Uk5LaGJLb2wzcDJWSGlJTm9uaWFvR0lOL1lFcmozZVl4aFNaOWtzY1V3SWp2?=
 =?utf-8?B?Vm9VcjhUSFJabWZoWlNIMHc0VGF4N0RMK21QQ1JTNm1KUWUyNEhMVGlrZjVM?=
 =?utf-8?B?bTN6ektvK3RzUjZKMUNCUDVrSkFsNzM1MXJsOVJuNG5NYmdIaUhqMHc3allw?=
 =?utf-8?B?RldqaXNKK2NJWGNSalRBZlRjbThST1NBNmN1SmZQdGx4cVFBbTNYZnBVMk9E?=
 =?utf-8?B?Z2dKN1N0bEJ6ZWxZV282U2RWRU9LMVRsbnMySGpTc3I5V1hDTGdIa2IxWUhN?=
 =?utf-8?B?UjZXQ2Q1RXM0T0Zmdmt5ZUhuL0IvblhLSGlCVmdPcXBiUUk1VUgrOGNESERO?=
 =?utf-8?B?WXZBaEFDTXBZR0lFKzZGUTU4dHdwZ296V1A1K3c1ZnlSa3Q1bk1GS2FEQUtw?=
 =?utf-8?B?RjVxUmxCUWxMd2hzVTJLTllzdnpJWjVDY1R4eGZyT09QQU9ZVVZLNG1KWW1n?=
 =?utf-8?B?azJsUTRQMGh2alBTOEhORFhLbmFIcXpiR1lDeG1Xb2d5VkVVZFhiSzRqOGN4?=
 =?utf-8?B?QytGVGJPZzVLdE5LVHgzNUVPTnpXSk9VRHBJUlBLMkUrek4rL1VYaVVPOUZS?=
 =?utf-8?B?eUJTZWZRaWNHbWpSUzBMb3Y5QVFTem03bENuMFp0bkZHTGRiSjZnRUxPQUdX?=
 =?utf-8?B?MjB5eHFlbER3bGNPdGdJUU11cGwzWUUyQ25pdEIwK3RLK3FUY1Q1UFIyN1RC?=
 =?utf-8?B?emdMdmFPN3VoM2tEZE1wYkxKV0drSTdzL1p6UjlGVXNwYUU2WWZSM2hqTmV0?=
 =?utf-8?B?UXJsNWlFekY3OVVyZTdLdEJwWktGRGZjV3JaMXIvRlVORjRnZmp0Z0NQaCth?=
 =?utf-8?B?elpLYlZVeVBiN2Jld1pSQ3JDZU4rSUNSZnNJOGV6TElwUlpDekRLdUJQTS9X?=
 =?utf-8?B?eGtoNStuWjV5bGIzK1J4TWZUd3ZaemhsZW52Y3BDVDhMd2NkTXhxUUY5UWpq?=
 =?utf-8?B?SFk2WkRZK3F4NXhsQmNldVNSSnBFRTlzNHdJVFg5bjJUQVpHWjRWdHBFdG1a?=
 =?utf-8?B?Qks5UXNQY09zdGhZMWdKWnhzMjhJVk13UVlMODlUUFRQZm5sWVpHR1YvdGNm?=
 =?utf-8?B?MTgweTF1c21LU2xweFcvNHRDYWdJdnZaMHFCTEpGOVN6UHlWakJkSit3ZjBs?=
 =?utf-8?B?bWVPK0xORmZuMUNvREtad2VmVnRiazRGeGs5cEJaVVhScUhTUS9Qa1lPZjQ4?=
 =?utf-8?B?REhhNjJEamtDS08wZHBnTkh5Y3l4b3J0T2Rzb2ZiVkRhS3ZTdjUvOUh1MlMw?=
 =?utf-8?B?TFNzcytOUiszNHZSSURYVFRXN2tFTTlrcHRESDZ6UHpIRm5ocDlOSnpuV1ZG?=
 =?utf-8?B?VUJUU29aeElCamhiT002U1YvajloanlnRk9neWY3R0d6dzZOUGlQRlo0MVRu?=
 =?utf-8?B?SVZkQzVIOWlPYmhWYWxtUGpiYlF4aWgxL3hVK3RYNkpXT1FxZzk3M1B2YU5h?=
 =?utf-8?B?Tm1PZzhXRG4vTG9paysrMDlta24rbFRkbmcwOW94cDRZVUo0UFJSQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d7e216b-dc50-48b9-fc92-08de8b234a73
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2026 10:34:42.1551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A7p7h6v/He+NASBTa59XcdiGtetWkLIsePyAm0URj57yzW+w2hG3rxtKsllSyQVeBFugIIP2jnwza2RKS6Htzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8756

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGFuaWVsIExlemNhbm8g
PGRhbmllbC5sZXpjYW5vQG9zcy5xdWFsY29tbS5jb20+DQo+IFNlbnQ6IDIwMjblubQz5pyIMjXm
l6UgMjI6NDMNCj4gVG86IFpoaXBlbmcgV2FuZyA8emhpcGVuZy53YW5nXzFAbnhwLmNvbT4NCj4g
Q2M6IGRhbmllbC5sZXpjYW5vQGxpbmFyby5vcmc7IHRnbHhAa2VybmVsLm9yZzsgc2hhd25ndW9A
a2VybmVsLm9yZzsNCj4gcy5oYXVlckBwZW5ndXRyb25peC5kZTsga2VybmVsQHBlbmd1dHJvbml4
LmRlOyBmZXN0ZXZhbUBnbWFpbC5jb207DQo+IG1hdHRoaWFzLmJnZ0BnbWFpbC5jb207IGFuZ2Vs
b2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbTsNCj4gbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZzsgaW14QGxpc3RzLmxpbnV4LmRldjsNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnOyBsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiBj
aHVuLWh1bmcud3VAbWVkaWF0ZWsuY29tOyB3YWx0ZXIuY2hhbmdAbWVkaWF0ZWsuY29tOw0KPiBq
c3R1bHR6QGdvb2dsZS5jb207IGFtZXJnbmF0QGJheWxpYnJlLmNvbTsgQWlzaGVuZyBEb25nDQo+
IDxhaXNoZW5nLmRvbmdAbnhwLmNvbT47IEppbmRvbmcgWXVlIDxqaW5kb25nLnl1ZUBueHAuY29t
PjsgWHVlZ2FuZyBMaXUNCj4gPHh1ZWdhbmcubGl1QG54cC5jb20+OyBHcmVnIEtyb2FoLUhhcnRt
YW4gPGdyZWdraEBnb29nbGUuY29tPg0KPiBTdWJqZWN0OiBSZTogW0VYVF0gUmU6IFtQQVRDSCB2
NCAzLzRdIGNsb2Nrc291cmNlL2RyaXZlcnMvdGltZXItbWVkaWF0ZWs6DQo+IENvbnZlcnQgdGlt
ZXItbWVkaWF0ZWsgdG8gYSBsb2FkYWJsZSBtb2R1bGUNCj4gDQo+IENhdXRpb246IFRoaXMgaXMg
YW4gZXh0ZXJuYWwgZW1haWwuIFBsZWFzZSB0YWtlIGNhcmUgd2hlbiBjbGlja2luZyBsaW5rcyBv
cg0KPiBvcGVuaW5nIGF0dGFjaG1lbnRzLiBXaGVuIGluIGRvdWJ0LCByZXBvcnQgdGhlIG1lc3Nh
Z2UgdXNpbmcgdGhlICdSZXBvcnQNCj4gdGhpcyBlbWFpbCcgYnV0dG9uDQo+IA0KPiANCj4gSGkg
WmhpcGVuZywNCj4gDQo+IE9uIDMvMTAvMjYgMDk6NDEsIFpoaXBlbmcgV2FuZyB3cm90ZToNCj4g
Pj4NCj4gPj4NCj4gPj4gSGkgWmhpcGVuZywNCj4gPj4NCj4gPj4gT24gMy85LzI2IDA2OjMxLCBa
aGlwZW5nIFdhbmcgd3JvdGU6DQo+ID4+PiBIZWxsbyBEYW5pZWwsDQo+ID4+Pg0KPiA+Pj4gSSdk
IGJlIHZlcnkgaGFwcHkgdG8gY29sbGFib3JhdGUgb24gdGhpcyENCj4gPj4NCj4gPj4gR3JlYXQs
IGxldCBtZSBzZWUgaWYgSSBjYW4gY29vayBhIHBhdGNoIGluIHRoZSBuZXh0IGRheXMNCj4gPj4N
Cj4gPj4+IE15IGF2YWlsYWJpbGl0eTogSSBjYW4gZGVkaWNhdGUgdGltZSB0byB3b3JrIG9uIHRo
aXMgb3ZlciB0aGUgbmV4dCBmZXcNCj4gd2Vla3MuDQo+ID4+IEknbSBoYXBweSB0byBoZWxwIHdp
dGg6DQo+ID4+PiAgICAgIC0gVGVzdGluZyB0aGUgbmV3IG1hY3JvcyB3aXRoIElNWCB0aW1lciBk
cml2ZXJzDQo+ID4+PiAgICAgIC0gQ29udmVydGluZyBleGlzdGluZyBkcml2ZXJzIGFzIGV4YW1w
bGVzDQo+ID4+PiAgICAgIC0gUmV2aWV3aW5nIGFuZCB0ZXN0aW5nIHBhdGNoZXMNCj4gPj4+ICAg
ICAgLSBEb2N1bWVudGF0aW9uDQo+ID4+DQo+ID4+IFRoYXQncyBhd2Vzb21lLCB0aGFua3MNCj4g
Pj4NCj4gPj4+IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCwgYmFzZWQgb24geW91ciBSRkMsIHdl
IHNob3VsZCB1c2UgdHdvDQo+ID4+PiBtYWNyb3Mg4oCUDQo+ID4+IFRJTUVSX09GX0RFQ0xBUkVf
UERFViBhbmQgVElNRVJfT0ZfREVDTEFSRV9QTEFURk9STV9EUklWRVIuDQo+ID4+DQo+ID4+IFll
cywgYnV0IGFsc28gc29ydCBvdXQgdGhlIGV4aXN0aW5nIFRJTUVSX09GX0RFQ0xBUkUgbWFjcm8g
dnMgTU9EVUxFDQo+ID4+IGluIG9yZGVyIHRvIHByZXZlbnQgI2lmZGVmIE1PRFVMRSBpbiB0aGUg
ZHJpdmVycw0KPiA+Pg0KPiA+IEhpIERhbmllbCwNCj4gPg0KPiA+IFllcywgdGhhdCdzIG91ciBn
b2FsLg0KPiA+DQo+ID4gSSdsbCB0ZXN0IHRoZSBuZXcgbWFjcm9zIChUSU1FUl9PRl9ERUNMQVJF
X1BMQVRGT1JNX0RSSVZFUiBhbmQNCj4gPiBUSU1FUl9PRl9ERUNMQVJFX0VBUkxZX1BMQVRGT1JN
X0RSSVZFUikgd2l0aCB0aGUgSU1YIHRpbWVyIGRyaXZlcnMNCj4gPiBvbmNlIHRoZSBwYXRjaGVz
IGFyZSBhdmFpbGFibGUuDQo+IA0KPiBJIHRoaW5rIEkgaGF2ZSBhbiBpZGVhIG9uIGhvdyB0byBh
Y2hpZXZlIHRoYXQuIFRoYXQgd2lsbCByZXN1bHQgaW4gdGhlIHJlbW92YWwgb2YNCj4gVElNRVJf
T0ZfREVDTEFSRSgpIHdoZW4gYWxsIGRyaXZlcnMgd2lsbCBiZSBjaGFuZ2VkIHRvIHVzZSB0aGUg
bmV3IG1hY3JvLg0KPiANCj4gVGhlICNpZmRlZiBNT0RVTEUgbWFjcm8gaXMgc2V0IHdoZW4gdGhl
IGRyaXZlciBpcyBjb21waWxlZCBhcyBhIG1vZHVsZS4NCj4gDQo+IFNvIHdlIGNhbiBkbyBzb21l
dGhpbmcgbGlrZToNCj4gDQo+ICNpZmRlZiBNT0RVTEUNCj4gDQpJIHRoaW5rIHRoZXJlIG1pZ2h0
IGJlIGEgdHlwbyBoZXJlIC0gc2hvdWxkIHRoaXMgYmUgIiNpZm5kZWYgTU9EVUxFIiBpbnN0ZWFk
Pw0KDQo+ICNkZWZpbmUgVElNRVJfT0ZfREVDTEFSRV9QREVWKG5hbWUsIGNvbXBhdCwgZGF0YSwg
Zm4pIFwNCj4gICAgICAgICAgT0ZfREVDTEFSRV8xX1JFVCh0aW1lcl9wZGV2LCBuYW1lLCBjb21w
YXQsIGRhdGEsIGZuKQ0KPiANCj4gDQo+ICNlbHNlDQo+IA0KPiAjZGVmaW5lIFRJTUVSX09GX0RF
Q0xBUkVfUERFVihfX25hbWUsIGNvbXBhdCwgZGF0YSwgZm4pIFwNCj4gICAgICAgICAgT0ZfREVD
TEFSRV8xX1JFVChvZl9wZGV2X3RpbWVyX21hdGNoX3RhYmxlLA0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICBfX25hbWUsIGNvbXBhdCwgZGF0YSwgZm4pDQo+IA0KPiBzdGF0aWMgc3RydWN0IHBs
YXRmb3JtX2RyaXZlciBfXyMjX19uYW1lIyNfdGltZXJfZHJpdmVyID0gew0KPiAgICAgICAgICAu
cHJvYmUgPSBfXyMjX19uYW1lIyNfdGltZXJfcHJvYmUsDQo+ICAgICAgICAgIC5kcml2ZXIgPSB7
DQo+ICAgICAgICAgICAgICAgICAgLm5hbWUgPSBuYW1lLA0KPiAgICAgICAgICAgICAgICAgIC5v
Zl9tYXRjaF90YWJsZSA9IG9mX3BkZXZfdGltZXJfbWF0Y2hfdGFibGUsDQo+ICAgICAgICAgIH0s
DQo+IH07DQo+IG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoX18jI19fbmFtZSMjX3RpbWVyX2RyaXZl
cik7DQo+IA0KPiAjZW5kaWYNCj4gDQo+IFNvIHdlIGRlYWwgd2l0aCB0d28gdGFibGVzLCBvbmUg
Zm9yIHBsYXRmb3JtIGRldmljZSBub24gbW9kdWxlIGFuZCBvbmUNCj4gbW9kdWxlIGZvciBtb2R1
bGVzLg0KPiANCj4gVGhlIGZpcnN0IG9uZSBpcyBjYWxsZWQgYnkgdGhlIHRpbWVyLW9mIGluaXQg
cm91dGluZS4gVGhlIG90aGVyIG9uZSBpcyBjYWxsZWQgYnkgdGhlDQo+IHByb2JlIGZ1bmN0aW9u
Lg0KPiANCj4gVGhlIGRyYXdiYWNrIHdpbGwgYmUgdGhlIG1hdGNoIHRhYmxlIHdpbGwgYmUgY29t
bW9uIHRvIGFsbCB0aW1lciBkcml2ZXJzLiBTbw0KPiBwcm9iZSB3aWxsIGJlIGEgYml0IHNsb3dl
ci4gTWF5IGJlIHRoZXJlIGlzIGFuIGFyZWEgb2Ygb3B0aW1pemF0aW9uIGhlcmUuDQoNClRoaXMg
ZG9lc24ndCBzdXBwb3J0IEVQUk9CRV9ERUZFUiBmb3IgYnVpbHQtaW4gZHJpdmVycywgY29ycmVj
dD8NCg0KDQpCUnMsDQpaaGlwZW5nDQoNCg==
