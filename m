Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010022.outbound.protection.outlook.com [52.101.84.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740C131714A
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 03:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784173676; cv=fail; b=jkyQrrXG07/53kdsQm6pNxE6EHqF78VGCiKWqUmtfoTzqnJCDn16oPF8c8VGBnJ33ACkRlZ3U9Xn/kXCY45DhdfMNGa5kJPyxr6Gcbl0FLc06q39n62H6l/mpp3cL3TRxa5BOAxgsSCJoQjdmDfcGp5cHJSzS/IH6Z873c+r9dM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784173676; c=relaxed/simple;
	bh=ziPvwoDDe9Hg0kk+C7T7fVvVLZWjhFCThF2O3UIBGu4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=SF1hGlDtAawwTil2ilTL7ckjLCKmAr9wAzIBDnYXMq1iBJkb3P4hsf7FP9oeF8ynxkHZYPfOLUfIX0moMyFWPBu0NQvsa3VMcqswK+hGJdjPdIv7vN+ECzwmDU3BF7OxFhX0ln67db/Sm+jEahfV8eTgbK6xulGOh6yB9sMhaFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=O2gmD78B; arc=fail smtp.client-ip=52.101.84.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="O2gmD78B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SCXRHKxINZSp7df33TVfYAwkRI+9P0EqR8LIfWzSvIHMyYOnAKn7kPMcNV6VrwsIDr3DObIDBX9tbF9BcoLSZMFpbKlW7ZEFENG2HU14utcUrHPioRkNclsv+7DL2/D3WRkwWXkFBLtAo3RoEQ5mytsZTAPitIUUiS+v+czMMzcUGjKvRU0XJsEbJZaoQZIRRMwkEYT7jRqn87yKCH5q31p7OPyXAWSlsLfX2p7p1EnrVzAbcbAiv8JWPqVl0Efk8WtpFK4wZUVvzkLzhltGX/6c67iDsBlVNQLLWqDea379OZFBxc17Cte9bT41hVFm7lMaB2tz/ZUUuWahtv12gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZKHAnDc/naM/pnhEwS65u9nCFZvMZuHVBCEDYc/VHw=;
 b=ORgo+BrtKKXIRQfsPULEy+FJHW+QmmRaFjFV/ijdBGaHGq0JLv6JwYosJ9j3vXPMNOE2cJBp4eLefb79ZR/icvhtu6SxFKeIfpO/x3HuuDhtmRY4cOxeysf+/hhZfUHdmIXFjLWJx6jQWYMLY0gE2B14xLMRDG54fJ03b2KIEWRH+9VoZ1n6pDehR1jcZyTjSW69EMOC4TPej/rXxHk3PVQdsGvww8zwWExNMZby23P5rkY0GbocSaByDRMWkiZ8l3s8A4kuFILmCILv82FbS/KxYYGSgVPcbaiMsOGHpLY6zx7igIxqL3jmNA3jqfhmhbwl71MjlsCzjpnitDGkbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZKHAnDc/naM/pnhEwS65u9nCFZvMZuHVBCEDYc/VHw=;
 b=O2gmD78BZVI+7sYYtCoATmocHtJ896KG7XtJLfxfimdX0b/oorW+xO5hb1L6HnmiVoNq8Xnv2nPfhxD3bSZ57K5LeV1kKVDtlDwL/YpgCfv32jxi666YsN7ZZ7EwXFg7NaaNwMy3BBg3uZY3ilgMKwsrzslK1IQhvMvvIWOarS0aDHiiHHJ7CD0Uj6sY4lF7k2M8XnZoH5TbZopBpBxOUPkOFmv/oyLGo3b8jD6FLGkjraoGuYdww0DW2gPY53OlnjaQ2fDMqCtF1/huMa8vxTc5lGGRoB3AiWJApty05miHmfF87AwJ+nZCCBwSLnltx+WdY5U+roPJDoxct1slgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by DB9PR04MB9645.eurprd04.prod.outlook.com (2603:10a6:10:309::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 03:47:52 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%4]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 03:47:52 +0000
From: Joy Zou <joy.zou@oss.nxp.com>
Date: Thu, 16 Jul 2026 11:50:53 +0800
Subject: [PATCH 1/3] regulator: core: use system_freezable_wq for init
 complete work
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-b4-regulator-pf01-v1-1-8c1519d54bd4@oss.nxp.com>
References: <20260716-b4-regulator-pf01-v1-0-8c1519d54bd4@oss.nxp.com>
In-Reply-To: <20260716-b4-regulator-pf01-v1-0-8c1519d54bd4@oss.nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Joy Zou <joy.zou@oss.nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: MA5PR01CA0298.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::7) To VI1PR04MB5807.eurprd04.prod.outlook.com
 (2603:10a6:803:ec::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|DB9PR04MB9645:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e94d2a8-93eb-4457-6df6-08dee2ed031c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|366016|23010399003|1800799024|10067099003|921020|6133799003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+ygOW0sF9XWGLHNcqLdUMmILwhODt0Jqr9ylunb7jNfrKAt81siPHdIxFyLaYYsVa+t6re/gEW4k4NjBq19GmZplG1c02SzDbxpAhTD/C4iHqdCsjnclmNNYsKgbuETV+HXgQpy94IngRNIvvH9JTSEktLUWs6jeN0mTmhQs0uzUnAMvDY+nLMv3JzXgY0n0YVrstDF5ZMiuD+5HZUGGgNvE8yFNXTc49SH+wYS3MV+juzhL4qpO1Yfon4CBPU90qX/axuQErxBYBlfoOhuduEMqarP9CyZ/fQxc1sZps3POSURkBPzVGMvyGvXvbdDhlMd2WWS8u1GNn19ZhhW+fIBK0z9SjcB2U1NA66+CtEsIyJrYQS7KVxUMEcY2K4NhFtByArUXefVFoLd2RFzhUDzfYJ2zyxHH5iL4s0jB5X5SANbhNgyfII+3bMcBWqunpzV82n/0RXOvUMNdxEGbyntdGxA97dLpeLoYh9NBt1Wm8dQ6VPCMO5iGv9CHceT5xNXUZZOCKgYCMrYN0f6Gk6OAP2u74H3gfRIfUV6g72Z9zMjf9uKmz3DMkm+By93gR7Ra5DG0Q7qKw+1SvgjpyoVHRcmLNc+kYtg6riZ70sfGFRtUOmsf9kLCMOGXUx4jJYgIa3aXe0JnoTIJdExyEfir8D5Vez0CV8ORzB+W2ePvIUt2dWWmeG8eKX46ebfGMQCgwLMytOncyVenKZE7tA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(366016)(23010399003)(1800799024)(10067099003)(921020)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1lid3JtRkhOdWhDUXQ3SlVXbG90a29HS3Z5cDFZNEJVb282elJ2ZTJac0l3?=
 =?utf-8?B?T3kwU1hCZmlWaURlclJtWG5GV01qa0RDVDdXcDFIem5KMGw3aHllUEpjajd1?=
 =?utf-8?B?SDB2ZXVMckY0Ymsyd0VkZ0NjNDBrMTFMNW96dEdlRmJXQ1d3RkI0TSswUGlV?=
 =?utf-8?B?eU11VVBMZTV3aE1raTk0RTJoWUx2MDZvc3dFNGRUUnRlMmVGeHdaaHpmTXZH?=
 =?utf-8?B?d1Vvc09jcGUrcEhBVk8vRjRucXlOSW4rZm54dVhxYW8xQ3FhZzcxRk1PRHJz?=
 =?utf-8?B?OUhjQ05JTnVYRExRT3R6ZUhHdEtBMks0dWQwMFlpRjFxc3A5UTVhSER3cVU4?=
 =?utf-8?B?aGpTYXBXU2wzRGg1S0pGd2NzTGhsV04wcXNndmk2UWMzdmE3TzRxK2xHelVY?=
 =?utf-8?B?UXIzbkw4NWxMWlExMWJGcUtsRC9CZTc3clE5SlJYOHZnVmR3dzVOQ3lLTG44?=
 =?utf-8?B?bldrdmNRWlZYVk1TOXlpZ0wzc1cvNzUzWWxoOTM4VzJxdUtDODJnZkw2a1F4?=
 =?utf-8?B?bHdLT2xwazhCbk1GaHFjVmZWbGRIdWlkeVQvTGY4UjEvUUZaZUZ3WS9NSHY2?=
 =?utf-8?B?TVMrYzN2dkNWejVOY0UzWk9mOUx6MkVDcFU5RUJTejQwNDRTazhaZmRrbTVF?=
 =?utf-8?B?QjVOaXR4ZTFsZENVeVZqSjIxSkJsNTRzbmhUZEJDZzd6QVE3anVpdk1WWXlQ?=
 =?utf-8?B?OWxJeEg3M0EwQVMxNXhUTDM1NFJtMlhjSTh1aEJwRkxWcWFha3ZvNFFiNW53?=
 =?utf-8?B?Z2N4M3JUZnVKZndaTUY0Z1FZTDAxVkpRVlBXTmNzcXV5aHRQZUVrZXl3UHE4?=
 =?utf-8?B?NFoxQ051NU4wcXFkUytJSFR0WWh3V1lCRitjV1A4SWFjajJYTXY0VnVNNVFU?=
 =?utf-8?B?dmNqNVRvWW5mR1lHc2pxWFp6dGNDdmlxL2VRY0FYZ0RIazBCOFhLL1MwNkt5?=
 =?utf-8?B?dlpIZ3UydUhVVWt0Q2xGUGZBQUJUQkVWVzFrRHRNR2VobnFCNUhZVHhkR0th?=
 =?utf-8?B?VUY2dU0yWWVWL1huMmlsQkVFempRd21KWjM4Q0crMk9ac2oxRldrS3lNZFc1?=
 =?utf-8?B?RDVpNDJiM2xRbnYxbDVWczBjd2dDc2FPUkhIQ29udHFKL3JseXZUTU9mbDdV?=
 =?utf-8?B?M0JhazRrQUJkaHJGTHAvdlk4amdPUTVYUVJvS1JvMERyLy93ci96ZVVzekc5?=
 =?utf-8?B?SHFweVc0Y05KSGs4TzNjeHdzaVZzVTE3M2FmUlk1SFFWUEVYZ0lqcDB2cWpq?=
 =?utf-8?B?bnRFUHlPNEtkZE1KVmJhdEdLQ05TaWQxdU9rSWl3OVBlSjYxbUZMUElBanJv?=
 =?utf-8?B?bklHVDFxMm1HSzk4QUJjV1pYQWVPOGxyVUhEVGRmdUJrWVViWkU0Qmp1UlBh?=
 =?utf-8?B?VFAzNlZwS0lEeXJpYUZCc2NTeGFqZCtUTXpZYXFxMW9NeFRQSzNvb3NmeVhs?=
 =?utf-8?B?dU1VeElzbFoxL2oxd3BDcUluc2VBWXBlWkREZ1VuMEgvODlIUWE0RWcvSkhV?=
 =?utf-8?B?bGpGREx6OWNVKzZQbDg0TlJHYXFPd293OUtOU01VRU5NdytBNDU0WTN6c0Zr?=
 =?utf-8?B?UUFNTHV6dUYzMjl2eTFwNHR4MDFkVVhPTThvYTc2YXBlYi9sZzVPS3k5L05z?=
 =?utf-8?B?ZVlXN045WUw2bTJ5NWhvQitWZmwzTXJFdFlIeU9lVjdBUm9PWjZPVENiNkNq?=
 =?utf-8?B?VENZWWJrN0hpSGZNK25UcHd1UEJhemFHbzVpRWRIZDRPU0lwazdrMVhXVjQz?=
 =?utf-8?B?dGpWSUJHNzNoWmhVSlZaU2ZrNlQ3eTVyalpVeUhHZkwxRTBSODdHYTRUcEdH?=
 =?utf-8?B?c3h3Sms4T2xIVlh6eEFUWXdTUC8zYm1MNU9ybW9mRE9XSFExWDY5L1lvckx4?=
 =?utf-8?B?K2haUzdPcjBkTy9JMDZ0THh4S2Urem4xMzhiUTlhL2xVQ05wdDM3bWtoQXpa?=
 =?utf-8?B?TWw2cGVCa0g0bWNSczY4SnhIekVBSW5oOTFZRGhndHpXVjQyckMzS09sSGs0?=
 =?utf-8?B?TVp0WFNzM0FzNlJKN0xCblpQWWd5enBEc0ZGaVFiSGJoc0kyUVV0Vzkzd3FS?=
 =?utf-8?B?MjRiTUF4S0ZzRUJuOFROWWJsV3lZNnB2U1FOKy9XZy92cjRMaFRXc29oUmFj?=
 =?utf-8?B?UFFmOFZ6emZGRlJJcEVBdjdmZ3J1bFVrT1o5a0RhNnk0b3pPaWorUUc5K0xY?=
 =?utf-8?B?ZG11dVBna0VJKzJzNE1FUE92aE0vbzBvb2p1OFBBS0ZRNzRVWkEwdTd0bXp1?=
 =?utf-8?B?WjVsQnhLY1ZLMkhCa01aT2tueERQajdPYWl4MDdYbGJEcmNlM250ZE92aWNR?=
 =?utf-8?B?M25nZ3dkTVA1R1VHM01wTU5oSGxKZHV6cFlaVmlpQmhKUGhiK1l6bWlWdk5Y?=
 =?utf-8?Q?S45HA2xL1VsEx38ru5UsjGJHSr8MJ1NfVfC8p?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e94d2a8-93eb-4457-6df6-08dee2ed031c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 03:47:52.3562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XblU0NfhDJmXydrSF1CxwHXLyOFLu6KJoVsEa2wqvNmG+LGtL9pwefiUPMDYr3Kv5N/lbOEUCBA9sV76sCgptrZVFZ426PVfEhEwbEq4R4hzjQ1yI8TQQDbFzkB2+kfK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9645

schedule_delayed_work() uses system_wq, which is non-freezable, allowing
regulator_init_complete_work to run concurrently with system suspend. This
work fires ~30s after boot to disable unused regulators via I2C. When it
races with PM suspend, the I2C adapter may already be suspended, triggering
a -ESHUTDOWN warning dump.

[   33.707233] pc : __i2c_transfer+0x36c/0x3c8
[   33.707240] lr : __i2c_transfer+0x36c/0x3c8
[   33.707246] sp : ffff80008239ba50
[   33.707249] x29: ffff80008239ba50 x28: 0000000000000001 x27: 0000000000000000
[   33.707259] x26: 0000000000000000 x25: 0000000000000001 x24: ffff0000c025c0e0
[   33.707268] x23: 0000000000000000 x22: ffff0000c025c0e1 x21: 0000000000000001
[   33.707277] x20: ffff80008239bae8 x19: ffff0000c0f54880 x18: fffffffffffeb320
[   33.707287] x17: 000000040044ffff x16: 0000000000000000 x15: ffff800082086fd8
[   33.707296] x14: 0000000000000000 x13: 0a6465646e657073 x12: 757320656c696877
[   33.707305] x11: 0000000000000058 x10: 0000000000000018 x9 : ffff800082087060
[   33.707314] x8 : 0000000000057fa8 x7 : 000000000000027d x6 : 0000000000000000
[   33.707323] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 00000000ffffffff
[   33.707333] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000c0123480
[   33.707343] Call trace:
[   33.707346]  __i2c_transfer+0x36c/0x3c8 (P)
[   33.707356]  i2c_transfer+0x6c/0xf8
[   33.707364]  i2c_transfer_buffer_flags+0x5c/0xa0
[   33.707372]  regmap_i2c_write+0x20/0x60
[   33.707382]  _regmap_raw_write_impl+0x5cc/0x660
[   33.707389]  _regmap_bus_raw_write+0x60/0x80
[   33.707396]  _regmap_write+0x58/0xc0
[   33.707403]  _regmap_update_bits+0x11c/0x140
[   33.707409]  regmap_update_bits_base+0x54/0x80
[   33.707416]  regulator_disable_regmap+0x40/0x5c
[   33.707424]  _regulator_do_disable+0x94/0xbc
[   33.707435] CPU2 is up
[   33.707433]  regulator_late_cleanup+0xe0/0x1e8
[   33.707442]  class_for_each_device+0x104/0x13c
[   33.707450]  regulator_init_complete_work_function+0x54/0x80
[   33.707458]  process_one_work+0x150/0x290
[   33.707467]  worker_thread+0x180/0x2f4
[   33.707473]  kthread+0x12c/0x204
[   33.707484]  ret_from_fork+0x10/0x20
[   33.707493] ---[ end trace 0000000000000000 ]---

Switch to system_freezable_wq so the work is frozen before any device
is suspended, eliminating the race.

Fixes: 55576cf18537 ("regulator: Defer init completion for a while after late_initcall")
Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
---
 drivers/regulator/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 1797929dfe56..d5d24a940f31 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -27,6 +27,7 @@
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/module.h>
+#include <linux/workqueue.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/regulator.h>
@@ -6882,8 +6883,9 @@ static int __init regulator_init_complete(void)
 	 * we'd only do this on systems that need it, and a kernel
 	 * command line option might be useful.
 	 */
-	schedule_delayed_work(&regulator_init_complete_work,
-			      msecs_to_jiffies(30000));
+	queue_delayed_work(system_freezable_wq,
+			   &regulator_init_complete_work,
+			   msecs_to_jiffies(30000));
 
 	return 0;
 }

-- 
2.34.1

